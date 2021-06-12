# Sprinkler

## 実行手順
以下のフォルダ構成で Sprinkler.exe を実行してください。
```
.
├── Sprinkler.exe
└── Music/
    ├── Wizards_in_Winter.mp3
    ├── ...(曲を増やす場合)
    └── ...(同上)
```

## 設計メモ
### MIDI ライブラリ
MIDI ライブラリの選定基準は以下の通り。
- MIDI 鍵盤からキー入力とベロシティを取得できること。
- 使い勝手がシンプルであること。

上記から midi-dot-net を選択した。

補足メモは以下の通り。
- NuGet でトップに出るのは managed-midi だが複雑そうだったので却下
- midi-dot-net にサンプルがついててわかりやすかった
- だが midi-dot-net が .NETCore 未対応でプロジェクトを
  .NETFramework に戻す羽目に…
