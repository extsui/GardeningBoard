#include <gtest/gtest.h>
#include "../Pump/PumpUtil.hpp"

TEST(PumpUtilTest, Add)
{
    EXPECT_EQ(PumpUtil::add(1, 2), 3);
}

int main(int argc, char* argv[])
{
    ::testing::InitGoogleTest(&argc,argv);
    return RUN_ALL_TESTS();
}
