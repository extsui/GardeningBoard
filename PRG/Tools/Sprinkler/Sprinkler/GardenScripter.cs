using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;
using System.Linq;

namespace Sprinkler
{
    public class GardenScripter
    {
        private Garden m_garden;

        /// <summary>
        /// ログ付き非同期シリアル送信デリゲート
        /// </summary>
        private Action<string> m_serialSendAsync;
        
        public GardenScripter(Action<string> serialSendAsync)
        {
            m_garden = new Garden();
            m_serialSendAsync = serialSendAsync;
        }

        ////////////////////////////////////////////////////////////////////////////////
        //  コマンド部品
        ////////////////////////////////////////////////////////////////////////////////

        // TODO: 輝度指定もあり?
        // TODO: PositionList の Not が欲しくなる
        // TODO: Formation 毎にコマンド群 (クラス?) を定義する必要がありそう? (今回であれば Hexagon 用)
        // TODO: シーケンスなるものは非同期版が欲しい

        private void ExecuteCommand(List<string> commands)
        {
            Trace.Assert(commands != null);
            string line = String.Join("", commands);
            m_serialSendAsync(line);
        }

        /// <summary>
        /// 指定されたアクションを非同期実行するラッパー
        /// 対象のアクションは async 指定が不要
        /// </summary>
        private async void RunSequenceAsync(Action action)
        {
            await Task.Run(action);
        }

        public void CommandRegister()
        {
            ExecuteCommand(m_garden.MakeRegisterCommand());
        }

        public void CommandTurnOffAll()
        {
            ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.Both, BrickCommandArgs.PatternTurnOff));
        }

        public void CommandTurnOnAll()
        {
            ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.Both, BrickCommandArgs.PatternTurnOn));
        }

        public void CommandTurnOn(uint position, OperationTarget target)
        {
            ExecuteCommand(m_garden.MakePatternCommand(position, target, BrickCommandArgs.PatternTurnOn));
        }

        public void CommandTurnOff(uint position, OperationTarget target)
        {
            ExecuteCommand(m_garden.MakePatternCommand(position, target, BrickCommandArgs.PatternTurnOff));
        }

        public void CommandBrightness(uint position, OperationTarget target, byte brightness)
        {
            // TODO: new が必要なのは要改善。色に合わせた輝度調整が必要。
            ExecuteCommand(m_garden.MakeBrightnessCommand(position, target, new BrickCommandArgs.Brightness(brightness)));
        }

        public void SequentialCommandOneShot(uint position, OperationTarget target, int onTimeMsec)
        {
            CommandTurnOn(position, target);
            Thread.Sleep(onTimeMsec);
            CommandTurnOff(position, target);
        }

        public void SequentialCommandTurnOnInHexagonForm()
        {
            foreach (var position in Position.Hexagon.All)
            {
                ExecuteCommand(m_garden.MakePatternCommand(position, OperationTarget.Both, BrickCommandArgs.PatternTurnOn));
                Thread.Sleep(200);
            }
        }

        public void SequentialCommandTurnOffInHexagonForm()
        {
            foreach (var position in Position.Hexagon.All)
            {
                ExecuteCommand(m_garden.MakePatternCommand(position, OperationTarget.Both, BrickCommandArgs.PatternTurnOff));
                Thread.Sleep(200);
            }
        }

        public void CommandTurnOnInTriangleForm()
        {
            var TrianglePosition = new List<uint> { Position.Hexagon.Up, Position.Hexagon.RightDown, Position.Hexagon.LeftDown };
            ExecuteCommand(m_garden.MakePatternCommand(TrianglePosition, OperationTarget.TileOnly, BrickCommandArgs.PatternTurnOn));
        }

        public void CommandTurnOnInReverseTriangleForm()
        {
            var ReverseTrianglePosition = new List<uint> { Position.Hexagon.Down, Position.Hexagon.LeftUp, Position.Hexagon.RightUp };
            ExecuteCommand(m_garden.MakePatternCommand(ReverseTrianglePosition, OperationTarget.TileOnly, BrickCommandArgs.PatternTurnOn));
        }

        public void SequentialCommandTurnOnSmoothly(uint position, OperationTarget target, int delayMsec)
        {
            CommandTurnOn(position, target);

            ExecuteCommand(m_garden.MakeBrightnessCommand(position, target, new BrickCommandArgs.Brightness(0)));
            Thread.Sleep(delayMsec);
            ExecuteCommand(m_garden.MakeBrightnessCommand(position, target, new BrickCommandArgs.Brightness(1)));
            Thread.Sleep(delayMsec);
            ExecuteCommand(m_garden.MakeBrightnessCommand(position, target, new BrickCommandArgs.Brightness(2)));
            Thread.Sleep(delayMsec);
        }

        public void SequentialCommandTurnOffSmoothly(uint position, OperationTarget target, int delayMsec)
        {
            ExecuteCommand(m_garden.MakeBrightnessCommand(position, target, new BrickCommandArgs.Brightness(1)));
            Thread.Sleep(delayMsec);
            ExecuteCommand(m_garden.MakeBrightnessCommand(position, target, new BrickCommandArgs.Brightness(0)));
            Thread.Sleep(delayMsec);

            CommandTurnOff(position, target);
        }

        public void SequentialCommandOneShotSmoothly(uint position, OperationTarget target, int delayMsec)
        {
            SequentialCommandOneShotSmoothly(new List<uint> { position }, target, delayMsec);
        }

        public void SequentialCommandOneShotSmoothly(List<uint> positions, OperationTarget target, int delayMsec)
        {
            ExecuteCommand(m_garden.MakePatternCommand(positions, target, BrickCommandArgs.PatternTurnOn));

            ExecuteCommand(m_garden.MakeBrightnessCommand(positions, target, new BrickCommandArgs.Brightness(1)));
            Thread.Sleep(delayMsec);
            ExecuteCommand(m_garden.MakeBrightnessCommand(positions, target, new BrickCommandArgs.Brightness(2)));
            Thread.Sleep(delayMsec);
            ExecuteCommand(m_garden.MakeBrightnessCommand(positions, target, new BrickCommandArgs.Brightness(3)));
            Thread.Sleep(delayMsec);
            ExecuteCommand(m_garden.MakeBrightnessCommand(positions, target, new BrickCommandArgs.Brightness(2)));
            Thread.Sleep(delayMsec);
            ExecuteCommand(m_garden.MakeBrightnessCommand(positions, target, new BrickCommandArgs.Brightness(1)));
            Thread.Sleep(delayMsec);

            ExecuteCommand(m_garden.MakePatternCommand(positions, target, BrickCommandArgs.PatternTurnOff));
        }

        ////////////////////////////////////////////////////////////////////////////////
        //  統合コマンド
        ////////////////////////////////////////////////////////////////////////////////

        public async void ExecuteTest()
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

        public async void SampleSequence()
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

        public async void SampleBrightness()
        {
            await Task.Run(() =>
            {
                CommandRegister();
                foreach (var position in Position.Hexagon.All)
                {
                    SequentialCommandOneShotSmoothly(position, OperationTarget.TileOnly, 50);
                    Thread.Sleep(50);
                    SequentialCommandOneShotSmoothly(position, OperationTarget.InsertedOnly, 50);
                    Thread.Sleep(50);
                }
                foreach (var position in Position.Hexagon.All.AsEnumerable().Reverse())
                {
                    SequentialCommandOneShotSmoothly(position, OperationTarget.Both, 50);
                    Thread.Sleep(200);
                }
            });
        }

        public async void SampleCircle()
        {
            await Task.Run(() =>
            {
                CommandRegister();
                {
                    for (int i = 500; i > 0; i /= 2)
                    {
                        SequentialCommandOneShotSmoothly(new List<uint> { Position.Hexagon.Up, Position.Hexagon.Down }, OperationTarget.TileOnly, 10);
                        Thread.Sleep(i);
                        SequentialCommandOneShotSmoothly(new List<uint> { Position.Hexagon.RightUp, Position.Hexagon.LeftDown }, OperationTarget.TileOnly, 10);
                        Thread.Sleep(i);
                        SequentialCommandOneShotSmoothly(new List<uint> { Position.Hexagon.RightDown, Position.Hexagon.LeftUp }, OperationTarget.TileOnly, 10);
                        Thread.Sleep(i);
                    }
                }

                CommandTurnOffAll();
            });
        }

        public async void InternalMultiThreadTest()
        {
            await Task.Run(() =>
            {
                foreach (var position in Position.Hexagon.Surroundings)
                {
                    SequentialCommandTurnOnSmoothly(position, OperationTarget.TileOnly, 50);
                }

                foreach (var position in Position.Hexagon.Surroundings)
                {
                    SequentialCommandTurnOffSmoothly(position, OperationTarget.TileOnly, 50);
                }
            });
        }

        public async void SampleStress()
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

        public async void ScenarioShootingStar()
        {
            await Task.Run(() =>
            {
                var PositionsSequence = new List<List<uint>>
                {
                    Position.Hexagon.StraightLine0Clock,
                    Position.Hexagon.StraightLine2Clock,
                    Position.Hexagon.StraightLine4Clock,
                    Position.Hexagon.StraightLine6Clock,
                    Position.Hexagon.StraightLine8Clock,
                    Position.Hexagon.StraightLine10Clock,
                };

                foreach (var positions in PositionsSequence)
                {
                    Action<OperationTarget, List<uint>, int, int> turnOnSmoothly = (target, positions_, positionDelay, sequenceDelay) =>
                    {
                        foreach (var position in positions_)
                        {
                            RunSequenceAsync(() => SequentialCommandTurnOnSmoothly(position, target, positionDelay));
                            Thread.Sleep(sequenceDelay);
                        }
                    };

                    // Tile, Inserted をそれぞれ微妙に重ねながら順に点灯
                    RunSequenceAsync(() => turnOnSmoothly(OperationTarget.TileOnly, positions, 30, 100));
                    Thread.Sleep(300);
                    RunSequenceAsync(() => turnOnSmoothly(OperationTarget.InsertedOnly, positions, 30, 100));
                    Thread.Sleep(400);

                    Action<OperationTarget, List<uint>, int, int> turnOffSmoothly = (target, positions_, positionDelay, sequenceDelay) =>
                    {
                        foreach (var position in positions_)
                        {
                            RunSequenceAsync(() => SequentialCommandTurnOffSmoothly(position, target, positionDelay));
                            Thread.Sleep(sequenceDelay);
                        }
                    };

                    // 消え方の位置は同じ順だが消えるとき同時
                    RunSequenceAsync(() => turnOffSmoothly(OperationTarget.Both, positions, 50, 100));
                    Thread.Sleep(400);
                }
            });
        }

        ////////////////////////////////////////////////////////////////////////////////
        //  輝度操作テスト
        ////////////////////////////////////////////////////////////////////////////////

        public static byte TestAllBrightness = 0;

        public async void PatternTestBrightnessUp()
        {
            if (TestAllBrightness < 15)
            {
                TestAllBrightness++;
            }
            await Task.Run(() =>
            {
                ExecuteCommand(m_garden.MakeBrightnessCommand(Position.Hexagon.All, OperationTarget.Both, new BrickCommandArgs.Brightness(TestAllBrightness)));
            });
        }

        public async void PatternTestBrightnessDown()
        {
            if (TestAllBrightness > 0)
            {
                TestAllBrightness--;
            }
            await Task.Run(() =>
            {
                ExecuteCommand(m_garden.MakeBrightnessCommand(Position.Hexagon.All, OperationTarget.Both, new BrickCommandArgs.Brightness(TestAllBrightness)));
            });
        }

        ////////////////////////////////////////////////////////////////////////////////
        //  周期操作テスト
        ////////////////////////////////////////////////////////////////////////////////

        public static byte TestStepTiming = 100;
        public const byte AdditionalValue = 20;

        public async void PatternTestStepTimingToShort()
        {
            if (TestStepTiming > AdditionalValue)
            {
                TestStepTiming -= AdditionalValue;
            }

            await Task.Run(() =>
            {
                ExecuteCommand(m_garden.MakeStepTimingCommand(Position.Hexagon.All, OperationTarget.TileOnly, TestStepTiming));
            });
        }

        public async void PatternTestStepTimingToLong()
        {
            if (TestStepTiming <= byte.MaxValue - AdditionalValue)
            {
                TestStepTiming += AdditionalValue;
            }

            await Task.Run(() =>
            {
                ExecuteCommand(m_garden.MakeStepTimingCommand(Position.Hexagon.All, OperationTarget.TileOnly, TestStepTiming));
            });
        }

        ////////////////////////////////////////////////////////////////////////////////
        //  テスト
        ////////////////////////////////////////////////////////////////////////////////
        
        public async void PatternTest()
        {
            // 部品ごとの点灯パターンをテストする
            await Task.Run(() =>
            {
                CommandRegister();
                const byte StepTimingMilliseconds = 50;

                // TODO: PatternConstants 側で配列にしたい？
                // でもパターンを全部通しで使うケースはテストくらいしかないよね。
                var GrassPatternList = new List<PatternConstants.Pattern>()
                {
                    PatternConstants.Grass.AllOn,
                    PatternConstants.Grass.AllOff,
                    PatternConstants.Grass.LeftToRight1,
                    PatternConstants.Grass.RightToLeft1,
                    PatternConstants.Grass.LeftToRight3,
                    PatternConstants.Grass.RightToLeft3,
                    PatternConstants.Grass.BothEdgeToMiddle,
                    PatternConstants.Grass.Vibration,
                    PatternConstants.Grass.LeftToRightBuffer,
                    PatternConstants.Grass.LeftToRightNeg,
                    PatternConstants.Grass.RightToLeftNeg,
                    PatternConstants.Grass.LeftToRightVertical,
                    PatternConstants.Grass.RightToLeftVertical,
                };

                var HousePatternList = new List<PatternConstants.Pattern>()
                {
                    PatternConstants.House.AllOn,
                    PatternConstants.House.AllOff,
                    PatternConstants.House.OneByOne,
                    PatternConstants.House.Stream,
                };

                var TilePatternList = new List<PatternConstants.Pattern>()
                {
                    PatternConstants.Tile.AllOn,
                    PatternConstants.Tile.AllOff,
                    PatternConstants.Tile.OneByOne,
                    PatternConstants.Tile.Stream,
                };

                var TreePatternList = new List<PatternConstants.Pattern>()
                {
                    PatternConstants.Tree.AllOn,
                    PatternConstants.Tree.AllOff,
                    PatternConstants.Tree.OneByOne,
                    PatternConstants.Tree.TopToBottomHorizontal1,
                    PatternConstants.Tree.TopToBottomHorizontal3,
                    PatternConstants.Tree.TopToBottomBuffer,
                    PatternConstants.Tree.UpperLeftToRight,
                    PatternConstants.Tree.UpperRightToLeft,
                    PatternConstants.Tree.LowerLeftToRight,
                    PatternConstants.Tree.LowerRightToLeft,
                    PatternConstants.Tree.Candle,
                };

                // 全消灯
                ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.Both, BrickCommandArgs.PatternTurnOff));
                Thread.Sleep(500);

                // 全点灯
                ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.Both, BrickCommandArgs.PatternTurnOn));
                Thread.Sleep(500);

                // 全消灯
                ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.Both, BrickCommandArgs.PatternTurnOff));
                Thread.Sleep(500);

                Action<List<PatternConstants.Pattern>, OperationTarget> TestBrickPattern = (patterns, targets) =>
                {
                    foreach (var pattern in patterns)
                    {
                        var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, false);
                        ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, targets, patternCommandArgs));

                        // パターンが終わるまで待つ
                        Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
                    }
                };

                Action TestGrassPattern = () => TestBrickPattern(GrassPatternList, OperationTarget.GrassOnly);
                Action TestHousePattern = () => TestBrickPattern(HousePatternList, OperationTarget.HouseOnly);
                Action TestTilePattern = () => TestBrickPattern(TilePatternList, OperationTarget.TileOnly);
                Action TestTreePattern = () => TestBrickPattern(TreePatternList, OperationTarget.TreeOnly);

                // ここから並列実行
                RunSequenceAsync(TestGrassPattern);
                RunSequenceAsync(TestHousePattern);
                RunSequenceAsync(TestTilePattern);
                RunSequenceAsync(TestTreePattern);
            });
        }

        public async void PatternTest2()
        {
            await Task.Run(() =>
            {
                CommandRegister();
                const byte StepTimingMilliseconds = 70;

                // 全消灯
                ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.Both, BrickCommandArgs.PatternTurnOff));

                for (int i = 0; i < 10; i++)
                {
                    var pattern = PatternConstants.House.OpenDoor;
                    var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, false);
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.HouseOnly, patternCommandArgs));

                    // パターンが終わるまで待つ
                    Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
                }

                for (int i = 0; i < 10; i++)
                {
                    var pattern = PatternConstants.House.CloseDoor;
                    var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, false);
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.HouseOnly, patternCommandArgs));

                    // パターンが終わるまで待つ
                    Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
                }
            });
        }

        public async void PatternTest3()
        {
            await Task.Run(() =>
            {
                CommandRegister();
                byte StepTimingMilliseconds = TestStepTiming;

                // 全消灯
                ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.Both, BrickCommandArgs.PatternTurnOff));

                var pattern = PatternConstants.Tile.Stream;
                var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, true);
                ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, patternCommandArgs));
            });
        }

        public async void PatternTestKey1()
        {
            await Task.Run(() =>
            {
                CommandRegister();
                byte StepTimingMilliseconds = TestStepTiming;

                {
                    var pattern = PatternConstants.Tile.BackToFrontSpreadly;
                    var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, false);
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, patternCommandArgs));

                    // パターンが終わるまで待つ
                    Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
                }
            });
        }

        public async void PatternTestKey2()
        {
            await Task.Run(() =>
            {
                CommandRegister();
                byte StepTimingMilliseconds = TestStepTiming;

                {
                    var pattern = PatternConstants.Tile.FrontToBackSpreadly;
                    var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, false);
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, patternCommandArgs));

                    // パターンが終わるまで待つ
                    Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
                }
            });
        }

        public async void PatternTestKey3()
        {
            await Task.Run(() =>
            {
                CommandRegister();
                byte StepTimingMilliseconds = TestStepTiming;

                {
                    var pattern = PatternConstants.Tile.FrontToBack;
                    var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, false);
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, patternCommandArgs));

                    // パターンが終わるまで待つ
                    Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
                }
            });
        }

        public async void PatternTestKey4()
        {
            await Task.Run(() =>
            {
                CommandRegister();
                byte StepTimingMilliseconds = TestStepTiming;

                {
                    var pattern = PatternConstants.Tile.BackToFront;
                    var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, false);
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, patternCommandArgs));

                    // パターンが終わるまで待つ
                    Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
                }
            });
        }

        public async void PatternTestKey5()
        {
            await Task.Run(() =>
            {
                CommandRegister();
                byte StepTimingMilliseconds = TestStepTiming;

                {
                    var pattern = PatternConstants.Tile.RightToLeft;
                    var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, false);
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, patternCommandArgs));

                    // パターンが終わるまで待つ
                    Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
                }
            });
        }

        public async void PatternTestKey6()
        {
            await Task.Run(() =>
            {
                CommandRegister();
                byte StepTimingMilliseconds = TestStepTiming;

                {
                    var pattern = PatternConstants.Tile.LeftToRight;
                    var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, false);
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, patternCommandArgs));

                    // パターンが終わるまで待つ
                    Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
                }
            });
        }

        public async void PatternTestKey7()
        {
            await Task.Run(() =>
            {
                CommandRegister();
                byte StepTimingMilliseconds = TestStepTiming;

                {
                    var pattern = PatternConstants.Tile.Circle_Led3Point1;
                    var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, true);
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, patternCommandArgs));

                    // パターンが終わるまで待つ
                    Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
                }
            });
        }

        public async void PatternTestKey8()
        {
            await Task.Run(() =>
            {
                CommandRegister();
                byte StepTimingMilliseconds = TestStepTiming;

                {
                    var pattern = PatternConstants.Tile.Circle_Led3Point2;
                    var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, true);
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, patternCommandArgs));

                    // パターンが終わるまで待つ
                    Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
                }
            });
        }

        public async void PatternTestKey9()
        {
            await Task.Run(() =>
            {
                CommandRegister();
                byte StepTimingMilliseconds = TestStepTiming;

                {
                    var pattern = PatternConstants.Tile.Circle_Led3Point3;
                    var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, true);
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, patternCommandArgs));

                    // パターンが終わるまで待つ
                    Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
                }
            });
        }

        public async void PatternTestKey0()
        {
            await Task.Run(() =>
            {
                CommandRegister();
                byte StepTimingMilliseconds = TestStepTiming;

                {
                    var pattern = PatternConstants.Tile.Circle_Led1Point6;
                    var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, true);
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, patternCommandArgs));

                    // パターンが終わるまで待つ
                    Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
                }
            });
        }

        public async void PatternTestKeyMinus()
        {
            await Task.Run(() =>
            {
                CommandRegister();
                byte StepTimingMilliseconds = TestStepTiming;

                {
                    var pattern = PatternConstants.Tile.Circle_Led2Point6;
                    var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, true);
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, patternCommandArgs));

                    // パターンが終わるまで待つ
                    Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
                }
            });
        }

        public async void PatternTestKeyHat()
        {
            await Task.Run(() =>
            {
                CommandRegister();
                byte StepTimingMilliseconds = TestStepTiming;

                {
                    var pattern = PatternConstants.Tile.Cross;
                    var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, true);
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, patternCommandArgs));

                    // パターンが終わるまで待つ
                    Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
                }
            });
        }

        public async void PatternTestKeyBar()
        {
        }
    }
}
