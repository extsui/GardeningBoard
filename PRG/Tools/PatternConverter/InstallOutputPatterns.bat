:: ------------------------------------------------------------
::   パターン変換器の出力ファイルを所定の位置にインストールする
:: ------------------------------------------------------------

:: (1) パターン変換
python ./PatternConverter.py

:: (2-a) C++ コピー
copy .\Outputs\GrassPattern.h ..\..\Firmware\Balan\Core\Src\Patterns\
copy .\Outputs\HousePattern.h ..\..\Firmware\Balan\Core\Src\Patterns\
copy .\Outputs\TilePattern.h  ..\..\Firmware\Balan\Core\Src\Patterns\
copy .\Outputs\TreePattern.h  ..\..\Firmware\Balan\Core\Src\Patterns\

:: (2-b) C\# コピー
copy .\Outputs\PatternConstants.cs ..\Sprinkler\Sprinkler\
