#ifndef PILLAR_INPUT_H
#define PILLAR_INPUT_H

#include "Button.h"
#include "Volume.h"

struct PillarInput
{
    Button *pUserButton;
    Volume *pAudioVolume;

    PillarInput(Button *_pUserButton, Volume *_pAudioVolume)
        : pUserButton(_pUserButton)
        , pAudioVolume(_pAudioVolume)
    {}
};

#endif /* PILLAR_INPUT_H */
