import time

# Keyboard
from evdev import InputDevice, categorize, ecodes

import database


scancodes_qwerty = {
    0: None, 14: u'BKSP', 28: u'CRLF', 57: u' ',
    16: u'Q', 17: u'W', 18: u'E', 19: u'R', 20: u'T', 21: u'Y', 22: u'U', 23: u'I', 24: u'O', 25: u'P',
      30: u'A', 31: u'S', 32: u'D', 33: u'F', 34: u'G', 35: u'H', 36: u'J', 37: u'K', 38: u'L',
        44: u'Z', 45: u'X', 46: u'C', 47: u'V', 48: u'B', 49: u'N', 50: u'M',
}

scancodes_azerty = {
    0: None, 14: u'BKSP', 28: u'CRLF', 57: u' ',
    16: u'A', 17: u'Z', 18: u'E', 19: u'R', 20: u'T', 21: u'Y', 22: u'U', 23: u'I', 24: u'O', 25: u'P',
      30: u'Q', 31: u'S', 32: u'D', 33: u'F', 34: u'G', 35: u'H', 36: u'J', 37: u'K', 38: u'L', 39: u'M',
        44: u'W', 45: u'X', 46: u'C', 47: u'V', 48: u'B', 49: u'N',
}

scancodes_bepo = {
    0: None, 14: u'BKSP', 28: u'CRLF', 57: u' ',
    16: u'B', 17: u'E', 18: u'P', 19: u'O', 20: u'E',           22: u'V', 23: u'D', 24: u'L', 25: u'J', 26: u'Z', 27: u'W',
      30: u'A', 31: u'U', 32: u'I', 33: u'E',           35: u'C', 36: u'T', 37: u'S', 38: u'R', 39: u'N', 40: u'M', 43: u'C',
    86: u'E', 44: u'A', 45: u'Y', 46: u'X',           48: u'K',           50: u'Q', 51: u'G', 52: u'H', 53: u'F',
}

scancodes = scancodes_qwerty



def ListenKeyboard(lcdscreen):
    device = InputDevice("/dev/input/event0")

    message = ''
    message_finished = False

    for event in device.read_loop():
        if event.type == ecodes.EV_KEY:
            data = categorize(event)
            if data.keystate == 1 and data.scancode in scancodes:
                key_lookup = scancodes.get(data.scancode)

                if key_lookup is None:
                    pass

                elif key_lookup == 'BKSP':
                    message = message[:-1]

                elif key_lookup == 'CRLF':
                    message_finished = True

                else:
                    message += key_lookup

                lcdscreen.setUserTextFromKeyboard(message)

                if message_finished:
                    if len(message) != 0:
                        yield message
                        lcdscreen.setUserTextFromKeyboard('OK!')
                        time.sleep(1)
                    message_finished = False
                    message = ''


# Tests
if __name__ == '__main__':
    ListenKeyboard()
