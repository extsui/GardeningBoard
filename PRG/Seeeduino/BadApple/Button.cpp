#include "Utils.h"
#include "Button.h"

namespace {

// サンプリング周期 [ms]
static constexpr const uint32_t SamplingIntervalMilliSeconds = 10;

}

Button::Button()
    : m_PinNumber(-1)
    , m_IsInitialized(false)
    , m_IsPositive(false)
    , m_HasPressEvent(false)
    , m_NextSampleTime(0)
    , m_PreviousWasPressed(0)
{
}

void Button::Initialize(int pinNumber, bool isPositive, bool isPullUp)
{
    ASSERT(!m_IsInitialized);

    m_PinNumber = pinNumber;
    m_IsInitialized = true;
    m_IsPositive = isPositive;

    if (isPullUp) {
        pinMode(pinNumber, INPUT_PULLUP);
    }

    Update();
}

bool Button::IsPressed()
{
    ASSERT(m_IsInitialized);

    int pinState = digitalRead(m_PinNumber);
    if ((m_IsPositive && pinState == HIGH) ||
        (!m_IsPositive && pinState == LOW)) {
        return true;
    } else {
        return false;
    }
}

bool Button::WasPressed()
{
    ASSERT(m_IsInitialized);

    if (m_HasPressEvent) {
        m_HasPressEvent = false;
        return true;
    }
    return false;
}

void Button::Update()
{
    ASSERT(m_IsInitialized);

    uint32_t now = millis();
    if (now <= m_NextSampleTime) {
        return;
    }
    m_NextSampleTime += SamplingIntervalMilliSeconds;

    bool currentIsPressed = IsPressed();
    if ((m_PreviousWasPressed == true) && (currentIsPressed == false)) {
        m_HasPressEvent = true;
    }
    m_PreviousWasPressed = currentIsPressed;
}
