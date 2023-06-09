# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\003-Vrtic\vrtic.sql

-- MySQL Script generated by MySQL Workbench
-- Tue May 30 18:54:59 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Vrtic
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Vrtic` ;

-- -----------------------------------------------------
-- Schema Vrtic
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Vrtic` DEFAULT CHARACTER SET utf8 ;
USE `Vrtic` ;

-- -----------------------------------------------------
-- Table `Vrtic`.`dijete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vrtic`.`dijete` (
  `iddijete` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `ime_roditelja` VARCHAR(45) NOT NULL,
  `kontakt_roditelja` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iddijete`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vrtic`.`skupina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vrtic`.`skupina` (
  `idskupina` INT NOT NULL AUTO_INCREMENT,
  `ime_skupine` VARCHAR(45) NOT NULL,
  `max_broj_polaznika` INT NULL,
  PRIMARY KEY (`idskupina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vrtic`.`prijava`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vrtic`.`prijava` (
  `idprijava` INT NOT NULL AUTO_INCREMENT,
  `skupina_idskupina1` INT NOT NULL,
  PRIMARY KEY (`idprijava`, `skupina_idskupina1`),
  INDEX `fk_prijava_skupina1_idx` (`skupina_idskupina1` ASC),
  CONSTRAINT `fk_prijava_skupina1`
    FOREIGN KEY (`skupina_idskupina1`)
    REFERENCES `Vrtic`.`skupina` (`idskupina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vrtic`.`dogadjaj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vrtic`.`dogadjaj` (
  `iddogadjaj` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `datum` DATE NULL,
  `opis` TEXT NULL,
  PRIMARY KEY (`iddogadjaj`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vrtic`.`informacije`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vrtic`.`informacije` (
  `naziv_vrtica` VARCHAR(45) NOT NULL,
  `adresa` VARCHAR(45) NOT NULL,
  `Kontakt` VARCHAR(45) NOT NULL,
  `opis` TEXT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vrtic`.`galerija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vrtic`.`galerija` (
  `idgalerija` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NOT NULL,
  `opis` TEXT NULL,
  PRIMARY KEY (`idgalerija`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vrtic`.`fotografija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vrtic`.`fotografija` (
  `idfotografija` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `galerija_idgalerija` INT NOT NULL,
  PRIMARY KEY (`idfotografija`),
  INDEX `fk_fotografija_galerija1_idx` (`galerija_idgalerija` ASC),
  CONSTRAINT `fk_fotografija_galerija1`
    FOREIGN KEY (`galerija_idgalerija`)
    REFERENCES `Vrtic`.`galerija` (`idgalerija`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vrtic`.`dijete_has_prijava`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vrtic`.`dijete_has_prijava` (
  `dijete_iddijete` INT NOT NULL,
  `prijava_idprijava` INT NOT NULL,
  PRIMARY KEY (`dijete_iddijete`, `prijava_idprijava`),
  INDEX `fk_dijete_has_prijava_prijava1_idx` (`prijava_idprijava` ASC),
  INDEX `fk_dijete_has_prijava_dijete_idx` (`dijete_iddijete` ASC),
  CONSTRAINT `fk_dijete_has_prijava_dijete`
    FOREIGN KEY (`dijete_iddijete`)
    REFERENCES `Vrtic`.`dijete` (`iddijete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dijete_has_prijava_prijava1`
    FOREIGN KEY (`prijava_idprijava`)
    REFERENCES `Vrtic`.`prijava` (`idprijava`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vrtic`.`galerija_has_dogadjaj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vrtic`.`galerija_has_dogadjaj` (
  `galerija_idgalerija` INT NOT NULL,
  `dogadjaj_iddogadjaj` INT NOT NULL,
  PRIMARY KEY (`galerija_idgalerija`, `dogadjaj_iddogadjaj`),
  INDEX `fk_galerija_has_dogadjaj_dogadjaj1_idx` (`dogadjaj_iddogadjaj` ASC),
  INDEX `fk_galerija_has_dogadjaj_galerija1_idx` (`galerija_idgalerija` ASC),
  CONSTRAINT `fk_galerija_has_dogadjaj_galerija1`
    FOREIGN KEY (`galerija_idgalerija`)
    REFERENCES `Vrtic`.`galerija` (`idgalerija`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_galerija_has_dogadjaj_dogadjaj1`
    FOREIGN KEY (`dogadjaj_iddogadjaj`)
    REFERENCES `Vrtic`.`dogadjaj` (`iddogadjaj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vrtic`.`skupina_has_dogadjaj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vrtic`.`skupina_has_dogadjaj` (
  `skupina_idskupina` INT NOT NULL,
  `dogadjaj_iddogadjaj` INT NOT NULL,
  PRIMARY KEY (`skupina_idskupina`, `dogadjaj_iddogadjaj`),
  INDEX `fk_skupina_has_dogadjaj_dogadjaj1_idx` (`dogadjaj_iddogadjaj` ASC),
  INDEX `fk_skupina_has_dogadjaj_skupina1_idx` (`skupina_idskupina` ASC),
  CONSTRAINT `fk_skupina_has_dogadjaj_skupina1`
    FOREIGN KEY (`skupina_idskupina`)
    REFERENCES `Vrtic`.`skupina` (`idskupina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_skupina_has_dogadjaj_dogadjaj1`
    FOREIGN KEY (`dogadjaj_iddogadjaj`)
    REFERENCES `Vrtic`.`dogadjaj` (`iddogadjaj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
