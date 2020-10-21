#include "Balan.hpp"
#include "I2cSlaveDriver.hpp"

#include <string.h>

// 割り込みハンドラでコンテキストを共有するために必要 (事実上のシングルトン)
static I2cSlaveDriver *g_Instance = NULL;

/**
 * スレーブ受信割り込みロック
 */
class I2cSlaveLock
{
private:
	I2C_TypeDef *m_Dev;

public:
	// スレーブ受信割り込み禁止
	I2cSlaveLock(I2C_TypeDef *i2c) : m_Dev(i2c)
	{
		// 受信完了割り込み、アドレス一致割り込み、STOP 検出割り込み、エラー割り込み
		m_Dev->CR1 &= ~(I2C_CR1_RXIE | I2C_CR1_ADDRIE | I2C_CR1_STOPIE | I2C_CR1_ERRIE);
	}

	// スレーブ受信割り込み許可
	~I2cSlaveLock()
	{
		m_Dev->CR1 |=  (I2C_CR1_RXIE | I2C_CR1_ADDRIE | I2C_CR1_STOPIE | I2C_CR1_ERRIE);
	}
};

I2cSlaveDriver::I2cSlaveDriver(uint8_t ownAddress) :
	m_Dev(I2C1),
	m_OwnAddress(ownAddress)
{
	ASSERT((1 <= ownAddress) && (ownAddress <= 127));
	ASSERT(g_Instance == NULL);
	g_Instance = this;
	m_IntrFrame.Reset();
	m_ReceiveCount = 0;

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
	I2C_TypeDef *i2c = m_Dev;

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
	i2c->CR1 |=  (I2C_CR1_RXIE | I2C_CR1_ADDRIE | I2C_CR1_STOPIE | I2C_CR1_ERRIE);

	// クロックストレッチ無し
	// 参考: CPU 16MHz I2C 100kHz 受信、多重割り込み無しでストレッチ発生せずロス無し。
	// 何らかの不具合が発生して SCL をストレッチされる方がリスキーなのでストレッチ無とする。
	i2c->CR1  |=  I2C_CR1_NOSTRETCH;

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
 * 実際に H/W に設定されているアドレスを取得する (デバッグ用)
 */
uint8_t I2cSlaveDriver::GetSlaveAddress()
{
	return (m_Dev->OAR1 & I2C_OAR1_OA1) >> 1;
}

/**
 * 受信フレームがあれば取得する
 * @param [out] frame 受信フレームがある場合はフレーム本体が格納される。
 */
void I2cSlaveDriver::TryGetReceivedFrame(Frame& frame)
{
	// 以降はクリティカルセクション
	I2cSlaveLock lock(m_Dev);

	// 未受信
	if (m_Queue.empty()) {
		return;
	}

	// 取得
	frame = m_Queue.front();
	m_Queue.pop();
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
		m_IntrFrame.Reset();
	}

	// 受信完了
	if (i2c->ISR & I2C_ISR_RXNE) {
		// バッファオーバーランは警告を表示した上で受信継続
		// バッファオーバーラン時も RXNE を落とすためにレジスタリードは必要
		uint8_t data = i2c->RXDR;
		if (m_IntrFrame.Count < FrameLengthMax) {
			m_IntrFrame.Buffer[m_IntrFrame.Count] = data;
			m_IntrFrame.Count++;
		} else {
			DEBUG_LOG("[I2c1] Frame.Buffer Overrun!\n");
		}
	}

	// STOP 検出
	if (i2c->ISR & I2C_ISR_STOPF) {
		i2c->ICR |= I2C_ICR_STOPCF;
		m_Queue.push(m_IntrFrame);
		m_ReceiveCount++;
	}
}

void I2cSlaveDriver::ErrorHandler()
{
	I2C_TypeDef *i2c = m_Dev;

	// バスエラー
	if (i2c->ISR & I2C_ISR_BERR) {
		i2c->ICR |= I2C_ICR_BERRCF;
		m_IntrFrame.Reset();
		DEBUG_LOG("[I2c1] Bus Error!\n");
	}

	// オーバーラン/アンダーラン
	if (i2c->ISR & I2C_ISR_OVR) {
		i2c->ICR |= I2C_ICR_OVRCF;
		m_IntrFrame.Reset();
		DEBUG_LOG("[I2c1] Overrun!\n");
	}
}

extern "C" void I2C1_EV_IRQHandler(void)
{
	DEBUG_LED_ON();
	g_Instance->EventHandler();
	DEBUG_LED_OFF();
}

extern "C" void I2C1_ER_IRQHandler(void)
{
	DEBUG_LED_ON();
	g_Instance->ErrorHandler();
	DEBUG_LED_OFF();
}
