SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema IMDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `IMDB`;

-- -----------------------------------------------------
-- Schema IMDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `IMDB` DEFAULT CHARACTER SET utf8;

USE `IMDB`;

-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `User`;


CREATE TABLE IF NOT EXISTS `User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) UNIQUE NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;

CREATE INDEX `idx_email` ON `User` (`email`);


-- -----------------------------------------------------
-- Table `Rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rating`;


CREATE TABLE IF NOT EXISTS `Rating` (
  `idRating` INT NOT NULL AUTO_INCREMENT,
  `value` FLOAT NOT NULL,
  `idFilm` INT NOT NULL,
  `idUser` INT NOT NULL,
  PRIMARY KEY (`idRating`),
  FOREIGN KEY (`idFilm`) REFERENCES `Film`(`idFilm`),
  FOREIGN KEY (`idUser`) REFERENCES `User`(`idUser`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Film`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Film`;


CREATE TABLE IF NOT EXISTS `Film` (
  `idFilm` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(100) NOT NULL,
  `Description` LONGTEXT NULL,
  `Release_date` DATE NOT NULL,
  `Duration` INT NOT NULL,
  PRIMARY KEY (`idFilm`))
ENGINE = InnoDB;

CREATE INDEX `idx_Release_date` ON `Film` (`Release_date`);
CREATE INDEX `idx_Duration` ON `Film` (`Duration`);


-- -----------------------------------------------------
-- Table `Actors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Actors`;


CREATE TABLE IF NOT EXISTS `Actors` (
  `idActors` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `birthdate` DATE NULL,
  `gender` VARCHAR(10) NOT NULL,
  `biography` LONGTEXT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idActors`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Film_has_Actors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Film_has_Actors`;


CREATE TABLE IF NOT EXISTS `Film_has_Actors` (
  `idFilm` INT NOT NULL,
  `idActors` INT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFilm`, `idActors`),
  FOREIGN KEY (`idFilm`) REFERENCES `Film`(`idFilm`),
  FOREIGN KEY (`idActors`) REFERENCES `Actors`(`idActors`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Review`;


CREATE TABLE IF NOT EXISTS `Review` (
  `idReview` INT NOT NULL AUTO_INCREMENT,
  `review` LONGTEXT NOT NULL,
  `date` DATE NOT NULL,
  `idFilm` INT NOT NULL,
  `idUser` INT NOT NULL,
  PRIMARY KEY (`idReview`),
  FOREIGN KEY (`idFilm`) REFERENCES `Film`(`idFilm`),
  FOREIGN KEY (`idUser`) REFERENCES `User`(`idUser`))
ENGINE = InnoDB;

CREATE INDEX `idx_date` ON `Review` (`date`);


-- -----------------------------------------------------
-- Table `Fact_film`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Fact_film`;


CREATE TABLE IF NOT EXISTS `Fact_film` (
  `idFact` INT NOT NULL AUTO_INCREMENT,
  `fact` LONGTEXT NOT NULL,
  `idFilm` INT NOT NULL,
  PRIMARY KEY (`idFact`),
  FOREIGN KEY (`idFilm`) REFERENCES `Film`(`idFilm`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Genre`;


CREATE TABLE IF NOT EXISTS `Genre` (
  `idGenre` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGenre`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Film_has_Genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Film_has_Genre`;


CREATE TABLE IF NOT EXISTS `Film_has_Genre` (
  `idFilm` INT NOT NULL,
  `idGenre` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`idFilm`, `idGenre`),
  FOREIGN KEY (`idFilm`) REFERENCES `Film`(`idFilm`),
  FOREIGN KEY (`idGenre`) REFERENCES `Genre`(`idGenre`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Director`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Director`;


CREATE TABLE IF NOT EXISTS `Director` (
  `idDirector` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `birthdate` DATE NULL,
  `biography` LONGTEXT NULL,
  PRIMARY KEY (`idDirector`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Company`;


CREATE TABLE IF NOT EXISTS `Company` (
  `Company_name` VARCHAR(45) NOT NULL,
  `founded_year` YEAR(4) NULL,
  PRIMARY KEY (`Company_name`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Film_has_Company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Film_has_Company`;


CREATE TABLE IF NOT EXISTS `Film_has_Company` (
  `idFilm` INT NOT NULL,
  `Company_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFilm`, `Company_name`),
  FOREIGN KEY (`idFilm`) REFERENCES `Film`(`idFilm`),
  FOREIGN KEY (`Company_name`) REFERENCES `Company`(`Company_name`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Language`;


CREATE TABLE IF NOT EXISTS `Language` (
  `Language_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Language_name`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Film_has_Language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Film_has_Language`;


CREATE TABLE IF NOT EXISTS `Film_has_Language` (
  `idFilm` INT NOT NULL,
  `Language_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFilm`, `Language_name`),
  FOREIGN KEY (`idFilm`) REFERENCES `Film`(`idFilm`),
  FOREIGN KEY (`Language_name`) REFERENCES `Language`(`Language_name`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Film_has_Director`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Film_has_Director`;


CREATE TABLE IF NOT EXISTS `Film_has_Director` (
  `idFilm` INT NOT NULL,
  `idDirector` INT NOT NULL,
  PRIMARY KEY (`idFilm`, `idDirector`),
  FOREIGN KEY (`idFilm`) REFERENCES `Film`(`idFilm`),
  FOREIGN KEY (`idDirector`) REFERENCES `Director`(`idDirector`))
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
