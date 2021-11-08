#include "PumpConfig.h"

#include "PumpUtil.h"
#include "PumpScript.h"

#include <cassert>
#include <cstring>

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <vector>
#include <thread>
#include <chrono>

#if CONFIG_XIAO
#include <stdlib.h>
#include <SD.h>
#include "Utils.h"
#endif

void PumpScript::ParseLine(ScriptPiece *pOutPiece, const char *line)
{
    assert(pOutPiece != nullptr);
    assert(line != nullptr);

    std::string lineString { line };
    std::istringstream lineStringStream(lineString);

    std::string timingMilliSecondString;
    std::string commandByteString;
    std::getline(lineStringStream, timingMilliSecondString, ',');
    std::getline(lineStringStream, commandByteString, ',');

    pOutPiece->timingMilliSecond = ::atoi(timingMilliSecondString.c_str());

    int length = static_cast<int>(commandByteString.length());
    const char *command = commandByteString.c_str();
    for (int i = 0; i < length; i += 2)
    {
        uint8_t value;
        PumpUtil::ToHex(&value, command[i], command[i + 1]);
        pOutPiece->commandByte[i / 2] = value;
    }
    pOutPiece->commandLength = length / 2;
}

int PumpScript::Load(const char *path)
{
    assert(m_isRunnable == false);

#if CONFIG_XIAO
    File file = SD.open(path);
    if (!file) {
        return -1;
    }

    int fileSize = static_cast<int>(file.size());

    // 1 行バッファサイズは適当
    char line[80];
    int index = 0;
    int lineCount = 0;

    for (int i = 0; i < fileSize; i++) {
        int c = file.read();
        if (c != '\n') {
            line[index] = c;
            index++;
        } else {
            lineCount++;
            line[index] = '\0';
            // CRLF 対策
            if (line[index - 1] == '\r') {
                line[index - 1] = '\0';
            }
            LOG("%03d: %s\n", lineCount, line);

            PumpScript::ScriptPiece piece;
            PumpScript::ParseLine(&piece, line);
            m_script.emplace_back(piece);
            index = 0;
        }
    }
#else
    std::ifstream ifs(path);
    if (!ifs) {
        return -1;
    }
    // 1 行バッファサイズは適当
    char line[80];
    while (ifs.getline(line, sizeof(line))) {
        PumpScript::ScriptPiece piece;
        PumpScript::ParseLine(&piece, line);
        m_script.emplace_back(piece);
    }
#endif

    // 読み込むファイルはプログラムが出力したものなので
    // 各行の変換が成功すれば読み込み成功とみなし追加検査はしない
    m_isRunnable = true;

    return 0;
}

void PumpScript::Run()
{
    assert(m_isRunnable == true);
    
    // TODO: DEBUG 時のみ表示
    LOG("ideal :  real :  diff\n");

    auto startTime = std::chrono::system_clock::now();
    for (auto piece : m_script) {
        while (true) {
            auto elapsedTime = std::chrono::system_clock::now() - startTime;
            auto pieceTime = std::chrono::milliseconds(piece.timingMilliSecond);
            if (elapsedTime >= pieceTime) {
                // TODO: 時間に応じた処理

                // TODO: DEBUG 時のみ表示
                auto elapsedTimeMilliSeconds = std::chrono::duration_cast<std::chrono::milliseconds>(elapsedTime);
                int64_t ideal = pieceTime.count();
                int64_t real  = elapsedTimeMilliSeconds.count();
                int64_t diff  = (elapsedTimeMilliSeconds - pieceTime).count();
                LOG("%5d : %5d : %5d\n",
                    static_cast<int>(ideal),
                    static_cast<int>(real),
                    static_cast<int>(diff));
                
                #if CONFIG_XIAO
                    PumpUtil::WireTransaction(piece.commandByte, piece.commandLength);
                #endif

                break;
            }
            // TODO: ここで yield したい
        }
    }
}

void PumpScript::Dump()
{
    assert(m_isRunnable == true);

    for (auto piece : m_script) {
        LOG("[%5d] ", piece.timingMilliSecond);
        for (int i = 0; i < piece.commandLength; i++) {
            LOG("%02X ", piece.commandByte[i]);
        }
        LOG("\n");
    }
}
