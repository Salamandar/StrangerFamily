#!/bin/env python3

import os,sys,signal
import time,argparse,random,colorsys
from collections import OrderedDict

import database

try:
    from neopixel import *
    print('neopixel found')
except ImportError:
    print('neopixel not found!')
    # Fake neopixel module
    class ws():
        WS2811_STRIP_GRB = 0
        WS2811_STRIP_RGB = 1

    class Color():
        def __init__(self, a,b,c):
            pass

    class Adafruit_NeoPixel():
        def __init__(self, num, pin, freq_hz=800000, dma=5, invert=False,
            brightness=255, channel=0, strip_type=ws.WS2811_STRIP_RGB):
            pass
        def _cleanup(self):
            pass
        def begin(self):
            pass
        def show(self):
            pass
        def setPixelColor(self, n, color):
            pass
        def setPixelColorRGB(self, n, red, green, blue, white = 0):
            pass
        def setBrightness(self, brightness):
            pass
        def getPixels(self):
            pass
        def numPixels(self):
            return LED_COUNT
            pass
        def getPixelColor(self, n):
            pass


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
LED_COUNT      = 305     # Number of LED pixels.
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
letters = OrderedDict([
    ('A', 15),
    ('B', 11),
    ('C', 10),
    ('D', 12),
    ('E', 13),
    ('F',  9),
    ('G', 10),
    ('H', 12),
    ('I',  8),
    ('J', 12),
    ('K', 11),
    ('L', 11),
    ('M', 18),
    ('N', 11),
    ('O',  9),
    ('P', 12),
    ('Q', 11),
    ('R', 11),
    ('S', 10),
    ('T', 11),
    ('U',  9),
    ('V', 11),
    ('W', 17),
    ('X', 13),
    ('Y', 13),
    ('Z', 15),
])
def getLetterPositions(letter):
    letterPositions = [0, 0]

    if letter not in letters.keys():
       return letterPositions

    tableLetterPosition = list(letters.keys()).index(letter)
    ledLetterPosition = 0

    # print(tableLetterPosition);

    for key in letters:
        if key != letter:
            ledLetterPosition += letters[key]
        else:
            break

    letterPositions[0] = ledLetterPosition
    letterPositions[1] = letters[letter]
    print(letter)
    # print(letterPositions)
    return letterPositions

def hsv_to_neopixel_color(h, s, v):
    (r, g, b) = colorsys.hsv_to_rgb(h, s, v)
    return Color(int(255 * r), int(255 * g), int(255 * b))


class LetterLights():
    def __init__(self, database, lcdscreen):
        self.stringdb = database
        self.lcdscreen = lcdscreen
        # Create NeoPixel object with appropriate configuration.
        self.strip = Adafruit_NeoPixel(LED_COUNT, LED_PIN, LED_FREQ_HZ, LED_DMA, LED_INVERT, LED_BRIGHTNESS, LED_CHANNEL, LED_STRIP)
        # Initialize the library (must be called once before other functions).
        self.strip.begin()
        self.shutoffLights()
        self.animationsList = [func for func in dir(LetterLights) if callable(getattr(LetterLights, func)) and func.startswith('animation')]
        self.setAnimation('Smooth')


    def shutoffLights(self):
        for i in range(self.strip.numPixels()):
            self.strip.setPixelColor(i, 0)
        self.strip.show()

    def setAnimation(self, name):
        self.animationMethod = getattr(self, 'animation' + name)

    def setRandAnimation(self):
        pass

    def animate(self, letterPositions):
        for color in self.animationMethod():
            for j in range(letterPositions[0], letterPositions[0]+letterPositions[1]):
                self.strip.setPixelColor(j, color)
            self.strip.show()
        self.shutoffLights()

    def animationLightning(self):
        color = Color(255, 255, 255)
        random.seed(os.urandom(5))
        timeLeft = 500
        i = 0

        if letterPositions[1] == 0:
            time.sleep(timeLeft/1000.0)
            return

        # So we'll do calculations in HSV, then convert to RGB
        hue = random.uniform(0, 1)
        # Detected on duration of led ON
        value = 0
        saturation = 0.9

        # i-eme cycle
        while timeLeft>0:
            wait_ms = random.randint(0, timeLeft)

            if i % 2 == 0:
                value = 0
            else:
                value = wait_ms / (wait_ms + 100)

            yield hsv_to_neopixel_color(hue, saturation, value)

            time.sleep(wait_ms/1000.0)
            timeLeft = timeLeft-wait_ms
            i += 1
        return

    def animationOnOff(self):
        timeLeft = 500
        hue = random.uniform(0, 1)
        saturation = 0.9
        yield hsv_to_neopixel_color(hue, saturation, value)
        time.sleep(timeLeft/1000.0)
        return

    def animationSmooth(self):
        timeTotal = 500 / 1000.0
        timeRamp  = 100 / 1000.0
        timeLevel = timeTotal - 2 * timeRamp

        hue = random.uniform(0, 1)
        saturation = 0.9

        steps = 100
        for k in range(1, steps + 1):
            v = k * 255 / steps
            value = v / (v + 100)
            yield hsv_to_neopixel_color(hue, saturation, value)
            time.sleep(timeRamp / steps)

        v = 255
        value = v / (v + 100)
        yield hsv_to_neopixel_color(hue, saturation, value)
        time.sleep(timeTotal)

        for k in range(1, steps + 1):
            v = (steps-k) * 255 / steps
            value = v / (v + 100)
            yield hsv_to_neopixel_color(hue, saturation, value)
            time.sleep(timeRamp / steps)

        return




    def onePrint(self):
        sentence = self.stringdb.getRandSentence()
        self.lcdscreen.setLedsText(sentence.text)
        sequenceOfAlphabets = list(sentence.text.upper())

        total = len(sequenceOfAlphabets)
        i = 0
        for letter in sequenceOfAlphabets:
            i+=1
            self.lcdscreen.setLedsProgression(100*i/total)
            self.animate(getLetterPositions(letter))
            time.sleep(0.1)



# Dummy i2c class
class Nop(object):
    def nop(*args, **kw): pass
    def __getattr__(self, _): return self.nop


if __name__ == '__main__':
    # Process arguments
    opt_parse()

    stringdb = database.StrangerDatabase()
    letterLights = LetterLights(stringdb, Nop())

    letterLights.onePrint()
