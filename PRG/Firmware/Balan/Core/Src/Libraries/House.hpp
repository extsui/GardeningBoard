#ifndef HOUSE_HPP
#define HOUSE_HPP

#include "IBrick.hpp"
#include "SoftwareI2c.hpp"

#define HOUSE_LED_NUM   (27)

/** 家の点灯パターン */
typedef enum {
  HOUSE_PATTERN_ALL_ON = 0,                  /**< 全点灯 */
  HOUSE_PATTERN_ALL_OFF,                     /**< 全消灯 */
  HOUSE_PATTERN_ONE_BY_ONE,                  /**< 1個ずつ */
  HOUSE_PATTERN_STREAM,                      /**< 小川 */
  HOUSE_PATTERN_NUM,
} HousePattern;

class House : public IBrick
{
public:
	House(SoftwareI2c *dev, uint8_t addr);
	~House();
	void Config(uint8_t brightness);
	int Set(int patternId);
	void Next();
	void Update();
	bool IsLastStep();
	void Test(uint8_t stepInterval);

private:
	SoftwareI2c *m_dev;
	/** I2Cアドレス */
	uint8_t m_addr;
	/** 現在のパターンのインデックス */
	int m_currentPatternId;
	/** 現在のパターンのフレームのインデックス */
	int m_currentStepIndex;
	
	void Make(uint8_t *outData, int length);
	void TestPattern(int patternId, uint8_t stepInterval);
};

#endif /* HOUSE_HPP */
