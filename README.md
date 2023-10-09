# GardeningBoard
## 概要
- ガーデニングボードは着脱可能基板を自由に抜き差しして自分好みの作品を生み出せるというコンセプトの作品です。
- 当初はガーデニングにちなんで庭関連の基板ばかり作っていましたが、現在はガーデニングという手法をベースにした表現に概念を拡張しています。
  - 系譜：KawaiiMakeMyBoard --> GardeningBoard --> Fountain

## 基板
| 基板名   | 形状                  | 概要                                                                                      | 組み上げ対象作品       |
|----------|-----------------------|-------------------------------------------------------------------------------------------|------------------------|
| Grass    | 草                    | 挿入部品                                                                                  | GardeningBoard 等      |
| Tree     | 木                    | 挿入部品                                                                                  | GardeningBoard 等      |
| House    | 家                    | 挿入部品                                                                                  | GardeningBoard 等      |
| Land     | 正方形 (旧式)・上部側 | 挿入部品用穴付き・半田接合式                                                              | KawaiiMakeMyBoard 専用 |
| Base     | 正方形 (旧式)・下部側 | カードエッジコネクタ土台                                                                  | KawaiiMakeMyBoard 専用 |
| Tile     | 正六角形・上部側      | 挿入部品用穴付き                                                                          | GardeningBoard 等      |
| Ground   | 正六角形・下部側      | STM32F303 使用、Pillar からの信号を挿入分に分配<br>STM 未実装を Base の代わりとしても使用 | GardeningBoard 専用    |
| Pillar   | 正六角形・最下部側    | SeeduinoXIAO 使用、単体動作可、GardeningBoard 制御の最上位                                | GardeningBoard 専用    |
| Building | 縦長長方形・挿入部品  | 7セグ6桁x6行、GardeningBoard と互換性無し                                                 | 新規                   |
| Fountain | 正六角形・下部側      | XIAO-ESP32C3 使用、Building・Tile 想定                                                    | 新規                   |

※順番は開発順

## プログラム
- Firmware/Balan
  - Ground に搭載されている STM32F303 向けのプログラム
  - 上位 I2C から受け取ったデータ (点灯パターン等) を元に、下位 I2C に接続されている HT16K33 を制御する
- M5Stack/Pump
  - PC から USB シリアル経由で受信したデータを Balan に送信する M5Stack 向けのプログラム
  - Balan への送信は I2C に変換して GROVE ケーブル経由で行う
  - GardeningBoard 開発時向けに使用したもので、GardeningBoard 最終系には含まれていない
- Tools/PruningTool
  - Pump と対応する PC 側の制御ツール (C# フォームアプリ)
  - 草/木/家/土等の基本パーツ一つ一つの点灯パターン作成・検討に使用
- Seeedino/Pillar
  - Pillar 基板に搭載されている SeeeduinoXIAO 向けのプログラム
  - PC から USB シリアル経由で受信したデータを Balan に送信する (Pump と立ち位置は似ている)
  - スタンドアローン動作も想定している
  - Pillar 基板に搭載されている以下を制御する
    - タクトスイッチ (状態遷移用)
    - DFPlayerMp3 基板 (音楽再生用)
    - microSD (点灯表示シナリオ読み込み用)
    - ボリューム2個 (輝度調整・表示周期変更用)
    - I2C マスタ GROVE コネクタ (Balan への信号用)
    - 0.96 inch I2C 有機 EL グラフィックス表示器 (各種情報表示用)
- Tools/Sprinkler
  - Pillar と対応する PC 側の制御ツール (C# WPF)
  - PruningTool のように基本パーツの点灯パターン検討も出来なくはないが、<br>Sprinkler はどちらかというと点灯パターンを組み合わせた GardeningBoard 全体の表示シナリオ検討・作成に使用することを想定
  - 表示シナリオ検討は以下の手順で行う
    - GardeningBoard (Pillar) と接続する
    - リアルタイム制御用のテキストボックスにフォーカスを当てた状態にする
    - キーボードのキーそれぞれに各パーツと表示パターンが割り当ててあるので自由にキー入力する
  - 作成した表示シナリオを Pillar で再生できる形式に変換・ファイル出力できる (ハズ)
- Tools/PatternConverter
  - 基本パーツの複雑な点灯パターン検討・作成用の Python スクリプト
  - 点灯パターンは yml ファイルで定義し、以下の二つに変換する
    - C/C++ 形式 (Balan のプログラムに埋め込む用)
    - C# 形式 (Sprinkler のシナリオ検討で点灯パターンを入力補完するためのパターン enum 定義用)
- Tools/BuildingPainter
  - TODO:

※順番は開発順

## 代表的な構成
### KawaiiMakeMyBoard 
| 基板名 | 個数 |
|--------|------|
| Grass  | 2    |
| Tree   | 1    |
| Land   | 1    |
| Base   | 1    |

### GardeningBoard
| 基板名 | 個数 | 備考                        |
|--------|------|-----------------------------|
| Grass  | 3    | 手前側に3個                 |
| Tree   | 3    | 奥側に3個                   |
| House  | 1    | 中央に1個                   |
| Tile   | 7    | -                           |
| Ground | 7    | STM 実装は2個、残りは中継用 |
| Pillar | 1    | 中央基板のさらに下に配置    |
