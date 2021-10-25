#ifndef PILLAR_OUTPUT_H
#define PILLAR_OUTPUT_H

#include <U8g2lib.h>
#include <DFRobotDFPlayerMini.h>

struct PillarOutput
{
    static constexpr int OledWidth = 128;
    static constexpr int OledHeight = 64;

    DFRobotDFPlayerMini *pDfplayer;
    U8G2_SSD1306_128X64_NONAME_F_HW_I2C *pU8g2;

    PillarOutput(DFRobotDFPlayerMini *_Dfplayer, U8G2_SSD1306_128X64_NONAME_F_HW_I2C *_pU8g2)
        : pDfplayer(_Dfplayer)
        , pU8g2(_pU8g2)
    {}
};

#endif /* PILLAR_OUTPUT_H */
