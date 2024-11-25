-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Nov 25. 10:34
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `ahkkatt`
--
CREATE DATABASE IF NOT EXISTS `ahkkatt` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ahkkatt`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `climates`
--

CREATE TABLE `climates` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` longtext NOT NULL,
  `Discussion_json_path` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `climates`
--

INSERT INTO `climates` (`ID`, `Name`, `Description`, `Discussion_json_path`) VALUES
(0, 'Mediterrenean', 'PLACEHOLDER TEXT', 'PLACEHOLDER JSON'),
(1, 'Temperate Climate', 'PLACEHOLDER TEXT', 'PLACEHOLDER JSON'),
(2, 'Mountain Climate', 'PLACEHOLDER TEXT', 'PLACEHOLDER JSON'),
(3, 'Highland Continental', 'PLACEHOLDER TEXT', 'PLACEHOLDER JSON'),
(4, 'Moderately Continental', 'PLACEHOLDER TEXT', 'PLACEHOLDER JSON'),
(5, 'Alpine', 'PLACEHOLDER TEXT', 'PLACEHOLDER JSON'),
(6, 'Slightly Continental', 'PLACEHOLDER TEXT', 'PLACEHOLDER JSON'),
(7, 'Continental', 'PLACEHOLDER TEXT', 'PLACEHOLDER JSON'),
(8, 'Maritime Cliamte', 'PLACEHOLDER TEXT', 'PLACEHOLDER JSON'),
(9, 'Subtropical Mediterranian', 'PLACEHOLDER TEXT', 'PLACEHOLDER JSON'),
(10, 'Mild Continental', 'PLACEHOLDER TEXT', 'PLACEHOLDER JSON'),
(11, 'Subpolar Oceanic', 'PLACEHOLDER TEXT', 'PLACEHOLDER JSON'),
(12, 'Temperate Oceanic', 'PLACEHOLDER TEXT', 'PLACEHOLDER JSON'),
(13, 'Oceanic', 'PLACEHOLDER TEXT', 'PLACEHOLDER JSON');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `climate_connection`
--

CREATE TABLE `climate_connection` (
  `Country_ID` varchar(255) DEFAULT NULL,
  `Climate_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `climate_connection`
--

INSERT INTO `climate_connection` (`Country_ID`, `Climate_ID`) VALUES
('ALB', 0),
('AND', 1),
('AND', 2),
('ARM', 3),
('AUT', 4),
('AUT', 5),
('AZE', 6),
('BLR', 7),
('BEL', 1),
('BEL', 8),
('BIH', 4),
('BIH', 9),
('BGR', 7),
('HRV', 0),
('HRV', 7),
('HRV', 5),
('CYP', 9),
('CZE', 1),
('DNK', 8),
('DNK', 1),
('EST', 6),
('FIN', 7),
('FRA', 1),
('FRA', 9),
('GEO', 1),
('GEO', 7),
('DEU', 1),
('GRC', 0),
('HUN', 10),
('ISL', 11),
('IRL', 12),
('ITA', 9),
('ITA', 7),
('ITA', 13),
('KAZ', 7);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `countries`
--

CREATE TABLE `countries` (
  `Alpha-code-3` varchar(3) NOT NULL,
  `Name` longtext NOT NULL,
  `Official_Language` longtext DEFAULT NULL,
  `Currency` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `countries`
--

INSERT INTO `countries` (`Alpha-code-3`, `Name`, `Official_Language`, `Currency`) VALUES
('ALB', 'Republic of Albania', NULL, 'Albanian Lek (L) (ALL)'),
('AND', 'Principality of Andorra', NULL, 'Euro (€) (EUR)'),
('ARM', 'Republic of Armenia', NULL, 'Armenian Dram (֏) (AMD)'),
('AUT', 'Republic of Austria', NULL, 'Euro (€) (EUR)'),
('AZE', 'Republic of Azerbaijan', NULL, 'Azerbaijani Manat (₼) (AZN)'),
('BEL', 'Kingdom of Belgium', NULL, 'Euro (€) (EUR)'),
('BGR', 'Republic of Bulgaria', NULL, 'Bulgarian Lev (BGN)'),
('BIH', 'Bosnia and Herzegovina', NULL, 'Convertible Mark (BAM)'),
('BLR', 'Republic of Belarus', NULL, 'Belarusian Ruble (BYN)'),
('CYP', 'Republic of Cyprus', NULL, 'Euro (€) (EUR)'),
('CZE', 'Czech Republic', NULL, 'Czech Koruna (CZK)'),
('DEU', 'Federal Republic of Germany', NULL, 'Euro (€) (EUR)'),
('DNK', 'Kingdom of Denmark', NULL, 'Danish Krone (DKK)'),
('EST', 'Republic of Estonia', NULL, 'Euro (€) (EUR)'),
('FIN', 'Republic of Finland', NULL, 'Euro (€) (EUR)'),
('FRA', 'French Republic', NULL, 'Euro (€) (EUR)'),
('GEO', 'Georgia', NULL, 'Georgian Lari (₾) (GEL)'),
('GRC', 'Hellenic Republic', NULL, 'Euro (€) (EUR)'),
('HRV', 'Republic of Croatia', NULL, 'Euro (€) (EUR)'),
('HUN', 'Hungary', NULL, 'Hungarian Forint (HUF)'),
('IRL', 'Republic of Ireland', NULL, 'Euro (€) (EUR)'),
('ISL', 'Iceland', NULL, 'Iclandic Króna (ISK)'),
('ITA', 'Italian Republic', NULL, 'Euro (€) (EUR)'),
('KAZ', 'Republic of Kazakhstan', NULL, 'Kazakh Tenge (₸) (KZT)');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `languages`
--

CREATE TABLE `languages` (
  `ID` int(11) NOT NULL,
  `Name` longtext DEFAULT NULL,
  `Wikipedia` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `languages`
--

INSERT INTO `languages` (`ID`, `Name`, `Wikipedia`) VALUES
(0, 'Albanian', 'PLACEHOLDER'),
(1, 'Catalan', 'PLACEHOLDER'),
(2, 'Armenian', 'PLACEHOLDER'),
(3, 'German', 'https://en.wikipedia.org/wiki/German_language'),
(4, 'Azerbaijani', 'PLACEHOLDER'),
(5, 'Belarusian', 'PLACEHOLDER'),
(6, 'Russian', 'PLACEHOLDER'),
(7, 'Dutch', 'PLACEHOLDER'),
(8, 'French', 'PLACEHOLDER'),
(9, 'Bosnian', 'PLACEHOLDER'),
(10, 'Serbian', 'PLACEHOLDER'),
(11, 'Croatian', 'PLACEHOLDER'),
(12, 'Bulgarian', 'PLACEHOLDER'),
(13, 'Greek', 'PLACEHOLDER'),
(14, 'Turkish', 'PLACEHOLDER'),
(15, 'Czech', 'PLACEHOLDER'),
(16, 'Danish', 'PLACEHOLDER'),
(17, 'Estonian', 'https://en.wikipedia.org/wiki/Estonian_language'),
(18, 'Finnish', 'https://en.wikipedia.org/wiki/Finnish_language'),
(19, 'Swedish', 'https://en.wikipedia.org/wiki/Swedish_language'),
(20, 'Georgian', 'https://en.wikipedia.org/wiki/Georgian_language'),
(21, 'Greek', 'https://en.wikipedia.org/wiki/Greek_language'),
(22, 'Hungarian', 'https://en.wikipedia.org/wiki/Hungarian_language'),
(23, 'Icelandic', 'https://en.wikipedia.org/wiki/Icelandic_language');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `languages_connection`
--

CREATE TABLE `languages_connection` (
  `Country_ID` varchar(3) DEFAULT NULL,
  `Language_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `languages_connection`
--

INSERT INTO `languages_connection` (`Country_ID`, `Language_ID`) VALUES
('ALB', 0),
('AND', 1),
('ARM', 2),
('AUT', 3),
('AZE', 4),
('BLR', 5),
('BLR', 6),
('BEL', 7),
('BEL', 8),
('BEL', 3),
('BIH', 9),
('BIH', 10),
('BIH', 11),
('BGR', 12),
('HRV', 11),
('CYP', 13),
('CYP', 14),
('CZE', 15),
('DNK', 16),
('EST', 17),
('FIN', 18),
('FIN', 19),
('FRA', 8),
('GEO', 20),
('DEU', 3),
('GRC', 21),
('HUN', 22),
('ISL', 23);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `Name` varchar(45) NOT NULL,
  `Password_Hash` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`Name`, `Password_Hash`) VALUES
('Frederic', '$2y$10$DTvuWO23wfKGNA9jy/f8FuMNttgf5jTOPuJOJ5VlAsbZyEEtLMP9.'),
('John smidth0', '$2y$10$q3/rxsbgsDj2lA.Vh3hVWON8eGv/vKhEyWz4b1/W1hwdejeM8adse'),
('test user', '$2y$10$fy2Km4nSTdLhS1vQCMoa3e9Ln2Pw8GOtuUcxaQDNqD.Rx6rjX1kV.'),
('test user2', '$2y$10$guLbKkPsNawHwzoMVEtwFeAzsng/EYjKxiTgeuwrzfkQoXieuUpHK');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `visits`
--

CREATE TABLE `visits` (
  `Country_code` varchar(3) NOT NULL,
  `Images_path` longtext NOT NULL,
  `User_Name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `climates`
--
ALTER TABLE `climates`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `climate_connection`
--
ALTER TABLE `climate_connection`
  ADD KEY `connection_counrty_id1` (`Country_ID`),
  ADD KEY `connection_climate_id1` (`Climate_ID`);

--
-- A tábla indexei `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`Alpha-code-3`);

--
-- A tábla indexei `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `languages_connection`
--
ALTER TABLE `languages_connection`
  ADD KEY `languages_language_id1` (`Language_ID`),
  ADD KEY `languages_country_id1` (`Country_ID`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Name`);

--
-- A tábla indexei `visits`
--
ALTER TABLE `visits`
  ADD KEY `Country_code` (`Country_code`),
  ADD KEY `visits` (`User_Name`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `languages`
--
ALTER TABLE `languages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `climate_connection`
--
ALTER TABLE `climate_connection`
  ADD CONSTRAINT `connection_climate_id1` FOREIGN KEY (`Climate_ID`) REFERENCES `climates` (`ID`),
  ADD CONSTRAINT `connection_counrty_id1` FOREIGN KEY (`Country_ID`) REFERENCES `countries` (`Alpha-code-3`);

--
-- Megkötések a táblához `languages_connection`
--
ALTER TABLE `languages_connection`
  ADD CONSTRAINT `languages_country_id1` FOREIGN KEY (`Country_ID`) REFERENCES `countries` (`Alpha-code-3`),
  ADD CONSTRAINT `languages_language_id1` FOREIGN KEY (`Language_ID`) REFERENCES `languages` (`ID`);

--
-- Megkötések a táblához `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits` FOREIGN KEY (`User_Name`) REFERENCES `users` (`Name`),
  ADD CONSTRAINT `visits_ibfk_2` FOREIGN KEY (`Country_code`) REFERENCES `countries` (`Alpha-code-3`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
