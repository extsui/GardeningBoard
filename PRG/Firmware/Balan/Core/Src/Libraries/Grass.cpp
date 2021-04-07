#include "Ht16k33.hpp"
#include "Grass.hpp"
#include "SoftwareI2c.hpp"
#include <string.h>

#include "stm32f3xx_hal.h"

/************************************************************
 *  点灯パターン一覧
 ************************************************************/
#include "GrassPattern.h"

/************************************************************
 *  public
 ************************************************************/
Grass::Grass(SoftwareI2c *dev, uint8_t addr) : Brick(dev, addr)
{
}

Grass::~Grass()
{
}

int Grass::SetPattern(int patternId)
{
	if (patternId >= Grass_PatternCount) {
		return -1;
	}

	m_currentPatternId = patternId;
	m_currentStepIndex = 0;
	return 0;
}

void Grass::Next(void)
{
	const int stepCount = Grass_PatternTable[m_currentPatternId].stepCount;

	// ループ可能にするためにフレーム数を超えたら先頭フレームに戻す
	m_currentStepIndex = (m_currentStepIndex + 1) % stepCount;
}

void Grass::Update()
{
	uint8_t data[Grass_LedCount/8 + 1];
	Make(data, sizeof(data));
	Ht16k33::SetData(m_dev, m_addr, data, sizeof(data));
}

bool Grass::IsLastStep()
{
	if (m_currentStepIndex == (Grass_PatternTable[m_currentPatternId].stepCount - 1)) {
		return true;
	} else {
		return false;
	}
}

/************************************************************
 *  private
 ************************************************************/
void Grass::Make(uint8_t *outData, int length)
{
	const uint8_t (*pattern)[Grass_LedCount] = Grass_PatternTable[m_currentPatternId].pattern;
	const uint8_t *stepData = pattern[m_currentStepIndex];
	memset(outData, 0, length);

	outData[0] |= ((stepData[0] == 1) ? 0x01 : 0);
	outData[0] |= ((stepData[1] == 1) ? 0x02 : 0);
	outData[0] |= ((stepData[2] == 1) ? 0x04 : 0);
	outData[0] |= ((stepData[3] == 1) ? 0x08 : 0);
	outData[0] |= ((stepData[4] == 1) ? 0x10 : 0);
	outData[0] |= ((stepData[5] == 1) ? 0x20 : 0);
	outData[0] |= ((stepData[6] == 1) ? 0x40 : 0);
	outData[0] |= ((stepData[7] == 1) ? 0x80 : 0);

	outData[1] |= ((stepData[8]  == 1) ? 0x01 : 0);
	outData[1] |= ((stepData[9]  == 1) ? 0x02 : 0);
	outData[1] |= ((stepData[10] == 1) ? 0x04 : 0);
}
