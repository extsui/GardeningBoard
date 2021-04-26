#include <gtest/gtest.h>
#include "../Pump/PumpUtil.hpp"
#include "../Pump/PumpScript.hpp"

void ToHexTestCaseSuccess(const char *str, uint8_t expectOutValue)
{
    int result;
    uint8_t outValue = 0;
    result = PumpUtil::ToHex(&outValue, str[0], str[1]);
    EXPECT_EQ(result, 0);
    EXPECT_EQ(outValue, expectOutValue);
}

void ToHexTestCaseFailed(const char *str)
{
    int result = 0;
    uint8_t outValue = 0;
    result = PumpUtil::ToHex(&outValue, str[0], str[1]);
    EXPECT_EQ(result, -1);
}

TEST(PumpUtilTest, ToHexTest)
{
    // OK
    ToHexTestCaseSuccess("01",  0x01);
    ToHexTestCaseSuccess("10",  0x10);
    ToHexTestCaseSuccess("99",  0x99);
    ToHexTestCaseSuccess("cc",  0xcc);
    ToHexTestCaseSuccess("CC",  0xCC);
    ToHexTestCaseSuccess("FF",  0xFF);
    // NG
    ToHexTestCaseFailed(" 1");
    ToHexTestCaseFailed("x1");
    ToHexTestCaseFailed("-1");
    ToHexTestCaseFailed("0x");
}

TEST(PumpUtilTest, ParseRawCommandTest)
{
    int result = 0;
    uint8_t array[16] = { 0 };
    {
        const char *command = "@send 60FF";
        uint8_t expectArray[2] = { 0x60, 0xFF, };
        result = PumpUtil::ParseRawSendCommand(command, array, sizeof(array));
        EXPECT_EQ(result, sizeof(expectArray));
        for (int i = 0; i < sizeof(expectArray); i++) {
            EXPECT_EQ(array[i], expectArray[i]);
        }
    }
    {
        const char *command = "@send 61AABBCCDDEEFF";
        uint8_t expectArray[7] = { 0x61, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF, };
        result = PumpUtil::ParseRawSendCommand(command, array, sizeof(array));
        EXPECT_EQ(result, sizeof(expectArray));
        for (int i = 0; i < sizeof(expectArray); i++) {
            EXPECT_EQ(array[i], expectArray[i]);
        }
    }
    {
        const char *command = "@send 61AABBCCDDEEFF";
        uint8_t expectArray[7] = { 0x61, 0xAA, 0xBB, 0xCC, 0xDD, 0xEE, 0xFF, };
        result = PumpUtil::ParseRawSendCommand(command, array, 3);
        EXPECT_EQ(result, 3);
        for (int i = 0; i < 3; i++) {
            EXPECT_EQ(array[i], expectArray[i]);
        }
    }
}

// スクリプト 1 行を読み取って ScriptPiece に変換するテスト
TEST(PumpScriptTest, ParseLine)
{
    PumpScript::ScriptPiece piece;
    PumpScript::ParseLine(&piece, "9999,0102030405060708");

    uint8_t expectedArray[] = { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, };
    PumpScript::ScriptPiece expected(9999, expectedArray, sizeof(expectedArray));
    EXPECT_EQ(piece, expected);
}

TEST(PumpScriptTest, Load)
{
    int result = 0;
    
    PumpScript script;
    result = script.Load("./Resources/TestScript.gbs");
    ASSERT_EQ(result, 0);
    
    script.Dump();
}

int main(int argc, char* argv[])
{
    ::testing::InitGoogleTest(&argc,argv);
    return RUN_ALL_TESTS();
}
