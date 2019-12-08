-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema UtopiaAirline
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema UtopiaAirline
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `UtopiaAirline` DEFAULT CHARACTER SET utf8 ;
USE `UtopiaAirline` ;

-- -----------------------------------------------------
-- Table `UtopiaAirline`.`Airport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UtopiaAirline`.`Airport` (
  `airportName` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `zipCode` VARCHAR(45) NOT NULL,
  `airportCode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`airportCode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UtopiaAirline`.`Flights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UtopiaAirline`.`Flights` (
  `flightNo` INT NOT NULL,
  `totalSeats` INT NOT NULL,
  `departureAirport` VARCHAR(45) NOT NULL,
  `arrivalAirport` VARCHAR(45) NOT NULL,
  `departureTime` TIME NOT NULL,
  `arrivalTime` TIME NOT NULL,
  PRIMARY KEY (`flightNo`),
  INDEX `departureAirport_idx` (`departureAirport` ASC) ,
  INDEX `arrivalAirport_idx` (`arrivalAirport` ASC) ,
  CONSTRAINT `departureAirport`
    FOREIGN KEY (`departureAirport`)
    REFERENCES `UtopiaAirline`.`Airport` (`airportCode`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `arrivalAirport`
    FOREIGN KEY (`arrivalAirport`)
    REFERENCES `UtopiaAirline`.`Airport` (`airportCode`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UtopiaAirline`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UtopiaAirline`.`User` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `phoneNumber` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(200) NULL,
  `active` TINYINT NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UtopiaAirline`.`Reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UtopiaAirline`.`Reservation` (
  `reservationId` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `status` TINYINT NOT NULL,
  PRIMARY KEY (`reservationId`),
  INDEX `userId_idx` (`userId` ASC) ,
  CONSTRAINT `userId`
    FOREIGN KEY (`userId`)
    REFERENCES `UtopiaAirline`.`User` (`userId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UtopiaAirline`.`Itinerary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UtopiaAirline`.`Itinerary` (
  `flightNo` INT NOT NULL,
  `availableSeats` INT NOT NULL,
  `departureDate` DATE NOT NULL,
  `itineraryId` INT NOT NULL AUTO_INCREMENT,
  INDEX `flightNo_idx` (`flightNo` ASC) ,
  PRIMARY KEY (`itineraryId`),
  CONSTRAINT `flightNo`
    FOREIGN KEY (`flightNo`)
    REFERENCES `UtopiaAirline`.`Flights` (`flightNo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UtopiaAirline`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UtopiaAirline`.`Ticket` (
  `ticketId` INT NOT NULL AUTO_INCREMENT,
  `reservationId` INT NOT NULL,
  `flightPrice` INT NOT NULL,
  `itineraryId` INT NOT NULL,
  PRIMARY KEY (`ticketId`),
  INDEX `fk_Ticket_Reservation1_idx` (`reservationId` ASC) ,
  INDEX `itineraryId_idx` (`itineraryId` ASC) ,
  CONSTRAINT `fk_Ticket_Reservation1`
    FOREIGN KEY (`reservationId`)
    REFERENCES `UtopiaAirline`.`Reservation` (`reservationId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `itineraryId`
    FOREIGN KEY (`itineraryId`)
    REFERENCES `UtopiaAirline`.`Itinerary` (`itineraryId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UtopiaAirline`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UtopiaAirline`.`Role` (
  `roleId` INT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`roleId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UtopiaAirline`.`CardDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UtopiaAirline`.`CardDetails` (
  `userId` INT NOT NULL,
  `cardNumber` VARCHAR(45) NOT NULL,
  `cardType` VARCHAR(45) NULL,
  `expirationDate` DATE NOT NULL,
  `nameOnCard` VARCHAR(45) NOT NULL,
  INDEX `fk_Card Details_User1_idx` (`userId` ASC) ,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_Card Details_User1`
    FOREIGN KEY (`userId`)
    REFERENCES `UtopiaAirline`.`User` (`userId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UtopiaAirline`.`UserRole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `UtopiaAirline`.`UserRole` (
  `role_Id` INT NOT NULL,
  `user_Id` INT NOT NULL,
  INDEX `roleId_idx` (`role_Id` ASC) ,
  INDEX `userId_idx` (`user_Id` ASC) ,
  PRIMARY KEY (`role_Id`, `user_Id`),
  CONSTRAINT `role_Id`
    FOREIGN KEY (`role_Id`)
    REFERENCES `UtopiaAirline`.`Role` (`roleId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `user_Id`
    FOREIGN KEY (`user_Id`)
    REFERENCES `UtopiaAirline`.`User` (`userId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
