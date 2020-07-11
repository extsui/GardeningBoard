#ifndef IBRICK_HPP
#define IBRICK_HPP

/**
 * 部品インタフェース
 * 
 * ガーデニングボードを構成する各種パーツ基板の抽象クラス。
 * パーツの基本操作を定義する。
 */
class IBrick
{
public:
	IBrick() {};
	virtual ~IBrick() {};

    /** 輝度設定(I2C通信有) */
    virtual void Config(uint8_t brightness) = 0;
    /** パターン設定 */
	virtual int Set(int patternId) = 0;
    /** 現在のパターンを進める */
    virtual void Next() = 0;
    /** 表示更新(I2C通信有) */
    virtual void Update() = 0;
    /** パターン内の最後のステップか */
    virtual bool IsLastStep() = 0;
    /** テスト */
    virtual void Test(uint8_t stepInterval) = 0;
};

#endif /* IBRICK_HPP */
