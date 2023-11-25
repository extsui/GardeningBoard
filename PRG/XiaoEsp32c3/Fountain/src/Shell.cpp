#include <stdint.h>
#include <string.h>
#include "Shell.h"
#include "Util.h"

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

int ExecuteCommand(const uint8_t *buffer, size_t bufferLength) noexcept
{
    // TODO: ここにコマンド解析部を書いていく

    LOG("Length: %d\n", bufferLength);
    LOG("Buffer: [%s]\n", buffer);
    DumpBuffer(buffer, bufferLength);
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
