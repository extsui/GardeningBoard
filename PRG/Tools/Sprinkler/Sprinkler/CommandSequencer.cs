using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading.Tasks;

namespace Sprinkler
{
    /// <summary>
    /// 指定した時間後にコマンド実行するクラス
    /// </summary>
    public class CommandSequencer
    {
        // 本来は非公開で良いがデバッグ用のために公開
        public List<(int timing, Action command)> TimedEventList { get; private set; }

        // 登録されたイベントの開始時刻
        // これより以前の時刻のイベントは再生対象にならない
        private int? m_StartTime;

        public CommandSequencer()
        {
            TimedEventList = new List<(int, Action)>();
        }

        public void SetTimedEvent(int timing, Action command)
        {
            Trace.Assert(!m_StartTime.HasValue);
            TimedEventList.Add((timing, command));
        }

        public void FixTimedEvents()
        {
            FixTimedEvents(0);
        }

        public void FixTimedEvents(int startTiming)
        {
            Trace.Assert(!m_StartTime.HasValue);
            m_StartTime = startTiming;

            // 昇順に並び替え
            TimedEventList.Sort((a, b) => (a.timing - b.timing));
        }

        private int GetStartIndex()
        {
            // 開始タイミング以前のイベントはスキップ
            int startIndex = 0;
            foreach (var timedEvent in TimedEventList)
            {
                // startTiming で指定したタイミングのコマンドも実行されることを
                // 想定しているので必要なので < ではなく <= とする必要がある
                if (m_StartTime.Value <= timedEvent.timing)
                {
                    break;
                }
                startIndex++;
            }
            return startIndex;
        }

        // 実行が完了したら true、途中の場合は false が返る
        public IEnumerable<bool> RunAndWait()
        {
            Trace.Assert(m_StartTime.HasValue);

            int nowTime = Environment.TickCount - m_StartTime.Value;
            for (int i = GetStartIndex(); i < TimedEventList.Count; i++)
            {
                var timedEvent = TimedEventList[i];
                while (true)
                {
                    int spentTime = Environment.TickCount - nowTime;
                    if (spentTime > timedEvent.timing)
                    {
                        // コマンド自体が長時間のシーケンスの場合があるので非同期実行にする
                        Task.Run(() => timedEvent.command());
                        break;
                    }
                    yield return false;
                }
            }
            yield return true;
        }
    }
}
