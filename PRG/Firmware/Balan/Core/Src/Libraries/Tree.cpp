#include "Ht16k33.hpp"
#include "Tree.hpp"
#include "SoftwareI2c.hpp"
#include <string.h>

#include "stm32f3xx_hal.h"

/************************************************************
 *  点灯パターン定義
 ************************************************************/
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

static const uint8_t PATTERN_ALL_ON[][TREE_LED_NUM] = {
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  1, 1, 1, 1, 1, 1, 1, 1, 1, },
};

static const uint8_t PATTERN_ALL_OFF[][TREE_LED_NUM] = {
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

static const uint8_t PATTERN_ONE_BY_ONE[][TREE_LED_NUM] = {
  { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 1, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 1, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  1, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 1, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 1, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 1, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 1, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 1, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 1, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 1, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

static const uint8_t PATTERN_TOP_TO_BOTTOM_HORIZONTAL_1[][TREE_LED_NUM] = {
  { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 1, 1, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 1, 1, 1, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 1, 1, 1, 1,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  1, 1, 1, 1, 1, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 1, 1, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

static const uint8_t PATTERN_TOP_TO_BOTTOM_HORIZONTAL_3[][TREE_LED_NUM] = {
  { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 1, 1, 1, 1, 1, 1, 1,  1, 1, 1, 1, 1, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 1, 1, 1, 1,  1, 1, 1, 1, 1, 1, 1, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  1, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

static const uint8_t PATTERN_TOP_TO_BOTTOM_BUFFER[][TREE_LED_NUM] = {
  { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  1, 1, 1, 1, 1, 0, 0, 0, 0, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  1, 1, 1, 1, 1, 1, 1, 0, 0, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  1, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1,  1, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 1, 1, 1, 1, 1, 1, 1,  1, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 1, 1, 1, 1,  1, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  1, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

static const uint8_t PATTERN_UPPER_LEFT_TO_RIGHT[][TREE_LED_NUM] = {
  { 1, 1, 0, 1, 0, 0, 1, 0, 0, 0,  1, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 1, 0, 1, 0, 0, 1, 0, 0,  0, 1, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 1, 0, 0, 1, 0,  0, 0, 1, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,  0, 0, 0, 1, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 1, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

static const uint8_t PATTERN_UPPER_RIGHT_TO_LEFT[][TREE_LED_NUM] = {
  { 1, 0, 1, 0, 0, 1, 0, 0, 0, 1,  0, 0, 0, 0, 1, 0, 0, 0, 0, },
  { 0, 1, 0, 0, 1, 0, 0, 0, 1, 0,  0, 0, 0, 1, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 1, 0, 0, 0, 1, 0, 0,  0, 0, 1, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,  0, 1, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  1, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

static const uint8_t PATTERN_LOWER_LEFT_TO_RIGHT[][TREE_LED_NUM] = {
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 1, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,  0, 0, 0, 1, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 1, 0, 0, 1, 0,  0, 0, 1, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 1, 0, 1, 0, 0, 1, 0, 0,  0, 1, 0, 0, 0, 0, 0, 0, 0, },
  { 1, 1, 0, 1, 0, 0, 1, 0, 0, 0,  1, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

static const uint8_t PATTERN_LOWER_RIGHT_TO_LEFT[][TREE_LED_NUM] = {
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  1, 0, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,  0, 1, 0, 0, 0, 0, 0, 0, 0, },
  { 0, 0, 0, 1, 0, 0, 0, 1, 0, 0,  0, 0, 1, 0, 0, 0, 0, 0, 0, },
  { 0, 1, 0, 0, 1, 0, 0, 0, 1, 0,  0, 0, 0, 1, 0, 0, 0, 0, 0, },
  { 1, 0, 1, 0, 0, 1, 0, 0, 0, 1,  0, 0, 0, 0, 1, 0, 0, 0, 0, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

static const uint8_t PATTERN_CANDLE[][TREE_LED_NUM] = {
  // 赤(外周)
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  1, 0, 0, 0, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 1, 0, 0, 1,  1, 0, 0, 0, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 1, 0, 1, 1, 0, 0, 1,  1, 0, 0, 0, 1, 1, 1, 1, 1, },
  { 1, 1, 1, 1, 0, 1, 1, 0, 0, 1,  1, 0, 0, 0, 1, 1, 1, 1, 1, },
  // 黄(内周)
  { 1, 1, 1, 1, 0, 1, 1, 0, 0, 1,  1, 0, 1, 0, 1, 1, 1, 1, 1, },
  { 1, 1, 1, 1, 0, 1, 1, 1, 1, 1,  1, 0, 1, 0, 1, 1, 1, 1, 1, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  1, 1, 1, 1, 1, 1, 1, 1, 1, },

  { 1, 1, 1, 1, 0, 1, 1, 0, 0, 1,  1, 0, 1, 0, 1, 1, 1, 1, 1, },
  { 1, 1, 1, 1, 0, 1, 1, 1, 1, 1,  1, 0, 1, 0, 1, 1, 1, 1, 1, },
  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  1, 1, 1, 1, 1, 1, 1, 1, 1, },

  { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  1, 1, 1, 1, 1, 1, 1, 1, 1, },
  { 1, 1, 1, 1, 0, 1, 1, 1, 1, 1,  1, 0, 1, 0, 1, 1, 1, 1, 1, },
  { 1, 1, 1, 1, 0, 1, 1, 0, 0, 1,  1, 0, 1, 0, 1, 1, 1, 1, 1, },
  
  { 1, 1, 1, 1, 0, 1, 1, 0, 0, 1,  1, 0, 0, 0, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 1, 0, 1, 1, 0, 0, 1,  1, 0, 0, 0, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 1, 0, 0, 1,  1, 0, 0, 0, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  1, 0, 0, 0, 1, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 1, 1, 1, 1, },
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 1, 1, },
 
  { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, },
};

/************************************************************
 *  点灯パターン一覧
 ************************************************************/
typedef struct {
	const uint8_t (*pattern)[TREE_LED_NUM];
	int stepCount;
} TreePatternRecord;

static const TreePatternRecord TreePatternTable[] = {
	{ PATTERN_ALL_ON,                     1   },
	{ PATTERN_ALL_OFF,                    1   },
	{ PATTERN_ONE_BY_ONE,                 20  },
	{ PATTERN_TOP_TO_BOTTOM_HORIZONTAL_1, 8   },
	{ PATTERN_TOP_TO_BOTTOM_HORIZONTAL_3, 10  },
	{ PATTERN_TOP_TO_BOTTOM_BUFFER,       14  },
	{ PATTERN_UPPER_LEFT_TO_RIGHT,        6   },
	{ PATTERN_UPPER_RIGHT_TO_LEFT,        6   },
	{ PATTERN_LOWER_LEFT_TO_RIGHT,        6   },
	{ PATTERN_LOWER_RIGHT_TO_LEFT,        6   },
	{ PATTERN_CANDLE,                     22  },
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

int Tree::Set(int patternId)
{
	if (patternId >= TREE_PATTERN_NUM) {
		return -1;
	}
	
	m_currentPatternId = patternId;
	m_currentStepIndex = 0;
	return 0;
}

void Tree::Next(void)
{ 
	const int stepCount = TreePatternTable[m_currentPatternId].stepCount;
	m_currentStepIndex = (m_currentStepIndex + 1) % stepCount;
}

void Tree::Update()
{
	uint8_t data[TREE_LED_NUM/8 + 1];
	Make(data, sizeof(data));
	Ht16k33::SetData(m_dev, m_addr, data, sizeof(data));
}

bool Tree::IsLastStep()
{
	if (m_currentStepIndex == (TreePatternTable[m_currentPatternId].stepCount - 1)) {
		return true;
	} else {
		return false;
	}
}

void Tree::Test(uint8_t stepInterval)
{	
	TestPattern(TREE_PATTERN_ALL_ON, stepInterval);
	TestPattern(TREE_PATTERN_ALL_OFF, stepInterval);
	TestPattern(TREE_PATTERN_ONE_BY_ONE, stepInterval);
	TestPattern(TREE_PATTERN_TOP_TO_BOTTOM_HORIZONTAL_1, stepInterval);
	TestPattern(TREE_PATTERN_TOP_TO_BOTTOM_HORIZONTAL_3, stepInterval);
	TestPattern(TREE_PATTERN_TOP_TO_BOTTOM_BUFFER, stepInterval);
	TestPattern(TREE_PATTERN_UPPER_LEFT_TO_RIGHT, stepInterval);
	TestPattern(TREE_PATTERN_UPPER_RIGHT_TO_LEFT, stepInterval);
	TestPattern(TREE_PATTERN_LOWER_LEFT_TO_RIGHT, stepInterval);
	TestPattern(TREE_PATTERN_LOWER_RIGHT_TO_LEFT, stepInterval);
	TestPattern(TREE_PATTERN_CANDLE, stepInterval);
}

/************************************************************
 *  private
 ************************************************************/
void Tree::Make(uint8_t *outData, int length)
{
	const uint8_t (*pattern)[TREE_LED_NUM] = TreePatternTable[m_currentPatternId].pattern;
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
