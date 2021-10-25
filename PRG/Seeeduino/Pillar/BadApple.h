#ifndef BAD_APPLE_H
#define BAD_APPLE_H

#include "IPillarState.h"

class BadAppleState : public IPillarState
{
public:
    BadAppleState() {};
    void OnEnter(PillarInput *pInput, PillarOutput *pOutput) override;
    PillarMode OnExecute(PillarInput *pInput, PillarOutput *pOutput) override;
    void OnExit(PillarInput *pInput, PillarOutput *pOutput) override;
};

#endif /* BAD_APPLE_H */
