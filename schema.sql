CREATE DATABASE YetiCave;

CREATE TABLE category
(
  id INT NOT NULL UNIQUE AUTO_INCREMENT ,
  name VARCHAR (20) NOT NULL ,
  code VARCHAR (20) NOT NULL ,
  PRIMARY KEY (id) ,
  CONSTRAINT unique_name UNIQUE( name ),
  CONSTRAINT unique_code UNIQUE( code )
);

CREATE TABLE lot
(
  id INT NOT NULL UNIQUE AUTO_INCREMENT ,
  create_date DATETIME NOT NULL DEFAULT NOW() ,
  name VARCHAR (100) NOT NULL ,
  description VARCHAR (200) NOT NULL ,
  image VARCHAR (200) NOT NULL ,
  start_price INT NOT NULL ,
  end_date DATE NOT NULL ,
  step FLOAT NOT NULL ,
  author INT NOT NULL ,
  winner INT  ,
  category_id INT NOT NULL ,
  PRIMARY KEY (id) ,
  CONSTRAINT unique_image UNIQUE( image )
);

CREATE TABLE bet
(
  id INT NOT NULL UNIQUE AUTO_INCREMENT ,
  create_date DATETIME DEFAULT NOW() ,
  sum FLOAT NOT NULL ,
  user INT NOT NULL ,
  lot INT NOT NULL ,
  PRIMARY KEY (id)
);

CREATE TABLE users
(
  id INT NOT NULL UNIQUE AUTO_INCREMENT ,
  reg_date DATETIME NOT NULL DEFAULT NOW() ,
  email VARCHAR (50) NOT NULL ,
  login VARCHAR (20) NOT NULL ,
  pass CHAR (32) NOT NULL,
  contacts VARCHAR (15) NOT NULL ,
  PRIMARY KEY (id) ,
  CONSTRAINT unique_email UNIQUE( email ),
  CONSTRAINT unique_login UNIQUE( login )
);
