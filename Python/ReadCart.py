#/usr/bin/env python

import RPi.GPIO as GPIO
from MFRC522.SimpleMFRC522 import *
from time import sleep

reader = SimpleMFRC522()

#TODO: gleiches Produkt entfernen falls nochmal gescannt (UID)

checkedOut=False
shoppingList=[]
shoppingListSum=0
while(checkedOut==False):
    try:
        id,itemName=reader.read()
        if(id==48700008907): #checkout if id matches checkout tag, white card atm
            checkedOut=True
        else:
            shoppingList.append(itemName)
            #TODO : Pull price from database via itemname/GTIN
            shoppingListSum+=1

            #TODO : Push new price to display
            print(shoppingListSum)
            for item in shoppingList:
                print(item)
            sleep(1)
    finally:
        GPIO.cleanup()
