#include "serial.hpp"
#include "Arduino.h"

#define SHOWDELAY  200       // Delay in micro seconds before showing default 200
#define BAUDRATE   500000// Serial port speed, 460800 tested with Arduino Uno R3 23400 za MEGA, 115200 nano

int state;                   // Define current state
#define STATE_WAITING   1    // - Waiting for prefix
#define STATE_DO_PREFIX 2    // - Processing prefix
#define STATE_DO_DATA   3    // - Handling incoming LED colors

int currentLED;           // Needed for assigning the color to the right LED
int dataReadSize = 0;
int ledCount = 24;
char buffer[10];
char bufferLed[3];


void flush_stream(Stream& serial){
  while(serial.available() > 0) {
    char t = serial.read();
  }
}


LEDsReceiver::LEDsReceiver() {
    Serial.begin(BAUDRATE);
    state = STATE_WAITING;    // Initial state: Waiting for prefix
    Serial.println("Ready");
}

LEDsReceiver::~LEDsReceiver() {
    Serial.println("Exiting!");
    Serial.end();
}


bool LEDsReceiver::handle() {
    if (false)
    switch(state) {
        case STATE_WAITING:                  // *** Waiting for prefix ***
        // setAllLEDs(RED, 0);
        flush_stream(Serial);
        Serial.println(dataReadSize);       // Send previous number of data read to Pi

        if( Serial.available() )
        {
            state = STATE_DO_PREFIX;   // then set state to handle prefix
        }
        break;


        case STATE_DO_PREFIX:                // *** Processing Prefix ***
        // setAllLEDs(BLUE, 0);
        for (size_t i = 0; i < sizeof(buffer)-1; i++)
        {
            auto c = Serial.read();
            if (c == ':')
            {
            buffer[i] = '\0';
            ledCount = atoi(buffer);
            state = STATE_DO_DATA;     // Received character is in prefix, continue
            currentLED = 0;            // Set current LED to the first one
            break;
            }
            else if(c == -1)
            {
            i--;
            }
            else
            {
            buffer[i] = c;
            }
        }
        break;


        case STATE_DO_DATA:                  // *** Process incoming color data ***
        // while(Serial.read())
        // {
        //   dataReadSize++;
        //   Serial.print("Bytes read: ");
        //   Serial.println(dataReadSize);
        // }
        // break;
        // setAllLEDs(BLACK, 0);
        // setAllLEDs(GREEN, 1);
        if( Serial.available() > 2 )       // if we receive more than 2 chars
        {
            Serial.readBytes( bufferLed, 3 );   // Abuse buffer to temp store 3 charaters
            // m_should_show = true
            // strip.show();
        }
        else
        {
            delay(1);
            if( Serial.available() < 3 )
            {
            state = STATE_WAITING;         // Reset to waiting ...
            currentLED = 0;                // and go to LED one}
            }
        }

        if( currentLED > ledCount )        // Reached the last LED? Display it!
        {
            Serial.read(); // remove \n
            dataReadSize = currentLED;
            // m_should_show = true;
            delayMicroseconds(SHOWDELAY);  // Wait a few micro seconds

            state = STATE_WAITING;         // Reset to waiting ...
            currentLED = 0;                // and go to LED one

            break;                         // and exit ... and do it all over again
        }
        break;
    } // switch(state)
    else
    {
        // if we receive more than 2 chars
        if(Serial.available() > 2)
        {
            // Abuse buffer to temp store 3 charaters
            Serial.readBytes(bufferLed, 3);
            m_lastColor = (bufferLed[0] << 16) + (bufferLed[1] << 8) + (bufferLed[2] << 0);
            m_lastLEDId++;
            if (m_lastLEDId >= ledCount) {
                m_should_show = true;
                m_lastLEDId = 0;
            }

            return true;
        } else {
            return false;
        }
    }
}
