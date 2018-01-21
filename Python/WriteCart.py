#/usr/bin/env python

import RPi.GPIO as GPIO
from MFRC522.SimpleMFRC522 import *
from time import sleep

reader = SimpleMFRC522()

while(True):
    try:
        print("Press CTRL+C to abort.")
        text=raw_input("Enter text to write to tag :")
        print("Now place the tag on the reader")
        reader.write(text)
        print("Written " + text)

    finally:
        GPIO.cleanup()