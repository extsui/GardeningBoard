#include "SoftwareI2c.hpp"

#include "main.h"
#include "stm32f3xx_hal_gpio.h"

/************************************************************
 *  Defines
 ************************************************************/
#define SCL_L()		HAL_GPIO_WritePin(I2C_LOWER_SCL_GPIO_Port, I2C_LOWER_SCL_Pin, GPIO_PIN_RESET)
#define SCL_H()		HAL_GPIO_WritePin(I2C_LOWER_SCL_GPIO_Port, I2C_LOWER_SCL_Pin, GPIO_PIN_SET)

#define SDA_L()		HAL_GPIO_WritePin(I2C_LOWER_SDA_GPIO_Port, I2C_LOWER_SDA_Pin, GPIO_PIN_RESET)
#define SDA_H()		HAL_GPIO_WritePin(I2C_LOWER_SDA_GPIO_Port, I2C_LOWER_SDA_Pin, GPIO_PIN_SET)

#define DELAY()		HAL_Delay(1)

/************************************************************
 *  Public Functions
 ************************************************************/
SoftwareI2c::SoftwareI2c()
{
	SCL_H();
	SDA_H();
}

void SoftwareI2c::StartCondition(void)
{
	SCL_H();
	SDA_H();
	DELAY();
	SDA_L();
}

void SoftwareI2c::StopCondition(void)
{
	SCL_H();
	SDA_L();
	DELAY();
	SDA_H();
}

void SoftwareI2c::RestartCondition(void)
{
	/* Not Implemented */
}

void SoftwareI2c::Write(uint8_t *buf, uint16_t len)
{
	int i;
	for (i = 0; i < len; i++) {
		Write(buf[i]);
	}
}

void SoftwareI2c::Write(uint8_t data)
{
	SCL_L();
	DELAY();
	if (data & 0x01) SDA_H(); else SDA_L();
	DELAY();
	SCL_H();
	DELAY();

	SCL_L();
	DELAY();
	if (data & 0x02) SDA_H(); else SDA_L();
	DELAY();
	SCL_H();
	DELAY();

	SCL_L();
	DELAY();
	if (data & 0x04) SDA_H(); else SDA_L();
	DELAY();
	SCL_H();
	DELAY();

	SCL_L();
	DELAY();
	if (data & 0x08) SDA_H(); else SDA_L();
	DELAY();
	SCL_H();
	DELAY();

	SCL_L();
	DELAY();
	if (data & 0x10) SDA_H(); else SDA_L();
	DELAY();
	SCL_H();
	DELAY();

	SCL_L();
	DELAY();
	if (data & 0x20) SDA_H(); else SDA_L();
	DELAY();
	SCL_H();
	DELAY();

	SCL_L();
	DELAY();
	if (data & 0x40) SDA_H(); else SDA_L();
	DELAY();
	SCL_H();
	DELAY();

	SCL_L();
	DELAY();
	if (data & 0x80) SDA_H(); else SDA_L();
	DELAY();
	SCL_H();
	DELAY();
}

/************************************************************
 *  Private Functions
 ************************************************************/
// None
