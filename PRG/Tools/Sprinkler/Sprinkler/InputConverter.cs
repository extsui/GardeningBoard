﻿using Midi;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Windows.Forms;

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
        //private InputDevice m_inputDevice;

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

        public void OnDumpScriptButton()
        {
            m_scripter.DumpScript();
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
        private void OnKeyF1()            { m_scripter.SampleSequence(); }
        private void OnKeyF2()            { m_scripter.SampleBrightness(); }
        private void OnKeyF3()            { m_scripter.SampleStress(); }
        private void OnKeyF4()            { m_scripter.SampleCircle(); }
        private void OnKeyF5()            { m_scripter.InternalMultiThreadTest(); }
        private void OnKeyF6()            { m_scripter.ScenarioShootingStar(); }
        private void OnKeyF7()            { m_scripter.TestCommandSequencerSimple(); }
        private void OnKeyF8()            { m_scripter.TestCommandSequencerAsync(); }
        private void OnKeyF9()            { m_scripter.PatternTestKeyF9(); }
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
        private void OnKeyT()             { m_scripter.PatternTestKeyT(); }
        private void OnKeyY()             { m_scripter.PatternTestKeyY(); }
        private void OnKeyU()             { m_scripter.PatternTestKeyU(); }
        private void OnKeyI()             { m_scripter.PatternTestKeyI(); }
        private void OnKeyO()             { m_scripter.PatternTestKeyO(); }
        private void OnKeyP()             { m_scripter.PatternTestKeyP(); }
        private void OnKeyAt()            { m_scripter.PatternTestKeyAt(); }
        private void OnKeyOpenBrackets()  { m_scripter.PatternTestKeyOpenBrackets(); }
        // ASDF 行
        private void OnKeyA()             { m_scripter.PatternTestKeyA(); }
        private void OnKeyS()             { m_scripter.PatternTestKeyS(); }
        private void OnKeyD()             { m_scripter.PatternTestKeyD(); }
        private void OnKeyF()             { m_scripter.PatternTestKeyF(); }
        private void OnKeyG()             { m_scripter.PatternTestKeyG(); }
        private void OnKeyH()             { m_scripter.PatternTestKeyH(); }
        private void OnKeyJ()             { m_scripter.PatternTestKeyJ(); }
        private void OnKeyK()             { m_scripter.PatternTestKeyK(); }
        private void OnKeyL()             { m_scripter.PatternTestKeyL(); }
        private void OnKeySemiColon()     { m_scripter.PatternTestKeySemiColon(); }
        private void OnKeyColon()         { m_scripter.PatternTestKeyColon(); }
        private void OnKeyCloseBrackets() { m_scripter.PatternTestKeyCloseBrackets(); }
        // ZXCV 行
        private void OnKeyZ()             { m_scripter.PatternTestKeyZ(); }
        private void OnKeyX()             { m_scripter.PatternTestKeyX(); }
        private void OnKeyC()             { m_scripter.PatternTestKeyC(); }
        private void OnKeyV()             { m_scripter.PatternTestKeyV(); }
        private void OnKeyB()             { m_scripter.PatternTestKeyB(); }
        private void OnKeyN()             { m_scripter.PatternTestKeyN(); }
        private void OnKeyM()             { m_scripter.PatternTestKeyM(); }
        private void OnKeyComma()         { m_scripter.PatternTestKeyComma(); }
        private void OnKeyPeriod()        { m_scripter.PatternTestKeyPeriod(); }
        private void OnKeyQuestion()      { m_scripter.PatternTestKeyQuestion(); }
        private void OnKeyUnderBar()      { m_scripter.PatternTestKeyUnderBar(); }
        // その他
        private void OnKeyDelete()        { m_scripter.CommandTurnOffAll(); }
        private void OnKeyEnter()         { m_scripter.CommandTurnOnAll(); }
        private void OnKeySpace()         { m_scripter.PlayWizardsInWinter(); }
        // 矢印
        private void OnKeyUp()            { m_scripter.PatternTestBrightnessUp(); }
        private void OnKeyDown()          { m_scripter.PatternTestBrightnessDown(); }
        private void OnKeyLeft()          { m_scripter.PatternTestStepTimingToLong(); }
        private void OnKeyRight()         { m_scripter.PatternTestStepTimingToShort(); }

        private void OnKeyNumPad0()       { m_scripter.PatternTestKeyNumPad0(); }
        private void OnKeyNumPad1()       { m_scripter.PatternTestKeyNumPad1(); }
        private void OnKeyNumPad2()       { m_scripter.PatternTestKeyNumPad2(); }
        private void OnKeyNumPad3()       { m_scripter.PatternTestKeyNumPad3(); }
        private void OnKeyNumPad4()       { m_scripter.PatternTestKeyNumPad4(); }
        private void OnKeyNumPad5()       { m_scripter.PatternTestKeyNumPad5(); }
        private void OnKeyNumPad6()       { m_scripter.PatternTestKeyNumPad6(); }
        private void OnKeyNumPad7()       { m_scripter.PatternTestKeyNumPad7(); }
        private void OnKeyNumPad8()       { m_scripter.PatternTestKeyNumPad8(); }
        private void OnKeyNumPad9()       { m_scripter.PatternTestKeyNumPad9(); }

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
                { Keys.Space,           OnKeySpace         },  // Space

                { Keys.Up,              OnKeyUp            },  // ↑
                { Keys.Down,            OnKeyDown          },  // ↓
                { Keys.Left,            OnKeyLeft          },  // ←
                { Keys.Right,           OnKeyRight         },  // →

                { Keys.NumPad0,         OnKeyNumPad0       },  // テンキー0
                { Keys.NumPad1,         OnKeyNumPad1       },  // テンキー1
                { Keys.NumPad2,         OnKeyNumPad2       },  // テンキー2
                { Keys.NumPad3,         OnKeyNumPad3       },  // テンキー3
                { Keys.NumPad4,         OnKeyNumPad4       },  // テンキー4
                { Keys.NumPad5,         OnKeyNumPad5       },  // テンキー5
                { Keys.NumPad6,         OnKeyNumPad6       },  // テンキー6
                { Keys.NumPad7,         OnKeyNumPad7       },  // テンキー7
                { Keys.NumPad8,         OnKeyNumPad8       },  // テンキー8
                { Keys.NumPad9,         OnKeyNumPad9       },  // テンキー9
            };

            if (table.ContainsKey(keyCode))
            {
                table[keyCode]();
            }
        }
    }
}
