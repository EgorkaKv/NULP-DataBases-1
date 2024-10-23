SELECT DISTINCT maker
FROM Product
JOIN Printer ON Product.model = Printer.model
WHERE maker IN (
    SELECT maker
    FROM Product
    JOIN PC ON Product.model = PC.model
    WHERE PC.speed = (SELECT MAX(speed) FROM PC)
);
