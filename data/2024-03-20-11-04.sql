-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BetterConnectionG1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `BetterConnectionG1` ;

-- -----------------------------------------------------
-- Schema BetterConnectionG1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BetterConnectionG1` DEFAULT CHARACTER SET utf8 ;
USE `BetterConnectionG1` ;

-- -----------------------------------------------------
-- Table `BetterConnectionG1`.`news`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BetterConnectionG1`.`news` ;

CREATE TABLE IF NOT EXISTS `BetterConnectionG1`.`news` (
  `idnews` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(120) NOT NULL,
  `slug` VARCHAR(121) NOT NULL,
  `content` TEXT NOT NULL,
  `date_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `date_published` DATETIME NULL,
  `is_published` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 => attente de validation\n1 => est affiché\n2 => est banni',
  PRIMARY KEY (`idnews`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `slug_UNIQUE` ON `BetterConnectionG1`.`news` (`slug` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `BetterConnectionG1`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BetterConnectionG1`.`category` ;

CREATE TABLE IF NOT EXISTS `BetterConnectionG1`.`category` (
  `idcategory` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `slug` VARCHAR(101) NOT NULL,
  `description` VARCHAR(400) NULL,
  PRIMARY KEY (`idcategory`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `slug_UNIQUE` ON `BetterConnectionG1`.`category` (`slug` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `BetterConnectionG1`.`news_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BetterConnectionG1`.`news_has_category` ;

CREATE TABLE IF NOT EXISTS `BetterConnectionG1`.`news_has_category` (
  `news_idnews` INT UNSIGNED NOT NULL,
  `category_idcategory` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`news_idnews`, `category_idcategory`),
  CONSTRAINT `fk_news_has_category_news`
    FOREIGN KEY (`news_idnews`)
    REFERENCES `BetterConnectionG1`.`news` (`idnews`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_news_has_category_category1`
    FOREIGN KEY (`category_idcategory`)
    REFERENCES `BetterConnectionG1`.`category` (`idcategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_news_has_category_category1_idx` ON `BetterConnectionG1`.`news_has_category` (`category_idcategory` ASC) VISIBLE;

CREATE INDEX `fk_news_has_category_news_idx` ON `BetterConnectionG1`.`news_has_category` (`news_idnews` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
