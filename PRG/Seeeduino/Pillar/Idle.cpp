#include <SD.h>
#include "Utils.h"
#include "Idle.h"

void IdleState::OnEnter(PillarInput *pInput, PillarOutput *pOutput)
{
    UNUSED(pInput);

    pOutput->pU8g2->clearBuffer();
}

PillarMode IdleState::OnExecute(PillarInput *pInput, PillarOutput *pOutput)
{
    UNUSED(pOutput);

    if (pInput->pUserButton->WasPressed()) {
        return PillarMode::BadApple;
    }
    return PillarMode::Idle;
}

void IdleState::OnExit(PillarInput *pInput, PillarOutput *pOutput)
{
    UNUSED(pInput);
    UNUSED(pOutput);
}
