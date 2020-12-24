using Microsoft.VisualStudio.TestTools.UnitTesting;
using PatternEditor;

namespace PatternEditorTest
{
    [TestClass]
    public class BrickPatternTest
    {
        [TestMethod]
        public void TestMinimal()
        {
            // 最小構成
            const string body = 
                @"
                - Name: Pattern1
                  Data: 
                  - 0000000000
                ";
            var brickPattern = BrickPatternReader.LoadYamlString(body);
            Assert.IsTrue(brickPattern.Patterns.Count == 1);
            Assert.IsTrue(brickPattern.Patterns[0].Name == "Pattern1");
            Assert.IsTrue(brickPattern.Patterns[0].Data.Count == 1);
            Assert.IsTrue(brickPattern.Patterns[0].Data[0].Length == 10);
            Assert.IsTrue(brickPattern.Patterns[0].Data[0] == "0000000000");
        }

        [TestMethod]
        public void TestSpace()
        {
            // 空白許容
        }
    }
}
