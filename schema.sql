CREATE DATABASE `yeticave`;
USE `yetiyave`;
CREATE TABLE `categories`
(
  `idcategories` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `code` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idcategories`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) VISIBLE
);

CREATE TABLE `lots`
(
  `idlots` INT NOT NULL AUTO_INCREMENT,
  `create_date` DATETIME NOT NULL DEFAULT NOW,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `url_picture` VARCHAR(200) NOT NULL,
  `price` FLOAT NOT NULL,
  `end_date` DATETIME NOT NULL,
  `step` FLOAT NOT NULL,
  `author` INT NOT NULL,
  `winner` INT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`idlots`),
  UNIQUE INDEX `url_picture_UNIQUE` (`url_picture` ASC) VISIBLE,
  INDEX `fk_lots_categories_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_lots_users1_idx` (`author` ASC, `winner` ASC) VISIBLE,
  CONSTRAINT `fk_lots_categories`
    FOREIGN KEY (`category_id`)
    REFERENCES `mydb`.`categories` (`idcategories`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lots_users1`
    FOREIGN KEY (`author` , `winner`)
    REFERENCES `mydb`.`users` (`idusers` , `idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `bets`
(
`idbets` INT NOT NULL AUTO_INCREMENT,
  `create_date` DATETIME NOT NULL DEFAULT NOW,
  `sum` FLOAT NOT NULL,
  `user` INT NOT NULL,
  `lot` INT NOT NULL,
  PRIMARY KEY (`idbets`),
  INDEX `fk_bets_lots1_idx` (`lot` ASC) VISIBLE,
  INDEX `fk_bets_users1_idx` (`user` ASC) VISIBLE,
  CONSTRAINT `fk_bets_lots1`
    FOREIGN KEY (`lot`)
    REFERENCES `mydb`.`lots` (`idlots`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bets_users1`
    FOREIGN KEY (`user`)
    REFERENCES `mydb`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `users`
(
  `idusers` INT NOT NULL AUTO_INCREMENT,
  `reg_date` DATETIME NOT NULL DEFAULT NOW,
  `email` VARCHAR(50) NOT NULL,
  `login` VARCHAR(20) NOT NULL,
  `password` CHAR(32) NOT NULL,
  `contacts` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
  UNIQUE INDEX `contacts_UNIQUE` (`contacts` ASC) VISIBLE)
);

