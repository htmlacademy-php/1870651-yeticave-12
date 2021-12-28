//Заполнение таблицы categories
INSERT INTO categories
  (name, code)
VALUES
  ('Доски и лыжи', 'boards'),
  ('Крепления', 'attachment'),
  ('Ботинки', 'boots'),
  ('Одежда', 'clothing'),
  ('Инструменты', 'tools'),
  ('Разное', 'other');
//Заполнение таблицы lots
INSERT INTO lots (name, category_id, price, step, url_picture, end_date, author, description)
  VALUES ('2014 Rossignol District Snowboard', 1, 10999, 0.5, 'img/lot-1.jpg', '2021-11-18', 1, 'Самый лучший сноуборд');
INSERT INTO lots (name, category_id, price, step, url_picture, end_date, author, description)
  VALUES ('DC Ply Mens 2016/2017 Snowboard', 1, 159999, 0.5, 'img/lot-2.jpg', '2021-11-28', 2, 'Ещё лучше сноуборд');
INSERT INTO lots (name, category_id, price, step, url_picture, end_date, author, description)
  VALUES ('Крепления Union Contact Pro 2015 года размер L/XL', 2, 8000, 0.5, 'img/lot-3.jpg', '2021-12-11', 1, 'Надёжнее креплений не найти');
INSERT INTO lots (name, category_id, price, step, url_picture, end_date, author, description)
  VALUES ('Ботинки для сноуборда DC Mutiny Charocal', 3, 10999, 0.5, 'img/lot-4.jpg', '2021-12-16', 3, 'Удобнее ботинок не бывает');
INSERT INTO lots (name, category_id, price, step, url_picture, end_date, author, description)
  VALUES ('Куртка для сноуборда DC Mutiny Charocal', 4, 7500, 0.5, 'img/lot-5.jpg', '2021-12-01', 3, 'Самая тёплая куртка');
INSERT INTO lots (name, category_id, price, step, url_picture, end_date, author, description)
  VALUES ('Маска Oakley Canopy', 6, 5400, 0.5, 'img/lot-6.jpg', '2021-11-12', 1, 'Ваше лицо скажет Вам спасибо');

//Заполнение таблицы users
INSERT INTO users (login, password, email, contacts) VALUES ('first', 'first', 'first@mail.ru', '32131312');
INSERT INTO users (login, password, email, contacts) VALUES ('second', 'second', 'second@mail.ru', '32131322');
INSERT INTO users (login, password, email, contacts) VALUES ('third', 'third', 'third@mail.ru', '32131332');

//Заполнение таблицы bets
INSERT INTO bets (user_id, lot_id, sum ) VALUES (1, 2, 100);
INSERT INTO bets (user_id, lot_id, sum ) VALUES (2, 2, 100);
INSERT INTO bets (user_id, lot_id, sum ) VALUES (1, 1, 100);

//получить все категории
SELECT * FROM categories;

//получить открытые лоты. Каждый лот должен включать название, стартовую цену, ссылку на изображение, цену, название категории
SELECT
  l.name,
  l.price,
  l.url_pictures,
  c.name,
  MAX(b.sum)
FROM lots l
JOIN categories c ON c.id = l.category_id
LEFT JOIN bets b ON b.lot_id = l.id
WHERE l.end_date > NOW()
GROUP BY l.id
;

//показать лот по его ID. Получите также название категории, к которой принадлежит лот
SELECT lots.*, categories.name FROM lots
JOIN categories ON lots.category_id = categories.id
WHERE lots.id = 2
;

//обновить название лота по его идентификатору;
UPDATE lots SET name = 'Крепления Union Contact Pro 2016 года размер XXL' WHERE id = 3;

//получить список ставок для лота по его идентификатору с сортировкой по дате.
SELECT * FROM bets WHERE lot = 1 ORDER BY create_date;
