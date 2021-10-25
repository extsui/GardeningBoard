#include <SD.h>
#include "Utils.h"
#include "Idle.h"

void IdleState::OnEnter()
{
    g_U8g2.clearBuffer();
}

PillarMode IdleState::OnExecute()
{
    if (g_UserButton.WasPressed()) {
        return PillarMode::BadApple;
    }
    return PillarMode::Idle;
}

void IdleState::OnExit()
{
    // NOP
}
