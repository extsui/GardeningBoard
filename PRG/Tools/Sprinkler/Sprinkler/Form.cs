using System;
using System.Diagnostics;
using System.IO.Ports;
using System.Windows.Forms;
using System.Collections.Generic;

using System.Threading;
using System.Threading.Tasks;
using System.Linq;
using Midi;

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

        private Summarizer m_summarizer;

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

            //////////////////////////////////////////////////////////////
            //  MIDI 実験
            //////////////////////////////////////////////////////////////
            foreach (var device in InputDevice.InstalledDevices)
            {
                textBoxSerialLog.AppendText(string.Format($"{device.Name}\r\n"));
            }

            var inputDevice = InputDevice.InstalledDevices.ToList().Find(dev => dev.Name == "microKEY-25");
            inputDevice.Open();
            inputDevice.StartReceiving(null);

            m_summarizer = new Summarizer(inputDevice, m_scripter);
        }

        public class Summarizer
        {
            private GardenScripter m_scripter;

            public Summarizer(InputDevice inputDevice, GardenScripter scripter)
            {
                m_scripter = scripter;
                this.inputDevice = inputDevice;
                inputDevice.NoteOn += new InputDevice.NoteOnHandler(this.NoteOn);
                inputDevice.NoteOff += new InputDevice.NoteOffHandler(this.NoteOff);
            }

            private async void NoteEventHandler(Pitch pitch, bool isPressed)
            {
                await Task.Run(() =>
                {
                    // TODO: ベロシティを使う

                    int octave = pitch.Octave();
                    char scale = pitch.NotePreferringSharps().Letter;

                    var ScaleToPosition = new Dictionary<char, uint>
                    {
                        { 'C', Position.Hexagon.LeftUp    },
                        { 'D', Position.Hexagon.Up        },
                        { 'E', Position.Hexagon.RightUp   },
                        { 'F', Position.Hexagon.Center    },
                        { 'G', Position.Hexagon.LeftDown  },
                        { 'A', Position.Hexagon.Down      },
                        { 'B', Position.Hexagon.RightDown },
                    };

                    var OctaveToTarget = new Dictionary<int, OperationTarget>
                    {
                        { 3, OperationTarget.TileOnly     },
                        { 4, OperationTarget.InsertedOnly },
                    };

                    var position = ScaleToPosition[scale];

                    OperationTarget target;
                    if (OctaveToTarget.ContainsKey(octave))
                    {
                        target = OctaveToTarget[octave];
                    }
                    else
                    {
                        target = OperationTarget.Both;
                    }

                    if (isPressed)
                    {
                        m_scripter.SequentialCommandTurnOnSmoothly(position, target, 30);
                    }
                    else
                    {
                        m_scripter.SequentialCommandTurnOffSmoothly(position, target, 30);
                    }
                });
            }

            public void NoteOn(NoteOnMessage msg)
            {
                lock (this)
                {
                    NoteEventHandler(msg.Pitch, true);
                }
            }

            public void NoteOff(NoteOffMessage msg)
            {
                lock (this)
                {
                    NoteEventHandler(msg.Pitch, false);
                }
            }

            private InputDevice inputDevice;
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
