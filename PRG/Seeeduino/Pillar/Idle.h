#ifndef IDLE_H
#define IDLE_H

#include "IPillarState.h"

class IdleState : public IPillarState
{
public:
    IdleState() {};
    void OnEnter() override;
    PillarMode OnExecute() override;
    void OnExit() override;
};

#endif /* IDLE_H */
