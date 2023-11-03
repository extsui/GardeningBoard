#include <Arduino.h>
#include <stdint.h>
#include "Ht16k33.h"
#include "MetaSegmentTable.h"

#include "Button.h"
#include "Volume.h"
#include "Utils.h"

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

class Building
{
public:
    static constexpr int DigitX = 6;
    static constexpr int DigitY = 6;

    // HT16K33 の数
    static constexpr int UnitCount = 3;
    // HT16K33 1個あたりの管理桁数
    static constexpr int DigitCount = 16;
    
public:
    void Initialize() noexcept
    {
        for (int unit = 0; unit < UnitCount; unit++)
        {
            Ht16k33::Initialize(&g_Wire, Ht16k33::BaseAddress + unit);
            Ht16k33::SetBrightness(&g_Wire, Ht16k33::BaseAddress + unit, 4);
        }
    }

    void SetBrightness(uint8_t brightness) noexcept
    {
        if (brightness >= 16)
        {
            LOG("brightness range error! (%d)\n", brightness);
            return;
        }
        for (int unit = 0; unit < UnitCount; unit++)
        {
            Ht16k33::SetBrightness(&g_Wire, Ht16k33::BaseAddress + unit, brightness);
        }
    }

    void Clear() noexcept
    {
        memset(m_Display, 0, sizeof(m_Display));
    }

    void Fill() noexcept
    {
        memset(m_Display, 0xFF, sizeof(m_Display));
    }

    void SetPattern(int x, int y, uint8_t pattern) noexcept
    {
        ASSERT(0 <= x && x < DigitX);
        ASSERT(0 <= y && y < DigitY);
        m_Display[y][x] = pattern;
    }

    void OrPattern(int x, int y, uint8_t pattern) noexcept
    {
        ASSERT(0 <= x && x < DigitX);
        ASSERT(0 <= y && y < DigitY);
        m_Display[y][x] |= pattern;
    }

    void AndPattern(int x, int y, uint8_t pattern) noexcept
    {
        ASSERT(0 <= x && x < DigitX);
        ASSERT(0 <= y && y < DigitY);
        m_Display[y][x] &= ~pattern;
    }

    void Update() noexcept
    {
/*
        LOG("Pattern:\n");
        for (int y = 0; y < DigitY; y++)
        {
            for (int x = 0; x < DigitX; x++)
            {
                LOG("%02x ", m_Display[y][x]);
            }
            LOG("\n");
        }
        LOG("\n\n");
*/
        for (int unit = 0; unit < UnitCount; unit++)
        {
            // HT16K33 1個に接続されている 7 セグは 12 個だが、表示用の
            // RAM の構成が横分割ではなく縦分割なので 16Byte 全域を使う必要がある
            uint8_t display[DigitCount];
            memset(display, 0, sizeof(display));
            for (int y = 0; y < 2; y++)
            {
                for (int x = 0; x < DigitX; x++)
                {
                    CreateDisplayData(display, (y * DigitX) + x, m_Display[(unit * 2) + y][x]);
                }
            }
/*
            // DEBUG:
            for (int i = 0; i < DigitCount; i++)
            {
                LOG("%02x ", display[i]);
            }
            LOG("\n");
*/
            Ht16k33::SetDisplay(&g_Wire, Ht16k33::BaseAddress + unit, display, DigitCount);

        }
    }

private:
    static void CreateDisplayData(uint8_t* pDisplay, uint8_t digit, uint8_t pattern) noexcept
    {
        /*
         *         HT16K33 の RAM 構成
         * -----+----------------+---------------
         *      | ROW0  1  ... 7 | 8  9  ...  15 
         * -----+----------------+---------------
         * COL0 |      00h       |       01h
         *    1 |      02h       |       03h
         *    : |       :        |        :
         * COL7 |      0Eh       |       0Fh
         * -----+----------------+---------------
         * 
         *    RAM の構成に対する 7 セグの割り当て
         * -----+-------------+--------------------
         *  C\R | 0  1  ... 7 | 8 ... 11 12 ... 15
         * -----+-------------+--------------------
         *    0 | a  a  ... a | a ... a  x  ... x
         *    1 | b  b  ... b | b ... b  x  ... x
         *    2 | c  c  ... c | c ... c  x  ... x
         *    3 | d  d  ... d | d ... d  x  ... x
         *    4 | e  e  ... e | e ... e  x  ... x
         *    5 | f  f  ... f | f ... f  x  ... x
         *    6 | g  g  ... g | g ... g  x  ... x
         *    7 | *  *  ... * | * ... *  x  ... x
         * -----+-------------+--------------------
         *        ^  ^          ^        ^^^^^^^^ 
         *        |  2桁目      |        (4桁分未使用)
         *        1桁目         8桁目
         */
        ASSERT(digit < 12);
        if (digit < 8)
        {
            pDisplay[0]  |= ((pattern & (1 << 7)) != 0) ? (1 << digit) : 0; // a
            pDisplay[2]  |= ((pattern & (1 << 6)) != 0) ? (1 << digit) : 0; // b
            pDisplay[4]  |= ((pattern & (1 << 5)) != 0) ? (1 << digit) : 0; // c
            pDisplay[6]  |= ((pattern & (1 << 4)) != 0) ? (1 << digit) : 0; // d
            pDisplay[8]  |= ((pattern & (1 << 3)) != 0) ? (1 << digit) : 0; // e
            pDisplay[10] |= ((pattern & (1 << 2)) != 0) ? (1 << digit) : 0; // f
            pDisplay[12] |= ((pattern & (1 << 1)) != 0) ? (1 << digit) : 0; // g
            pDisplay[14] |= ((pattern & (1 << 0)) != 0) ? (1 << digit) : 0; // *
        }
        else
        {
            pDisplay[1]  |= ((pattern & (1 << 7)) != 0) ? (1 << (digit - 8)) : 0; // a
            pDisplay[3]  |= ((pattern & (1 << 6)) != 0) ? (1 << (digit - 8)) : 0; // b
            pDisplay[5]  |= ((pattern & (1 << 5)) != 0) ? (1 << (digit - 8)) : 0; // c
            pDisplay[7]  |= ((pattern & (1 << 4)) != 0) ? (1 << (digit - 8)) : 0; // d
            pDisplay[9]  |= ((pattern & (1 << 3)) != 0) ? (1 << (digit - 8)) : 0; // e
            pDisplay[11] |= ((pattern & (1 << 2)) != 0) ? (1 << (digit - 8)) : 0; // f
            pDisplay[13] |= ((pattern & (1 << 1)) != 0) ? (1 << (digit - 8)) : 0; // g
            pDisplay[15] |= ((pattern & (1 << 0)) != 0) ? (1 << (digit - 8)) : 0; // *
        }
    }

private:
    uint8_t m_Display[DigitY][DigitX];
};

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

    g_Building.Initialize();
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
