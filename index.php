<?php
require_once "helpers.php";
$isAuth = rand(0, 1);
$title = 'YetiCave';
$userName = 'Vladimir Kreyson';

//Передаём в функцию текущую дату и дату конца продажи. Возвращает оставшееся время.
function EndOfTime(string $dateEnd)
{
    $today = time();
    $endTime = strtotime($dateEnd);
    $howManyTimeToEndStamp = ($endTime - $today);
    $howManyTimeToEnd = array();
    $howManyTimeToEnd['hours'] = floor($howManyTimeToEndStamp / 3600);
    $howManyTimeToEndStamp = $howManyTimeToEndStamp % 3600;
    $howManyTimeToEnd['minutes'] = floor($howManyTimeToEndStamp / 60);

    return ($howManyTimeToEnd);
}

$categories = [
    'Доски и лыжи',
    'Крепления',
    'Ботинки',
    'Одежда',
    'Инструменты',
    'Разное',
];
$lots = [
    [
    'name' => '2014 Rossignol District Snowboard',
    'category' => 'Доски и лыжи',
    'price' => 10999,
    'url_picture' => 'img/lot-1.jpg',
    'dateOfEnd' => '2021-11-18',
    ],
    [
    'name' => 'DC Ply Mens 2016/2017 Snowboard',
    'category' => 'Доски и лыжи',
    'price' => 159999,
    'url_picture' => 'img/lot-2.jpg',
    'dateOfEnd' => '2021-11-28',
    ],
    [
    'name' => 'Крепления Union Contact Pro 2015 года размер L/XL',
    'category' => 'Крепления',
    'price' => 8000,
    'url_picture' => 'img/lot-3.jpg',
    'dateOfEnd' => '2021-12-11',
    ],
    [
    'name' => 'Ботинки для сноуборда DC Mutiny Charocal',
    'category' => 'Ботинки',
    'price' => 10999,
    'url_picture' => 'img/lot-4.jpg',
    'dateOfEnd' => '2021-12-16',
    ],
    [
    'name' => 'Куртка для сноуборда DC Mutiny Charocal',
    'category' => 'Одежда',
    'price' => 7500,
    'url_picture' => 'img/lot-5.jpg',
    'dateOfEnd' => '2021-12-01',
    ],
    [
    'name' => 'Маска Oakley Canopy',
    'category' => 'Разное',
    'price' => 5400,
    'url_picture' => 'img/lot-6.jpg',
    'dateOfEnd' => '2021-11-12'
    ],
];

$content=include_template("main.php", [
    'categories' => $categories,
    'lots' => $lots,
]);

echo include_template('layout.php', [
    'isAuth' => $isAuth,
    'userName' => $userName,
    'content' => $content,
    'title' => $title,
    'categories' => $categories,
]);

