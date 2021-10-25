#ifndef IPILLAR_STATE_H
#define IPILLAR_STATE_H

////////////////////////////////////////////////////////////////////////////////
//  全体の状態制御関連
////////////////////////////////////////////////////////////////////////////////
enum class PillarMode {
    Idle = 0,   // 待機中
    BadApple,   // BadApple 再生中
};

class IPillarState
{
public:
    virtual void OnEnter() = 0;
    virtual PillarMode OnExecute() = 0;
    virtual void OnExit() = 0;
};

#endif /* IPILLAR_STATE_H */
