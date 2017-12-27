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
        # self.lcd.create_char(1, [0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10])
        # self.lcd.create_char(2, [0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18])
        # self.lcd.create_char(3, [0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x1C, 0x1C])
        # self.lcd.create_char(4, [0x1E, 0x1E, 0x1E, 0x1E, 0x1E, 0x1E, 0x1E, 0x1E])
        # self.lcd.create_char(5, [0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F])
        self.lcd.lcd_clear()
        self.requestRedraw()

    def blockingRun(self):
        while self.redrawEvent.wait():
            self.redrawEvent.clear()
            self.redraw()

    def redraw(self):
        # print('User Text:', self.userText)
        # print('Leds Text:', self.ledsText)
        # print('Leds Prog:', self.ledsProg)
        line1 = self.userText[              :self.lcd_width  ].ljust(self.lcd_width)
        line2 = self.userText[self.lcd_width:self.lcd_width*2].ljust(self.lcd_width)
        self.lcd.lcd_display_string(line1, 1)
        self.lcd.lcd_display_string(line2, 2)

    def requestRedraw(self):
        self.redrawEvent.set()

    def setUserTextFromKeyboard(self, text):
        if len(text) > 2 * self.lcd_width:
            return false
        else
            self.userText = text
            self.requestRedraw()
            return true

    def setLedsText(self, text):
        # ledsText = text
        # self.lcd.lcd_display_string(ledsText[              :self.lcd_width],   1)
        # self.lcd.lcd_display_string(ledsText[self.lcd_width:self.lcd_width*2], 2)
        # self.requestRedraw()
        pass

    def setLedsProgression(self, percent):
        # bars_total = self.lcd_width * self.lcd_charw
        # bars_count = int(bars_total * percent / 100)
        # fullchars_count = int(bars_count / self.lcd_charw)
        # partchar_count  = int(bars_count % self.lcd_charw)
        # self.bars_string = '\x05' * fullchars_count + chr(partchar_count)
        # self.lcd.lcd_display_string(self.bars_string, 3)
        # self.requestRedraw()
        pass

    def clear(self):
        self.userText = ''
        self.ledsText = ''
        self.ledsProg = 0
        self.requestRedraw()

if __name__ == '__main__':
    lcd = LCDScreen()
    lcd.clear()
    lcd.setLedsProgression(50)

