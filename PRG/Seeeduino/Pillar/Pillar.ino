#include <Arduino.h>
#include <Wire.h>
#include <SPI.h>
#include <SD.h>

#include <U8g2lib.h>
#include <DFRobotDFPlayerMini.h>

#include <TimerTC3.h>

#include "IPillarState.h"
#include "IdleState.h"
#include "BadAppleState.h"
#include "ScriptState.h"

#include "PillarInput.h"
#include "PillarOutput.h"

#include "Utils.h"
#include "Button.h"
#include "Volume.h"

namespace {

////////////////////////////////////////////////////////////////////////////////
//  ピン関連
////////////////////////////////////////////////////////////////////////////////
// XIAO 拡張ボードのユーザスイッチ (負論理)
constexpr int PinNumberUserSwitch = 1;
Button g_UserButton;

////////////////////////////////////////////////////////////////////////////////
//  ボリューム関連
////////////////////////////////////////////////////////////////////////////////
// XIAO 拡張ボードの GROVE A0 互換
constexpr int PinNumberAudioVolume = 0;
Volume g_AudioVolume;

// RC フィルタ比率 (1~99)
constexpr int LowPassFilterRate = 80;
RcFilter g_AudioVolumeFilter(LowPassFilterRate);

// DFPlayerMini の音量の値域数 (0~30)
constexpr uint32_t AudioVolumeLevel = 31;

////////////////////////////////////////////////////////////////////////////////
//  mp3 再生関連
////////////////////////////////////////////////////////////////////////////////
static DFRobotDFPlayerMini g_DfPlayer;

////////////////////////////////////////////////////////////////////////////////
//  グラフィック関連
////////////////////////////////////////////////////////////////////////////////

// _SW_I2C ではなく _HW_I2C を使用すれば 400kHz 駆動になる
U8G2_SSD1306_128X64_NONAME_F_HW_I2C g_U8g2(
    U8G2_R0,
    SCL,            // clock
    SDA,            // data
    U8X8_PIN_NONE   // reset
);

}

namespace {

static PillarInput *g_pInput;
static PillarOutput *g_pOutput;

}

////////////////////////////////////////////////////////////////////////////////
//  Arduino エントリポイント系
////////////////////////////////////////////////////////////////////////////////
void setup(void)
{
    Serial.begin(115200);

    // OLED, USB 以外の要因でエラーになった場合に
    // OLED にエラーを表示させられるように優先して初期化
    g_U8g2.begin();
    g_U8g2.setDrawColor(1);
    g_U8g2.clearBuffer();
    g_U8g2.setBitmapMode(false);

    // フォント設定をする
    // 7x14B だと 4行17文字程度までしか表示できないことに注意。
    // m : 不透過
    // f : ASCII 全部
    constexpr size_t FontHeight = 14;
    g_U8g2.setFont(u8g2_font_7x14B_mf);
    // 描画の Y 座標は文字の左上ではなく左下基準であることに注意。
    g_U8g2.drawStr(0, FontHeight * 1, "== Pillar Start ==");
    g_U8g2.sendBuffer();

    // USB ポートが開くまで一定時間待機
    // USB-CDC 非搭載のものは常に true
    constexpr const uint32_t UsbSerialTimeoutMilliSeconds = 500;
    uint32_t start = millis();
    while (!Serial) {
        if (start + UsbSerialTimeoutMilliSeconds >= millis()) {
            break;
        }
    }
    LOG("USB-CDC Initialized.\n");

    if (SD.begin(2)) {
        LOG("SD Initialized.\n");
    } else {
        LOG("[ERR] SD Failed.\n");
        g_U8g2.drawStr(0, FontHeight * 2, "[ERR] SD Failed.");
        g_U8g2.sendBuffer();
    }

    g_UserButton.Initialize(PinNumberUserSwitch, false, true);
    LOG("Button Initialized.\n");

    g_AudioVolume.Initialize(PinNumberAudioVolume, &g_AudioVolumeFilter, AudioVolumeLevel);
    LOG("Volume Initialized.\n");

    auto& groveUart = Serial1;
    groveUart.begin(9600, SERIAL_8N1);
    bool ack = g_DfPlayer.begin(groveUart, true, true);
    if (ack) {
        LOG("DFPlayerMini Initialized.\n");
    } else {
        LOG("DFPlayerMini Failed.\n");
        g_U8g2.drawStr(0, FontHeight * 3, "[ERR] DFP Failed.");
        g_U8g2.sendBuffer();
    }

    static PillarInput input(&g_UserButton, &g_AudioVolume);
    static PillarOutput output(&g_DfPlayer, &g_U8g2);

    g_pInput = &input;
    g_pOutput = &output;

    LOG("Setup Done.\n");

    // 重い処理実行中 (具体的には BadApple) だとメインループでの Update() 呼び出しが
    // 間に合わずダブルクリックを正しく認識できなくなるのでタイマ割り込みを使用する
    auto CyclicHandler = []() 
    {
        g_pInput->pUserButton->Update();
    };
    TimerTc3.initialize(10 * 1000); // 10ms
    TimerTc3.attachInterrupt(CyclicHandler);
}

namespace {

static PillarMode g_Mode = PillarMode::Idle;

static IdleState g_IdleState;
static BadAppleState g_BadAppleState;
static ScriptState g_ScriptState;

static IPillarState *g_pState[] = {
    &g_IdleState,
    &g_BadAppleState,
    &g_ScriptState,
};

}

void loop(void)
{
    g_pInput->pAudioVolume->Update();

    auto currentState = g_Mode;
    auto nextState = g_pState[static_cast<int>(currentState)]->OnExecute(g_pInput, g_pOutput);
    if (currentState != nextState) {
        g_pState[static_cast<int>(currentState)]->OnExit(g_pInput, g_pOutput);
        LOG("Mode %d -> %d\n", g_Mode, nextState);
        g_pState[static_cast<int>(nextState)]->OnEnter(g_pInput, g_pOutput);
    }
    g_Mode = nextState;
}
