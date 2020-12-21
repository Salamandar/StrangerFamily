#pragma once

#include "Adafruit_NeoPixel.h"

class LEDStrip {
public:
    static const uint32_t BLACK = 0x000000;
    static const uint32_t RED   = 0xFF0000;
    static const uint32_t BLUE  = 0x0000FF;
    static const uint32_t GREEN = 0x00FF00;
    static const uint32_t STARTCOLOR = (RED | BLUE);

    LEDStrip(uint16_t ledcount)
    : m_ledcount(ledcount)
    , leds(Adafruit_NeoPixel(m_ledcount, m_datapin, NEO_GRB | NEO_KHZ800))
    {
        leds.begin();
        leds.setBrightness( (255 / 100) * m_brightness );
        setAll(STARTCOLOR);
    }

    ~LEDStrip() = default;

    void set(uint16_t n, uint32_t c) {
        leds.setPixelColor(n, c);
    }
    void commit() {
        leds.show();
    }

    // Sets the color of all LEDs in the strand to 'color'
    // If 'wait'>0 then it will show a swipe from start to end
    void setAll(uint32_t color) {
        for (uint16_t led=0; led < m_ledcount; led++) {
            set(led, color);
        }
        commit();
    }

private:
    const uint16_t m_ledcount;
    const uint16_t m_datapin = 6;
    const uint8_t  m_brightness = 10;

    Adafruit_NeoPixel leds;

};
