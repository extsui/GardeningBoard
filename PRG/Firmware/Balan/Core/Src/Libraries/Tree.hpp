#ifndef TREE_HPP
#define TREE_HPP

#include "Brick.hpp"
#include "SoftwareI2c.hpp"

class Tree : public Brick
{
public:
	Tree(SoftwareI2c *dev, uint8_t addr);
	~Tree();
	int SetPattern(int patternId);
	void Next();
	void Update();
	bool IsLastStep();

private:
	void Make(uint8_t *outData, int length);
};

#endif /* TREE_HPP */
