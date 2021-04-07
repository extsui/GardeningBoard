#ifndef HOUSE_HPP
#define HOUSE_HPP

#include "Brick.hpp"
#include "SoftwareI2c.hpp"

class House : public Brick
{
public:
	House(SoftwareI2c *dev, uint8_t addr);
	~House();
	int SetPattern(int patternId);
	void Next();
	void Update();
	bool IsLastStep();
	void Test(uint8_t stepInterval);

private:
	void Make(uint8_t *outData, int length);
};

#endif /* HOUSE_HPP */
