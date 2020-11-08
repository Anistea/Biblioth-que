CREATE DATABASE IF NOT EXISTS `STOCKS` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `STOCKS`;

CREATE TABLE `STOCK` (
  `id` VARCHAR(42),
  `id_ouvrage` VARCHAR(42),
  `etat` VARCHAR(42),
  `status` VARCHAR(42),
  `id_ouvrage` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `OUVRAGE` (
  `id` VARCHAR(42),
  `isbn` VARCHAR(42),
  `titre` VARCHAR(42),
  `auteur` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `COMPREND` (
  `id_stock` VARCHAR(42),
  `id_empruntemprunt_:_id` VARCHAR(42),
  `id_stock` VARCHAR(42),
  `id_client` VARCHAR(42),
  `dateout` VARCHAR(42),
  `datein` VARCHAR(42),
  `id_client` VARCHAR(42),
  PRIMARY KEY (`id_stock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `CLIENT` (
  `id` VARCHAR(42),
  `nom` VARCHAR(42),
  `prenom` VARCHAR(42),
  `role` VARCHAR(42),
  `numtel` VARCHAR(42),
  `email` VARCHAR(42),
  `adresse` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `PASSE` (
  `id_client` VARCHAR(42),
  `id_commande` VARCHAR(42),
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `COMMANDE` (
  `id` VARCHAR(42),
  `id_client` VARCHAR(42),
  `prix` VARCHAR(42),
  `reference` VARCHAR(42),
  `datecom` VARCHAR(42),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;