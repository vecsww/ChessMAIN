-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 08 2024 г., 14:42
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `komis`
--

-- --------------------------------------------------------

--
-- Структура таблицы `handlowcy`
--

CREATE TABLE `handlowcy` (
  `login` varchar(10) DEFAULT NULL,
  `imie` varchar(15) DEFAULT NULL,
  `nazwisko` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `data_wpisu` date DEFAULT NULL,
  `autor_wpisu` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `handlowcy`
--

INSERT INTO `handlowcy` (`login`, `imie`, `nazwisko`, `email`, `data_wpisu`, `autor_wpisu`) VALUES
('ibn', 'Ilona', 'Nowosad', 'ibn@komis.eu', '2010-09-01', 'ibn'),
('ktc', 'Krzysztof', 'Czarkowski', 'ktc@komis.eu', '2010-09-02', 'ktc'),
('agam', 'Agata', 'Miastek', 'agam@komis.eu', '2014-02-07', 'agam');

-- --------------------------------------------------------

--
-- Структура таблицы `klienci`
--

CREATE TABLE `klienci` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `adres` varchar(50) DEFAULT NULL,
  `data_wpisu` date DEFAULT NULL,
  `autor_wpisu` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `klienci`
--

INSERT INTO `klienci` (`id`, `nazwa`, `adres`, `data_wpisu`, `autor_wpisu`) VALUES
(1, 'Adam Abacki', 'Warszawa', '2015-01-01', 'ktc'),
(2, 'Bawialnia sp z o.o.', 'Bydgoszcz', '2015-01-14', 'ktc'),
(3, 'CVecylia Chocholicka', 'Lubicz', '2015-02-10', 'in'),
(4, 'Daniel Dykt', 'Zielonka', '2015-02-10', 'in'),
(5, 'Epsilon', 'Warszawa', '2015-03-05', 'ktc');

-- --------------------------------------------------------

--
-- Структура таблицы `modele`
--

CREATE TABLE `modele` (
  `id` int(11) NOT NULL,
  `producent` int(11) DEFAULT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `rocznik_pocz` int(11) DEFAULT NULL,
  `rocznik_konc` int(11) DEFAULT NULL,
  `data_wpisu` date DEFAULT NULL,
  `autor_wpisu` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `operacje`
--

CREATE TABLE `operacje` (
  `id` int(11) NOT NULL,
  `rodzaj` varchar(20) DEFAULT NULL,
  `data_wpisu` date DEFAULT NULL,
  `autor_wpisu` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `operacje`
--

INSERT INTO `operacje` (`id`, `rodzaj`, `data_wpisu`, `autor_wpisu`) VALUES
(1, 'zakup', '2015-01-01', 'ibn'),
(2, 'sprzedaż', '2015-01-14', 'ktc'),
(3, 'rezerwacja', '2015-02-10', 'ibn');

-- --------------------------------------------------------

--
-- Структура таблицы `producenci`
--

CREATE TABLE `producenci` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `data_wpisu` date DEFAULT NULL,
  `autor_wpisu` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `producenci`
--

INSERT INTO `producenci` (`id`, `nazwa`, `data_wpisu`, `autor_wpisu`) VALUES
(11, 'Toyota', '2015-01-01', 'ktc'),
(12, 'Fiat', '2015-01-02', 'ktc'),
(13, 'Mitsubishi', '2015-01-03', 'ktc'),
(14, 'Renault', '2015-01-04', 'ktc'),
(15, 'Citroen', '2015-01-05', 'ktc'),
(16, 'Mazda', '2015-01-05', 'ktc'),
(17, 'Volvo', '2015-01-04', 'ktc');

-- --------------------------------------------------------

--
-- Структура таблицы `rejestry`
--

CREATE TABLE `rejestry` (
  `id` int(11) NOT NULL,
  `operacja` int(11) DEFAULT NULL,
  `klient` int(11) DEFAULT NULL,
  `samochod` int(11) DEFAULT NULL,
  `kwota` decimal(10,0) DEFAULT NULL,
  `data_wpisu` date DEFAULT NULL,
  `autor_wpisu` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `rejestry`
--

INSERT INTO `rejestry` (`id`, `operacja`, `klient`, `samochod`, `kwota`, `data_wpisu`, `autor_wpisu`) VALUES
(1, 2, 3, 1, 45000, '2015-03-01', 'ktc'),
(2, 1, 2, 2, 13000, '2015-01-14', 'ktc'),
(3, 2, 1, 3, 15000, '2015-02-10', 'ibn');

-- --------------------------------------------------------

--
-- Структура таблицы `rezerwacje`
--

CREATE TABLE `rezerwacje` (
  `id` int(11) DEFAULT NULL,
  `klient` int(11) DEFAULT NULL,
  `samochod` int(11) DEFAULT NULL,
  `data_rez` date DEFAULT NULL,
  `data_wpisu` date DEFAULT NULL,
  `autor_wpisu` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `rezerwacje`
--

INSERT INTO `rezerwacje` (`id`, `klient`, `samochod`, `data_rez`, `data_wpisu`, `autor_wpisu`) VALUES
(1, 4, 5, '2015-03-01', '2015-02-28', 'ktc'),
(2, 1, 3, '2015-02-28', '2015-02-20', 'ktc');

-- --------------------------------------------------------

--
-- Структура таблицы `samochody`
--

CREATE TABLE `samochody` (
  `id` int(11) NOT NULL,
  `model` int(11) DEFAULT NULL,
  `rocznik` int(11) DEFAULT NULL,
  `wartosc` decimal(10,0) DEFAULT NULL,
  `tablica` varchar(8) DEFAULT NULL,
  `przebieg` int(11) DEFAULT NULL,
  `silnik` varchar(2) DEFAULT NULL CHECK (`silnik` in ('B','D','BG')),
  `data_wpisu` date DEFAULT NULL,
  `autor_wpisu` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `samochody`
--

INSERT INTO `samochody` (`id`, `model`, `rocznik`, `wartosc`, `tablica`, `przebieg`, `silnik`, `data_wpisu`, `autor_wpisu`) VALUES
(1, 3, 2011, 48000, 'CTR123G', 90000, 'D', '2015-01-01', 'ktc'),
(2, 1, 2003, NULL, 'ctr987D', 290000, 'BG', '2015-01-14', 'ktc'),
(3, 1, 2007, 18000, 'Ctr6H7C', 240000, 'B', '2015-02-10', 'ibn'),
(4, NULL, 2006, 5000, 'CT09876', 310000, 'B', '2015-02-10', 'ibn'),
(5, 2, 2006, 22000, 'ct68790', 289000, 'D', '2015-03-05', 'ktc'),
(6, 1, 2010, 41000, 'By21340', 98000, 'B', '2015-02-10', 'ktc'),
(7, 2, 2000, 33000, 'by76098', 137000, 'BG', '2015-01-29', 'ktc');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `modele`
--
ALTER TABLE `modele`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `operacje`
--
ALTER TABLE `operacje`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `producenci`
--
ALTER TABLE `producenci`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rejestry`
--
ALTER TABLE `rejestry`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `samochody`
--
ALTER TABLE `samochody`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
