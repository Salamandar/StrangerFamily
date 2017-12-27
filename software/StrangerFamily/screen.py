import time, threading
import i2c_lib

class LCDScreen():
    def __init__(self):
        self.lcd = i2c_lib.i2c_lcd()
        self.lcd_lines = 4
        self.lcd_width = 20
        self.lcd_charw = 8
        self.userText = ''
        self.ledsText = ''
        self.ledsProg = 0
        self.redrawEvent = threading.Event()
        self.requestRedraw()

        self.progressbars = [
            self.lcd.create_char(1, [0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10]),
            self.lcd.create_char(2, [0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18]),
            self.lcd.create_char(3, [0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x1C]),
            self.lcd.create_char(4, [0x1E, 0x1E, 0x1E, 0x1E, 0x1E, 0x1E, 0x1E, 0x1E]),
            self.lcd.create_char(5, [0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F]),
        ]


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
        self.lcd.lcd_display_string(bars_string, 3)
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
        bars_total = self.lcd_width * self.lcd_charw
        bars_count = int(bars_total * percent / 100)
        fullchars_count = int(bars_count / self.lcd_charw)
        partchar_count  = int(bars_count - fullchars_count)
        self.bars_string = '\x05' * fullchars_count + partchar_count
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

