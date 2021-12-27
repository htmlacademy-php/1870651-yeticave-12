CREATE DATABASE `yeticave`;
USE `yetiсave`;
CREATE TABLE `categories`
(
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `code` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) VISIBLE
);

CREATE TABLE `lots`
(
  `id` INT NOT NULL AUTO_INCREMENT,
  `create_date` DATETIME NOT NULL DEFAULT NOW(),
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(1000) NOT NULL,
  `url_picture` VARCHAR(200) NOT NULL,
  `price` FLOAT NOT NULL,
  `end_date` DATETIME NOT NULL,
  `step` FLOAT NOT NULL,
  `author_id` INT NOT NULL,
  `winner_id` INT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `url_picture_UNIQUE` (`url_picture` ASC) VISIBLE,
  INDEX `fk_lots_categories_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_lots_users1_idx` (`author` ASC, `winner` ASC) VISIBLE,
  CONSTRAINT `fk_lots_categories`
    FOREIGN KEY (`category_id`)
    REFERENCES `yeticave`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lots_users1`
    FOREIGN KEY (`author` , `winner`)
    REFERENCES `yeticave`.`users` (`id` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `bets`
(
  `id` INT NOT NULL AUTO_INCREMENT,
  `create_date` DATETIME NOT NULL DEFAULT NOW(),
  `sum` FLOAT NOT NULL,
  `user_id` INT NOT NULL,
  `lot_id` INT NOT NULL,
  PRIMARY KEY (`idbets`),
  INDEX `fk_bets_lots1_idx` (`lot` ASC) VISIBLE,
  INDEX `fk_bets_users1_idx` (`user` ASC) VISIBLE,
  CONSTRAINT `fk_bets_lots1`
    FOREIGN KEY (`lot_id`)
    REFERENCES `yeticave`.`lots` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bets_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `yeticave`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `users`
(
  `id` INT NOT NULL AUTO_INCREMENT,
  `reg_date` DATETIME NOT NULL DEFAULT NOW(),
  `email` VARCHAR(50) NOT NULL,
  `login` VARCHAR(20) NOT NULL,
  `password` CHAR(255) NOT NULL,
  `contacts` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
  UNIQUE INDEX `contacts_UNIQUE` (`contacts` ASC) VISIBLE)
);

