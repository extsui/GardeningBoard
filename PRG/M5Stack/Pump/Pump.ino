#include "PumpConfig.hpp"

#include <M5Stack.h>
#include <ctype.h>
#include "PumpUtil.hpp"
#include "PumpScript.hpp"

namespace {

// シリアル受信バッファサイズ
constexpr int ReceiveBufferSize = 256;

// シリアル受信バッファ
uint8_t g_receiveBuffer[ReceiveBufferSize];

// シリアル受信バッファ現在位置
int g_receiveBufferIndex = 0;

int ExecuteCommand(const uint8_t *command);

// シリアル 1Byte 受信処理
// 改行受信でコマンド解釈および実行する
void OnSerialReceiveByte(uint8_t data)
{
    g_receiveBuffer[g_receiveBufferIndex] = data;
    g_receiveBufferIndex++;
    if (data == '\n') {
        // コマンド確定
        g_receiveBuffer[g_receiveBufferIndex - 1] = '\0';
        int result = ExecuteCommand(g_receiveBuffer);
        if (result == -1) {
            LOG("Error! [%s]\n", g_receiveBuffer);
        }
        memset(g_receiveBuffer, 0, sizeof(g_receiveBuffer));
        g_receiveBufferIndex = 0;
    }
}

int ExecuteCommand(const uint8_t *command)
{
    if (command[0] == '@') {
        uint8_t array[16] = { 0 };
        int length = PumpUtil::ParseRawSendCommand((const char*)command, array, sizeof(array));
        if (length == -1) {
            LOG("[RawSendCommand] Parse Error!\n");
            return -1;
        }
        PumpUtil::WireTransaction(array, length);
        return 0;
    }

    // TODO: コマンド解析
    // テストサンプルコマンド
    // - "0 pattern 2 11 100 1" --> [ 0x00, 0x10, 0x02, 0x0b, 0x64, 0x01 ]
    // - "4 bright 3 8"         --> [ 0x04, 0x20, 0x03, 0x08 ]
    // - "7 bright 15"          --> [ 0x07, 0x21, 0x0F ] ★場合分けが面倒なので後回し★

    // 共通
    uint8_t addr = 0;
    uint8_t commandId = 0;
    uint8_t brickId = 0;

    // pattern
    uint8_t patternId = 0;
    uint8_t timing = 0;
    uint8_t isRepeat = 0;

    // brick
    uint8_t brightness = 0;

    // ツールからの受信を想定しているので過度のエラーチェックは不要
    char *str = (char*)command;
    int pos = 0;
    addr = (str[pos] - '0');
    pos += 1 + 1;

    if (strncmp(&str[pos], "pattern", 7) == 0) {
        commandId = 0x10;
        pos += 7 + 1;

        brickId = str[pos] - '0';
        pos += 1 + 1;

        patternId = atoi(&str[pos]);
        pos += PumpUtil::GetDigitLength(patternId) + 1;

        timing = atoi(&str[pos]);
        pos += PumpUtil::GetDigitLength(timing) + 1;

        isRepeat = str[pos] - '0';
        pos += 1;

        LOG("addr      = 0x%02x\n", addr);
        LOG("commandId = 0x%02x\n", commandId);
        LOG("brickId   = 0x%02x\n", brickId);
        LOG("patternId = 0x%02x\n", patternId);
        LOG("timing    = 0x%02x\n", timing);
        LOG("isRepeat  = 0x%02x\n", isRepeat);

        if (str[pos] != '\0') {
            return -1;
        }

    } else if (strncmp(&str[pos], "bright", 6) == 0) {
        commandId = 0x20;
        pos += 6 + 1;

        brickId = str[pos] - '0';
        pos += 1 + 1;

        brightness = atoi(&str[pos]);
        pos += PumpUtil::GetDigitLength(brightness);

        LOG("addr       = 0x%02x\n", addr);
        LOG("commandId  = 0x%02x\n", commandId);
        LOG("brickId    = 0x%02x\n", brickId);
        LOG("brightness = 0x%02x\n", brightness);

        if (str[pos] != '\0') {
            return -1;
        }

    } else {
        return -1;
    }

    // 解析成功
    switch (commandId) {
    case 0x10:
        LOG("[ 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x 0x%02x ]\n",
            addr, commandId, brickId, patternId, timing, isRepeat);
        Wire.beginTransmission(addr);
        Wire.write(commandId);
        Wire.write(brickId);
        Wire.write(patternId);
        Wire.write(timing);
        Wire.write(isRepeat);
        Wire.endTransmission();
        break;

    case 0x20:
        LOG("[ 0x%02x 0x%02x 0x%02x 0x%02x ]\n",
            addr, commandId, brickId, brightness);
        Wire.beginTransmission(addr);
        Wire.write(commandId);
        Wire.write(brickId);
        Wire.write(brightness);
        Wire.endTransmission();
        break;

    default:
        return -1;
    }

    LOG("[%s]\n", str);

    return 0;
}

int ExecutePumpScript(const char *path)
{
    PumpScript script;
    int result = script.Load(path);
    if (result == 0) {
        script.Run();
    }
    return result;
}

} // namespace

//////////////////////////////////////////////////////////////////////
//  最上位モジュール
//////////////////////////////////////////////////////////////////////

void setup()
{
    // SD
    M5.begin();

    M5.Lcd.begin();
    M5.Lcd.fillScreen(BLACK);
    M5.Lcd.setCursor(0, 0);
    M5.Lcd.setTextColor(YELLOW);  
    M5.Lcd.setTextSize(2);

    M5.Lcd.fillScreen(BLACK);
    M5.Lcd.setCursor(0, 0);

    // UART
    Serial.begin(115200);

    // I2C
    Wire.begin();

    LOG("Pump Start!\n");
    LCD_LOG("Pump Start!\n");
}

void loop()
{
    M5.update();

    if (Serial.available()) {
        // シリアル経由コマンド実行
        uint8_t data = Serial.read();
        OnSerialReceiveByte(data);
	  }

    if (M5.BtnC.wasReleased()) {
        // スクリプト実行
        const char *path = "/Resources/TestScript.gbs";
        int result = ExecutePumpScript(path);
        if (result == -1) {
            LOG("%s: File not found.\n", path);
        }
    }
}
