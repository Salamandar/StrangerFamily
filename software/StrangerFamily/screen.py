import time, threading
import i2c_lib

class LCDScreen():
    def __init__(self):
        self.lcd = i2c_lib.i2c_lcd()
        self.userText = ''
        self.ledsText = ''
        self.ledsProg = 0
        self.redrawEvent = threading.Event()
        self.requestRedraw()

    def blockingRun(self):
        while self.redrawEvent.wait():
            self.redrawEvent.clear()
            self.redraw()

    def redraw(self):
        # print('User Text:', self.userText)
        # print('Leds Text:', self.ledsText)
        # print('Leds Prog:', self.ledsProg)
        self.lcd.lcd_display_string(self.userText, 1)
        self.lcd.lcd_display_string('', 2)
        self.lcd.lcd_display_string('progression' + str(self.ledsProg), 3)
        self.lcd.lcd_display_string(self.ledsText, 4)

    def requestRedraw(self):
        self.redrawEvent.set()

    def setUserTextFromKeyboard(self, text):
        self.userText = text
        self.requestRedraw()

    def setLedsText(self, text):
        self.ledsText = text
        self.requestRedraw()

    def setLedsProgression(self, percent):
        self.ledsProg = percent
        self.requestRedraw()

    def clear(self):
        self.userText = ''
        self.ledsText = ''
        self.ledsProg = 0
        self.requestRedraw()


if __name__ == '__main__':
    lcd = LCDScreen()
    lcd.clear()
    lcd.lcd.lcd_display_string('hello world', 1)

