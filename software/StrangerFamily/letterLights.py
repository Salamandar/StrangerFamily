#!/bin/env python3

import os,sys,signal
import time,argparse
from collections import OrderedDict

from neopixel import *

import database


def signal_handler(signal, frame):
    colorWipe(strip, Color(0,0,0))
    sys.exit(0)

def opt_parse():
    parser = argparse.ArgumentParser()
    parser.add_argument('-c', action='store_true', help='clear the display on exit')
    args = parser.parse_args()
    if args.c:
        signal.signal(signal.SIGINT, signal_handler)

# LED strip configuration:
LED_COUNT      = 38      # Number of LED pixels.
LED_PIN        = 18      # GPIO pin connected to the pixels (18 uses PWM!).
#LED_PIN        = 10      # GPIO pin connected to the pixels (10 uses SPI /dev/spidev0.0).
LED_FREQ_HZ    = 800000  # LED signal frequency in hertz (usually 800khz)
LED_DMA        = 5       # DMA channel to use for generating signal (try 5)
LED_BRIGHTNESS = 255     # Set to 0 for darkest and 255 for brightest
LED_INVERT     = False   # True to invert the signal (when using NPN transistor level shift)
LED_CHANNEL    = 0       # set to '1' for GPIOs 13, 19, 41, 45 or 53
LED_STRIP      = ws.WS2811_STRIP_GRB   # Strip type and colour ordering

# Letters configuration :number of lights for each letter
# USAGE (for example with B):
#   position = ord('B') - ord('A')
#   2 = lightsList[position]
#   1 = Sum of previous positions
#         for j in range(1, 2):
#            strip.setPixelColor(j, color)
letters = OrderedDict()
letters['A']=15
letters['B']=11
letters['C']=10
letters['D']=12
letters['E']=13
letters['F']=9
letters['G']=10
letters['H']=12
letters['I']=8
letters['J']=12
letters['K']=11
letters['L']=11
letters['M']=18
letters['N']=11
letters['O']=9
letters['P']=12
letters['Q']=11
letters['R']=13
letters['S']=10
letters['T']=11
letters['U']=9
letters['V']=11
letters['W']=17
letters['X']=13
letters['Y']=13
letters['Z']=15


def getLetterPositions(letter):
    letterPositions = [0, 0]

    if letter not in letters.keys():
       return letterPositions

    tableLetterPosition = letters.keys().index(letter)
    ledLetterPosition = 0

    print(tableLetterPosition);

    for key in letters:
        if key != letter:
            ledLetterPosition += letters[key]
        else:
            break

    letterPositions[0] = ledLetterPosition
    letterPositions[1] = letters[letter]
    print(letter)
    print(letterPositions)
    return letterPositions

def lightning(strip, letterPositions):
    color = Color(255, 255, 255)
    random.seed(os.urandom(5))
    timeLeft = 500
    i = 0

    if letterPositions[1] == 0:
        time.sleep(timeLeft/1000.0)
        return

    red = random.randint(0, 255)
    green = random.randint(0, 255)
    blue = random.randint(0, 255)

    # i-eme cycle
    while timeLeft>0:
        wait_ms = random.randint(0, timeLeft)
        if i%2==0:
            color = Color(red, green, blue)
        else:
            color = 0

        for j in range(letterPositions[0], letterPositions[0]+letterPositions[1]):
            strip.setPixelColor(j, color)
        strip.show()
        time.sleep(wait_ms/1000.0)
        timeLeft = timeLeft-wait_ms
        i += 1
    shutoffLights(strip)


def shutoffLights(strip):
    for i in range(strip.numPixels()):
        strip.setPixelColor(i, 0)
    strip.show()


class LetterLights():
    def __init__(self, database):
        self.database = database
        # Create NeoPixel object with appropriate configuration.
        strip = Adafruit_NeoPixel(LED_COUNT, LED_PIN, LED_FREQ_HZ, LED_DMA, LED_INVERT, LED_BRIGHTNESS, LED_CHANNEL, LED_STRIP)
        # Initialize the library (must be called once before other functions).
        strip.begin()
        shutoffLights(strip)

    def onePrint(self):
        string = stringdb.getRandSentence().text

        sequenceOfAlphabets = list(string.upper())
        for letter in sequenceOfAlphabets:
            lightning(strip, getLetterPositions(letter))
            time.sleep(0.3)



if __name__ == '__main__':
    # Process arguments
    opt_parse()

    stringdb = database.StrangerDatabase()
    letterLights = LetterLights(stringdb)

    letterLights.onePrint()
