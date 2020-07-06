#ifndef CONSOLE_HPP
#define CONSOLE_HPP

#include "stm32f3xx_hal_uart.h"

class Console {
public:
    static const int RECEIVE_BUFFER_SIZE = 64;
    static const int SEND_BUFFER_SIZE = 64;

    Console(UART_HandleTypeDef *uartHandle);
    ~Console();
    void Run(void);
    void Log(const char *fmt, ...);

private:
    uint8_t m_receiveBuffer[RECEIVE_BUFFER_SIZE];
    uint8_t m_sendBuffer[SEND_BUFFER_SIZE];

    UART_HandleTypeDef *m_uartHandle;
    uint16_t m_readPointer;

    void StartReceive();
    bool IsAvailable();
    uint8_t GetAvailableSize();
    uint8_t GetReceivedByte();

    void ExecuteCommand(const uint8_t *command);
};

#endif /* CONSOLE_HPP */
