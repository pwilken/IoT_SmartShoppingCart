
import Item
import pymssql

class ShoppingCart(object):

    def __init__(self, connection):
        self.shoppinglist = list()
        self.listSum = 0
        self.connection = connection

    def addItem(self, x):
        self.ind = self.checkIfAlreadyInCart(x)
        if(self.ind != -1):
            self.shoppinglist.pop(self.ind)
            self.listSum -= self.getPrice(x.getGTIN())
            self.incrementItemCount(x.getGTIN())
        else:
            self.shoppinglist.append(x)
            x.price = self.getPrice(x.getGTIN())
            self.listSum += x.price
            self.decrementItemCount(x.getGTIN())
        self.connection.commit()

    def getList(self):
        return self.shoppinglist

    def getListSum(self):
        return self.listSum

    def checkIfAlreadyInCart(self, x):
        if(len(self.shoppinglist)==0):
            return -1
        for i in self.shoppinglist:
            if (i.getUID() == x.getUID()):
                return self.shoppinglist.index(i)
            else:
                return -1

    def getPrice(self, id):
        cursor = self.connection.cursor()
        cursor.execute('SELECT Price FROM Inventory WHERE ProductId = ' + id)
        x = cursor.next()
	return float(x[0])

    def incrementItemCount(self, id):
        cursor = self.connection.cursor()
        cursor.execute('UPDATE Inventory SET Count = Count+1 WHERE ProductId = ' + id)

    def decrementItemCount(self, id):
        cursor = self.connection.cursor()
        cursor.execute('UPDATE Inventory SET Count = Count-1 WHERE ProductId = ' + id)
