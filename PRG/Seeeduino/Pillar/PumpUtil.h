#ifndef PUMP_UTIL_H
#define PUMP_UTIL_H

#include "PumpConfig.h"

#include <stdint.h>

class PumpUtil
{
public:
    static int ToHex(uint8_t *outValue, char hi, char lo);
    static int ParseRawSendCommand(const char *command, uint8_t *array, int arrayLength);
    static int GetDigitLength(uint8_t value);

#if CONFIG_M5
    static int WireTransaction(const uint8_t *data, int length);
#endif
};

#endif /* PUMP_UTIL_H */
