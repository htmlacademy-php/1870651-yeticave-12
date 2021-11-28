INSERT INTO categories (name, code) VALUES ('Доски и лыжи', 'boards');
INSERT INTO categories (name, code) VALUES ('Крепления', 'attachment');
INSERT INTO categories (name, code) VALUES ('Ботинки', 'boots');
INSERT INTO categories (name, code) VALUES ('Одежда', 'clothing');
INSERT INTO categories (name, code) VALUES ('Инструменты', 'tools');
INSERT INTO categories (name, code) VALUES ('Разное', 'other');

INSERT INTO lots (name, category, price, url_picture, dateOfEnd) VALUES ('2014 Rossignol District Snowboard', 'Доски и лыжи', 10999, 'img/lot-1.jpg', '2021-11-18');
INSERT INTO lots (name, category, price, url_picture, dateOfEnd) VALUES ('DC Ply Mens 2016/2017 Snowboard', 'Доски и лыжи', 159999, 'img/lot-2.jpg', '2021-11-28');
INSERT INTO lots (name, category, price, url_picture, dateOfEnd) VALUES ('Крепления Union Contact Pro 2015 года размер L/XL', 'Крепления', 8000, 'img/lot-3.jpg', '2021-12-11');
INSERT INTO lots (name, category, price, url_picture, dateOfEnd) VALUES ('Ботинки для сноуборда DC Mutiny Charocal', 'Ботинки', 10999, 'img/lot-4.jpg', '2021-12-16');
INSERT INTO lots (name, category, price, url_picture, dateOfEnd) VALUES ('Куртка для сноуборда DC Mutiny Charocal', 'Одежда', 7500, 'img/lot-5.jpg', '2021-12-01');
INSERT INTO lots (name, category, price, url_picture, dateOfEnd) VALUES ('Маска Oakley Canopy', 'Разное', 5400, 'img/lot-6.jpg', '2021-11-12');

INSERT INTO users (login, password, email, contacts) VALUES ('first', 'first', 'first@mail.ru', '32131312');
INSERT INTO users (login, password, email, contacts) VALUES ('second', 'second', 'second@mail.ru', '32131322');
INSERT INTO users (login, password, email, contacts) VALUES ('third', 'third', 'third@mail.ru', '32131332');

INSERT INTO bets (user, lot, sum ) VALUES (1, 2, 100);
INSERT INTO bets (user, lot, sum ) VALUES (2, 2, 100);
INSERT INTO bets (user, lot, sum ) VALUES (1, 1, 100);
