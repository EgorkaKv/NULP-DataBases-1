-- Insert data into Actors table
INSERT INTO IMDB.Actors (name, birthdate, gender, biography, country)
VALUES 
('John Doe', '1985-04-12', 'Male', 'An actor known for his versatile roles in independent films.', 'USA'),
('Jane Smith', '1990-07-24', 'Female', 'An acclaimed actress known for her strong performances in drama.', 'Canada'),
('Michael Johnson', '1978-09-15', 'Male', 'An award-winning actor famous for action films.', 'UK'),
('Emily Davis', '1982-11-30', 'Female', 'A popular actress featured in many romantic comedies.', 'Australia'),
('Chris Lee', '1995-01-22', 'Male', 'A young actor rising to prominence in sci-fi genres.', 'South Korea');

-- Insert data into Company table
INSERT INTO IMDB.Company (Company_name, founded_year, head)
VALUES 
('DreamWorks', 1994, 'Steven Spielberg'),
('Warner Bros', 1923, 'David Zaslav'),
('Universal Pictures', 1912, 'Donna Langley'),
('Pixar', 1986, 'Jim Morris'),
('20th Century Studios', 1935, 'Steve Asbell');

-- Insert data into Director table
INSERT INTO IMDB.Director (name, birthdate, biography)
VALUES 
('Steven Spielberg', '1946-12-18', 'An iconic director known for groundbreaking films like Jurassic Park and E.T.'),
('Christopher Nolan', '1970-07-30', 'Known for mind-bending films like Inception and The Dark Knight trilogy.'),
('Quentin Tarantino', '1963-03-27', 'A unique filmmaker known for Pulp Fiction and Kill Bill.'),
('Martin Scorsese', '1942-11-17', 'A master of cinema with films like Taxi Driver and The Irishman.'),
('Greta Gerwig', '1983-08-04', 'An actress turned director, famous for Lady Bird and Little Women.');

-- Insert data into Genre table
INSERT INTO IMDB.Genre (idGenre, name)
VALUES 
(001, 'Action'),
(002, 'Drama'),
(003, 'Comedy'),
(004, 'Sci-Fi'),
(005, 'Horror');

-- Insert data into Language table
INSERT INTO IMDB.Language (Language_name)
VALUES 
('English'),
('Spanish'),
('French'),
('Korean'),
('Japanese');

-- Insert data into User table
INSERT INTO IMDB.User (user_name, email)
VALUES 
('user1', 'user1@example.com'),
('user2', 'user2@example.com'),
('user3', 'user3@example.com'),
('user4', 'user4@example.com'),
('user5', 'user5@example.com');

-- Insert data into Rating table
INSERT INTO IMDB.Rating (idRating, value, idUser)
VALUES 
(1, 8.5, 1),
(2, 9.0, 2),
(3, 7.2, 3),
(4, 6.8, 4),
(5, 9.5, 5);

-- Insert data into Film table
INSERT INTO IMDB.Film (Title, Description, Release_date, Duration, idRating)
VALUES 
('Inception', 'A skilled thief leads a team on a mission to infiltrate dreams.', '2010-07-16', 148, 2),
('Pulp Fiction', 'Multiple intertwining stories set in the crime underworld.', '1994-10-14', 154, 3),
('Jurassic Park', 'Scientists bring dinosaurs back to life, with disastrous consequences.', '1993-06-11', 127, 1),
('Lady Bird', 'A coming-of-age story about a young woman in high school.', '2017-11-03', 94, 5),
('The Dark Knight', 'Batman faces his greatest challenge yet, the Joker.', '2008-07-18', 152, 2);

-- Insert data into Fact_film table
INSERT INTO IMDB.Fact_film (fact, idFilm)
VALUES 
('Inception took 10 years to write.', 1),
('Pulp Fiction was shot out of sequence.', 2),
('Jurassic Park used CGI and animatronics for the dinosaurs.', 3),
('Lady Bird was based on Greta Gerwig’s own experiences.', 4),
('The Dark Knight was the first superhero film to gross $1 billion.', 5);

-- Insert data into Film_has_Actors table
INSERT INTO IMDB.Film_has_Actors (idFilm, idActors, role)
VALUES 
(1, 1, 'Dominic Cobb'),
(2, 2, 'Mia Wallace'),
(3, 3, 'Dr. Alan Grant'),
(4, 4, 'Christine'),
(5, 5, 'Bruce Wayne');

-- Insert data into Film_has_Company table
INSERT INTO IMDB.Film_has_Company (idFilm, Company_name)
VALUES 
(1, 'Warner Bros'),
(2, 'Miramax'),
(3, 'Universal Pictures'),
(4, 'A24'),
(5, 'Warner Bros');

-- Insert data into Film_has_Director table
INSERT INTO IMDB.Film_has_Director (idFilm, idDirector)
VALUES 
(1, 2),
(2, 3),
(3, 1),
(4, 5),
(5, 2);

-- Insert data into Film_has_Genre table
INSERT INTO IMDB.Film_has_Genre (idFilm, idGenre)
VALUES 
(1, 004),
(2, 002),
(3, 001),
(4, 002),
(5, 001);

-- Insert data into Film_has_Language table
INSERT INTO IMDB.Film_has_Language (idFilm, Language_name)
VALUES 
(1, 'English'),
(2, 'English'),
(3, 'English'),
(4, 'English'),
(5, 'English');

-- Insert data into Review table
INSERT INTO IMDB.Review (review, date, idFilm, idUser)
VALUES 
('Amazing visuals and mind-bending story.', '2010-07-20', 1, 1),
('A masterpiece of nonlinear storytelling.', '1994-10-15', 2, 2),
('Dinosaurs never looked so real.', '1993-06-15', 3, 3),
('A heartfelt and poignant coming-of-age story.', '2017-11-05', 4, 4),
('An incredible performance by Heath Ledger.', '2008-07-20', 5, 5);
