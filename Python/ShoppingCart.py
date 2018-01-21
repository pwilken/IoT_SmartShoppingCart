import Item

class ShoppingCart(object):

    def __init__(self):
        self.shoppinglist = list()
        self.listSum = 0

    def addItem(self, x):
        self.ind = self.checkIfAlreadyInCart(x)
        if(self.ind != -1):
            self.shoppinglist.pop(self.ind)
            #self.listSum -= x.price
            self.listSum -= 1
        else:
            self.shoppinglist.append(x)
            #TODO: DB Connection
            #self.listSum += x.price
	    self.listSum+=1

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
