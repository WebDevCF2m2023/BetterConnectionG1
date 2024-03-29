-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 29, 2024 at 05:43 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `betterconnectiong1`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `idcategory` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `slug` varchar(101) NOT NULL,
  `description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`idcategory`),
  UNIQUE KEY `slug_UNIQUE` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`idcategory`, `title`, `slug`, `description`) VALUES
(1, 'Astronomie', 'astronomie', 'L\'astronomie est la science de l\'observation des astres, cherchant à expliquer leur origine, leur évolution, ainsi que leurs propriétés physiques et chimiques.'),
(2, 'Les Planètes', 'les-planetes', 'Articles généraux sur la taille, la position, la structure, etc. des planètes de notre système solaire'),
(3, 'Astronomie solaire', 'astronomie-solaire', 'L\'étoile la plus étudiée est le Soleil, une petite étoile typique de la séquence principale de type spectral G2V et vieille d\'environ 4,6 milliards d\'années. Le Soleil n\'est pas considéré comme une étoile variable, mais il subit des changements périodiques de son activité, ce qui peut être vu grâce aux taches solaires.'),
(4, 'Planétologie', 'planetologie', 'Ce domaine de la planétologie s\'intéresse à l\'ensemble des planètes, des lunes, des planètes naines, des comètes, des astéroïdes, et des autres corps orbitant autour du soleil ; ainsi qu\'aux exoplanètes.'),
(5, 'Astronomie stellaire', 'astronomie-stellaire', 'L\'étude des étoiles et de l\'évolution stellaire est fondamentale pour notre compréhension de l\'univers. L\'astrophysique des étoiles a été déterminée grâce à l\'observation et à la compréhension théorique ainsi que par des simulations informatiques.'),
(6, 'Astronomie galactique', 'astronomie-galactique', 'Le Système solaire orbite au sein de la Voie lactée, une galaxie spirale barrée qui est un membre important du Groupe local. C\'est une masse tournante formée de gaz, d\'étoiles et d\'autres objets maintenus ensemble par une attraction gravitationnelle mutuelle. Étant donné que la Terre est située dans un bras extérieur poussiéreux, il y a une grande partie de la Voie lactée que l\'on ne peut pas voir'),
(7, 'Astronomie extragalactique', 'astronomie-extragalactique', 'L\'étude des objets situés en dehors de notre galaxie est une branche de l\'astronomie concernée par la formation et l\'évolution des galaxies ; leur morphologie et classification ; l\'examen des galaxies actives ; ainsi que par les groupes et amas de galaxies. Ces derniers sont importants pour la compréhension des structures à grande échelle de l\'Univers.'),
(8, 'Cosmologie', 'cosmologie', 'La cosmologie (du grec κόσμος / kósmos, « monde, univers », et λόγος / lógos, « parole, récit, étude ») pourrait être considérée comme l\'étude de l\'Univers comme étant un tout.');

-- --------------------------------------------------------

--
-- Table structure for table `news`
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`idnews`, `title`, `slug`, `content`, `date_created`, `date_published`, `is_published`, `user_iduser`) VALUES
(1, 'Étoile', 'etoile', 'Une étoile est un corps céleste plasmatique qui rayonne sa propre lumière par réactions de fusion nucléaire, ou des corps qui ont été dans cet état à un stade de leur cycle de vie, comme les naines blanches ou les étoiles à neutrons. \r\n\r\nCela signifie qu\'ils doivent posséder une masse minimale pour que les conditions de température et de pression au sein de la région centrale — le cœur — permettent l\'amorce et le maintien de ces réactions nucléaires, seuil en deçà duquel on parle d\'objets substellaires. \r\n\r\nLes masses possibles des étoiles s\'étendent de 0,085 masse solaire à une centaine de masses solaires. La masse détermine la température et la luminosité de l\'étoile.\r\n\r\nLa plupart des étoiles se situent sur la séquence principale du diagramme de Hertzsprung-Russell, où les étoiles produisent leur énergie et leur rayonnement par conversion de l\'hydrogène en hélium, par des mécanismes de fusion nucléaire comme le cycle carbone-azote-oxygène ou la chaîne proton-proton.\r\n\r\nPendant une grande partie de son existence, une étoile est en équilibre hydrostatique sous l\'action de deux forces qui s\'opposent : la gravitation, qui tend à contracter et faire s\'effondrer l\'étoile, et la pression cinétique (avec la pression de rayonnement pour les étoiles massives), régulée et maintenue par les réactions de fusion nucléaire, qui tend au contraire à dilater l\'astre. \r\n\r\nÀ la fin de cette phase, marquée par la consommation de la totalité de l\'hydrogène de son cœur, les étoiles de la séquence principale se dilatent et évoluent en étoiles géantes, qui obtiennent leur énergie d\'autres réactions nucléaires, comme la fusion de l\'hélium en carbone et oxygène.', '2024-03-21 06:38:34', '2024-03-21 06:38:34', 1, 1),
(2, 'Planète naine', 'planete-naine', 'En astronomie, une planète naine est un objet céleste du Système solaire de classe intermédiaire entre une planète et un petit corps du Système solaire. Le terme est adopté le 24 août 2006 par l\'Union astronomique internationale (UAI) après un débat afin d\'éclaircir la classification des objets en orbite autour du Soleil. Celui-ci est notamment précipité par la découverte d\'Éris, un objet de taille similaire à Pluton — alors considérée comme une planète — et devant la perspective de découvrir à l\'avenir de nombreux autres objets d\'une taille pouvant faire d\'eux des planètes.\r\n\r\nPlus précisément, l\'UAI définit une planète naine comme « un corps céleste qui (a) est en orbite autour du Soleil, (b) a une masse suffisante pour que sa gravité l’emporte sur les forces de cohésion du corps solide et le maintienne en équilibre hydrostatique, sous une forme presque sphérique, (c) n’a pas éliminé tout corps susceptible de se déplacer sur une orbite proche, (d) n’est pas un satellite ».\r\n\r\nInitialement, trois planètes naines étaient désignées — Cérès, Pluton et Éris —, auxquelles se sont ensuite ajoutées en 2008 Hauméa et Makémaké, ce qui porte à cinq le nombre d\'objets reconnus comme planètes naines par l\'UAI. Les objets connus les plus susceptibles d\'être ajoutés à cette catégorie à l\'avenir sont Gonggong, Quaoar, Sedna et Orcus. Le nombre total de planètes naines dans le Système solaire est inconnu car vérifier si un corps est en équilibre hydrostatique nécessite au moins un survol par une sonde spatiale, ce qui n\'a été le cas que pour Cérès et Pluton. De nombreux gros objets transneptuniens ont néanmoins des satellites naturels, ce qui permet de précisément déterminer leur masse et donc d\'estimer leur densité.\r\n\r\nSi la nécessité de distinguer les planètes et une autre catégorie d\'objets incluant Pluton apparaît clairement depuis 2000 dans les travaux d\'Alan Stern, Harold F. Levison, Steven Soter ou Jean-Luc Margot, de nombreux astronomes — notamment américains dont Alan Stern — s\'opposent au moins initialement à l\'introduction de ce nouveau terme en raison de la perte du statut de planète pour Pluton.', '2024-03-22 06:48:55', '2024-03-22 06:50:23', 1, 2),
(3, 'Big Bang', 'big-bang', 'Le Big Bang (« Grand Boum ») est un modèle cosmologique utilisé par les scientifiques pour décrire l\'origine et l\'évolution de l\'Univers.\r\n\r\nDe façon générale, le terme « Big Bang » est associé à toutes les théories qui décrivent notre Univers comme issu d\'une dilatation rapide. \r\n\r\nPar extension, il est également associé à cette époque dense et chaude qu’a connue l’Univers il y a 13,8 milliards d’années, sans que cela préjuge de l’existence d’un « instant initial » ou d’un commencement à son histoire. \r\nLa comparaison avec une explosion, souvent employée, est elle aussi impropre.\r\n\r\nLe concept a été initialement proposé en 1927 par l\'astrophysicien et chanoine catholique belge Georges Lemaître, qui décrivait dans les grandes lignes l’expansion de l\'Univers, avant que celle-ci soit mise en évidence par l\'astronome américain Edwin Hubble en 1929. \r\n\r\nCe modèle est désigné pour la première fois sous le terme ironique de « Big Bang » lors d’une émission de la BBC, The Nature of Things le 28 mars 1949 (dont le texte fut publié en 1950), par le physicien britannique Fred Hoyle, qui lui-même préférait les modèles d\'état stationnaire.', '2024-03-18 11:08:21', NULL, 0, NULL),
(4, 'À la Découverte de Mercure', 'a-la-decouverte-de-mercure', 'Dans notre système solaire, Mercure reste une énigme fascinante. Située à seulement 57,9 millions de kilomètres du Soleil, cette planète interne se distingue par sa proximité avec l`étoile centrale et par une série de caractéristiques uniques qui en font un objet d`étude privilégié pour les astronomes. Bien que souvent négligée en raison de sa taille modeste et de son éclat solaire constant, Mercure offre un terrain fertile pour la découverte et la compréhension des mystères de notre système solaire.\r\n\r\nMercure, avec un diamètre d`environ 4 880 kilomètres, est la plus petite planète du système solaire, à peine plus grande que la Lune de la Terre. Cette taille relativement réduite a conduit certains à la considérer comme une \"lune planétaire\", bien que sa masse et sa composition la classent fermement comme une planète à part entière. Malgré sa petite taille, Mercure possède une densité élevée, ce qui suggère la présence d`un noyau métallique massif, représentant près de 60 % de son volume.\r\n\r\nLe voyage de Mercure autour du Soleil est rapide et intense. Son orbite elliptique le rapproche du Soleil à une distance minimale de seulement 46 millions de kilomètres et l`éloigne jusqu`à environ 70 millions de kilomètres. Cette orbite excentrique entraîne des variations extrêmes de température, avec des températures de surface pouvant atteindre jusqu`à 430 degrés Celsius pendant le jour et chuter à -180 degrés Celsius la nuit.\r\n\r\nLa période orbitale de Mercure, le temps qu`il faut à la planète pour faire le tour complet du Soleil, est d`environ 88 jours terrestres. Cependant, sa période de rotation est beaucoup plus lente et plus étrange. Mercure effectue trois rotations sur son axe pour chaque deux orbites complètes autour du Soleil. Cela signifie que chaque jour mercurien dure environ 176 jours terrestres. Cette rotation inhabituelle crée des variations de température extrêmes entre le jour et la nuit, qui défient les attentes basées sur la distance par rapport au Soleil.\r\n\r\nLa surface de Mercure est criblée de cratères, témoins de collisions violentes avec des astéroïdes et des comètes au fil des millénaires. La planète présente également des falaises abruptes et des plaines lisses, suggérant une activité tectonique passée. Des clichés de la sonde spatiale MESSENGER (MErcury Surface, Space ENvironment, GEochemistry, and Ranging) de la NASA ont révélé des indices sur une activité volcanique ancienne, avec des preuves de coulées de lave solidifiée et des cratères d`impact partiellement recouverts.\r\n\r\nMalgré sa proximité avec le Soleil, Mercure possède des zones polaires qui restent dans l`ombre permanente des cratères. Les scientifiques pensent que ces régions sombres pourraient abriter de la glace d`eau, protégée des rayons du Soleil par l`ombre des cratères.\r\n\r\n### Exploration et Découvertes Récentes\r\n\r\nLa première mission dédiée à l`étude de Mercure fut Mariner 10, lancée par la NASA en 1973. Cette mission a permis de cartographier environ 45 % de la surface de la planète. Cependant, ce n`est qu`avec l`arrivée de la sonde MESSENGER en 2011 que les scientifiques ont pu obtenir une image plus complète de Mercure. MESSENGER a cartographié la planète, analysé sa composition et collecté des données sur son champ magnétique et son atmosphère ténue.\r\n\r\nPlus récemment, l`Agence spatiale européenne (ESA) a lancé la mission BepiColombo en 2018, une collaboration avec l`Agence spatiale japonaise (JAXA). BepiColombo est conçue pour étudier Mercure de manière plus approfondie, en particulier son champ magnétique, sa surface et sa composition interne.\r\n\r\nMercure reste une planète mystérieuse et fascinante, offrant un aperçu précieux sur les premiers stades de formation de notre système solaire. Sa proximité avec le Soleil et ses caractéristiques uniques en font un objet d`étude essentiel pour les scientifiques. Alors que de nouvelles missions spatiales continuent d`explorer et d`analyser cette planète intrigante, nous pouvons nous attendre à de nouvelles découvertes qui enrichiront notre compréhension de Mercure et de son rôle dans l`histoire cosmique de notre système solaire.', '2024-03-28 18:32:55', NULL, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `news_has_category`
--

DROP TABLE IF EXISTS `news_has_category`;
CREATE TABLE IF NOT EXISTS `news_has_category` (
  `news_idnews` int UNSIGNED NOT NULL,
  `category_idcategory` int UNSIGNED NOT NULL,
  PRIMARY KEY (`news_idnews`,`category_idcategory`),
  KEY `fk_news_has_category_category1_idx` (`category_idcategory`),
  KEY `fk_news_has_category_news_idx` (`news_idnews`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `news_has_category`
--

INSERT INTO `news_has_category` (`news_idnews`, `category_idcategory`) VALUES
(1, 1),
(2, 1),
(4, 2),
(2, 4),
(4, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`iduser`, `login`, `pwd`, `thename`, `theemail`, `useruniqid`, `thestatus`) VALUES
(1, 'Mikhawa', '$2y$10$inJ2.CnUt54aJm6uVIQtEek8uXFJGFQOs11wwo0dC5qq..Oz4lrQW', 'Michaël Pitz', 'mike@cf2m.be', '65fd1a8bb88968.13880258', 1),
(2, 'PierreSandron', '$2y$10$FPTej0D0P8isOdh8/2/gNOyJ6wSPphVE.zix0BCGhiRui3o4AlPR.', 'Pierre Sandron', 'pierre@cf2m.be', '65fd1ad7271560.22515332', 1),
(3, 'Magib', '$2y$10$qwlMKD.PgA.Dllo.AxytcegjJnI6jG/s1/WO7L8aBlAi9Kij5aL1u', 'The Magib', 'magib@cf2m.be', '65fd5d60ac3ef9.93917609', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `fk_news_user1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`) ON DELETE SET NULL ON UPDATE RESTRICT;

--
-- Constraints for table `news_has_category`
--
ALTER TABLE `news_has_category`
  ADD CONSTRAINT `fk_news_has_category_category1` FOREIGN KEY (`category_idcategory`) REFERENCES `category` (`idcategory`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_news_has_category_news` FOREIGN KEY (`news_idnews`) REFERENCES `news` (`idnews`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
