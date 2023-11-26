#include <Arduino.h>
#include <stdint.h>
#include "Ht16k33.h"
#include "MetaSegmentTable.h"

#include "Button.h"
#include "Building.h"
#include "Volume.h"
#include "Shell.h"
#include "Util.h"

namespace {
    
////////////////////////////////////////////////////////////////////////////////
//  ピン関連
////////////////////////////////////////////////////////////////////////////////
constexpr int PinNumberLeftButton = D8;
constexpr int PinNumberRightButton = D9;
Button g_LeftButton;
Button g_RightButton;

////////////////////////////////////////////////////////////////////////////////
//  ボリューム関連
////////////////////////////////////////////////////////////////////////////////
constexpr int PinNumberLeftVolume = A0;
constexpr int PinNumberRightVolume = A1;
Volume g_LeftVolume;
Volume g_RightVolume;

// RC フィルタ比率 (1~99)
constexpr int LowPassFilterRate = 80;
RcFilter g_LeftVolumeFilter(LowPassFilterRate);
RcFilter g_RightVolumeFilter(LowPassFilterRate);

constexpr uint32_t LeftVolumeLevel = 16; // 輝度調整向け
constexpr uint32_t RightVolumeLevel = 100;  // 範囲は適当

TwoWire& g_Wire = Wire;

}

constexpr uint8_t NumberSegmentTable[] =
{
    0xFC,   // 0
    0x60,   // 1
    0xDA,   // 2
    0xF2,   // 3
    0x66,   // 4
    0xB6,   // 5
    0xBE,   // 6
    0xE4,   // 7
    0xFE,   // 8
    0xF6,   // 9
    0xEE,   // A
    0x3E,   // b
    0x1A,   // c
    0x7A,   // d
    0x9E,   // E
    0x8E,   // F
};

Building g_Building;

void setup()
{
    g_Wire.begin(D10, D7, 400000);

    g_Building.Initialize(&g_Wire);
    g_Building.Clear();
    g_Building.Update();

    // USB ポートが開くまで一定時間待機
    // USB-CDC 非搭載のものは常に true
    Serial.begin(115200);
    constexpr uint32_t UsbSerialTimeoutMilliSeconds = 500;
    uint32_t start = millis();
    while (!Serial) {
        // TODO: 判定式が正しいか要確認
        if (start + UsbSerialTimeoutMilliSeconds < millis()) {
            break;
        }
    }
    LOG("Build: %s %s\n", __DATE__, __TIME__);
    LOG("Serial: Initialized.\n");

    g_LeftButton.Initialize(PinNumberLeftButton, false, false); // プルアップ抵抗が外付け
    g_RightButton.Initialize(PinNumberRightButton, false, true);
    LOG("Button: Initialized.\n");

    g_LeftVolume.Initialize(PinNumberLeftVolume, &g_LeftVolumeFilter, LeftVolumeLevel);
    g_RightVolume.Initialize(PinNumberRightVolume, &g_RightVolumeFilter, RightVolumeLevel);
    LOG("Volume: Initialized.\n");

    LOG("Building Startup!\n");
}

void loop()
{
    int currentTick = millis();

    // シリアル経由コマンド実行
    if (Serial.available()) {
        uint8_t data = Serial.read();
        ParseAndExecuteCommand(data);
    }

    g_LeftButton.Update();
    g_RightButton.Update();
    g_LeftVolume.Update();
    g_RightVolume.Update();

    static int s_NextUpdateTick = 1000; // TORIAEZU:
    if (currentTick + 500 < s_NextUpdateTick)
    {
        return;
    }
    s_NextUpdateTick += 500;

    // TODO: 輝度更新と数字更新の頻度は独立させるべき

    // 輝度更新はあまり高頻度では行わない
    uint32_t brightness = g_LeftVolume.GetLevel();
    g_Building.SetBrightness(brightness);

    static bool s_ReverseMode = false;
    if (g_LeftButton.WasSingleClicked()) {
        s_ReverseMode = !s_ReverseMode;
        LOG("Mode Changed! (--> Reverse=%d)\n", s_ReverseMode);
        g_LeftButton.ClearEvents();
    }

    static int s_Number = 0;
    s_Number++;
    if (s_Number >= 10) {
        s_Number = 0;
    }

    if (s_ReverseMode)
    {
        g_Building.Fill();
    }
    else
    {
        g_Building.Clear();
    }
    uint8_t numberPattern = NumberSegmentTable[s_Number];
    for (int metaSeg = 0; metaSeg < 8; metaSeg++)
    {
        if (numberPattern & (1 << (7 - metaSeg))) {
            for (int y = 0; y < Building::DigitY; y++)
            {
                for (int x = 0; x < Building::DigitX; x++)
                {
                    uint8_t pattern = MetaSegmentTable[metaSeg][y][x];

                    if (s_ReverseMode)
                    {
                        g_Building.AndPattern(x, y, pattern);
                    }
                    else
                    {
                        g_Building.OrPattern(x, y, pattern);
                    }
                }
            }
        }
    }
    g_Building.Update();
}
