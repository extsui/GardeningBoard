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

#define DELAY()

/************************************************************
 *  Public Functions
 ************************************************************/
SoftwareI2c::SoftwareI2c()
{
	SCL_H();
	SDA_H();
}

/**
  * 指定したアドレスでマスタ通信を開始する (Write 方向)
 * @param [in] addr 7 ビットアドレス
 */
void SoftwareI2c::BeginTransmission(uint8_t addr)
{
	StartCondition();
	Write((addr << 1) | I2C_ADDR_WRITE);
}

void SoftwareI2c::EndTransmission()
{
	StopCondition();
}

void SoftwareI2c::Write(uint8_t *buf, uint16_t len)
{
	int i;
	for (i = 0; i < len; i++) {
		Write(buf[i]);
	}
}

bool SoftwareI2c::Write(uint8_t data)
{
	// 1
	SCL_L();
	DELAY();
	if (data & 0x80) SDA_H(); else SDA_L();
	DELAY();
	SCL_H();
	DELAY();

	// 2
	SCL_L();
	DELAY();
	if (data & 0x40) SDA_H(); else SDA_L();
	DELAY();
	SCL_H();
	DELAY();

	// 3
	SCL_L();
	DELAY();
	if (data & 0x20) SDA_H(); else SDA_L();
	DELAY();
	SCL_H();
	DELAY();

	// 4
	SCL_L();
	DELAY();
	if (data & 0x10) SDA_H(); else SDA_L();
	DELAY();
	SCL_H();
	DELAY();

	// 5
	SCL_L();
	DELAY();
	if (data & 0x08) SDA_H(); else SDA_L();
	DELAY();
	SCL_H();
	DELAY();

	// 6
	SCL_L();
	DELAY();
	if (data & 0x04) SDA_H(); else SDA_L();
	DELAY();
	SCL_H();
	DELAY();

	// 7
	SCL_L();
	DELAY();
	if (data & 0x02) SDA_H(); else SDA_L();
	DELAY();
	SCL_H();
	DELAY();

	// 8
	SCL_L();
	DELAY();
	if (data & 0x01) SDA_H(); else SDA_L();
	DELAY();
	SCL_H();
	DELAY();

	// 9 (ACK)
	SCL_L();
	DELAY();

	SDA_H();

	// SDA ピンを入力に変更
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	GPIO_InitStruct.Pin = I2C_LOWER_SDA_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

	// 安定するまで少し待つ
	DELAY();

	GPIO_PinState pin = HAL_GPIO_ReadPin(I2C_LOWER_SDA_GPIO_Port, I2C_LOWER_SDA_Pin);
	bool ack = (pin == GPIO_PIN_RESET) ? true : false;

	SCL_H();
	DELAY();

	// SDA ピンを出力に戻したときに L-->H にされるとストップコンディションになるので SCL を L にしておく
	SCL_L();
	DELAY();

	// SDA ピンを出力に戻す
	GPIO_InitStruct.Pin = I2C_LOWER_SDA_Pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_OD;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

	DELAY();

	return ack;
}

bool SoftwareI2c::IsDeviceReady(uint8_t addr)
{
	StartCondition();
	bool isReady = Write((addr << 1) | I2C_ADDR_WRITE);
	StopCondition();
	return isReady;
}

/************************************************************
 *  Private Functions
 ************************************************************/
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
