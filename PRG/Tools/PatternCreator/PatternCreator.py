# -*- coding: utf-8 -*-
import random

def create_random_step(led_count, fill_ratio):
    binary_string = ''
    for i in range(led_count):
        random_value = random.random()
        if (random_value > fill_ratio):
            binary_string += '0'
        else:
            binary_string += '1'
    return binary_string

def create_random_pattern(led_count, step_count, fill_ratio):
    """
    ランダムなパターンを生成します。

    Parameters
    ----------
    led_count : int
        LED の数 (例: 草なら 11)
    step_count : int
        パターンのステップ数
    fill_ratio : double
        パターン全体に対する 1 の割合 (0.0 ~ 1.0 で指定すること)

    Returns
    -------
    ランダムなパターン : string
    """
    assert(0.0 <= fill_ratio <= 1.0)
    pattern_string = ''
    for i in range(step_count):
        step_string = create_random_step(led_count, fill_ratio)
        pattern_string += '\'' + step_string + '\'\n'

    return pattern_string

############################################################
#  メイン
############################################################
def main():
    # 再現性のために固定シードで生成
    random.seed(0)

    for ratio in [ 0.1, 0.5, 0.9 ]:
        print('-- [ratio = %1.1f] ----------' % ratio)
        print(create_random_pattern(11, 11 * 5, ratio))
    
if __name__ == '__main__':
    main()
