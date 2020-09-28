#include <stdint.h>
#include <stm32f3xx.h>
#include "I2cSlaveDriver.hpp"

// >>> DEBUG (LOWER_SCL ピンを代用)
#include "main.h"
static inline void DEBUG_PIN_L()
{
    GPIOA->BRR = (uint32_t)I2C_LOWER_SCL_Pin;
}
static inline void DEBUG_PIN_H()
{
    GPIOA->BSRR = (uint32_t)I2C_LOWER_SCL_Pin;
}
// <<< DEBUG

// I2C スレーブアドレス (7ビット)
// TODO: 変更可能にする
constexpr uint8_t I2cSlaveAddr = 0x60;

void I2cSlaveDriver::Init()
{
	// --------------------------------------------------
	// I2C1 BSP の初期化 (HAL_I2C_MspInit() から流用)
	// --------------------------------------------------
	GPIO_InitTypeDef GPIO_InitStruct = {0};

	__HAL_RCC_GPIOB_CLK_ENABLE();
	// I2C1 GPIO Configuration
	// PB6 --> I2C1_SCL
	// PB7 --> I2C1_SDA
	GPIO_InitStruct.Pin = GPIO_PIN_6|GPIO_PIN_7;
	GPIO_InitStruct.Mode = GPIO_MODE_AF_OD;
	GPIO_InitStruct.Pull = GPIO_PULLUP;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	GPIO_InitStruct.Alternate = GPIO_AF4_I2C1;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

	// Peripheral clock enable
	__HAL_RCC_I2C1_CLK_ENABLE();

	// I2C1 interrupt Init
	HAL_NVIC_SetPriority(I2C1_EV_IRQn, 0, 0);
	HAL_NVIC_EnableIRQ(I2C1_EV_IRQn);
	HAL_NVIC_SetPriority(I2C1_ER_IRQn, 0, 0);
	HAL_NVIC_EnableIRQ(I2C1_ER_IRQn);

	// --------------------------------------------------
	// I2C1 ペリフェラルの初期化
	// --------------------------------------------------
    I2C_TypeDef *i2c = I2C1;

    // ペリフェラルの無効化 (各種設定は無効化中のみ設定可能)
    i2c->CR1     &= ~I2C_CR1_PE;
    i2c->CR1      = 0;
    i2c->CR2      = 0;
    i2c->OAR1     = 0;
    i2c->OAR2     = 0;
    i2c->TIMINGR  = 0;
    i2c->TIMEOUTR = 0;
    i2c->ICR      = 0;

    // 受信完了割り込み、アドレス一致割り込み、STOP 検出割り込み、エラー割り込み許可
    i2c->CR1  |= (I2C_CR1_RXIE | I2C_CR1_ADDRIE | I2C_CR1_STOPIE | I2C_CR1_ERRIE);

    // クロックストレッチ有
    i2c->CR1  &= ~I2C_CR1_NOSTRETCH;

    // 受信時に ACK 応答
    i2c->CR2  &= ~I2C_CR2_NACK;

    // Own Address 1 無効化時のみ設定可能
    i2c->OAR1 &= ~I2C_OAR1_OA1EN;
    i2c->OAR1 |= (I2C_OAR1_OA1EN | (I2cSlaveAddr << 1));

    // ペリフェラルの有効化
    i2c->CR1  |=  I2C_CR1_PE;
}

// 同期受信 (デバッグ用)
void I2cSlaveDriver::Receive()
{
	I2C_TypeDef *i2c = I2C1;

	// 割り込み禁止
	i2c->CR1 &= ~I2C_CR1_PE;
	i2c->CR1 &= ~(I2C_CR1_RXIE | I2C_CR1_ADDRIE | I2C_CR1_ERRIE);
	i2c->CR1 |=  I2C_CR1_PE;

	// アドレス一致待ち
	while ((i2c->ISR & I2C_ISR_ADDR) == 0) {}
	i2c->ICR |= I2C_ICR_ADDRCF;

	// 方向確認は省略

	// 受信完了待ち
	while ((i2c->ISR & I2C_ISR_RXNE) == 0) {}
	uint8_t data = i2c->RXDR;

	// STOP 待ち
	while ((i2c->ISR & I2C_ISR_STOPF) == 0) {}
	i2c->ICR |= I2C_ICR_STOPCF;

	ITM_SendChar(data);
}

/************************************************************
 *  割り込みハンドラ
 ************************************************************/
extern "C" void I2C1_EV_IRQHandler(void)
{
	I2C_TypeDef *i2c = I2C1;

	DEBUG_PIN_L();
	DEBUG_PIN_H();

	// アドレス一致
	if (i2c->ISR & I2C_ISR_ADDR) {
		i2c->ICR |= I2C_ICR_ADDRCF;
		ITM_SendChar('[');
	}

	// 受信完了
	if (i2c->ISR & I2C_ISR_RXNE) {
		uint8_t data = i2c->RXDR;
		ITM_SendChar((char)data);
	}

	// STOP 検出
	if (i2c->ISR & I2C_ISR_STOPF) {
		i2c->ICR |= I2C_ICR_STOPCF;
		ITM_SendChar(']');
	}

	DEBUG_PIN_L();
}

extern "C" void I2C1_ER_IRQHandler(void)
{
	I2C_TypeDef *i2c = I2C1;

	// オーバーラン/アンダーラン
	if (i2c->ISR & I2C_ISR_OVR) {
		i2c->ICR |= I2C_ICR_OVRCF;
	}
}
