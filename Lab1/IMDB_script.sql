-- MySQL Script generated by MySQL Workbench
-- Tue Sep 17 11:39:53 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema IMDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `IMDB` ;

-- -----------------------------------------------------
-- Schema IMDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `IMDB` DEFAULT CHARACTER SET utf8 ;
USE `IMDB` ;

-- -----------------------------------------------------
-- Table `IMDB`.`Actors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`Actors` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`Actors` (
  `idActors` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `birthdate` DATE NULL,
  `gender` VARCHAR(45) NOT NULL,
  `biography` LONGTEXT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idActors`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`Company` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`Company` (
  `Company_name` VARCHAR(45) NOT NULL,
  `founded_year` YEAR(4) NULL,
  `head` VARCHAR(45) NULL,
  PRIMARY KEY (`Company_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Director`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`Director` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`Director` (
  `idDirector` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `birthdate` DATE NULL,
  `biography` LONGTEXT NULL,
  PRIMARY KEY (`idDirector`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Fact_film`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`Fact_film` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`Fact_film` (
  `idFact` INT NOT NULL AUTO_INCREMENT,
  `fact` LONGTEXT NOT NULL,
  `idFilm` INT NOT NULL,
  PRIMARY KEY (`idFact`, `idFilm`),
  CONSTRAINT `fk_Fact_film_Film1`
    FOREIGN KEY (`idFilm`)
    REFERENCES `IMDB`.`Film` (`idFilm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Film`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`Film` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`Film` (
  `idFilm` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(100) NOT NULL,
  `Description` LONGTEXT NULL,
  `Release_date` DATE NOT NULL,
  `Duration` INT NOT NULL,
  `idRating` INT NULL,
  PRIMARY KEY (`idFilm`),
  CONSTRAINT `fk_Film_Rating1`
    FOREIGN KEY (`idRating`)
    REFERENCES `IMDB`.`Rating` (`idRating`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Film_has_Actors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`Film_has_Actors` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`Film_has_Actors` (
  `idFilm` INT NOT NULL,
  `idActors` INT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFilm`, `idActors`),
  CONSTRAINT `fk_Film_has_Actors_Film`
    FOREIGN KEY (`idFilm`)
    REFERENCES `IMDB`.`Film` (`idFilm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_has_Actors_Actors1`
    FOREIGN KEY (`idActors`)
    REFERENCES `IMDB`.`Actors` (`idActors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Film_has_Company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`Film_has_Company` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`Film_has_Company` (
  `idFilm` INT NOT NULL,
  `Company_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFilm`, `Company_name`),
  CONSTRAINT `fk_Film_has_Company_Film1`
    FOREIGN KEY (`idFilm`)
    REFERENCES `IMDB`.`Film` (`idFilm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_has_Company_Company1`
    FOREIGN KEY (`Company_name`)
    REFERENCES `IMDB`.`Company` (`Company_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Film_has_Director`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`Film_has_Director` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`Film_has_Director` (
  `idFilm` INT NOT NULL,
  `idDirector` INT NOT NULL,
  PRIMARY KEY (`idFilm`, `idDirector`),
  CONSTRAINT `fk_Film_has_Director_Film1`
    FOREIGN KEY (`idFilm`)
    REFERENCES `IMDB`.`Film` (`idFilm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_has_Director_Director1`
    FOREIGN KEY (`idDirector`)
    REFERENCES `IMDB`.`Director` (`idDirector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Film_has_Genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`Film_has_Genre` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`Film_has_Genre` (
  `idFilm` INT NOT NULL,
  `idGenre` INT ZEROFILL NOT NULL,
  PRIMARY KEY (`idFilm`, `idGenre`),
  CONSTRAINT `fk_Film_has_Genre_Film1`
    FOREIGN KEY (`idFilm`)
    REFERENCES `IMDB`.`Film` (`idFilm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_has_Genre_Genre1`
    FOREIGN KEY (`idGenre`)
    REFERENCES `IMDB`.`Genre` (`idGenre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Film_has_Language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`Film_has_Language` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`Film_has_Language` (
  `idFilm` INT NOT NULL,
  `Language_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFilm`, `Language_name`),
  CONSTRAINT `fk_Film_has_Language_Film1`
    FOREIGN KEY (`idFilm`)
    REFERENCES `IMDB`.`Film` (`idFilm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Film_has_Language_Language1`
    FOREIGN KEY (`Language_name`)
    REFERENCES `IMDB`.`Language` (`Language_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`Genre` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`Genre` (
  `idGenre` INT ZEROFILL NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGenre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Language`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`Language` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`Language` (
  `Language_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Language_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`Rating` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`Rating` (
  `idRating` INT NOT NULL,
  `value` FLOAT NOT NULL,
  `idUser` INT NOT NULL,
  PRIMARY KEY (`idRating`, `idUser`),
  CONSTRAINT `fk_Rating_User1`
    FOREIGN KEY (`idUser`)
    REFERENCES `IMDB`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`Review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`Review` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`Review` (
  `idReview` INT NOT NULL AUTO_INCREMENT,
  `review` LONGTEXT NOT NULL,
  `date` DATE NOT NULL,
  `idFilm` INT NOT NULL,
  `idUser` INT NOT NULL,
  PRIMARY KEY (`idReview`, `idFilm`, `idUser`),
  CONSTRAINT `fk_Review_Film1`
    FOREIGN KEY (`idFilm`)
    REFERENCES `IMDB`.`Film` (`idFilm`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_User1`
    FOREIGN KEY (`idUser`)
    REFERENCES `IMDB`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IMDB`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IMDB`.`User` ;

CREATE TABLE IF NOT EXISTS `IMDB`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;