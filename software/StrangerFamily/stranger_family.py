import threading, time

import entry
import database
import screen
import letterLights






if __name__ == '__main__':
    global_database = database.StrangerDatabase()


    ############################################################################
    # Screen

    def screen_thread_fn():
        pass

    screen_thread = threading.Thread(target=screen_thread_fn)
    screen_thread.start()


    ############################################################################
    # Keyboard

    def keyboard_thread_fn():
        for s in entry.ListenKeyboard():
            global_database.addSentence(s)

    keyboard_thread = threading.Thread(target=keyboard_thread_fn)
    keyboard_thread.start()

    ############################################################################
    # LEDs

    def leds_thread_fn():
        leds = letterLights.LetterLights(global_database)
        while True:
            leds.onePrint()
            time.sleep(2)

    leds_thread = threading.Thread(target=leds_thread_fn)
    leds_thread.start()


    # And that's all, main thread doesn't do anything
    screen_thread.join()
    leds_thread.join()
    keyboard_thread.join()


## TODO:
# * write screen implem
# screen.setUserTextFromKeyboard
# screen.setLedsProgression
# screen.setLedsText
# screen.clear ?
# * pass screen to ListenKeyboard that will call setUserTextFromKeyboard
# * pass screen to Leds that will call setLeds*
