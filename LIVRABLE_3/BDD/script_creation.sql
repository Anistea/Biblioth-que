
-- Base de données :  `bibliotheque`
--
CREATE DATABASE IF NOT EXISTS `bibliotheque` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bibliotheque`;

-- --------------------------------------------------------

--
-- Structure de la table `Client`
--

CREATE TABLE `Client` (
  `Id` int(11) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Role` set('client','admin') NOT NULL DEFAULT 'client',
  `NumTel` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Adresse` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Insertion des données de la table `Client`
--

INSERT INTO `Client` (`Id`, `Nom`, `Prenom`, `Role`, `NumTel`, `Email`, `Adresse`) VALUES
(1, 'Premier', 'Carlos', 'client', 605040302, 'carlos.premier@renault.fr', 'Au Liban'),
(2, 'tay', 'julien', 'client', 5405045, 'gkdzjh@hotmail.fr', 'fhkejhek');

-- --------------------------------------------------------

--
-- Création de la table `Commande`
--

CREATE TABLE `Commande` (
  `Id` int(11) NOT NULL,
  `Prix` int(11) NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(255) NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Insertion des données de la table `Commande`
--

INSERT INTO `Commande` (`Id`, `Prix`, `date`, `reference`, `id_client`) VALUES
(1, 150, '2020-10-05', 'FF34', 1),
(2, 200, '2020-09-08', '23FD', 1),
(3, 211, '2020-10-14', 'DJJJ', 2);

-- --------------------------------------------------------

--
-- Création de la table `Emprunt`
--

CREATE TABLE `Emprunt` (
  `Id` int(11) NOT NULL,
  `id_Stock` int(11) NOT NULL,
  `id_Client` int(11) NOT NULL,
  `DateOUT` date DEFAULT NULL,
  `DateIN` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Insertion des données de la table `Emprunt`
--

INSERT INTO `Emprunt` (`Id`, `id_Stock`, `id_Client`, `DateOUT`, `DateIN`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 1, NULL, NULL),
(4, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Création de la table `Ouvrage`
--

CREATE TABLE `Ouvrage` (
  `Id` int(11) NOT NULL,
  `ISBN` int(11) NOT NULL,
  `Titre` varchar(100) NOT NULL,
  `Auteur` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Insertion des données de la table `Ouvrage`
--

INSERT INTO `Ouvrage` (`Id`, `ISBN`, `Titre`, `Auteur`) VALUES
(1, 10001, 'Les Dames de Mizuno', 'Akito Kobayashi'),
(2, 1003, 'Middle England', 'Jonathan Coe'),
(3, 3002, 'Le petit Prince', 'Antoine de Saint Exupery'),
(4, 65442, 'Le petit coeur brisé', 'Moka'),
(6, 3321, 'Les contes de Grimm', 'Jacob Grimm et Wilhelm Grimm');

-- --------------------------------------------------------

--
-- Création de la table `Stock`
--

CREATE TABLE `Stock` (
  `id` int(11) NOT NULL,
  `id_Ouvrage` int(11) NOT NULL,
  `Etat` varchar(100) NOT NULL,
  `Status` enum('Libre','Réservé','Sorti','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Insertion des données de la table `Stock`
--

INSERT INTO `Stock` (`id`, `id_Ouvrage`, `Etat`, `Status`) VALUES
(1, 1, 'Bon Etat', 'Libre'),
(2, 1, 'Moyen', 'Libre'),
(3, 3, 'Bon', 'Réservé'),
(4, 4, 'Neuf', 'Libre'),
(5, 2, 'Impeccable', 'Sorti'),
(6, 6, 'Correct', 'Libre');

--
-- Index pour la table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Commande`
--
ALTER TABLE `Commande`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `Emprunt`
--
ALTER TABLE `Emprunt`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Ouvrage`
--
ALTER TABLE `Ouvrage`
  ADD PRIMARY KEY (`Id`);

--
-- Index pour la table `Stock`
--
ALTER TABLE `Stock`
  ADD PRIMARY KEY (`id`);
--

--
-- AUTO_INCREMENT pour la table `Client`
--
ALTER TABLE `Client`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Commande`
--
ALTER TABLE `Commande`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Emprunt`
--
ALTER TABLE `Emprunt`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `Ouvrage`
--
ALTER TABLE `Ouvrage`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `Stock`
--
ALTER TABLE `Stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--

--
-- Contraintes pour la table `Commande`
--
ALTER TABLE `Commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `Client` (`Id`);
