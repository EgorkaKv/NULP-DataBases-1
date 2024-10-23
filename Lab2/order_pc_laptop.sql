SELECT maker
FROM Product
WHERE type = 'PC'
AND maker = SOME (SELECT maker FROM Product WHERE type = 'Laptop');
