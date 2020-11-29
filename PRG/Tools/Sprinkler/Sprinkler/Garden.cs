using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Sprinkler
{
    /// <summary>
    /// 庭
    /// </summary>
    public class Garden
    {
        public List<Balan> Balans { get; private set; }

        /// <summary>
        /// 指示対象
        /// </summary>
        public enum OperationTarget
        {
            TileOnly = 0,
            InsertedOnly,
            Both,
        }

        public Garden()
        {
            // TORIAEZU: まずは固定設定
            var balans = new List<Balan>();
            {
                var units = new List<OperationUnit>
                {
                    new OperationUnit(new Brick(0x70, BrickType.House, BrickColor.Red    ), Position.Hexagon_Center   ),
                    new OperationUnit(new Brick(0x71, BrickType.Grass, BrickColor.Green  ), Position.Hexagon_Down     ),
                    new OperationUnit(new Brick(0x72, BrickType.Grass, BrickColor.Rainbow), Position.Hexagon_LeftDown ),
                    new OperationUnit(new Brick(0x73, BrickType.Grass, BrickColor.Orange ), Position.Hexagon_RightDown),
                    new OperationUnit(new Brick(0x74, BrickType.Tile,  BrickColor.Green  ), Position.Hexagon_RightDown),
                    new OperationUnit(new Brick(0x75, BrickType.Tile,  BrickColor.White  ), Position.Hexagon_Down     ),
                    new OperationUnit(new Brick(0x76, BrickType.Tile,  BrickColor.Red    ), Position.Hexagon_Center   ),
                    new OperationUnit(new Brick(0x77, BrickType.Tile,  BrickColor.Orange ), Position.Hexagon_LeftDown ),
                };
                balans.Add(new Balan(0x60, units));
            }
            {
                var units = new List<OperationUnit>
                {
                    new OperationUnit(new Brick(0x70, BrickType.Tree,  BrickColor.Green ), Position.Hexagon_RightUp),
                    new OperationUnit(new Brick(0x71, BrickType.Tree,  BrickColor.Blue  ), Position.Hexagon_Up     ),
                    new OperationUnit(new Brick(0x72, BrickType.Tree,  BrickColor.Yellow), Position.Hexagon_LeftUp ),
                    new OperationUnit(new Brick(0x73, BrickType.Tile,  BrickColor.White ), Position.Hexagon_Up     ),
                    new OperationUnit(new Brick(0x74, BrickType.Tile,  BrickColor.Blue  ), Position.Hexagon_RightUp),
                    new OperationUnit(new Brick(0x75, BrickType.Tile,  BrickColor.Yellow), Position.Hexagon_LeftUp ),
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

        public string[] MakeOperation(Position position, OperationTarget target, byte patternId, byte stepTiming, bool isRepeat)
        {
            // 位置が一致するものを Balans から検索し対象を絞って指示する
            foreach (var balan in Balans)
            {
                foreach (var unit in balan.Units)
                {
                    if (unit.Position == position)
                    {
                        switch (target)
                        {
                            case OperationTarget.TileOnly:
                                if (unit.Brick.IsTile())
                                {
                                    // TODO: pick
                                }
                                break;

                            case OperationTarget.InsertedOnly:
                                if (unit.Brick.IsInserted())
                                {
                                    // TODO: pick
                                }
                                break;

                            case OperationTarget.Both:
                                // TODO: pick
                                break;

                            default:
                                throw new InvalidOperationException();
                        }
                    }
                }
            }

            // MEMO: 送信文字列を返す?
            return xxx;
        }
    }

    public class Balan
    {
        public int Id { get; private set; }
        public List<OperationUnit> Units { get; private set; }

        public Balan(int id, List<OperationUnit> units)
        {
            Id = id;
            Units = units;
        }
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
        Hexagon_Up        = (PositionConstant.FormationHexagon | 1),
        Hexagon_RightUp   = (PositionConstant.FormationHexagon | 2),
        Hexagon_RightDown = (PositionConstant.FormationHexagon | 3),
        Hexagon_Down      = (PositionConstant.FormationHexagon | 4),
        Hexagon_LeftDown  = (PositionConstant.FormationHexagon | 5),
        Hexagon_LeftUp    = (PositionConstant.FormationHexagon | 6),
        Hexagon_Center    = (PositionConstant.FormationHexagon | 7),

        // -------------
        //       2
        //  1         3
        // -------------
        Triangle_Left     = (PositionConstant.FormationTriangle | 1),
        Triangle_Center   = (PositionConstant.FormationTriangle | 2),
        Triangle_Right    = (PositionConstant.FormationTriangle | 3),
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
