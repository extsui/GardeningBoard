
#include "main.h"
#include "stm32f3xx_hal_uart.h"

#include "Console.hpp"
#include "SoftwareI2c.hpp"

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

	// MEMO: SoftwareI2c lowerI2c;

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
				commandBuffer[commandBufferIndex] = '\0';
				commandBufferIndex++;

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
	Log("[%s]\n", command);
}
