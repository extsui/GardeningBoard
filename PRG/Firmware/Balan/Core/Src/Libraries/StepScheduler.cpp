#include "StepScheduler.hpp"
#include "Grass.hpp"
#include "Tree.hpp"
#include "House.hpp"
#include "Tile.hpp"
#include <string.h>

const struct {
	uint8_t addr;
	const char *name;
} setting[] = {
	{ 0x70, "House" },
	{ 0x71, "Grass" },
	{ 0x72, "Grass" },
	{ 0x73, "Tree"  },
	{ 0x74, "Tile"  },
	{ 0x75, "Tile"  },
	{ 0x76, "Tile"  },
	{ 0x77, "Tile"  },
};

StepScheduler::StepScheduler()
{
	m_dev = new SoftwareI2c();

	for (int i = 0; i < BrickNum; i++) {
		BrickSchedule *schedule = &m_scheduleList[i];

		if (strcmp(setting[i].name, "Grass") == 0) {
			schedule->brick = new Grass(m_dev, setting[i].addr);
		} else if (strcmp(setting[i].name, "Tree") == 0){
			schedule->brick = new Tree(m_dev, setting[i].addr);
		} else if (strcmp(setting[i].name, "House") == 0) {
			schedule->brick = new House(m_dev, setting[i].addr);
		} else if (strcmp(setting[i].name, "Tile") == 0) {
			schedule->brick = new Tile(m_dev, setting[i].addr);
		} else {
			// TODO: assert(0);
			while (1);
		}

		// パターン送信ですぐ光らせるために HT16K33 を初期化しておく
		schedule->brick->Set(1);	// OFF
		schedule->brick->Update();
		schedule->brick->Config(1);

		schedule->stepTiming = 0;	// TODO: 配列化
		schedule->stepTimingLength = 0;
		schedule->currentStepIndex = 0;
		schedule->isRepeat = false;
		schedule->nextStepTiming = 0;
	}
}

StepScheduler::~StepScheduler()
{
	// WORKAROUND:
	// delete が必要だがデストラクタが呼び出されることはないので実装無し
	while (1);
}

int StepScheduler::BeginPattern(uint32_t currentTick, uint8_t brickId, int patternId, uint8_t stepTiming, bool isRepeat)
{
	if (brickId >= BrickNum) {
		return -1;
	}

	BrickSchedule *schedule = &m_scheduleList[brickId];
	
	int result = schedule->brick->Set(patternId);
	if (result == -1) {
		return -1;
	}

	schedule->stepTiming = stepTiming;
	schedule->isRepeat = isRepeat;

	// 最初の更新をセットしておく
	schedule->brick->Update();

	if (schedule->brick->IsLastStep()) {
		// 1 ステップしかない場合は更新停止
		schedule->nextStepTiming = 0;
	} else {
		schedule->nextStepTiming = currentTick + schedule->stepTiming;
	}

	return 0;
}

/**
 * @brief パターンを開始する
 * @param [in] partsId   パーツ ID (0-7)
 * @param [in] patternId パターン ID
 * @param [in] stepTiming ステップタイミング配列
 * @param [in] stepTimingLength ステップタイミング配列の長さ
 * @retval 0:成功 / -1:失敗
 */
//int StepScheduler::BeginPattern(uint32_t currentTick, uint8_t brickId, uint8_t patternId, const uint8_t stepTiming[], int stepTimingLength, bool isRepeat)
//{
//}

void StepScheduler::Process(uint32_t currentTick)
{
	/*
	 * -----------+----------+-------------------------------
	 * IsLastStep | isRepeat | 処理
	 * -----------+----------+-------------------------------
	 * false      | false    | Next(), Update(), 時刻更新
	 * false      | true     | Next(), Update(), 時刻更新
	 * true       | false    | 更新停止 (nextStepTiming = 0)
	 * true       | true     | Next(), Update(), 時刻更新
	 * -----------+----------+-------------------------------
	 */
	for (int i = 0; i < BrickNum; i++) {
		BrickSchedule *schedule = &m_scheduleList[i];
		if ((schedule->nextStepTiming == 0) ||
			(schedule->nextStepTiming > currentTick)) {
			continue;
		}
		// 1 ステップしかないパターンの場合は更新停止しているので考慮不要
		// 更新タイミングになった場合
		if (schedule->brick->IsLastStep() && !schedule->isRepeat) {
			// 更新停止
			schedule->brick->Set(0);
			schedule->nextStepTiming = 0;
		} else {
			// Brick の各パターンは最終ステップで Next() した場合は最初のステップに自動で戻る
			// このため、スケジューラは停止以外は更新していくだけで良い
			schedule->brick->Next();
			schedule->brick->Update();
			schedule->nextStepTiming += schedule->stepTiming;
		}
	}
}
