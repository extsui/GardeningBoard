#ifndef STEP_SCHEDULER_HPP
#define STEP_SCHEDULER_HPP

#include <stdint.h>
#include "Brick.hpp"

class StepScheduler
{
public:
	// パーツ個数
	constexpr static const int BrickNum = 8;

	StepScheduler();
    ~StepScheduler();
    
    int BeginPattern(uint32_t currentTick, uint8_t brickId, int patternId, uint8_t stepTiming, bool isRepeat);

    // TBD
    //int BeginPattern(uint32_t currentTick, uint8_t brickId, int patternId, const uint8_t stepTiming[], int stepTimingLength, bool isRepeat);

    void SetBrightnessAll(uint8_t brightness);
    void Process(uint32_t currentTick);

private:
    /** パーツスケジュールタイミング管理 */
    typedef struct {
    	Brick *brick;
    	uint8_t stepTiming;		// TODO: 配列化
    	int stepTimingLength;
    	int currentStepIndex;
    	bool isRepeat;
    	// 次に更新するタイミング (Tick 指定)
    	uint32_t nextStepTiming;
    } BrickSchedule;

    SoftwareI2c *m_dev;
    BrickSchedule m_scheduleList[BrickNum];
};

#endif /* STEP_SCHEDULER_HPP */
