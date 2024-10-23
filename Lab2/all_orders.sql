USE labor_sql;
SELECT 
    SUBSTRING_INDEX(name, ' ', -1) AS last_name
FROM 
    Passenger
WHERE 
    SUBSTRING_INDEX(name, ' ', -1) NOT LIKE 'J%';


SELECT maker, type
FROM Product
WHERE type = 'Laptop'
ORDER BY maker;


SELECT DISTINCT maker
FROM Product
JOIN Laptop ON Product.model = Laptop.model
WHERE Laptop.speed <= 500;


SELECT maker
FROM Product
WHERE type = 'PC'
AND maker = SOME (SELECT maker FROM Product WHERE type = 'Laptop');


SELECT DISTINCT maker
FROM Product
JOIN Printer ON Product.model = Printer.model
WHERE maker IN (
    SELECT maker
    FROM Product
    JOIN PC ON Product.model = PC.model
    WHERE PC.speed = (SELECT MAX(speed) FROM PC)
);


SELECT DATE_FORMAT(date, '%d.%m.%Y') AS formatted_date
FROM Income;


SELECT model, COUNT(*) AS pc_count, AVG(price) AS avg_price
FROM PC
GROUP BY model
HAVING AVG(price) < 800;


SELECT 
    maker,
    SUM(CASE WHEN type = 'PC' THEN 1 ELSE 0 END) AS pc,
    SUM(CASE WHEN type = 'Laptop' THEN 1 ELSE 0 END) AS laptop,
    SUM(CASE WHEN type = 'Printer' THEN 1 ELSE 0 END) AS printer
FROM 
    Product
GROUP BY 
    maker;


SELECT 
    Ships.name, 
    Classes.numGuns, 
    Classes.bore, 
    Classes.displacement, 
    Classes.type, 
    Classes.country, 
    Ships.launched, 
    Ships.class
FROM 
    Ships
JOIN 
    Classes ON Ships.class = Classes.class
WHERE 
    ( (Classes.numGuns = 9) +
      (Classes.bore = 16) +
      (Classes.displacement = 46000) +
      (Classes.type = 'bb') +
      (Classes.country = 'Japan') +
      (Ships.launched = 1916) +
      (Classes.class = 'Revenge')
    ) >= 3
LIMIT 0, 1000;


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
