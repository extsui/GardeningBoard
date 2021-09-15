#ifndef BUTTON_H
#define BUTTON_H

/**
 * Arudino 用ボタン管理クラス
 * 
 * 定期的に Update() を呼び出すことで、チャタリングを除去した上で
 * ボタン押下イベントを取得できる。
 */
class Button {
public:
    Button();
    void SetPin(int pinNumber, bool isPositive, bool isPullUp);
    // 今押されているか
    bool IsPressed();
    // 過去に押されたか
    bool WasPressed();
    // 状態更新
    void Update();

private:
    // 設定
    int m_PinNumber;
    bool m_IsInitialized;
    bool m_IsPositive;

    // 押下イベント有無
    bool m_HasPressEvent;

    // チャタリング除去用
    uint32_t m_NextSampleTime;
    bool m_PreviousWasPressed;
};

#endif /* BUTTON_H */
