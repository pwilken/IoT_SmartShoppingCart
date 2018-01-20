class Item(object):

    def __init__(self, gtin, uid):
        self.gtin = gtin
        self.uid = uid
        self.price = 0

    def __init__(self, gtin, uid,price):
        self.gtin = gtin
        self.uid = uid
        self.price = price

    def getUID(self):
        return self.uid

    def getGTIN(self):
        return self.gtin

    def setPrice(self, price):
        self.price = price

    def getPrice(self):
        return self.price