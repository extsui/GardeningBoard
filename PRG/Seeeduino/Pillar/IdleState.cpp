#include <SD.h>
#include "Utils.h"
#include "IdleState.h"

namespace {

// 次の画面更新時刻
static uint32_t g_NextUpdateTime = 0;

// 画面の更新周期 [ms]
static constexpr uint32_t DisplayUpdateIntervalMilliSeconds = 50;

}

void IdleState::OnEnter(PillarInput *pInput, PillarOutput *pOutput)
{
    UNUSED(pInput);

    pOutput->pU8g2->clearBuffer();
    pOutput->pU8g2->drawStr(0, PillarOutput::FontHeight * 1, "=== Idle Mode ===");
    pOutput->pU8g2->drawStr(0, PillarOutput::FontHeight * 4, "  (Run by DClick)");
    pOutput->pU8g2->sendBuffer();
}

PillarMode IdleState::OnExecute(PillarInput *pInput, PillarOutput *pOutput)
{
    UNUSED(pOutput);

    uint32_t now = millis();
    if (now > g_NextUpdateTime) {
        g_NextUpdateTime += DisplayUpdateIntervalMilliSeconds;

        auto brightnessLevel = pInput->pBrightnessVolume->GetLevelCorrectedCurveAtoB();
        auto brightnessValue = pInput->pBrightnessVolume->GetValueCorrectedCurveAtoB();
        auto volumeLevel = pInput->pAudioVolume->GetLevelCorrectedCurveAtoB();
        auto volumeValue = pInput->pAudioVolume->GetValueCorrectedCurveAtoB();

        // OLED に Volume の値を表示
        static char buffer[16];
        sprintf(buffer, "BRI: %2lu %4lu", brightnessLevel, brightnessValue);
        pOutput->pU8g2->drawStr(0, PillarOutput::FontHeight * 2, buffer);
        sprintf(buffer, "VOL: %2lu %4lu", volumeLevel, volumeValue);
        pOutput->pU8g2->drawStr(0, PillarOutput::FontHeight * 3, buffer);

        // クリックイベントを表示
        if (pInput->pUserButton->WasSingleClicked()) {
            LOG("Single Click\n");
            pOutput->pU8g2->drawStr(0, PillarOutput::FontHeight * 4, "S");
        } else if (pInput->pUserButton->WasLongClicked()) {
            LOG("Long Click\n");
            pOutput->pU8g2->drawStr(0, PillarOutput::FontHeight * 4, "L");
        } else {
            pOutput->pU8g2->drawStr(0, PillarOutput::FontHeight * 4, " ");
        }

        pOutput->pU8g2->sendBuffer();
    }

    if (pInput->pUserButton->WasDoubleClicked()) {
        LOG("Double Click\n");
        return PillarMode::BadApple;
    } else {
        return PillarMode::Idle;
    }
}

void IdleState::OnExit(PillarInput *pInput, PillarOutput *pOutput)
{
    UNUSED(pInput);

    pOutput->pU8g2->clearDisplay();
}
