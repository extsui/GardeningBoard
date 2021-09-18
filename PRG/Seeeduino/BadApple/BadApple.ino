#include <Arduino.h>
#include <Wire.h>
#include <U8g2lib.h>

#include <SPI.h>
#include <SD.h>

#include "Utils.h"
#include "Button.h"
#include "Volume.h"

////////////////////////////////////////////////////////////////////////////////
//  ローカル系
////////////////////////////////////////////////////////////////////////////////
namespace {

////////////////////////////////////////////////////////////////////////////////
//  全体の状態制御関連
////////////////////////////////////////////////////////////////////////////////
enum class PillarMode {
    Idle = 0,   // 待機中
    BadApple,   // BadApple 再生中
};

static PillarMode g_Mode = PillarMode::Idle;

////////////////////////////////////////////////////////////////////////////////
//  ピン関連
////////////////////////////////////////////////////////////////////////////////
// XIAO 拡張ボードのユーザスイッチ (負論理)
constexpr int PinNumberUserSwitch = 1;

static Button g_UserButton;

////////////////////////////////////////////////////////////////////////////////
//  ボリューム関連
////////////////////////////////////////////////////////////////////////////////
// XIAO 拡張ボードの GROVE A0 互換
constexpr int PinNumberAudioVolume = 0;

static Volume g_AudioVolume;

// RC フィルタ比率 (1~99)
constexpr const int LowPassFilterRate = 80;
static RcFilter g_AudioVolumeFilter(LowPassFilterRate);

// DFPlayerMini の音量の値域数 (0~30)
constexpr uint32_t AudioVolumeLevel = 31;

////////////////////////////////////////////////////////////////////////////////
//  グラフィック関連
////////////////////////////////////////////////////////////////////////////////
constexpr int OledWidth = 128;
constexpr int OledHeight = 64;

// _SW_I2C ではなく _HW_I2C を使用すれば 400kHz 駆動になる
U8G2_SSD1306_128X64_NONAME_F_HW_I2C g_U8g2(
    U8G2_R0,
    SCL,            // clock
    SDA,            // data
    U8X8_PIN_NONE   // reset
);

////////////////////////////////////////////////////////////////////////////////
//  BadApple 関連
////////////////////////////////////////////////////////////////////////////////
static int g_SceneIndex = 0;
static uint8_t g_XbmBinary[1024];
static File g_XbmFile;

constexpr int BadAppleSceneCount = 2191;

static PillarMode DoIdle(void)
{
    if (g_UserButton.WasPressed()) {
        g_SceneIndex = 0;
        g_XbmFile = SD.open("BadApple.xbm", FILE_READ);
        // file が見つからない場合は想定外
        ASSERT(g_XbmFile != 0);
        return PillarMode::BadApple;
    }
    return PillarMode::Idle;
}

static PillarMode DoBadApple(void)
{
    // 性能関連メモ
    //
    // # ファイル分割方式
    // - FAT のエントリ探索時間が線形で伸びていくので 10fps すら間に合わない。
    // - 後半のシーンに行くほど処理時間が伸びていく。
    // 
    // # ファイル結合方式
    // - ギリギリ 10fps に間に合いそう。(約 90+ ms / scene)
    // - 性能内訳
    //   - I2C 転送  : 約 33ms (400kHz)
    //   - SPI 転送  : 約 4ms (4MHz)
    //   - FAT & GFX : その他

    if ((g_UserButton.WasPressed()) ||
        (g_SceneIndex >= BadAppleSceneCount)) {
        LOG("Scene Finished.\n");
        g_XbmFile.close();
        return PillarMode::Idle;
    } else {
        g_XbmFile.read(g_XbmBinary, sizeof(g_XbmBinary));
        g_U8g2.drawXBM(0, 0, OledWidth, OledHeight, g_XbmBinary);
        g_U8g2.sendBuffer();
        g_SceneIndex++;
        LOG("%d,%d\n", g_SceneIndex, millis());
        return PillarMode::BadApple;
    }
}

} // namespace

////////////////////////////////////////////////////////////////////////////////
//  Arduino エントリポイント系
////////////////////////////////////////////////////////////////////////////////
void setup(void)
{
    Serial.begin(115200);
    // USB ポートが開くまで待機
    // USB-CDC 非搭載のものは常に true
    while (!Serial);
    LOG("Hello Serial over USB-CDC.\n");

    if (!SD.begin(2)) {
        LOG("SD Failed.\n");
        ABORT();
    }
    LOG("SD Initialized.\n");

    g_U8g2.begin();
    g_U8g2.clearBuffer();
    g_U8g2.setBitmapMode(false);
    g_U8g2.setDrawColor(1);
    g_U8g2.sendBuffer();
    LOG("u8g2 Initialized.\n");

    g_UserButton.SetPin(PinNumberUserSwitch, false, true);
    LOG("Button Initialized.\n");

    g_AudioVolume.Initialize(PinNumberAudioVolume, &g_AudioVolumeFilter, AudioVolumeLevel);
    LOG("Volume Initialized.\n");
}

void loop(void)
{
    g_UserButton.Update();
    g_AudioVolume.Update();

    auto nextState = g_Mode;
    switch (g_Mode) {
    case PillarMode::Idle:
        nextState = DoIdle();
        break;
    case PillarMode::BadApple:
        nextState = DoBadApple();
        break;
    default:
        ABORT();
    }

    if (g_Mode != nextState) {
        LOG("Mode %d -> %d\n", g_Mode, nextState);
    }
    g_Mode = nextState;
}
