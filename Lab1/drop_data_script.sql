-- Truncate child tables first to avoid foreign key issues
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE IMDB.Film_has_Company;
TRUNCATE TABLE IMDB.Film_has_Actors;
TRUNCATE TABLE IMDB.Film_has_Director;
TRUNCATE TABLE IMDB.Film_has_Genre;
TRUNCATE TABLE IMDB.Film_has_Language;
TRUNCATE TABLE IMDB.Fact_film;
TRUNCATE TABLE IMDB.Rating;
TRUNCATE TABLE IMDB.Review;

-- Truncate parent tables after child tables
TRUNCATE TABLE IMDB.Film;
TRUNCATE TABLE IMDB.Company;
TRUNCATE TABLE IMDB.Actors;
TRUNCATE TABLE IMDB.Director;
TRUNCATE TABLE IMDB.Genre;
TRUNCATE TABLE IMDB.Language;
TRUNCATE TABLE IMDB.User;

SET FOREIGN_KEY_CHECKS = 1;

-- Insert new data after truncating
