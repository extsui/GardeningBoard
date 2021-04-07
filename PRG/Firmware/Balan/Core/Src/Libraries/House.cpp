#include "Ht16k33.hpp"
#include "House.hpp"
#include "SoftwareI2c.hpp"
#include <string.h>

#include "stm32f3xx_hal.h"

/************************************************************
 *  点灯パターン定義
 ************************************************************/
#include "HousePattern.h"

/**
 * 家LED配置
 *
 * 物理配置が分かりにくいため変換テーブルを噛まして
 * 論理配置でパターンを指定できるようにする。
 *
 * ------------------------------------
 * 論理配置(こちらを使用)
 * ------------------------------------
 *     D1  D2  D3  D4  D5  D6  D7
 *
 * D8  D9  D10 D11 D12 D13 D14 D15 D16
 *
 *     D17   +-+   +-+  +-+    D18
 *           +-+   +-+  +-+
 *     D19                     D20
 *
 *     D21 D22 D23 D24 D25 D26 D27
 * ------------------------------------
 * 物理配置
 * ------------------------------------
 *     D2  D3  D4  D5  D6  D7  D8
 *
 * D1  D17 D18 D19 D20 D21 D22 D23 D24
 *
 *     D9    +-+   +-+  +-+    D16
 *           +-+   +-+  +-+
 *     D10                     D15
 *
 *     D11 D12 D25 D26 D27 D13 D14
 * ------------------------------------
 */
static const uint8_t PHYSICAL_TO_LOGICAL_POS_TABLE[] = {
//D1  D2  D3  D4  D5  D6  D7  D8  D9  D10 (PHY)
  8,  1,  2,  3,  4,  5,  6,  7,  17, 19,
//D11 D12 D13 D14 D15 D16 D17 D18 D19 D20 (PHY)
  21, 22, 26, 27, 20, 18, 9,  10, 11, 12,
//D21 D22 D23 D24 D25 D26 D27 (PHY)
  13, 14, 15, 16, 23, 24, 25,
};

/************************************************************
 *  private
 ************************************************************/
House::House(SoftwareI2c *dev, uint8_t addr) : Brick(dev, addr)
{
}

House::~House()
{
}

int House::SetPattern(int patternId)
{
	if (patternId >= House_PatternCount) {
		return -1;
	}
	
	m_currentPatternId = patternId;
	m_currentStepIndex = 0;
	return 0;
}

void House::Next(void)
{ 
	const int stepCount = House_PatternTable[m_currentPatternId].stepCount;
	m_currentStepIndex = (m_currentStepIndex + 1) % stepCount;
}

void House::Update()
{
	uint8_t data[House_LedCount/8 + 1];
	Make(data, sizeof(data));
	Ht16k33::SetData(m_dev, m_addr, data, sizeof(data));
}

bool House::IsLastStep()
{
	if (m_currentStepIndex == (House_PatternTable[m_currentPatternId].stepCount - 1)) {
		return true;
	} else {
		return false;
	}
}

/************************************************************
 *  private
 ************************************************************/
void House::Make(uint8_t *outData, int length)
{
	const uint8_t (*pattern)[House_LedCount] = House_PatternTable[m_currentPatternId].pattern;
	const uint8_t *stepData = pattern[m_currentStepIndex];
	memset(outData, 0, length);

	outData[0] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[0] - 1] == 1) ? 0x01 : 0);
	outData[0] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[1] - 1] == 1) ? 0x02 : 0);
	outData[0] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[2] - 1] == 1) ? 0x04 : 0);
	outData[0] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[3] - 1] == 1) ? 0x08 : 0);
	outData[0] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[4] - 1] == 1) ? 0x10 : 0);
	outData[0] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[5] - 1] == 1) ? 0x20 : 0);
	outData[0] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[6] - 1] == 1) ? 0x40 : 0);
	outData[0] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[7] - 1] == 1) ? 0x80 : 0);
	
	outData[1] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[8] - 1]  == 1) ? 0x01 : 0);
	outData[1] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[9] - 1]  == 1) ? 0x02 : 0);
	outData[1] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[10] - 1] == 1) ? 0x04 : 0);
	outData[1] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[11] - 1] == 1) ? 0x08 : 0);
	outData[1] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[12] - 1] == 1) ? 0x10 : 0);
	outData[1] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[13] - 1] == 1) ? 0x20 : 0);
	outData[1] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[14] - 1] == 1) ? 0x40 : 0);
	outData[1] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[15] - 1] == 1) ? 0x80 : 0);
	
	outData[2] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[16] - 1] == 1) ? 0x01 : 0);
	outData[2] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[17] - 1] == 1) ? 0x02 : 0);
	outData[2] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[18] - 1] == 1) ? 0x04 : 0);
	outData[2] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[19] - 1] == 1) ? 0x08 : 0);
	outData[2] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[20] - 1] == 1) ? 0x10 : 0);
	outData[2] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[21] - 1] == 1) ? 0x20 : 0);
	outData[2] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[22] - 1] == 1) ? 0x40 : 0);
	outData[2] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[23] - 1] == 1) ? 0x80 : 0);
	
	outData[3] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[24] - 1] == 1) ? 0x01 : 0);
	outData[3] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[25] - 1] == 1) ? 0x02 : 0);
	outData[3] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[26] - 1] == 1) ? 0x04 : 0);
	outData[3] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[27] - 1] == 1) ? 0x08 : 0);
}
