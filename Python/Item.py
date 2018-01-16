class Item(object):

    def __init__(self, gtin, uid):
        self.gtin = gtin
        self.uid = uid

    def getUID(self):
        return self.uid

    def getGTIN(self):
        return self.gtin
