#ifndef PILLAR_SETTINGS_H
#define PILLAR_SETTINGS_H

// Pillar で使用する共通設定
class PillarSettings {
public:
    // mp3 で指定するファイル番号
    static constexpr int BadAppleMp3        = 1;
    static constexpr int WizardsInWinterMp3 = 2;

    // パス系
    static const char *BadApplePath;
    static const char *TestScriptPath;
    static const char *WizardsInWinterPath;
};

#endif /* PILLAR_SETTINGS_H */
