#ifndef I2C_SLAVE_DRIVER_HPP
#define I2C_SLAVE_DRIVER_HPP

#include <stdint.h>
#include <stm32f3xx.h>
#include "stm32f3xx_hal_i2c.h"

/**
 * 受信専用の I2C スレーブドライバ
 */
class I2cSlaveDriver {
public:
	constexpr static int FrameLengthMax = 8;

private:
	I2C_TypeDef *m_Dev;
	uint8_t m_OwnAddress;

	// 受信フレーム有りか
	bool m_HasFrame;

	// 受信したフレームの一時格納先
	uint8_t m_Frame[FrameLengthMax];

	// 受信バイト数
	int m_Count;

public:
	I2cSlaveDriver(uint8_t ownAddress);
	~I2cSlaveDriver();
	uint8_t GetSlaveAddress();
	void TryGetReceivedFrame(uint8_t *outBuffer, int *count);
	void EventHandler();
	void ErrorHandler();

private:
	// 受信フレームの初期化
	void ResetFrame();
};

#endif /* I2C_SLAVE_DRIVER_HPP */
