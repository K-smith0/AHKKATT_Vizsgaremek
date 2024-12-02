-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Dec 02. 08:59
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
  `Name` longtext DEFAULT NULL,
  `Currency` longtext DEFAULT NULL,
  `Continent` longtext DEFAULT NULL,
  `Alpha-code-2` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `countries`
--

INSERT INTO `countries` (`Alpha-code-3`, `Name`, `Currency`, `Continent`, `Alpha-code-2`) VALUES
('ABW', '', NULL, NULL, 'AW'),
('AFG', '', NULL, NULL, 'AF'),
('AGO', '', NULL, NULL, 'AO'),
('AIA', '', NULL, NULL, 'AI'),
('ALB', 'Republic of Albania', 'Albanian Lek (L) (ALL)', NULL, 'AL'),
('AND', 'Principality of Andorra', 'Euro (€) (EUR)', NULL, 'AD'),
('ANT', '', NULL, NULL, 'AN'),
('ARE', '', NULL, NULL, 'AE'),
('ARG', '', NULL, NULL, 'AR'),
('ARM', 'Republic of Armenia', 'Armenian Dram (֏) (AMD)', NULL, 'AM'),
('ASM', '', NULL, NULL, 'AS'),
('ATG', '', NULL, NULL, 'AG'),
('AUS', '', NULL, NULL, 'AU'),
('AUT', 'Republic of Austria', 'Euro (€) (EUR)', NULL, 'AT'),
('AZE', 'Republic of Azerbaijan', 'Azerbaijani Manat (₼) (AZN)', NULL, 'AZ'),
('BDI', '', NULL, NULL, 'BI'),
('BEL', 'Kingdom of Belgium', 'Euro (€) (EUR)', NULL, 'BE'),
('BEN', '', NULL, NULL, 'BJ'),
('BFA', '', NULL, NULL, 'BF'),
('BGD', '', NULL, NULL, 'BD'),
('BGR', 'Republic of Bulgaria', 'Bulgarian Lev (BGN)', NULL, 'BG'),
('BHR', '', NULL, NULL, 'BH'),
('BHS', '', NULL, NULL, 'BS'),
('BIH', 'Bosnia and Herzegovina', 'Convertible Mark (BAM)', NULL, 'BA'),
('BLR', 'Republic of Belarus', 'Belarusian Ruble (BYN)', NULL, 'BY'),
('BLZ', '', NULL, NULL, 'BZ'),
('BMU', '', NULL, NULL, 'BM'),
('BOL', '', NULL, NULL, 'BO'),
('BRA', '', NULL, NULL, 'BR'),
('BRB', '', NULL, NULL, 'BB'),
('BRN', '', NULL, NULL, 'BN'),
('BTN', '', NULL, NULL, 'BT'),
('BWA', '', NULL, NULL, 'BW'),
('CAF', '', NULL, NULL, 'CF'),
('CAN', '', NULL, NULL, 'CA'),
('CHE', '', NULL, NULL, 'CH'),
('CHL', '', NULL, NULL, 'CL'),
('CHN', '', NULL, NULL, 'CN'),
('CIV', '', NULL, NULL, 'CI'),
('CMR', '', NULL, NULL, 'CM'),
('COD', '', NULL, NULL, 'CD'),
('COG', '', NULL, NULL, 'CG'),
('COL', '', NULL, NULL, 'CO'),
('COM', '', NULL, NULL, 'KM'),
('CPV', '', NULL, NULL, 'CV'),
('CRI', '', NULL, NULL, 'CR'),
('CUB', '', NULL, NULL, 'CU'),
('CYP', 'Republic of Cyprus', 'Euro (€) (EUR)', NULL, 'CY'),
('CZE', 'Czech Republic', 'Czech Koruna (CZK)', NULL, 'CZ'),
('DEU', 'Federal Republic of Germany', 'Euro (€) (EUR)', NULL, 'DE'),
('DJI', '', NULL, NULL, 'DJ'),
('DMA', '', NULL, NULL, 'DM'),
('DNK', 'Kingdom of Denmark', 'Danish Krone (DKK)', NULL, 'DK'),
('DOM', '', NULL, NULL, 'DO'),
('DZA', '', NULL, NULL, 'DZ'),
('ECU', '', NULL, NULL, 'EC'),
('EGY', '', NULL, NULL, 'EG'),
('ERI', '', NULL, NULL, 'ER'),
('ESP', '', NULL, NULL, 'ES'),
('EST', 'Republic of Estonia', 'Euro (€) (EUR)', NULL, 'EE'),
('ETH', '', NULL, NULL, 'ET'),
('FIN', 'Republic of Finland', 'Euro (€) (EUR)', NULL, 'FI'),
('FJI', '', NULL, NULL, 'FJ'),
('FRA', 'French Republic', 'Euro (€) (EUR)', NULL, 'FR'),
('FRO', '', NULL, NULL, 'FO'),
('FSM', '', NULL, NULL, 'FM'),
('GAB', '', NULL, NULL, 'GA'),
('GBR', '', NULL, NULL, 'GB'),
('GEO', 'Georgia', 'Georgian Lari (₾) (GEL)', NULL, 'GE'),
('GHA', '', NULL, NULL, 'GH'),
('GLP', '', NULL, NULL, 'GP'),
('GMB', '', NULL, NULL, 'GM'),
('GNB', '', NULL, NULL, 'GW'),
('GNQ', '', NULL, NULL, 'GQ'),
('GRC', 'Hellenic Republic', 'Euro (€) (EUR)', NULL, 'GR'),
('GRD', '', NULL, NULL, 'GD'),
('GRL', '', NULL, NULL, 'GL'),
('GTM', '', NULL, NULL, 'GT'),
('GUF', '', NULL, NULL, 'GF'),
('GUM', '', NULL, NULL, 'GU'),
('HKG', '', NULL, NULL, 'HK'),
('HND', '', NULL, NULL, 'HN'),
('HRV', 'Republic of Croatia', 'Euro (€) (EUR)', NULL, 'HR'),
('HTI', '', NULL, NULL, 'HT'),
('HUN', 'Hungary', 'Hungarian Forint (HUF)', NULL, 'HU'),
('IDN', '', NULL, NULL, 'ID'),
('IND', '', NULL, NULL, 'IN'),
('IRL', 'Republic of Ireland', 'Euro (€) (EUR)', NULL, 'IE'),
('IRN', '', NULL, NULL, 'IR'),
('IRQ', '', NULL, NULL, 'IQ'),
('ISL', 'Iceland', 'Iclandic Króna (ISK)', NULL, 'IS'),
('ISR', '', NULL, NULL, 'IL'),
('ITA', 'Italian Republic', 'Euro (€) (EUR)', NULL, 'IT'),
('JOR', '', NULL, NULL, 'JO'),
('JPN', '', NULL, NULL, 'JP'),
('KAZ', 'Republic of Kazakhstan', 'Kazakh Tenge (₸) (KZT)', NULL, 'KZ'),
('KEN', '', NULL, NULL, 'KE'),
('KGZ', '', NULL, NULL, 'KG'),
('KHM', '', NULL, NULL, 'KH'),
('KIR', '', NULL, NULL, 'KI'),
('KNA', '', NULL, NULL, 'KN'),
('KOR', '', NULL, NULL, 'KR'),
('KWT', '', NULL, NULL, 'KW'),
('LAO', '', NULL, NULL, 'LA'),
('LBN', '', NULL, NULL, 'LB'),
('LBR', '', NULL, NULL, 'LR'),
('LBY', '', NULL, NULL, 'LY'),
('LCA', '', NULL, NULL, 'LC'),
('LIE', '', NULL, NULL, 'LI'),
('LKA', '', NULL, NULL, 'LK'),
('LSO', '', NULL, NULL, 'LS'),
('LTU', '', NULL, NULL, 'LT'),
('LUX', '', NULL, NULL, 'LU'),
('LVA', '', NULL, NULL, 'LV'),
('MAC', '', NULL, NULL, 'MO'),
('MAR', '', NULL, NULL, 'MA'),
('MCO', '', NULL, NULL, 'MC'),
('MDA', '', NULL, NULL, 'MD'),
('MDG', '', NULL, NULL, 'MG'),
('MDV', '', NULL, NULL, 'MV'),
('MEX', '', NULL, NULL, 'MX'),
('MHL', '', NULL, NULL, 'MH'),
('MLI', '', NULL, NULL, 'ML'),
('MLT', '', NULL, NULL, 'MT'),
('MMR', '', NULL, NULL, 'MM'),
('MNE', '', NULL, NULL, 'ME'),
('MNG', '', NULL, NULL, 'MN'),
('MNP', '', NULL, NULL, 'MP'),
('MOZ', '', NULL, NULL, 'MZ'),
('MRT', '', NULL, NULL, 'MR'),
('MSR', '', NULL, NULL, 'MS'),
('MTQ', '', NULL, NULL, 'MQ'),
('MUS', '', NULL, NULL, 'MU'),
('MWI', '', NULL, NULL, 'MW'),
('MYS', '', NULL, NULL, 'MY'),
('NAM', '', NULL, NULL, 'NA'),
('NCL', '', NULL, NULL, 'NC'),
('NER', '', NULL, NULL, 'NE'),
('NGA', '', NULL, NULL, 'NG'),
('NIC', '', NULL, NULL, 'NI'),
('NLD', '', NULL, NULL, 'NL'),
('NOR', '', NULL, NULL, 'NO'),
('NPL', '', NULL, NULL, 'NP'),
('NRU', '', NULL, NULL, 'NR'),
('NZL', '', NULL, NULL, 'NZ'),
('OMN', '', NULL, NULL, 'OM'),
('PAK', '', NULL, NULL, 'PK'),
('PAN', '', NULL, NULL, 'PA'),
('PCN', '', NULL, NULL, 'PN'),
('PER', '', NULL, NULL, 'PE'),
('PHL', '', NULL, NULL, 'PH'),
('PLW', '', NULL, NULL, 'PW'),
('PNG', '', NULL, NULL, 'PG'),
('POL', '', NULL, NULL, 'PL'),
('PRI', '', NULL, NULL, 'PR'),
('PRK', '', NULL, NULL, 'KP'),
('PRT', '', NULL, NULL, 'PT'),
('PRY', '', NULL, NULL, 'PY'),
('PSE', '', NULL, NULL, 'PS'),
('PYF', '', NULL, NULL, 'PF'),
('QAT', '', NULL, NULL, 'QA'),
('REU', '', NULL, NULL, 'RE'),
('ROU', '', NULL, NULL, 'RO'),
('RUS', '', NULL, NULL, 'RU'),
('RWA', '', NULL, NULL, 'RW'),
('SAU', '', NULL, NULL, 'SA'),
('SDN', '', NULL, NULL, 'SD'),
('SEN', '', NULL, NULL, 'SN'),
('SGP', '', NULL, NULL, 'SG'),
('SLB', '', NULL, NULL, 'SB'),
('SLE', '', NULL, NULL, 'SL'),
('SLV', '', NULL, NULL, 'SV'),
('SMR', '', NULL, NULL, 'SM'),
('SOM', '', NULL, NULL, 'SO'),
('SRB', '', NULL, NULL, 'RS'),
('STP', '', NULL, NULL, 'ST'),
('SUR', '', NULL, NULL, 'SR'),
('SVK', '', NULL, NULL, 'SK'),
('SVN', '', NULL, NULL, 'SI'),
('SWE', '', NULL, NULL, 'SE'),
('SWZ', '', NULL, NULL, 'SZ'),
('SYC', '', NULL, NULL, 'SC'),
('SYR', '', NULL, NULL, 'SY'),
('TCD', '', NULL, NULL, 'TD'),
('TGO', '', NULL, NULL, 'TG'),
('THA', '', NULL, NULL, 'TH'),
('TJK', '', NULL, NULL, 'TJ'),
('TKM', '', NULL, NULL, 'TM'),
('TLS', '', NULL, NULL, 'TL'),
('TON', '', NULL, NULL, 'TO'),
('TTO', '', NULL, NULL, 'TT'),
('TUN', '', NULL, NULL, 'TN'),
('TUR', '', NULL, NULL, 'TR'),
('TUV', '', NULL, NULL, 'TV'),
('TWN', '', NULL, NULL, 'TW'),
('TZA', '', NULL, NULL, 'TZ'),
('UGA', '', NULL, NULL, 'UG'),
('UKR', '', NULL, NULL, 'UA'),
('URY', '', NULL, NULL, 'UY'),
('USA', '', NULL, NULL, 'US'),
('UZB', '', NULL, NULL, 'UZ'),
('VAT', '', NULL, NULL, 'VA'),
('VCT', '', NULL, NULL, 'VC'),
('VEN', '', NULL, NULL, 'VE'),
('VGB', '', NULL, NULL, 'VG'),
('VIR', '', NULL, NULL, 'VI'),
('VNM', '', NULL, NULL, 'VN'),
('VUT', '', NULL, NULL, 'VU'),
('WSM', '', NULL, NULL, 'WS'),
('XKX', '', NULL, NULL, 'XK'),
('YEM', '', NULL, NULL, 'YE'),
('ZAF', '', NULL, NULL, 'ZA'),
('ZMB', '', NULL, NULL, 'ZM'),
('ZWE', '', NULL, NULL, 'ZW');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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
