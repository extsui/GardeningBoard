using System;
using System.Diagnostics;
using System.IO.Ports;
using System.Windows.Forms;
using System.Collections.Generic;

using System.Threading;
using System.Threading.Tasks;

namespace Sprinkler
{
    public partial class Sprinkler : Form
    {
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

        private async void ExecuteTest()
        {
            // TODO: コマンド間の待ち時間を可変にしたい
            // TODO: パターンの指定なども色々外注入にしたい
            // TODO: 複数の Position を同時に制御したい (これは Garden 側で要対応案件)

            Action register = () =>
            {
                var registerCommands = m_garden.MakeRegisterCommand();
                SerialSendAsync(String.Join("", registerCommands));
            };

            Action turnOffAll = () =>
            {
                // TODO: OperationTarget は無視されるのでオーバーロードで引数無し版を作るべき
                var operationCommands = m_garden.MakeOperationCommand(Position.Hexagon_All, OperationTarget.Both, 1, 0, false);
                SerialSendAsync(String.Join("", operationCommands));
            };

            Action turnOnAll = () =>
            {
                // TODO: OperationTarget は無視されるのでオーバーロードで引数無し版を作るべき
                var operationCommands = m_garden.MakeOperationCommand(Position.Hexagon_All, OperationTarget.Both, 0, 0, false);
                SerialSendAsync(String.Join("", operationCommands));
            };

            Action sequentialTurnOn = () =>
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
                    var operationCommands = m_garden.MakeOperationCommand(position, OperationTarget.Both, 0, 0, false);
                    SerialSendAsync(String.Join("", operationCommands));
                    Thread.Sleep(200);
                }
            };

            Action sequentialTurnOff = () =>
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
                    var operationCommands = m_garden.MakeOperationCommand(position, OperationTarget.Both, 1, 0, false);
                    SerialSendAsync(String.Join("", operationCommands));
                    Thread.Sleep(200);
                }
            };

            await Task.Run(() =>
            {
                register();
                turnOffAll();
                turnOnAll();
                Thread.Sleep(1000);
                turnOffAll();
                Thread.Sleep(1000);
                sequentialTurnOn();
                Thread.Sleep(1000);
                sequentialTurnOff();
            });
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
                }
            }
        }
    }
}
