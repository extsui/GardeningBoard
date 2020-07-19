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

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

/************************************************************
 *  Defines
 ************************************************************/
StepScheduler *stepScheduler = NULL;

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

	StartReceive();

	stepScheduler = new StepScheduler();

	Log("-- Gardening Board --\n> ");

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

void Console::ExecuteCommand(const uint8_t *command, uint32_t currentTick)
{
	if (strncmp((const char*)command, "test", 4) == 0) {
		Log("Test: Begin.\n");
		SoftwareI2c dev;

		Log("0x70\n");
		Brick *brick0 = new House(&dev, 0x70);
		brick0->SetBrightness(1);
		brick0->Test(10);
		delete brick0;

		Log("0x71\n");
		Brick *brick1 = new Grass(&dev, 0x71);
		brick1->SetBrightness(1);
		brick1->Test(10);
		delete brick1;

		Log("0x72\n");
		Brick *brick2 = new Grass(&dev, 0x72);
		brick2->SetBrightness(1);
		brick2->Test(10);
		delete brick2;

		Log("0x73\n");
		Brick *brick3 = new Tree(&dev, 0x73);
		brick3->SetBrightness(1);
		brick3->Test(10);
		delete brick3;

		Log("0x74\n");
		Brick *brick4 = new Tile(&dev, 0x74);
		brick4->SetBrightness(1);
		brick4->Test(10);
		delete brick4;

		Log("0x75\n");
		Brick *brick5 = new Tile(&dev, 0x75);
		brick5->SetBrightness(1);
		brick5->Test(10);
		delete brick5;

		Log("0x76\n");
		Brick *brick6 = new Tile(&dev, 0x76);
		brick6->SetBrightness(1);
		brick6->Test(10);
		delete brick6;

		Log("0x77\n");
		Brick *brick7 = new Tile(&dev, 0x77);
		brick7->SetBrightness(1);
		brick7->Test(10);
		delete brick7;

	} else if (strncmp((const char*)command, "addr", 4) == 0) {
		Log("I2C Address Check (0x70-0x77)\n");

		const int CheckCount = 1000;
		int ackCount[8] = { 0 };
		SoftwareI2c softwareI2c;

		for (int i = 0; i < CheckCount; i++) {
			for (uint8_t addr = 0x70; addr <= 0x77; addr++) {
				bool ack = softwareI2c.IsDeviceReady(addr);
				if (ack) {
					ackCount[addr - 0x70]++;
				}
			}
		}

		for (int i = 0; i < 8; i++) {
			Log("[0x%02x] %d\n", (0x70 + i), ackCount[i]);
		}

	} else if (strncmp((const char*)command, "0", 1) == 0) {
		stepScheduler->BeginPattern(currentTick, 2, GRASS_PATTERN_ALL_ON, 100, false);
		stepScheduler->BeginPattern(currentTick, 3, TREE_PATTERN_ALL_ON, 50, true);

	} else if (strncmp((const char*)command, "1", 1) == 0) {
		stepScheduler->BeginPattern(currentTick, 0, HOUSE_PATTERN_STREAM, 100, false);
		stepScheduler->BeginPattern(currentTick, 1, GRASS_PATTERN_BOTH_EDGE_TO_MIDDLE, 50, true);

	} else if (strncmp((const char*)command, "2", 1) == 0) {
		stepScheduler->BeginPattern(currentTick, 4, TILE_PATTERN_STREAM, 40, true);
		stepScheduler->BeginPattern(currentTick, 5, TILE_PATTERN_STREAM, 50, true);
		stepScheduler->BeginPattern(currentTick, 6, TILE_PATTERN_STREAM, 60, true);
		stepScheduler->BeginPattern(currentTick, 7, TILE_PATTERN_STREAM, 70, true);

	} else if (strncmp((const char*)command, "stop", 4) == 0) {
		for (int i = 0; i < StepScheduler::BrickNum; i++) {
			stepScheduler->BeginPattern(currentTick, i, GRASS_PATTERN_ALL_OFF, 0, false);
		}

	} else if (strncmp((const char*)command, "bright", 6) == 0) {
		// bright <brightness> : Set brightness level. (0-15)
		int params[1];
		int count = 0;
		count = GetParameter(&command[6], params, 1);
		if (count != 1) {
			Log("[Error] Bad parameter counts.\n");
		} else {
			uint8_t brightness = static_cast<uint8_t>(params[0]);
			if (brightness <= Ht16k33::BrightnessMax) {
				stepScheduler->SetBrightnessAll(brightness);
			} else {
				Log("[Error] Out of range. (%d)\n", brightness);
			}
		}

	} else if (strncmp((const char*)command, "", 1) == 0) {
		// 空改行は何も表示しない

	} else {
		Log("[Error] Command not found: \"%s\"\n", command);
	}

	Log("> ");
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
