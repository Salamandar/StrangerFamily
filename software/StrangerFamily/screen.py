import time, threading


class LCDScreen():
    def __init__(self):
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
        print('User Text:', self.userText)
        print('Leds Text:', self.ledsText)
        print('Leds Prog:', self.ledsProg)

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

    def clear(self, text):
        self.userText = ''
        self.ledsText = ''
        self.ledsProg = 0
        self.requestRedraw()
