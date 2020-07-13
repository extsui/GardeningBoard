#ifndef GRASS_HPP
#define GRASS_HPP

#include "IBrick.hpp"
#include "SoftwareI2c.hpp"

#define GRASS_LED_NUM   (11)

/** 草の点灯パターン */
typedef enum {
  GRASS_PATTERN_ALL_ON = 0,             /**< 全点灯 */
  GRASS_PATTERN_ALL_OFF,                /**< 全消灯 */
  GRASS_PATTERN_LEFT_TO_RIGHT_1,        /**< 左から右へ(1個ずつ) */
  GRASS_PATTERN_RIGHT_TO_LEFT_1,        /**< 右から左へ(1個ずつ) */
  GRASS_PATTERN_LEFT_TO_RIGHT_3,        /**< 左から右へ(3個ずつ) */
  GRASS_PATTERN_RIGHT_TO_LEFT_3,        /**< 右から左へ(3個ずつ) */
  GRASS_PATTERN_BOTH_EDGE_TO_MIDDLE,    /**< 両端から真ん中へ */
  GRASS_PATTERN_VIBRATION,              /**< 交互の連続反転 */
  GRASS_PATTERN_LEFT_TO_RIGHT_BUFFER,   /**< 左から右へバッファ */
  GRASS_PATTERN_LEFT_TO_RIGHT_NEG,      /**< 左から右へ(反転) */
  GRASS_PATTERN_RIGHT_TO_LEFT_NEG,      /**< 右から左へ(反転) */
  GRASS_PATTERN_LEFT_TO_RIGHT_VERTICAL, /**< 左から右へ(縦) */
  GRASS_PATTERN_RIGHT_TO_LEFT_VERTICAL, /**< 右から左へ(縦) */
  GRASS_PATTERN_NUM,
} GrassPattern;

class Grass : public IBrick
{
public:
	Grass(SoftwareI2c *dev, uint8_t addr);
	~Grass();
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

#endif /* GRASS_HPP */
