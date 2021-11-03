#ifndef SCRIPT_STATE_H
#define SCRIPT_STATE_H

#include "IPillarState.h"

class ScriptState : public IPillarState
{
public:
    ScriptState() {};
    void OnEnter(PillarInput *pInput, PillarOutput *pOutput) override;
    PillarMode OnExecute(PillarInput *pInput, PillarOutput *pOutput) override;
    void OnExit(PillarInput *pInput, PillarOutput *pOutput) override;
};

#endif /* SCRIPT_STATE_H */
