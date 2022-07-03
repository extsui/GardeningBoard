using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using YamlDotNet;
using YamlDotNet.RepresentationModel;

namespace Sprinkler
{
    /// <summary>
    /// Pump 制御関連
    /// </summary>
    public class PumpUtil
    {
        public const string SendCommandHeader = "@send ";

        // 例: "@send 60030103\n" : グループ 60 の BrickId=3 を Tile(=3) で登録
        // 例: "@send 61000102\n" : グループ 61 の BrickId=0 を House(=2) で登録
        public static string MakeRegisterBrickCommand(byte groupAddress, byte brickAddress, byte brickType)
        {
            return SendCommandHeader +
                groupAddress.ToString("X2") +
                brickAddress.ToString("X2") +
                "01" +
                brickType.ToString("X2") +
                "\n";
        }

        // 例: "@send 60050200000000\n" : グループ 60 の BrickId=5 を Pattern=0, StepTiming=0[ms], Repeat 無し でパターン設定
        // 例: "@send 61030204006401\n" : グループ 61 の BrickId=3 を Pattern=4, StepTiming=100[ms], Repeat 有り でパターン設定
        public static string MakeSetPatternCommand(byte groupAddress, byte brickAddress, byte patternId, ushort stepTiming, bool isRepeat)
        {
            return SendCommandHeader +
                groupAddress.ToString("X2") +
                brickAddress.ToString("X2") +
                "02" +
                patternId.ToString("X2") +
                stepTiming.ToString("X4") +
                ((isRepeat == true) ? "01" : "00") +
                "\n";
        }

        // 例: "@send 600201\n" : グループ 60 の brickAddress=02, Brightness=01 で輝度設定
        public static string MakeSetBrightnessCommand(byte groupAddress, byte brickAddress, byte brightness)
        {
            return SendCommandHeader +
                groupAddress.ToString("X2") +
                brickAddress.ToString("X2") +
                "03" +
                brightness.ToString("X2") +
                "\n";
        }

        // 例: "@send 60020064\n" : グループ 60 の brickAddress=02, StepTiming=100[ms] で周期設定
        // 例: "@send 6002FFFF\n" : グループ 60 の brickAddress=02, StepTiming=65535[ms] で周期設定
        public static string MakeSetStepTimingCommand(byte groupAddress, byte brickAddress, ushort stepTiming)
        {
            return SendCommandHeader +
                groupAddress.ToString("X2") +
                brickAddress.ToString("X2") +
                "04" +
                stepTiming.ToString("X4") +
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
            throw new NotSupportedException("path 指定を使用すること");
        }

        public Garden(string path)
        {
            var reader = new StreamReader(path, Encoding.UTF8);
            var yaml = new YamlStream();
            yaml.Load(reader);
            var root = (YamlMappingNode)yaml.Documents[0].RootNode;

            var balanGroupsInstance = new List<Balan>();

            var garden = (YamlSequenceNode)root.Children[new YamlScalarNode("Garden")];
            var gardenMapping = (YamlMappingNode)garden.Children[0];
            var balanGroups = (YamlSequenceNode)gardenMapping.Children[new YamlScalarNode("BalanGroups")];

            foreach (YamlMappingNode balanGroupsMapping in balanGroups.Children)
            {
                var operationUnitsInstance = new List<OperationUnit>();

                var balanAddress = (string)balanGroupsMapping.Children[new YamlScalarNode("BalanAddress")];
                var operationUnits = (YamlSequenceNode)balanGroupsMapping.Children[new YamlScalarNode("OperationUnits")];

                foreach (YamlMappingNode operationUnitsMapping in operationUnits.Children)
                {
                    var position = (string)operationUnitsMapping.Children[new YamlScalarNode("Position")];

                    var brick = (YamlSequenceNode)operationUnitsMapping.Children[new YamlScalarNode("Brick")];
                    var brickMapping = (YamlMappingNode)brick.Children[0];
                    var brickAddress = (string)brickMapping.Children[new YamlScalarNode("BrickAddress")];
                    var brickType    = (string)brickMapping.Children[new YamlScalarNode("BrickType")];
                    var brickColor   = (string)brickMapping.Children[new YamlScalarNode("BrickColor")];

                    // インスタンス化
                    var brickInstance = new Brick(
                        byte.Parse(brickAddress),
                        (BrickType)Enum.Parse(typeof(BrickType), brickType),
                        (BrickColor)Enum.Parse(typeof(BrickColor), brickColor));
                    // TODO: 他の図形対応時に拡張すること (Position.ParseXxx())
                    var positionInstance = Position.ParseHexagon(position);

                    var operationUnitInstance = new OperationUnit(brickInstance, positionInstance);
                    operationUnitsInstance.Add(operationUnitInstance);
                }

                // インスタンス化
                var balanAddressInstance = Convert.ToByte(balanAddress, 16);
                var balanInstance = new Balan(balanAddressInstance, operationUnitsInstance);
                balanGroupsInstance.Add(balanInstance);
            }

            // インスタンス化
            Balans = balanGroupsInstance;
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

        private Func<byte, byte, BrickCommandArgs, string> OperateStepTiming = (groupAddress, brickAddress, args) =>
        {
            Trace.Assert(args.StepTimingArgs.HasValue == true);
            var stepTiming = args.StepTimingArgs.Value;
            return PumpUtil.MakeSetStepTimingCommand(groupAddress, brickAddress, stepTiming);
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

                    // コマンドを送信する対象か否かの判定
                    // - Both なら問答無用で OK
                    // - GrassOnly, TreeOnly, HouseOnly, TileOnly で BrickType 一致なら OK
                    // - InsertedOnly で IsInserted() == true なら OK
                    if ((target == OperationTarget.Both) ||
                        ((unit.Brick.Type == BrickType.Grass) && (target == OperationTarget.GrassOnly)) ||
                        ((unit.Brick.Type == BrickType.Tree) && (target == OperationTarget.TreeOnly)) ||
                        ((unit.Brick.Type == BrickType.House) && (target == OperationTarget.HouseOnly)) ||
                        ((unit.Brick.Type == BrickType.Tile) && (target == OperationTarget.TileOnly)) ||
                        ((unit.Brick.IsInserted() && (target == OperationTarget.InsertedOnly))))
                    {
                        commands.Add(operate(balan.Address, unit.Brick.Address, args));
                    }
                }
            }

            // コマンドが空の場合も発生しうるがこれは正常系。
            // 例: 草+土台 の位置に TreeOnly を指定したケース
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

        public List<string> MakeStepTimingCommand(uint position, OperationTarget target, ushort stepTiming)
        {
            return MakeGenericCommand(position, target, OperateStepTiming, new BrickCommandArgs(stepTiming));
        }

        public List<string> MakeStepTimingCommand(List<uint> positions, OperationTarget target, ushort stepTiming)
        {
            return MakeGenericCommand(positions, target, OperateStepTiming, new BrickCommandArgs(stepTiming));
        }
    }

    /// <summary>
    /// 部品コマンド引数
    /// </summary>
    public class BrickCommandArgs
    {
        // インスタンスでいずれか一つのみを排他使用する
        public Pattern PatternArgs { get; private set; }
        public Brightness BrightnessArgs { get; private set; }
        public ushort? StepTimingArgs { get; private set; }

        public class Pattern
        {
            public byte Id { get; private set; }
            public ushort StepTiming { get; private set; }
            public bool IsRepeat { get; private set; }

            public Pattern(byte id, ushort stepTiming, bool isRepeat)
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
            StepTimingArgs = null;
        }

        public BrickCommandArgs(Brightness brightness)
        {
            PatternArgs    = null;
            BrightnessArgs = brightness;
            StepTimingArgs = null;
        }

        public BrickCommandArgs(ushort stepTiming)
        {
            PatternArgs    = null;
            BrightnessArgs = null;
            StepTimingArgs = stepTiming;
        }
    }

    /// <summary>
    /// 指示対象
    /// </summary>
    public enum OperationTarget
    {
        // 指定した部品のみが対象
        GrassOnly = 0,
        TreeOnly,
        HouseOnly,
        TileOnly,

        // 挿入部品 (土台以外) が対象
        InsertedOnly,

        // 挿入部品と土台の両方が対象
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

        static public uint ParseHexagon(string position)
        {
            var dictionary = new Dictionary<string, uint>()
            {
                { "Hexagon.Up",        Hexagon.Up        },
                { "Hexagon.RightUp",   Hexagon.RightUp   },
                { "Hexagon.RightDown", Hexagon.RightDown },
                { "Hexagon.Down",      Hexagon.Down      },
                { "Hexagon.LeftDown",  Hexagon.LeftDown  },
                { "Hexagon.LeftUp",    Hexagon.LeftUp    },
                { "Hexagon.Center",    Hexagon.Center    },
            };
            Trace.Assert(dictionary.ContainsKey(position));
            return dictionary[position];
        }

        static public uint ParseTriangle(string position)
        {
            var dictionary = new Dictionary<string, uint>()
            {
                { "Triangle.Left",   Triangle.Left   },
                { "Triangle.Center", Triangle.Center },
                { "Triangle.Right",  Triangle.Right  },
            };
            Trace.Assert(dictionary.ContainsKey(position));
            return dictionary[position];
        }

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

            public static uint Random(Random random) => (uint)random.Next((int)Up, (int)Center + 1);

            public static readonly List<uint> All = new List<uint>
            {
                Up, RightUp, RightDown, Down, LeftDown, LeftUp, Center
            };

            public static readonly List<uint> Surroundings = new List<uint>
            {
                Up, RightUp, RightDown, Down, LeftDown, LeftUp
            };

            public static readonly List<uint> Diagonal0Clock = new List<uint>
            {
                Up, Down,
            };

            public static readonly List<uint> Diagonal2Clock = new List<uint>
            {
                RightUp, LeftDown,
            };

            public static readonly List<uint> Diagonal4Clock = new List<uint>
            {
                RightDown, LeftUp,
            };

            public static readonly List<uint> StraightLine0Clock = new List<uint>
            {
                Up, Center, Down,
            };

            public static readonly List<uint> StraightLine2Clock = new List<uint>
            {
                RightUp, Center, LeftDown,
            };

            public static readonly List<uint> StraightLine4Clock = new List<uint>
            {
                RightDown, Center, LeftUp,
            };

            public static readonly List<uint> StraightLine6Clock = new List<uint>
            {
                Down, Center, Up,
            };

            public static readonly List<uint> StraightLine8Clock = new List<uint>
            {
                LeftDown, Center, RightUp,
            };

            public static readonly List<uint> StraightLine10Clock = new List<uint>
            {
                LeftUp, Center, RightDown,
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

        public bool IsInserted()
        {
            return Type != BrickType.Tile;
        }
    }
}
