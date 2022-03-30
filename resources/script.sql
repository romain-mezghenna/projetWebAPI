-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 30 mars 2022 à 19:40
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projetWeb`
--

-- --------------------------------------------------------

--
-- Structure de la table `Astres`
--

CREATE TABLE `Astres` (
  `idAstre` int(8) NOT NULL,
  `nomAstre` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(1000) NOT NULL COMMENT 'nom du fichier en local'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Astres`
--

INSERT INTO `Astres` (`idAstre`, `nomAstre`, `description`, `image`) VALUES
(1, 'Mercure', 'Mercure est la planète la plus proche du Soleil et la moins massive du Système solaire. Mercure est une planète tellurique, comme le sont également Vénus, la Terre et Mars. Elle est près de trois fois plus petite et presque vingt fois moins massive que la Terre mais presque aussi dense qu\'elle.', 'https://images-assets.nasa.gov/image/PIA14250/PIA14250~orig.jpg'),
(3, 'Venus', 'Vénus est la deuxième planète du Système solaire par ordre d\'éloignement au Soleil, et la sixième plus grosse aussi bien par la masse que le diamètre. Elle doit son nom à la déesse romaine de l\'amour.', 'https://images-assets.nasa.gov/image/PIA00111/PIA00111~orig.jpg'),
(4, 'La Terre', 'La Terre est la troisième planète par ordre d\'éloignement au Soleil et la cinquième plus grande du Système solaire aussi bien par la masse que le diamètre. Par ailleurs, elle est le seul objet céleste connu pour abriter la vie. Elle orbite autour du Soleil en 365,256 jours solaires', 'https://images-assets.nasa.gov/image/PIA00122/PIA00122~orig.jpg'),
(5, 'Mars', 'Mars est la quatrième planète du Système solaire par ordre croissant de la distance au Soleil et la deuxième par ordre croissant de la taille et de la masse. C’est une planète tellurique, comme le sont Mercure, Vénus et la Terre, environ dix fois moins massive que la Terre mais dix fois plus massive que la Lune.', 'https://images-assets.nasa.gov/image/PIA07893/PIA07893~orig.jpg'),
(6, 'Jupiter', 'Jupiter est la cinquième planète du Système solaire par ordre d\'éloignement au Soleil, et la plus grande par la taille et la masse devant Saturne, qui est comme elle une planète géante gazeuse. Elle est même plus volumineuse que toutes les autres planètes réunies avec son rayon moyen de 69 911 km, qui vaut environ onze fois celui de la Terre, et sa masse de 1,898 2 × 1027 kg, qui est 318 fois plus grande.', 'https://images-assets.nasa.gov/image/hubble-captures-vivid-auroras-in-jupiters-atmosphere_28000029525_o/hubble-captures-vivid-auroras-in-jupiters-atmosphere_28000029525_o~orig.jpg'),
(7, 'Saturne', 'Saturne est la sixième planète du Système solaire par ordre d\'éloignement au Soleil, et la deuxième plus grande par la taille et la masse après Jupiter, qui est comme elle une planète géante gazeuse. Son rayon moyen de 58 232 km est environ neuf fois et demi celui de la Terre et sa masse de 568,46 × 1024 kg est 95 fois plus grande.', 'https://images-assets.nasa.gov/image/PIA02225/PIA02225~orig.jpg'),
(8, 'Uranus', 'Uranus est la septième planète du Système solaire par ordre d\'éloignement au Soleil. Elle orbite autour de celui-ci à une distance d\'environ 19,2 unités astronomiques (2,87 milliards de kilomètres), avec une période de révolution de 84,05 années terrestres. Il s\'agit de la quatrième planète la plus massive du Système solaire et de la troisième plus grande par la taille.', 'https://images-assets.nasa.gov/image/PIA18182/PIA18182~orig.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `Companies`
--

CREATE TABLE `Companies` (
  `idCompanie` int(8) NOT NULL,
  `nomCompanie` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Companies`
--

INSERT INTO `Companies` (`idCompanie`, `nomCompanie`) VALUES
(1, 'SpaceX'),
(3, 'Blue Origin');

-- --------------------------------------------------------

--
-- Structure de la table `Lanceurs`
--

CREATE TABLE `Lanceurs` (
  `idLanceur` int(8) NOT NULL,
  `nomLanceur` varchar(30) NOT NULL,
  `idCompanie` int(8) NOT NULL,
  `image` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Lanceurs`
--

INSERT INTO `Lanceurs` (`idLanceur`, `nomLanceur`, `idCompanie`, `image`) VALUES
(1, 'Falcon 9', 1, 'https://www.esa.int/var/esa/storage/images/esa_multimedia/images/2020/11/copernicus_sentinel-6_lifts_off_on_a_spacex_falcon_9_rocket/22340698-1-eng-GB/Copernicus_Sentinel-6_lifts_off_on_a_SpaceX_Falcon_9_rocket_pillars.jpg'),
(3, 'Falcon Heavy', 1, 'https://upload.wikimedia.org/wikipedia/commons/2/2b/Falcon_Heavy_cropped.jpg'),
(4, 'New Glenn 2-Stage', 3, 'https://space.skyrocket.de/img_lau/new-glenn_2stg__3.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `PasDeTir`
--

CREATE TABLE `PasDeTir` (
  `idPas` int(8) NOT NULL,
  `nomPas` varchar(30) NOT NULL,
  `idVille` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `PasDeTir`
--

INSERT INTO `PasDeTir` (`idPas`, `nomPas`, `idVille`) VALUES
(1, 'Vostotchny', 6),
(2, 'Kourou', 2);

-- --------------------------------------------------------

--
-- Structure de la table `Pays`
--

CREATE TABLE `Pays` (
  `idPays` int(8) NOT NULL,
  `nomPays` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Pays`
--

INSERT INTO `Pays` (`idPays`, `nomPays`) VALUES
(1, 'France'),
(2, 'Andorra'),
(3, 'United Arab Emirates'),
(4, 'Afghanistan'),
(5, 'Antigua and Barbuda'),
(6, 'Anguilla'),
(7, 'Albania'),
(8, 'Armenia'),
(9, 'Netherlands Antilles'),
(10, 'Angola'),
(11, 'Antarctica'),
(12, 'Argentina'),
(13, 'American Samoa'),
(14, 'Austria'),
(15, 'Australia'),
(16, 'Aruba'),
(17, 'Azerbaijan'),
(18, 'Bosnia and Herzegovina'),
(19, 'Barbados'),
(20, 'Bangladesh'),
(21, 'Belgium'),
(22, 'Burkina Faso'),
(23, 'Bulgaria'),
(24, 'Bahrain'),
(25, 'Burundi'),
(26, 'Benin'),
(27, 'Bermuda'),
(28, 'Brunei'),
(29, 'Bolivia'),
(30, 'Brazil'),
(31, 'Bahamas'),
(32, 'Bhutan'),
(33, 'Bouvet Island'),
(34, 'Botswana'),
(35, 'Belarus'),
(36, 'Belize'),
(37, 'Canada'),
(38, 'Cocos [Keeling] Islands'),
(39, 'Congo [DRC]'),
(40, 'Central African Republic'),
(41, 'Congo [Republic]'),
(42, 'Switzerland'),
(43, 'Côte d\'Ivoire'),
(44, 'Cook Islands'),
(45, 'Chile'),
(46, 'Cameroon'),
(47, 'China'),
(48, 'Colombia'),
(49, 'Costa Rica'),
(50, 'Cuba'),
(51, 'Cape Verde'),
(52, 'Christmas Island'),
(53, 'Cyprus'),
(54, 'Czech Republic'),
(55, 'Germany'),
(56, 'Djibouti'),
(57, 'Denmark'),
(58, 'Dominica'),
(59, 'Dominican Republic'),
(60, 'Algeria'),
(61, 'Ecuador'),
(62, 'Estonia'),
(63, 'Egypt'),
(64, 'Western Sahara'),
(65, 'Eritrea'),
(66, 'Spain'),
(67, 'Ethiopia'),
(68, 'Finland'),
(69, 'Fiji'),
(71, 'Micronesia'),
(72, 'Faroe Islands'),
(73, 'Gabon'),
(74, 'United Kingdom'),
(75, 'Grenada'),
(76, 'Georgia'),
(77, 'French Guiana'),
(78, 'Guernsey'),
(79, 'Ghana'),
(80, 'Gibraltar'),
(81, 'Greenland'),
(82, 'Gambia'),
(83, 'Guinea'),
(84, 'Guadeloupe'),
(85, 'Equatorial Guinea'),
(86, 'Greece'),
(88, 'Guatemala'),
(89, 'Guam'),
(90, 'Guinea-Bissau'),
(91, 'Guyana'),
(92, 'Gaza Strip'),
(93, 'Hong Kong'),
(95, 'Honduras'),
(96, 'Croatia'),
(97, 'Haiti'),
(98, 'Hungary'),
(99, 'Indonesia'),
(100, 'Ireland'),
(101, 'Israel'),
(102, 'Isle of Man'),
(103, 'India'),
(105, 'Iraq'),
(106, 'Iran'),
(107, 'Iceland'),
(108, 'Italy'),
(109, 'Jersey'),
(110, 'Jamaica'),
(111, 'Jordan'),
(112, 'Japan'),
(113, 'Kenya'),
(114, 'Kyrgyzstan'),
(115, 'Cambodia'),
(116, 'Kiribati'),
(117, 'Comoros'),
(118, 'Saint Kitts and Nevis'),
(119, 'North Korea'),
(120, 'South Korea'),
(121, 'Kuwait'),
(122, 'Cayman Islands'),
(123, 'Kazakhstan'),
(124, 'Laos'),
(125, 'Lebanon'),
(126, 'Saint Lucia'),
(127, 'Liechtenstein'),
(128, 'Sri Lanka'),
(129, 'Liberia'),
(130, 'Lesotho'),
(131, 'Lithuania'),
(132, 'Luxembourg'),
(133, 'Latvia'),
(134, 'Libya'),
(135, 'Morocco'),
(136, 'Monaco'),
(137, 'Moldova'),
(138, 'Montenegro'),
(139, 'Madagascar'),
(140, 'Marshall Islands'),
(141, 'Macedonia [FYROM]'),
(142, 'Mali'),
(143, 'Myanmar [Burma]'),
(144, 'Mongolia'),
(145, 'Macau'),
(146, 'Northern Mariana Islands'),
(147, 'Martinique'),
(148, 'Mauritania'),
(149, 'Montserrat'),
(150, 'Malta'),
(151, 'Mauritius'),
(152, 'Maldives'),
(153, 'Malawi'),
(154, 'Mexico'),
(155, 'Malaysia'),
(156, 'Mozambique'),
(157, 'Namibia'),
(158, 'New Caledonia'),
(159, 'Niger'),
(160, 'Norfolk Island'),
(161, 'Nigeria'),
(162, 'Nicaragua'),
(163, 'Netherlands'),
(164, 'Norway'),
(165, 'Nepal'),
(166, 'Nauru'),
(167, 'Niue'),
(168, 'New Zealand'),
(169, 'Oman'),
(170, 'Panama'),
(171, 'Peru'),
(172, 'French Polynesia'),
(173, 'Papua New Guinea'),
(174, 'Philippines'),
(175, 'Pakistan'),
(176, 'Poland'),
(177, 'Saint Pierre and Miquelon'),
(178, 'Pitcairn Islands'),
(179, 'Puerto Rico'),
(180, 'Palestinian Territories'),
(181, 'Portugal'),
(182, 'Palau'),
(183, 'Paraguay'),
(184, 'Qatar'),
(185, 'Réunion'),
(186, 'Romania'),
(187, 'Serbia'),
(188, 'Russia'),
(189, 'Rwanda'),
(190, 'Saudi Arabia'),
(191, 'Solomon Islands'),
(192, 'Seychelles'),
(193, 'Sudan'),
(194, 'Sweden'),
(195, 'Singapore'),
(196, 'Saint Helena'),
(197, 'Slovenia'),
(198, 'Svalbard and Jan Mayen'),
(199, 'Slovakia'),
(200, 'Sierra Leone'),
(201, 'San Marino'),
(202, 'Senegal'),
(203, 'Somalia'),
(204, 'Suriname'),
(205, 'São Tomé and Príncipe'),
(206, 'El Salvador'),
(207, 'Syria'),
(208, 'Swaziland'),
(209, 'Turks and Caicos Islands'),
(210, 'Chad'),
(211, 'French Southern Territories'),
(212, 'Togo'),
(213, 'Thailand'),
(214, 'Tajikistan'),
(215, 'Tokelau'),
(216, 'Timor-Leste'),
(217, 'Turkmenistan'),
(218, 'Tunisia'),
(219, 'Tonga'),
(220, 'Turkey'),
(221, 'Trinidad and Tobago'),
(222, 'Tuvalu'),
(223, 'Taiwan'),
(224, 'Tanzania'),
(225, 'Ukraine'),
(226, 'Uganda'),
(227, 'United States'),
(228, 'Uruguay'),
(229, 'Uzbekistan'),
(230, 'Vatican City'),
(232, 'Venezuela'),
(233, 'British Virgin Islands'),
(234, 'U.S. Virgin Islands'),
(235, 'Vietnam'),
(236, 'Vanuatu'),
(237, 'Wallis and Futuna'),
(238, 'Samoa'),
(239, 'Kosovo'),
(240, 'Yemen'),
(241, 'Mayotte'),
(242, 'South Africa'),
(243, 'Zambia'),
(244, 'Zimbabwe');

-- --------------------------------------------------------

--
-- Structure de la table `Reserver`
--

CREATE TABLE `Reserver` (
  `idVol` int(8) NOT NULL,
  `idUser` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Users`
--

CREATE TABLE `Users` (
  `idUser` int(8) NOT NULL,
  `nomUser` varchar(30) NOT NULL,
  `prenomUser` varchar(30) NOT NULL,
  `mail` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `isAdmin` bit(1) NOT NULL DEFAULT b'0',
  `tel` varchar(10) NOT NULL,
  `idVille` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Ville`
--

CREATE TABLE `Ville` (
  `idVille` int(8) NOT NULL,
  `nomVille` varchar(30) NOT NULL,
  `idPays` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Ville`
--

INSERT INTO `Ville` (`idVille`, `nomVille`, `idPays`) VALUES
(1, 'Montpellier', 1),
(2, 'Kourou', 1),
(4, 'Rennes', 1),
(5, 'Paris', 1),
(6, 'Tsiolkovski', 188),
(7, 'Roubaix', 1),
(9, 'Bordeaux', 1),
(10, 'Toulouse', 1),
(11, 'z', 1),
(12, 'test', 1),
(13, 'zihf', 1),
(14, 'Mende', 2),
(15, 'Rio de Janero', 30),
(16, 'aze', 1),
(17, 'Alès', 1);

-- --------------------------------------------------------

--
-- Structure de la table `Voler`
--

CREATE TABLE `Voler` (
  `idVol` int(8) NOT NULL,
  `idLanceur` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Vols`
--

CREATE TABLE `Vols` (
  `idVol` int(8) NOT NULL,
  `date` date NOT NULL,
  `heureDepart` time NOT NULL,
  `duree` int(11) NOT NULL COMMENT 'En jours',
  `description` text NOT NULL,
  `idAstre` int(11) NOT NULL,
  `prix` float NOT NULL,
  `idPas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `Vols`
--

INSERT INTO `Vols` (`idVol`, `date`, `heureDepart`, `duree`, `description`, `idAstre`, `prix`, `idPas`) VALUES
(1, '2022-04-16', '11:00:00', 10, 'Un vol en orbite autour de mercure et au plus près du soleil ! ', 1, 1000000, 2),
(2, '2022-03-28', '09:00:00', 3, 'Un superbe vol vers Mercure en seulement 3 jours pour une expérience inoubliable.', 1, 2, 1),
(3, '2022-03-30', '21:30:00', 21, 'En direction de Jupiter et ses lunes ! La plus grande planète du système solaire vous attends pour un séjour hors du temps.\r\n', 6, 2000000, 2),
(4, '2022-04-17', '10:00:00', 15, 'Un voyage sur la planète rouge, sensations fortes garanties ! À la conquête de l\'espace pour des aventures dantesque !', 5, 1200000, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Astres`
--
ALTER TABLE `Astres`
  ADD PRIMARY KEY (`idAstre`);

--
-- Index pour la table `Companies`
--
ALTER TABLE `Companies`
  ADD PRIMARY KEY (`idCompanie`);

--
-- Index pour la table `Lanceurs`
--
ALTER TABLE `Lanceurs`
  ADD PRIMARY KEY (`idLanceur`),
  ADD KEY `fk_lanceur_companie` (`idCompanie`);

--
-- Index pour la table `PasDeTir`
--
ALTER TABLE `PasDeTir`
  ADD PRIMARY KEY (`idPas`),
  ADD KEY `fk_pasdetir_ville` (`idVille`);

--
-- Index pour la table `Pays`
--
ALTER TABLE `Pays`
  ADD PRIMARY KEY (`idPays`);

--
-- Index pour la table `Reserver`
--
ALTER TABLE `Reserver`
  ADD PRIMARY KEY (`idVol`,`idUser`),
  ADD KEY `fk_reserver_user` (`idUser`);

--
-- Index pour la table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `fk_users_ville` (`idVille`);

--
-- Index pour la table `Ville`
--
ALTER TABLE `Ville`
  ADD PRIMARY KEY (`idVille`),
  ADD KEY `fk_ville_pays` (`idPays`);

--
-- Index pour la table `Voler`
--
ALTER TABLE `Voler`
  ADD PRIMARY KEY (`idVol`,`idLanceur`),
  ADD KEY `fk_voler_lanceur` (`idLanceur`);

--
-- Index pour la table `Vols`
--
ALTER TABLE `Vols`
  ADD PRIMARY KEY (`idVol`),
  ADD KEY `fk_vols_astres` (`idAstre`),
  ADD KEY `fk_vols_pasdetir` (`idPas`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Astres`
--
ALTER TABLE `Astres`
  MODIFY `idAstre` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `Companies`
--
ALTER TABLE `Companies`
  MODIFY `idCompanie` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Lanceurs`
--
ALTER TABLE `Lanceurs`
  MODIFY `idLanceur` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `PasDeTir`
--
ALTER TABLE `PasDeTir`
  MODIFY `idPas` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Pays`
--
ALTER TABLE `Pays`
  MODIFY `idPays` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT pour la table `Users`
--
ALTER TABLE `Users`
  MODIFY `idUser` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT pour la table `Ville`
--
ALTER TABLE `Ville`
  MODIFY `idVille` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `Vols`
--
ALTER TABLE `Vols`
  MODIFY `idVol` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Lanceurs`
--
ALTER TABLE `Lanceurs`
  ADD CONSTRAINT `fk_lanceur_companie` FOREIGN KEY (`idCompanie`) REFERENCES `Companies` (`idCompanie`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `PasDeTir`
--
ALTER TABLE `PasDeTir`
  ADD CONSTRAINT `fk_pasdetir_ville` FOREIGN KEY (`idVille`) REFERENCES `Ville` (`idVille`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Reserver`
--
ALTER TABLE `Reserver`
  ADD CONSTRAINT `fk_reserver_user` FOREIGN KEY (`idUser`) REFERENCES `Users` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reserver_vol` FOREIGN KEY (`idVol`) REFERENCES `Vols` (`idVol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `fk_users_ville` FOREIGN KEY (`idVille`) REFERENCES `Ville` (`idVille`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Ville`
--
ALTER TABLE `Ville`
  ADD CONSTRAINT `fk_ville_pays` FOREIGN KEY (`idPays`) REFERENCES `Pays` (`idPays`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Voler`
--
ALTER TABLE `Voler`
  ADD CONSTRAINT `fk_voler_lanceur` FOREIGN KEY (`idLanceur`) REFERENCES `Lanceurs` (`idLanceur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_voler_vols` FOREIGN KEY (`idVol`) REFERENCES `Vols` (`idVol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Vols`
--
ALTER TABLE `Vols`
  ADD CONSTRAINT `fk_vols_astres` FOREIGN KEY (`idAstre`) REFERENCES `Astres` (`idAstre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vols_pasdetir` FOREIGN KEY (`idPas`) REFERENCES `PasDeTir` (`idPas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
