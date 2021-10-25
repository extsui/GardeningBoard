#include <SD.h>
#include "Utils.h"
#include "BadApple.h"

namespace {

static int g_SceneIndex = 0;
static uint8_t g_XbmBinary[1024];
static File g_XbmFile;

constexpr int BadAppleSceneCount = 2191;
constexpr int BadAppleSceneIntervalMilliSeconds = 100;
static uint32_t g_BadAppleNextSceneTime = 0;

}

void BadAppleState::OnEnter()
{
    g_SceneIndex = 0;
    g_BadAppleNextSceneTime = millis();
    g_XbmFile = SD.open("BadApple.xbm", FILE_READ);
    g_DfPlayer.playMp3Folder(4);
    // file が見つからない場合は想定外
    ASSERT(g_XbmFile != 0);
}

PillarMode BadAppleState::OnExecute()
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

void BadAppleState::OnExit()
{
    g_XbmFile.close();
    // TODO: 一旦真っ黒画面にしているが最終的には Idle 用画面を表示するべき
    g_U8g2.clearDisplay();
    g_DfPlayer.stop();
    LOG("BadApple Finished or Canceled.\n");
}
