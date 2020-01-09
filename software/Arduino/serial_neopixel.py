#!/usr/bin/env python3

import time
import serial
import struct
#import ReadLine

ser = serial.Serial(
    port='/dev/ttyUSB0',
    baudrate = 500000,
    parity=serial.PARITY_NONE,
    stopbits=serial.STOPBITS_ONE,
    bytesize=serial.EIGHTBITS,
    timeout=1
)
#readliner = ReadLine.ReadLine(ser)
#readliner.readline()

time.sleep(2) # wait for Arduino

# counter=0
# while 1:
#     TmpValue = counter%9
#     print("{}".format(TmpValue))
#     ser.flush()
#     ser.write(str(TmpValue).encode())
#     ser.readline()
#     time.sleep(5)
#     counter += 1

PixelNumber=24
ColorRed=0
ColorGreen=85
ColorBlue=170
PixelPosition=0

state = 0

while not ser.in_waiting:
    time.sleep(0.5)

line = ser.readline()
print(line)

while 1:
    buffer = bytearray()
    if state:
        print("Start line")
        buffer += str(PixelNumber).encode()
        buffer += ":".encode()
        for i in range(PixelNumber):
            if i==PixelPosition%PixelNumber:
                buffer.append(128)
                buffer.append(128)
                buffer.append(255)
            else:
                buffer.append(0)
                buffer.append(0)
                buffer.append(0)
        PixelPosition += 1
        buffer += "\n".encode()
    else:
        buffer.append(0)
        buffer.append(128)
        buffer.append(0)

    print(buffer)
    ser.write(buffer)
    time.sleep(0.1)

    while not ser.in_waiting:
        time.sleep(0.1)
    while ser.in_waiting:
        print(ser.readline())
