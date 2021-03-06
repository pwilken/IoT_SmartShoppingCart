#/usr/bin/env python

import RPi.GPIO as GPIO
from MFRC522.SimpleMFRC522 import *
from time import sleep
import Item
import ShoppingCart
import MyLCD
import pymssql
import sys
import signal

conn = pymssql.connect("192.168.43.9", "SA", "IoT20172018", "SmartCart")

def end_read(signal,frame):
    print("Ctrl+C captured, ending programm")
    GPIO.cleanup()
    conn.close()
    sys.exit()

def main():
    signal.signal(signal.SIGINT, end_read)

    lcd = MyLCD.MyLCD()
    reader = SimpleMFRC522()
    while(True):
        checkedOut=False
        slist = ShoppingCart.ShoppingCart(conn)
        shoppingListSum=0
        shoppingListSumString = str(shoppingListSum) + ",-"

        while(checkedOut==False):
            try:
                lcd.lcd_print("Summe",1)
                lcd.lcd_print(shoppingListSumString,2)

                id,itemName=reader.read()
                if(id==48700008907): #checkout if id matches checkout tag, white card atm
                    checkedOut=True
                else:
                    temp = Item.Item(itemName, id)
                    slist.addItem(temp)
                    shoppingListSum = slist.getListSum()
                    shoppingListSumString = str(shoppingListSum) + ",-"
                    sleep(1)
            except KeyboardInterrupt:
                pass

            finally:
                GPIO.cleanup()
                lcd.cleanup()
                sleep(1)
        try:
            lcd.lcd_print("Vielen Dank fuer",1)
            lcd.lcd_print("Ihren Einkauf!",2)
            sleep(5)
        finally:
            lcd.cleanup
    conn.close()

if __name__ == "__main__":
    main()
