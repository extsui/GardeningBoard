#ifndef PUMP_CONFIG_H
#define PUMP_CONFIG_H

// プラットフォーム固有のコンフィグを定義する箇所
#if BUILD_CONFIG_PC
    // PC 環境 (単体テスト用)
    #define LOG(...) printf(__VA_ARGS__)
#else
    // Seeeduino XIAO 環境
    #define CONFIG_XIAO    (1)
#endif

#endif /* PUMP_CONFIG_H */
