CREATE DATABASE YetiCave;
USE YetiCave;

CREATE TABLE categories
(
  id INT NOT NULL AUTO_INCREMENT ,
  name VARCHAR (20) NOT NULL ,
  code VARCHAR (20) NOT NULL ,
  PRIMARY KEY (id) ,
  CONSTRAINT unique_name UNIQUE( name),
  CONSTRAINT unique_code UNIQUE( code )
);

CREATE TABLE lots
(
  id INT NOT NULL AUTO_INCREMENT ,
  create_date DATETIME NOT NULL  DEFAULT NOW() ,
  name VARCHAR (100) NOT NULL ,
  description VARCHAR (200) NOT NULL ,
  url_pictures VARCHAR (200) NOT NULL ,
  price INT NOT NULL ,
  dateOfEnd DATE NOT NULL ,
  step FLOAT ,
  author INT NOT NULL ,
  winner INT  ,
  category INT NOT NULL ,
  PRIMARY KEY (id) ,
  CONSTRAINT unique_image UNIQUE( image ),
  CONSTRAINT unique_winner UNIQUE( winner ),
  CONSTRAINT unique_author UNIQUE( author )
);

CREATE TABLE bets
(
  id INT NOT NULL AUTO_INCREMENT ,
  create_date DATETIME DEFAULT NOW() ,
  sum FLOAT ,
  user INT NOT NULL ,
  lot INT NOT NULL ,
  PRIMARY KEY (id)
);

CREATE TABLE users
(
  id INT NOT NULL AUTO_INCREMENT ,
  reg_date DATETIME NOT NULL DEFAULT NOW,
  email VARCHAR (50) NOT NULL ,
  login VARCHAR (20) NOT NULL ,
  password CHAR (32) NOT NULL,
  contacts VARCHAR (15) NOT NULL ,
  created_lots INT NOT NULL ,
  made_bets INT NOT NULL ,
  PRIMARY KEY (id) ,
  CONSTRAINT unique_email UNIQUE( email ),
  CONSTRAINT unique_login UNIQUE( login )
);

ALTER TABLE lots
	ADD CONSTRAINT lnk_category_lot FOREIGN KEY ( category_id )
	REFERENCES category( id )
	ON DELETE Cascade
	ON UPDATE Cascade;
  ADD CONSTRAINT `lnk_users_lot` FOREIGN KEY ( `author`, `winner` )
	REFERENCES `users`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;

ALTER TABLE `users`
	ADD CONSTRAINT `lnk_bet_users` FOREIGN KEY ( `bet_id` )
	REFERENCES `bets`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;

ALTER TABLE `bets`
	ADD CONSTRAINT `lnk_lot_bet` FOREIGN KEY ( `lot_id` )
	REFERENCES `lots`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;

ALTER TABLE `users`
	ADD CONSTRAINT `lnk_lot_users` FOREIGN KEY ( `created_lots` )
	REFERENCES `lots`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;

ALTER TABLE `users`
	ADD CONSTRAINT `lnk_bet_users_2` FOREIGN KEY ( `made_bets` )
	REFERENCES `bets`( `id` )
	ON DELETE Cascade
	ON UPDATE Cascade;

