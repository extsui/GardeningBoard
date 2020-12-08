using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;

namespace Sprinkler
{
    /// <summary>
    /// Pump 制御関連
    /// </summary>
    public class PumpUtil
    {
        // 例: "@send 60030103\n" : グループ 60 の BrickId=3 を Tile(=3) で登録
        // 例: "@send 61000102\n" : グループ 61 の BrickId=0 を House(=2) で登録
        public static string MakeRegisterBrickCommand(byte groupAddress, byte brickAddress, byte brickType)
        {
            return "@send " +
                groupAddress.ToString("X2") +
                brickAddress.ToString("X2") +
                "01" +
                brickType.ToString("X2") +
                "\n";
        }

        // 例: "@send 600502000000\n" : グループ 60 の BrickId=5 を Pattern=0, StepTiming=0[ms], Repeat 無し でパターン設定
        // 例: "@send 610302046401\n" : グループ 61 の BrickId=3 を Pattern=4, StepTiming=100[ms], Repeat 有り でパターン設定
        public static string MakeSetPatternCommand(byte groupAddress, byte brickAddress, byte patternId, byte stepTiming, bool isRepeat)
        {
            return "@send " +
                groupAddress.ToString("X2") +
                brickAddress.ToString("X2") +
                "02" +
                patternId.ToString("X2") +
                stepTiming.ToString("X2") +
                ((isRepeat == true) ? "01" : "00") +
                "\n";
        }

        // 例: "@send 600201\n" : グループ 60 の brickAddress=02, Brightness=01 で輝度設定
        public static string MakeSetBrightnessCommand(byte groupAddress, byte brickAddress, byte brightness)
        {
            return "@send " +
                groupAddress.ToString("X2") +
                brickAddress.ToString("X2") +
                "03" +
                brightness.ToString("X2") +
                "\n";
        }
    }

    /// <summary>
    /// 庭
    /// </summary>
    public class Garden
    {
        public List<Balan> Balans { get; private set; }

        public Garden()
        {
            // TORIAEZU: まずは固定設定
            var balans = new List<Balan>();
            {
                var units = new List<OperationUnit>
                {
                    new OperationUnit(new Brick(0, BrickType.House, BrickColor.Red    ), Position.Hexagon.Center   ),
                    new OperationUnit(new Brick(6, BrickType.Tile,  BrickColor.Red    ), Position.Hexagon.Center   ),
                    new OperationUnit(new Brick(3, BrickType.Grass, BrickColor.Orange ), Position.Hexagon.RightDown),
                    new OperationUnit(new Brick(4, BrickType.Tile,  BrickColor.Green  ), Position.Hexagon.RightDown),
                    new OperationUnit(new Brick(1, BrickType.Grass, BrickColor.Green  ), Position.Hexagon.Down     ),
                    new OperationUnit(new Brick(5, BrickType.Tile,  BrickColor.White  ), Position.Hexagon.Down     ),
                    new OperationUnit(new Brick(2, BrickType.Grass, BrickColor.Rainbow), Position.Hexagon.LeftDown ),
                    new OperationUnit(new Brick(7, BrickType.Tile,  BrickColor.Orange ), Position.Hexagon.LeftDown ),
                };
                balans.Add(new Balan(0x60, units));
            }
            {
                var units = new List<OperationUnit>
                {
                    new OperationUnit(new Brick(3, BrickType.Tree,  BrickColor.Yellow), Position.Hexagon.LeftUp ),
                    new OperationUnit(new Brick(4, BrickType.Tile,  BrickColor.White ), Position.Hexagon.LeftUp ),
                    new OperationUnit(new Brick(2, BrickType.Tile,  BrickColor.White ), Position.Hexagon.Up     ),
                    new OperationUnit(new Brick(6, BrickType.Tree,  BrickColor.Blue  ), Position.Hexagon.Up     ),
                    new OperationUnit(new Brick(5, BrickType.Tile,  BrickColor.Blue  ), Position.Hexagon.RightUp),
                    new OperationUnit(new Brick(1, BrickType.Tree,  BrickColor.Green ), Position.Hexagon.RightUp),
                };
                balans.Add(new Balan(0x61, units));
            }

            Balans = balans;
        }

        public Garden(string path)
        {
            // TODO: 設定ファイルから読み込むようにする
            throw new NotImplementedException();
        }

        public List<string> MakeRegisterCommand()
        {
            List<string> commands = new List<string>();
            foreach (var balan in Balans)
            {
                foreach (var unit in balan.Units)
                {
                    commands.Add(PumpUtil.MakeRegisterBrickCommand(balan.Address, unit.Brick.Address, (byte)unit.Brick.Type));
                }
            }
            return commands;
        }

        private Func<byte, byte, BrickCommandArgs, string> OperatePattern = (groupAddress, brickAddress, args) =>
        {
            BrickCommandArgs.Pattern pattern = args.PatternArgs;
            Trace.Assert(pattern != null);
            return PumpUtil.MakeSetPatternCommand(groupAddress, brickAddress, pattern.Id, pattern.StepTiming, pattern.IsRepeat);
        };

        private Func<byte, byte, BrickCommandArgs, string> OperateBrightness = (groupAddress, brickAddress, args) =>
        {
            BrickCommandArgs.Brightness brightness = args.BrightnessArgs;
            Trace.Assert(brightness != null);
            return PumpUtil.MakeSetBrightnessCommand(groupAddress, brickAddress, brightness.Value);
        };

        /// <summary>
        /// (Position, Target) に対する汎用コマンドの処理部分
        /// </summary>
        private List<string> MakeGenericCommandCore(uint position, OperationTarget target, Func<byte, byte, BrickCommandArgs, string> operate, BrickCommandArgs args)
        {
            List<string> commands = new List<string>();

            // 位置が一致するものを Balans から検索し対象を絞って指示する
            foreach (var balan in Balans)
            {
                foreach (var unit in balan.Units)
                {
                    if (position != unit.Position)
                    {
                        continue;
                    }

                    switch (target)
                    {
                        case OperationTarget.TileOnly:
                            if (unit.Brick.IsTile())
                            {
                                commands.Add(operate(balan.Address, unit.Brick.Address, args));
                            }
                            break;

                        case OperationTarget.InsertedOnly:
                            if (unit.Brick.IsInserted())
                            {
                                commands.Add(operate(balan.Address, unit.Brick.Address, args));
                            }
                            break;

                        case OperationTarget.Both:
                            commands.Add(operate(balan.Address, unit.Brick.Address, args));
                            break;

                        default:
                            throw new InvalidOperationException("Invalid OperationTarget.");
                    }
                }
            }
            if (commands.Count == 0)
            {
                // position の事前条件チェックは省略しているが
                // 意図しない値の場合は一致しないのでここで引っ掛かる
                throw new InvalidOperationException("Target not found.");
            }
            return commands;
        }

        // 単独に対する指示
        private List<string> MakeGenericCommand(uint position, OperationTarget target, Func<byte, byte, BrickCommandArgs, string> operate, BrickCommandArgs args)
        {
            return MakeGenericCommandCore(position, target, operate, args);
        }

        // 複数位置に対する指示
        private List<string> MakeGenericCommand(List<uint> positions, OperationTarget target, Func<byte, byte, BrickCommandArgs, string> operate, BrickCommandArgs args)
        {
            List<string> commands = new List<string>();
            foreach (var potision in positions)
            {
                commands.AddRange(MakeGenericCommand(potision, target, operate, args));
            }
            return commands;
        }

        public List<string> MakePatternCommand(uint position, OperationTarget target, BrickCommandArgs.Pattern pattern)
        {
            return MakeGenericCommand(position, target, OperatePattern, new BrickCommandArgs(pattern));
        }

        public List<string> MakePatternCommand(List<uint> positions, OperationTarget target, BrickCommandArgs.Pattern pattern)
        {
            return MakeGenericCommand(positions, target, OperatePattern, new BrickCommandArgs(pattern));
        }

        public List<string> MakeBrightnessCommand(uint position, OperationTarget target, BrickCommandArgs.Brightness brightness)
        {
            return MakeGenericCommand(position, target, OperateBrightness, new BrickCommandArgs(brightness));
        }

        public List<string> MakeBrightnessCommand(List<uint> positions, OperationTarget target, BrickCommandArgs.Brightness brightness)
        {
            return MakeGenericCommand(positions, target, OperateBrightness, new BrickCommandArgs(brightness));
        }
    }

    /// <summary>
    /// 部品コマンド引数
    /// </summary>
    public class BrickCommandArgs
    {
        // インスタンスでどちらか一方のみを排他使用する
        public Pattern PatternArgs { get; private set; }
        public Brightness BrightnessArgs { get; private set; }

        public class Pattern
        {
            public byte Id { get; private set; }
            public byte StepTiming { get; private set; }
            public bool IsRepeat { get; private set; }

            public Pattern(byte id, byte stepTiming, bool isRepeat)
            {
                Id = id;
                StepTiming = stepTiming;
                IsRepeat = isRepeat;
            }
        }

        public static readonly Pattern PatternTurnOn  = new Pattern(0, 0, false);
        public static readonly Pattern PatternTurnOff = new Pattern(1, 0, false);

        // MEMO: 引数型をラップしたことで輝度調整がかけやすくなる?
        // (例: Brightness.Min, Low, Mid, High, Max)
        public class Brightness
        {
            public byte Value { get; private set; }

            public Brightness(byte value)
            {
                Value = value;
            }   
        }

        public BrickCommandArgs(Pattern pattern)
        {
            PatternArgs    = pattern;
            BrightnessArgs = null;
        }

        public BrickCommandArgs(Brightness brightness)
        {
            PatternArgs    = null;
            BrightnessArgs = brightness;
        }
    }

    /// <summary>
    /// 指示対象
    /// </summary>
    public enum OperationTarget
    {
        TileOnly = 0,
        InsertedOnly,
        Both,
    }

    /// <summary>
    /// Brick を束ねたグループ
    /// Balan (GroundGrowing) に対応する。
    /// </summary>
    public class Balan
    {
        public const int UnitCountMax = 8;

        public byte Address { get; private set; }
        public List<OperationUnit> Units { get; private set; }

        public Balan(byte address, List<OperationUnit> units)
        {
            Trace.Assert(units.Count <= UnitCountMax);

            Address = address;
            Units = units;
        }
    }

    /// <summary>
    /// Brick の位置情報
    /// 各 Brick を別名 (位置) で指示できるようにするための識別情報
    /// </summary>
    public class Position
    {
        public const uint FormationMask     = 0xFFFFFF00;
        public const uint FormationHexagon  = 0x00000100;
        public const uint FormationTriangle = 0x00000200;

        // -------------
        //       1
        //  6         2
        //       7
        //  5         3
        //       4
        // -------------
        public class Hexagon
        {
            public const uint Up        = (FormationHexagon | 0x01);
            public const uint RightUp   = (FormationHexagon | 0x02);
            public const uint RightDown = (FormationHexagon | 0x03);
            public const uint Down      = (FormationHexagon | 0x04);
            public const uint LeftDown  = (FormationHexagon | 0x05);
            public const uint LeftUp    = (FormationHexagon | 0x06);
            public const uint Center    = (FormationHexagon | 0x07);

            public static readonly List<uint> All = new List<uint>
            {
                Up, RightUp, RightDown, Down, LeftDown, LeftUp, Center
            };
        }

        // -------------
        //       2
        //  1         3
        // -------------
        public class Triangle
        {
            public const uint Left   = (FormationTriangle | 0x01);
            public const uint Center = (FormationTriangle | 0x02);
            public const uint Right  = (FormationTriangle | 0x03);

            public static readonly List<uint> All = new List<uint>
            {
                Left, Center, Right
            };
        }
    }

    /// <summary>
    /// 指示単位 (部品 + 位置)
    /// - 「土台 (Tile/...) + 挿入部品 (Grass/...)」がセットで同じ位置を設定されることを想定
    /// </summary>
    public class OperationUnit
    {
        public Brick Brick { get; private set; }
        public uint Position { get; private set; }
        public OperationUnit(Brick brick, uint position)
        {
            Brick = brick;
            Position = position;
        }
    }

    /// <summary>
    /// 部品種別
    /// </summary>
    public enum BrickType : byte
    {
        Grass = 0x00,
        Tree  = 0x01,
        House = 0x02,
        Tile  = 0x03,
    }

    /// <summary>
    /// 使用している LED の色
    /// MEMO: 指示に使うかは未定
    /// </summary>
    public enum BrickColor
    {
        Red = 0,
        Green,
        Blue,
        Orange,
        Yellow,
        White,
        Rainbow,
    }

    /// <summary>
    /// 部品
    /// </summary>
    public class Brick
    {
        public byte Address { get; private set; }
        public BrickType Type { get; private set; }
        public BrickColor Color { get; private set; }

        public Brick(byte address, BrickType type, BrickColor color)
        {
            Address = address;
            Type = type;
            Color = color;
        }

        public bool IsTile()
        {
            return Type == BrickType.Tile;
        }

        public bool IsInserted()
        {
            return !IsTile();
        }
    }
}
