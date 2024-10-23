SELECT 
    SUBSTRING_INDEX(name, ' ', -1) AS last_name
FROM 
    Passenger
WHERE 
    SUBSTRING_INDEX(name, ' ', -1) NOT LIKE 'J%';
