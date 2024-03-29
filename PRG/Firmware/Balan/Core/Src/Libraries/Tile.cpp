#include "Ht16k33.hpp"
#include "Tile.hpp"
#include "SoftwareI2c.hpp"
#include <string.h>

#include "stm32f3xx_hal.h"

/************************************************************
 *  点灯パターン定義
 ************************************************************/
#include "TilePattern.h"

/**
 * 床LED配置
 *
 * 物理配置が分かりにくいため変換テーブルを噛まして
 * 論理配置でパターンを指定できるようにする。
 *
 * ------------------------------------
 * 論理配置(こちらを使用)
 * ------------------------------------
 *         D_1 D_2 D_3 D_4
 *       D24             D_5
 *     D23                 D_6
 *   D22                     D_7
 * D21                         D_8
 *
 * D20                         D_9
 *   D19                     D10
 *     D18                 D11
 *       D17             D12
 *         D16 D15 D14 D13
 * ------------------------------------
 * 物理配置
 * ------------------------------------
 *         D14 D13 D12 D11
 *       D15             D10
 *     D16                 D_9
 *   D_1                     D24
 * D17                         D_8
 *
 * D_2                         D23
 *   D18                     D_7
 *     D_3                 D22
 *       D19             D_6
 *         D_4 D20 D_5 D21
 * ------------------------------------
 */
static const uint8_t PHYSICAL_TO_LOGICAL_POS_TABLE[] = {
//  D1  D2  D3  D4  D5  D6  D7  D8  D9  D10 D11 D12 (PHY)
	22, 20, 18, 16, 14, 12, 10, 8,  6,  5,  4,  3,
//  D13 D14 D15 D16 D17 D18 D19 D20 D21 D22 D23 D24 (PHY)
	2,  1,  24, 23, 21, 19, 17, 15, 13, 11, 9,  7,
};

/************************************************************
 *  public
 ************************************************************/
Tile::Tile(SoftwareI2c *dev, uint8_t addr) : Brick(dev, addr)
{
}

Tile::~Tile()
{
}

int Tile::SetPattern(int patternId)
{
	if (patternId >= Tile_PatternCount) {
		return -1;
	}

	m_currentPatternId = patternId;
	m_currentStepIndex = 0;
	return 0;
}

void Tile::Next(void)
{
	const int stepCount = Tile_PatternTable[m_currentPatternId].stepCount;
	m_currentStepIndex = (m_currentStepIndex + 1) % stepCount;
}

void Tile::Update()
{
	uint8_t data[Tile_LedCount/8 + 1];
	Make(data, sizeof(data));
	Ht16k33::SetData(m_dev, m_addr, data, sizeof(data));
}

bool Tile::IsLastStep()
{
	if (m_currentStepIndex == (Tile_PatternTable[m_currentPatternId].stepCount - 1)) {
		return true;
	} else {
		return false;
	}
}

/************************************************************
 *  private
 ************************************************************/
void Tile::Make(uint8_t *outData, int length)
{
	const uint8_t (*pattern)[Tile_LedCount] = Tile_PatternTable[m_currentPatternId].pattern;
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
}
