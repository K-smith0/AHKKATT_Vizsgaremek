-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Nov 28. 09:16
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

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
(13, 'Oceanic', 'PLACEHOLDER TEXT', 'PLACEHOLDER JSON'),
(14, 'Subarctic Climate', 'PLACEHOLDER TEXT', 'PLACEHOLDER JSON'),
(15, 'Tundra', 'PLACEHOLDER TEXT', 'PLACEHOLDER JSON');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `climate_connection`
--

CREATE TABLE `climate_connection` (
  `Country_ID` varchar(255) NOT NULL,
  `Climate_ID` int(11) NOT NULL
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
('BEL', 1),
('BEL', 8),
('BGR', 7),
('BIH', 4),
('BIH', 9),
('BLR', 7),
('CHE', 7),
('CYP', 9),
('CZE', 1),
('DEU', 1),
('DNK', 1),
('DNK', 8),
('ESP', 7),
('ESP', 9),
('ESP', 13),
('EST', 6),
('FIN', 7),
('FRA', 1),
('FRA', 9),
('GBR', 13),
('GEO', 1),
('GEO', 7),
('GRC', 0),
('HRV', 0),
('HRV', 5),
('HRV', 7),
('HUN', 10),
('IRL', 12),
('ISL', 11),
('ITA', 7),
('ITA', 9),
('ITA', 13),
('KAZ', 7),
('LIE', 7),
('LTU', 7),
('LUX', 7),
('LVA', 1),
('MCO', 0),
('MDA', 7),
('MLT', 9),
('MNE', 0),
('NLD', 13),
('NOR', 1),
('NOR', 14),
('POL', 7),
('PRT', 0),
('ROU', 1),
('ROU', 7),
('RUS', 7),
('RUS', 14),
('RUS', 15),
('SMR', 9),
('SRB', 7),
('SVK', 7),
('SVN', 5),
('SVN', 7),
('SVN', 9),
('SWE', 7),
('SWE', 14),
('TUR', 9),
('TUR', 13),
('UKR', 1),
('VAT', 7),
('VAT', 13),
('XKX', 7);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `countries`
--

CREATE TABLE `countries` (
  `Alpha-code-3` varchar(3) NOT NULL,
  `Name` longtext NOT NULL,
  `Currency` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `countries`
--

INSERT INTO `countries` (`Alpha-code-3`, `Name`, `Currency`) VALUES
('ALB', 'Republic of Albania', 'Albanian Lek (L) (ALL)'),
('AND', 'Principality of Andorra', 'Euro (€) (EUR)'),
('ARM', 'Republic of Armenia', 'Armenian Dram (֏) (AMD)'),
('AUT', 'Republic of Austria', 'Euro (€) (EUR)'),
('AZE', 'Republic of Azerbaijan', 'Azerbaijani Manat (₼) (AZN)'),
('BEL', 'Kingdom of Belgium', 'Euro (€) (EUR)'),
('BGR', 'Republic of Bulgaria', 'Bulgarian Lev (BGN)'),
('BIH', 'Bosnia and Herzegovina', 'Convertible Mark (BAM)'),
('BLR', 'Republic of Belarus', 'Belarusian Ruble (BYN)'),
('CHE', 'Swiss Confederation', 'Swiss Franc (CHF)'),
('CYP', 'Republic of Cyprus', 'Euro (€) (EUR)'),
('CZE', 'Czech Republic', 'Czech Koruna (CZK)'),
('DEU', 'Federal Republic of Germany', 'Euro (€) (EUR)'),
('DNK', 'Kingdom of Denmark', 'Danish Krone (DKK)'),
('ESP', 'Kingdom of Spain', 'Euro (€) (EUR)'),
('EST', 'Republic of Estonia', 'Euro (€) (EUR)'),
('FIN', 'Republic of Finland', 'Euro (€) (EUR)'),
('FRA', 'French Republic', 'Euro (€) (EUR)'),
('GBR', 'United Kingdom of Great Britain and Northern Ireland', 'Pound Sterling (£) (GBP)'),
('GEO', 'Georgia', 'Georgian Lari (₾) (GEL)'),
('GRC', 'Hellenic Republic', 'Euro (€) (EUR)'),
('HRV', 'Republic of Croatia', 'Euro (€) (EUR)'),
('HUN', 'Hungary', 'Hungarian Forint (HUF)'),
('IRL', 'Republic of Ireland', 'Euro (€) (EUR)'),
('ISL', 'Iceland', 'Iclandic Króna (ISK)'),
('ITA', 'Italian Republic', 'Euro (€) (EUR)'),
('KAZ', 'Republic of Kazakhstan', 'Kazakh Tenge (₸) (KZT)'),
('LIE', 'Principality of Liechtenstein', 'Swiss Franc (CHF)'),
('LTU', 'Republic of Lithuania', 'Euro (€) (EUR)'),
('LUX', 'Grand Duchy of Luxembourg', 'Euro (€) (EUR)'),
('LVA', 'Republic of Latvia', 'Euro (€) (EUR)'),
('MCO', 'Principality of Monaco', 'Euro (€) (EUR)'),
('MDA', 'Republic of Moldova', 'Moldovan Leu (MDL)'),
('MLT', 'Republic of Malta', 'Euro (€) (EUR)'),
('MNE', 'Montenegro', 'Euro (€) (EUR)'),
('NLD', 'Netherlands', 'Euro (€) (EUR)'),
('NOR', 'Kingdom of Norway', 'Norwegian Krone (NOK)'),
('POL', 'Republic of Poland', 'Polish Złoty (PLN)'),
('PRT', 'Portuguese Republic', 'Euro (€) (EUR)'),
('ROU', 'Romania', 'Romanian Leu (RON)'),
('RUS', 'Russian Federation', 'Russian Ruble (₽) (RUB)'),
('SMR', 'Republic of San Marino', 'Euro (€) (EUR)'),
('SRB', 'Republic of Serbia', 'Serbian Dinar (RSD)'),
('SVK', 'Slovak Republic', 'Euro (€) (EUR)'),
('SVN', 'Republic of Slovenia', 'Euro (€) (EUR)'),
('SWE', 'Kingdom of Sweden', 'Swedish Krona (SEK)'),
('TUR', 'Republic of Türkiye', 'Turkish Lira (₺) (TRY)'),
('UKR', 'Ukraine', 'Ukrainian Hryvnia (₴) (UAH)'),
('VAT', 'Vatican City (Holy See)', 'Euro (€) (EUR)'),
('XKX', 'Republic of Kosovo', 'Euro (€) (EUR)');

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
(23, 'Icelandic', 'https://en.wikipedia.org/wiki/Icelandic_language'),
(24, 'Irish', 'https://en.wikipedia.org/wiki/Irish_language'),
(25, 'English', 'https://en.wikipedia.org/wiki/English_language'),
(26, 'Italian', 'https://en.wikipedia.org/wiki/Italian_language'),
(27, 'Kazakh', 'https://en.wikipedia.org/wiki/Kazakh_language'),
(49, 'Albanian', 'PLACEHOLDER'),
(51, 'Italian', 'PLACEHOLDER'),
(52, 'Latin', 'PLACEHOLDER'),
(53, 'Ukrainian', 'https://simple.wikipedia.org/wiki/Ukrainian_language'),
(56, 'Spanish', 'https://simple.wikipedia.org/wiki/Spanish_language'),
(57, 'Slovene', 'https://simple.wikipedia.org/wiki/Slovene_language'),
(58, 'Slovak', 'https://simple.wikipedia.org/wiki/Slovak_language'),
(60, 'Romanian', 'PLACEHOLDER'),
(61, 'Portuguese', 'https://simple.wikipedia.org/wiki/Portuguese_language'),
(63, 'Polish', 'https://simple.wikipedia.org/wiki/Polish_language'),
(64, 'Norwegian', 'https://simple.wikipedia.org/wiki/Norwegian_language'),
(66, 'Montenegrin', 'https://simple.wikipedia.org/wiki/Montenegrin_language'),
(67, 'Maltese', 'https://simple.wikipedia.org/wiki/Maltese_language'),
(69, 'Luxembourgish', 'https://simple.wikipedia.org/wiki/Luxembourgish_language'),
(70, 'Lithuanian', 'https://simple.wikipedia.org/wiki/Lithuanian_language'),
(71, 'Latvian', 'https://simple.wikipedia.org/wiki/Latvian_language'),
(72, 'Albanian', 'PLACEHOLDER');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `languages_connection`
--

CREATE TABLE `languages_connection` (
  `Country_ID` varchar(3) NOT NULL,
  `Language_ID` int(11) NOT NULL
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
('BEL', 3),
('BEL', 7),
('BEL', 8),
('BGR', 12),
('BIH', 9),
('BIH', 10),
('BIH', 11),
('BLR', 5),
('BLR', 6),
('CHE', 3),
('CHE', 8),
('CHE', 51),
('CYP', 13),
('CYP', 14),
('CZE', 15),
('DEU', 3),
('DNK', 16),
('ESP', 56),
('EST', 17),
('FIN', 18),
('FIN', 19),
('FRA', 8),
('GBR', 25),
('GEO', 20),
('GRC', 21),
('HRV', 11),
('HUN', 22),
('IRL', 24),
('IRL', 25),
('ISL', 23),
('ITA', 26),
('KAZ', 6),
('KAZ', 27),
('LIE', 3),
('LTU', 70),
('LUX', 3),
('LUX', 8),
('LUX', 69),
('LVA', 71),
('MCO', 8),
('MDA', 60),
('MLT', 25),
('MLT', 67),
('MNE', 66),
('NLD', 7),
('NOR', 64),
('POL', 63),
('PRT', 61),
('ROU', 60),
('RUS', 6),
('SMR', 51),
('SRB', 10),
('SVK', 58),
('SVN', 57),
('SWE', 19),
('TUR', 14),
('UKR', 53),
('VAT', 51),
('VAT', 52),
('XKX', 0),
('XKX', 10);

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
  ADD PRIMARY KEY (`Country_ID`,`Climate_ID`),
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
  ADD PRIMARY KEY (`Country_ID`,`Language_ID`),
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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

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
