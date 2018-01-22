#/usr/bin/env python

import RPi.GPIO as GPIO
from MFRC522.SimpleMFRC522 import *
from time import sleep
import Item
import ShoppingCart
import MyLCD

def main():

    lcd = MyLCD.MyLCD()
    reader = SimpleMFRC522()

    checkedOut=False
    slist = ShoppingCart.ShoppingCart()
    shoppingListSum=0
    shoppingListSumString = str(shoppingListSum) + ",-"

    # Initialise display

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

if __name__ == "__main__":
	main()
