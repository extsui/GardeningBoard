#ifndef IDLE_STATE_H
#define IDLE_STATE_H

#include "IPillarState.h"

class IdleState : public IPillarState
{
public:
    IdleState() {};
    void OnEnter(PillarInput *pInput, PillarOutput *pOutput) override;
    PillarMode OnExecute(PillarInput *pInput, PillarOutput *pOutput) override;
    void OnExit(PillarInput *pInput, PillarOutput *pOutput) override;
};

#endif /* IDLE_STATE_H */
