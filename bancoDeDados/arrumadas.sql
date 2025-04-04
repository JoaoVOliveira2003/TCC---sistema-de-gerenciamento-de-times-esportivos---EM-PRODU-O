
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tcc
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `tcc` ;

-- -----------------------------------------------------
-- Schema tcc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tcc` DEFAULT CHARACTER SET utf8mb4 ;
USE `tcc` ;

-- -----------------------------------------------------
-- Table `tcc`.`nacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`nacao`;

CREATE TABLE IF NOT EXISTS `tcc`.`nacao` (
  `cod_nacao` SMALLINT NOT NULL AUTO_INCREMENT,
  `sigla_nacao` CHAR(3) NULL,
  PRIMARY KEY (`cod_nacao`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `tcc`.`estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`estado`;

CREATE TABLE IF NOT EXISTS `tcc`.`estado` (
  `cod_estado` SMALLINT NOT NULL AUTO_INCREMENT,
  `cod_nacao` SMALLINT NOT NULL,
  `desc_estado` VARCHAR(50) NULL,
  `sigla_estado` CHAR(3) NULL,
  PRIMARY KEY (`cod_estado`),
  CONSTRAINT `fk_estado_nacao`
    FOREIGN KEY (`cod_nacao`)
    REFERENCES `tcc`.`nacao` (`cod_nacao`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `tcc`.`municipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tcc`.`municipio`;

CREATE TABLE IF NOT EXISTS `tcc`.`municipio` (
  `cod_municipio` INT NOT NULL AUTO_INCREMENT,
  `cod_estado` SMALLINT NOT NULL,
  `desc_municipio` VARCHAR(50) NULL,
  `sigla_municipio` CHAR(3) NULL,
  PRIMARY KEY (`cod_municipio`),
  CONSTRAINT `fk_municipio_estado`
    FOREIGN KEY (`cod_estado`)
    REFERENCES `tcc`.`estado` (`cod_estado`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;
