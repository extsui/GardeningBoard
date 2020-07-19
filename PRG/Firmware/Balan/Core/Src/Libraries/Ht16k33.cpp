#include "Ht16k33.hpp"

int Ht16k33::Init(SoftwareI2c *dev, uint8_t addr)
{
    // TODO: 通信エラー時の return -1

    // オシレータ ON
    dev->BeginTransmission(addr);
    dev->Write(0x21);
    dev->EndTransmission();

    // 輝度設定 (0)
    dev->BeginTransmission(addr);
    dev->Write(0xE0 | 0);
    dev->EndTransmission();
    
    // 点滅設定 (点滅無し)
    dev->BeginTransmission(addr);
    dev->Write(0x80 | 0x01 | 0);
    dev->EndTransmission();

    return 0;
}

int Ht16k33::SetBrightness(SoftwareI2c *dev, uint8_t addr, uint8_t brightness)
{
    // TODO: 通信エラー時の return -1

    if (brightness > BrightnessMax) {
        return -1;
    }

    // 輝度設定 (0~15)
    dev->BeginTransmission(addr);
    dev->Write(0xE0 | brightness);
    dev->EndTransmission();

    return 0;    
}

int Ht16k33::SetData(SoftwareI2c *dev, uint8_t addr, const uint8_t data[], uint8_t length)
{
    // TODO: 通信エラー時の return -1

    dev->BeginTransmission(addr);
    dev->Write(0x00);
    for (int i = 0; i < length; i++) {
    	  dev->Write(data[i]);
    }
    dev->EndTransmission();

    return 0;
}
