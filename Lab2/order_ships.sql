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
