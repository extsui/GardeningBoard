# -*- coding: utf-8 -*-
# 木で列方向移動のパターンを作成するためのヘルパスクリプト
# このスクリプトの出力結果を Tree.yml にコピーして使用すること。

TREE_PATTERN_BASE = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ]

TREE_PATTERN_COLUMN = [
	[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ],   # 1列目 (左端)
	[ 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ],   # 2列目
	[ 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, ],   # 3列目
	[ 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, ],   # 4列目
	[ 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, ],   # 5列目 (中央)
	[ 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, ],   # 6列目
	[ 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, ],   # 7列目
	[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, ],   # 8列目
	[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, ],   # 9列目 (右端)
]

def create_tree_column(columns):
    or_result = TREE_PATTERN_BASE.copy()
    for column in columns:
        for dot in range(len(TREE_PATTERN_BASE)):
            or_result[dot] |= TREE_PATTERN_COLUMN[column][dot]
    return or_result

def print_in_yml_format(pattern):
    print('  - \'', end='')
    for i, dot in enumerate(pattern):
        print('%d' % (dot), end='')
        if (i == 9):
            print(' ', end='')
    print('\'')

def pattern_left_to_right():
    print('- Name: LeftToRight')
    print('  Data:')
    print_in_yml_format(create_tree_column([ 0,       ]))
    print_in_yml_format(create_tree_column([ 0, 1,    ]))
    print_in_yml_format(create_tree_column([ 0, 1, 2, ]))
    print_in_yml_format(create_tree_column([ 1, 2, 3, ]))
    print_in_yml_format(create_tree_column([ 2, 3, 4, ]))
    print_in_yml_format(create_tree_column([ 3, 4, 5, ]))
    print_in_yml_format(create_tree_column([ 4, 5, 6, ]))
    print_in_yml_format(create_tree_column([ 5, 6, 7, ]))
    print_in_yml_format(create_tree_column([ 6, 7, 8, ]))
    print_in_yml_format(create_tree_column([ 7, 8,    ]))
    print_in_yml_format(create_tree_column([ 8,       ]))
    print_in_yml_format(create_tree_column([          ]))
    print('')

def pattern_right_to_left():
    print('- Name: RightToLeft')
    print('  Data:')
    print_in_yml_format(create_tree_column([ 8,       ]))
    print_in_yml_format(create_tree_column([ 7, 8,    ]))
    print_in_yml_format(create_tree_column([ 6, 7, 8, ]))
    print_in_yml_format(create_tree_column([ 5, 6, 7, ]))
    print_in_yml_format(create_tree_column([ 4, 5, 6, ]))
    print_in_yml_format(create_tree_column([ 3, 4, 5, ]))
    print_in_yml_format(create_tree_column([ 2, 3, 4, ]))
    print_in_yml_format(create_tree_column([ 1, 2, 3, ]))
    print_in_yml_format(create_tree_column([ 0, 1, 2, ]))
    print_in_yml_format(create_tree_column([ 0, 1,    ]))
    print_in_yml_format(create_tree_column([ 0,       ]))
    print_in_yml_format(create_tree_column([          ]))
    print('')

def pattern_middle_to_both_edge():
    print('- Name: MiddleToBothEdge')
    print('  Data:')
    print_in_yml_format(create_tree_column([             4,             ]))
    print_in_yml_format(create_tree_column([          3, 4, 5           ]))
    print_in_yml_format(create_tree_column([       2, 3, 4, 5, 6,       ]))
    print_in_yml_format(create_tree_column([    1, 2, 3,    5, 6, 7,    ]))
    print_in_yml_format(create_tree_column([ 0, 1, 2,          6, 7, 8, ]))
    print_in_yml_format(create_tree_column([ 0, 1,                7, 8, ]))
    print_in_yml_format(create_tree_column([ 0,                      8, ]))
    print_in_yml_format(create_tree_column([                            ]))
    print('')

def main():
    pattern_left_to_right()
    pattern_right_to_left()
    pattern_middle_to_both_edge()

############################################################
#  メイン
############################################################
if __name__ == '__main__':
    main()
