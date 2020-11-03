#ifndef HT16K33_HPP
#define HT16K33_HPP

#include <stdint.h>
#include "SoftwareI2c.hpp"

class Ht16k33 {
public:
	// ベースアドレス (Base + [ 0x00 : 0x07 ])
	static constexpr uint8_t BaseAddress = 0x70;

	// HT16K33 で規定されている輝度
	static constexpr uint8_t BrightnessMin = 0;
	static constexpr uint8_t BrightnessMax = 15;

    static int Init(SoftwareI2c *dev, uint8_t addr);
    static int SetBrightness(SoftwareI2c *dev, uint8_t addr, uint8_t brightness);
    static int SetData(SoftwareI2c *dev, uint8_t addr, const uint8_t data[], uint8_t length);
};

#endif /* HT16K33_HPP */
