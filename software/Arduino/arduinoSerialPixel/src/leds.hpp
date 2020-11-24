#pragma once

#include "Adafruit_NeoPixel.h"

class LEDStrip {
public:
    const uint16_t BLACK = 0x000000;
    const uint16_t RED   = 0xFF0000;
    const uint16_t BLUE  = 0x0000FF;
    const uint16_t GREEN = 0x00FF00;
    const uint16_t STARTCOLOR = (RED | BLUE | GREEN);

    LEDStrip() {
        leds = Adafruit_NeoPixel(m_ledcount, m_datapin, NEO_GRB | NEO_KHZ800);
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
        for (int Counter=0; Counter < m_ledcount; Counter++) {
            set(Counter, color);
        }
        commit();
    }

private:
    Adafruit_NeoPixel leds;

    const uint16_t m_datapin = 6;
    const uint16_t m_ledcount = 24;
    const uint8_t  m_brightness = 10;

};
