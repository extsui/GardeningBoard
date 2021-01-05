using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Threading;
using PatternConverter;
using System;

namespace PatternConverterTest
{
    public class Utils
    {
        // 例外の種類と文字列まで見る版
        public static void CheckReturnException(Exception ex, Func<bool> func)
        {
            bool resultOK = false;
            try
            {
                func();
            }
            catch (Exception e)
            {
                Assert.IsTrue(e.GetType() == ex.GetType());
                if (Thread.CurrentThread.CurrentCulture.Name == "ja-JP")
                {
                    Assert.IsTrue(e.Message == ex.Message);
                }
                resultOK = true;
            }
            Assert.IsTrue(resultOK);
        }

        // 例外が発生することを雑に確認する版
        public static void CheckReturnException(Func<bool> func)
        {
            bool resultOK = false;
            try
            {
                func();
            }
            catch (Exception e)
            {
                resultOK = true;
            }
            Assert.IsTrue(resultOK);
        }
    }

    [TestClass]
    public class BrickPatternTest
    {
        // 以下の項目はテストケースとして考えられるが、
        // 実際に yaml で記載することはないので省略する。
        // - Name が空
        // - Data が空

        [TestMethod]
        public void TestOkMinimal()
        {
            // 最小構成
            const string body = 
                @"
                - Name: Pattern1
                  Data: 
                  - 0101010101
                ";
            var brickPattern = BrickPatternReader.LoadYamlString(body);
            Assert.IsTrue(brickPattern.Patterns.Count == 1);
            Assert.IsTrue(brickPattern.Patterns[0].Name == "Pattern1");
            Assert.IsTrue(brickPattern.Patterns[0].Data.Count == 1);
            Assert.IsTrue(brickPattern.Patterns[0].Data[0].Length == 10);
            Assert.IsTrue(brickPattern.Patterns[0].Data[0] == "0101010101");
        }

        [TestMethod]
        public void TestOkSpace()
        {
            // 空白許容
            const string body =
                @"
                - Name: Pattern1
                  Data:
                  - 0101 0101 0  1
                ";
            var brickPattern = BrickPatternReader.LoadYamlString(body);
            Assert.IsTrue(brickPattern.Patterns.Count == 1);
            Assert.IsTrue(brickPattern.Patterns[0].Name == "Pattern1");
            Assert.IsTrue(brickPattern.Patterns[0].Data.Count == 1);
            Assert.IsTrue(brickPattern.Patterns[0].Data[0].Length == 10);
            Assert.IsTrue(brickPattern.Patterns[0].Data[0] == "0101010101");
        }

        [TestMethod]
        public void TestNgChar()
        {
            // 0/1 以外の文字は NG
            const string body =
                @"
                - Name: Pattern1
                  Data:
                  - 012ab10101
                ";
            Utils.CheckReturnException(() =>
            {
                var brickPattern = BrickPatternReader.LoadYamlString(body);
                return true;
            });
        }

        [TestMethod]
        public void TestNgStepLengthDiffer()
        {
            // Step 間で長さが異なった場合は NG
            const string body =
                @"
                - Name: Pattern1
                  Data:
                  - 0101010101
                  - 000000000
                ";
            Utils.CheckReturnException(() =>
            {
                var brickPattern = BrickPatternReader.LoadYamlString(body);
                return true;
            });
        }

        [TestMethod]
        public void TestOkCombination()
        {
            // Data 間で長さが異なった場合は NG
            const string body =
                @"
                - Name: Pattern1
                  Data:
                  - 0101010101
                  - 1010101010

                - Name: Pattern2
                  Data:
                  - 00000000 00
                  - 11 11111 11
                  - 00000 00000
                ";
            var brickPattern = BrickPatternReader.LoadYamlString(body);
            Assert.IsTrue(brickPattern.Patterns.Count == 2);

            Assert.IsTrue(brickPattern.Patterns[0].Name == "Pattern1");
            Assert.IsTrue(brickPattern.Patterns[0].Data.Count == 2);
            Assert.IsTrue(brickPattern.Patterns[0].Data[0].Length == 10);
            Assert.IsTrue(brickPattern.Patterns[0].Data[0] == "0101010101");
            Assert.IsTrue(brickPattern.Patterns[0].Data[1].Length == 10);
            Assert.IsTrue(brickPattern.Patterns[0].Data[1] == "1010101010");

            Assert.IsTrue(brickPattern.Patterns[0].Name == "Pattern2");
            Assert.IsTrue(brickPattern.Patterns[0].Data.Count == 3);
            Assert.IsTrue(brickPattern.Patterns[0].Data[0].Length == 10);
            Assert.IsTrue(brickPattern.Patterns[0].Data[0] == "0000000000");
            Assert.IsTrue(brickPattern.Patterns[0].Data[1].Length == 10);
            Assert.IsTrue(brickPattern.Patterns[0].Data[1] == "1111111111");
            Assert.IsTrue(brickPattern.Patterns[0].Data[1].Length == 10);
            Assert.IsTrue(brickPattern.Patterns[0].Data[1] == "0000000000");
        }
    }
}
