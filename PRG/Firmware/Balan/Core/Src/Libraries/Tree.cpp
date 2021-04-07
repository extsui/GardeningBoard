#include "Ht16k33.hpp"
#include "Tree.hpp"
#include "SoftwareI2c.hpp"
#include <string.h>

#include "stm32f3xx_hal.h"

/************************************************************
 *  点灯パターン定義
 ************************************************************/
#include "TreePattern.h"

/**
 * 木LED配置
 *
 * 物理配置が分かりにくいため変換テーブルを噛まして
 * 論理配置でパターンを指定できるようにする。
 *
 * ------------------------------
 * 論理配置(こちらを使用)
 * ------------------------------
 *           D1
 *
 *        D2    D3
 *
 *     D4    D5    D6
 *
 *   D7   D8    D9    D10
 *
 * D11  D12  D13   D14   D15
 *
 *       D16    D17
 *
 *       D18    D19
 * ------------------------------
 * 物理配置
 * ------------------------------
 *           D7
 *
 *       D10    D6
 *
 *     D11   D9    D5
 *
 *   D13  D12   D4    D3
 *
 * D15  D14  D8    D2    D1
 *
 *       D19    D17
 *
 *       D18    D16
 * ------------------------------
 */
static const uint8_t PHYSICAL_TO_LOGICAL_POS_TABLE[] = {
//D1  D2  D3  D4  D5  D6  D7  D8  D9  D10 (PHY)
  15, 14, 10, 9,  6,  3,  1,  13, 5,  2,
//D11 D12 D13 D14 D15 D16 D17 D18 D19 (PHY)
  4,  8,  7,  12, 11, 19, 17, 18, 16,
};

/************************************************************
 *  メソッド定義
 ************************************************************/
Tree::Tree(SoftwareI2c *dev, uint8_t addr) : Brick(dev, addr)
{
}

Tree::~Tree()
{
}

int Tree::SetPattern(int patternId)
{
	if (patternId >= Tree_PatternCount) {
		return -1;
	}
	
	m_currentPatternId = patternId;
	m_currentStepIndex = 0;
	return 0;
}

void Tree::Next(void)
{ 
	const int stepCount = Tree_PatternTable[m_currentPatternId].stepCount;
	m_currentStepIndex = (m_currentStepIndex + 1) % stepCount;
}

void Tree::Update()
{
	uint8_t data[Tree_LedCount/8 + 1];
	Make(data, sizeof(data));
	Ht16k33::SetData(m_dev, m_addr, data, sizeof(data));
}

bool Tree::IsLastStep()
{
	if (m_currentStepIndex == (Tree_PatternTable[m_currentPatternId].stepCount - 1)) {
		return true;
	} else {
		return false;
	}
}

/************************************************************
 *  private
 ************************************************************/
void Tree::Make(uint8_t *outData, int length)
{
	const uint8_t (*pattern)[Tree_LedCount] = Tree_PatternTable[m_currentPatternId].pattern;
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
	
	outData[2] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[15] - 1] == 1) ? 0x01 : 0);
	outData[2] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[16] - 1] == 1) ? 0x02 : 0);
	outData[2] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[17] - 1] == 1) ? 0x04 : 0);
	outData[2] |= ((stepData[PHYSICAL_TO_LOGICAL_POS_TABLE[18] - 1] == 1) ? 0x08 : 0);
}
