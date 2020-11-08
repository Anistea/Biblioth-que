-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 08 nov. 2020 à 20:00
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bibliotheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Role` set('client','admin') NOT NULL DEFAULT 'client',
  `NumTel` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Adresse` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`Id`, `Nom`, `Prenom`, `Role`, `NumTel`, `Email`, `Adresse`) VALUES
(1, 'Premier', 'Carlos', 'client', 605040302, 'carlos.premier@renault.fr', 'Au Liban'),
(2, 'tay', 'julien', 'client', 5405045, 'gkdzjh@hotmail.fr', 'fhkejhek');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Prix` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

DROP TABLE IF EXISTS `emprunt`;
CREATE TABLE IF NOT EXISTS `emprunt` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_Stock` int(11) NOT NULL,
  `id_Client` int(11) NOT NULL,
  `DateResa` date DEFAULT NULL,
  `DateOUT` date DEFAULT NULL,
  `DateIN` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `emprunt`
--

INSERT INTO `emprunt` (`Id`, `id_Stock`, `id_Client`, `DateResa`, `DateOUT`, `DateIN`) VALUES
(1, 1, 1, '2020-01-10', NULL, NULL),
(2, 1, 2, '2020-01-10', NULL, NULL),
(3, 1, 1, '2020-01-13', NULL, NULL),
(4, 1, 1, '2020-01-13', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ouvrage`
--

DROP TABLE IF EXISTS `ouvrage`;
CREATE TABLE IF NOT EXISTS `ouvrage` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` int(11) NOT NULL,
  `Titre` varchar(100) NOT NULL,
  `Auteur` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ouvrage`
--

INSERT INTO `ouvrage` (`Id`, `ISBN`, `Titre`, `Auteur`) VALUES
(1, 10001, 'Les Dames de Mizuno', 'Akito Kobayashi'),
(2, 1003, 'Middle England', 'Jonathan Coe'),
(3, 3002, 'Le petit Prince', 'Antoine de Saint Exupery'),
(4, 65442, 'Le petit coeur brisé', 'Moka'),
(6, 3321, 'Les contes de Grimm', 'Jacob Grimm et Wilhelm Grimm');

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

DROP TABLE IF EXISTS `stock`;
CREATE TABLE IF NOT EXISTS `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_Ouvrage` int(11) NOT NULL,
  `Etat` varchar(100) NOT NULL,
  `Status` enum('Libre','Réservé','Sorti','') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`id`, `id_Ouvrage`, `Etat`, `Status`) VALUES
(1, 1, 'Bon état', 'Libre'),
(2, 1, 'Moyen', 'Libre'),
(3, 3, 'Bon', 'Réservé'),
(4, 4, 'Neuf', 'Libre'),
(5, 2, 'Impeccable', 'Sorti'),
(6, 6, 'Correct', 'Libre');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
