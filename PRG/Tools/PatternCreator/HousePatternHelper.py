# -*- coding: utf-8 -*-
# 家でパターンを作成するためのヘルパスクリプト
# このスクリプトの出力結果を House.yml にコピーして使用すること。

PATTERN_BASE = [
    0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0, 0,0,0,0, 0,0,0,0,0,0,0,
]

PATTERN_COLUMN = [
    [ 0,0,0,0,0,0,0, 0,0,0,0,1,0,0,0,0, 0,0,0,0, 0,0,0,0,0,0,0, ], # 中央1点
    [ 0,0,0,1,0,0,0, 0,0,0,1,0,1,0,0,0, 0,0,0,0, 0,0,0,1,0,0,0, ], # 
    [ 0,0,1,0,1,0,0, 0,0,1,0,0,0,1,0,0, 0,0,0,0, 0,0,1,0,1,0,0, ], # 
    [ 0,1,0,0,0,1,0, 0,1,0,0,0,0,0,1,0, 1,1,1,1, 0,1,0,0,0,1,0, ], # 
    [ 1,0,0,0,0,0,1, 1,0,0,0,0,0,0,0,1, 0,0,0,0, 1,0,0,0,0,0,1, ], # 
]

def create_column(columns):
    or_result = PATTERN_BASE.copy()
    for column in columns:
        for dot in range(len(PATTERN_BASE)):
            or_result[dot] |= PATTERN_COLUMN[column][dot]
    return or_result

def print_in_yml_format(pattern):
    print('  - \'', end='')
    for i, dot in enumerate(pattern):
        print('%d' % (dot), end='')
        if (i == 6) or (i == 15) or (i == 19):
            print(' ', end='')
    print('\'')

def pattern_explosion():
    print('- Name: Explosion')
    print('  Data:')
    print_in_yml_format(create_column([ 0              ]))
    print_in_yml_format(create_column([ 0, 1,          ]))
    print_in_yml_format(create_column([ 0, 1, 2,       ]))
    print_in_yml_format(create_column([    1, 2, 3,    ]))
    print_in_yml_format(create_column([       2, 3, 4, ]))
    print_in_yml_format(create_column([          3, 4, ]))
    print_in_yml_format(create_column([             4, ]))
    print_in_yml_format(create_column([                ]))
    print('')

def pattern_implosion():
    print('- Name: Implosion')
    print('  Data:')
    print_in_yml_format(create_column([             4, ]))
    print_in_yml_format(create_column([          3, 4, ]))
    print_in_yml_format(create_column([       2, 3, 4, ]))
    print_in_yml_format(create_column([    1, 2, 3,    ]))
    print_in_yml_format(create_column([ 0, 1, 2,       ]))
    print_in_yml_format(create_column([ 0, 1,          ]))
    print_in_yml_format(create_column([ 0              ]))
    print_in_yml_format(create_column([                ]))
    print('')

def main():
    pattern_explosion()
    pattern_implosion()

############################################################
#  メイン
############################################################
if __name__ == '__main__':
    main()
