-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema blooddonation
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blooddonation
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blooddonation` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `blooddonation` ;

-- -----------------------------------------------------
-- Table `blooddonation`.`doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blooddonation`.`doctor` (
  `DoctorID` VARCHAR(50) NOT NULL,
  `FullName` VARCHAR(50) NOT NULL,
  `Gender` VARCHAR(50) NOT NULL,
  `DateOfBirth` VARCHAR(50) NOT NULL,
  `SSN` VARCHAR(50) NOT NULL,
  `PhoneNumber` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `City` VARCHAR(50) NOT NULL,
  `District` VARCHAR(50) NOT NULL,
  `Street` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`DoctorID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blooddonation`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blooddonation`.`stock` (
  `BloodGroup` VARCHAR(3) NOT NULL,
  `Units` INT NOT NULL,
  PRIMARY KEY (`BloodGroup`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blooddonation`.`donor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blooddonation`.`donor` (
  `DonorID` VARCHAR(50) NOT NULL,
  `FullName` VARCHAR(50) NOT NULL,
  `Gender` VARCHAR(50) NOT NULL,
  `DateOfBirth` VARCHAR(50) NOT NULL,
  `SSN` VARCHAR(50) NOT NULL,
  `PhoneNumber` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(50) NOT NULL,
  `BloodGroup` VARCHAR(3) NULL DEFAULT NULL,
  `DonatedTimes` VARCHAR(50) NULL DEFAULT NULL,
  `LastDonationDate` VARCHAR(20) NULL DEFAULT NULL,
  `NextDonationDate` VARCHAR(20) NULL DEFAULT NULL,
  `City` VARCHAR(50) NOT NULL,
  `District` VARCHAR(50) NOT NULL,
  `Street` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`DonorID`, `SSN`, `Email`),
  INDEX `fk_donor_stock_idx` (`BloodGroup` ASC) VISIBLE,
  CONSTRAINT `fk_donor_stock`
    FOREIGN KEY (`BloodGroup`)
    REFERENCES `blooddonation`.`stock` (`BloodGroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blooddonation`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blooddonation`.`event` (
  `Name` VARCHAR(50) NOT NULL,
  `StartDate` DATE NOT NULL,
  `EndDate` DATE NOT NULL,
  `Location` VARCHAR(50) NOT NULL,
  `HeadDoctor` VARCHAR(50) NULL,
  `NoParticipants` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Name`, `StartDate`, `HeadDoctor`),
  INDEX `fk_event_doctor_idx` (`HeadDoctor` ASC) VISIBLE,
  CONSTRAINT `fk_event_doctor`
    FOREIGN KEY (`HeadDoctor`)
    REFERENCES `blooddonation`.`doctor` (`DoctorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blooddonation`.`history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blooddonation`.`history` (
  `DonorID` VARCHAR(50) NULL,
  `DonationDate` VARCHAR(20) NOT NULL,
  `BloodVolume` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`DonorID`, `DonationDate`),
  CONSTRAINT `fk_history_donor`
    FOREIGN KEY (`DonorID`)
    REFERENCES `blooddonation`.`donor` (`DonorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blooddonation`.`registration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blooddonation`.`registration` (
  `DonorID` VARCHAR(50) NULL,
  `EventName` VARCHAR(50) NULL,
  `Date` DATE NULL,
  PRIMARY KEY (`DonorID`, `EventName`, `Date`),
  INDEX `fk_registration_event_name_idx` (`EventName` ASC) VISIBLE,
  INDEX `fk_registration_event_startDate_idx` (`Date` ASC) VISIBLE,
  CONSTRAINT `fk_registration_donor`
    FOREIGN KEY (`DonorID`)
    REFERENCES `blooddonation`.`donor` (`DonorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registration_event_name`
    FOREIGN KEY (`EventName`)
    REFERENCES `blooddonation`.`event` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registration_event_startDate`
    FOREIGN KEY (`Date`)
    REFERENCES `blooddonation`.`event` (`StartDate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
