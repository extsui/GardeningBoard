#ifndef PILLAR_INPUT_H
#define PILLAR_INPUT_H

#include "Button.h"
#include "Volume.h"

struct PillarInput
{
    Button *pUserButton;
    Volume *pAudioVolume;
    Volume *pBrightnessVolume;

    PillarInput(Button *_pUserButton, Volume *_pAudioVolume, Volume *_pBrightnessVolume)
        : pUserButton(_pUserButton)
        , pAudioVolume(_pAudioVolume)
        , pBrightnessVolume(_pBrightnessVolume)
    {}
};

#endif /* PILLAR_INPUT_H */
