#ifndef TILE_HPP
#define TILE_HPP

#include "Brick.hpp"
#include "SoftwareI2c.hpp"

#define TILE_LED_NUM   (24)

/** 床の点灯パターン */
typedef enum {
  TILE_PATTERN_ALL_ON = 0,                  /**< 全点灯 */
  TILE_PATTERN_ALL_OFF,                     /**< 全消灯 */
  TILE_PATTERN_ONE_BY_ONE,                  /**< 1個ずつ */
  TILE_PATTERN_STREAM,                      /**< 小川 */
  TILE_PATTERN_NUM,
} TilePattern;

class Tile : public Brick
{
public:
	Tile(SoftwareI2c *dev, uint8_t addr);
	~Tile();
	int Set(int patternId);
	void Next();
	void Update();
	bool IsLastStep();
	void Test(uint8_t stepInterval);

private:
	void Make(uint8_t *outData, int length);
};

#endif /* TILE_HPP */
