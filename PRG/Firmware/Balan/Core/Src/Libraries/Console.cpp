#include "main.h"
#include "stm32f3xx_hal_uart.h"
#include "Balan.hpp"

#include "Console.hpp"

#include "Brick.hpp"
#include "Grass.hpp"
#include "Tree.hpp"
#include "House.hpp"
#include "Tile.hpp"

#include "StepScheduler.hpp"

#include "Ht16k33.hpp"

#include "I2cSlaveDriver.hpp"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

/************************************************************
 *  Defines
 ************************************************************/
// I2C スレーブアドレスのベース値 (下位 3 ビットは可変)
#define I2C_SLAVE_ADDRESS_BASE	(0x60)

StepScheduler *stepScheduler = NULL;
I2cSlaveDriver *i2cSlaveDriver = NULL;

/************************************************************
 *  Console 以外の機能 (小規模なので同ファイルに含める)
 ************************************************************/
/**
 * JP の値から I2C スレーブアドレスを決定し取得する
 * (複数一致確認すべきだが JP が変動するとは思えないので省略)
 */
uint8_t ReadI2cSlaveAddressFromJumper()
{
	// A0-2 は負論理 (開放が 1 で短絡が 0)
	// デフォルト (開放) を論理 0 とみなす
	uint8_t physicalA0 = HAL_GPIO_ReadPin(I2C_SLAVE_ADDR_A0_GPIO_Port, I2C_SLAVE_ADDR_A0_Pin);
	uint8_t physicalA1 = HAL_GPIO_ReadPin(I2C_SLAVE_ADDR_A1_GPIO_Port, I2C_SLAVE_ADDR_A1_Pin);
	uint8_t physicalA2 = HAL_GPIO_ReadPin(I2C_SLAVE_ADDR_A2_GPIO_Port, I2C_SLAVE_ADDR_A2_Pin);

	uint8_t logicalA0 = (physicalA0 == GPIO_PIN_SET) ? 0 : 1;
	uint8_t logicalA1 = (physicalA1 == GPIO_PIN_SET) ? 0 : 1;
	uint8_t logicalA2 = (physicalA2 == GPIO_PIN_SET) ? 0 : 1;

	uint8_t slaveAddress =
		I2C_SLAVE_ADDRESS_BASE |
		(logicalA2 << 2)       |
		(logicalA1 << 1)       |
		(logicalA0 << 0);

	return slaveAddress;
}

enum class PumpCommandType : uint8_t {
	Reset			= 0x00,
	RegisterType	= 0x01,
	SetPattern		= 0x02,
	SetBrightness	= 0x03,
	SetStepTiming   = 0x04,
};

// ポンプからの指令フレームの解析成功回数
static int g_PumpFrameSuccessCount = 0;

/**
 * Pump からの受信フレームを解析する
 * @return 0: 成功 / -1: フレーム不成立 / -2: コマンドタイプ不明 / -3: コマンドサイズ不正 / -4: コマンド内部エラー
 */
int AnalyzePumpFrame(const uint8_t *buffer, int count, uint32_t currentTick, StepScheduler *stepScheduler)
{
	if (count < 2) {
		return -1;
	}

	switch (static_cast<PumpCommandType>(buffer[1])) {
	case PumpCommandType::Reset:
		if (count != 2) {
			return -3;
		}
		HAL_NVIC_SystemReset();
		break;

	case PumpCommandType::RegisterType:
		if (count != 3) {
			return -3;
		}
		if (stepScheduler->RegisterBrick(buffer[0], static_cast<BrickType>(buffer[2])) != 0) {
			return -4;
		}
		break;

	case PumpCommandType::SetPattern:
		if (count != 5) {
			return -3;
		}
		if (stepScheduler->BeginPattern(currentTick, buffer[0], buffer[2], buffer[3], (buffer[4] != 0)) != 0) {
			return -4;
		}
		break;

	case PumpCommandType::SetBrightness:
		if (count != 3) {
			return -3;
		}
		if (stepScheduler->SetBrightness(buffer[0], buffer[2]) != 0) {
			return -4;
		}
		break;

	case PumpCommandType::SetStepTiming:
		if (count != 3) {
			return -3;
		}
		if (stepScheduler->SetStepTiming(buffer[0], buffer[2]) != 0) {
			return -4;
		}

	default:
		DEBUG_LOG("[pump] Unknown command!\n");
		return -2;
	}

	g_PumpFrameSuccessCount++;
	return 0;
}

/************************************************************
 *  Public Functions
 ************************************************************/
Console::Console(UART_HandleTypeDef *uartHandle)
{
	m_uartHandle = uartHandle;
}

Console::~Console()
{
	// 解放されないはず
	//abort();
}

void Console::Run(void)
{
	static uint8_t commandBuffer[80];
	int commandBufferIndex = 0;

	Log("-- Gardening Board --\n");

	StartReceive();

	stepScheduler = new StepScheduler();

	uint8_t ownAddress = ReadI2cSlaveAddressFromJumper();
	i2cSlaveDriver = new I2cSlaveDriver(ownAddress);

	Log("[i2c] OwnAddress : 0x%x (%d)\n", ownAddress, ownAddress);

	Log("> ");

	// コマンドループ
	while (1) {
		
		uint32_t currentTick = HAL_GetTick();

		// 1 ループで溜まった分だけ回収
		while (IsAvailable()) {
			uint8_t data = GetReceivedByte();

			commandBuffer[commandBufferIndex] = data;
			commandBufferIndex++;

			if (data == '\n') {
				// コマンド確定
				commandBuffer[commandBufferIndex - 1] = '\0';
			    ExecuteCommand(commandBuffer, currentTick);

			    memset(commandBuffer, 0, sizeof(commandBuffer));
			    commandBufferIndex = 0;

				Log("> ");
			}
		}

		// -- Pump 指令解析 --
		// BrickNum 回数分に達するかキューが空になるまで一括で処理
		// (1 回の指令で多くとも BrickNum 個しか来ないという想定)
		for (int i = 0; i < StepScheduler::BrickNum; i++) {
			I2cSlaveDriver::Frame frame;
			i2cSlaveDriver->TryGetReceivedFrame(frame);
			if (frame.Count == 0) {
				break;
			}
			int result = AnalyzePumpFrame(frame.Buffer, frame.Count, currentTick, stepScheduler);
			if (result < 0) {
				DEBUG_LOG("[pump] result: %d, count: %d, frame: [ ", result, frame.Count);
				for (int i = 0; i < frame.Count; i++) {
					DEBUG_LOG("0x%02X ", frame.Buffer[i]);
				}
				DEBUG_LOG("]\n");
			}
		}

		stepScheduler->Process(currentTick);
	}
}

void Console::Log(const char *fmt, ...)
{
	va_list ap;
	va_start(ap, fmt);
	vsprintf((char*)m_sendBuffer, fmt, ap);
	va_end(ap);

	uint8_t *p = m_sendBuffer;
	while (*p != '\0') {
		HAL_UART_Transmit(m_uartHandle, (uint8_t*)p, 1, 0xFFFF);
		p++;
	}
}

/************************************************************
 *  Private Functions
 ************************************************************/
#define DMA_WRITE_PTR ( (RECEIVE_BUFFER_SIZE - m_uartHandle->hdmarx->Instance->CNDTR) & (RECEIVE_BUFFER_SIZE - 1) )

void Console::StartReceive()
{
    HAL_UART_Receive_DMA(m_uartHandle, m_receiveBuffer, RECEIVE_BUFFER_SIZE);
    m_readPointer = 0;
}

bool Console::IsAvailable()
{
	if (m_readPointer == DMA_WRITE_PTR) {
		return false;
	}
	return true;
}

uint8_t Console::GetAvailableSize()
{
	return ((DMA_WRITE_PTR - m_readPointer + RECEIVE_BUFFER_SIZE) & (RECEIVE_BUFFER_SIZE - 1));
}

uint8_t Console::GetReceivedByte()
{
    uint8_t c = 0;
    if (m_readPointer != DMA_WRITE_PTR) {
        c = m_receiveBuffer[m_readPointer++];
        m_readPointer &= (RECEIVE_BUFFER_SIZE - 1);
    }
    return c;
}

/************************************************************/

void Console::ExecuteCommand(const uint8_t *command, uint32_t currentTick)
{
	if (strncmp((const char*)command, "addr", 5) == 0) {
		Log("I2C Address Check\n");

		const int CheckCount = 10000;
		int ackCount[StepScheduler::BrickNum] = { 0 };
		SoftwareI2c softwareI2c;

		for (int i = 0; i < CheckCount; i++) {
			for (int j = 0; j < StepScheduler::BrickNum; j++) {
				bool ack = softwareI2c.IsDeviceReady(Ht16k33::BaseAddress + j);
				if (ack) {
					ackCount[j]++;
				}
			}
			if (i % (CheckCount / 10) == 0) {
				Log(".");
			}
		}
		Log("\nDone.\nResult:\n");
		for (int i = 0; i < 8; i++) {
			Log("  [0x%02x] %d\n", (Ht16k33::BaseAddress + i), ackCount[i]);
		}

	} else if (strncmp((const char*)command, "reset", 6) == 0) {
		DEBUG_LOG("Reset\n");
		Log("Reset\n");
		HAL_NVIC_SystemReset();

	} else if (strncmp((const char*)command, "register", 8) == 0) {
		// register <brick-id> <brick-type>
		int params[2];
		int count = GetParameter(&command[8], params, 2);
		if (count == 2) {
			uint8_t brickId = static_cast<uint8_t>(params[0]);
			BrickType type  = static_cast<BrickType>(params[1]);
			stepScheduler->RegisterBrick(brickId, type);
		} else {
			Log("[Error] Bad parameter counts.\n");
		}

	} else if (strncmp((const char*)command, "bright", 6) == 0) {
		// bright <brightness>            : Set all brightness level.
		// bright <brick-id> <brightness> : Set brightness level.
		//  - brick-id    : Brick Id. (0-7)
		//  - brightness  : Brightness level. (0-15:MAX)
		int params[2];
		int count = GetParameter(&command[6], params, 2);
		if (count == 1) {
			// 一括
			uint8_t brightness = static_cast<uint8_t>(params[0]);
			stepScheduler->SetBrightness(brightness);
		} else if (count == 2) {
			// 個別
			uint8_t brickId = static_cast<uint8_t>(params[0]);
			uint8_t brightness = static_cast<uint8_t>(params[1]);
			stepScheduler->SetBrightness(brickId, brightness);
		} else {
			// エラー
			Log("[Error] Bad parameter counts.\n");
		}

	} else if (strncmp((const char*)command, "pattern", 7) == 0) {
		// pattern <brick-id> <pattern-id> <step-timing> <is-repeat> : Set pattern.
		//  - brick-id    : Brick Id. (0-7)
		//  - pattern-id  : Pattern Id.
		//  - step-timing : Step timing. (unit: msec)
		//  - is-repeat   : Repeat On/Off.
		int params[4];
		int count = GetParameter(&command[7], params, 4);
		if (count != 4) {
			Log("[Error] Bad parameter counts.\n");
		} else {
			uint8_t brickId = static_cast<uint8_t>(params[0]);
			int patternId = params[1];
			uint8_t stepTiming = static_cast<uint8_t>(params[2]);
			bool isRepeat = (params[3] != 0) ? true : false;

			int result = stepScheduler->BeginPattern(currentTick, brickId, patternId, stepTiming, isRepeat);
			if (result != 0) {
				Log("[Error] Bad parameter. (%d, %d, %d, %d)\n", brickId, patternId, stepTiming, isRepeat);
			}
		}

	} else if (strncmp((const char*)command, "i2c-get-addr", 13) == 0) {
		uint8_t addr = i2cSlaveDriver->GetSlaveAddress();
		Log("I2C Slave Address : %d (0x%x)\n", addr, addr);

	} else if (strncmp((const char*)command, "i2c-recv-cnt", 13) == 0) {
		int receiveCount = i2cSlaveDriver->GetReceiveCount();
		Log("I2C Receive Count : %d\n", receiveCount);

	} else if (strncmp((const char*)command, "pump", 5) == 0) {
		Log("Pump Frame Success Count : %d\n", g_PumpFrameSuccessCount);

	} else if (strncmp((const char*)command, "jp", 3) == 0) {
		// JP2,3,4 (A0,1,2) の値を読み込む
		uint8_t a0 = HAL_GPIO_ReadPin(I2C_SLAVE_ADDR_A0_GPIO_Port, I2C_SLAVE_ADDR_A0_Pin);
		uint8_t a1 = HAL_GPIO_ReadPin(I2C_SLAVE_ADDR_A1_GPIO_Port, I2C_SLAVE_ADDR_A1_Pin);
		uint8_t a2 = HAL_GPIO_ReadPin(I2C_SLAVE_ADDR_A2_GPIO_Port, I2C_SLAVE_ADDR_A2_Pin);
		Log("JP2,3,4 (A0,1,2) = %d,%d,%d\n", a0, a1, a2);

	} else if (strncmp((const char*)command, "", 1) == 0) {
		// 空改行は何も表示しない

	} else {
		Log("[Error] Command not found: \"%s\"\n", command);
	}
}

/**
 * 文字列からのパラメータ取得
 *
 * 文字列 str から count 個のパラメータを解析して
 * 解析に成功した値を params[] に格納し個数を戻り値として返す。
 * パラメータはスペースで区切られているものとする。
 * count 個分の解析が終了するか、もしくは '\0' が来たら終了する。
 *
 * @param[in] str 入力文字列 (NULL でないこと)
 * @param[out] params 解析結果配列 (NULLでないこと)
 * @param[in] count 解析する個数 (0より大)
 * @return 解析できた個数
 * @note 解析可能な値は strtol() で基数 0 指定時のものに限る。
 * @note また、解析結果は int 型に丸められることに注意。
 * @note 引数の前提に記載した項目はチェックしない。
 */
int Console::GetParameter(const uint8_t *str, int params[], int count)
{
	ASSERT(str != NULL);
	ASSERT(params != NULL);
	ASSERT(count > 0);

	int analyzeCount = 0;
	char *startp = (char*)str;
	char *endp = NULL;
	long val = 0;

	do {
		val = strtol(startp, &endp, 0);
		// 1文字以上読めているなら何かしら解析できている
		if (startp != endp) {
			params[analyzeCount] = (int)val;
			analyzeCount++;
		// 何も解析できなかったけど文字列最後でもない
		} else if (val == 0) {
			break;
		}
		startp = endp;
	} while ((endp != NULL) && (analyzeCount < count));

	return analyzeCount;
}
