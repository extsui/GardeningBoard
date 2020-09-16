#ifndef PUMP_UTIL_HPP
#define PUMP_UTIL_HPP

#include <stdint.h>

class PumpUtil
{
public:
    static int ToHex(uint8_t *outValue, char hi, char lo);
    static int ParseRawSendCommand(const char *command, uint8_t *array, int arrayLength);
};

#endif /* PUMP_UTIL_HPP */
