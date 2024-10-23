SELECT model, COUNT(*) AS pc_count, AVG(price) AS avg_price
FROM PC
GROUP BY model
HAVING AVG(price) < 800;
