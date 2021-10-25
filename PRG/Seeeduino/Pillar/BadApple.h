#ifndef BAD_APPLE_H
#define BAD_APPLE_H

#include "IPillarState.h"

class BadAppleState : public IPillarState
{
public:
    BadAppleState() {};
    void OnEnter() override;
    PillarMode OnExecute() override;
    void OnExit() override;
};

#endif /* BAD_APPLE_H */
