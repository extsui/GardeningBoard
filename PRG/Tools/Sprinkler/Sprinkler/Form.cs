using System;
using System.Diagnostics;
using System.IO.Ports;
using System.Windows.Forms;

namespace Sprinkler
{
    public partial class Sprinkler : Form
    {
        private SerialPort m_serialPort;
        private InputConverter m_inputConverter;
        private SprinklerStatusBar m_statusBar;

        /// <summary>
        /// 通信開始時の時刻
        /// </summary>
        private int m_startTickCount;

        /// <summary>
        /// スクリプト開始時の時刻
        /// </summary>
        private int m_scriptStartTick;

        public Sprinkler()
        {
            InitializeComponent();
        }

        private void Sprinkler_Load(object sender, EventArgs e)
        {
            m_statusBar = new SprinklerStatusBar(this.statusStrip);
            var scripter = new GardenScripter(SerialSendAsync, SetScriptStartTick);
            m_inputConverter = new InputConverter(scripter, "microKEY-25");
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

            m_inputConverter.OnConnection();
        }

        private void buttonTest_Click(object sender, EventArgs e)
        {
            m_inputConverter.OnTestButton();
        }

        private void buttonDumpScript_Click(object sender, EventArgs e)
        {
            m_inputConverter.OnDumpScriptButton();
        }

        private void textBoxKeyInput_KeyDown(object sender, KeyEventArgs e)
        {
            m_inputConverter.OnKeyboardEvent(e.KeyCode);
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

                    // スクリプト形式でも同時に吐き出す
                    var script = line.Replace(PumpUtil.SendCommandHeader, "");
                    var tickInScript = tick - m_scriptStartTick;
                    textBoxScript.AppendText(string.Format("{0},{1}", tickInScript, script + "\r\n"));

                    m_statusBar.UpdateStatusBar();
                }
            }
        }

        /// <summary>
        /// スクリプトの記録を開始する
        /// </summary>
        private void SetScriptStartTick()
        {
            m_scriptStartTick = Environment.TickCount - m_startTickCount;
        }
    }

    internal class SprinklerStatusBar
    {
        /// <summary>
        /// シリアル送信回数のステータスバー表示用
        /// </summary>
        private ToolStripStatusLabel m_toolStripStatusSerialSendCount;
        private int m_serialSendCount;

        public SprinklerStatusBar(StatusStrip statusStrip)
        {
            // ステータスバー初期化
            m_serialSendCount = 0;
            m_toolStripStatusSerialSendCount = new ToolStripStatusLabel();
            statusStrip.Items.Add(m_toolStripStatusSerialSendCount);
            UpdateStatusBar();
        }

        public void UpdateStatusBar()
        {
            m_toolStripStatusSerialSendCount.Text = $"送信回数: {m_serialSendCount}";
            m_serialSendCount++;
        }
    }
}
