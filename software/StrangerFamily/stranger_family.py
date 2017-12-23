#!/bin/env python3

import threading, time

import entry
import database
import screen
import letterLights


if __name__ == '__main__':
    ############################################################################
    # Sentences database
    global_database = database.StrangerDatabase()

    ############################################################################
    # Screen
    lcdscreen = screen.LCDScreen()
    def screen_thread_fn():
        lcdscreen.blockingRun()

    screen_thread = threading.Thread(target=screen_thread_fn)
    screen_thread.start()

    ############################################################################
    # Keyboard
    def keyboard_thread_fn():
        for s in entry.ListenKeyboard(lcdscreen):
            global_database.addSentence(s)

    keyboard_thread = threading.Thread(target=keyboard_thread_fn)
    keyboard_thread.start()

    ############################################################################
    # LEDs
    def leds_thread_fn():
        leds = letterLights.LetterLights(global_database, lcdscreen)
        while True:
            leds.onePrint()
            time.sleep(2)

    leds_thread = threading.Thread(target=leds_thread_fn)
    leds_thread.start()


    # And that's all, main thread doesn't do anything
    screen_thread.join()
    leds_thread.join()
    keyboard_thread.join()


## TODO on real raspi:
# * Change input device
# * Change i2c device address
# Remove the test "if device not found, please do not fail" for i2c

