-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 15 mars 2022 à 19:31
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
  `image` varchar(100) NOT NULL COMMENT 'nom du fichier en local'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Companies`
--

CREATE TABLE `Companies` (
  `idCompanie` int(8) NOT NULL,
  `nomCompanie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Lanceurs`
--

CREATE TABLE `Lanceurs` (
  `idLanceur` int(8) NOT NULL,
  `nomLanceur` varchar(30) NOT NULL,
  `idCompanie` int(8) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `PasDeTir`
--

CREATE TABLE `PasDeTir` (
  `idPas` int(8) NOT NULL,
  `nomPas` varchar(30) NOT NULL,
  `idVille` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Pays`
--

CREATE TABLE `Pays` (
  `idPays` int(8) NOT NULL,
  `nomPays` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Users`
--

CREATE TABLE `Users` (
  `idUser` int(8) NOT NULL,
  `nomUser` varchar(30) NOT NULL,
  `prenomUser` varchar(30) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `password` varchar(64) NOT NULL,
  `isAdmin` bit(1) NOT NULL DEFAULT 0,
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

-- --------------------------------------------------------

--
-- Structure de la table `Vols`
--

CREATE TABLE `Vols` (
  `idVol` int(8) NOT NULL,
  `date` date NOT NULL,
  `heureDepart` time NOT NULL,
  `durée` int(11) NOT NULL COMMENT 'En jours',
  `description` text NOT NULL,
  `idAstre` int(11) NOT NULL,
  `prix` float NOT NULL,
  `idPas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  MODIFY `idAstre` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Companies`
--
ALTER TABLE `Companies`
  MODIFY `idCompanie` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Lanceurs`
--
ALTER TABLE `Lanceurs`
  MODIFY `idLanceur` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `PasDeTir`
--
ALTER TABLE `PasDeTir`
  MODIFY `idPas` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Pays`
--
ALTER TABLE `Pays`
  MODIFY `idPays` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Users`
--
ALTER TABLE `Users`
  MODIFY `idUser` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Ville`
--
ALTER TABLE `Ville`
  MODIFY `idVille` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Vols`
--
ALTER TABLE `Vols`
  MODIFY `idVol` int(8) NOT NULL AUTO_INCREMENT;

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
-- Contraintes pour la table `Vols`
--
ALTER TABLE `Vols`
  ADD CONSTRAINT `fk_vols_astres` FOREIGN KEY (`idAstre`) REFERENCES `Astres` (`idAstre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vols_pasdetir` FOREIGN KEY (`idPas`) REFERENCES `PasDeTir` (`idPas`) ON DELETE CASCADE ON UPDATE CASCADE;


DELIMITER //
CREATE OR REPLACE PROCEDURE addUser(
  IN p_nomUser VARCHAR(30),
  IN p_prenomUser VARCHAR(30),
  IN p_mail VARCHAR(30),
  IN p_passwd VARCHAR(64),
  IN p_tel VARCHAR(10),
  IN p_nomVille VARCHAR(30),
  IN p_idPays INT(8)
)
BEGIN

  DECLARE v_idCity INT;

  IF((SELECT COUNT(*) FROM Ville V WHERE V.nomVille LIKE p_nomVille) > 0) THEN
    SELECT idVille INTO v_idCity FROM Ville V WHERE V.nomVille LIKE p_nomVille;
  ELSE
    INSERT INTO Ville (`nomVille`,`idPays`) VALUES (p_nomVille,p_idPays);
    SET v_idCity = LAST_INSERT_ID();
  END IF;
  INSERT INTO Users (`nomUser`,`prenomUser`,`mail`,`password`,`tel`,`idVille`) VALUES(p_nomUser,p_prenomUser,p_mail,p_passwd,p_tel,v_idCity);

END//

DELIMITER ;



DELIMITER //
CREATE OR REPLACE PROCEDURE addPasDeTir(
  IN p_nomPas VARCHAR(30),
  IN p_nomVille VARCHAR(30),
  IN p_idPays INT(8)
)
BEGIN

  DECLARE v_idCity INT;

  IF((SELECT COUNT(*) FROM Ville V WHERE V.nomVille LIKE p_nomVille) > 0) THEN
    SELECT idVille INTO v_idCity FROM Ville V WHERE V.nomVille LIKE p_nomVille;
  ELSE
    INSERT INTO Ville (`nomVille`,`idPays`) VALUES (p_nomVille,p_idPays);
    SET v_idCity = LAST_INSERT_ID();
  END IF;
  INSERT INTO PasDeTir (`nomPas`,`idVille`) VALUES(p_nomPas,v_idCity);

END//

DELIMITER ;



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
(43, "Côte d\'Ivoire"),
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
(70, 'Falkland Islands [Islas Malvinas]'),
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
(87, 'South Georgia and the South Sandwich Islands'),
(88, 'Guatemala'),
(89, 'Guam'),
(90, 'Guinea-Bissau'),
(91, 'Guyana'),
(92, 'Gaza Strip'),
(93, 'Hong Kong'),
(94, 'Heard Island and McDonald Islands'),
(95, 'Honduras'),
(96, 'Croatia'),
(97, 'Haiti'),
(98, 'Hungary'),
(99, 'Indonesia'),
(100, 'Ireland'),
(101, 'Israel'),
(102, 'Isle of Man'),
(103, 'India'),
(104, 'British Indian Ocean Territory'),
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
(231, 'Saint Vincent and the Grenadines'),
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



COMMIT;

