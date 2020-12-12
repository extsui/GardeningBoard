using System;
using System.Diagnostics;
using System.IO.Ports;
using System.Windows.Forms;
using System.Collections.Generic;

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

        private SerialPort m_serialPort;
        private GardenScripter m_scripter;

        /// <summary>
        /// 通信開始時の時刻
        /// </summary>
        private int m_startTickCount;

        public Sprinkler()
        {
            InitializeComponent();
            m_scripter = new GardenScripter(SerialSendAsync);
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
            m_scripter.ExecuteTest();
        }

        private void textBoxKeyInput_KeyDown(object sender, KeyEventArgs e)
        {
            var table = new Dictionary<Keys, Action>
            {
                // 1 2 3 4 5 6 7 8 9 0 - ^ \
                //  q w e r t y u i o p @ [
                //   a s d f g h j k l ; : ]
                //    z x c v b n m , . / \
                { Keys.A, m_scripter.SampleSequence   },
                { Keys.S, m_scripter.SampleBrightness },
                { Keys.D, m_scripter.SampleStress     },
                { Keys.F, m_scripter.SampleCircle     },
                { Keys.G, m_scripter.InternalMultiThreadTest },
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
    }
}
