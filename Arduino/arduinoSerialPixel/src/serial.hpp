#pragma once

#include <stdint.h>

class LEDsReceiver {
public:
    LEDsReceiver(uint16_t ledcount);
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
    const uint16_t m_ledcount;
    uint32_t m_lastColor = 0;
    uint32_t m_lastLEDId = 0;
    bool m_should_show = false;
};
