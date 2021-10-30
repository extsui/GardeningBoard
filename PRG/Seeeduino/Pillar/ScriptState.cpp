#include "Utils.h"
#include "ScriptState.h"

void ScriptState::OnEnter(PillarInput *pInput, PillarOutput *pOutput)
{
    UNUSED(pInput);

    pOutput->pU8g2->drawStr(0, PillarOutput::FontHeight * 1, "== Script Mode ==");
    pOutput->pU8g2->sendBuffer();
}

PillarMode ScriptState::OnExecute(PillarInput *pInput, PillarOutput *pOutput)
{
    UNUSED(pOutput);

    if (pInput->pUserButton->WasDoubleClicked()) {
        return PillarMode::Idle;
    }
    return PillarMode::Script;
}

void ScriptState::OnExit(PillarInput *pInput, PillarOutput *pOutput)
{
    UNUSED(pInput);
    
    pOutput->pU8g2->clearDisplay();
}
