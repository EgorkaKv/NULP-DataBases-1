SELECT 
    maker,
    SUM(CASE WHEN type = 'PC' THEN 1 ELSE 0 END) AS pc,
    SUM(CASE WHEN type = 'Laptop' THEN 1 ELSE 0 END) AS laptop,
    SUM(CASE WHEN type = 'Printer' THEN 1 ELSE 0 END) AS printer
FROM 
    Product
GROUP BY 
    maker;
