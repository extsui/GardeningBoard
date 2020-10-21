#ifndef I2C_SLAVE_DRIVER_HPP
#define I2C_SLAVE_DRIVER_HPP

#include <stdint.h>
#include <string.h>
#include <stm32f3xx.h>
#include "stm32f3xx_hal_i2c.h"

#include <queue>
#include <memory>

/**
 * 受信専用の I2C スレーブドライバ
 */
class I2cSlaveDriver {
public:
	constexpr static int FrameLengthMax = 8;

	/**
	 * フレーム
	 */
	class Frame {
	public:
	    int Count;
	    uint8_t Buffer[FrameLengthMax];
	    explicit Frame()
	    {
	    	Reset();
	    }
	    explicit Frame(const uint8_t *buffer, int count)
	    {
	        Count = count;
	        memcpy(Buffer, buffer, count);
	    }
	    explicit Frame(const Frame& frame) :
	    	Frame(frame.Buffer, frame.Count)
	    {
	    }
	    void Reset()
	    {
	    	Count = 0;
	    	memset(Buffer, 0, sizeof(Buffer));
	    }
	    ~Frame() {}
	};

private:
	I2C_TypeDef *m_Dev;
	uint8_t m_OwnAddress;
	std::queue<Frame> m_Queue;
	// 割り込み受信の保存に使用する一次フレーム
	Frame m_IntrFrame;
	// 受信回数 (デバッグ用)
	int m_ReceiveCount;

public:
	I2cSlaveDriver(uint8_t ownAddress);
	~I2cSlaveDriver();
	uint8_t GetSlaveAddress();
	void TryGetReceivedFrame(Frame& frame);
	void EventHandler();
	void ErrorHandler();

	// デバッグ用
	int GetQueueCount()
	{
		return m_Queue.size();
	}

	int GetReceiveCount()
	{
		return m_ReceiveCount;
	}
};

#endif /* I2C_SLAVE_DRIVER_HPP */
