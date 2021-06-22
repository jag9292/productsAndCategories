-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema productsAndCategories
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema productsAndCategories
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `productsAndCategories` DEFAULT CHARACTER SET utf8 ;
USE `productsAndCategories` ;

-- -----------------------------------------------------
-- Table `productsAndCategories`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `productsAndCategories`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `price` FLOAT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `productsAndCategories`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `productsAndCategories`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `productsAndCategories`.`categories_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `productsAndCategories`.`categories_products` (
  `category_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  INDEX `fk_categories_has_products_products1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_categories_has_products_categories_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_categories_has_products_categories`
    FOREIGN KEY (`category_id`)
    REFERENCES `productsAndCategories`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categories_has_products_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `productsAndCategories`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
