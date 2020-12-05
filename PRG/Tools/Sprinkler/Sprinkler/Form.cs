using System;
using System.Diagnostics;
using System.IO.Ports;
using System.Windows.Forms;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using System.Linq;

namespace Sprinkler
{
    public partial class Sprinkler : Form
    {
        /// <summary>
        /// シリアル送信回数のステータスバー表示用
        /// </summary>
        private ToolStripStatusLabel m_toolStripStatusSerialSendCount;
        private int m_serialSendCount;

        private void UpdateStatusBar()
        {
            m_toolStripStatusSerialSendCount.Text = $"送信回数: {m_serialSendCount}";
            m_serialSendCount++;
        }

        private Garden m_garden;
        private SerialPort m_serialPort;

        /// <summary>
        /// 通信開始時の時刻
        /// </summary>
        private int m_startTickCount;

        public Sprinkler()
        {
            InitializeComponent();
            m_garden = new Garden();
        }

        private void Sprinkler_Load(object sender, EventArgs e)
        {
            // ステータスバー初期化
            m_serialSendCount = 0;
            m_toolStripStatusSerialSendCount = new ToolStripStatusLabel();
            this.statusStrip.Items.Add(m_toolStripStatusSerialSendCount);
            UpdateStatusBar();
        }

        private void Sprinkler_FormClosed(object sender, FormClosedEventArgs e)
        {
            if (m_serialPort?.IsOpen ?? false)
            {
                m_serialPort.Close();
            }
        }

        private void buttonConnect_Click(object sender, EventArgs e)
        {
            // TODO: 選択式にする
            //var ports = SerialPort.GetPortNames();
            m_serialPort = new SerialPort("COM3", 115200, Parity.None, 8, StopBits.One);
            Trace.Assert(m_serialPort.IsOpen == false);

            m_serialPort.Open();
            m_startTickCount = Environment.TickCount;
        }

        private void buttonTest_Click(object sender, EventArgs e)
        {
            ExecuteTest();
        }

        private void textBoxKeyInput_KeyDown(object sender, KeyEventArgs e)
        {
            var table = new Dictionary<Keys, Action>
            {
                // 1 2 3 4 5 6 7 8 9 0 - ^ \
                //  q w e r t y u i o p @ [
                //   a s d f g h j k l ; : ]
                //    z x c v b n m , . / \
                { Keys.A, SampleSequence   },
                { Keys.S, SampleBrightness },
                { Keys.D, SampleStress     },
            };

            if (table.ContainsKey(e.KeyCode))
            {
                table[e.KeyCode]();
            }
        }

        private delegate void SafeCallDelegate(string value);

        /// <summary>
        /// 非同期シリアル送信
        /// 送信文字列はログ用のテキストボックスに出力される
        /// </summary>
        private void SerialSendAsync(string value)
        {
            // 他スレッドからも呼び出せるようにする定型句
            if (textBoxSerialLog.InvokeRequired)
            {
                var d = new SafeCallDelegate(SerialSendAsync);
                textBoxSerialLog.Invoke(d, new object[] { value });
            }
            else
            {
                // 処理本体
                // 複数行の場合は行単位に分割して送信する
                foreach (var line in value.Split('\n'))
                {
                    // "xxx\nyyy\n" --> [ "xxx", "yyy", "" ] に分割されるので末尾は無視
                    if (line == "")
                    {
                        continue;
                    }

                    var tick = Environment.TickCount - m_startTickCount;
                    var tickToSec = tick / 1000;
                    var tickToMsec = tick % 1000;
                    m_serialPort.Write(line + "\n");

                    // テキストボックスは "\r\n" しか改行と見なさないので置換
                    textBoxSerialLog.AppendText(string.Format("[{0}.{1:D03}] {2}", tickToSec, tickToMsec, line + "\r\n"));

                    UpdateStatusBar();
                }
            }
        }

        ////////////////////////////////////////////////////////////////////////////////
        //  コマンド部品
        ////////////////////////////////////////////////////////////////////////////////

        // TODO: 単独の TurnOn とかは Position, Target を引数にしたコマンドが欲しくなる
        // TODO: 輝度指定もあり?
        // TODO: PositionList の Not が欲しくなる
        // TODO: Formation 毎にコマンド群 (クラス?) を定義する必要がありそう? (今回であれば Hexagon 用)

        private void ExecuteCommand(List<string> commands)
        {
            Trace.Assert(commands != null);
            string line = String.Join("", commands);
            SerialSendAsync(line);
        }

        private void CommandRegister()
        {
            ExecuteCommand(m_garden.MakeRegisterCommand());
        }

        private void CommandTurnOffAll()
        {
            ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon_All, OperationTarget.Both, 1, 0, false));
        }

        private void CommandTurnOnAll()
        {
            ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon_All, OperationTarget.Both, 0, 0, false));
        }

        private void SequentialCommandTurnOnInHexagonForm()
        {
            var positionList = new List<Position>
            {
                Position.Hexagon_Up,
                Position.Hexagon_RightUp,
                Position.Hexagon_RightDown,
                Position.Hexagon_Down,
                Position.Hexagon_LeftDown,
                Position.Hexagon_LeftUp,
                Position.Hexagon_Center,
            };

            foreach (var position in positionList)
            {
                ExecuteCommand(m_garden.MakePatternCommand(position, OperationTarget.Both, 0, 0, false));
                Thread.Sleep(200);
            }
        }

        private void SequentialCommandTurnOffInHexagonForm()
        {
            var positionList = new List<Position>
            {
                Position.Hexagon_Up,
                Position.Hexagon_RightUp,
                Position.Hexagon_RightDown,
                Position.Hexagon_Down,
                Position.Hexagon_LeftDown,
                Position.Hexagon_LeftUp,
                Position.Hexagon_Center,
            };

            foreach (var position in positionList)
            {
                ExecuteCommand(m_garden.MakePatternCommand(position, OperationTarget.Both, 1, 0, false));
                Thread.Sleep(200);
            }
        }

        private void CommandTurnOnInTriangleForm()
        {
            var TrianglePosition = new List<Position> { Position.Hexagon_Up, Position.Hexagon_RightDown, Position.Hexagon_LeftDown };
            ExecuteCommand(m_garden.MakePatternCommand(TrianglePosition, OperationTarget.TileOnly, 0, 0, false));
        }

        private void CommandTurnOnInReverseTriangleForm()
        {
            var ReverseTrianglePosition = new List<Position> { Position.Hexagon_Down, Position.Hexagon_LeftUp, Position.Hexagon_RightUp };
            ExecuteCommand(m_garden.MakePatternCommand(ReverseTrianglePosition, OperationTarget.TileOnly, 0, 0, false));
        }

        private void SequentialCommandOneShotSmoothly(Position position, OperationTarget target, int delayMsec)
        {
            ExecuteCommand(m_garden.MakePatternCommand(position, target, 0, 0, false));

            ExecuteCommand(m_garden.MakeBrightnessCommand(position, target, 1));
            Thread.Sleep(delayMsec);
            ExecuteCommand(m_garden.MakeBrightnessCommand(position, target, 2));
            Thread.Sleep(delayMsec);
            ExecuteCommand(m_garden.MakeBrightnessCommand(position, target, 3));
            Thread.Sleep(delayMsec);
            ExecuteCommand(m_garden.MakeBrightnessCommand(position, target, 2));
            Thread.Sleep(delayMsec);
            ExecuteCommand(m_garden.MakeBrightnessCommand(position, target, 1));
            Thread.Sleep(delayMsec);

            ExecuteCommand(m_garden.MakePatternCommand(position, target, 1, 0, false));
        }

        ////////////////////////////////////////////////////////////////////////////////
        //  統合コマンド
        ////////////////////////////////////////////////////////////////////////////////

        private async void ExecuteTest()
        {
            // TODO: コマンド間の待ち時間を可変にしたい
            // TODO: パターンの指定なども色々外注入にしたい
            // TODO: 複数の Position を同時に制御したい (これは Garden 側で要対応案件)
            await Task.Run(() =>
            {
                CommandRegister();
                CommandTurnOffAll();
                CommandTurnOnAll();
                Thread.Sleep(1000);
                CommandTurnOffAll();
                Thread.Sleep(1000);
                SequentialCommandTurnOnInHexagonForm();
                Thread.Sleep(1000);
                SequentialCommandTurnOffInHexagonForm();
            });
        }

        private async void SampleSequence()
        {
            await Task.Run(() =>
            {
                CommandRegister();
                for (int i = 0; i < 10; i++)
                {
                    CommandTurnOnInTriangleForm();
                    Thread.Sleep(500);
                    CommandTurnOffAll();
                    CommandTurnOnInReverseTriangleForm();
                    Thread.Sleep(500);
                    CommandTurnOffAll();
                }
            });
        }

        private async void SampleBrightness()
        {
            var positions = new List<Position>
            {
                Position.Hexagon_Center,
                Position.Hexagon_Up,
                Position.Hexagon_RightUp,
                Position.Hexagon_RightDown,
                Position.Hexagon_Down,
                Position.Hexagon_LeftDown,
                Position.Hexagon_LeftUp,
            };

            await Task.Run(() =>
            {
                CommandRegister();
                foreach (var position in positions)
                {
                    SequentialCommandOneShotSmoothly(position, OperationTarget.TileOnly, 50);
                    Thread.Sleep(50);
                    SequentialCommandOneShotSmoothly(position, OperationTarget.InsertedOnly, 50);
                    Thread.Sleep(50);
                }
                foreach (var position in positions.AsEnumerable().Reverse())
                {
                    SequentialCommandOneShotSmoothly(position, OperationTarget.Both, 50);
                    Thread.Sleep(200);
                }
            });
        }

        private async void SampleStress()
        {
            // [性能メモ]
            // - 送信回数: 28014 (回)
            // - 経過時間: 55.5  (秒)
            // - 115200bps で帯域占有が約 70 %
            // - I2C バスは帯域余ってるっぽいので
            //   シリアル通信速度を上げるのが吉
            await Task.Run(() =>
            {
                CommandRegister();
                for (int i = 0; i < 1000; i++)
                {
                    CommandTurnOffAll();
                    CommandTurnOnAll();
                }
            });
        }
    }
}
