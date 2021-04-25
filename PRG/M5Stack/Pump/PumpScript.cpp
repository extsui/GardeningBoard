#include "PumpUtil.hpp"
#include "PumpScript.hpp"

#include <cassert>
#include <cstring>

#include <iostream>
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
