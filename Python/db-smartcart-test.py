import pymssql

conn = pymssql.connect("127.0.0.1", "SA", "IoT20172018", "SmartCart")
cursor = conn.cursor()
cursor.execute('SELECT * FROM products')

for row in cursor:
    print('row = %r' % (row,))

print('----------------')
cursor.execute('SELECT * FROM products RIGHT JOIN (SELECT ProductId, Count, Price FROM inventory where BrandId = 1) as Inventory on (products.Id = Inventory.ProductId)')

for row in cursor:
    print('row = %r' % (row,))


conn.close()
