#include "leds.hpp"
#include "serial.hpp"

#include "Arduino.h"

LEDStrip* strip;
LEDsReceiver* uart_receiver;

const int ledcount = 24;
const unsigned int baudrate = 115200;

void setup()
{
    LEDStrip::set_arduino_is_out(true);

    strip = new LEDStrip(ledcount);
    uart_receiver = new LEDsReceiver(ledcount, baudrate);

    // Start Sequence
    strip->setAll(strip->RED);
    delay(500);
    strip->setAll(strip->BLUE);
    delay(500);
    strip->setAll(strip->GREEN);
    delay(500);
    strip->setAll(strip->STARTCOLOR);
    delay(200);
}


void loop()
{
    if (uart_receiver->handle()) {
        auto led = uart_receiver->getLastLEDId();
        auto color = uart_receiver->getLastColor();
        Serial.print("recv: led ");
        Serial.print(led, DEC);
        Serial.print(" color : ");
        Serial.print(color, HEX);
        Serial.println();

        strip->set(led, color);

        if (uart_receiver->should_show()) {
            Serial.println("showing leds !");
            strip->commit();
        }
    }
}
