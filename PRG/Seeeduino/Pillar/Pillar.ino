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
constexpr int PinNumberAudioVolume = 0; // XIAO 拡張ボードの GROVE A0 互換
constexpr int PinNumberBrightnessVolume = 3;
Volume g_AudioVolume;
Volume g_BrightnessVolume;

// RC フィルタ比率 (1~99)
constexpr int LowPassFilterRate = 80;
RcFilter g_AudioVolumeFilter(LowPassFilterRate);
RcFilter g_BrightnessVolumeFilter(LowPassFilterRate);

// DFPlayerMini の音量の値域 (0~30)
constexpr uint32_t AudioVolumeLevel = 31;
// GardeningBoard の輝度の値域 (0~15)
constexpr uint32_t BrightnessVolumeLevel = 16;

////////////////////////////////////////////////////////////////////////////////
//  mp3 再生関連
////////////////////////////////////////////////////////////////////////////////
static DFRobotDFPlayerMini g_DfPlayer;

////////////////////////////////////////////////////////////////////////////////
//  グラフィック関連
////////////////////////////////////////////////////////////////////////////////

// TODO: OLED 関連のラッパーを用意する

// _SW_I2C ではなく _HW_I2C を使用すれば 400kHz 駆動になる
U8G2_SSD1306_128X64_NONAME_F_HW_I2C g_U8g2(
    U8G2_R0,
    SCL,            // clock
    SDA,            // data
    U8X8_PIN_NONE   // reset
);

}

namespace {

static PillarMode g_Mode = PillarMode::Script;

static IdleState g_IdleState;
static BadAppleState g_BadAppleState;
static ScriptState g_ScriptState;

static IPillarState *g_pState[] = {
    &g_IdleState,
    &g_BadAppleState,
    &g_ScriptState,
};

static PillarInput *g_pInput;
static PillarOutput *g_pOutput;

}

////////////////////////////////////////////////////////////////////////////////
//  Arduino エントリポイント系
////////////////////////////////////////////////////////////////////////////////
void setup(void)
{
    bool hasError = false;

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
    g_U8g2.setFont(u8g2_font_7x14B_mf);
    //g_U8g2.setFont(u8g2_font_8x13B_mf); // 参考

    // 描画の Y 座標は文字の左上ではなく左下基準であることに注意。
    g_U8g2.drawStr(0, PillarOutput::FontHeight * 1, "Pillar Booting...");
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
    LOG("Build: %s %s\n", __DATE__, __TIME__);
    LOG("USB-CDC Initialized.\n");

    if (SD.begin(2)) {
        LOG("SD Initialized.\n");
    } else {
        LOG("[ERR] SD Failed.\n");
        g_U8g2.drawStr(0, PillarOutput::FontHeight * 2, "[ERR] SD Failed.");
        g_U8g2.sendBuffer();
        hasError = true;
    }

    g_UserButton.Initialize(PinNumberUserSwitch, false, true);
    LOG("Button Initialized.\n");

    g_AudioVolume.Initialize(PinNumberAudioVolume, &g_AudioVolumeFilter, AudioVolumeLevel);
    LOG("Audio Volume Initialized.\n");

    g_BrightnessVolume.Initialize(PinNumberBrightnessVolume, &g_BrightnessVolumeFilter, BrightnessVolumeLevel);
    LOG("Brightness Volume Initialized.\n");

    auto& groveUart = Serial1;
    groveUart.begin(9600, SERIAL_8N1);
    bool ack = g_DfPlayer.begin(groveUart, true, true);
    if (ack) {
        LOG("DFPlayerMini Initialized.\n");
    } else {
        LOG("DFPlayerMini Failed.\n");
        g_U8g2.drawStr(0, PillarOutput::FontHeight * 3, "[ERR] DFP Failed.");
        g_U8g2.sendBuffer();
        hasError = true;
    }

    static PillarInput input(&g_UserButton, &g_AudioVolume, &g_BrightnessVolume);
    static PillarOutput output(&g_DfPlayer, &g_U8g2);

    g_pInput = &input;
    g_pOutput = &output;

    LOG("Setup Done.\n");

    // 何かしらエラーが発生した場合は確認用に少し待つ
    if (hasError) {
        delay(3000);
    }

    // 重い処理実行中 (具体的には BadApple) だとメインループでの Update() 呼び出しが
    // 間に合わずダブルクリックを正しく認識できなくなるのでタイマ割り込みを使用する
    auto CyclicHandler = []()
    {
        g_pInput->pUserButton->Update();
    };
    TimerTc3.initialize(10 * 1000); // 10ms
    TimerTc3.attachInterrupt(CyclicHandler);

    // 初期状態だけはここで呼び出す必要がある
    g_pState[static_cast<int>(g_Mode)]->OnEnter(g_pInput, g_pOutput);
}

void loop(void)
{
    g_pInput->pAudioVolume->Update();
    g_pInput->pBrightnessVolume->Update();

    auto currentState = g_Mode;
    auto nextState = g_pState[static_cast<int>(currentState)]->OnExecute(g_pInput, g_pOutput);
    if (currentState != nextState) {
        g_pState[static_cast<int>(currentState)]->OnExit(g_pInput, g_pOutput);
        LOG("Mode %d -> %d\n", g_Mode, nextState);
        g_pState[static_cast<int>(nextState)]->OnEnter(g_pInput, g_pOutput);

        // OnExecute() 内で確認されていないイベントは残ったままになるので消す
        g_pInput->pUserButton->ClearEvents();
    }
    g_Mode = nextState;
}
