#include "Utils.h"
#include "Volume.h"

namespace {

// サンプリング周期 [ms]
constexpr const uint32_t SamplingIntervalMilliSeconds = 10;

// Arduino の analogRead() の範囲の数 (0~1023)
constexpr const uint32_t AnalogReadRange = 1024;

}

Volume::Volume()
    : m_PinNumber(-1)
    , m_IsInitialized(false)
    , m_NextSampleTime(0)
    , m_pFilter(nullptr)
{
}

/**
 * @param [in] pinNumber ピン番号
 * @param [in] pFilter アナログ生値加工用のフィルタ実体
 * @param [in] level 区分け数 (GetLevel() で取得する時の値域)
 */
void Volume::Initialize(int pinNumber, RcFilter *pFilter, uint32_t levelRange)
{
    ASSERT(!m_IsInitialized);
    ASSERT(pFilter != nullptr);

    m_PinNumber = pinNumber;
    m_IsInitialized = true;
    m_pFilter = pFilter;
    m_LevelRange = levelRange;

    Update();
}

// レベルではなく analogRead() 値域の値を取得する。
// ※フィルタはかけた後の値
int Volume::GetValue()
{
    ASSERT(m_IsInitialized);
    return m_CurrentOutput;
}

// 初期化時に指定されたレベルの値域内の値で取得する。
int Volume::GetLevel()
{
    ASSERT(m_IsInitialized);
    // int 演算なので精度向上のため順序を入れ替えている。
    // やりたいことは、y = (<AD 値> / <AD 最大値>) * <取得したい値域>
    return m_CurrentOutput * m_LevelRange / AnalogReadRange;
}

void Volume::Update()
{
    ASSERT(m_IsInitialized);
    ASSERT(m_pFilter != nullptr);

    uint32_t now = millis();
    if (now <= m_NextSampleTime) {
        return;
    }
    m_NextSampleTime += SamplingIntervalMilliSeconds;

    // SeeeduinoXIAO の analogRead() は約 16us かかる
    uint32_t currentInput = analogRead(m_PinNumber);
    m_CurrentOutput = m_pFilter->Generate(currentInput);
}
