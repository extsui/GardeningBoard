#include <Arduino.h>
#include <Wire.h>
#include <SPI.h>
#include <SD.h>

#include <U8g2lib.h>
#include <DFRobotDFPlayerMini.h>

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
//  mp3 再生関連
////////////////////////////////////////////////////////////////////////////////
static DFRobotDFPlayerMini g_DfPlayer;

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
constexpr int BadAppleSceneIntervalMilliSeconds = 100;
static uint32_t g_BadAppleNextSceneTime = 0;

static PillarMode DoIdle(void)
{
    if (g_UserButton.WasPressed()) {
        g_SceneIndex = 0;
        g_BadAppleNextSceneTime = millis();
        g_XbmFile = SD.open("BadApple.xbm", FILE_READ);
        g_DfPlayer.playMp3Folder(4);
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
        g_XbmFile.close();
        // TODO: 一旦真っ黒画面にしているが最終的には Idle 用画面を表示するべき
        g_U8g2.clearDisplay();
        g_DfPlayer.stop();
        LOG("BadApple Canceled.\n");
        return PillarMode::Idle;

    } else {
        uint32_t now = millis();
        if (now >= g_BadAppleNextSceneTime) {
            g_XbmFile.read(g_XbmBinary, sizeof(g_XbmBinary));
            g_U8g2.drawXBM(0, 0, OledWidth, OledHeight, g_XbmBinary);
            g_U8g2.sendBuffer();
            uint8_t volumeLevel = static_cast<uint8_t>(g_AudioVolume.GetLevelCorrectedCurveAtoB());
            g_DfPlayer.volume(volumeLevel);
            g_SceneIndex++;
            g_BadAppleNextSceneTime += BadAppleSceneIntervalMilliSeconds;
            LOG("%d,%d,%d\n", g_SceneIndex, now, volumeLevel);
        }
        return PillarMode::BadApple;
    }
}

} // namespace

////////////////////////////////////////////////////////////////////////////////
//  Arduino エントリポイント系
////////////////////////////////////////////////////////////////////////////////
void setup(void)
{
    // USB ポートが開くまで一定時間待機
    // 開けない場合でもそのまま進む
    Serial.begin(115200);
    constexpr const uint32_t UsbSerialTimeoutMilliSeconds = 500;
    uint32_t start = millis();
    // USB-CDC 非搭載のものは常に true
    while (!Serial) {
        if (start + UsbSerialTimeoutMilliSeconds >= millis()) {
            break;
        }
    }
    LOG("USB-CDC Initialized.\n");
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
    }

    LOG("Setup Done.\n");
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
