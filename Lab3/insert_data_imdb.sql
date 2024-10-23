USE `IMDB`;

INSERT INTO `User` (`user_name`, `email`) VALUES
('JohnDoe', 'john@example.com'),
('JaneSmith', 'jane@example.com'),
('AliceJohnsoactorsn', 'alice@example.com'),
('BobBrown', 'bob@example.com'),
('CharlieDavis', 'charlie@example.com'),
('EmilyClark', 'emily@example.com'),
('GeorgeWilson', 'george@example.com'),
('HannahWhite', 'hannah@example.com'),
('IvanMartin', 'ivan@example.com'),
('KateWalker', 'kate@example.com');


INSERT INTO `Film` (`Title`, `Description`, `Release_date`, `Duration`) VALUES
('The Matrix', 'A computer hacker learns about the true nature of reality.', '1999-03-31', 136),
('Inception', 'A thief who steals corporate secrets using dream-sharing technology.', '2010-07-16', 148),
('The Godfather', 'The aging patriarch of an organized crime dynasty.', '1972-03-24', 175),
('The Dark Knight', 'Batman faces the Joker, a criminal mastermind.', '2008-07-18', 152),
('Pulp Fiction', 'The lives of two mob hitmen, a boxer, and others intersect.', '1994-10-14', 154),
('Fight Club', 'An insomniac office worker forms an underground fight club.', '1999-10-15', 139),
('Forrest Gump', 'The presidencies of Kennedy and Johnson through the eyes of an innocent man.', '1994-07-06', 142),
('Interstellar', 'A group of astronauts travel through a wormhole in search of a new home.', '2014-11-07', 169),
('The Shawshank Redemption', 'Two imprisoned men bond over several years.', '1994-09-23', 142),
('Gladiator', 'A former Roman General sets out to exact vengeance.', '2000-05-05', 155);


INSERT INTO `Actors` (`name`, `birthdate`, `gender`, `biography`, `country`) VALUES
('Keanu Reeves', '1964-09-02', 'Male', 'Canadian actor known for The Matrix series.', 'Canada'),
('Leonardo DiCaprio', '1974-11-11', 'Male', 'American actor known for Titanic and Inception.', 'USA'),
('Marlon Brando', '1924-04-03', 'Male', 'Legendary American actor, known for The Godfather.', 'USA'),
('Christian Bale', '1974-01-30', 'Male', 'British actor known for The Dark Knight series.', 'UK'),
('Samuel L. Jackson', '1948-12-21', 'Male', 'American actor, known for Pulp Fiction.', 'USA'),
('Brad Pitt', '1963-12-18', 'Male', 'American actor known for Fight Club.', 'USA'),
('Tom Hanks', '1956-07-09', 'Male', 'American actor, known for Forrest Gump.', 'USA'),
('Matthew McConaughey', '1969-11-04', 'Male', 'American actor known for Interstellar.', 'USA'),
('Morgan Freeman', '1937-06-01', 'Male', 'American actor known for The Shawshank Redemption.', 'USA'),
('Russell Crowe', '1964-04-07', 'Male', 'Australian actor known for Gladiator.', 'Australia');


INSERT INTO `Genre` (`name`) VALUES
('Action'),
('Drama'),
('Thriller'),
('Science Fiction'),
('Crime'),
('Adventure'),
('Fantasy'),
('Historical'),
('Comedy'),
('Romance');


INSERT INTO `Director` (`name`, `birthdate`, `biography`) VALUES
('Christopher Nolan', '1970-07-30', 'British-American director, known for Inception and Interstellar.'),
('Quentin Tarantino', '1963-03-27', 'American director, known for Pulp Fiction.'),
('Steven Spielberg', '1946-12-18', 'American director, known for Jurassic Park and E.T.'),
('Martin Scorsese', '1942-11-17', 'American director, known for The Irishman and The Wolf of Wall Street.'),
('Francis Ford Coppola', '1939-04-07', 'American director, known for The Godfather series.'),
('Ridley Scott', '1937-11-30', 'British director, known for Gladiator.'),
('David Fincher', '1962-08-28', 'American director, known for Fight Club and Se7en.'),
('James Cameron', '1954-08-16', 'Canadian director, known for Titanic and Avatar.'),
('Peter Jackson', '1961-10-31', 'New Zealand director, known for The Lord of the Rings trilogy.'),
('Stanley Kubrick', '1928-07-26', 'American director, known for 2001: A Space Odyssey.');


INSERT INTO `Company` (`Company_name`, `founded_year`) VALUES
('Warner Bros', 1923),
('Paramount Pictures', 1912),
('Universal Pictures', 1912),
('20th Century Fox', 1935),
('Columbia Pictures', 1924),
('New Line Cinema', 1967),
('Miramax', 1979),
('DreamWorks', 1994),
('Pixar', 1986),
('Lionsgate', 1997);


INSERT INTO `Language` (`Language_name`) VALUES
('English'),
('French'),
('Spanish'),
('German'),
('Chinese'),
('Japanese'),
('Russian'),
('Italian'),
('Portuguese'),
('Korean');


INSERT INTO `Film_has_Actors` (`idFilm`, `idActors`, `role`) VALUES
(1, 1, 'Neo'),
(2, 2, 'Cobb'),
(3, 3, 'Vito Corleone'),
(4, 4, 'Bruce Wayne / Batman'),
(5, 5, 'Jules Winnfield'),
(6, 6, 'Tyler Durden'),
(7, 7, 'Forrest Gump'),
(8, 8, 'Cooper'),
(9, 9, 'Red'),
(10, 10, 'Maximus');


INSERT INTO `Film_has_Genre` (`idFilm`, `idGenre`) VALUES
(1, 4), -- The Matrix -> Science Fiction
(2, 3), -- Inception -> Thriller
(3, 5), -- The Godfather -> Crime
(4, 1), -- The Dark Knight -> Action
(5, 5), -- Pulp Fiction -> Crime
(6, 2), -- Fight Club -> Drama
(7, 2), -- Forrest Gump -> Drama
(8, 4), -- Interstellar -> Science Fiction
(9, 2), -- The Shawshank Redemption -> Drama
(10, 6); -- Gladiator -> Adventure


INSERT INTO `Rating` (`value`, `idFilm`, `idUser`) VALUES
(9.0, 1, 1),
(8.8, 2, 2),
(9.2, 3, 3),
(9.0, 4, 4),
(8.9, 5, 5),
(8.8, 6, 6),
(8.8, 7, 7),
(8.6, 8, 8),
(9.3, 9, 9),
(8.5, 10, 10);


INSERT INTO `Review` (`review`, `date`, `idFilm`, `idUser`) VALUES
('Amazing movie, a must-watch!', '2022-01-15', 1, 1),
('Mind-bending plot, loved it!', '2022-02-10', 2, 2),
('A classic. Timeless!', '2022-03-05', 3, 3),
('Best Batman movie ever!', '2022-04-12', 4, 4),
('Tarantino at his best.', '2022-05-23', 5, 5),
('An intense and unforgettable experience.', '2022-06-30', 6, 6),
('Heartwarming and inspirational.', '2022-07-25', 7, 7),
('A visual and emotional masterpiece.', '2022-08-20', 8, 8),
('A story of hope and friendship.', '2022-09-14', 9, 9),
('Epic in every sense!', '2022-10-05', 10, 10);


INSERT INTO `Fact_film` (`fact`, `idFilm`) VALUES
('Keanu Reeves did most of his own stunts.', 1),
('Leonardo DiCaprio delayed filming for weeks due to his schedule.', 2),
('Marlon Brando only worked for 6 weeks on The Godfather.', 3),
('Heath Ledger improvised many of the Joker\'s lines.', 4),
('Tarantino wrote Pulp Fiction in only 3 weeks.', 5),
('Brad Pitt chipped his tooth during Fight Club.', 6),
('Tom Hanks gained 30 pounds to play Forrest Gump.', 7),
('The black hole effects were scientifically accurate.', 8),
('Morgan Freeman almost turned down the role.', 9),
('Russell Crowe trained for months to get in shape for Gladiator.', 10);
