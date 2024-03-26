-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 22 mars 2024 à 10:38
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données : `betterconnectiong1`
--
DROP DATABASE IF EXISTS `betterconnectiong1`;
CREATE DATABASE IF NOT EXISTS `betterconnectiong1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `betterconnectiong1`;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `idcategory` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `slug` varchar(101) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`idcategory`),
  UNIQUE KEY `slug_UNIQUE` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`idcategory`, `title`, `slug`, `description`) VALUES
(1, 'Astronomie', 'astronomie', 'L\'astronomie est la science de l\'observation des astres, cherchant à expliquer leur origine, leur évolution, ainsi que leurs propriétés physiques et chimiques.'),
(2, 'Astrobiologie', 'astrobiologie', 'Sujet d\'étude récent (bien que des spéculations sur le sujet plus anciennes existent, dans le domaine du fantastique en particulier) et en pleine expansion ayant pour objet principal la recherche de vie extraterrestre, c\'est-à-dire existant au-delà des limites de la planète Terre.'),
(3, 'Astronomie solaire', 'astronomie-solaire', 'L\'étoile la plus étudiée est le Soleil, une petite étoile typique de la séquence principale de type spectral G2V et vieille d\'environ 4,6 milliards d\'années. Le Soleil n\'est pas considéré comme une étoile variable, mais il subit des changements périodiques de son activité, ce qui peut être vu grâce aux taches solaires.'),
(4, 'Planétologie', 'planetologie', 'Ce domaine de la planétologie s\'intéresse à l\'ensemble des planètes, des lunes, des planètes naines, des comètes, des astéroïdes, et des autres corps orbitant autour du soleil ; ainsi qu\'aux exoplanètes.'),
(5, 'Astronomie stellaire', 'astronomie-stellaire', 'L\'étude des étoiles et de l\'évolution stellaire est fondamentale pour notre compréhension de l\'univers. L\'astrophysique des étoiles a été déterminée grâce à l\'observation et à la compréhension théorique ainsi que par des simulations informatiques.'),
(6, 'Astronomie galactique', 'astronomie-galactique', 'Le Système solaire orbite au sein de la Voie lactée, une galaxie spirale barrée qui est un membre important du Groupe local. C\'est une masse tournante formée de gaz, d\'étoiles et d\'autres objets maintenus ensemble par une attraction gravitationnelle mutuelle. Étant donné que la Terre est située dans un bras extérieur poussiéreux, il y a une grande partie de la Voie lactée que l\'on ne peut pas voir'),
(7, 'Astronomie extragalactique', 'astronomie-extragalactique', 'L\'étude des objets situés en dehors de notre galaxie est une branche de l\'astronomie concernée par la formation et l\'évolution des galaxies ; leur morphologie et classification ; l\'examen des galaxies actives ; ainsi que par les groupes et amas de galaxies. Ces derniers sont importants pour la compréhension des structures à grande échelle de l\'Univers.'),
(8, 'Cosmologie', 'cosmologie', 'La cosmologie (du grec κόσμος / kósmos, « monde, univers », et λόγος / lógos, « parole, récit, étude ») pourrait être considérée comme l\'étude de l\'Univers comme étant un tout.');

-- --------------------------------------------------------

--
-- Structure de la table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `idnews` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL,
  `slug` varchar(121) NOT NULL,
  `content` text NOT NULL,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_published` datetime DEFAULT NULL,
  `is_published` tinyint UNSIGNED NOT NULL DEFAULT '0' COMMENT '0 => attente de validation\n1 => est affiché\n2 => est banni',
  `user_iduser` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`idnews`),
  UNIQUE KEY `slug_UNIQUE` (`slug`),
  KEY `fk_news_user1_idx` (`user_iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `news`
--

INSERT INTO `news` (`idnews`, `title`, `slug`, `content`, `date_created`, `date_published`, `is_published`, `user_iduser`) VALUES
(1, 'Étoile', 'etoile', 'Une étoile est un corps céleste plasmatique qui rayonne sa propre lumière par réactions de fusion nucléaire, ou des corps qui ont été dans cet état à un stade de leur cycle de vie, comme les naines blanches ou les étoiles à neutrons. \r\n\r\nCela signifie qu\'ils doivent posséder une masse minimale pour que les conditions de température et de pression au sein de la région centrale — le cœur — permettent l\'amorce et le maintien de ces réactions nucléaires, seuil en deçà duquel on parle d\'objets substellaires. \r\n\r\nLes masses possibles des étoiles s\'étendent de 0,085 masse solaire à une centaine de masses solaires. La masse détermine la température et la luminosité de l\'étoile.\r\n\r\nLa plupart des étoiles se situent sur la séquence principale du diagramme de Hertzsprung-Russell, où les étoiles produisent leur énergie et leur rayonnement par conversion de l\'hydrogène en hélium, par des mécanismes de fusion nucléaire comme le cycle carbone-azote-oxygène ou la chaîne proton-proton.\r\n\r\nPendant une grande partie de son existence, une étoile est en équilibre hydrostatique sous l\'action de deux forces qui s\'opposent : la gravitation, qui tend à contracter et faire s\'effondrer l\'étoile, et la pression cinétique (avec la pression de rayonnement pour les étoiles massives), régulée et maintenue par les réactions de fusion nucléaire, qui tend au contraire à dilater l\'astre. \r\n\r\nÀ la fin de cette phase, marquée par la consommation de la totalité de l\'hydrogène de son cœur, les étoiles de la séquence principale se dilatent et évoluent en étoiles géantes, qui obtiennent leur énergie d\'autres réactions nucléaires, comme la fusion de l\'hélium en carbone et oxygène.', '2024-03-22 06:38:34', '2024-03-22 06:38:34', 1, 1),
(2, 'Planète naine', 'planete-naine', 'En astronomie, une planète naine est un objet céleste du Système solaire de classe intermédiaire entre une planète et un petit corps du Système solaire. Le terme est adopté le 24 août 2006 par l\'Union astronomique internationale (UAI) après un débat afin d\'éclaircir la classification des objets en orbite autour du Soleil. Celui-ci est notamment précipité par la découverte d\'Éris, un objet de taille similaire à Pluton — alors considérée comme une planète — et devant la perspective de découvrir à l\'avenir de nombreux autres objets d\'une taille pouvant faire d\'eux des planètes.\r\n\r\nPlus précisément, l\'UAI définit une planète naine comme « un corps céleste qui (a) est en orbite autour du Soleil, (b) a une masse suffisante pour que sa gravité l’emporte sur les forces de cohésion du corps solide et le maintienne en équilibre hydrostatique, sous une forme presque sphérique, (c) n’a pas éliminé tout corps susceptible de se déplacer sur une orbite proche, (d) n’est pas un satellite ».\r\n\r\nInitialement, trois planètes naines étaient désignées — Cérès, Pluton et Éris —, auxquelles se sont ensuite ajoutées en 2008 Hauméa et Makémaké, ce qui porte à cinq le nombre d\'objets reconnus comme planètes naines par l\'UAI. Les objets connus les plus susceptibles d\'être ajoutés à cette catégorie à l\'avenir sont Gonggong, Quaoar, Sedna et Orcus. Le nombre total de planètes naines dans le Système solaire est inconnu car vérifier si un corps est en équilibre hydrostatique nécessite au moins un survol par une sonde spatiale, ce qui n\'a été le cas que pour Cérès et Pluton. De nombreux gros objets transneptuniens ont néanmoins des satellites naturels, ce qui permet de précisément déterminer leur masse et donc d\'estimer leur densité.\r\n\r\nSi la nécessité de distinguer les planètes et une autre catégorie d\'objets incluant Pluton apparaît clairement depuis 2000 dans les travaux d\'Alan Stern, Harold F. Levison, Steven Soter ou Jean-Luc Margot, de nombreux astronomes — notamment américains dont Alan Stern — s\'opposent au moins initialement à l\'introduction de ce nouveau terme en raison de la perte du statut de planète pour Pluton.', '2024-03-22 06:48:55', '2024-03-22 06:50:23', 1, 2),
(3, 'Big Bang', 'big-bang', 'Le Big Bang (« Grand Boum ») est un modèle cosmologique utilisé par les scientifiques pour décrire l\'origine et l\'évolution de l\'Univers.\r\n\r\nDe façon générale, le terme « Big Bang » est associé à toutes les théories qui décrivent notre Univers comme issu d\'une dilatation rapide. \r\n\r\nPar extension, il est également associé à cette époque dense et chaude qu’a connue l’Univers il y a 13,8 milliards d’années, sans que cela préjuge de l’existence d’un « instant initial » ou d’un commencement à son histoire. \r\nLa comparaison avec une explosion, souvent employée, est elle aussi impropre.\r\n\r\nLe concept a été initialement proposé en 1927 par l\'astrophysicien et chanoine catholique belge Georges Lemaître, qui décrivait dans les grandes lignes l’expansion de l\'Univers, avant que celle-ci soit mise en évidence par l\'astronome américain Edwin Hubble en 1929. \r\n\r\nCe modèle est désigné pour la première fois sous le terme ironique de « Big Bang » lors d’une émission de la BBC, The Nature of Things le 28 mars 1949 (dont le texte fut publié en 1950), par le physicien britannique Fred Hoyle, qui lui-même préférait les modèles d\'état stationnaire.', '2024-03-22 11:08:21', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `news_has_category`
--

DROP TABLE IF EXISTS `news_has_category`;
CREATE TABLE IF NOT EXISTS `news_has_category` (
  `news_idnews` int UNSIGNED NOT NULL,
  `category_idcategory` int UNSIGNED NOT NULL,
  PRIMARY KEY (`news_idnews`,`category_idcategory`),
  KEY `fk_news_has_category_category1_idx` (`category_idcategory`),
  KEY `fk_news_has_category_news_idx` (`news_idnews`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `news_has_category`
--

INSERT INTO `news_has_category` (`news_idnews`, `category_idcategory`) VALUES
(1, 1),
(2, 1),
(1, 3),
(2, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `iduser` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'sensible à la casse',
  `thename` varchar(120) DEFAULT NULL,
  `theemail` varchar(150) NOT NULL,
  `useruniqid` varchar(30) NOT NULL,
  `thestatus` tinyint UNSIGNED DEFAULT '0' COMMENT '0 => non validé\n1 => en fonction\n2 => banni',
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `theemail_UNIQUE` (`theemail`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`iduser`, `login`, `pwd`, `thename`, `theemail`, `useruniqid`, `thestatus`) VALUES
(1, 'Mikhawa', '$2y$10$inJ2.CnUt54aJm6uVIQtEek8uXFJGFQOs11wwo0dC5qq..Oz4lrQW', 'Michaël Pitz', 'mike@cf2m.be', '65fd1a8bb88968.13880258', 1),
(2, 'PierreSandron', '$2y$10$FPTej0D0P8isOdh8/2/gNOyJ6wSPphVE.zix0BCGhiRui3o4AlPR.', 'Pierre Sandron', 'pierre@cf2m.be', '65fd1ad7271560.22515332', 1),
(3, 'Magib', '$2y$10$qwlMKD.PgA.Dllo.AxytcegjJnI6jG/s1/WO7L8aBlAi9Kij5aL1u', 'The Magib', 'magib@cf2m.be', '65fd5d60ac3ef9.93917609', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `fk_news_user1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Contraintes pour la table `news_has_category`
--
ALTER TABLE `news_has_category`
  ADD CONSTRAINT `fk_news_has_category_category1` FOREIGN KEY (`category_idcategory`) REFERENCES `category` (`idcategory`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_news_has_category_news` FOREIGN KEY (`news_idnews`) REFERENCES `news` (`idnews`) ON DELETE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;
