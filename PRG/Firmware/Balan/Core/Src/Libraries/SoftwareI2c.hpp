#ifndef SOFTWARE_I2C_H
#define SOFTWARE_I2C_H

#include <stdint.h>

class SoftwareI2c {
public:
    SoftwareI2c();
    ~SoftwareI2c() {};
    void BeginTransmission(uint8_t addr);
    void EndTransmission();
    void Write(uint8_t *buf, uint16_t len);
    void Write(uint8_t data);

private:
    enum : uint8_t {
    	I2C_ADDR_WRITE = 0x00,
    	I2C_ADDR_READ  = 0x01,
    };

    void StartCondition(void);
    void StopCondition(void);
    void RestartCondition(void);
};

#endif /* SOFTWARE_I2C_H */
