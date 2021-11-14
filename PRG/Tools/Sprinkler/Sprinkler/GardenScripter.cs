﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading;
using System.Threading.Tasks;
using System.Linq;
using NAudio.Wave;

namespace Sprinkler
{
    public class GardenScripter
    {
        private Garden m_garden;

        // 安全な Form 操作呼び出し
        private Action<string> m_serialSendAsync;
        private Action m_setScriptStartTick;
        
        public GardenScripter(Action<string> serialSendAsync, Action setScriptStartTick)
        {
            m_garden = new Garden("../../GardenConfig.yml");
            m_serialSendAsync = serialSendAsync;
            m_setScriptStartTick = setScriptStartTick;
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

        private void StartScript()
        {
            m_setScriptStartTick();
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

        public void CommandTurnOn(List<uint> positions, OperationTarget target)
        {
            ExecuteCommand(m_garden.MakePatternCommand(positions, target, BrickCommandArgs.PatternTurnOn));
        }

        public void CommandTurnOff(uint position, OperationTarget target)
        {
            ExecuteCommand(m_garden.MakePatternCommand(position, target, BrickCommandArgs.PatternTurnOff));
        }

        public void CommandTurnOff(List<uint> positions, OperationTarget target)
        {
            ExecuteCommand(m_garden.MakePatternCommand(positions, target, BrickCommandArgs.PatternTurnOff));
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
            SequentialCommandTurnOnSmoothly(new List<uint> { position }, target, delayMsec);
        }

        public void SequentialCommandTurnOnSmoothly(List<uint> positions, OperationTarget target, int delayMsec)
        {
            CommandTurnOn(positions, target);

            ExecuteCommand(m_garden.MakeBrightnessCommand(positions, target, new BrickCommandArgs.Brightness(0)));
            Thread.Sleep(delayMsec);
            ExecuteCommand(m_garden.MakeBrightnessCommand(positions, target, new BrickCommandArgs.Brightness(1)));
            Thread.Sleep(delayMsec);
            ExecuteCommand(m_garden.MakeBrightnessCommand(positions, target, new BrickCommandArgs.Brightness(2)));
            Thread.Sleep(delayMsec);
        }

        public void SequentialCommandTurnOffSmoothly(uint position, OperationTarget target, int delayMsec)
        {
            SequentialCommandTurnOffSmoothly(new List<uint> { position }, target, delayMsec);
        }

        public void SequentialCommandTurnOffSmoothly(List<uint> positions, OperationTarget target, int delayMsec)
        {
            ExecuteCommand(m_garden.MakeBrightnessCommand(positions, target, new BrickCommandArgs.Brightness(1)));
            Thread.Sleep(delayMsec);
            ExecuteCommand(m_garden.MakeBrightnessCommand(positions, target, new BrickCommandArgs.Brightness(0)));
            Thread.Sleep(delayMsec);

            CommandTurnOff(positions, target);
        }

        public void SequentialCommandOneShotSmoothly(uint position, OperationTarget target, int delayMsec, bool isShort = false)
        {
            SequentialCommandOneShotSmoothly(new List<uint> { position }, target, delayMsec, isShort);
        }

        public void SequentialCommandOneShotSmoothly(List<uint> positions, OperationTarget target, int delayMsec, bool isShort = false)
        {
            ExecuteCommand(m_garden.MakePatternCommand(positions, target, BrickCommandArgs.PatternTurnOn));

            if (!isShort)
            {
                // テンポ 148 の 8 分音符で、delayMsec = 1 とすると間に合わないのでその場合は短い版を使用すること
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
            }
            else
            {
                ExecuteCommand(m_garden.MakeBrightnessCommand(positions, target, new BrickCommandArgs.Brightness(1)));
                Thread.Sleep(delayMsec);
                ExecuteCommand(m_garden.MakeBrightnessCommand(positions, target, new BrickCommandArgs.Brightness(2)));
                Thread.Sleep(delayMsec);
                ExecuteCommand(m_garden.MakeBrightnessCommand(positions, target, new BrickCommandArgs.Brightness(1)));
                Thread.Sleep(delayMsec);
                ExecuteCommand(m_garden.MakeBrightnessCommand(positions, target, new BrickCommandArgs.Brightness(0)));
                Thread.Sleep(delayMsec);
            }

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

        // コマンドシーケンサを使用した簡易テスト
        public async void TestCommandSequencerSimple()
        {
            // 手前の草の ON/OFF を繰り返す

            var commandSequencer = new CommandSequencer();

            commandSequencer.SetTimedEvent(0, () => CommandTurnOn(Position.Hexagon.Down, OperationTarget.GrassOnly));
            commandSequencer.SetTimedEvent(500, () => CommandTurnOff(Position.Hexagon.Down, OperationTarget.GrassOnly));
            commandSequencer.SetTimedEvent(1000, () => CommandTurnOn(Position.Hexagon.Down, OperationTarget.GrassOnly));
            commandSequencer.SetTimedEvent(1500, () => CommandTurnOff(Position.Hexagon.Down, OperationTarget.GrassOnly));
            commandSequencer.SetTimedEvent(2000, () => CommandTurnOn(Position.Hexagon.Down, OperationTarget.GrassOnly));
            commandSequencer.SetTimedEvent(2500, () => CommandTurnOff(Position.Hexagon.Down, OperationTarget.GrassOnly));

            // 逆順に登録しても問題ないハズ
            commandSequencer.SetTimedEvent(5500, () => CommandTurnOff(Position.Hexagon.Down, OperationTarget.GrassOnly));
            commandSequencer.SetTimedEvent(5000, () => CommandTurnOn(Position.Hexagon.Down, OperationTarget.GrassOnly));
            commandSequencer.SetTimedEvent(4500, () => CommandTurnOff(Position.Hexagon.Down, OperationTarget.GrassOnly));
            commandSequencer.SetTimedEvent(4000, () => CommandTurnOn(Position.Hexagon.Down, OperationTarget.GrassOnly));
            commandSequencer.SetTimedEvent(3500, () => CommandTurnOff(Position.Hexagon.Down, OperationTarget.GrassOnly));
            commandSequencer.SetTimedEvent(3000, () => CommandTurnOn(Position.Hexagon.Down, OperationTarget.GrassOnly));

            await Task.Run(() =>
            {
                commandSequencer.Run();
            });
        }

        // コマンドシーケンサを使用した非同期コマンドの簡易テスト
        public async void TestCommandSequencerAsync()
        {
            // 外周をゆっくりワンショットさせている間に手前の草をワンショットさせる

            var commandSequencer = new CommandSequencer();

            commandSequencer.SetTimedEvent(0, () => SequentialCommandOneShotSmoothly(Position.Hexagon.All, OperationTarget.TileOnly, 1000));
            commandSequencer.SetTimedEvent(500, () => SequentialCommandOneShotSmoothly(Position.Hexagon.Down, OperationTarget.GrassOnly, 50));
            commandSequencer.SetTimedEvent(1000, () => SequentialCommandOneShotSmoothly(Position.Hexagon.Down, OperationTarget.GrassOnly, 50));

            await Task.Run(() =>
            {
                commandSequencer.Run();
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

        // 1Tick = 1ms
        // 後で加減算するので初期値は適当。
        private static ushort TestStepTiming = 100;

        // Tick =   0 ～   N: 変化が大きいので 傾き (小) ずつ加減算
        // Tick = N+1 ～ 255: 変化が小さいので 傾き (大) ずつ加減算

        // 傾き (小)
        private const ushort StepTimingTickSlopeSmall = 5;
        // 傾き (大)
        private const ushort StepTimingTickSlopeLarge = 20;
        // N (変曲点)
        private const ushort StepTimingTickInflectionPoint = 100;

        // 上記の傾き変換を行う関数
        private Func<ushort, ushort> GetStepTimingAdditionalValue = (ushort currentStepTimingTick) =>
        {
            if (currentStepTimingTick <= StepTimingTickInflectionPoint)
            {
                return StepTimingTickSlopeSmall;
            }
            else
            {
                return StepTimingTickSlopeLarge;
            }
        };

        public async void PatternTestStepTimingToShort()
        {
            var AdditionalValue = GetStepTimingAdditionalValue(TestStepTiming);

            if (TestStepTiming > AdditionalValue)
            {
                TestStepTiming -= AdditionalValue;
            }
            else
            {
                TestStepTiming = 0;
            }

            await Task.Run(() =>
            {
                ExecuteCommand(m_garden.MakeStepTimingCommand(Position.Hexagon.All, OperationTarget.Both, TestStepTiming));
            });
        }

        public async void PatternTestStepTimingToLong()
        {
            var AdditionalValue = GetStepTimingAdditionalValue(TestStepTiming);

            if (TestStepTiming <= ushort.MaxValue - AdditionalValue)
            {
                TestStepTiming += AdditionalValue;
            }
            else
            {
                TestStepTiming = ushort.MaxValue;
            }

            await Task.Run(() =>
            {
                ExecuteCommand(m_garden.MakeStepTimingCommand(Position.Hexagon.All, OperationTarget.Both, TestStepTiming));
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
                    PatternConstants.Grass.MiddleToBothEdge,
                    PatternConstants.Grass.Vibration,
                    PatternConstants.Grass.LeftToRightNeg,
                    PatternConstants.Grass.RightToLeftNeg,
                    PatternConstants.Grass.LeftToRightVertical1,
                    PatternConstants.Grass.RightToLeftVertical1,
                    PatternConstants.Grass.LeftToRightVertical3,
                    PatternConstants.Grass.RightToLeftVertical3,
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
                var StepTimingMilliseconds = TestStepTiming;

                // 全消灯
                ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.Both, BrickCommandArgs.PatternTurnOff));

                var pattern = PatternConstants.Tile.Stream;
                var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, true);
                ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, patternCommandArgs));
            });
        }

        ////////////////////////////////////////////////////////////////////////////////
        //  1, 2, 3, ..., \
        ////////////////////////////////////////////////////////////////////////////////

        public async void PatternTestKey1()
        {
            await Task.Run(() =>
            {
                var StepTimingMilliseconds = TestStepTiming;

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
                var StepTimingMilliseconds = TestStepTiming;

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
                var StepTimingMilliseconds = TestStepTiming;

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
                var StepTimingMilliseconds = TestStepTiming;

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
                var StepTimingMilliseconds = TestStepTiming;

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
                var StepTimingMilliseconds = TestStepTiming;

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
                var StepTimingMilliseconds = TestStepTiming;

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
                var StepTimingMilliseconds = TestStepTiming;

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
                var StepTimingMilliseconds = TestStepTiming;

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
                var StepTimingMilliseconds = TestStepTiming;

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
                var StepTimingMilliseconds = TestStepTiming;

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
                var StepTimingMilliseconds = TestStepTiming;

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
            StartScript();

            // 右から左に同期して順に点灯させていく
            await Task.Run(() =>
            {
                var StepTimingMilliseconds = TestStepTiming;

                // 右列→真ん中列の遅延
                var ColumnDelay = StepTimingMilliseconds * 8;

                // DEBUG: アニメーション出力用の仮
                CommandRegister();

                {
                    var pattern = PatternConstants.Tile.RightToLeft;
                    var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, false);

                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.RightUp, OperationTarget.TileOnly, patternCommandArgs));
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.RightDown, OperationTarget.TileOnly, patternCommandArgs));
                    Thread.Sleep(ColumnDelay);

                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.Up, OperationTarget.TileOnly, patternCommandArgs));
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.Center, OperationTarget.TileOnly, patternCommandArgs));
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.Down, OperationTarget.TileOnly, patternCommandArgs));
                    Thread.Sleep(ColumnDelay);

                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.LeftUp, OperationTarget.TileOnly, patternCommandArgs));
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.LeftDown, OperationTarget.TileOnly, patternCommandArgs));
                    Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
                }

                // 折り返し

                {
                    var pattern = PatternConstants.Tile.LeftToRight;
                    var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, false);

                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.LeftUp, OperationTarget.TileOnly, patternCommandArgs));
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.LeftDown, OperationTarget.TileOnly, patternCommandArgs));
                    Thread.Sleep(ColumnDelay);

                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.Up, OperationTarget.TileOnly, patternCommandArgs));
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.Center, OperationTarget.TileOnly, patternCommandArgs));
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.Down, OperationTarget.TileOnly, patternCommandArgs));
                    Thread.Sleep(ColumnDelay);

                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.RightUp, OperationTarget.TileOnly, patternCommandArgs));
                    ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.RightDown, OperationTarget.TileOnly, patternCommandArgs));
                    Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
                }
            });
        }

        ////////////////////////////////////////////////////////////////////////////////
        //  q, w, e, ..., [
        ////////////////////////////////////////////////////////////////////////////////

        private void SetTreePattern(PatternConstants.Pattern pattern)
        {
            var StepTimingMilliseconds = TestStepTiming;

            {
                var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, false);
                ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TreeOnly, patternCommandArgs));

                // パターンが終わるまで待つ
                Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
            }
        }

        public async void PatternTestKeyQ()
        {
            await Task.Run(() => SetTreePattern(PatternConstants.Tree.BottomToTop));
        }

        public async void PatternTestKeyW()
        {
            await Task.Run(() => SetTreePattern(PatternConstants.Tree.Wave));
        }

        public async void PatternTestKeyE()
        {
            await Task.Run(() => SetTreePattern(PatternConstants.Tree.LowerLeftToRight));
        }

        public async void PatternTestKeyR()
        {
            await Task.Run(() => SetTreePattern(PatternConstants.Tree.LowerRightToLeft));
        }

        public async void PatternTestKeyT()
        {
            await Task.Run(() => SetTreePattern(PatternConstants.Tree.UpperLeftToRight));
        }

        public async void PatternTestKeyY()
        {
            await Task.Run(() => SetTreePattern(PatternConstants.Tree.UpperRightToLeft));
        }

        public async void PatternTestKeyU()
        {
            await Task.Run(() => SetTreePattern(PatternConstants.Tree.Candle));
        }

        public async void PatternTestKeyI()
        {
            await Task.Run(() => SetTreePattern(PatternConstants.Tree.OneByOne));
        }

        public async void PatternTestKeyO()
        {
            await Task.Run(() => SetTreePattern(PatternConstants.Tree.TopToBottomHorizontal3));
        }

        public async void PatternTestKeyP()
        {

        }

        public async void PatternTestKeyAt()
        {

        }

        public async void PatternTestKeyOpenBrackets()
        {

        }

        ////////////////////////////////////////////////////////////////////////////////
        //  a, s, d, ..., ]
        ////////////////////////////////////////////////////////////////////////////////

        private void SetGrassPattern(PatternConstants.Pattern pattern)
        {
            var StepTimingMilliseconds = TestStepTiming;

            {
                var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, false);
                ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.GrassOnly, patternCommandArgs));

                // パターンが終わるまで待つ
                Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
            }
        }

        public async void PatternTestKeyA()
        {
            await Task.Run(() => SetGrassPattern(PatternConstants.Grass.LeftToRightBlock));
        }

        public async void PatternTestKeyS()
        {
            await Task.Run(() => SetGrassPattern(PatternConstants.Grass.RightToLeftBlock));
        }

        public async void PatternTestKeyD()
        {
            await Task.Run(() => SetGrassPattern(PatternConstants.Grass.LeftToRightNeg));
        }

        public async void PatternTestKeyF()
        {
            await Task.Run(() => SetGrassPattern(PatternConstants.Grass.RightToLeftNeg));
        }

        public async void PatternTestKeyG()
        {
            await Task.Run(() => SetGrassPattern(PatternConstants.Grass.RightToLeft3));
        }

        public async void PatternTestKeyH()
        {
            await Task.Run(() => SetGrassPattern(PatternConstants.Grass.LeftToRight3));
        }

        public async void PatternTestKeyJ()
        {
            await Task.Run(() => SetGrassPattern(PatternConstants.Grass.BothEdgeToMiddle));
        }

        public async void PatternTestKeyK()
        {
            await Task.Run(() => SetGrassPattern(PatternConstants.Grass.MiddleToBothEdge));
        }

        public async void PatternTestKeyL()
        {
            await Task.Run(() => SetGrassPattern(PatternConstants.Grass.LeftToRightVertical3));
        }

        public async void PatternTestKeySemiColon()
        {
            await Task.Run(() => SetGrassPattern(PatternConstants.Grass.RightToLeftVertical3));
        }

        public async void PatternTestKeyColon()
        {
            await Task.Run(() => SetGrassPattern(PatternConstants.Grass.BottomToTop));
        }

        public async void PatternTestKeyCloseBrackets()
        {
            await Task.Run(() => SetGrassPattern(PatternConstants.Grass.TopToBottom));
        }

        ////////////////////////////////////////////////////////////////////////////////
        //  z, x, c, ..., \
        ////////////////////////////////////////////////////////////////////////////////

        private void SetHousePattern(PatternConstants.Pattern pattern, bool isRepeat = false)
        {
            var StepTimingMilliseconds = TestStepTiming;

            {
                var patternCommandArgs = new BrickCommandArgs.Pattern(pattern.Id, StepTimingMilliseconds, isRepeat);
                ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.HouseOnly, patternCommandArgs));

                // パターンが終わるまで待つ
                Thread.Sleep(pattern.GetTime(StepTimingMilliseconds));
            }
        }

        public async void PatternTestKeyZ()
        {
            await Task.Run(() => SetHousePattern(PatternConstants.House.OutsideOn));
        }

        public async void PatternTestKeyX()
        {
            await Task.Run(() => SetHousePattern(PatternConstants.House.OpenDoor));
        }

        public async void PatternTestKeyC()
        {
            await Task.Run(() => SetHousePattern(PatternConstants.House.CloseDoor));
        }

        public async void PatternTestKeyV()
        {
            await Task.Run(() => SetHousePattern(PatternConstants.House.TopToBottom));
        }

        public async void PatternTestKeyB()
        {
            await Task.Run(() => SetHousePattern(PatternConstants.House.BottomToTop));
        }

        public async void PatternTestKeyN()
        {
            await Task.Run(() => SetHousePattern(PatternConstants.House.SpreadFromBottomPoint));
        }

        public async void PatternTestKeyM()
        {
            await Task.Run(() => SetHousePattern(PatternConstants.House.ShrinkFromTopPoint));
        }

        public async void PatternTestKeyComma()
        {
            await Task.Run(() => SetHousePattern(PatternConstants.House.ShootingStar));
        }

        public async void PatternTestKeyPeriod()
        {
            await Task.Run(() => SetHousePattern(PatternConstants.House.Pseudo3dRotation, isRepeat : true));
        }

        public async void PatternTestKeyQuestion()
        {

        }

        public async void PatternTestKeyUnderBar()
        {

        }

        /// <summary>
        /// 指定した時間後にコマンド実行するクラス
        /// </summary>
        public class CommandSequencer
        {
            // 本来は非公開で良いがデバッグ用のために公開
            public List<(int timing, Action command)> TimedEventList { get; private set; }

            public CommandSequencer()
            {
                TimedEventList = new List<(int, Action)>();
            }

            public void SetTimedEvent(int timing, Action command)
            {
                TimedEventList.Add((timing, command));
            }

            public void Run()
            {
                // 最初から再生
                Run(0);
            }

            // 開始タイミング指定版
            public void Run(int startTiming)
            {
                // 昇順に並び替え
                TimedEventList.Sort((a, b) => (a.timing - b.timing));

                // 開始タイミング以前のイベントはスキップ
                int startIndex = 0;
                foreach (var timedEvent in TimedEventList)
                {
                    // startTiming で指定したタイミングのコマンドも実行されることを
                    // 想定しているので必要なので < ではなく <= とする必要がある
                    if (startTiming <= timedEvent.timing)
                    {
                        break;
                    }
                    startIndex++;
                }

                int nowTime = Environment.TickCount - startTiming;
                for (int i = startIndex; i < TimedEventList.Count; i++)
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
                        Thread.Sleep(1);
                    }
                }
            }
        }

        /// <summary>
        /// GardeningBoard 用の曲クラス
        /// </summary>
        public class GardenMusic
        {
            // 曲のテンポ
            // 整数だと合わない場合があるので浮動小数
            public double Tempo { get; private set; }

            // 曲の小節数 (1～)
            public int BarCount { get; private set; }

            // 曲再生タイミング遅延 (ミリ秒)
            // - 曲の頭の無音区間も含む
            // - PC 環境ごとに再設定が必要かも
            public int PlayStartOffsetMilliSeconds { get; private set; }

            public GardenMusic(double tempo, int barCount, int playStartOffsetMilliSeconds)
            {
                Tempo = tempo;
                BarCount = barCount;
                PlayStartOffsetMilliSeconds = playStartOffsetMilliSeconds;
            }

            // 小節内のタイミング
            // - 2分音符  : half note
            // - 4分音符  : quarter note
            // - 8分音符  : eighth note
            // - 16分音符 : sixteenth note
            // 1  |1               |
            // 2  |1       2       |
            // 4  |1   2   3   4   |
            // 8  |1 2 3 4 5 6 7 8 |
            // 16 |123456789.......|
            private int AllNoteTiming       => (int)((60 / Tempo * 4) * 1000);
            private int HalfNoteTiming      => (int)((60 / Tempo * 2) * 1000);
            private int QuarterNoteTiming   => (int)((60 / Tempo)     * 1000);
            private int EightNoteTiming     => (int)((60 / Tempo / 2) * 1000);
            private int SixteenthNoteTiming => (int)((60 / Tempo / 4) * 1000);

            // 小節の開始時間 (秒・浮動小数) の取得
            // オフセット考慮無しであることに注意
            private double GetBarTime(int barNumber)
            {
                Trace.Assert(barNumber >= 1);
                return (((barNumber - 1) * 4) / Tempo) * 60;
            }

            // 曲の中のノーツ時間の取得 (ミリ秒)
            public int GetNoteTime(int barNumber, int beat, int noteNumber)
            {
                Trace.Assert(noteNumber >= 1);

                // 小節開始時刻
                int barTiming = (int)(GetBarTime(barNumber) * 1000 + PlayStartOffsetMilliSeconds);

                switch (beat)
                {
                    case 1:
                        return barTiming + AllNoteTiming * (noteNumber - 1);
                    case 2:
                        return barTiming + HalfNoteTiming * (noteNumber - 1);
                    case 4:
                        return barTiming + QuarterNoteTiming * (noteNumber - 1);
                    case 8:
                        return barTiming + EightNoteTiming * (noteNumber - 1);
                    case 16:
                        return barTiming + SixteenthNoteTiming * (noteNumber - 1);
                    default:
                        throw new NotSupportedException("");
                }
            }

            // 小節開始時間
            public int GetNoteTime(int barNumber)
            {
                return GetNoteTime(barNumber, 1, 1);
            }

            // 1音の長さの取得 (ミリ秒)
            // - 例1: beat=8, notes=1 --> 8分音符1個分
            // - 例2: beat=4, notes=3 --> 4分音符3個分
            public int GetNoteLengthTime(int beat, int notes)
            {
                int begin = GetNoteTime(1, beat, 1);
                int end = GetNoteTime(1, beat, notes + 1);
                return end - begin;
            }
        }

        public async void PlayWizardsInWinter()
        {
            var commandSequencer = new CommandSequencer();

            // Wizards in Winter の情報
            //
            // 曲のテンポ
            // - 148 と 149 だと全然合わないので小数点まで設定
            // - 再生タイミング遅延との兼ね合いもあるが割と妥当な値のハズ
            var music = new GardenMusic(148.4, 113, 400);

            for (int bar = 1; bar <= music.BarCount; bar++)
            {
                if (1 <= bar && bar <= 8)
                {
                    // [イントロ]

                    // 床、草、木 の顔見せ
                    // 家は後出し
                    if (bar % 4 != 0)
                    {
                        // 8  |1 2 3 4 5 6 7 8 |
                        //    |x x     x x     | Tile
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.All, OperationTarget.TileOnly, 1, true));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 2), () => SequentialCommandOneShotSmoothly(Position.Hexagon.All, OperationTarget.TileOnly, 1, true));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 5), () => SequentialCommandOneShotSmoothly(Position.Hexagon.All, OperationTarget.TileOnly, 1, true));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 6), () => SequentialCommandOneShotSmoothly(Position.Hexagon.All, OperationTarget.TileOnly, 1, true));
                    }
                    else if (bar == 4)
                    {
                        // 8  |1 2 3 4 5 6 7 8 |
                        //    |x               | Tile
                        //    |        x-----> | Grass
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.All, OperationTarget.TileOnly, 1, true));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 5), () => ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.GrassOnly, new BrickCommandArgs.Pattern(PatternConstants.Grass.BothEdgeToMiddle.Id, 50, false))));
                    }
                    else if (bar == 8)
                    {
                        // 8  |1 2 3 4 5 6 7 8 |
                        //    |x               | Tile
                        //    |        x-----> | Tree
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.All, OperationTarget.TileOnly, 1, true));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 5), () => ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TreeOnly, new BrickCommandArgs.Pattern(PatternConstants.Tree.BottomToTop.Id, 50, false))));
                    }
                }
                else if (9 <= bar && bar <= 15)
                {
                    // [イントロ・伴奏あり]

                    // ここから家を出していく
                    if (bar % 4 != 0)
                    {
                        // 8  |1 2 3 4 5 6 7 8 |1 2 3 4 5 6 7 8 |
                        //    |x---------------|--------------> |  Tile
                        //    |x-----> x-----> |x-----> x-----> |  House
                        if (bar % 2 == 1)
                        {
                            commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 1), () => ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, new BrickCommandArgs.Pattern(PatternConstants.Tile.BackToFront.Id, 80, false))));
                        }
                        else
                        {
                            commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 1), () => ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, new BrickCommandArgs.Pattern(PatternConstants.Tile.FrontToBack.Id, 80, false))));
                        }
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 1), () => ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.HouseOnly, new BrickCommandArgs.Pattern(PatternConstants.House.OpenDoor.Id, 50, false))));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 5), () => ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.HouseOnly, new BrickCommandArgs.Pattern(PatternConstants.House.CloseDoor.Id, 50, false))));
                    }
                    else if (bar == 12)
                    {
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.All, OperationTarget.TileOnly, 5, false));
                    }
                }
                else if (16 <= bar && bar <= 19)
                {
                    // [サビの前の溜め]
                    // ﾃﾞﾝｯﾃﾞﾚﾚﾚ
                    // ﾃﾞﾝｯﾃﾞﾚﾚﾚ
                    // ﾃﾞﾝｯﾃﾞﾃﾞﾝｯﾝﾃﾞ
                    // ﾃﾞｯﾃﾞｯﾃﾞｯﾃﾞｯ

                    if (bar == 16 || bar == 17)
                    {
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.All, OperationTarget.TileOnly, 5, false));
                    }
                    else if (bar == 18)
                    {

                    }
                    else if (bar == 19)
                    {

                    }
                }
                else if (20 <= bar && bar <= 27)
                {
                    // [サビ]
                    if (bar % 4 != 0)
                    {
                        // ﾃﾞﾚﾚﾚﾚﾚﾚﾚﾃﾞﾚﾚﾚﾚﾚﾚﾚ * 3
                    }
                    else
                    {
                        // ﾃﾞｯﾚﾚﾚﾚﾚ
                    }




                    if (bar % 4 != 0)
                    {
                        if (bar % 2 == 1)
                        {
                            commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 1), () => ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, new BrickCommandArgs.Pattern(PatternConstants.Tile.BackToFront.Id, 80, false))));
                        }
                        else
                        {
                            commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 1), () => ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, new BrickCommandArgs.Pattern(PatternConstants.Tile.FrontToBack.Id, 80, false))));
                        }
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 1), () => ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.HouseOnly, new BrickCommandArgs.Pattern(PatternConstants.House.OpenDoor.Id, 50, false))));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 5), () => ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.HouseOnly, new BrickCommandArgs.Pattern(PatternConstants.House.CloseDoor.Id, 50, false))));
                    }
                    else if (bar == 12)
                    {
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 8, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.All, OperationTarget.TileOnly, 5, false));
                    }




                }
                else if (28 <= bar && bar <= 31)
                {
                    // [クールダウン]
                    // ﾃﾞﾝｯ ﾃﾞﾚﾚﾚ
                    // ﾃﾞｯﾃﾞﾃﾞｯﾃﾞﾃﾞ
                    // ﾃﾞｯﾃﾞｯﾃﾞｯﾃﾞｯ
                    // ﾃﾞｯﾃﾞｯﾃﾞｯﾃﾞｯ(↓)
                }
                else if (32 <= bar && bar <= 35)
                {
                    // [静かなフレーズ]
                    // ﾃﾞﾝﾃﾞﾝﾃﾞﾝﾃﾞﾝﾃﾞﾝﾃﾞﾝﾃﾞﾝﾃﾞﾝ * 4
                    var stepTime = (ushort)music.GetNoteLengthTime(8, 1);

                    if (bar == 32)
                    {
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => ExecuteCommand(m_garden.MakePatternCommand(Position.Hexagon.All, OperationTarget.TileOnly, new BrickCommandArgs.Pattern(PatternConstants.Tile.Circle_Led1Point6.Id, stepTime, true))));

                        var stepTimingArray = new List<ushort>()
                        {
                            (ushort)(stepTime * 1.0),
                            (ushort)(stepTime * 0.8),
                            (ushort)(stepTime * 0.4),
                            (ushort)(stepTime * 0.2),
                        };
                        for (int beat = 1; beat <= 4; beat++)
                        {
                            // TODO: ↓を有効にすると例外になる。要デバッグ。
                            //commandSequencer.SetTimedEvent(music.GetNoteTime(bar + (beat - 1), 4, 1), () => ExecuteCommand(m_garden.MakeStepTimingCommand(Position.Hexagon.All, OperationTarget.TileOnly, stepTimingArray[beat - 1])));
                        }
                    }

                    if (bar == 35)
                    {
                        /*
                        ushort[] stepTimingArray =
                        {
                            (ushort)(stepTime * 1.0),
                            (ushort)(stepTime * 0.8),
                            (ushort)(stepTime * 0.4),
                            (ushort)(stepTime * 0.2),
                        };

                        for (int beat = 1; beat <= 4; beat++)
                        {
                            commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, beat), () => ExecuteCommand(m_garden.MakeStepTimingCommand(Position.Hexagon.All, OperationTarget.TileOnly, stepTimingArray[beat - 1])));
                        }
                        */
                    }

                    /*
                    if (bar == 32)
                    {
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => ExecuteCommand(m_garden.MakeStepTimingCommand(Position.Hexagon.All, OperationTarget.TileOnly, stepTime)));
                    }
                    else if (bar == 33)
                    {
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => ExecuteCommand(m_garden.MakeStepTimingCommand(Position.Hexagon.All, OperationTarget.TileOnly, (ushort)(stepTime * 0.8))));
                    }
                    else if (bar == 34)
                    {
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => ExecuteCommand(m_garden.MakeStepTimingCommand(Position.Hexagon.All, OperationTarget.TileOnly, (ushort)(stepTime * 0.4))));
                    }
                    else if (bar == 35)
                    {
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => ExecuteCommand(m_garden.MakeStepTimingCommand(Position.Hexagon.All, OperationTarget.TileOnly, (ushort)(stepTime * 0.2))));
                    }
                    */

                    /*
                    const int delayMilliSeconds = 30;

                    if (bar % 4 == 0)
                    {
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.Up, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.RightUp, OperationTarget.InsertedOnly, delayMilliSeconds, false));

                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 2), () => SequentialCommandOneShotSmoothly(Position.Hexagon.RightUp, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 2), () => SequentialCommandOneShotSmoothly(Position.Hexagon.RightDown, OperationTarget.InsertedOnly, delayMilliSeconds, false));

                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 3), () => SequentialCommandOneShotSmoothly(Position.Hexagon.RightDown, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 3), () => SequentialCommandOneShotSmoothly(Position.Hexagon.Down, OperationTarget.InsertedOnly, delayMilliSeconds, false));

                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 4), () => SequentialCommandOneShotSmoothly(Position.Hexagon.Down, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 4), () => SequentialCommandOneShotSmoothly(Position.Hexagon.LeftDown, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                    }
                    else if (bar % 4 == 1)
                    {
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.LeftDown, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.LeftUp, OperationTarget.InsertedOnly, delayMilliSeconds, false));

                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 2), () => SequentialCommandOneShotSmoothly(Position.Hexagon.LeftUp, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 2), () => SequentialCommandOneShotSmoothly(Position.Hexagon.Up, OperationTarget.InsertedOnly, delayMilliSeconds, false));

                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 3), () => SequentialCommandOneShotSmoothly(Position.Hexagon.Up, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 3), () => SequentialCommandOneShotSmoothly(Position.Hexagon.RightUp, OperationTarget.InsertedOnly, delayMilliSeconds, false));

                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 4), () => SequentialCommandOneShotSmoothly(Position.Hexagon.RightUp, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 4), () => SequentialCommandOneShotSmoothly(Position.Hexagon.RightDown, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                    }
                    else if (bar % 4 == 2)
                    {
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.RightDown, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.Down, OperationTarget.InsertedOnly, delayMilliSeconds, false));

                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 2), () => SequentialCommandOneShotSmoothly(Position.Hexagon.Down, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 2), () => SequentialCommandOneShotSmoothly(Position.Hexagon.LeftDown, OperationTarget.InsertedOnly, delayMilliSeconds, false));

                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 3), () => SequentialCommandOneShotSmoothly(Position.Hexagon.LeftDown, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 3), () => SequentialCommandOneShotSmoothly(Position.Hexagon.LeftUp, OperationTarget.InsertedOnly, delayMilliSeconds, false));

                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 4), () => SequentialCommandOneShotSmoothly(Position.Hexagon.LeftUp, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 4), () => SequentialCommandOneShotSmoothly(Position.Hexagon.Up, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                    }
                    else if (bar % 4 == 3)
                    {
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.Up, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.RightUp, OperationTarget.InsertedOnly, delayMilliSeconds, false));

                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 2), () => SequentialCommandOneShotSmoothly(Position.Hexagon.RightUp, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 2), () => SequentialCommandOneShotSmoothly(Position.Hexagon.RightDown, OperationTarget.InsertedOnly, delayMilliSeconds, false));

                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 3), () => SequentialCommandOneShotSmoothly(Position.Hexagon.RightDown, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 3), () => SequentialCommandOneShotSmoothly(Position.Hexagon.Down, OperationTarget.InsertedOnly, delayMilliSeconds, false));

                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 4), () => SequentialCommandOneShotSmoothly(Position.Hexagon.Down, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 4), () => SequentialCommandOneShotSmoothly(Position.Hexagon.LeftDown, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                    }
                    */
                }
                else if (36 <= bar && bar <= 39)
                {
                    // [静かなフレーズ・メロディ]
                    // ﾝ ﾃﾚﾚｯﾚｯ-
                    // ﾝ ﾃﾚﾚｯﾚｯ-
                    // ﾝ ﾃﾚﾚｯﾚｯ-
                    // ﾚｰﾚｰﾚｰﾚｰ


                    const int delayMilliSeconds = 30;

                    if (bar % 4 == 0)
                    {
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.RightUp, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 2), () => SequentialCommandOneShotSmoothly(Position.Hexagon.LeftDown, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 3), () => SequentialCommandOneShotSmoothly(Position.Hexagon.RightDown, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 4), () => SequentialCommandOneShotSmoothly(Position.Hexagon.LeftUp, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                    }
                    else if (bar % 4 == 1)
                    {
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.Up, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 2), () => SequentialCommandOneShotSmoothly(Position.Hexagon.Down, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 3), () => SequentialCommandOneShotSmoothly(Position.Hexagon.Center, OperationTarget.InsertedOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 4), () => SequentialCommandOneShotSmoothly(Position.Hexagon.All, OperationTarget.InsertedOnly, delayMilliSeconds / 2, false));
                    }
                    else if (bar % 4 == 2)
                    {
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.RightUp, OperationTarget.TileOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 2), () => SequentialCommandOneShotSmoothly(Position.Hexagon.LeftDown, OperationTarget.TileOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 3), () => SequentialCommandOneShotSmoothly(Position.Hexagon.RightDown, OperationTarget.TileOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 4), () => SequentialCommandOneShotSmoothly(Position.Hexagon.LeftUp, OperationTarget.TileOnly, delayMilliSeconds, false));
                    }
                    else if (bar % 4 == 3)
                    {
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.Up, OperationTarget.TileOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 2), () => SequentialCommandOneShotSmoothly(Position.Hexagon.Down, OperationTarget.TileOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 3), () => SequentialCommandOneShotSmoothly(Position.Hexagon.Center, OperationTarget.TileOnly, delayMilliSeconds, false));
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 4), () => SequentialCommandOneShotSmoothly(Position.Hexagon.All, OperationTarget.TileOnly, delayMilliSeconds / 2, false));
                    }
                }
                else if (40 <= bar && bar <= 43)
                {
                    // [静かなフレーズ・メロディ(低)]
                    // ﾝ ﾃﾚﾚｯﾚｯ-
                    // ﾝ ﾃﾚﾚｯﾚｯ-
                    // ﾝ ﾃﾚﾚｯﾚｯ-
                    // ﾚｰﾚｰﾚｰﾚｰ
                }
                else if (44 <= bar && bar <= 47)
                {
                    // [サビ前の溜め]
                    // ﾃﾞﾝｯﾃﾞﾚﾚﾚ
                    // ﾃﾞﾝｯﾃﾞﾚﾚﾚ
                    // ﾃﾞﾝｯﾃﾞﾃﾞﾝｯﾝﾃﾞ
                    // ﾃﾞｯﾃﾞｯﾃﾞｯﾃﾞｯ
                }
                else if (48 <= bar && bar <= 55)
                {
                    // [サビ]
                    if (bar % 4 != 0)
                    {
                        // ﾃﾞﾚﾚﾚﾚﾚﾚﾚﾃﾞﾚﾚﾚﾚﾚﾚﾚ * 3
                    }
                    else
                    {
                        // ﾃﾞｯﾚﾚﾚﾚﾚ
                    }
                }
                else if (56 <= bar && bar <= 61)
                {
                    // [クールダウン]
                    // ﾃﾞﾝｯﾃﾞﾚﾚﾚ
                    // ﾃﾞﾝｯﾃﾞﾚﾚﾚ (↑)
                    // ﾃｯﾃｯﾃｯﾃｯ
                    // ﾃｯﾃｯﾃｯﾃｯ
                    // ﾃﾚﾚﾚﾚﾚﾚﾚ
                    // ﾃﾚﾚﾚﾚﾚﾚﾚ
                }
                else if (62 <= bar && bar <= 62)
                {
                    // [静かなフレーズ]
                    // ﾃﾞﾝﾃﾞﾝﾃﾞﾝﾃﾞﾝﾃﾞﾝﾃﾞﾝﾃﾞﾝﾃﾞﾝ * 4
                }
                else if (66 <= bar && bar <= 71)
                {
                    // [静かなフレーズ・コーラス]
                    // ﾎｰｵｰｵｰｵｰ
                    // ｵｰｵｰｵｰｵｰ
                    // ｵｰｵｰｵｰｵｰ
                    // ｵｰｵｰｵｰｵｰ
                    // ｵｰｵｰｵｰｵｰ
                    // ｵｰｵｰｵｰｵｰ
                }
                else if (72 <= bar && bar <= 77)
                {
                    // [静かなフレーズ・コーラス(高)]
                    // (↑)ﾎｰｵｰｵｰｵｰ
                    // ﾎｰｵｰｵｰｵｰ
                    // ﾎｰｵｰｵｰｵｰ
                    // (↑)ｵｰｰｰ
                    // ----
                    // ----
                }
                else if (78 <= bar && bar <= 81)
                {
                    // [サビ前の溜め]
                    // ﾃﾞﾝｯﾃﾞﾚﾚﾚ
                    // ﾃﾞﾝｯﾃﾞﾚﾚﾚ
                    // ﾃﾞﾝｯﾃﾞﾃﾞﾝｯﾝﾃﾞ
                    // ﾃﾞｯﾃﾞｯﾃﾞｯﾃﾞｯ
                }
                else if (82 <= bar && bar <= 88)
                {
                    // [サビ]
                    if (bar % 4 != 0)
                    {
                        // ﾃﾞﾚﾚﾚﾚﾚﾚﾚﾃﾞﾚﾚﾚﾚﾚﾚﾚ * 3
                    }
                    else
                    {
                        // ﾃﾞｯﾚﾚﾚﾚﾚ
                    }
                }
                else if (89 <= bar && bar <= 92)
                {
                    // [ラスサビ前の溜め]
                    // ﾃﾞﾝｯ(ﾚﾚﾚﾚﾚﾚﾚﾚ)
                    // ﾃﾞﾝｯ(ﾚﾚﾚﾚﾚﾚﾚﾚ)
                    // ﾃﾞﾝｯ(ﾚﾚﾚﾚ)ﾃﾞﾝｯ(ﾚﾚﾚﾚ)
                    // ﾃﾞﾝｯ(ﾚﾚ)ﾃﾞﾝｯ(ﾚﾚ)ﾃﾞﾝｯ(ﾚﾚ)ﾃﾞﾝｯ(ﾚﾚ)
                }
                else if (93 <= bar && bar <= 102)
                {
                    // [ラスサビ]
                    // ﾃﾞﾚﾚﾚﾚﾚﾚﾚﾃﾞﾚﾚﾚﾚﾚﾚﾚ
                    // ﾃﾞﾚﾚﾚﾚﾚﾚﾚﾃﾞﾚﾚﾚﾚﾚﾚﾚ
                    // ﾃﾞﾚﾚﾚﾚﾚﾚﾚﾃﾞﾚﾚﾚﾚﾚﾚﾚ
                    // ﾃﾞﾚﾚﾚﾚﾚﾚﾚﾃﾞﾚﾚﾚﾚﾚﾚﾚ
                    // ﾃﾞﾚﾚﾚﾚﾚﾚﾚﾃﾞﾚﾚﾚﾚﾚﾚﾚ
                    // ﾃﾞﾚﾚﾚﾚﾚﾚﾚﾃﾞﾚﾚﾚﾚﾚﾚﾚ
                    // ﾃﾞﾚﾚﾚﾚﾚﾚﾚﾃﾞﾚﾚﾚﾚﾚﾚﾚ (ﾃﾞｰﾃﾞｰﾃﾞｰﾃﾞｰ↑)
                    // ﾃﾞﾚﾚﾚﾚﾚﾚﾚﾃﾞﾚﾚﾚﾚﾚﾚﾚ (ﾃﾞｰﾃﾞｰﾃﾞｰﾃﾞｰ↑)
                    // ﾃﾞﾚﾚﾚﾚﾚﾚﾚﾃﾞﾚﾚﾚﾚﾚﾚﾚ (ﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞ↑)
                    // ﾃﾞﾚﾚﾚﾚﾚﾚﾚﾃﾞﾚﾚﾚﾚﾚﾚﾚ (ﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞ↑)
                }
                else if (103 <= bar && bar <= 110)
                {
                    // [ラスト盛り上がり]
                    // ﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞ
                    // ﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞ
                    // ﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞ
                    // ﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞﾃﾞ
                    // ﾃﾞﾚﾚﾚﾚﾚﾚﾚﾃﾞﾚﾚﾚﾚﾚﾚﾚ (↑↓)
                    // ﾃﾞﾚﾚﾚﾚﾚﾚﾚﾃﾞﾚﾚﾚﾚﾚﾚﾚ (↑↓)
                    // ﾃﾞﾚﾚﾚﾚﾚﾚﾚﾃﾞﾚﾚﾚﾚﾚﾚﾚ (↑↓)
                    // ﾃﾞﾚﾚﾚﾚﾚﾚﾚﾃﾞﾚﾚﾚﾚﾚﾚﾚ (↑↓)
                }
                else if (111 <= bar && bar <= 113)
                {
                    // [ラスサビ〆]
                    // ﾃﾞｰｰｰｰｰｰｰｰ
                    // --------
                    // ﾃﾞﾝｯ

                    // ランダムに全部品の ON/OFF を行う
                    // 最後のﾃﾞﾝｯで全点灯で〆

                    if (bar == 111)
                    {
                        // 調整パラメータ
                        const int OnOffCount = 250;
                        const byte LastBrightness = 7;  // 0~15
                        const int OneShotTime = 100;

                        var rand = new Random(0);

                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar), () => ExecuteCommand(m_garden.MakeBrightnessCommand(Position.Hexagon.All, OperationTarget.Both, new BrickCommandArgs.Brightness(LastBrightness))));

                        for (int i = 0; i < OnOffCount; i++)
                        {
                            var position = Position.Hexagon.Random(rand);
                            var target = (rand.Next(0, 2) == 0) ? OperationTarget.TileOnly : OperationTarget.InsertedOnly;
                            // 最後の 8 分は何も表示しない休符を仕込む
                            var timing = (int)music.GetNoteTime(bar) + rand.Next(0, music.GetNoteLengthTime(8, 15));
                            
                            commandSequencer.SetTimedEvent(timing, () => SequentialCommandOneShot(position, target, OneShotTime));

                            // (不採用) OneShotSmoothly の場合柔らかくなりすぎてよろしくない。さらに処理が間に合わなくなりやすい。
                            //commandSequencer.SetTimedEvent(timing, () => SequentialCommandOneShotSmoothly(position, target, 30, true));
                        }
                    }
                    if (bar == 113)
                    {
                        commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.All, OperationTarget.Both, 10, true));
                    }
                }
                else
                {
                    // TORIAEZU:
                    commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 1), () => SequentialCommandOneShotSmoothly(Position.Hexagon.All, OperationTarget.InsertedOnly, 10, true));
                    commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 2), () => SequentialCommandOneShotSmoothly(Position.Hexagon.All, OperationTarget.TileOnly, 10, true));
                    commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 3), () => SequentialCommandOneShotSmoothly(Position.Hexagon.All, OperationTarget.TileOnly, 10, true));
                    commandSequencer.SetTimedEvent(music.GetNoteTime(bar, 4, 4), () => SequentialCommandOneShotSmoothly(Position.Hexagon.All, OperationTarget.TileOnly, 10, true));
                }
            }

            var reader = new AudioFileReader("./Music/Wizards_in_Winter.mp3");
            reader.Volume = 0.2f;

            var waveOut = new WaveOut();
            waveOut.Init(reader);

            await Task.Run(() =>
            {
                //int timing = music.GetNoteTime(1, 8, 1);      // イントロ (最初)
                //int timing = music.GetNoteTime(9, 8, 1);        // イントロ・伴奏あり
                //int timing = music.GetNoteTime(32, 8, 1);        // 静かなフレーズ
                //int timing = music.GetNoteTime(66, 8, 1);     // 静かなフレーズ・コーラス
                int timing = music.GetNoteTime(111 - 1, 4, 2);     // ラスサビ直前から

                reader.CurrentTime = TimeSpan.FromMilliseconds(timing);
                waveOut.Play();
                
                commandSequencer.Run(timing);
            });
        }
    }
}
