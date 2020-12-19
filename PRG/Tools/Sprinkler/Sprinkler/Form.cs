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

            private async void NoteEventHandler(Pitch pitch, bool isPressed, int velocity = 0)
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
                    NoteEventHandler(msg.Pitch, true, msg.Velocity);
                }
            }

            public void NoteOff(NoteOffMessage msg)
            {
                lock (this)
                {
                    NoteEventHandler(msg.Pitch, false);
                }
            }

            // TODO: Velocity を保持するためのリストが必要な気がする。
            //       NoteOff の時に輝度の降下率を NoteOn と合わせるために。
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

            // TORIAEZU: 輝度実験用。後で消す
            m_scripter.CommandRegister();
            m_scripter.CommandTurnOnAll();
        }

        private void buttonTest_Click(object sender, EventArgs e)
        {
            m_scripter.ExecuteTest();
        }

        // ファンクション行
        private void KeyDownHandlerF1()           { m_scripter.SampleSequence();          }
        private void KeyDownHandlerF2()           { m_scripter.SampleBrightness();        }
        private void KeyDownHandlerF3()           { m_scripter.SampleStress();            }
        private void KeyDownHandlerF4()           { m_scripter.SampleCircle();            }
        private void KeyDownHandlerF5()           { m_scripter.InternalMultiThreadTest(); }
        private void KeyDownHandlerF6()           { m_scripter.ScenarioShootingStar();    }
        private void KeyDownHandlerF7()           {  }
        private void KeyDownHandlerF8()           {  }
        private void KeyDownHandlerF9()           {  }
        private void KeyDownHandlerF10()          {  }
        private void KeyDownHandlerF11()          {  }
        private void KeyDownHandlerF12()          {  }
        // 1234 行
        private void KeyDownHandler1()             { m_scripter.CommandBrightness(Position.Hexagon.Up, OperationTarget.TileOnly,  0); }
        private void KeyDownHandler2()             { m_scripter.CommandBrightness(Position.Hexagon.Up, OperationTarget.TileOnly,  1); }
        private void KeyDownHandler3()             { m_scripter.CommandBrightness(Position.Hexagon.Up, OperationTarget.TileOnly,  2); }
        private void KeyDownHandler4()             { m_scripter.CommandBrightness(Position.Hexagon.Up, OperationTarget.TileOnly,  3); }
        private void KeyDownHandler5()             { m_scripter.CommandBrightness(Position.Hexagon.Up, OperationTarget.TileOnly,  4); }
        private void KeyDownHandler6()             { m_scripter.CommandBrightness(Position.Hexagon.Up, OperationTarget.TileOnly,  5); }
        private void KeyDownHandler7()             { m_scripter.CommandBrightness(Position.Hexagon.Up, OperationTarget.TileOnly,  6); }
        private void KeyDownHandler8()             { m_scripter.CommandBrightness(Position.Hexagon.Up, OperationTarget.TileOnly,  7); }
        private void KeyDownHandler9()             { m_scripter.CommandBrightness(Position.Hexagon.Up, OperationTarget.TileOnly,  8); }
        private void KeyDownHandler0()             { m_scripter.CommandBrightness(Position.Hexagon.Up, OperationTarget.TileOnly,  9); }
        private void KeyDownHandlerMinus()         { m_scripter.CommandBrightness(Position.Hexagon.Up, OperationTarget.TileOnly, 10); }
        private void KeyDownHandlerHat()           { m_scripter.CommandBrightness(Position.Hexagon.Up, OperationTarget.TileOnly, 11); }
        private void KeyDownHandlerBar()           { m_scripter.CommandBrightness(Position.Hexagon.Up, OperationTarget.TileOnly, 12); }
        // QWER 行
        private void KeyDownHandlerQ()             { m_scripter.CommandBrightness(Position.Hexagon.RightUp, OperationTarget.TileOnly,  0); }
        private void KeyDownHandlerW()             { m_scripter.CommandBrightness(Position.Hexagon.RightUp, OperationTarget.TileOnly,  1); }
        private void KeyDownHandlerE()             { m_scripter.CommandBrightness(Position.Hexagon.RightUp, OperationTarget.TileOnly,  2); }
        private void KeyDownHandlerR()             { m_scripter.CommandBrightness(Position.Hexagon.RightUp, OperationTarget.TileOnly,  3); }
        private void KeyDownHandlerT()             { m_scripter.CommandBrightness(Position.Hexagon.RightUp, OperationTarget.TileOnly,  4); }
        private void KeyDownHandlerY()             { m_scripter.CommandBrightness(Position.Hexagon.RightUp, OperationTarget.TileOnly,  5); }
        private void KeyDownHandlerU()             { m_scripter.CommandBrightness(Position.Hexagon.RightUp, OperationTarget.TileOnly,  6); }
        private void KeyDownHandlerI()             { m_scripter.CommandBrightness(Position.Hexagon.RightUp, OperationTarget.TileOnly,  7); }
        private void KeyDownHandlerO()             { m_scripter.CommandBrightness(Position.Hexagon.RightUp, OperationTarget.TileOnly,  8); }
        private void KeyDownHandlerP()             { m_scripter.CommandBrightness(Position.Hexagon.RightUp, OperationTarget.TileOnly,  9); }
        private void KeyDownHandlerAt()            { m_scripter.CommandBrightness(Position.Hexagon.RightUp, OperationTarget.TileOnly, 10); }
        private void KeyDownHandlerOpenBrackets()  { m_scripter.CommandBrightness(Position.Hexagon.RightUp, OperationTarget.TileOnly, 11); }
        // ASDF 行
        private void KeyDownHandlerA()             { m_scripter.CommandBrightness(Position.Hexagon.RightDown, OperationTarget.TileOnly,  0);  }
        private void KeyDownHandlerS()             { m_scripter.CommandBrightness(Position.Hexagon.RightDown, OperationTarget.TileOnly,  1);  }
        private void KeyDownHandlerD()             { m_scripter.CommandBrightness(Position.Hexagon.RightDown, OperationTarget.TileOnly,  2);  }
        private void KeyDownHandlerF()             { m_scripter.CommandBrightness(Position.Hexagon.RightDown, OperationTarget.TileOnly,  3);  }
        private void KeyDownHandlerG()             { m_scripter.CommandBrightness(Position.Hexagon.RightDown, OperationTarget.TileOnly,  4);  }
        private void KeyDownHandlerH()             { m_scripter.CommandBrightness(Position.Hexagon.RightDown, OperationTarget.TileOnly,  5);  }
        private void KeyDownHandlerJ()             { m_scripter.CommandBrightness(Position.Hexagon.RightDown, OperationTarget.TileOnly,  6);  }
        private void KeyDownHandlerK()             { m_scripter.CommandBrightness(Position.Hexagon.RightDown, OperationTarget.TileOnly,  7);  }
        private void KeyDownHandlerL()             { m_scripter.CommandBrightness(Position.Hexagon.RightDown, OperationTarget.TileOnly,  8);  }
        private void KeyDownHandlerSemiColon()     { m_scripter.CommandBrightness(Position.Hexagon.RightDown, OperationTarget.TileOnly,  9);  }
        private void KeyDownHandlerColon()         { m_scripter.CommandBrightness(Position.Hexagon.RightDown, OperationTarget.TileOnly, 10);  }
        private void KeyDownHandlerCloseBrackets() { m_scripter.CommandBrightness(Position.Hexagon.RightDown, OperationTarget.TileOnly, 11);  }
        // ZXCV 行
        private void KeyDownHandlerZ()             { m_scripter.CommandBrightness(Position.Hexagon.Down, OperationTarget.TileOnly,  0); }
        private void KeyDownHandlerX()             { m_scripter.CommandBrightness(Position.Hexagon.Down, OperationTarget.TileOnly,  1); }
        private void KeyDownHandlerC()             { m_scripter.CommandBrightness(Position.Hexagon.Down, OperationTarget.TileOnly,  2); }
        private void KeyDownHandlerV()             { m_scripter.CommandBrightness(Position.Hexagon.Down, OperationTarget.TileOnly,  3); }
        private void KeyDownHandlerB()             { m_scripter.CommandBrightness(Position.Hexagon.Down, OperationTarget.TileOnly,  4); }
        private void KeyDownHandlerN()             { m_scripter.CommandBrightness(Position.Hexagon.Down, OperationTarget.TileOnly,  5); }
        private void KeyDownHandlerM()             { m_scripter.CommandBrightness(Position.Hexagon.Down, OperationTarget.TileOnly,  6); }
        private void KeyDownHandlerComma()         { m_scripter.CommandBrightness(Position.Hexagon.Down, OperationTarget.TileOnly,  7); }
        private void KeyDownHandlerPeriod()        { m_scripter.CommandBrightness(Position.Hexagon.Down, OperationTarget.TileOnly,  8); }
        private void KeyDownHandlerQuestion()      { m_scripter.CommandBrightness(Position.Hexagon.Down, OperationTarget.TileOnly,  9); }
        private void KeyDownHandlerUnderBar()      { m_scripter.CommandBrightness(Position.Hexagon.Down, OperationTarget.TileOnly, 10); }
        // その他
        private void KeyDownHandlerDelete()        { m_scripter.CommandTurnOffAll(); }
        private void KeyDownHandlerEnter()         { m_scripter.CommandTurnOnAll();  }

        private void textBoxKeyInput_KeyDown(object sender, KeyEventArgs e)
        {
            var table = new Dictionary<Keys, Action>
            {
                { Keys.F1,              KeyDownHandlerF1            },  // F1
                { Keys.F2,              KeyDownHandlerF2            },  // F2
                { Keys.F3,              KeyDownHandlerF3            },  // F3
                { Keys.F4,              KeyDownHandlerF4            },  // F4
                { Keys.F5,              KeyDownHandlerF5            },  // F5
                { Keys.F6,              KeyDownHandlerF6            },  // F6
                { Keys.F7,              KeyDownHandlerF7            },  // F7
                { Keys.F8,              KeyDownHandlerF8            },  // F8
                { Keys.F9,              KeyDownHandlerF9            },  // F9
                { Keys.F10,             KeyDownHandlerF10           },  // F10
                { Keys.F11,             KeyDownHandlerF11           },  // F11
                { Keys.F12,             KeyDownHandlerF12           },  // F12

                { Keys.D1,              KeyDownHandler1             },  // 1
                { Keys.D2,              KeyDownHandler2             },  // 2
                { Keys.D3,              KeyDownHandler3             },  // 3
                { Keys.D4,              KeyDownHandler4             },  // 4
                { Keys.D5,              KeyDownHandler5             },  // 5
                { Keys.D6,              KeyDownHandler6             },  // 6
                { Keys.D7,              KeyDownHandler7             },  // 7
                { Keys.D8,              KeyDownHandler8             },  // 8
                { Keys.D9,              KeyDownHandler9             },  // 9
                { Keys.D0,              KeyDownHandler0             },  // 0
                { Keys.OemMinus,        KeyDownHandlerMinus         },  // -
                { Keys.Oem7,            KeyDownHandlerHat           },  // ^
                { Keys.Oem5,            KeyDownHandlerBar           },  // |
                
                { Keys.Q,               KeyDownHandlerQ             },  // q
                { Keys.W,               KeyDownHandlerW             },  // w
                { Keys.E,               KeyDownHandlerE             },  // e
                { Keys.R,               KeyDownHandlerR             },  // r
                { Keys.T,               KeyDownHandlerT             },  // t
                { Keys.Y,               KeyDownHandlerY             },  // y
                { Keys.U,               KeyDownHandlerU             },  // u
                { Keys.I,               KeyDownHandlerI             },  // i
                { Keys.O,               KeyDownHandlerO             },  // o
                { Keys.P,               KeyDownHandlerP             },  // p
                { Keys.Oemtilde,        KeyDownHandlerAt            },  // @
                { Keys.OemOpenBrackets, KeyDownHandlerOpenBrackets  },  // [
                
                { Keys.A,               KeyDownHandlerA             },  // a
                { Keys.S,               KeyDownHandlerS             },  // s
                { Keys.D,               KeyDownHandlerD             },  // d
                { Keys.F,               KeyDownHandlerF             },  // f
                { Keys.G,               KeyDownHandlerG             },  // g
                { Keys.H,               KeyDownHandlerH             },  // h
                { Keys.J,               KeyDownHandlerJ             },  // j
                { Keys.K,               KeyDownHandlerK             },  // k
                { Keys.L,               KeyDownHandlerL             },  // l
                { Keys.Oemplus,         KeyDownHandlerSemiColon     },  // ;
                { Keys.Oem1,            KeyDownHandlerColon         },  // :
                { Keys.Oem6,            KeyDownHandlerCloseBrackets },  // ]
                
                { Keys.Z,               KeyDownHandlerZ             },  // z
                { Keys.X,               KeyDownHandlerX             },  // x
                { Keys.C,               KeyDownHandlerC             },  // c
                { Keys.V,               KeyDownHandlerV             },  // v
                { Keys.B,               KeyDownHandlerB             },  // b
                { Keys.N,               KeyDownHandlerN             },  // n
                { Keys.M,               KeyDownHandlerM             },  // m
                { Keys.Oemcomma,        KeyDownHandlerComma         },  // ,
                { Keys.OemPeriod,       KeyDownHandlerPeriod        },  // .
                { Keys.OemQuestion,     KeyDownHandlerQuestion      },  // ?
                { Keys.OemBackslash,    KeyDownHandlerUnderBar      },  // _

                { Keys.Delete,          KeyDownHandlerDelete        },  // DEL
                { Keys.Enter,           KeyDownHandlerEnter         },  // Enter
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
