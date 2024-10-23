USE imdb;

SELECT name, birthdate, country
FROM Actors
WHERE birthdate > '1980-01-01'
ORDER BY birthdate ASC;


SELECT 
    Film.Title AS Film_Title,
    Director.name AS Director_Name,
    Company.Company_name AS Production_Company
FROM 
    Film
JOIN 
    Film_has_Director ON Film.idFilm = Film_has_Director.idFilm
JOIN 
    Director ON Film_has_Director.idDirector = Director.idDirector
JOIN 
    Film_has_Company ON Film.idFilm = Film_has_Company.idFilm
JOIN 
    Company ON Film_has_Company.Company_name = Company.Company_name
ORDER BY 
    Film.Title;


SELECT 
    Genre.name AS Genre_Name,
    AVG(Rating.value) AS Average_Rating
FROM 
    Film
JOIN 
    Film_has_Genre ON Film.idFilm = Film_has_Genre.idFilm
JOIN 
    Genre ON Film_has_Genre.idGenre = Genre.idGenre
JOIN 
    Rating ON Film.idRating = Rating.idRating
GROUP BY 
    Genre.name
ORDER BY 
    Average_Rating DESC;


SELECT 
    Film.Title AS Film_Title,
    Film.Release_date
FROM 
    Film
JOIN 
    Film_has_Actors ON Film.idFilm = Film_has_Actors.idFilm
JOIN 
    Actors ON Film_has_Actors.idActors = Actors.idActors
WHERE 
    Actors.name = 'Tom Hanks'
ORDER BY 
    Film.Release_date DESC;


SELECT 
    Film.Title AS Film_Title,
    COUNT(Review.idReview) AS Review_Count
FROM 
    Film
LEFT JOIN 
    Review ON Film.idFilm = Review.idFilm
WHERE 
    Film.Release_date > '2010-12-31'
GROUP BY 
    Film.idFilm, Film.Title
ORDER BY 
    Review_Count DESC;
