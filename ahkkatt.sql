-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Dec 04. 10:29
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
  `Currency` longtext DEFAULT NULL,
  `Alpha-code-2` varchar(2) DEFAULT NULL,
  `Continent` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `countries`
--

INSERT INTO `countries` (`Alpha-code-3`, `Name`, `Currency`, `Alpha-code-2`, `Continent`) VALUES
('ABW', '', NULL, 'AW', NULL),
('AFG', '', NULL, 'AF', NULL),
('AGO', '', NULL, 'AO', NULL),
('AIA', '', NULL, 'AI', NULL),
('ALB', 'Republic of Albania', 'Albanian Lek (L) (ALL)', 'AL', NULL),
('AND', 'Principality of Andorra', 'Euro (€) (EUR)', 'AD', NULL),
('ANT', '', NULL, 'AN', NULL),
('ARE', '', NULL, 'AE', NULL),
('ARG', '', NULL, 'AR', NULL),
('ARM', 'Republic of Armenia', 'Armenian Dram (֏) (AMD)', 'AM', NULL),
('ASM', '', NULL, 'AS', NULL),
('ATG', '', NULL, 'AG', NULL),
('AUS', '', NULL, 'AU', NULL),
('AUT', 'Republic of Austria', 'Euro (€) (EUR)', 'AT', NULL),
('AZE', 'Republic of Azerbaijan', 'Azerbaijani Manat (₼) (AZN)', 'AZ', NULL),
('BDI', '', NULL, 'BI', NULL),
('BEL', 'Kingdom of Belgium', 'Euro (€) (EUR)', 'BE', NULL),
('BEN', '', NULL, 'BJ', NULL),
('BFA', '', NULL, 'BF', NULL),
('BGD', '', NULL, 'BD', NULL),
('BGR', 'Republic of Bulgaria', 'Bulgarian Lev (BGN)', 'BG', NULL),
('BHR', '', NULL, 'BH', NULL),
('BHS', '', NULL, 'BS', NULL),
('BIH', 'Bosnia and Herzegovina', 'Convertible Mark (BAM)', 'BA', NULL),
('BLR', 'Republic of Belarus', 'Belarusian Ruble (BYN)', 'BY', NULL),
('BLZ', '', NULL, 'BZ', NULL),
('BMU', '', NULL, 'BM', NULL),
('BOL', '', NULL, 'BO', NULL),
('BRA', '', NULL, 'BR', NULL),
('BRB', '', NULL, 'BB', NULL),
('BRN', '', NULL, 'BN', NULL),
('BTN', '', NULL, 'BT', NULL),
('BWA', '', NULL, 'BW', NULL),
('CAF', '', NULL, 'CF', NULL),
('CAN', '', NULL, 'CA', NULL),
('CHE', 'Swiss Confederation', 'Swiss Franc (CHF)', 'CH', NULL),
('CHL', '', NULL, 'CL', NULL),
('CHN', '', NULL, 'CN', NULL),
('CIV', '', NULL, 'CI', NULL),
('CMR', '', NULL, 'CM', NULL),
('COD', '', NULL, 'CD', NULL),
('COG', '', NULL, 'CG', NULL),
('COL', '', NULL, 'CO', NULL),
('COM', '', NULL, 'KM', NULL),
('CPV', '', NULL, 'CV', NULL),
('CRI', '', NULL, 'CR', NULL),
('CUB', '', NULL, 'CU', NULL),
('CYP', 'Republic of Cyprus', 'Euro (€) (EUR)', 'CY', NULL),
('CZE', 'Czech Republic', 'Czech Koruna (CZK)', 'CZ', NULL),
('DEU', 'Federal Republic of Germany', 'Euro (€) (EUR)', 'DE', NULL),
('DJI', '', NULL, 'DJ', NULL),
('DMA', '', NULL, 'DM', NULL),
('DNK', 'Kingdom of Denmark', 'Danish Krone (DKK)', 'DK', NULL),
('DOM', '', NULL, 'DO', NULL),
('DZA', '', NULL, 'DZ', NULL),
('ECU', '', NULL, 'EC', NULL),
('EGY', '', NULL, 'EG', NULL),
('ERI', '', NULL, 'ER', NULL),
('ESP', 'Kingdom of Spain', 'Euro (€) (EUR)', 'ES', NULL),
('EST', 'Republic of Estonia', 'Euro (€) (EUR)', 'EE', NULL),
('ETH', '', NULL, 'ET', NULL),
('FIN', 'Republic of Finland', 'Euro (€) (EUR)', 'FI', NULL),
('FJI', '', NULL, 'FJ', NULL),
('FRA', 'French Republic', 'Euro (€) (EUR)', 'FR', NULL),
('FRO', '', NULL, 'FO', NULL),
('FSM', '', NULL, 'FM', NULL),
('GAB', '', NULL, 'GA', NULL),
('GBR', 'United Kingdom of Great Britain and Northern Ireland', 'Pound Sterling (£) (GBP)', 'GB', NULL),
('GEO', 'Georgia', 'Georgian Lari (₾) (GEL)', 'GE', NULL),
('GHA', '', NULL, 'GH', NULL),
('GLP', '', NULL, 'GP', NULL),
('GMB', '', NULL, 'GM', NULL),
('GNB', '', NULL, 'GW', NULL),
('GNQ', '', NULL, 'GQ', NULL),
('GRC', 'Hellenic Republic', 'Euro (€) (EUR)', 'GR', NULL),
('GRD', '', NULL, 'GD', NULL),
('GRL', '', NULL, 'GL', NULL),
('GTM', '', NULL, 'GT', NULL),
('GUF', '', NULL, 'GF', NULL),
('GUM', '', NULL, 'GU', NULL),
('HKG', '', NULL, 'HK', NULL),
('HND', '', NULL, 'HN', NULL),
('HRV', 'Republic of Croatia', 'Euro (€) (EUR)', 'HR', NULL),
('HTI', '', NULL, 'HT', NULL),
('HUN', 'Hungary', 'Hungarian Forint (HUF)', 'HU', NULL),
('IDN', '', NULL, 'ID', NULL),
('IND', '', NULL, 'IN', NULL),
('IRL', 'Republic of Ireland', 'Euro (€) (EUR)', 'IE', NULL),
('IRN', '', NULL, 'IR', NULL),
('IRQ', '', NULL, 'IQ', NULL),
('ISL', 'Iceland', 'Iclandic Króna (ISK)', 'IS', NULL),
('ISR', '', NULL, 'IL', NULL),
('ITA', 'Italian Republic', 'Euro (€) (EUR)', 'IT', NULL),
('JOR', '', NULL, 'JO', NULL),
('JPN', '', NULL, 'JP', NULL),
('KAZ', 'Republic of Kazakhstan', 'Kazakh Tenge (₸) (KZT)', 'KZ', NULL),
('KEN', '', NULL, 'KE', NULL),
('KGZ', '', NULL, 'KG', NULL),
('KHM', '', NULL, 'KH', NULL),
('KIR', '', NULL, 'KI', NULL),
('KNA', '', NULL, 'KN', NULL),
('KOR', '', NULL, 'KR', NULL),
('KWT', '', NULL, 'KW', NULL),
('LAO', '', NULL, 'LA', NULL),
('LBN', '', NULL, 'LB', NULL),
('LBR', '', NULL, 'LR', NULL),
('LBY', '', NULL, 'LY', NULL),
('LCA', '', NULL, 'LC', NULL),
('LIE', 'Principality of Liechtenstein', 'Swiss Franc (CHF)', 'LI', NULL),
('LKA', '', NULL, 'LK', NULL),
('LSO', '', NULL, 'LS', NULL),
('LTU', 'Republic of Lithuania', 'Euro (€) (EUR)', 'LT', NULL),
('LUX', 'Grand Duchy of Luxembourg', 'Euro (€) (EUR)', 'LU', NULL),
('LVA', 'Republic of Latvia', 'Euro (€) (EUR)', 'LV', NULL),
('MAC', '', NULL, 'MO', NULL),
('MAR', '', NULL, 'MA', NULL),
('MCO', 'Principality of Monaco', 'Euro (€) (EUR)', 'MC', NULL),
('MDA', 'Republic of Moldova', 'Moldovan Leu (MDL)', 'MD', NULL),
('MDG', '', NULL, 'MG', NULL),
('MDV', '', NULL, 'MV', NULL),
('MEX', '', NULL, 'MX', NULL),
('MHL', '', NULL, 'MH', NULL),
('MLI', '', NULL, 'ML', NULL),
('MLT', 'Republic of Malta', 'Euro (€) (EUR)', 'MT', NULL),
('MMR', '', NULL, 'MM', NULL),
('MNE', 'Montenegro', 'Euro (€) (EUR)', 'ME', NULL),
('MNG', '', NULL, 'MN', NULL),
('MNP', '', NULL, 'MP', NULL),
('MOZ', '', NULL, 'MZ', NULL),
('MRT', '', NULL, 'MR', NULL),
('MSR', '', NULL, 'MS', NULL),
('MTQ', '', NULL, 'MQ', NULL),
('MUS', '', NULL, 'MU', NULL),
('MWI', '', NULL, 'MW', NULL),
('MYS', '', NULL, 'MY', NULL),
('NAM', '', NULL, 'NA', NULL),
('NCL', '', NULL, 'NC', NULL),
('NER', '', NULL, 'NE', NULL),
('NGA', '', NULL, 'NG', NULL),
('NIC', '', NULL, 'NI', NULL),
('NLD', 'Netherlands', 'Euro (€) (EUR)', 'NL', NULL),
('NOR', 'Kingdom of Norway', 'Norwegian Krone (NOK)', 'NO', NULL),
('NPL', '', NULL, 'NP', NULL),
('NRU', '', NULL, 'NR', NULL),
('NZL', '', NULL, 'NZ', NULL),
('OMN', '', NULL, 'OM', NULL),
('PAK', '', NULL, 'PK', NULL),
('PAN', '', NULL, 'PA', NULL),
('PCN', '', NULL, 'PN', NULL),
('PER', '', NULL, 'PE', NULL),
('PHL', '', NULL, 'PH', NULL),
('PLW', '', NULL, 'PW', NULL),
('PNG', '', NULL, 'PG', NULL),
('POL', 'Republic of Poland', 'Polish Złoty (PLN)', 'PL', NULL),
('PRI', '', NULL, 'PR', NULL),
('PRK', '', NULL, 'KP', NULL),
('PRT', 'Portuguese Republic', 'Euro (€) (EUR)', 'PT', NULL),
('PRY', '', NULL, 'PY', NULL),
('PSE', '', NULL, 'PS', NULL),
('PYF', '', NULL, 'PF', NULL),
('QAT', '', NULL, 'QA', NULL),
('REU', '', NULL, 'RE', NULL),
('ROU', 'Romania', 'Romanian Leu (RON)', 'RO', NULL),
('RUS', 'Russian Federation', 'Russian Ruble (₽) (RUB)', 'RU', NULL),
('RWA', '', NULL, 'RW', NULL),
('SAU', '', NULL, 'SA', NULL),
('SDN', '', NULL, 'SD', NULL),
('SEN', '', NULL, 'SN', NULL),
('SGP', '', NULL, 'SG', NULL),
('SLB', '', NULL, 'SB', NULL),
('SLE', '', NULL, 'SL', NULL),
('SLV', '', NULL, 'SV', NULL),
('SMR', 'Republic of San Marino', 'Euro (€) (EUR)', 'SM', NULL),
('SOM', '', NULL, 'SO', NULL),
('SRB', 'Republic of Serbia', 'Serbian Dinar (RSD)', 'RS', NULL),
('STP', '', NULL, 'ST', NULL),
('SUR', '', NULL, 'SR', NULL),
('SVK', 'Slovak Republic', 'Euro (€) (EUR)', 'SK', NULL),
('SVN', 'Republic of Slovenia', 'Euro (€) (EUR)', 'SI', NULL),
('SWE', 'Kingdom of Sweden', 'Swedish Krona (SEK)', 'SE', NULL),
('SWZ', '', NULL, 'SZ', NULL),
('SYC', '', NULL, 'SC', NULL),
('SYR', '', NULL, 'SY', NULL),
('TCD', '', NULL, 'TD', NULL),
('TGO', '', NULL, 'TG', NULL),
('THA', '', NULL, 'TH', NULL),
('TJK', '', NULL, 'TJ', NULL),
('TKM', '', NULL, 'TM', NULL),
('TLS', '', NULL, 'TL', NULL),
('TON', '', NULL, 'TO', NULL),
('TTO', '', NULL, 'TT', NULL),
('TUN', '', NULL, 'TN', NULL),
('TUR', 'Republic of Türkiye', 'Turkish Lira (₺) (TRY)', 'TR', NULL),
('TUV', '', NULL, 'TV', NULL),
('TWN', '', NULL, 'TW', NULL),
('TZA', '', NULL, 'TZ', NULL),
('UGA', '', NULL, 'UG', NULL),
('UKR', 'Ukraine', 'Ukrainian Hryvnia (₴) (UAH)', 'UA', NULL),
('URY', '', NULL, 'UY', NULL),
('USA', '', NULL, 'US', NULL),
('UZB', '', NULL, 'UZ', NULL),
('VAT', 'Vatican City (Holy See)', 'Euro (€) (EUR)', 'VA', NULL),
('VCT', '', NULL, 'VC', NULL),
('VEN', '', NULL, 'VE', NULL),
('VGB', '', NULL, 'VG', NULL),
('VIR', '', NULL, 'VI', NULL),
('VNM', '', NULL, 'VN', NULL),
('VUT', '', NULL, 'VU', NULL),
('WSM', '', NULL, 'WS', NULL),
('XKX', 'Republic of Kosovo', 'Euro (€) (EUR)', 'XK', NULL),
('YEM', '', NULL, 'YE', NULL),
('ZAF', '', NULL, 'ZA', NULL),
('ZMB', '', NULL, 'ZM', NULL),
('ZWE', '', NULL, 'ZW', NULL);

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
-- A tábla adatainak kiíratása `visits`
--

INSERT INTO `visits` (`Country_code`, `Images_path`, `User_Name`) VALUES
('RUS', '', 'test user');

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
  ADD PRIMARY KEY (`Country_code`,`User_Name`),
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
