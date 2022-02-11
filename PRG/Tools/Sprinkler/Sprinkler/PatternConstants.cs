/* このファイルは PatternConverter によって自動生成されました */
public static class PatternConstants
{
    public struct Pattern
    {
        public byte Id { get; private set; }
        public byte StepCount { get; private set; }

        public Pattern(byte id, byte stepCount)
        {
            Id = id;
            StepCount = stepCount;
        }

        // パターン終了までにかかる時間の取得(ミリ秒)
        public int GetTime(ushort stepTiming)
        {
            return StepCount * stepTiming;
        }
    }

    // 以降はパターン定義
    public static class Grass
    {
        public static Pattern AllOn = new Pattern(0, 1);
        public static Pattern AllOff = new Pattern(1, 1);
        public static Pattern OutsideOn = new Pattern(2, 1);
        public static Pattern Vibration = new Pattern(3, 2);
        public static Pattern LeftToRight1 = new Pattern(4, 12);
        public static Pattern RightToLeft1 = new Pattern(5, 12);
        public static Pattern LeftToRight3 = new Pattern(6, 14);
        public static Pattern RightToLeft3 = new Pattern(7, 14);
        public static Pattern BothEdgeToMiddle = new Pattern(8, 12);
        public static Pattern MiddleToBothEdge = new Pattern(9, 12);
        public static Pattern LeftToRightNeg = new Pattern(10, 14);
        public static Pattern RightToLeftNeg = new Pattern(11, 14);
        public static Pattern LeftToRightVertical1 = new Pattern(12, 10);
        public static Pattern RightToLeftVertical1 = new Pattern(13, 10);
        public static Pattern LeftToRightVertical3 = new Pattern(14, 12);
        public static Pattern RightToLeftVertical3 = new Pattern(15, 12);
        public static Pattern BottomToTop = new Pattern(16, 4);
        public static Pattern TopToBottom = new Pattern(17, 4);
        public static Pattern Explosion = new Pattern(18, 6);
        public static Pattern Implosion = new Pattern(19, 6);
        public static Pattern LeftToRightBlock = new Pattern(20, 4);
        public static Pattern RightToLeftBlock = new Pattern(21, 4);
    }

    public static class House
    {
        public static Pattern AllOn = new Pattern(0, 1);
        public static Pattern AllOff = new Pattern(1, 1);
        public static Pattern OutsideOn = new Pattern(2, 1);
        public static Pattern OneByOne = new Pattern(3, 28);
        public static Pattern Stream = new Pattern(4, 54);
        public static Pattern OpenDoor = new Pattern(5, 10);
        public static Pattern CloseDoor = new Pattern(6, 10);
        public static Pattern BottomToTop = new Pattern(7, 5);
        public static Pattern TopToBottom = new Pattern(8, 5);
        public static Pattern SpreadFromBottomPoint = new Pattern(9, 12);
        public static Pattern ShrinkFromTopPoint = new Pattern(10, 13);
        public static Pattern ShootingStar = new Pattern(11, 14);
        public static Pattern Pseudo3dRotation = new Pattern(12, 68);
    }

    public static class Tile
    {
        public static Pattern AllOn = new Pattern(0, 1);
        public static Pattern AllOff = new Pattern(1, 1);
        public static Pattern OneByOne = new Pattern(2, 25);
        public static Pattern Stream = new Pattern(3, 48);
        public static Pattern BackToFrontSpreadly = new Pattern(4, 12);
        public static Pattern FrontToBackSpreadly = new Pattern(5, 12);
        public static Pattern FrontToBack = new Pattern(6, 15);
        public static Pattern BackToFront = new Pattern(7, 15);
        public static Pattern RightToLeft = new Pattern(8, 15);
        public static Pattern LeftToRight = new Pattern(9, 15);
        public static Pattern Circle_Led3Point1 = new Pattern(10, 24);
        public static Pattern Circle_Led3Point2 = new Pattern(11, 12);
        public static Pattern Circle_Led2Point3 = new Pattern(12, 8);
        public static Pattern Circle_Led3Point3 = new Pattern(13, 8);
        public static Pattern Circle_Led1Point6 = new Pattern(14, 4);
        public static Pattern Circle_Led2Point6 = new Pattern(15, 4);
        public static Pattern Circle_Led3Point6 = new Pattern(16, 4);
        public static Pattern Cross = new Pattern(17, 26);
    }

    public static class Tree
    {
        public static Pattern AllOn = new Pattern(0, 1);
        public static Pattern AllOff = new Pattern(1, 1);
        public static Pattern OutsideOn = new Pattern(2, 1);
        public static Pattern OneByOne = new Pattern(3, 20);
        public static Pattern TopToBottomHorizontal1 = new Pattern(4, 8);
        public static Pattern TopToBottomHorizontal3 = new Pattern(5, 10);
        public static Pattern TopToBottomBuffer = new Pattern(6, 14);
        public static Pattern UpperLeftToRight = new Pattern(7, 8);
        public static Pattern UpperRightToLeft = new Pattern(8, 8);
        public static Pattern LowerLeftToRight = new Pattern(9, 8);
        public static Pattern LowerRightToLeft = new Pattern(10, 8);
        public static Pattern LeftToRight = new Pattern(11, 12);
        public static Pattern RightToLeft = new Pattern(12, 12);
        public static Pattern MiddleToBothEdge = new Pattern(13, 8);
        public static Pattern Candle = new Pattern(14, 22);
        public static Pattern BottomToTop = new Pattern(15, 11);
        public static Pattern Wave = new Pattern(16, 14);
        public static Pattern Explosion = new Pattern(17, 10);
        public static Pattern Implosion = new Pattern(18, 10);
    }
}
