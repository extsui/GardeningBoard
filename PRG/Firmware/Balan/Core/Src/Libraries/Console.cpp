#include "main.h"
#include "stm32f3xx_hal_uart.h"

#include "Console.hpp"

#include "Grass.hpp"
#include "Tree.hpp"
#include "House.hpp"
#include "Tile.hpp"

#include <stdio.h>
#include <string.h>
#include <stdarg.h>

/************************************************************
 *  Defines
 ************************************************************/


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

	// コマンドループ
	while (1) {
		// 1 ループで溜まった分だけ回収
		while (IsAvailable()) {
			uint8_t data = GetReceivedByte();

			commandBuffer[commandBufferIndex] = data;
			commandBufferIndex++;

			if (data == '\n') {
				// コマンド確定
				commandBuffer[commandBufferIndex - 1] = '\0';
			    ExecuteCommand(commandBuffer);

			    memset(commandBuffer, 0, sizeof(commandBuffer));
			    commandBufferIndex = 0;
			}
		}

		//HAL_Delay(1);
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

void Console::ExecuteCommand(const uint8_t *command)
{
	Log("Commnad: [%s]\n", command);

	if (strncmp((const char*)command, "test", 4) == 0) {
		Log("Test: Begin.\n");

		Log("0x70\n");
		House house(0x70);
		house.config(1);
		house.test();

		Log("0x71\n");
		Grass grass1(0x71);
		grass1.config(1);
		grass1.test();

		Log("0x72\n");
		Grass grass2(0x72);
		grass2.config(1);
		grass2.test();

		Log("0x73\n");
		Tree tree(0x73);
		tree.config(1);
		tree.test();

		Log("0x74\n");
		Tile tile1(0x74);
		tile1.config(1);
		tile1.test();

		Log("0x75\n");
		Tile tile2(0x75);
		tile2.config(1);
		tile2.test();

		Log("0x76\n");
		Tile tile3(0x76);
		tile3.config(1);
		tile3.test();

		Log("0x77\n");
		Tile tile4(0x77);
		tile4.config(1);
		tile4.test();
	}
}
