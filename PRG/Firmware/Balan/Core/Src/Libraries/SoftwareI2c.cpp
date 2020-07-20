#include "SoftwareI2c.hpp"

#include "main.h"
#include "stm32f3xx_hal_gpio.h"

/************************************************************
 *  Defines
 ************************************************************/
// -----------------------
//   CLK   LOOP   周波数
// -----------------------
//  16MHz  None  約300kHz
//  16MHz  i=0   約200kHz
//  16MHz  i=1   約150kHz
//  16MHz  i=2   約120kHz
//  16MHz  i=3   約100kHz
// -----------------------
// ※参考: 16MHz・遅延無し・分岐無しでトグルさせた場合は 約500kHz
#define DELAY()		do { for (int i = 0; i < 3; i++); } while (0)

static inline void SCL_L()
{
	GPIOA->BRR = (uint32_t)I2C_LOWER_SCL_Pin;
}

static inline void SCL_H()
{
	GPIOA->BSRR = (uint32_t)I2C_LOWER_SCL_Pin;
}

static inline void SDA_L()
{
	GPIOA->BRR = (uint32_t)I2C_LOWER_SDA_Pin;
}

static inline void SDA_H()
{
	GPIOA->BSRR = (uint32_t)I2C_LOWER_SDA_Pin;
}

static inline bool IS_SDA_L()
{
	return ((GPIOA->IDR & I2C_LOWER_SDA_Pin) == 0);
}

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
	for (int i = 0; i < len; i++) {
		Write(buf[i]);
	}
}

bool SoftwareI2c::Write(uint8_t data)
{
	// 1
	SCL_L();
	DELAY();	// TODO: この DELAY() は不要かも。if 文処理時間が案外大きい。
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
	// ACK を検出できるように SDA ピンを H に固定して開放する
	// NACK の場合は H、ACK の場合は L が読み込める
	SDA_H();
	DELAY();
	SCL_H();
	DELAY();

	// 出力のままでもピンの電圧は読み込める
	bool ack = IS_SDA_L();

	// 10 (SCL 保持)
	SCL_L();
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
	while (1);
}
