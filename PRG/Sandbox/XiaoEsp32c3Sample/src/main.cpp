#include <Arduino.h>
#include <stdint.h>
#include "Ht16k33.h"
#include "Utils.h"

constexpr int LedPin = 10;
constexpr int OnDelay = 950;
constexpr int OffDelay = 50;

TwoWire& g_Wire = Wire;

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

    void SetBrightness() noexcept
    {
        // TODO:
    }

    void Clear() noexcept
    {
        memset(m_Display, 0, sizeof(m_Display));
    }

    void SetPattern(int x, int y, uint8_t pattern) noexcept
    {
        ASSERT(0 <= x && x < DigitX);
        ASSERT(0 <= y && y < DigitY);
        m_Display[y][x] = pattern;
    }

    void Update() noexcept
    {
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

            // DEBUG:
            for (int i = 0; i < DigitCount; i++)
            {
                LOG("%02x ", display[i]);
            }
            LOG("\n");

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

constexpr uint8_t SegmentTable[] =
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
    pinMode(A0, INPUT);
    pinMode(A1, INPUT);

    //g_Wire.begin(SDA, SCL, 400000);
    g_Wire.begin(D10, D7, 400000);

    g_Building.Initialize();
    g_Building.Clear();
    g_Building.Update();

    Serial.begin(115200);
    LOG("Building: Startup.\n");
}

void loop()
{
    for (int y = 0; y < Building::DigitY; y++)
    {
        static uint16_t freq = 1000;
        static uint16_t delayMilliSeconds = 50;

        for (int x = 0; x < Building::DigitX; x++)
        {
            LOG("[%d][%d]\n", y, x);
            g_Building.Clear();
            //g_Building.SetPattern(x, y, SegmentTable[n]);
            g_Building.SetPattern(x, y, 0xFF);

            digitalWrite(LedPin, HIGH);
            g_Building.Update();
            digitalWrite(LedPin, LOW);

            uint16_t vol0 = analogRead(A0);
            uint16_t vol1 = analogRead(A1);
            LOG("vol0 = %4d, vol1 = %4d\n", vol0, vol1);

            freq = vol0;
            delayMilliSeconds = vol1;

            uint16_t validatedFreq = (freq < 50) ? 50 : freq;
            tone(D6, validatedFreq, delayMilliSeconds);
            delay(delayMilliSeconds);
        }
    }
}
