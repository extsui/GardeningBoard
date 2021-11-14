#include <Wire.h>
#include "Utils.h"
#include "ScriptState.h"
#include "PillarSettings.h"

#include <ctype.h>
#include "PumpUtil.h"
#include "PumpConfig.h"
#include "PumpScript.h"

namespace {

// シリアル受信バッファサイズ
constexpr int ReceiveBufferSize = 256;

// シリアル受信バッファ
uint8_t g_receiveBuffer[ReceiveBufferSize];

// シリアル受信バッファ現在位置
int g_receiveBufferIndex = 0;

// コマンド実行回数
int g_ExecuteCommandCount = 0;

// 画面系
bool g_IsUpdateDisplay = false;

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
        } else {
            g_ExecuteCommandCount++;
            g_IsUpdateDisplay = true;
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
        LOG("[pump] Script Load: OK\n");
        script.Run();
    } else {
        LOG("[pump] Script Load: FAILED!!! (\"%s\")\n", path);
    }
    return result;
}

} // namespace

// ================================================================================

void ScriptState::OnEnter(PillarInput *pInput, PillarOutput *pOutput)
{
    UNUSED(pInput);

    pOutput->pU8g2->clearDisplay();
    pOutput->pU8g2->drawStr(0, PillarOutput::FontHeight * 1, "== Script Mode ==");
    pOutput->pU8g2->sendBuffer();
}

PillarMode ScriptState::OnExecute(PillarInput *pInput, PillarOutput *pOutput)
{
    UNUSED(pOutput);

    if (pInput->pUserButton->WasDoubleClicked()) {
        return PillarMode::Idle;
    }

    // DEBUG: お試し用。後で消す
    if (pInput->pUserButton->WasLongClicked()) {
        pOutput->pDfplayer->playMp3Folder(PillarSettings::WizardsInWinterMp3);
    }

    if (Serial.available()) {
        // シリアル経由コマンド実行
        uint8_t data = Serial.read();
        OnSerialReceiveByte(data);
	}

    if (pInput->pUserButton->WasSingleClicked()) {
        // スクリプト実行
        const char *path = PillarSettings::TestScriptPath;
        int result = ExecutePumpScript(path);
        if (result == -1) {
            LOG("%s: File not found.\n", path);
        }
    }

    // 必要があれば画面更新
    if (g_IsUpdateDisplay) {
        g_IsUpdateDisplay = false;

        // 実行の度に画面更新すると処理が全く間に合わなかったので以下は没
        //static char buffer[16];
        //sprintf(buffer, "EXEC: %lu", g_ExecuteCommandCount);
        //pOutput->pU8g2->drawStr(0, PillarOutput::FontHeight * 2, buffer);
        //pOutput->pU8g2->sendBuffer();

        LOG("%d\n", g_ExecuteCommandCount);
    }

    return PillarMode::Script;
}

void ScriptState::OnExit(PillarInput *pInput, PillarOutput *pOutput)
{
    UNUSED(pInput);
    
    pOutput->pU8g2->clearDisplay();
}
