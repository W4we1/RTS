-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 29 Wrz 2022, 10:29
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `mydb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buildings`
--

CREATE TABLE `buildings` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `buildings`
--

INSERT INTO `buildings` (`id`, `name`) VALUES
(1, 'dół z gliną'),
(2, 'huta żelaza'),
(3, 'chata drwala');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `nick` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `players`
--

INSERT INTO `players` (`id`, `nick`, `email`, `password`) VALUES
(1, 'artor', 'artor@gmail.com', 'haslo1'),
(2, 'klpo', 'klpo@gmail.com', 'haslo2'),
(3, 'tuk', 'tuk@gmail.com', 'haslo3');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `resources`
--

CREATE TABLE `resources` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `descriptions` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `resources`
--

INSERT INTO `resources` (`id`, `name`, `descriptions`) VALUES
(1, 'drewno', 'Aby pozyskać należy sciąć drzewo'),
(2, 'glina', 'Aby pozyskać zniszcz skałe osadową'),
(3, 'żelazo', 'Aby pozyskac wykop rudę');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `troops`
--

CREATE TABLE `troops` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `descriptions` varchar(45) NOT NULL,
  `damage` int(11) NOT NULL,
  `distance_damage` int(11) NOT NULL,
  `defense` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `troops`
--

INSERT INTO `troops` (`id`, `name`, `descriptions`, `damage`, `distance_damage`, `defense`) VALUES
(1, 'łucznik', 'strzela z luku', 0, 20, 10),
(2, 'miecznik', 'operuje mieczem', 20, 0, 70),
(3, 'kusznik', 'strzela z kuszy', 0, 30, 10),
(4, 'rycerz', 'operuje mieczem i tarcza', 30, 0, 100);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `villages`
--

CREATE TABLE `villages` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `players_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `villages`
--

INSERT INTO `villages` (`id`, `name`, `x`, `y`, `players_id`) VALUES
(1, 'Paryż', 100, 100, 1),
(2, 'Berlin', 200, 200, 2),
(3, 'Madryt', 300, 300, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `villages_has_buildings`
--

CREATE TABLE `villages_has_buildings` (
  `villages_id` int(11) NOT NULL,
  `buildings_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `villages_has_buildings`
--

INSERT INTO `villages_has_buildings` (`villages_id`, `buildings_id`, `value`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(3, 2, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `villages_has_resources`
--

CREATE TABLE `villages_has_resources` (
  `villages_id` int(11) NOT NULL,
  `resources_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `villages_has_resources`
--

INSERT INTO `villages_has_resources` (`villages_id`, `resources_id`, `value`) VALUES
(1, 1, 1000),
(1, 2, 1000),
(1, 3, 1000),
(2, 1, 900),
(2, 2, 900),
(2, 3, 900),
(3, 1, 800),
(3, 2, 800),
(3, 3, 800);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `villages_has_troops`
--

CREATE TABLE `villages_has_troops` (
  `villages_id` int(11) NOT NULL,
  `troops_id` int(11) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `villages_has_troops`
--

INSERT INTO `villages_has_troops` (`villages_id`, `troops_id`, `value`) VALUES
(1, 1, 100),
(1, 2, 100),
(1, 3, 10),
(1, 4, 10),
(2, 1, 100),
(2, 2, 100),
(2, 3, 10),
(2, 4, 10),
(3, 1, 100),
(3, 2, 100),
(3, 3, 10),
(3, 4, 10);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`,`name`);

--
-- Indeksy dla tabeli `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`,`nick`,`email`,`password`);

--
-- Indeksy dla tabeli `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`,`name`,`descriptions`);

--
-- Indeksy dla tabeli `troops`
--
ALTER TABLE `troops`
  ADD PRIMARY KEY (`id`,`name`,`descriptions`,`damage`,`distance_damage`,`defense`);

--
-- Indeksy dla tabeli `villages`
--
ALTER TABLE `villages`
  ADD PRIMARY KEY (`id`,`name`,`x`,`y`,`players_id`),
  ADD KEY `fk_villages_players` (`players_id`);

--
-- Indeksy dla tabeli `villages_has_buildings`
--
ALTER TABLE `villages_has_buildings`
  ADD PRIMARY KEY (`villages_id`,`buildings_id`,`value`),
  ADD KEY `fk_villages_has_buildings_buildings1` (`buildings_id`);

--
-- Indeksy dla tabeli `villages_has_resources`
--
ALTER TABLE `villages_has_resources`
  ADD PRIMARY KEY (`villages_id`,`resources_id`,`value`),
  ADD KEY `fk_villages_has_resources_resources1` (`resources_id`);

--
-- Indeksy dla tabeli `villages_has_troops`
--
ALTER TABLE `villages_has_troops`
  ADD PRIMARY KEY (`villages_id`,`troops_id`,`value`),
  ADD KEY `fk_villages_has_troops_troops1` (`troops_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `troops`
--
ALTER TABLE `troops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `villages`
--
ALTER TABLE `villages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `villages_has_buildings`
--
ALTER TABLE `villages_has_buildings`
  MODIFY `villages_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `villages_has_resources`
--
ALTER TABLE `villages_has_resources`
  MODIFY `villages_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `villages_has_troops`
--
ALTER TABLE `villages_has_troops`
  MODIFY `villages_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `villages`
--
ALTER TABLE `villages`
  ADD CONSTRAINT `fk_villages_players` FOREIGN KEY (`players_id`) REFERENCES `players` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `villages_has_buildings`
--
ALTER TABLE `villages_has_buildings`
  ADD CONSTRAINT `fk_villages_has_buildings_buildings1` FOREIGN KEY (`buildings_id`) REFERENCES `buildings` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_villages_has_buildings_villages1` FOREIGN KEY (`villages_id`) REFERENCES `villages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `villages_has_resources`
--
ALTER TABLE `villages_has_resources`
  ADD CONSTRAINT `fk_villages_has_resources_resources1` FOREIGN KEY (`resources_id`) REFERENCES `resources` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_villages_has_resources_villages1` FOREIGN KEY (`villages_id`) REFERENCES `villages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `villages_has_troops`
--
ALTER TABLE `villages_has_troops`
  ADD CONSTRAINT `fk_villages_has_troops_troops1` FOREIGN KEY (`troops_id`) REFERENCES `troops` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_villages_has_troops_villages1` FOREIGN KEY (`villages_id`) REFERENCES `villages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
