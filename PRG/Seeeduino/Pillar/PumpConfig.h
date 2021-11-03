#ifndef PUMP_CONFIG_H
#define PUMP_CONFIG_H

// プラットフォーム固有のコンフィグを定義する箇所
#if BUILD_CONFIG_PC
    // PC 環境 (単体テスト用)
    #define LOG(...) printf(__VA_ARGS__)
#else
    // M5Stack 環境
    #define CONFIG_M5       (1)
    #define LOG(...)        Serial.printf(__VA_ARGS__)
    #define LCD_LOG(...)    M5.Lcd.printf(__VA_ARGS__)
#endif

#endif /* PUMP_CONFIG_H */
