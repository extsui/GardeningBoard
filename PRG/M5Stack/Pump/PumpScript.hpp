#ifndef PUMP_SCRIPT_HPP
#define PUMP_SCRIPT_HPP

#include <stdint.h>
#include <vector>
#include <tuple>
#include <cstring>
#include <cassert>

class PumpScript
{
public:
    // NOTE:
    // - 2021/4/24 時点での送信コマンドの最長が 7Byte
    // - 余裕を見て少し大きめのサイズで定義しておく
    // - 1 万行にした場合の試算は 24byte * 10000 = 約 240KB
    // - M5Stack の SRAM が 520KB なので一応収まるはず
    static constexpr int PumpCommandLengthMax = 16;

    // スクリプトの 1 行
    struct ScriptPiece
    {
        uint32_t timingMilliSecond;
        uint8_t commandLength;
        uint8_t commandByte[PumpCommandLengthMax];

        explicit ScriptPiece()
            : timingMilliSecond(0),
              commandLength(0)
        {
            std::memset(commandByte, 0, sizeof(commandByte));
        }

        explicit ScriptPiece(uint32_t timing, const uint8_t *command, int length)
            : timingMilliSecond(timing),
              commandLength(length)
        {
            assert(length <= PumpCommandLengthMax);
            std::memcpy(commandByte, command, length);
            std::memset(&commandByte[length], 0, PumpCommandLengthMax - length);
        }
    
        friend bool operator==(const ScriptPiece& lhs, const ScriptPiece& rhs)
        {
            return (std::tie(lhs.timingMilliSecond, lhs.commandLength) ==
                    std::tie(rhs.timingMilliSecond, rhs.commandLength)) &&
                   (std::memcmp(lhs.commandByte, rhs.commandByte, lhs.commandLength) == 0);
        }
    };

    static_assert(sizeof(ScriptPiece) == 24, "ScriptPiece's size is Bad!");

    static void ParseLine(ScriptPiece *pOutPiece, const char *line);

public:
    PumpScript()
     : m_script(),
       m_isRunnable(false)
    {
    }

    // スクリプトファイルを読み込む
    int Load(const char *path);

    // スクリプトを実行する
    // ブロッキングすることに注意
    void Run();
    
    // 読み込んだスクリプトを表示する
    void Dump();

private:
    std::vector<ScriptPiece> m_script;
    bool m_isRunnable;
};

#endif /* PUMP_SCRIPT_HPP */
