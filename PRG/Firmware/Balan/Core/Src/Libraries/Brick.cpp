#include "Ht16k33.hpp"
#include "Brick.hpp"
#include "SoftwareI2c.hpp"
#include <string.h>

#include "stm32f3xx_hal.h"

/************************************************************
 *  public
 ************************************************************/
Brick::Brick(SoftwareI2c *dev, uint8_t addr)
	: m_dev(dev),
	  m_addr(addr),
	  m_currentPatternId(0),
	  m_currentStepIndex(0)
{
}

Brick::~Brick()
{
}

void Brick::Config(uint8_t brightness)
{
	Ht16k33::Init(m_dev, m_addr);
	Ht16k33::SetBrightness(m_dev, m_addr, brightness);
	Update();
}

/************************************************************
 *  protected
 ************************************************************/
void Brick::TestPattern(int patternId, uint8_t stepInterval)
{
	// -- 1 ステップの場合 --
	//   Set()
	//   Update()
	//   Delay()
	//   IsLastStep() --> true
	//
	// -- 2 ステップの場合 --
	//   Set()
	//   Update()
	//   Delay()
	//   IsLastStep() --> false
	//
	//   Next()
	//   Update()
	//   Delay()
	//   IsLastStep() --> true
	//
	// -- 3 ステップの場合 --
	//   Set()
	//   Update()
	//   Delay()
	//   IsLastStep() --> false
	//
	//   Next()
	//   Update()
	//   Delay()
	//   IsLastStep() --> false
	//
	//   Next()
	//   Update()
	//   Delay()
	//   IsLastStep() --> true

	// 1 個目は特別
	Set(patternId);
	Update();
	HAL_Delay(stepInterval);
	if (IsLastStep()) {
		return;
	}

	// 2 個目以降は同様
	do {
		Next();
		Update();
		HAL_Delay(stepInterval);
	} while (!IsLastStep());
}
