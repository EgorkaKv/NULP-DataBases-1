SELECT DISTINCT maker
FROM Product
JOIN Laptop ON Product.model = Laptop.model
WHERE Laptop.speed <= 500;
