#ifndef SOFTWARE_I2C_H
#define SOFTWARE_I2C_H

#include <stdint.h>

class SoftwareI2c {
public:
    SoftwareI2c();
    ~SoftwareI2c() {};
    void StartCondition(void);
    void StopCondition(void);
    void RestartCondition(void);
    void Write(uint8_t *buf, uint16_t len);
    void Write(uint8_t data);

private:
};

#endif /* SOFTWARE_I2C_H */
