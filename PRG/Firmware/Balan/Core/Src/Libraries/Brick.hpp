#ifndef BRICK_HPP
#define BRICK_HPP

#include <stdint.h>
#include "SoftwareI2c.hpp"

/**
 * 部品の種類
 */
enum class BrickType : uint8_t
{
	Grass = 0,
	Tree,
	House,
	Tile,

	// 種類数
	Count,
};

/**
 * 部品インタフェース
 * 
 * ガーデニングボードを構成する各種パーツ基板の基底クラス。
 * パーツの基本操作を定義する。
 */
class Brick
{
public:
	Brick(SoftwareI2c *dev, uint8_t addr);
	virtual ~Brick();
    /** 輝度設定(I2C通信有) */
    void SetBrightness(uint8_t brightness);
    /** パターン設定 */
	virtual int SetPattern(int patternId) = 0;
    /** 現在のパターンを進める */
    virtual void Next() = 0;
    /** 表示更新(I2C通信有) */
    virtual void Update() = 0;
    /** パターン内の最後のステップか */
    virtual bool IsLastStep() = 0;
    /** テスト */
    virtual void Test(uint8_t stepInterval) = 0;

protected:
    /** I2C デバイス */
	SoftwareI2c *m_dev;
	/** I2C アドレス */
	uint8_t m_addr;
	/** 現在のパターン ID */
	int m_currentPatternId;
	/** 現在のステップインデックス */
	int m_currentStepIndex;
    /** 指定されたパターン・周期でテスト点灯 */
    void TestPattern(int patternId, uint8_t stepInterval);
    /** 現在のステップデータの作成 */
    virtual void Make(uint8_t *outData, int length) = 0;
};

#endif /* BRICK_HPP */
