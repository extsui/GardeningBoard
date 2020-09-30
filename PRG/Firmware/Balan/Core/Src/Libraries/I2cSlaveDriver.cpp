#include "Balan.hpp"
#include "I2cSlaveDriver.hpp"

#include <string.h>

// 割り込みハンドラでコンテキストを共有するために必要 (事実上のシングルトン)
static I2cSlaveDriver *g_Instance = NULL;

// スレーブ受信割り込み許可
// CR1_PE=1 の場合は書き換え不可なことに注意
static inline void SlaveInterruptEnable(I2C_TypeDef *i2c)
{
	// 受信完了割り込み、アドレス一致割り込み、STOP 検出割り込み、エラー割り込み許可
	i2c->CR1 |= (I2C_CR1_RXIE | I2C_CR1_ADDRIE | I2C_CR1_STOPIE | I2C_CR1_ERRIE);
}

// スレーブ受信割り込み禁止
// CR1_PE=1 の場合は書き換え不可なことに注意
static inline void SlaveInterruptDisable(I2C_TypeDef *i2c)
{
	i2c->CR1 &= ~(I2C_CR1_RXIE | I2C_CR1_ADDRIE | I2C_CR1_STOPIE | I2C_CR1_ERRIE);
}

I2cSlaveDriver::I2cSlaveDriver(uint8_t ownAddress) :
	m_Dev(I2C1),
	m_OwnAddress(ownAddress)
{
	ASSERT((1 <= ownAddress) && (ownAddress <= 127));
	ASSERT(g_Instance == NULL);
	g_Instance = this;

	ResetFrame();

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

	SlaveInterruptEnable(i2c);

	// クロックストレッチ有
	i2c->CR1  &= ~I2C_CR1_NOSTRETCH;

	// 受信時に ACK 応答
	i2c->CR2  &= ~I2C_CR2_NACK;

	// Own Address 1 無効化時のみ設定可能
	i2c->OAR1 &= ~I2C_OAR1_OA1EN;
	i2c->OAR1 |= (I2C_OAR1_OA1EN | (m_OwnAddress << 1));

	// ペリフェラルの有効化
	i2c->CR1  |=  I2C_CR1_PE;
}

I2cSlaveDriver::~I2cSlaveDriver()
{
	// 破棄禁止
	ASSERT(0);
}

/**
 * 受信フレームがあれば取得する
 *
 * @param [out] outBuffer 受信フレームがある場合はフレーム本体が格納される。
 * @param [out] count 受信フレームがある場合は受信バイト数が格納され、ない場合は 0 固定。
 */
void I2cSlaveDriver::TryGetReceivedFrame(uint8_t *outBuffer, int *count)
{
	ASSERT(outBuffer != NULL);
	ASSERT(count != NULL);

	// 割り込み禁止で操作
	SlaveInterruptDisable(m_Dev);

	do {
		// 未受信
		if (!m_HasFrame) {
			*count = 0;
			break;
		}

		// 受信完了してて 受信バイト数=0 は起こりえない
		ASSERT(m_Count >= 1);

		// 取得
		memcpy(outBuffer, m_Frame, m_Count);
		*count = m_Count;

		// 一度取得したら受信フレームはリセット
		ResetFrame();

	} while (0);

	SlaveInterruptEnable(m_Dev);
}

void I2cSlaveDriver::ResetFrame()
{
	m_HasFrame = false;
	memset(m_Frame, 0, FrameLengthMax);
	m_Count = 0;
}

/************************************************************
 *  割り込みハンドラ
 ************************************************************/
void I2cSlaveDriver::EventHandler()
{
	I2C_TypeDef *i2c = m_Dev;

	// アドレス一致
	if (i2c->ISR & I2C_ISR_ADDR) {
		i2c->ICR |= I2C_ICR_ADDRCF;
	}

	// 受信完了
	if (i2c->ISR & I2C_ISR_RXNE) {
		// 受信完了フレームの取得前に次の受信が始まったら警告を表示した上で受信継続
		if (m_HasFrame) {
			printf("[Warning] I2cSlave : Call TryGetReceivedFrame() before next receipt.\n");
			ResetFrame();
		}

		// バッファオーバーランは警告を表示した上で受信継続
		// バッファオーバーラン時も RXNE を落とすためにレジスタリードは必要
		uint8_t data = i2c->RXDR;
		if (m_Count < FrameLengthMax) {
			m_Frame[m_Count] = data;
			m_Count++;
		} else {
			printf("[Warning] I2cSlave : Buffer Overrun!\n");
		}
	}

	// STOP 検出
	if (i2c->ISR & I2C_ISR_STOPF) {
		i2c->ICR |= I2C_ICR_STOPCF;
		if (m_Count >= 1) {
			m_HasFrame = true;
		}
	}
}

void I2cSlaveDriver::ErrorHandler()
{
	I2C_TypeDef *i2c = m_Dev;

	// オーバーラン/アンダーラン
	if (i2c->ISR & I2C_ISR_OVR) {
		i2c->ICR |= I2C_ICR_OVRCF;
		printf("[Warning] I2C1_ER_IRQ was called.");
	}
}

extern "C" void I2C1_EV_IRQHandler(void)
{
	g_Instance->EventHandler();
}

extern "C" void I2C1_ER_IRQHandler(void)
{
	g_Instance->ErrorHandler();
}
