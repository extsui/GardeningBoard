#include <stdint.h>
#include <string.h>
#include "Building.h"
#include "Shell.h"
#include "Util.h"

// TORIAEZU:
extern Building g_Building;

namespace {

// シリアル受信バッファサイズ
constexpr size_t ReceiveBufferSize = 256;

// シリアル受信バッファ
uint8_t g_ReceiveBuffer[ReceiveBufferSize];

// シリアル受信バッファ現在位置
int g_ReceiveBufferIndex = 0;

// 汎用バッファダンプ
void DumpBuffer(const uint8_t* buffer, size_t bufferLength) noexcept
{
    for (int i = 0; i < bufferLength; i++) {
        if ((i > 0) && (i % 16 == 0)) {
            LOG("\n");
        }
        LOG("%02X ", buffer[i]);
    }
    LOG("\n");
}

/**
 * 16 進表記の 2 文字を 1 バイトに変換する。
 * 成功した場合は outValue に変換後の値が代入される。
 * @return 0: 成功 / -1: 失敗
 */
int ToHex(uint8_t *outValue, char hi, char lo) noexcept
{
    uint8_t h, l;

    ASSERT(outValue != NULL);
    
    if (('a' <= hi) && (hi <= 'f')) {
        h = hi - 'a' + 10;
    } else if (('A' <= hi) && (hi <= 'F')) {
        h = hi - 'A' + 10;
    } else if (('0' <= hi) && (hi <= '9')) {
        h = hi - '0';
    } else {
        return -1;
    }
    
    if (('a' <= lo) && (lo <= 'f')) {
        l = lo - 'a' + 10;
    } else if (('A' <= lo) && (lo <= 'F')) {
        l = lo - 'A' + 10;
    } else if (('0' <= lo) && (lo <= '9')) {
        l = lo - '0';
    } else {
        return -1;
    }
    
    *outValue = (h << 4) | (l & 0x0F);
    return 0;
}

/**
 * @brief Building 表示データ設定コマンドを解析する
 * 
 * @param [out] array 解析結果を格納する配列
 * @param [in] buffer 入力文字列
 * @param [in] arrayLength 配列の長さ
 * @return 成功: 解釈できたバイト数 / 失敗: -1
 * 
 * 例: "aabbccdd.." (16 進数表記固定、データは可変長)
 */
int ParseHexString(uint8_t *outBuffer, size_t outBufferLength, const uint8_t *inBuffer, int inBufferLength) noexcept
{
    ASSERT(outBuffer != NULL);
    ASSERT(inBuffer != NULL);

    // bufferLength を越えるか buffer が最後まで到達したら終了
    int result = 0;
    int readPos = 0;
    int writePos = 0;
    while ((writePos < outBufferLength) && (readPos < inBufferLength) && (inBuffer[readPos] != '\0')) {
        result = ToHex(&outBuffer[writePos], inBuffer[readPos], inBuffer[readPos + 1]);
        if (result == -1) {
            return -1;
        }
        readPos += 2;
        writePos++;
    }

    return writePos;
}

int ExecuteCommand(const uint8_t* buffer, size_t bufferLength) noexcept
{
    // DEBUG:
    LOG("Length: %d\n", bufferLength);
    LOG("Buffer: [%s]\n", buffer);
    DumpBuffer(buffer, bufferLength);

    // ここにコマンド解析部を書いていく
    if (buffer[0] == '@') {
        uint8_t display[Building::DigitY * Building::DigitX];
        memset(display, 0x00, sizeof(display));
        int result = ParseHexString(display, sizeof(display), &buffer[1], bufferLength - 1);

        g_Building.SetDisplay(display);
        g_Building.Update();

        LOG("Raw Command\n");
        LOG("result = %d\n", result);
        DumpBuffer(display, sizeof(display));
        return 0;
    }

    return 0;
}

}

void ParseAndExecuteCommand(uint8_t ch) noexcept
{
    if (g_ReceiveBufferIndex >= ReceiveBufferSize - 1) {
        LOG("Error: ReceiveBuffer overrun!\n");
        memset(g_ReceiveBuffer, 0, sizeof(g_ReceiveBuffer));
        g_ReceiveBufferIndex = 0;
        return;
    }

    g_ReceiveBuffer[g_ReceiveBufferIndex] = ch;
    g_ReceiveBufferIndex++;
    if (ch == '\n') {
        // 改行でコマンド確定
        g_ReceiveBuffer[g_ReceiveBufferIndex - 1] = '\0';
        int result = ExecuteCommand(g_ReceiveBuffer, g_ReceiveBufferIndex - 1);
        if (result == -1) {
            LOG("Error: [%s]\n", g_ReceiveBuffer);
        }
        memset(g_ReceiveBuffer, 0, sizeof(g_ReceiveBuffer));
        g_ReceiveBufferIndex = 0;
    }
}
