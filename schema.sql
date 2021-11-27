CREATE DATABASE YetiCave;

CREATE TABLE category
(
  id INT NOT NULL UNIQUE ,
  name VARCHAR (20) NOT NULL ,
  code VARCHAR (20) NOT NULL ,
  PRIMARY KEY (id) ,
  CONSTRAINT unique_name UNIQUE( name),
  CONSTRAINT unique_code UNIQUE( code )
);

CREATE TABLE lot
(
  id INT NOT NULL UNIQUE ,
  create_date DATETIME NOT NULL ,
  name VARCHAR (100) NOT NULL ,
  description VARCHAR (200) NOT NULL ,
  image VARCHAR (200) NOT NULL ,
  start_price INT NOT NULL ,
  end_date DATE NOT NULL ,
  step FLOAT ,
  author INT NOT NULL ,
  winner INT NOT NULL ,
  category_name INT NOT NULL ,
  PRIMARY KEY (id) ,
  CONSTRAINT unique_image UNIQUE( image ),
  CONSTRAINT unique_winner UNIQUE( winner ),
  CONSTRAINT unique_author UNIQUE( author )
);

CREATE TABLE bet
(
  id INT NOT NULL UNIQUE ,
  create_date DATETIME ,
  sum FLOAT ,
  user INT NOT NULL ,
  lot INT NOT NULL ,
  PRIMARY KEY (id)
);

CREATE TABLE users
(
  id INT NOT NULL UNIQUE ,
  reg_date DATETIME NOT NULL ,
  email VARCHAR (50) NOT NULL ,
  login VARCHAR (20) NOT NULL ,
  pass VARCHAR (30) NOT NULL,
  contacts VARCHAR (15) NOT NULL ,
  created_lots INT NOT NULL ,
  made_bets INT NOT NULL ,
  PRIMARY KEY (id) ,
  CONSTRAINT unique_email UNIQUE( email ),
  CONSTRAINT unique_login UNIQUE( login )
);
