#ifndef PUMP_UTIL_HPP
#define PUMP_UTIL_HPP

#include "PumpConfig.hpp"

#include <stdint.h>

class PumpUtil
{
public:
    static int ToHex(uint8_t *outValue, char hi, char lo);
    static int ParseRawSendCommand(const char *command, uint8_t *array, int arrayLength);
    static int ParseRawReceiveCommand(const char *command, uint8_t *array, int arrayLength, uint8_t *pOutReceiveCount);
    static int GetDigitLength(uint8_t value);

#if CONFIG_M5
    static int WriteTransaction(const uint8_t *data, int length);
    static int ReceiveTransaction(const uint8_t *data, int length, uint8_t receiveCount, uint8_t *pOutReceiveData);
#endif
};

#endif /* PUMP_UTIL_HPP */
