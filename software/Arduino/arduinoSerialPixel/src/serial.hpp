#pragma once

#include <cstdint>

class LEDsReceiver {
public:
    LEDsReceiver();
    ~LEDsReceiver();

    // returns true if a led is available
    bool handle();

    uint32_t getLastColor() { return m_lastColor; }
    uint16_t getLastLEDId() { return m_lastLEDId; }
    bool should_show() {
        if (m_should_show) {
            m_should_show = false;
            return true;
        }
        return false;
    }
private:
    uint32_t m_lastColor;
    uint16_t m_lastLEDId;
    bool m_should_show;
};
