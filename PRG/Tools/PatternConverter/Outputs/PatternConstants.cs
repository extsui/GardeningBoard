/* Ç±ÇÃÉtÉ@ÉCÉãÇÕ PatternConverter Ç…ÇÊÇ¡Çƒé©ìÆê∂ê¨Ç≥ÇÍÇ‹ÇµÇΩ */
namespace PatternConstants
{
    public class Pattern
    {
        public enum class Grass : byte
        {
            AllOn = 0,
            AllOff = 1,
            LeftToRight1 = 2,
            RightToLeft1 = 3,
            LeftToRight3 = 4,
            RightToLeft3 = 5,
            BothEdgeToMiddle = 6,
            Vibration = 7,
            LeftToRightBuffer = 8,
            LeftToRightNeg = 9,
            RightToLeftNeg = 10,
            LeftToRightVertical = 11,
            RightToLeftVertical = 12,
        }

        public enum class House : byte
        {
            AllOn = 0,
            AllOff = 1,
            OneByOne = 2,
            Stream = 3,
        }

        public enum class Tile : byte
        {
            AllOn = 0,
            AllOff = 1,
            OneByOne = 2,
            Stream = 3,
        }

        public enum class Tree : byte
        {
            AllOn = 0,
            AllOff = 1,
            OneByOne = 2,
            TopToBottomHorizontal1 = 3,
            TopToBottomHorizontal3 = 4,
            TopToBottomBuffer = 5,
            UpperLeftToRight = 6,
            UpperRightToLeft = 7,
            LowerLeftToRight = 8,
            LowerRightToLeft = 9,
            Candle = 10,
        }
    }
}
