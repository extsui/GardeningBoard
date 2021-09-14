################################################################################
# 8bit グレースケール画像から XBM 動画データに変換するスクリプト
# - Input
#   - 8bit グレースケール画像 (640x480) ビットマップ
# - Output
#   - 1bit 二値画像 (128x64) ビットマップ
#   - 1bit 二値画像 (128x64) XBM
#   - 1bit 二値データ (128x64) XBM バイナリ (*)
# 
# (*) を連番変換する機能あり。
################################################################################
from PIL import Image
import io

# デバッグ用
def gray_to_bmp(input_path, output_path):
    """
    640x480 グレースケールビットマップ画像
    --> 128x64 二値ビットマップ画像
    """
    input_image = Image.open(input_path)
    assert(input_image.width == 640)
    assert(input_image.height == 480)
    assert(input_image.mode == 'L')
    converted_image = input_image.resize((128, 64)).convert('1')
    converted_image.save(output_path)

# デバッグ用
def gray_to_xbm(input_path, output_path):
    """
    640x480 グレースケールビットマップ画像
    --> XBM データ
    """
    input_image = Image.open(input_path)
    assert(input_image.width == 640)
    assert(input_image.height == 480)
    assert(input_image.mode == 'L')
    converted_image = input_image.resize((128, 64)).convert('1')
    converted_image.save(output_path, format='XBM')

# XIAO OLED で u8g2 の drawBitmap() で描くと 1/8 サイズに描画されてしまう。
# おそらくバイナリ画像ではなくグレースケール画像を想定されていそう。
# グレースケール画像だと読み込み量が膨大になるのでやりたくない。
# drawXBM() であれば正しく表示されることを確認。
# --> XBM 形式で進める。
def gray_to_bmp_bin(input_path, output_path):
    """
    640x480 グレースケールビットマップ画像
    --> 128x64 二値画像データバイナリ
    """
    input_image = Image.open(input_path)
    assert(input_image.width == 640)
    assert(input_image.height == 480)
    assert(input_image.mode == 'L')
    converted_image = input_image.resize((128, 64)).convert('1')
    
    # 以下を有効にすると bmp 形式ファイルで出力する (デバッグ用)
    #converted_image.save(output_path)

    # u8g2lib 用にバイナリ配列データに変換する
    #   1. リサイズした画像データをビットマップ形式で RAM 上に保存する
    #   2. 1. のビットマップヘッダ部分を取り除いたバイナリデータを取得する
    #   3. 2. のバイナリデータをファイルに書き出す
    bitmap_in_ram = io.BytesIO()
    converted_image.save(bitmap_in_ram, format='BMP')
    binary_data_with_header = bitmap_in_ram.getvalue()
    # ビットマップヘッダ部 = ファイルヘッダ (14 Byte) + 情報ヘッダ (40 Byte) + カラーパレット (8 Byte)
    BITMAP_HEADER_SIZE = 14 + 40 + 8
    binary_data = binary_data_with_header[BITMAP_HEADER_SIZE:]
    # データ部のサイズの検査
    assert(len(binary_data) == (128 * 64) / 8)

    with open(output_path, mode='wb') as f:
        f.write(binary_data)

# XBM で出力したファイルをバイナリデータに変換する。
# XBM 形式ファイルは以下のようなデータ。
# ---------------------------------------------------------------------------
# #define im_width 128
# #define im_height 64
# static char im_bits[] = {
# 0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
# 0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,
# ...
# 0xfe,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0x1f,0x00,0x00,0x00,0x00,0x00,0x00,
# 0x00,0xfe,0xff,0xff
# };
# ---------------------------------------------------------------------------
# --> 4 行目から 最終行-1 までを ',' で split してファイル書き込みすれば良い。
def gray_to_xbm_bin(input_path, output_path):
    """
    640x480 グレースケールビットマップ画像
    --> 128x64 二値画像データ XBM
    --> XBM バイナリデータ
    """
    input_image = Image.open(input_path)
    assert(input_image.width == 640)
    assert(input_image.height == 480)
    assert(input_image.mode == 'L')
    converted_image = input_image.resize((128, 64)).convert('1')

    xbm_in_ram = io.BytesIO()
    converted_image.save(xbm_in_ram, format='XBM')
    xbm_data_with_info = xbm_in_ram.getvalue()

    # bytes 型のままでは扱いづらいので str 型に変換
    xbm_data_with_info = xbm_data_with_info.decode()
    # 16 進数文字列部分だけ抽出
    hex_lines = xbm_data_with_info.splitlines()[3:-1]
    # 16 進数文字列部分の複数行を1要素に結合 (カンマ区切り)
    hex_comma = ''.join(hex_lines)
    # ',' で分割してそれぞれ 16 進数文字列 --> byte 変換
    binary_data = []
    for hex in hex_comma.split(','):
        binary_data.append(int(hex, 16))
    
    # データ部のサイズの検査
    assert(len(binary_data) == (128 * 64) / 8)

    with open(output_path, mode='wb') as f:
        for i in binary_data:
            # 1byte にするのでエンディアンは何でも可
            f.write(i.to_bytes(1, 'big'))

# 連番変換 & 結合
# - ({gray}*n --> {xbm.bin}*n --> merged.xbm.bin)
def gray_to_xbm_bin_continuous_and_merge(input_dir_path, output_dir_path, output_path):
    """
    input_dir_path:  連番のグレースケール画像が保存してあるフォルダ
                     画像名は gXXXX.bmp であること。(XXXX = 0 埋め 10 進数連番)
    output_dir_path: xbmXXXX.bin の出力先フォルダ
                     フォルダは事前に作成してあること。
    output_path:     output_dir_path/xbmXXXX.bin を結合した出力先ファイル
    """
    # (1) 連番変換
    # 約 30 秒で完了する
    print('Convert...')
    IMAGE_COUNT = 2191
    for i in range(0, IMAGE_COUNT, 1):
        _input_path  = input_dir_path + 'g%04d.bmp' % i
        _output_path = output_dir_path + 'xbm%04d.bin' % i
        gray_to_xbm_bin(_input_path, _output_path)
        print('%4d / %d' % (i, IMAGE_COUNT))
    print('Done!')

    # (2) 結合
    print('Merge...')
    with open(output_path, mode='wb') as fo:
        for i in range(0, 2191, 1):
            _input_path  = output_dir_path + 'xbm%04d.bin' % i
            with open(_input_path, mode='rb') as fi:
                fo.write(fi.read())
    print('Done!')

def main():
    # g0082.bmp は BadApple 動画を 10fps 切り出しで 2191 枚にした場合の 82 枚目。
    INPUT_PATH = './Input/g0082.bmp'

    # 出力確認用
    #gray_to_bmp(INPUT_PATH, './Output/test.bmp')
    #gray_to_bmp_bin(INPUT_PATH, './Output/test.bmp.bin')
    #gray_to_xbm(INPUT_PATH, './Output/test.xbm.txt')
    #gray_to_xbm_bin(INPUT_PATH, './Output/test.xbm.bin')

    # パス設定を環境に合わせて再設定すること!!!
    INPUT_DIR_PATH  = 'E:/Project/7SegMatrixMovieCutter/Scene/bin/'
    OUTPUT_DIR_PATH = './Output/BadApple/'
    OUTPUT_PATH     = './Output/BadApple128x64.xbm.bin'

    print('Confirm Input and Output path.')
    print('- INPUT_DIR_PATH  = %s' % INPUT_DIR_PATH)
    print('- OUTPUT_DIR_PATH = %s' % OUTPUT_DIR_PATH)
    print('- OUTPUT_PATH     = %s' % OUTPUT_PATH)
    print('OK? (y/n) > ', end='')
    if input() != 'y':
        exit(0)

    gray_to_xbm_bin_continuous_and_merge(INPUT_DIR_PATH, OUTPUT_DIR_PATH, OUTPUT_PATH)

if __name__ == '__main__':
    main()
