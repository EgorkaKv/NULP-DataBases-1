SELECT Product.maker, Product.model, 'PC' AS type, PC.price
FROM Product
JOIN PC ON Product.model = PC.model
WHERE Product.maker = 'B'
UNION
SELECT Product.maker, Product.model, 'Laptop' AS type, Laptop.price
FROM Product
JOIN Laptop ON Product.model = Laptop.model
WHERE Product.maker = 'B'
UNION
SELECT Product.maker, Product.model, 'Printer' AS type, Printer.price
FROM Product
JOIN Printer ON Product.model = Printer.model
WHERE Product.maker = 'B';
