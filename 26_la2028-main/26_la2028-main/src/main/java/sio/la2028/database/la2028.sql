-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : lun. 21 sep. 2026 à 15:39
-- Version du serveur : 11.4.9-MariaDB
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `la2028`
--

-- --------------------------------------------------------

--
-- Structure de la table `athlete`
--

DROP TABLE IF EXISTS `athlete`;
CREATE TABLE IF NOT EXISTS `athlete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `pays_id` int(11) NOT NULL,
  `sport_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ath_pays` (`pays_id`),
  KEY `fk_ath_sport` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2761 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `athlete`
--

INSERT INTO `athlete` (`id`, `nom`, `prenom`, `date_naissance`, `pays_id`, `sport_id`) VALUES
(1, 'Rinner', 'Teddy', '1989-04-07', 1, 1),
(2, 'Biles', 'Simone', '1997-03-14', 2, 2),
(10, 'Popov', 'Toma Junior', '1998-09-29', 1, 3),
(11, 'Gicquel', 'Thom', '1999-01-12', 1, 3),
(12, 'Ferrand-Prévot', 'Pauline', '1992-02-10', 1, 4),
(13, 'Koretzky', 'Victor', '1994-08-26', 1, 4),
(14, 'Wembanyama', 'Victor', '2004-01-04', 1, 5),
(15, 'Zhang', 'Beiwen', '1990-07-12', 2, 3),
(16, 'Wang', 'Iris', '1994-09-02', 2, 3),
(17, 'Faulkner', 'Kristen', '1992-12-18', 2, 4),
(18, 'Dygert', 'Chloé', '1997-01-01', 2, 4),
(19, 'James', 'LeBron', '1984-12-30', 2, 5),
(20, 'Marchand', 'Leon', '2004-05-05', 1, 6),
(27, 'Elie', 'Nathan', '2006-10-27', 1, 3),
(67, 'Ravin', 'Jules', '2001-09-11', 93, 5),
(2729, 'Manaudou', 'Florent', '1990-11-12', 1, 6),
(2730, 'Ledecky', 'Katie', '1997-03-17', 2, 6),
(2731, 'McIntosh', 'Summer', '2006-08-18', 38, 6),
(2732, 'Titmus', 'Ariarne', '2000-09-07', 14, 6),
(2733, 'Curry', 'Stephen', '1988-03-14', 2, 5),
(2734, 'Durant', 'Kevin', '1988-09-29', 2, 5),
(2735, 'Gobert', 'Rudy', '1992-06-26', 1, 5),
(2736, 'Johannès', 'Marine', '1995-01-21', 1, 5),
(2737, 'Evenepoel', 'Remco', '2000-01-25', 22, 4),
(2738, 'Van Aert', 'Wout', '1994-09-15', 22, 4),
(2739, 'Pidcock', 'Tom', '1999-07-30', 98, 4),
(2740, 'Pogačar', 'Tadej', '1998-09-21', 196, 4),
(2741, 'Vingegaard', 'Jonas', '1996-12-10', 77, 4),
(2742, 'van der Poel', 'Mathieu', '1995-01-19', 171, 4),
(2743, 'Alaphilippe', 'Julian', '1992-06-11', 1, 4),
(2744, 'Agbegnenou', 'Clarisse', '1992-10-25', 1, 1),
(2745, 'Abe', 'Hifumi', '1997-08-09', 120, 1),
(2746, 'Abe', 'Uta', '2000-07-14', 120, 1),
(2747, 'Andrade', 'Rebeca', '1999-05-08', 30, 2),
(2748, 'Boyer', 'Marine', '2000-05-22', 1, 2),
(2749, 'Melnikova', 'Angelina', '2000-07-18', 66, 2),
(2750, 'Axelsen', 'Viktor', '1994-01-04', 77, 3),
(2751, 'Antonsen', 'Anders', '1997-04-27', 77, 3),
(2752, 'An', 'Se-young', '2002-02-05', 49, 3),
(2753, 'Verstappen', 'Max', '1997-09-30', 171, 7),
(2754, 'Hamilton', 'Lewis', '1985-01-07', 98, 7),
(2755, 'Leclerc', 'Charles', '1997-10-16', 149, 7),
(2756, 'Gasly', 'Pierre', '1996-02-07', 1, 7),
(2757, 'Ocon', 'Esteban', '1996-09-17', 1, 7),
(2758, 'Mbappé', 'Kylian', '1998-12-20', 1, 8),
(2759, 'Dupont', 'Antoine', '1996-11-15', 1, 9),
(2760, 'Mayer', 'Kevin', '1992-02-10', 1, 10);

-- --------------------------------------------------------

--
-- Structure de la table `athlete_epreuve`
--

DROP TABLE IF EXISTS `athlete_epreuve`;
CREATE TABLE IF NOT EXISTS `athlete_epreuve` (
  `athlete_id` int(10) NOT NULL,
  `epreuve_id` int(10) NOT NULL,
  `place` int(10) NOT NULL,
  PRIMARY KEY (`athlete_id`),
  KEY `fk_atep_epreuve_id` (`epreuve_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `athlete_epreuve`
--

INSERT INTO `athlete_epreuve` (`athlete_id`, `epreuve_id`, `place`) VALUES
(10, 6, 1),
(20, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `epreuve`
--

DROP TABLE IF EXISTS `epreuve`;
CREATE TABLE IF NOT EXISTS `epreuve` (
  `code` int(10) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  `sport_id` int(10) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `fk_epr_sport_id` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `epreuve`
--

INSERT INTO `epreuve` (`code`, `libelle`, `sport_id`) VALUES
(1, '200m brasse', 6),
(2, '200m papillon', 6),
(3, 'Double homme', 3),
(4, 'Double dame', 3),
(5, 'Double mixte', 3),
(6, 'Simple homme', 3),
(7, 'Simple dame', 3),
(12, 'Course en ligne', 4),
(13, '200m 4 nages', 6),
(14, '400m 4 nages', 6),
(15, 'Équipe mixte', 1),
(16, 'Moins de 73 kg masculin', 1),
(17, 'Concours général individuel', 2),
(18, 'Tournoi masculin', 5),
(19, 'Tournoi féminin', 5),
(20, '50m nage libre', 6),
(21, '100m nage libre', 6),
(22, 'VTT Cross-country', 4),
(23, 'Course', 7),
(24, 'Tournoi masculin', 8),
(25, 'Tournoi masculin', 9),
(26, 'Décathlon', 10);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id`, `code`, `nom`) VALUES
(1, 'FRA', 'France'),
(2, 'USA', 'United States of America'),
(3, 'ALB', 'Albania'),
(4, 'ALG', 'Algeria'),
(5, 'GER', 'Germany'),
(6, 'AND', 'Andorra'),
(7, 'ANG', 'Angola'),
(8, 'ANT', 'Antigua and Barbuda'),
(9, 'AHO', 'Netherlands Antilles'),
(10, 'KSA', 'Saudi Arabia'),
(11, 'ARG', 'Argentina'),
(12, 'ARM', 'Armenia'),
(13, 'ARU', 'Aruba'),
(14, 'AUS', 'Australia'),
(15, 'AUT', 'Austria'),
(16, 'AZE', 'Azerbaijan'),
(17, 'BAH', 'Bahamas'),
(18, 'BRN', 'Bahrain'),
(19, 'BAN', 'Bangladesh'),
(20, 'BAR', 'Barbados'),
(21, 'BLR', 'Belarus'),
(22, 'BEL', 'Belgium'),
(23, 'BIZ', 'Belize'),
(24, 'BEN', 'Benin'),
(25, 'BER', 'Bermuda'),
(26, 'BHU', 'Bhutan'),
(27, 'BOL', 'Bolivia'),
(28, 'BIH', 'Bosnia and Herzegovina'),
(29, 'BOT', 'Botswana'),
(30, 'BRA', 'Brazil'),
(31, 'BRU', 'Brunei Darussalam'),
(32, 'BUL', 'Bulgaria'),
(33, 'BUR', 'Burkina Faso'),
(34, 'BDI', 'Burundi'),
(35, 'CAY', 'Cayman Islands'),
(36, 'CAM', 'Cambodia'),
(37, 'CMR', 'Cameroon'),
(38, 'CAN', 'Canada'),
(39, 'CPV', 'Cape Verde'),
(40, 'CAF', 'Central African Republic'),
(41, 'CHI', 'Chile'),
(42, 'CHN', 'People\'s Republic of China'),
(43, 'CYP', 'Cyprus'),
(44, 'COL', 'Colombia'),
(45, 'COM', 'Comoros'),
(46, 'CGO', 'Congo'),
(47, 'COD', 'Democratic Republic of the Congo'),
(48, 'COK', 'Cook Islands'),
(49, 'KOR', 'Republic of Korea'),
(50, 'ANZ', 'Australasia (1908-1912)'),
(51, 'BOH', 'Bohemia (TCH since 1920)'),
(52, 'HBR', 'British Honduras'),
(53, 'BWI', 'British West Indies (BAR, JAM'),
(54, 'BIR', 'Burma (until 1989)'),
(55, 'CRC', 'Costa Rica'),
(56, 'TCH', 'Czechoslovakia'),
(57, 'YMD', 'Democratic Republic of Yemen'),
(58, 'FRG', 'Federal Republic of Germany (1950-1990, &quot;GER&quot; since) '),
(59, 'GDR', 'German Democratic Republic (1955-1990, '),
(60, 'IOP', 'Independant Participant'),
(61, 'IOA', 'Independent Olympic Athlete'),
(62, 'MIX', 'Mixed NOCs'),
(63, 'ZZX', 'Mixed team'),
(64, 'ZZZ', 'Other countries'),
(65, 'RHO', 'Rhodesia (until 1968)'),
(66, 'RU1', 'Russia'),
(67, 'SER', 'Serbia - Yougoslavie YUG since'),
(68, 'SCG', 'Serbia and Montenegro'),
(69, 'EUN', 'Unified Team (ex USSR)'),
(70, 'EUA', 'United Team of Germany (1956,1960,1964)'),
(71, 'URS', 'USSR'),
(72, 'YUG', 'Yugoslavia'),
(73, 'ZAI', 'Zaire (1971-1997)'),
(74, 'CIV', 'C&#244;te d\'Ivoire'),
(75, 'CRO', 'Croatia'),
(76, 'CUB', 'Cuba'),
(77, 'DEN', 'Denmark'),
(78, 'DJI', 'Djibouti'),
(79, 'DOM', 'Dominican Republic'),
(80, 'DMA', 'Dominica'),
(81, 'EGY', 'Egypt'),
(82, 'ESA', 'El Salvador'),
(83, 'UAE', 'United Arab Emirates'),
(84, 'ECU', 'Ecuador'),
(85, 'ERI', 'Eritrea'),
(86, 'ESP', 'Spain'),
(87, 'EST', 'Estonia'),
(88, 'RSA', 'South Africa'),
(89, 'ETH', 'Ethiopia'),
(90, 'MKD', 'The Former Yugoslav Republic of Macedonia'),
(91, 'FIJ', 'Fiji'),
(92, 'FIN', 'Finland'),
(93, 'AFG', 'Afghanistan'),
(94, 'GAB', 'Gabon'),
(95, 'GAM', 'Gambia'),
(96, 'GEO', 'Georgia'),
(97, 'GHA', 'Ghana'),
(98, 'GBR', 'Great Britain'),
(99, 'GRE', 'Greece'),
(100, 'GRN', 'Grenada'),
(101, 'GUM', 'Guam'),
(102, 'GUA', 'Guatemala'),
(103, 'GUI', 'Guinea'),
(104, 'GBS', 'Guinea-Bissau'),
(105, 'GEQ', 'Equatorial Guinea'),
(106, 'GUY', 'Guyana'),
(107, 'HAI', 'Haiti'),
(108, 'HON', 'Honduras'),
(109, 'HKG', 'Hong Kong, China'),
(110, 'HUN', 'Hungary'),
(111, 'IND', 'India'),
(112, 'INA', 'Indonesia'),
(113, 'IRI', 'Islamic Republic of Iran'),
(114, 'IRQ', 'Iraq'),
(115, 'IRL', 'Ireland'),
(116, 'ISL', 'Iceland'),
(117, 'ISR', 'Israel'),
(118, 'ITA', 'Italy'),
(119, 'JAM', 'Jamaica'),
(120, 'JPN', 'Japan'),
(121, 'JOR', 'Jordan'),
(122, 'KAZ', 'Kazakhstan'),
(123, 'KEN', 'Kenya'),
(124, 'KGZ', 'Kyrgyzstan'),
(125, 'KIR', 'Kiribati'),
(126, 'KUW', 'Kuwait'),
(127, 'LAO', 'Lao People\'s Democratic Republic'),
(128, 'LES', 'Lesotho'),
(129, 'LAT', 'Latvia'),
(130, 'LIB', 'Lebanon'),
(131, 'LBR', 'Liberia'),
(132, 'LBA', 'Libya'),
(133, 'LIE', 'Liechtenstein'),
(134, 'LTU', 'Lithuania'),
(135, 'LUX', 'Luxembourg'),
(136, 'MAD', 'Madagascar'),
(137, 'MAS', 'Malaysia'),
(138, 'MAW', 'Malawi'),
(139, 'MDV', 'Maldives'),
(140, 'MLI', 'Mali'),
(141, 'MLT', 'Malta'),
(142, 'MAR', 'Morocco'),
(143, 'MHL', 'Marshall Islands'),
(144, 'MRI', 'Mauritius'),
(145, 'MTN', 'Mauritania'),
(146, 'MEX', 'Mexico'),
(147, 'FSM', 'Federated States of Micronesia'),
(148, 'MDA', 'Republic of Moldova'),
(149, 'MON', 'Monaco'),
(150, 'MGL', 'Mongolia'),
(151, 'MNE', 'Montenegro'),
(152, 'MOZ', 'Mozambique'),
(153, 'MYA', 'Myanmar (ex Burma until 1989)'),
(154, 'NAM', 'Namibia'),
(155, 'NRU', 'Nauru'),
(156, 'NEP', 'Nepal'),
(157, 'NCA', 'Nicaragua'),
(158, 'NIG', 'Niger'),
(159, 'NGR', 'Nigeria'),
(160, 'NOR', 'Norway'),
(161, 'NZL', 'New Zealand'),
(162, 'OMA', 'Oman'),
(163, 'UGA', 'Uganda'),
(164, 'UZB', 'Uzbekistan'),
(165, 'PAK', 'Pakistan'),
(166, 'PLW', 'Palau'),
(167, 'PLE', 'Palestine'),
(168, 'PAN', 'Panama'),
(169, 'PNG', 'Papua New Guinea'),
(170, 'PAR', 'Paraguay'),
(171, 'NED', 'Netherlands'),
(172, 'PER', 'Peru'),
(173, 'PHI', 'Philippines'),
(174, 'POL', 'Poland'),
(175, 'PUR', 'Puerto Rico'),
(176, 'POR', 'Portugal'),
(177, 'QAT', 'Qatar'),
(178, 'PRK', 'Democratic People\'s Republic of Korea'),
(179, 'ROU', 'Romania'),
(180, 'RUS', 'Russian Federation'),
(181, 'RWA', 'Rwanda'),
(182, 'SKN', 'Saint Kitts and Nevis'),
(183, 'LCA', 'Saint Lucia'),
(184, 'SMR', 'San Marino'),
(185, 'VIN', 'St Vincent and the Grenadines'),
(186, 'SOL', 'Solomon Islands'),
(187, 'SAM', 'Samoa (until 1996 Western Samoa)'),
(188, 'ASA', 'American Samoa'),
(189, 'STP', 'Sao Tome and Principe'),
(190, 'SEN', 'Senegal'),
(191, 'SRB', 'Serbia'),
(192, 'SEY', 'Seychelles'),
(193, 'SLE', 'Sierra Leone'),
(194, 'SIN', 'Singapore'),
(195, 'SVK', 'Slovakia'),
(196, 'SLO', 'Slovenia'),
(197, 'SOM', 'Somalia'),
(198, 'SUD', 'Sudan'),
(199, 'SRI', 'Sri Lanka'),
(200, 'SWE', 'Sweden'),
(201, 'SUI', 'Switzerland'),
(202, 'SUR', 'Suriname'),
(203, 'SWZ', 'Swaziland'),
(204, 'SYR', 'Syrian Arab Republic'),
(205, 'TJK', 'Tajikistan'),
(206, 'TPE', 'Chinese Taipei'),
(207, 'TAN', 'United Republic of Tanzania'),
(208, 'CHA', 'Chad'),
(209, 'CZE', 'Czech Republic'),
(210, 'THA', 'Thailand'),
(211, 'TLS', 'Democratic Republic of Timor-Leste'),
(212, 'TOG', 'Togo'),
(213, 'TGA', 'Tonga'),
(214, 'TTO', 'Trinidad and Tobago'),
(215, 'TUN', 'Tunisia'),
(216, 'TKM', 'Turkmenistan'),
(217, 'TUR', 'Turkey'),
(218, 'TUV', 'Tuvalu'),
(219, 'UKR', 'Ukraine'),
(220, 'URU', 'Uruguay'),
(221, 'VAN', 'Vanuatu'),
(222, 'VEN', 'Venezuela'),
(223, 'IVB', 'Virgin Islands, British'),
(224, 'ISV', 'Virgin Islands, US'),
(225, 'VIE', 'Vietnam'),
(226, 'YEM', 'Yemen'),
(227, 'ZAM', 'Zambia'),
(228, 'ZIM', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `sport_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sit_sport_id` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `site`
--

INSERT INTO `site` (`id`, `nom`, `sport_id`) VALUES
(1, 'LA Memorial Coliseum', 1),
(2, '2028 Stadium (SoFi Stadium)', 1),
(3, 'Intuit Dome', 1),
(4, 'Dodger Stadium', 1),
(5, 'Crypto.com Arena', 1),
(6, 'LA Convention Center', 1),
(7, 'Rose Bowl Stadium', 1),
(8, 'Bassin de Sepulveda', 1),
(9, 'Marine Stadium (Long Beach)', 1),
(10, 'OKC Softball Park', 5);

-- --------------------------------------------------------

--
-- Structure de la table `sports`
--

DROP TABLE IF EXISTS `sports`;
CREATE TABLE IF NOT EXISTS `sports` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sports`
--

INSERT INTO `sports` (`id`, `nom`) VALUES
(1, 'Judo'),
(2, 'Gymnastique artistique'),
(3, 'Badminton'),
(4, 'Cyclisme'),
(5, 'Basketball'),
(6, 'Natation'),
(7, 'Formule 1'),
(8, 'Football'),
(9, 'Rugby à 7'),
(10, 'Athlétisme');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `athlete`
--
ALTER TABLE `athlete`
  ADD CONSTRAINT `fk_ath_pays` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`),
  ADD CONSTRAINT `fk_ath_sport` FOREIGN KEY (`sport_id`) REFERENCES `sports` (`id`);

--
-- Contraintes pour la table `athlete_epreuve`
--
ALTER TABLE `athlete_epreuve`
  ADD CONSTRAINT `fk_atep_athlete_id` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`id`),
  ADD CONSTRAINT `fk_atep_epreuve_id` FOREIGN KEY (`epreuve_id`) REFERENCES `epreuve` (`code`);

--
-- Contraintes pour la table `epreuve`
--
ALTER TABLE `epreuve`
  ADD CONSTRAINT `fk_epr_sport_id` FOREIGN KEY (`sport_id`) REFERENCES `sports` (`id`);

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `fk_sit_sport_id` FOREIGN KEY (`sport_id`) REFERENCES `site` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
