#ifndef I2C_SLAVE_DRIVER_HPP
#define I2C_SLAVE_DRIVER_HPP

#include "stm32f3xx_hal_i2c.h"

class I2cSlaveDriver {
public:
    static void Init();
    static void Receive();
};

#endif /* I2C_SLAVE_DRIVER_HPP */
