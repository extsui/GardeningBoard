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
        public int GetTime(byte stepTiming)
        {
            return StepCount * stepTiming;
        }
    }

    // 以降はパターン定義
    public static class Grass
    {
        public static Pattern AllOn = new Pattern(0, 1);
        public static Pattern AllOff = new Pattern(1, 1);
        public static Pattern LeftToRight1 = new Pattern(2, 12);
        public static Pattern RightToLeft1 = new Pattern(3, 12);
        public static Pattern LeftToRight3 = new Pattern(4, 14);
        public static Pattern RightToLeft3 = new Pattern(5, 14);
        public static Pattern BothEdgeToMiddle = new Pattern(6, 12);
        public static Pattern Vibration = new Pattern(7, 2);
        public static Pattern LeftToRightBuffer = new Pattern(8, 134);
        public static Pattern LeftToRightNeg = new Pattern(9, 14);
        public static Pattern RightToLeftNeg = new Pattern(10, 14);
        public static Pattern LeftToRightVertical = new Pattern(11, 8);
        public static Pattern RightToLeftVertical = new Pattern(12, 8);
    }

    public static class House
    {
        public static Pattern AllOn = new Pattern(0, 1);
        public static Pattern AllOff = new Pattern(1, 1);
        public static Pattern OneByOne = new Pattern(2, 28);
        public static Pattern Stream = new Pattern(3, 54);
        public static Pattern OpenDoor = new Pattern(4, 11);
        public static Pattern CloseDoor = new Pattern(5, 11);
    }

    public static class Tile
    {
        public static Pattern AllOn = new Pattern(0, 1);
        public static Pattern AllOff = new Pattern(1, 1);
        public static Pattern OneByOne = new Pattern(2, 24);
        public static Pattern Stream = new Pattern(3, 48);
    }

    public static class Tree
    {
        public static Pattern AllOn = new Pattern(0, 1);
        public static Pattern AllOff = new Pattern(1, 1);
        public static Pattern OneByOne = new Pattern(2, 20);
        public static Pattern TopToBottomHorizontal1 = new Pattern(3, 8);
        public static Pattern TopToBottomHorizontal3 = new Pattern(4, 10);
        public static Pattern TopToBottomBuffer = new Pattern(5, 14);
        public static Pattern UpperLeftToRight = new Pattern(6, 6);
        public static Pattern UpperRightToLeft = new Pattern(7, 6);
        public static Pattern LowerLeftToRight = new Pattern(8, 6);
        public static Pattern LowerRightToLeft = new Pattern(9, 6);
        public static Pattern Candle = new Pattern(10, 22);
    }
}
