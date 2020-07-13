#ifndef TREE_HPP
#define TREE_HPP

#include "Brick.hpp"
#include "SoftwareI2c.hpp"

#define TREE_LED_NUM   (19)

/** 草の点灯パターン */
typedef enum {
  TREE_PATTERN_ALL_ON = 0,                  /**< 全点灯 */
  TREE_PATTERN_ALL_OFF,                     /**< 全消灯 */
  TREE_PATTERN_ONE_BY_ONE,                  /**< 1個ずつ */
  TREE_PATTERN_TOP_TO_BOTTOM_HORIZONTAL_1,  /**< 上から下へ(1行) */
  TREE_PATTERN_TOP_TO_BOTTOM_HORIZONTAL_3,  /**< 上から下へ(3行) */
  TREE_PATTERN_TOP_TO_BOTTOM_BUFFER,        /**< 上から下へ(バッファ) */
  TREE_PATTERN_UPPER_LEFT_TO_RIGHT,         /**< 左上から右へ */
  TREE_PATTERN_UPPER_RIGHT_TO_LEFT,         /**< 右上から左へ */
  TREE_PATTERN_LOWER_LEFT_TO_RIGHT,         /**< 左下から右へ */
  TREE_PATTERN_LOWER_RIGHT_TO_LEFT,         /**< 右下から左へ */
  TREE_PATTERN_CANDLE,                      /**< 蝋燭 */
  TREE_PATTERN_NUM,
} TreePattern;

class Tree : public Brick
{
public:
	Tree(SoftwareI2c *dev, uint8_t addr);
	~Tree();
	int Set(int patternId);
	void Next();
	void Update();
	bool IsLastStep();
	void Test(uint8_t stepInterval);

private:
	void Make(uint8_t *outData, int length);
};

#endif /* TREE_HPP */
