using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using Midi;

namespace Sprinkler
{
    /// <summary>
    /// キーボード入力と MIDI 鍵盤入力をシナリオに変換するクラス
    /// </summary>
    public class InputConverter
    {
        private GardenScripter m_scripter;

        // TODO: Velocity を保持するためのリストが必要な気がする。
        //       NoteOff の時に輝度の降下率を NoteOn と合わせるために。
        private InputDevice m_inputDevice;

        public InputConverter(GardenScripter scripter, string midiInputDeviceName)
        {
            m_scripter = scripter;

            // TODO: MIDI デバイスが刺さってない場合に落ちないようにする
            // TORIAEZU: 暫定でコメントアウト (よろしくない)
            /*
            // DEBUG: MIDI デバイス表示
            foreach (var device in InputDevice.InstalledDevices)
            {
                Console.WriteLine(string.Format($"{device.Name}\r\n"));
            }

            var inputDevice = InputDevice.InstalledDevices.ToList().Find(dev => dev.Name == midiInputDeviceName);
            inputDevice.Open();
            inputDevice.StartReceiving(null);

            inputDevice.NoteOn  += new InputDevice.NoteOnHandler(this.OnNoteOn);
            inputDevice.NoteOff += new InputDevice.NoteOffHandler(this.OnNoteOff);
            
            m_inputDevice = inputDevice;
            */
        }

        ////////////////////////////////////////////////////////////////////////////////
        //  UI 関連
        ////////////////////////////////////////////////////////////////////////////////

        public void OnConnection()
        {
            m_scripter.CommandRegister();
            m_scripter.CommandTurnOnAll();
        }

        public void OnTestButton()
        {
            m_scripter.ExecuteTest();
        }

        ////////////////////////////////////////////////////////////////////////////////
        //  MIDI 関連
        ////////////////////////////////////////////////////////////////////////////////

        private void OnNoteOn(NoteOnMessage message)
        {
            lock (this)
            {
                NoteEventHandler(message.Pitch, true, message.Velocity);
            }
        }

        private void OnNoteOff(NoteOffMessage message)
        {
            lock (this)
            {
                NoteEventHandler(message.Pitch, false);
            }
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

        ////////////////////////////////////////////////////////////////////////////////
        //  キーボード関連
        ////////////////////////////////////////////////////////////////////////////////

        // ファンクション行
        private void OnKeyF1()            { m_scripter.SampleSequence();          }
        private void OnKeyF2()            { m_scripter.SampleBrightness();        }
        private void OnKeyF3()            { m_scripter.SampleStress();            }
        private void OnKeyF4()            { m_scripter.SampleCircle();            }
        private void OnKeyF5()            { m_scripter.InternalMultiThreadTest(); }
        private void OnKeyF6()            { m_scripter.ScenarioShootingStar();    }
        private void OnKeyF7()            {  }
        private void OnKeyF8()            {  }
        private void OnKeyF9()            {  }
        private void OnKeyF10()           { m_scripter.PatternTest3(); }
        private void OnKeyF11()           { m_scripter.PatternTest2(); }
        private void OnKeyF12()           { m_scripter.PatternTest(); }
        // 1234 行
        private void OnKey1()             { m_scripter.PatternTestKey1(); }
        private void OnKey2()             { m_scripter.PatternTestKey2(); }
        private void OnKey3()             { m_scripter.PatternTestKey3(); }
        private void OnKey4()             { m_scripter.PatternTestKey4(); }
        private void OnKey5()             { m_scripter.PatternTestKey5(); }
        private void OnKey6()             { m_scripter.PatternTestKey6(); }
        private void OnKey7()             { m_scripter.PatternTestKey7(); }
        private void OnKey8()             { m_scripter.PatternTestKey8(); }
        private void OnKey9()             { m_scripter.PatternTestKey9(); }
        private void OnKey0()             { m_scripter.PatternTestKey0(); }
        private void OnKeyMinus()         { m_scripter.PatternTestKeyMinus(); }
        private void OnKeyHat()           { m_scripter.PatternTestKeyHat(); }
        private void OnKeyBar()           { m_scripter.PatternTestKeyBar(); }
        // QWER 行
        private void OnKeyQ()             { m_scripter.PatternTestKeyQ(); }
        private void OnKeyW()             { m_scripter.PatternTestKeyW(); }
        private void OnKeyE()             { m_scripter.PatternTestKeyE(); }
        private void OnKeyR()             { m_scripter.PatternTestKeyR(); }
        private void OnKeyT()             {  }
        private void OnKeyY()             {  }
        private void OnKeyU()             {  }
        private void OnKeyI()             {  }
        private void OnKeyO()             {  }
        private void OnKeyP()             {  }
        private void OnKeyAt()            {  }
        private void OnKeyOpenBrackets()  { m_scripter.PatternTestKeyOpenBrackets(); }
        // ASDF 行
        private void OnKeyA()             {  }
        private void OnKeyS()             {  }
        private void OnKeyD()             {  }
        private void OnKeyF()             {  }
        private void OnKeyG()             {  }
        private void OnKeyH()             {  }
        private void OnKeyJ()             {  }
        private void OnKeyK()             {  }
        private void OnKeyL()             {  }
        private void OnKeySemiColon()     {  }
        private void OnKeyColon()         {  }
        private void OnKeyCloseBrackets() {  }
        // ZXCV 行
        private void OnKeyZ()             {  }
        private void OnKeyX()             {  }
        private void OnKeyC()             {  }
        private void OnKeyV()             {  }
        private void OnKeyB()             {  }
        private void OnKeyN()             {  }
        private void OnKeyM()             {  }
        private void OnKeyComma()         {  }
        private void OnKeyPeriod()        {  }
        private void OnKeyQuestion()      {  }
        private void OnKeyUnderBar()      {  }
        // その他
        private void OnKeyDelete()        { m_scripter.CommandTurnOffAll(); }
        private void OnKeyEnter()         { m_scripter.CommandTurnOnAll();  }
        // 矢印
        private void OnKeyUp()            { m_scripter.PatternTestBrightnessUp();   }
        private void OnKeyDown()          { m_scripter.PatternTestBrightnessDown(); }
        private void OnKeyLeft()          { m_scripter.PatternTestStepTimingToLong(); }
        private void OnKeyRight()         { m_scripter.PatternTestStepTimingToShort(); }


        public void OnKeyboardEvent(Keys keyCode)
        {
            var table = new Dictionary<Keys, Action>
            {
                { Keys.F1,              OnKeyF1            },  // F1
                { Keys.F2,              OnKeyF2            },  // F2
                { Keys.F3,              OnKeyF3            },  // F3
                { Keys.F4,              OnKeyF4            },  // F4
                { Keys.F5,              OnKeyF5            },  // F5
                { Keys.F6,              OnKeyF6            },  // F6
                { Keys.F7,              OnKeyF7            },  // F7
                { Keys.F8,              OnKeyF8            },  // F8
                { Keys.F9,              OnKeyF9            },  // F9
                { Keys.F10,             OnKeyF10           },  // F10
                { Keys.F11,             OnKeyF11           },  // F11
                { Keys.F12,             OnKeyF12           },  // F12

                { Keys.D1,              OnKey1             },  // 1
                { Keys.D2,              OnKey2             },  // 2
                { Keys.D3,              OnKey3             },  // 3
                { Keys.D4,              OnKey4             },  // 4
                { Keys.D5,              OnKey5             },  // 5
                { Keys.D6,              OnKey6             },  // 6
                { Keys.D7,              OnKey7             },  // 7
                { Keys.D8,              OnKey8             },  // 8
                { Keys.D9,              OnKey9             },  // 9
                { Keys.D0,              OnKey0             },  // 0
                { Keys.OemMinus,        OnKeyMinus         },  // -
                { Keys.Oem7,            OnKeyHat           },  // ^
                { Keys.Oem5,            OnKeyBar           },  // |

                { Keys.Q,               OnKeyQ             },  // q
                { Keys.W,               OnKeyW             },  // w
                { Keys.E,               OnKeyE             },  // e
                { Keys.R,               OnKeyR             },  // r
                { Keys.T,               OnKeyT             },  // t
                { Keys.Y,               OnKeyY             },  // y
                { Keys.U,               OnKeyU             },  // u
                { Keys.I,               OnKeyI             },  // i
                { Keys.O,               OnKeyO             },  // o
                { Keys.P,               OnKeyP             },  // p
                { Keys.Oemtilde,        OnKeyAt            },  // @
                { Keys.OemOpenBrackets, OnKeyOpenBrackets  },  // [

                { Keys.A,               OnKeyA             },  // a
                { Keys.S,               OnKeyS             },  // s
                { Keys.D,               OnKeyD             },  // d
                { Keys.F,               OnKeyF             },  // f
                { Keys.G,               OnKeyG             },  // g
                { Keys.H,               OnKeyH             },  // h
                { Keys.J,               OnKeyJ             },  // j
                { Keys.K,               OnKeyK             },  // k
                { Keys.L,               OnKeyL             },  // l
                { Keys.Oemplus,         OnKeySemiColon     },  // ;
                { Keys.Oem1,            OnKeyColon         },  // :
                { Keys.Oem6,            OnKeyCloseBrackets },  // ]

                { Keys.Z,               OnKeyZ             },  // z
                { Keys.X,               OnKeyX             },  // x
                { Keys.C,               OnKeyC             },  // c
                { Keys.V,               OnKeyV             },  // v
                { Keys.B,               OnKeyB             },  // b
                { Keys.N,               OnKeyN             },  // n
                { Keys.M,               OnKeyM             },  // m
                { Keys.Oemcomma,        OnKeyComma         },  // ,
                { Keys.OemPeriod,       OnKeyPeriod        },  // .
                { Keys.OemQuestion,     OnKeyQuestion      },  // ?
                { Keys.OemBackslash,    OnKeyUnderBar      },  // _

                { Keys.Delete,          OnKeyDelete        },  // DEL
                { Keys.Enter,           OnKeyEnter         },  // Enter

                { Keys.Up,              OnKeyUp            },  // ↑
                { Keys.Down,            OnKeyDown          },  // ↓
                { Keys.Left,            OnKeyLeft          },  // ←
                { Keys.Right,           OnKeyRight         },  // →
            };

            if (table.ContainsKey(keyCode))
            {
                table[keyCode]();
            }
        }
    }
}
