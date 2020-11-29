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
                    new OperationUnit(new Brick(0, BrickType.House, BrickColor.Red    ), Position.Hexagon_Center   ),
                    new OperationUnit(new Brick(6, BrickType.Tile,  BrickColor.Red    ), Position.Hexagon_Center   ),
                    new OperationUnit(new Brick(3, BrickType.Grass, BrickColor.Orange ), Position.Hexagon_RightDown),
                    new OperationUnit(new Brick(4, BrickType.Tile,  BrickColor.Green  ), Position.Hexagon_RightDown),
                    new OperationUnit(new Brick(1, BrickType.Grass, BrickColor.Green  ), Position.Hexagon_Down     ),
                    new OperationUnit(new Brick(5, BrickType.Tile,  BrickColor.White  ), Position.Hexagon_Down     ),
                    new OperationUnit(new Brick(2, BrickType.Grass, BrickColor.Rainbow), Position.Hexagon_LeftDown ),
                    new OperationUnit(new Brick(7, BrickType.Tile,  BrickColor.Orange ), Position.Hexagon_LeftDown ),
                };
                balans.Add(new Balan(0x60, units));
            }
            {
                var units = new List<OperationUnit>
                {
                    new OperationUnit(new Brick(3, BrickType.Tree,  BrickColor.Yellow), Position.Hexagon_LeftUp ),
                    new OperationUnit(new Brick(4, BrickType.Tile,  BrickColor.White ), Position.Hexagon_LeftUp ),
                    new OperationUnit(new Brick(2, BrickType.Tile,  BrickColor.White ), Position.Hexagon_Up     ),
                    new OperationUnit(new Brick(6, BrickType.Tree,  BrickColor.Blue  ), Position.Hexagon_Up     ),
                    new OperationUnit(new Brick(5, BrickType.Tile,  BrickColor.Blue  ), Position.Hexagon_RightUp),
                    new OperationUnit(new Brick(1, BrickType.Tree,  BrickColor.Green ), Position.Hexagon_RightUp),
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
                    commands.Add(PumpUtil.MakeRegisterBrickCommand((byte)balan.Address, unit.Brick.Address, (byte)unit.Brick.Type));
                }
            }
            return commands;
        }

        public List<string> MakeOperationCommand(Position position, OperationTarget target, byte patternId, byte stepTiming, bool isRepeat)
        {
            List<string> commands = new List<string>();

            // 位置が一致するものを Balans から検索し対象を絞って指示する
            foreach (var balan in Balans)
            {
                foreach (var unit in balan.Units)
                {
                    // TODO: Hexagon 以外の対応が必要
                    if (position == Position.Hexagon_All)
                    {
                        commands.Add(PumpUtil.MakeSetPatternCommand(balan.Address, unit.Brick.Address, patternId, stepTiming, isRepeat));
                    }
                    else if (position == unit.Position)
                    {
                        switch (target)
                        {
                            case OperationTarget.TileOnly:
                                if (unit.Brick.IsTile())
                                {
                                    commands.Add(PumpUtil.MakeSetPatternCommand(balan.Address, unit.Brick.Address, patternId, stepTiming, isRepeat));
                                }
                                break;

                            case OperationTarget.InsertedOnly:
                                if (unit.Brick.IsInserted())
                                {
                                    commands.Add(PumpUtil.MakeSetPatternCommand(balan.Address, unit.Brick.Address, patternId, stepTiming, isRepeat));
                                }
                                break;

                            case OperationTarget.Both:
                                commands.Add(PumpUtil.MakeSetPatternCommand(balan.Address, unit.Brick.Address, patternId, stepTiming, isRepeat));
                                break;

                            default:
                                throw new InvalidOperationException();
                        }
                    }
                }
            }
            if (commands.Count == 0)
            {
                throw new InvalidOperationException("Target not found.");
            }
            return commands;
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

    internal static class PositionConstant
    {
        public const uint FormationMask     = 0xFFFFFF00;
        public const uint FormationHexagon  = 0x00000100;
        public const uint FormationTriangle = 0x00000200;
    }

    /// <summary>
    /// Brick の位置情報
    /// 各 Brick を別名 (位置) で指示できるようにするための識別情報
    /// </summary>
    public enum Position : uint
    {
        // -------------
        //       1
        //  6         2
        //       7
        //  5         3
        //       4
        // -------------
        Hexagon_Up        = (PositionConstant.FormationHexagon | 0x01),
        Hexagon_RightUp   = (PositionConstant.FormationHexagon | 0x02),
        Hexagon_RightDown = (PositionConstant.FormationHexagon | 0x03),
        Hexagon_Down      = (PositionConstant.FormationHexagon | 0x04),
        Hexagon_LeftDown  = (PositionConstant.FormationHexagon | 0x05),
        Hexagon_LeftUp    = (PositionConstant.FormationHexagon | 0x06),
        Hexagon_Center    = (PositionConstant.FormationHexagon | 0x07),
        Hexagon_All       = (PositionConstant.FormationHexagon | 0xFF),

        // -------------
        //       2
        //  1         3
        // -------------
        Triangle_Left     = (PositionConstant.FormationTriangle | 0x01),
        Triangle_Center   = (PositionConstant.FormationTriangle | 0x02),
        Triangle_Right    = (PositionConstant.FormationTriangle | 0x03),
    }

    /// <summary>
    /// 指示単位 (部品 + 位置)
    /// - 「土台 (Tile/...) + 挿入部品 (Grass/...)」がセットで同じ位置を設定されることを想定
    /// </summary>
    public class OperationUnit
    {
        public Brick Brick { get; private set; }
        public Position Position { get; private set; }
        public OperationUnit(Brick brick, Position position)
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
