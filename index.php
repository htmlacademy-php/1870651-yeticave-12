<?php
require_once "helpers.php";
require_once "templates/layout.php";
require_once "templates/main.php";
$is_auth = rand(0, 1);

$user_name = 'Vladimir Kreyson'; // укажите здесь ваше имя
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
    ],
    [
    'name' => 'DC Ply Mens 2016/2017 Snowboard',
    'category' => 'Доски и лыжи',
    'price' => 159999,
    'url_picture' => 'img/lot-2.jpg',
    ],
    [
    'name' => 'Крепления Union Contact Pro 2015 года размер L/XL',
    'category' => 'Крепления',
    'price' => 8000,
    'url_picture' => 'img/lot-3.jpg',
    ],
    [
    'name' => 'Ботинки для сноуборда DC Mutiny Charocal',
    'category' => 'Ботинки',
    'price' => 10999,
    'url_picture' => 'img/lot-4.jpg',
    ],
    [
    'name' => 'Куртка для сноуборда DC Mutiny Charocal',
    'category' => 'Одежда',
    'price' => 7500,
    'url_picture' => 'img/lot-5.jpg',
    ],
    [
    'name' => 'Маска Oakley Canopy',
    'category' => 'Маска',
    'price' => 5400,
    'url_picture' => 'img/lot-6.jpg',
    ],
];

function include_main('main.php', array $data_main[
    'categories' => $categories,
    'lots' => $lots,
]);

function include_layout('layout.php', array $data_layout[
    'user_name' => $user_name,
    'content' => '',
    'title' => $title,
    'categories' => $categories,
]);

