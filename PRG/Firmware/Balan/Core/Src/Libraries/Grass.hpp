#ifndef GRASS_HPP
#define GRASS_HPP

#include "Brick.hpp"
#include "SoftwareI2c.hpp"

class Grass : public Brick
{
public:
	Grass(SoftwareI2c *dev, uint8_t addr);
	~Grass();
	int SetPattern(int patternId);
	void Next();
	void Update();
	bool IsLastStep();

private:
	void Make(uint8_t *outData, int length);
};

#endif /* GRASS_HPP */
