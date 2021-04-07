#ifndef STEP_SCHEDULER_HPP
#define STEP_SCHEDULER_HPP

#include <memory>
#include <stdint.h>
#include "Brick.hpp"

class StepScheduler
{
public:
	// パーツ個数
	constexpr static const int BrickNum = 8;

	StepScheduler();
    ~StepScheduler();
    
    int RegisterBrick(uint8_t brickId, BrickType type);
	int BeginPattern(uint32_t currentTick, uint8_t brickId, int patternId, uint8_t stepTiming, bool isRepeat);
    void SetBrightness(uint8_t brightness);
    int SetBrightness(uint8_t brickId, uint8_t brightness);
	int SetStepTiming(uint8_t brickId, uint8_t stepTiming);
    void Process(uint32_t currentTick);

private:
    /** パーツスケジュールタイミング管理 */
    typedef struct {
    	std::unique_ptr<Brick> brick;
    	uint8_t stepTiming;
    	int currentStepIndex;
    	bool isRepeat;
    	// 次に更新するタイミング (Tick 指定)
    	uint32_t nextStepTiming;
    } BrickSchedule;

    SoftwareI2c *m_dev;
    BrickSchedule m_scheduleList[BrickNum];
};

#endif /* STEP_SCHEDULER_HPP */
