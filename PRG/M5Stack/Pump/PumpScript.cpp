#include "PumpUtil.hpp"
#include "PumpScript.hpp"

#include <cassert>
#include <cstring>

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <vector>

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

    pOutPiece->timingMilliSecond = std::atoi(timingMilliSecondString.c_str());

    size_t length = commandByteString.length();
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

    // 読み込むファイルはプログラムが出力したものなので
    // 各行の変換が成功すれば読み込み成功とみなし追加検査はしない
    m_isRunnable = true;

    return 0;
}

void PumpScript::Run()
{
    assert(m_isRunnable == true);
    // TODO:
}

void PumpScript::Dump()
{
    assert(m_isRunnable == true);

    for (auto piece : m_script) {
        printf("[%5d] ", piece.timingMilliSecond);
        for (int i = 0; i < piece.commandLength; i++) {
            printf("%02X ", piece.commandByte[i]);
        }
        printf("\n");
    }
}
