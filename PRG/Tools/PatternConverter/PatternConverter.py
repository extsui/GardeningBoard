# -*- coding: utf-8 -*-
#
# > pip install pyyaml
#
import os
import glob
import yaml
import re
import pprint

# yaml から読み込んで作成する構造
#
# Type: 'Grass'
# Patterns:
#   - Name: 'AllOn'
#     Data: [ '111...' ]
#     Id: 0         <-- 本プログラムで追加 (yaml には未記載)
#   - Name: 'AllOff'
#     Data: [ '000...' ]
#     Id: 1         <-- 本プログラムで追加 (yaml には未記載)
#   ...
#
# Type: 'Tree'
# Patterns:
#   - Name: 'AllOn'
#   ...
# ...

class BrickPattern:
    """ 部品パターンを保持および加工するクラス """
    def __init__(self, file_path):
        """ パターン定義ファイル読み込み """
        # 例: 'Resources/Grass.yml' --> 'Grass' == type_name
        type_name = os.path.splitext(os.path.basename(file_path))[0]
        with open(file_path, 'r', encoding='utf8') as file:
            patterns = yaml.safe_load(file)
        self.brick_pattern = { 'Type': type_name, 'Patterns': patterns }
        
    def assign_pattern_id(self):
        """ 各パターンに ID を割り当てる """
        for id, pattern in enumerate(self.brick_pattern['Patterns']):
            pattern['Id'] = id
    
    def normalize_pattern_data(self):
        """ パターンデータを正規化する (空白をそぎ落とす) """
        for i, pattern in enumerate(self.brick_pattern['Patterns']):
            for j, step in enumerate(pattern['Data']):
                self.brick_pattern['Patterns'][i]['Data'][j] = step.replace(' ', '')

    def verify_pattern(self):
        """
        不正なパターンが無いかをチェックする
        
        正規化後に呼び出す必要があることに注意。
        確認項目は以下の通り。
        - Step の長さが全て同じか
        - Step に 0/1 以外の文字が使われていないか
        """
        # 検査文字列
        regex = r'[^(0|1)]'

        # 最初のパターンのステップを基準とする
        type_name = self.brick_pattern['Type']
        patterns  = self.brick_pattern['Patterns']
        step_len  = len(patterns[0]['Data'][0])
        
        for pattern in patterns:
            pattern_data = pattern['Data']
            for step in pattern_data:
                pattern_name = pattern['Name']
                if len(step) != step_len:
                    raise Exception('Bad step length. (%s, %s)' % (type_name, pattern_name))
                match = re.search(regex, step)
                if match != None:
                    raise Exception('Bad char length. (%s, %s, \'%c\')' % (type_name, pattern_name, match.group()))

    def debug_dump_as_json(self):
        pprint.pprint(self.brick_pattern)

    def debug_dump_as_yaml(self):
        print(yaml.dump(self.brick_pattern, default_flow_style=False))

    def export_as_cpp(self):
        """
        C++ 形式で出力する (Balan 用)
        - モジュール名の名前空間はクラス名と干渉するので使用を断念
          (例: namespace Grass と class Grass)

        例:
        ---------------------------------------------
        static const unsigned char Grass_LeftToRight1[12][11] = {
            { 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            { 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
            /* ...(略)... */
            { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, },
        };

        /* ...(略)... */

        typedef struct {
            const unsigned char (*pattern)[11];
            unsigned char stepCount;
        } Grass_PatternRecord;

        static const Grass_PatternRecord Grass_PatternTable[] = {
            { Grass_AllOn, 1 },
            { Grass_AllOff, 1 },
            /* ...(略)... */
            { Grass_RightToLeftVertical, 8 },
        };

        static constexpr const int Grass_PatternCount = sizeof(Grass_PatternTable) / sizeof(Grass_PatternRecord);
        static constexpr const int Grass_LedCount = 11;
        ---------------------------------------------
        """
        output_string = ''

        type_name = self.brick_pattern['Type']
        patterns  = self.brick_pattern['Patterns']
        led_count = len(patterns[0]['Data'][0])

        # Pattern 定義
        for pattern in patterns:
            pattern_data = pattern['Data']
            pattern_name = pattern['Name']
            output_string += 'static const unsigned char %s[%d][%d] = {\n' % (type_name + '_' + pattern_name, len(pattern_data), led_count)
            for step in pattern_data:
                # '{ 0, 0, ..., 0, },\n' の部分
                output_string += '    { '
                for bit in step:
                    output_string += '%c, ' % bit
                output_string += '},\n'
            output_string += '};\n'
            output_string += '\n'

        # PatternRecord
        output_string += 'typedef struct {\n'
        output_string += '    const unsigned char (*pattern)[%d];\n' % led_count
        output_string += '    unsigned char stepCount;\n'
        output_string += '} %s_PatternRecord;\n' % type_name
        output_string += '\n'

        # PatternTable
        output_string += 'static const %s_PatternRecord %s_PatternTable[] = {\n' % (type_name, type_name)
        for pattern in patterns:
            output_string += '    { %s, %d },\n' % (type_name + '_' + pattern['Name'], len(pattern['Data']))
        output_string += '};\n'
        output_string += '\n'

        # PatternCount
        output_string += 'static constexpr const int %s_PatternCount = sizeof(%s_PatternTable) / sizeof(%s_PatternRecord);\n' % (type_name, type_name, type_name)
        output_string += 'static constexpr const int %s_LedCount = %d;\n' % (type_name, led_count)

        return output_string

    def export_as_javascript(self):
        """
        JavaScript 形式で出力する (IlluminationEditor 用)

        例:
        "00": { text: "Grass_AllOn", stepCount: 1, stepTiming: 10, isRepeat: false },
        "01": { text: "Grass_AllOff", stepCount: 1, stepTiming: 10, isRepeat: false },
        /* ...(略)... */
        """
        output_string = ''

        type_name = self.brick_pattern['Type']
        patterns  = self.brick_pattern['Patterns']
        
        for pattern in patterns:
            pattern_data = pattern['Data']
            pattern_name = pattern['Name']

            output_string += '    '
            output_string += '\"%02d\": ' % pattern['Id']
            output_string += '{ text: \"%s\", ' % (type_name + '_' + pattern_name)
            output_string += 'stepCount: %d' % len(pattern_data)
            output_string += ', stepTiming: 10, isRepeat: false },\n'
        
        return output_string

    def export_as_css(self, color):
        """
        CSS 形式で出力する (IlluminationEditor 用)

        Args:
            color: string: css の色 (例: '#00FF00')

        例:
        .Grass_AllOn {
            background-color: #00FF00;
        }

        .Grass_AllOff {
            background-color: #00FF00;
        }

        /* ...(略)... */
        """
        output_string = ''

        type_name = self.brick_pattern['Type']
        patterns  = self.brick_pattern['Patterns']
        
        for pattern in patterns:
            pattern_name = pattern['Name']

            output_string += '.%s {\n' % (type_name + '_' + pattern_name)
            output_string += '    background-color: %s;\n' % color
            output_string += '}\n'
            output_string += '\n'

        return output_string

    def export_as_csharp(self):
        """
        C# 形式で出力する (Sprinkler 用)
        
        例:
        public static class Grass
        {
            public static Pattern AllOn = new Pattern(0, 1);    # Pattern は (Id, StepCount)
            public static Pattern AllOff = new Pattern(1, 1);
            /* ...(略)... */
        }
        """
        output_string = ''

        type_name = self.brick_pattern['Type']
        patterns  = self.brick_pattern['Patterns']
        
        output_string += 'public static class %s\n' % type_name
        output_string += '{\n'
        for pattern in patterns:
            output_string += '    public static Pattern %s = new Pattern(%d, %d);\n' % (pattern['Name'], pattern['Id'], len(pattern['Data']))
        output_string += '}\n'

        return output_string

class PatternConverter:
    HEADER_COMMENT = '/* このファイルは PatternConverter によって自動生成されました */\n'

    def __init__(self, dir_path):
        # 定義ファイル検索対象フォルダパス
        self.dir_path = dir_path
        # パターンを読み込んだ後の保持先
        self.brick_patterns = []

    @staticmethod
    def load_pattern_dir(dir_path):
        """ パターン定義ファイル一括読み込み """
        pattern_files = glob.glob(dir_path + '*.yml')
        if len(pattern_files) == 0:
            raise Exception('Not found pattern files. (dir_path == \'%s\')' % dir_path)
        brick_patterns = []
        for file_path in pattern_files:
            brick_pattern = BrickPattern(file_path)
            brick_pattern.assign_pattern_id()
            brick_pattern.normalize_pattern_data()
            brick_pattern.verify_pattern()
            brick_patterns.append(brick_pattern)
            print('Load: %s' % (file_path))
        return brick_patterns

    def load_patterns(self):
        self.brick_patterns = PatternConverter.load_pattern_dir(self.dir_path)

    def save_as_cpp(self, output_dir_path):
        """
        C++ 形式で保存
        Args:
            output_dir_path: string: 出力先フォルダパス (複数ファイル生成のため)
        """
        for brick_pattern in self.brick_patterns:
            file_name = brick_pattern.brick_pattern['Type'] + 'Pattern.h'
            output_file_path = output_dir_path + file_name
            with open(output_file_path, 'w') as file:
                file.write(self.HEADER_COMMENT)
                file.write(brick_pattern.export_as_cpp())
            print('Save: %s (C++)' % output_file_path)

    def save_as_javascript(self, output_file_path):
        """
        JavaScript 形式で保存
        Args:
            output_file_path: string: 出力先ファイルパス
        """
        with open(output_file_path, 'w') as file:
            file.write(self.HEADER_COMMENT)
            file.write('var patternList = {\n')
            for brick_pattern in self.brick_patterns:
                file.write('    // %s\n' % brick_pattern.brick_pattern['Type'])
                file.write(brick_pattern.export_as_javascript())
            file.write('};\n')
        print('Save: %s (JavaScript)' % output_file_path)

    def save_as_css(self, output_file_path):
        """
        CSS 形式で保存
        Args:
            output_file_path: string: 出力先ファイルパス
        """
        color_table = {
            'Grass' : '#00FF00', # 緑
            'House' : '#FF0000', # 赤
            'Tree'  : '#0000FF', # 青
            'Tile'  : '#FFBB00', # 茶
        }

        with open(output_file_path, 'w') as file:
            file.write(self.HEADER_COMMENT)
            for brick_pattern in self.brick_patterns:
                type_name = brick_pattern.brick_pattern['Type']
                file.write(brick_pattern.export_as_css(color_table[type_name]))
            file.write('\n')
        print('Save: %s (CSS)' % output_file_path)

    def save_as_csharp(self, output_file_path):
        """
        C# 形式で保存
        Args:
            output_file_path: string: 出力先ファイルパス
        """
        with open(output_file_path, 'w') as file:
            file.write(self.HEADER_COMMENT)
            file.write("""public static class PatternConstants
{
    public struct Pattern
    {
        public byte Id { get; private set; }
        public byte StepCount { get; private set; }

        public Pattern(byte id, byte stepCount)
        {
            Id = id;
            StepCount = stepCount;
        }

        // パターン終了までにかかる時間の取得(ミリ秒)
        public int GetTime(byte stepTiming)
        {
            return StepCount * stepTiming;
        }
    }

    // 以降はパターン定義
"""
            )
            for i, brick_pattern in enumerate(self.brick_patterns):
                # 各パターンクラスにインデントを挿入
                csharp = brick_pattern.export_as_csharp()
                # 一番最後に空行が含まれているのでそこを除外
                for line in csharp.split('\n')[:-1]:
                    file.write('    %s\n' % line)
                # 各パターンクラスの間に空行を挟む
                if (i < len(self.brick_patterns) - 1):
                    file.write('\n')

            file.write('}\n')

        print('Save: %s (C#)' % output_file_path)

############################################################
#  メイン
############################################################
if __name__ == '__main__':
    resource_dir_path = 'Resources/'
    output_dir_path = 'Outputs/'

    pattern_converter = PatternConverter(resource_dir_path)
    pattern_converter.load_patterns()
    pattern_converter.save_as_cpp(output_dir_path)
    pattern_converter.save_as_javascript(output_dir_path + 'pattern.js')
    pattern_converter.save_as_css(output_dir_path + 'pattern.css')
    pattern_converter.save_as_csharp(output_dir_path + 'PatternConstants.cs')
