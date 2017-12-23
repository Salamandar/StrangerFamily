#!/bin/env python3
from pathlib import Path

import random
import yaml

class Sentence(object):
    def __init__(self, text, speed):
        self.text = text
        self.speed= speed

    def __repr__(self):
        return '\'' + self.text + '\''

    def __str__(self):
        return self.text


class StrangerDatabase():
    def __init__(self):
        super(StrangerDatabase, self).__init__()
        self.persistentFile = Path('stranger_strings.yaml')
        self.temporaryFile  = Path('/tmp/stranger_strings_temp.yaml')

        self.sentences      = []
        self.sentences_temp = []
        self.should_echo_last_temp = False

        self.loadPersistent()
        self.loadTemp()

    def loadPersistent(self):
        self.sentences      = self.loadFile(self.persistentFile)
    def loadTemp(self):
        self.sentences_temp = self.loadFile(self.temporaryFile)

    def loadFile(self, path):
        if not path.exists():
            return []

        with path.open() as stream:
            try:
                data = yaml.load(stream)
                return [ Sentence(d['text'], d['speed']) for d in data['sentences'] ]
            except yaml.YAMLError as exc:
                print(exc)


    def writeFile(self):
        pass

    def addSentence(self, string):
        self.sentences_temp += [ Sentence(string, 1) ]
        self.should_echo_last_temp = True


    def getRandSentence(self):
        if self.should_echo_last_temp:
            self.should_echo_last_temp = False
            return self.sentences_temp[-1]

        else:
            firstLen = len(self.sentences)
            id = random.randint(0, firstLen + len(self.sentences_temp) - 1)
            if id < firstLen:
                return self.sentences[id]
            else:
                return self.sentences_temp[id - firstLen]


def test():
    db = StrangerDatabase()
    db.addSentence('This is a new sentence')
    print(db.getRandSentence())
    print(db.getRandSentence())

