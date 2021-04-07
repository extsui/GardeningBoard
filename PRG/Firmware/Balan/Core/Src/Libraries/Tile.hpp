#ifndef TILE_HPP
#define TILE_HPP

#include "Brick.hpp"
#include "SoftwareI2c.hpp"

class Tile : public Brick
{
public:
	Tile(SoftwareI2c *dev, uint8_t addr);
	~Tile();
	int SetPattern(int patternId);
	void Next();
	void Update();
	bool IsLastStep();

private:
	void Make(uint8_t *outData, int length);
};

#endif /* TILE_HPP */
