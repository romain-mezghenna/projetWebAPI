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

COMMIT;

