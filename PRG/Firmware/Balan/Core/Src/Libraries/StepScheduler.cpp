
#include "StepScheduler.hpp"
#include "Balan.hpp"

#include "Grass.hpp"
#include "Tree.hpp"
#include "House.hpp"
#include "Tile.hpp"

#include <string.h>
#include "Ht16k33.hpp"

StepScheduler::StepScheduler()
{
	m_dev = new SoftwareI2c();

	for (int i = 0; i < BrickNum; i++) {
		BrickSchedule *schedule = &m_scheduleList[i];

		// TODO: Flash に保存されている構成を読み込んで設定する
		// TORIAEZU: 現状は最も LED 数の多い House で仮設定
		schedule->brick = std::make_unique<House>(m_dev, i + Ht16k33::BaseAddress);

		// パターン送信ですぐ光らせるために HT16K33 を初期化しておく
		schedule->brick->SetPattern(1);	// OFF
		schedule->brick->Update();
		schedule->brick->SetBrightness(1);

		schedule->stepTiming = 0;
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

int StepScheduler::RegisterBrick(uint8_t brickId, BrickType type)
{
	if (brickId >= BrickNum) {
		return -1;
	}
	if (type >= BrickType::Count) {
		return -1;
	}

	// 明示的な解放は不要だがなるべく同じ領域を割り当てたいので先に解放
	BrickSchedule *schedule = &m_scheduleList[brickId];
	schedule->brick.reset();

	std::unique_ptr<Brick> brick;
	switch (type) {
	case BrickType::Grass:
		brick = std::make_unique<Grass>(m_dev, brickId + Ht16k33::BaseAddress);
		break;
	case BrickType::Tree:
		brick = std::make_unique<Tree>(m_dev, brickId + Ht16k33::BaseAddress);
		break;
	case BrickType::House:
		brick = std::make_unique<House>(m_dev, brickId + Ht16k33::BaseAddress);
		break;
	case BrickType::Tile:
		brick = std::make_unique<Tile>(m_dev, brickId + Ht16k33::BaseAddress);
		break;
	default:
		ASSERT(0);
		break;
	}

	schedule->brick = std::move(brick);
	return 0;
}

int StepScheduler::BeginPattern(uint32_t currentTick, uint8_t brickId, int patternId, uint8_t stepTiming, bool isRepeat)
{
	if (brickId >= BrickNum) {
		return -1;
	}

	BrickSchedule *schedule = &m_scheduleList[brickId];
	
	int result = schedule->brick->SetPattern(patternId);
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

void StepScheduler::SetBrightness(uint8_t brightness)
{
	for (int i = 0; i < BrickNum; i++) {
		SetBrightness(i, brightness);
	}
}

int StepScheduler::SetBrightness(uint8_t brickId, uint8_t brightness)
{
	if (brickId >= BrickNum) {
		return -1;
	}

	auto brick = m_scheduleList[brickId].brick.get();
	brick->SetBrightness(brightness);

	return 0;
}

int StepScheduler::SetStepTiming(uint8_t brickId, uint8_t stepTiming)
{
	if (brickId >= BrickNum) {
		return -1;
	}

	m_scheduleList[brickId].stepTiming = stepTiming;
	return 0;
}

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
			schedule->brick->SetPattern(0);
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
