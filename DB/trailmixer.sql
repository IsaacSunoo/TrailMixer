-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema trailmixer
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema trailmixer
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trailmixer` DEFAULT CHARACTER SET utf8 ;
USE `trailmixer` ;

-- -----------------------------------------------------
-- Table `trailmixer`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trailmixer`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trailmixer`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trailmixer`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL,
  `street2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trailmixer`.`profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trailmixer`.`profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `address_id` INT NOT NULL,
  `img_url` VARCHAR(500) NULL,
  `bio` VARCHAR(500) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_profile_idx` (`user_id` ASC),
  INDEX `fk_profile_address_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_profile`
    FOREIGN KEY (`user_id`)
    REFERENCES `trailmixer`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `trailmixer`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trailmixer`.`area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trailmixer`.`area` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trailmixer`.`difficulty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trailmixer`.`difficulty` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trailmixer`.`preference`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trailmixer`.`preference` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `difficulty_id` INT NULL,
  `trail_distance` INT NULL,
  `area_id` INT NULL,
  `altitude` INT NULL,
  `profile_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_profile_preference_idx` (`profile_id` ASC),
  INDEX `fk_area_preference_idx` (`area_id` ASC),
  INDEX `fk_difficulty_preference_idx` (`difficulty_id` ASC),
  CONSTRAINT `fk_profile_preference`
    FOREIGN KEY (`profile_id`)
    REFERENCES `trailmixer`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_area_preference`
    FOREIGN KEY (`area_id`)
    REFERENCES `trailmixer`.`area` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_difficulty_preference`
    FOREIGN KEY (`difficulty_id`)
    REFERENCES `trailmixer`.`difficulty` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trailmixer`.`trail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trailmixer`.`trail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(500) NULL,
  `img_url` VARCHAR(500) NULL,
  `difficulty_id` INT NOT NULL,
  `distance` INT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trail_address_idx` (`address_id` ASC),
  INDEX `fk_trail_difficulty_idx` (`difficulty_id` ASC),
  CONSTRAINT `fk_trail_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `trailmixer`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trail_difficulty`
    FOREIGN KEY (`difficulty_id`)
    REFERENCES `trailmixer`.`difficulty` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trailmixer`.`profile_trail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trailmixer`.`profile_trail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `profile_id` INT NOT NULL,
  `trail_id` INT NOT NULL,
  `rating` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_profile_profile_trail_idx` (`profile_id` ASC),
  INDEX `fk_trail_profile_trail_idx` (`trail_id` ASC),
  CONSTRAINT `fk_profile_profile_trail`
    FOREIGN KEY (`profile_id`)
    REFERENCES `trailmixer`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trail_profile_trail`
    FOREIGN KEY (`trail_id`)
    REFERENCES `trailmixer`.`trail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trailmixer`.`reason`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trailmixer`.`reason` (
  `id` INT NOT NULL,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trailmixer`.`profile_reason`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `trailmixer`.`profile_reason` (
  `profile_id` INT NOT NULL,
  `reason_id` INT NOT NULL,
  INDEX `fk_reason_profile_reason_idx` (`reason_id` ASC),
  INDEX `fk_profile_profile_reason_idx` (`profile_id` ASC),
  CONSTRAINT `fk_reason_profile_reason`
    FOREIGN KEY (`reason_id`)
    REFERENCES `trailmixer`.`reason` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_profile_reason`
    FOREIGN KEY (`profile_id`)
    REFERENCES `trailmixer`.`profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE USER 'trailuser'@'localhost' IDENTIFIED BY 'trailuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `trailmixer`.* TO 'trailuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
