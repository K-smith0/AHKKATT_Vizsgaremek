-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Jan 13. 09:11
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
  `Description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `climates`
--

INSERT INTO `climates` (`ID`, `Name`, `Description`) VALUES
(0, 'Mediterrenean', 'PLACEHOLDER TEXT'),
(1, 'Temperate Climate', 'PLACEHOLDER TEXT'),
(2, 'Mountain Climate', 'PLACEHOLDER TEXT'),
(3, 'Highland Continental', 'PLACEHOLDER TEXT'),
(4, 'Moderately Continental', 'PLACEHOLDER TEXT'),
(5, 'Alpine', 'PLACEHOLDER TEXT'),
(6, 'Slightly Continental', 'PLACEHOLDER TEXT'),
(7, 'Continental', 'PLACEHOLDER TEXT'),
(8, 'Maritime Cliamte', 'PLACEHOLDER TEXT'),
(9, 'Subtropical Mediterranean', 'PLACEHOLDER TEXT'),
(10, 'Mild Continental', 'PLACEHOLDER TEXT'),
(11, 'Subpolar Oceanic', 'PLACEHOLDER TEXT'),
(12, 'Temperate Oceanic', 'PLACEHOLDER TEXT'),
(13, 'Oceanic', 'PLACEHOLDER TEXT'),
(14, 'Subarctic Climate', 'PLACEHOLDER TEXT'),
(15, 'Tundra', 'PLACEHOLDER TEXT');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `climate_connection`
--

CREATE TABLE `climate_connection` (
  `Country_ID` varchar(3) NOT NULL,
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
  `Continent` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `countries`
--

INSERT INTO `countries` (`Alpha-code-3`, `Name`, `Currency`, `Alpha-code-2`, `Continent`) VALUES
('ABW', 'Country of Aruba', 'Aruban florin (ƒ) (AWG)', 'AW', 'South America'),
('AFG', 'Islamic Republic of Afghanistan', 'Afghani (افغانی) (AFN)', 'AF', 'Asia'),
('AGO', 'Republic of Angola', 'Angolan kwanza (AOA)', 'AO', 'Africa'),
('AIA', 'Anguilla', 'Eastern Caribbean dollar (XCD)', 'AI', 'North America'),
('ALA', 'Aland Islands', NULL, 'AX', 'Europe'),
('ALB', 'Republic of Albania', 'Albanian Lek (L) (ALL)', 'AL', 'Europe'),
('AND', 'Principality of Andorra', 'Euro (€) (EUR)', 'AD', 'Europe'),
('ANT', 'Netherlands Antilles', 'Netherlands Antillean guilder', 'AN', 'North America'),
('ARE', 'United Arab Emirates', 'UAE dirham (AED)', 'AE', 'Asia'),
('ARG', 'Argentine Republic', 'Argentine peso ($) (ARS)', 'AR', 'South America'),
('ARM', 'Republic of Armenia', 'Armenian Dram (֏) (AMD)', 'AM', 'Europe'),
('ASM', 'American Samoa', 'United States dollar (US$) (USD)', 'AS', 'North America'),
('ATF', 'French Southern and Antarctic Lands', NULL, 'TF', 'Africa'),
('ATG', 'Antigua and Barbuda', 'East Caribbean dollar (XCD)', 'AG', 'North America'),
('AUS', 'Commonwealth of Australia', 'Australian dollar ($) (AUD)', 'AU', 'Oceania'),
('AUT', 'Republic of Austria', 'Euro (€) (EUR)', 'AT', 'Europe'),
('AZE', 'Republic of Azerbaijan', 'Azerbaijani Manat (₼) (AZN)', 'AZ', 'Europe'),
('BDI', 'Republic of Burundi', 'Burundian Franc (FBu) (BIF)', 'BI', 'Africa'),
('BEL', 'Kingdom of Belgium', 'Euro (€) (EUR)', 'BE', 'Europe'),
('BEN', 'Republic of Benin', 'West African CFA Franc (XOF)', 'BJ', 'Africa'),
('BES', 'Bonaire, Saint Eustachius and Saba', NULL, 'BQ', 'North America'),
('BFA', 'Burkina Faso', 'West African CFA Franc (XOF)', 'BF', 'Africa'),
('BGD', 'People\'s Republic of Bangladesh', 'Taka (৳) (BDT)', 'BD', 'Asia'),
('BGR', 'Republic of Bulgaria', 'Bulgarian Lev (BGN)', 'BG', 'Europe'),
('BHR', 'Kingdom of Bahrain', 'Bahraini Dinar (BHD)', 'BH', 'Asia'),
('BHS', 'Commonwealth of The Bahamas', 'Bahamian dollar (BSD) & United States dollar (USD)', 'BS', 'North America'),
('BIH', 'Bosnia and Herzegovina', 'Convertible Mark (BAM)', 'BA', 'Europe'),
('BLM', 'Saint Barthelemy', NULL, 'BL', NULL),
('BLR', 'Republic of Belarus', 'Belarusian Ruble (BYN)', 'BY', 'Europe'),
('BLZ', 'Belize', 'Belize dollar ($) (BZD)', 'BZ', 'North America'),
('BMU', 'Bermuda', 'Bermudian dollar (BMD)', 'BM', 'North America'),
('BOL', 'Plurinational State of Bolivia', 'Boliviano (BOB)', 'BO', 'South America'),
('BRA', 'Federative Republic of Brazil', 'Real (R$) (BRL)', 'BR', 'South America'),
('BRB', 'Barabados', 'Barbadian dollar ($) (BBD)', 'BB', 'North America'),
('BRN', 'Brunei Darussalam', 'Brunei dollar (BND)', 'BN', 'Asia'),
('BTN', 'Kingdom of Bhutan', 'Ngultrum (BTN)', 'BT', 'Asia'),
('BVT', 'Bouvet Island', NULL, 'BV', NULL),
('BWA', 'Republic of Botswana', 'Pula (BWP)', 'BW', 'Africa'),
('CAF', 'Central African Republic', 'Central African CFA Franc (XAF)', 'CF', 'Africa'),
('CAN', 'Canada', 'Canadian dollar ($) (CAD)', 'CA', 'North America'),
('CCK', 'Cocos (Keeling) Islands', NULL, 'CC', NULL),
('CHE', 'Swiss Confederation', 'Swiss Franc (CHF)', 'CH', 'Europe'),
('CHL', 'Republic of Chile', 'Chilean peso (CLP)', 'CL', 'South America'),
('CHN', 'People\'s Republic of China', 'Renminbi (元/¥) (CNY)', 'CN', 'Asia'),
('CIV', 'Republic of Côte d\'Ivoire', 'West African CFA Franc (XOF)', 'CI', 'Africa'),
('CMR', 'Republic of Cameroon', 'West African CFA Franc (XOF)', 'CM', 'Africa'),
('COD', 'Democratic Republic of the Congo', 'Congolese Franc (CDF)', 'CD', 'Africa'),
('COG', 'Republic of the Congo', 'Central African CFA Franc (XAF)', 'CG', 'Africa'),
('COK', 'Cook Islands', NULL, 'CK', NULL),
('COL', 'Republic of Colombia', 'Colombian peso (COP)', 'CO', 'South America'),
('COM', 'Union of the Comoros', 'Comorian Franc (KMF)', 'KM', 'Africa'),
('CPV', 'Republic of Cabo Verde', 'Cape Verdean Escudo (CVE)', 'CV', 'Africa'),
('CRI', 'Republic of Costa Rica', 'Costa Rican Colón (CRC)', 'CR', 'North America'),
('CUB', 'Republic of Cuba', 'Cuan Pso (CUP)', 'CU', 'North America'),
('CUW', 'Curaçao', NULL, 'CW', NULL),
('CXR', 'Christmas Island', NULL, 'CX', NULL),
('CYM', 'Cayman Islands', NULL, 'KY', NULL),
('CYP', 'Republic of Cyprus', 'Euro (€) (EUR)', 'CY', 'Europe'),
('CZE', 'Czech Republic', 'Czech Koruna (CZK)', 'CZ', 'Europe'),
('DEU', 'Federal Republic of Germany', 'Euro (€) (EUR)', 'DE', 'Europe'),
('DJI', 'Republic of Djibouti', 'Djiboutian Franc (DJF)', 'DJ', 'Africa'),
('DMA', 'Commonwealth of Dominica', 'East Caribbean Dollar (XCD)', 'DM', 'North America'),
('DNK', 'Kingdom of Denmark', 'Danish Krone (DKK)', 'DK', 'Europe'),
('DOM', 'Dominican Republic', 'Dominican Peso (DOP)', 'DO', 'North America'),
('DZA', 'People\'s Democratic Republic of Algeria', '	Algerian Diar (DZD)', 'DZ', 'Africa'),
('ECU', 'Republic of Ecuador', 'United States Dollar (USD)', 'EC', 'South America'),
('EGY', 'Arab Republic of Egypt', 'Egyptian pound (LE/E£/£E) (EGP)', 'EG', 'Africa'),
('ERI', 'State of Eritrea', 'Nakfa (ERN)', 'ER', 'Africa'),
('ESP', 'Kingdom of Spain', 'Euro (€) (EUR)', 'ES', 'Europe'),
('EST', 'Republic of Estonia', 'Euro (€) (EUR)', 'EE', 'Europe'),
('ETH', 'Federal Democratic Republic of Ethiopia', 'Birr (ETB)', 'ET', 'Africa'),
('FIN', 'Republic of Finland', 'Euro (€) (EUR)', 'FI', 'Europe'),
('FJI', 'Republic of Fiji', 'Fijian Dollar (FJD)', 'FJ', 'Oceania'),
('FLK', 'Falkland Islands', NULL, 'FK', 'South America'),
('FRA', 'French Republic', 'Euro (€) (EUR)', 'FR', 'Europe'),
('FRO', 'Faeroe Islands', 'Faroese Króna & Danish Krone (DKK)', 'FO', 'Europe'),
('FSM', 'Federated States of Micronesia', 'United States Dollar (USD)', 'FM', 'Oceania'),
('GAB', 'Gabonese Republic', 'Central African CFA Franc (XAF)', 'GA', 'Africa'),
('GBR', 'United Kingdom of Great Britain and Northern Ireland', 'Pound Sterling (£) (GBP)', 'GB', 'Europe'),
('GEO', 'Georgia', 'Georgian Lari (₾) (GEL)', 'GE', 'Europe'),
('GGY', 'Guernsey', NULL, 'GG', NULL),
('GHA', 'Republic of Ghana', 'Cedi (GHS)', 'GH', 'Africa'),
('GIN', 'Republic of Guinea', 'Guinean Franc (GNF)', 'GN', 'Africa'),
('GLP', 'Guadeloupe', 'Euro (€) (EUR)', 'GP', 'North America'),
('GMB', 'Republic of The Gambia', 'Gambian Dalasi (GMD)', 'GM', 'Africa'),
('GNB', 'Republic of Guinea-Bissau', 'West African CFA Franc (XOF)', 'GW', 'Africa'),
('GNQ', 'Republic of Equatorial Guinea', 'Central African CFA Franc (XAF)', 'GQ', 'Africa'),
('GRC', 'Hellenic Republic', 'Euro (€) (EUR)', 'GR', 'Europe'),
('GRD', 'Grenada', 'East Caribbean Dollar (XCD)', 'GD', 'North America'),
('GRL', 'Greenland', 'Danish Krone (DKK)', 'GL', 'Europe'),
('GTM', 'Republic of Guatemala', 'Quetzal (GTQ)', 'GT', 'North America'),
('GUF', 'French Guiana', 'Euro (€) (EUR)', 'GF', 'South America'),
('GUM', 'Guam', 'United States Dollar ($) (USD)', 'GU', 'Oceania'),
('GUY', 'Co-operative Republic of Guyana', 'Guyanese Dollar (GYD)', 'GY', 'South America'),
('HKG', 'Hong Kong Special Administrative Region of the People\'s Republic of China', 'Hong Kong Dollar (HK$) (HKD)', 'HK', 'Asia'),
('HMD', 'Heard Island and McDonald Islands', NULL, 'HM', NULL),
('HND', 'Republic of Honduras', 'Lempira (HNL)', 'HN', 'North America'),
('HRV', 'Republic of Croatia', 'Euro (€) (EUR)', 'HR', 'Europe'),
('HTI', 'Republic of Haiti', 'Gourde (G) (HTG)', 'HT', 'North America'),
('HUN', 'Hungary', 'Hungarian Forint (HUF)', 'HU', 'Europe'),
('IDN', 'Republic of Indonesia', 'Indonesian Rupiah (Rp) (IDR)', 'ID', 'Asia'),
('IMN', 'Isle of Man', NULL, 'IM', NULL),
('IND', 'Republic of India', 'Indian Rupee (₹) (INR)', 'IN', 'Asia'),
('IOT', 'British Indian Ocean Territory', NULL, 'IO', 'Asia'),
('IRL', 'Republic of Ireland', 'Euro (€) (EUR)', 'IE', 'Europe'),
('IRN', 'Islamic Republic of Iran', 'Iranian Rial (ریال) (IRR)', 'IR', 'Asia'),
('IRQ', 'Republic of Iraq', 'Iraqi Dinar (IQD)', 'IQ', 'Asia'),
('ISL', 'Iceland', 'Iclandic Króna (ISK)', 'IS', 'Europe'),
('ISR', 'State of Israel', 'New Shekel (₪) (ILS)', 'IL', 'Asia'),
('ITA', 'Italian Republic', 'Euro (€) (EUR)', 'IT', 'Europe'),
('JAM', 'Jamaica', 'Jamaican Dollar (JMD)', 'JM', 'North America'),
('JEY', 'Jersey', NULL, 'JE', 'Europe'),
('JOR', 'Hashemite Kingdom of Jordan', 'Jordanian Dinar (JOD)', 'JO', 'Asia'),
('JPN', 'Japan', 'Japanese Yen (¥)', 'JP', 'Asia'),
('KAZ', 'Republic of Kazakhstan', 'Kazakh Tenge (₸) (KZT)', 'KZ', 'Asia'),
('KEN', 'Republic of Kenya', 'Kenyan Shilling (KES)', 'KE', 'Africa'),
('KGZ', 'Kyrgyz Republic', 'Kyrgyzstani Som (c) (KGS)', 'KG', 'Asia'),
('KHM', 'Kingdom of Cambodia', 'Riel (៛) (KHR)', 'KH', 'Asia'),
('KIR', 'Republic of Kiribati', 'Australian Dollar ($) (AUD)', 'KI', 'Oceania'),
('KNA', 'Federation of Saint Christopher and Nevis', 'East Caribbean dollar (EC$) (XCD)', 'KN', 'North America'),
('KOR', 'Republic of Korea', 'Korean Republic Won (₩) (KRW)', 'KR', 'Asia'),
('KWT', 'State of Kuwait', 'Kuwaiti Dinar', 'KW', 'Asia'),
('LAO', 'Lao People\'s Democratic Republic', 'Kip (₭) (LAK)', 'LA', 'Asia'),
('LBN', 'Republic of Lebanon', 'Lebanese Pound (LBP)', 'LB', 'Asia'),
('LBR', 'Republic of Liberia', 'Liberian Dollar (LRD)', 'LR', 'Africa'),
('LBY', 'State of Libya', 'Libyan Dinar (LYD)', 'LY', 'Africa'),
('LCA', 'Saint Lucia', 'East Caribbean Dollar (XCD)', 'LC', 'North America'),
('LIE', 'Principality of Liechtenstein', 'Swiss Franc (CHF)', 'LI', 'Europe'),
('LKA', 'Democratic Socialist Republic of Sri Lanka', 'Sri Lankan Rupee (Rs) (LKR)', 'LK', 'Asia'),
('LSO', 'Kingdom of Lesotho', 'Lesotho Loti (LSL) & South African Rand (ZAR)', 'LS', 'Africa'),
('LTU', 'Republic of Lithuania', 'Euro (€) (EUR)', 'LT', 'Europe'),
('LUX', 'Grand Duchy of Luxembourg', 'Euro (€) (EUR)', 'LU', 'Europe'),
('LVA', 'Republic of Latvia', 'Euro (€) (EUR)', 'LV', 'Europe'),
('MAC', 'Macao Special Administrative Region of the People\'s Republic of China', 'Macanese Pataca (MOP)', 'MO', 'Asia'),
('MAF', 'Saint Martin', NULL, 'MF', NULL),
('MAR', 'Kingdom of Morocco', 'Moroccan Dirham (MAD)', 'MA', 'Africa'),
('MCO', 'Principality of Monaco', 'Euro (€) (EUR)', 'MC', 'Europe'),
('MDA', 'Republic of Moldova', 'Moldovan Leu (MDL)', 'MD', 'Europe'),
('MDG', 'Republic of Madagascar', 'Ariary (MGA)', 'MG', 'Africa'),
('MDV', 'Republic of Maldives', 'Maldivian Rufiyaa (MVR)', 'MV', 'Asia'),
('MEX', 'United Mexican States', 'Mexican Peso (MXN)', 'MX', 'North America'),
('MHL', 'Republic of the Marshall Islands', 'United States Dollar ($) (USD)', 'MH', 'Oceania'),
('MKD', 'Republic of North Macedonia', 'Macedonian denar (MKD)', 'MK', 'Europe'),
('MLI', 'Republic of Mali', 'West African CFA Franc (XOF)', 'ML', 'Africa'),
('MLT', 'Republic of Malta', 'Euro (€) (EUR)', 'MT', 'Europe'),
('MMR', 'Republic of the Union of Myanmar', 'Kyat (K) (MMK)', 'MM', 'Asia'),
('MNE', 'Montenegro', 'Euro (€) (EUR)', 'ME', 'Europe'),
('MNG', 'Mongolia', 'Tögrög (MNT)', 'MN', 'Asia'),
('MNP', 'Commonwealth of the Northern Mariana Islands', 'United States Dollar ($) (USD)', 'MP', 'Oceania'),
('MOZ', 'Republic of Mozambique', 'Metical (MZN)', 'MZ', 'Africa'),
('MRT', 'Islamic Republic of Mauritania', 'Ouguiya (MRU)', 'MR', 'Africa'),
('MSR', 'Montserrat', 'East Caribbean Dollar (XCD)', 'MS', 'North America'),
('MTQ', 'Martinique', 'Euro (€) (EUR)', 'MQ', 'North America'),
('MUS', 'Republic of Mauritius', 'Mauritian Rupee (MUR)', 'MU', 'Africa'),
('MWI', 'Republic of Malawi', 'Malawian Kwacha (D) (MWK)', 'MW', 'Africa'),
('MYS', 'Malaysia', 'Malaysian Ringgit (RM) (MYR)', 'MY', 'Asia'),
('MYT', 'Mayotte', NULL, 'YT', NULL),
('NAM', 'Republic of Namibia', 'Namibian dollar (NAD) & South African rand (ZAR)', 'NA', 'Africa'),
('NCL', 'New Caledonia', 'CFP Franc (₣) (XPF)', 'NC', 'Oceania'),
('NER', 'Republic of the Niger', 'West African CFA Franc (XOF)', 'NE', 'Africa'),
('NFK', 'Norfolk Island', NULL, 'NF', NULL),
('NGA', 'Federal Republic of Nigeria', 'Naira (₦) (NGN)', 'NG', 'Africa'),
('NIC', 'Republic of Nicaragua', 'Córdoba (NIO)', 'NI', 'North America'),
('NIU', 'Niue', NULL, 'NU', NULL),
('NLD', 'Netherlands', 'Euro (€) (EUR)', 'NL', 'Europe'),
('NOR', 'Kingdom of Norway', 'Norwegian Krone (NOK)', 'NO', 'Europe'),
('NPL', 'Federal Democratic Republic of Nepal', 'Nepalese rupee (Rs, रू) (NPR)', 'NP', 'Asia'),
('NRU', 'Republic of Nauru', 'Australian dollar (AUD)', 'NR', 'Oceania'),
('NZL', 'New Zealand', 'New Zealand Dollar ($) (NZD)', 'NZ', 'Oceania'),
('OMN', 'Sultanate of Oman', 'Omani Rial (OMR)', 'OM', 'Asia'),
('PAK', 'Islamic Republic of Pakistan', 'Pakistani Rupee (₨) (PKR)', 'PK', 'Asia'),
('PAN', '', NULL, 'PA', NULL),
('PCN', '', NULL, 'PN', NULL),
('PER', '', NULL, 'PE', NULL),
('PHL', '', NULL, 'PH', NULL),
('PLW', '', NULL, 'PW', NULL),
('PNG', '', NULL, 'PG', NULL),
('SPM', 'Saint Pierre and Miquelon', NULL, 'PM', 'North America'),
('POL', 'Republic of Poland', 'Polish Złoty (PLN)', 'PL', 'Europe'),
('PRI', '', NULL, 'PR', NULL),
('PRK', '', NULL, 'KP', NULL),
('PRT', 'Portuguese Republic', 'Euro (€) (EUR)', 'PT', 'Europe'),
('PRY', '', NULL, 'PY', NULL),
('PSE', '', NULL, 'PS', NULL),
('PYF', '', NULL, 'PF', NULL),
('QAT', '', NULL, 'QA', NULL),
('REU', '', NULL, 'RE', NULL),
('ROU', 'Romania', 'Romanian Leu (RON)', 'RO', 'Europe'),
('RUS', 'Russian Federation', 'Russian Ruble (₽) (RUB)', 'RU', 'Europe'),
('RWA', '', NULL, 'RW', NULL),
('SAU', '', NULL, 'SA', NULL),
('SDN', '', NULL, 'SD', NULL),
('SEN', '', NULL, 'SN', NULL),
('SGP', '', NULL, 'SG', NULL),
('SGS', 'South Georgia and South Sandwich Islands', NULL, 'GS', NULL),
('SHN', 'Saint Helena', NULL, 'SH', NULL),
('SJM', 'Svalbard and Jan Mayen', NULL, 'SJ', 'Europe'),
('SLB', '', NULL, 'SB', NULL),
('SLE', '', NULL, 'SL', NULL),
('SLV', '', NULL, 'SV', NULL),
('SMR', 'Republic of San Marino', 'Euro (€) (EUR)', 'SM', 'Europe'),
('SOM', '', NULL, 'SO', NULL),
('SRB', 'Republic of Serbia', 'Serbian Dinar (RSD)', 'RS', 'Europe'),
('SSD', 'Republic of South Sudan', NULL, 'SS', NULL),
('STP', '', NULL, 'ST', NULL),
('SUR', '', NULL, 'SR', NULL),
('SVK', 'Slovak Republic', 'Euro (€) (EUR)', 'SK', 'Europe'),
('SVN', 'Republic of Slovenia', 'Euro (€) (EUR)', 'SI', 'Europe'),
('SWE', 'Kingdom of Sweden', 'Swedish Krona (SEK)', 'SE', 'Europe'),
('SWZ', '', NULL, 'SZ', NULL),
('SXM', 'Saint Maarten', NULL, 'SX', NULL),
('SYC', '', NULL, 'SC', NULL),
('SYR', '', NULL, 'SY', NULL),
('TCA', 'Turks and Caicos Islands', NULL, 'TC', NULL),
('TCD', '', NULL, 'TD', NULL),
('TGO', '', NULL, 'TG', NULL),
('THA', '', NULL, 'TH', NULL),
('TJK', '', NULL, 'TJ', NULL),
('TKL', 'Tokelau', NULL, 'TK', NULL),
('TKM', '', NULL, 'TM', NULL),
('TLS', '', NULL, 'TL', NULL),
('TON', '', NULL, 'TO', NULL),
('TTO', '', NULL, 'TT', NULL),
('TUN', '', NULL, 'TN', NULL),
('TUR', 'Republic of Türkiye', 'Turkish Lira (₺) (TRY)', 'TR', 'Europe'),
('TUV', '', NULL, 'TV', NULL),
('TWN', '', NULL, 'TW', NULL),
('TZA', '', NULL, 'TZ', NULL),
('UGA', '', NULL, 'UG', NULL),
('UKR', 'Ukraine', 'Ukrainian Hryvnia (₴) (UAH)', 'UA', 'Europe'),
('URY', '', NULL, 'UY', NULL),
('USA', '', NULL, 'US', NULL),
('UZB', '', NULL, 'UZ', NULL),
('VAT', 'Vatican City (Holy See)', 'Euro (€) (EUR)', 'VA', 'Europe'),
('VCT', '', NULL, 'VC', NULL),
('VEN', '', NULL, 'VE', NULL),
('VGB', '', NULL, 'VG', NULL),
('VIR', '', NULL, 'VI', NULL),
('VNM', '', NULL, 'VN', NULL),
('VUT', '', NULL, 'VU', NULL),
('WLF', 'Wallis and Futuna', NULL, 'WF', NULL),
('WSM', '', NULL, 'WS', NULL),
('XKX', 'Republic of Kosovo', 'Euro (€) (EUR)', 'XK', 'Europe'),
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
(28, 'Papiamento', 'https://en.wikipedia.org/wiki/Papiamento'),
(29, 'Dari', 'https://en.wikipedia.org/wiki/Dari'),
(30, 'Pashto', 'https://en.wikipedia.org/wiki/Pashto'),
(31, 'Arabic', 'https://en.wikipedia.org/wiki/Modern_Standard_Arabic'),
(32, 'Samoan', 'https://en.wikipedia.org/wiki/Samoan_language'),
(33, 'Kirundi', 'https://en.wikipedia.org/wiki/Kirundi'),
(34, 'Swahili', 'https://en.wikipedia.org/wiki/Swahili_language'),
(35, 'Mooré', 'https://en.wikipedia.org/wiki/Moor%C3%A9'),
(36, 'Bissa', 'https://en.wikipedia.org/wiki/Bissa_language'),
(37, 'Dyula', 'https://en.wikipedia.org/wiki/Dyula_language'),
(38, 'Fulani', 'https://en.wikipedia.org/wiki/Fula_language'),
(39, 'Bengali', 'https://en.wikipedia.org/wiki/Bengali_language'),
(40, 'Quechuan', 'https://en.wikipedia.org/wiki/Quechuan_languages'),
(41, 'Aymara', 'https://en.wikipedia.org/wiki/Aymara_language'),
(42, 'Guarani', 'https://en.wikipedia.org/wiki/Guarani_language'),
(43, 'Malay', 'https://en.wikipedia.org/wiki/Malay_language'),
(44, 'Dzongkha', 'https://en.wikipedia.org/wiki/Dzongkha'),
(45, 'Sango', 'https://en.wikipedia.org/wiki/Sango_language'),
(46, 'Romansh', 'https://en.wikipedia.org/wiki/Romansh_language'),
(47, 'Standard Chinese', 'https://en.wikipedia.org/wiki/Standard_Chinese'),
(48, 'Comorian', 'https://en.wikipedia.org/wiki/Comorian_languages'),
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
(72, 'Berber', 'https://en.wikipedia.org/wiki/Standard_Algerian_Berber'),
(73, 'None', ''),
(74, 'Amharic', 'https://en.wikipedia.org/wiki/Amharic'),
(75, 'Afar', 'https://en.wikipedia.org/wiki/Afar_language'),
(76, 'Oromo', 'https://en.wikipedia.org/wiki/Oromo_language'),
(77, 'Somali', 'https://en.wikipedia.org/wiki/Somali_language'),
(78, 'Tigrinya', 'https://en.wikipedia.org/wiki/Tigrinya_language'),
(79, 'Faroese', 'https://en.wikipedia.org/wiki/Faroese_language'),
(80, 'Greenlandic', 'https://en.wikipedia.org/wiki/Greenlandic_language'),
(81, 'Chamorro', 'https://en.wikipedia.org/wiki/Chamorro_language'),
(82, 'Haitian Creole', 'https://en.wikipedia.org/wiki/Haitian_Creole'),
(83, 'Indonesian', 'https://en.wikipedia.org/wiki/Indonesian_language'),
(84, 'Hindi', 'https://en.wikipedia.org/wiki/Hindi'),
(85, 'Persian', 'https://en.wikipedia.org/wiki/Persian_language'),
(86, 'Kurdish', 'https://en.wikipedia.org/wiki/Kurdish_language'),
(87, 'Icelandic', 'https://en.wikipedia.org/wiki/Icelandic_language'),
(88, 'Hebrew', 'https://en.wikipedia.org/wiki/Modern_Hebrew'),
(89, 'Japanese', 'https://en.wikipedia.org/wiki/Japanese_language'),
(90, 'Kyrgyz', 'https://en.wikipedia.org/wiki/Kyrgyz_language'),
(91, 'Khmer', 'https://en.wikipedia.org/wiki/Khmer_language'),
(92, 'Gilbertese', 'https://en.wikipedia.org/wiki/Gilbertese_language'),
(93, 'Korean', 'https://en.wikipedia.org/wiki/South_Korea'),
(94, 'Lao', 'https://en.wikipedia.org/wiki/Lao_language'),
(95, 'Sinhala', 'https://en.wikipedia.org/wiki/Sinhala_language'),
(96, 'Tamil', 'https://en.wikipedia.org/wiki/Tamil_language'),
(97, 'Sesotho', 'https://en.wikipedia.org/wiki/Sotho_language'),
(98, 'Lithuanian', 'https://en.wikipedia.org/wiki/Lithuanian_language'),
(99, 'Luxembourgish', 'https://en.wikipedia.org/wiki/Luxembourgish'),
(100, 'Latvian', 'https://en.wikipedia.org/wiki/Latvian_language'),
(101, 'Tamazight', 'https://en.wikipedia.org/wiki/Standard_Moroccan_Amazigh');

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
('Gatya', '$2y$10$Y/zhH2.wGhNNQyB.M7MF1.bId8OK2.LcTVQRB4Iwwm9htvWgNgAv2'),
('John smidth0', '$2y$10$q3/rxsbgsDj2lA.Vh3hVWON8eGv/vKhEyWz4b1/W1hwdejeM8adse'),
('test user', '$2y$10$5jHVhQDj6TXNb3NDbw9oYu6vR3p0jJCo9OWnxkb5BoSJbxxvSG4NC'),
('test user2', '$2y$10$guLbKkPsNawHwzoMVEtwFeAzsng/EYjKxiTgeuwrzfkQoXieuUpHK');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `visits`
--

CREATE TABLE `visits` (
  `Country_ID` varchar(3) NOT NULL,
  `User_Name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `visits`
--

INSERT INTO `visits` (`Country_ID`, `User_Name`) VALUES
('CHN', 'test user'),
('KAZ', 'test user'),
('MNG', 'test user'),
('RUS', 'test user');

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
  ADD PRIMARY KEY (`Country_ID`,`User_Name`),
  ADD KEY `Country_ID` (`Country_ID`),
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
  ADD CONSTRAINT `visits_ibfk_2` FOREIGN KEY (`Country_ID`) REFERENCES `countries` (`Alpha-code-3`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
