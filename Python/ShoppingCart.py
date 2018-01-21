import Item

class ShoppingCart(object):

    def __init__(self):
        self.shoppinglist = list()
        self.listSum = 0

    def addItem(self, x):

        if(self.checkIfAlreadyInCart(x)):
            self.shoppinglist.remove(x)
            self.listSum -= x.price
        else:
            self.shoppinglist.append(x)
            #TODO: DB Connection
            self.listSum += x.price

    def getList(self):
        return self.shoppinglist

    def getListSum(self):
        return self.listSum

    def checkIfAlreadyInCart(self, x):
        for i in self.shoppinglist:
            if (i.getUID() == x.getUID()):
                return True
            else: return False