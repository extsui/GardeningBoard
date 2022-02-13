using System;
using System.Diagnostics;

namespace Sprinkler
{
    /// <summary>
    /// GardeningBoard 用の曲クラス
    /// </summary>
    public class GardenMusic
    {
        // 曲のテンポ
        // 整数だと合わない場合があるので浮動小数
        public double Tempo { get; private set; }

        // 曲の小節数 (1～)
        public int BarCount { get; private set; }

        // 曲再生タイミング遅延 (ミリ秒)
        // - 曲の頭の無音区間も含む
        // - PC 環境ごとに再設定が必要かも
        public int PlayStartOffsetMilliSeconds { get; private set; }

        public GardenMusic(double tempo, int barCount, int playStartOffsetMilliSeconds)
        {
            Tempo = tempo;
            BarCount = barCount;
            PlayStartOffsetMilliSeconds = playStartOffsetMilliSeconds;
        }

        // 小節内のタイミング
        // - 2分音符  : half note
        // - 4分音符  : quarter note
        // - 8分音符  : eighth note
        // - 16分音符 : sixteenth note
        // 1  |1               |
        // 2  |1       2       |
        // 4  |1   2   3   4   |
        // 8  |1 2 3 4 5 6 7 8 |
        // 16 |123456789.......|
        private int AllNoteTiming => (int)((60 / Tempo * 4) * 1000);
        private int HalfNoteTiming => (int)((60 / Tempo * 2) * 1000);
        private int QuarterNoteTiming => (int)((60 / Tempo) * 1000);
        private int EightNoteTiming => (int)((60 / Tempo / 2) * 1000);
        private int SixteenthNoteTiming => (int)((60 / Tempo / 4) * 1000);

        // 小節の開始時間 (秒・浮動小数) の取得
        // オフセット考慮無しであることに注意
        private double GetBarTime(int barNumber)
        {
            Trace.Assert(barNumber >= 1);
            return (((barNumber - 1) * 4) / Tempo) * 60;
        }

        // 曲の中のノーツ時間の取得 (ミリ秒)
        public int GetNoteTime(int barNumber, int beat, int noteNumber)
        {
            Trace.Assert(noteNumber >= 1);

            // 小節開始時刻
            int barTiming = (int)(GetBarTime(barNumber) * 1000 + PlayStartOffsetMilliSeconds);

            switch (beat)
            {
                case 1:
                    return barTiming + AllNoteTiming * (noteNumber - 1);
                case 2:
                    return barTiming + HalfNoteTiming * (noteNumber - 1);
                case 4:
                    return barTiming + QuarterNoteTiming * (noteNumber - 1);
                case 8:
                    return barTiming + EightNoteTiming * (noteNumber - 1);
                case 16:
                    return barTiming + SixteenthNoteTiming * (noteNumber - 1);
                default:
                    throw new NotSupportedException("");
            }
        }

        // 小節開始時間
        public int GetNoteTime(int barNumber)
        {
            return GetNoteTime(barNumber, 1, 1);
        }

        // 1音の長さの取得 (ミリ秒)
        // - 例1: beat=8, notes=1 --> 8分音符1個分
        // - 例2: beat=4, notes=3 --> 4分音符3個分
        public int GetNoteLengthTime(int beat, int notes)
        {
            int begin = GetNoteTime(1, beat, 1);
            int end = GetNoteTime(1, beat, notes + 1);
            return end - begin;
        }
    }
}
