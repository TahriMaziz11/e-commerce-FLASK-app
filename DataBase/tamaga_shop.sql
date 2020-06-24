-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 24 juin 2020 à 22:26
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `tamaga_shop`
--

-- --------------------------------------------------------

--
-- Structure de la table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE IF NOT EXISTS `orderdetails` (
  `DetailID` int(11) NOT NULL AUTO_INCREMENT,
  `DetailOrderID` int(11) NOT NULL,
  `DetailProductID` int(11) NOT NULL,
  `DetailName` varchar(250) COLLATE latin1_german2_ci NOT NULL,
  `DetailPrice` float NOT NULL,
  `DetailSKU` varchar(50) COLLATE latin1_german2_ci NOT NULL,
  `DetailQuantity` int(11) NOT NULL,
  PRIMARY KEY (`DetailID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderUserID` int(11) NOT NULL,
  `OrderAmount` float NOT NULL,
  `OrderShipName` varchar(100) COLLATE latin1_german2_ci NOT NULL,
  `OrderShipAddress` varchar(100) COLLATE latin1_german2_ci NOT NULL,
  `OrderShipAddress2` varchar(100) COLLATE latin1_german2_ci NOT NULL,
  `OrderCity` varchar(50) COLLATE latin1_german2_ci NOT NULL,
  `OrderState` varchar(50) COLLATE latin1_german2_ci NOT NULL,
  `OrderZip` varchar(20) COLLATE latin1_german2_ci NOT NULL,
  `OrderCountry` varchar(50) COLLATE latin1_german2_ci NOT NULL,
  `OrderPhone` varchar(20) COLLATE latin1_german2_ci NOT NULL,
  `OrderFax` varchar(20) COLLATE latin1_german2_ci NOT NULL,
  `OrderShipping` float NOT NULL,
  `OrderTax` float NOT NULL,
  `OrderEmail` varchar(100) COLLATE latin1_german2_ci NOT NULL,
  `OrderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OrderShipped` tinyint(1) NOT NULL DEFAULT '0',
  `OrderTrackingNumber` varchar(80) COLLATE latin1_german2_ci DEFAULT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `ProductID` int(12) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(100) COLLATE latin1_german2_ci NOT NULL,
  `ProductPrice` float NOT NULL,
  `ProductCartDesc` varchar(250) COLLATE latin1_german2_ci NOT NULL,
  `ProductDesc` text COLLATE latin1_german2_ci NOT NULL,
  `ProductThumb` varchar(100) COLLATE latin1_german2_ci NOT NULL,
  `ProductImage` longtext COLLATE latin1_german2_ci NOT NULL,
  `ProductUpdateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ProductStock` float DEFAULT NULL,
  `top1` int(11) NOT NULL,
  `top2` int(11) NOT NULL,
  `top3` int(11) NOT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `ProductPrice`, `ProductCartDesc`, `ProductDesc`, `ProductThumb`, `ProductImage`, `ProductUpdateDate`, `ProductStock`, `top1`, `top2`, `top3`) VALUES
(1, 'T-shirt', 15.99, 'T-shirt 100 % lin', 'Collection casual. Basique. 100 % lin. \r\n\r\nCol rond.\r\n\r\nManches courtes.\r\n\r\nCouleur Bleu marine\r\n\r\nDos long 73.5 cm.\r\n\r\nHomme\r\n\r\nT-shirts\r\n\r\nComposition: 100% lin', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67044382_56.jpg?ts=1578650643600&imwidth=456&imdensity=1', '2013-06-13 01:00:50', 100, 7, 8, 2),
(2, 'T-shirt', 9.99, 'T-shirt basique en coton', 'Collection casual. Basique. Tissu en coton. Col rond. Manches courtes.\r\nCoueur Gris chiné clair\r\nDos long 69.0 cm.\r\nComposition: 90% coton,10% viscose', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67000590_91.jpg?ts=1574681709606&imwidth=456&imdensity=1', '2013-07-25 19:04:36', NULL, 8, 1, 7),
(3, 'T-shirt', 19.75, 'T-shirt coton poche', 'Les vêtements portant la mention « Committed » sont des produits qui ont été fabriqués avec des fibres et/ou des processus de production durables, réduisant ainsi leur impact sur l’environnement.\r\nCollection casual. Tissu en coton. Col rond. Poche plaquée sur la poitrine. Détail brodé. Manches courtes.\r\nCouleur Bleu marine foncé\r\nLongueur sous manche. 47.4 cm.\r\nDos long 75.0 cm.\r\nComposition: 100% coton', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67027681_56_D1.jpg?ts=1585816420995&imwidth=456&imdensity=1', '2020-06-19 13:58:59', 50, 4, 9, 8),
(4, 'T-shirt', 25.99, 'T-shirt coton poche', 'Les vêtements portant la mention « Committed » sont des produits qui ont été fabriqués avec des fibres et/ou des processus de production durables, réduisant ainsi leur impact sur l’environnement.\r\nCollection casual. Tissu en coton. Col rond. Poche plaquée sur la poitrine. Détail brodé. Manches courtes.\r\nCouleur Blanc\r\nLongueur sous manche. 47.4 cm.\r\nDos long 75.0 cm.', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67027681_01.jpg?ts=1591808641692&imwidth=456&imdensity=1', '2020-06-19 16:38:58', NULL, 3, 9, 7),
(5, 'T-shirt ', 29.99, 'T-shirt maille fine coton', 'Collection Smart. Tissu en maille. Tissu en coton. Bande contrastante. Col rond. Manches courtes. Bords côtelés.\r\nCouleur Marron\r\nComposition: 100% coton\r\n', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67077637_30.jpg?ts=1583318055933&imwidth=456&imdensity=1', '2020-06-19 16:38:58', NULL, 13, 6, 14),
(6, 'T-shirt', 15.99, 'T-shirt maille coton lin', 'Collection casual. Tissu de coton et lin mélangé. Tissu en maille fine. Col rond. Poche plaquée sur la poitrine. Manches courtes. Bords élastiques. Bords côtelés.\r\nCouleur Blanc cassé\r\nComposition: 44% coton,44% acrylique,12% lin\r\n', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67055904_02.jpg?ts=1580132052397&imwidth=456&imdensity=1', '2020-06-19 19:48:04', NULL, 5, 10, 8),
(7, 'T-shirt', 25.99, 'T-shirt imprimé tie-dye', 'Collection casual. Tissu en coton. Imprimé tie-dye. Col rond. Manches courtes.\r\nCouleur Orange brûlé\r\nLongueur sous manche. 45.9 cm.\r\nDos long 72.0 cm.\r\nComposition: 100% coton', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67035913_28.jpg?ts=1580132052397&imwidth=456&imdensity=1', '2020-06-19 19:48:04', NULL, 1, 2, 8),
(8, 'T-shirt', 19.99, 'T-shirt coton à rayures', 'Collection casual. Tissu en coton mélangé. Motif à rayures. Col rond. Poche plaquée sur la poitrine. Manches courtes.\r\nCouleur Bleu marine\r\nDos long 69.0 cm.\r\nComposition: 60% coton,37% polyester,3% viscose', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67027665_56.jpg?ts=1584095655813&imwidth=456&imdensity=1', '2020-06-19 19:48:04', NULL, 15, 1, 2),
(9, 'T-shirt', 19.99, 'T-shirt coton col tunisien', 'Les vêtements portant la mention « Committed » sont des produits qui ont été fabriqués avec des fibres et/ou des processus de production durables, réduisant ainsi leur impact sur l’environnement. \r\nCollection casual. Tissu coton bio. Tissu texturé. Col tunisien. Manches courtes.\r\nCouleur Bleu marine foncé\r\nDos long 65.0 cm.\r\nComposition: 100% coton organique', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67095967_56.jpg?ts=1583750170571&imwidth=456&imdensity=1', '2020-06-19 19:48:04', NULL, 3, 4, 1),
(10, 'Polo', 29.99, 'Polo maille coton lin', 'Collection casual. Tissu de coton et lin mélangé. Col polo. Col boutonné. Manches courtes.\r\nCouleur Bleu indigo\r\nComposition: 44% acrylique,44% coton,12% lin', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67025914_54.jpg?ts=1582047454368&imwidth=456&imdensity=1', '2020-06-19 20:10:52', NULL, 6, 14, 15),
(11, 'Polo', 29.99, 'Polo coton à bords contrastants', 'Exclusivité internet. Collection casual. Tissu en coton. Col polo. Col boutonné. Poche plaquée sur la poitrine. Manches courtes. Bords élastiques. Bords à rayures contrastantes. Fentes latérales.\r\nCouleur Blanc\r\nDos long 70.0 cm.\r\nComposition: 100% coton', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67096714_01.jpg?ts=1585130617196&imwidth=456&imdensity=1', '2020-06-19 20:10:52', NULL, 17, 12, 13),
(12, 'Polo ', 29.99, 'Polo coton à rayures', 'Collection casual. Tissu en coton. Tissu à rayures. Col polo. Manches courtes. Fentes latérales. Col boutonné.\r\nCouleur Bleu marine foncé\r\nDos long 74.0 cm.', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67068253_56.jpg?ts=1583750170571&imwidth=456&imdensity=1', '2020-06-19 20:13:50', NULL, 17, 11, 15),
(13, 'Polo', 39.99, 'Polo coton maille rayures', 'Collection Smart. Tissu en coton. Tissu en maille. Motif à rayures. Col polo. Manches courtes. Bords élastiques. Bords côtelés.\r\nCouleur Blanc cassé\r\nComposition: 100% coton', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67017106_02.jpg?ts=1582049064404&imwidth=456&imdensity=1', '2020-06-19 20:20:05', NULL, 5, 6, 16),
(14, 'Polo ', 39.99, 'Polo maille fine liserés', 'Collection casual. Tissu en maille. Col polo. Col boutonné. Manches courtes. Bords côtelés. Bords contrastants.\r\nCouleur Noir\r\nComposition: 80% viscose,20% polyamide', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67035911_99.jpg?ts=1580227451945&imwidth=456&imdensity=1', '2020-06-19 20:20:05', NULL, 16, 5, 10),
(15, 'Polo', 39.99, 'Polo à texture rayée', 'Collection casual. Texturé. Tissu en coton mélangé. Col polo. Col boutonné. Poche plaquée sur la poitrine. Manches courtes.\r\nCouleur Bleu marine\r\nLongueur sous manche. 46.5 cm.\r\nDos long 68.5 cm.\r\nComposition: 63% coton,36% polyester,1% elasthanne', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67068261_56.jpg?ts=1583318055933&imwidth=456&imdensity=1', '2020-06-19 20:20:05', NULL, 8, 12, 11),
(16, 'Polo', 39.99, 'Polo maille liseré contrastant', 'Collection casual. Tissu en coton. Col polo. Col avec liserés contrastants. Fermeture Éclair. Manches courtes. Bords élastiques. Bords côtelés.\r\nCouleur Gris chiné clair\r\nComposition: 98% coton,2% polyamide', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67045910_91.jpg?ts=1580121375373&imwidth=456&imdensity=1', '2020-06-19 20:20:05', NULL, 14, 13, 5),
(17, 'Polo ', 29.99, 'Polo coton pois', 'Collection casual. Tissu en coton. Imprimé à pois. Col polo. Col boutonné. Manches courtes. Bords à rayures contrastantes. Bords côtelés. Fentes latérales.\r\nCouleur Bleu marine foncé\r\nDos long 70.0 cm.\r\nComposition: 100% coton', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67055970_56.jpg?ts=1583750170571&imwidth=456&imdensity=1', '2020-06-19 20:20:05', NULL, 12, 11, 1),
(18, 'Pantalon', 49.99, 'Pantalon slim-fit coton', 'Collection Smart. Slim-fit. Tissu en coton. Pinces sur le devant. Passants pour la ceinture. Deux poches latérales. Poche gousset. Deux poches à rabat boutonnées à l\'arrière. Revers. Fermeture Éclair avec boutons.\r\nCouleur Beige\r\nIntérieur de la jambe long 81.4 cm.\r\nLongueur sous manche. 106.6 cm.', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/outfit/S20/67048253_08-99999999_01.jpg?ts=1585064031192&imwidth=456&imdensity=1', '2020-06-19 20:58:18', NULL, 21, 22, 26),
(19, 'Pantalon', 39.99, 'Pantalon jogger coton', 'Collection casual. Style jogger. Tissu en coton stretch. Coupe droite. Cordon intérieur de serrage à la taille. Taille élastique. Bas élastiqué. Deux poches latérales. Deux poches passepoilées boutonnées à l\'arrière. Fermeture Éclair avec bouton.\r\nCouleur Bleu marine\r\nIntérieur de la jambe long 74.0 cm.\r\nLongueur sous manche. 97.0 cm.\r\nComposition: 98% coton,2% elasthanne. Doublure poches: 65% polyester,35% coton', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67095903_56.jpg?ts=1580227451945&imwidth=456&imdensity=1', '2020-06-19 20:58:18', NULL, 20, 23, 28),
(20, 'Pantalon', 49.99, 'Pantalon 100 % lin', 'Collection casual. 100 % lin. Structure à chevrons. Cordon intérieur de serrage à la taille. Il procure confort et liberté de mouvement. Pinces sur le devant. Fermeture Éclair avec bouton. Deux poches latérales. Deux poches passepoilées à l\'arrière.\r\nCouleur Bleu marine foncé\r\nIntérieur de la jambe long 69.6 cm.\r\nLongueur sous manche. 95.0 cm.\r\nComposition: 100% lin. Doublure poches: 100% coton', '', 'https://st.mngbcn.com/rcs/pics/static/T7/fotos/outfit/S20/77001004_56-99999999_01.jpg?ts=1589965406408&imwidth=456&imdensity=1', '2020-06-19 20:58:18', NULL, 23, 19, 22),
(21, 'Pantalon', 49.99, 'Pantalon lin slim-fit', 'Exclusivité internet. Collection Smart. Slim-fit. Tissu de coton et lin mélangé. Pinces sur le devant. Deux poches latérales. Poche gousset. Deux poches passepoilées boutonnées à l\'arrière. Revers. Fermeture Éclair avec boutons.\r\nCouleur Gris chiné clair\r\nIntérieur de la jambe long 80.5 cm.\r\nLongueur sous manche. 106.9 cm.\r\nComposition: 73% coton,27% lin. Doublure poches: 65% polyester,35% coton', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67017878_91.jpg?ts=1583415251219&imwidth=456&imdensity=1', '2020-06-19 20:58:18', NULL, 18, 22, 23),
(22, 'Pantalon ', 35.99, 'Pantalon chino slim-fit', 'Collection Smart. Slim-fit. Tissu premium. Tissu Kurabo. Tissu en coton. Deux poches latérales. Poche gousset. Deux poches passepoilées à l\'arrière. Passants pour la ceinture. Fermeture Éclair avec bouton.\r\nCouleur Bleu marine foncé\r\nIntérieur de la jambe long 84.1 cm.\r\nLongueur sous manche. 104.0 cm.\r\nComposition: 97% coton,3% elasthanne. Doublure: 65% polyester,35% coton', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67004391_56.jpg?ts=1577198051321&imwidth=456&imdensity=1', '2020-06-19 20:58:18', NULL, 26, 21, 18),
(23, 'Pantalon', 49.99, 'Pantalon 100 % lin', 'Collection casual. 100 % lin. Structure à chevrons. Cordon intérieur de serrage à la taille. Il procure confort et liberté de mouvement. Pinces sur le devant. Fermeture Éclair avec bouton. Deux poches latérales. Deux poches passepoilées à l\'arrière.\r\nCouleur Écru\r\nIntérieur de la jambe long 69.6 cm.\r\nLongueur sous manche. 95.0 cm.\r\nComposition: 100% lin. Doublure poches: 100% coton', '', 'https://st.mngbcn.com/rcs/pics/static/T7/fotos/outfit/S20/77001004_05-99999999_01.jpg?ts=1591808641692&imwidth=456&imdensity=1', '2020-06-19 20:58:18', NULL, 20, 19, 21),
(24, 'Jean ', 39.99, 'Jean Tim slim-fit délavé moyen', 'Collection denim. Collection casual. Slim-fit. Délavé moyen. Deux poches latérales. Poche gousset. Deux poches plaquées à l\'arrière. Passants pour la ceinture. Fermeture boutonnée.\r\nCouelur Bleu moyen\r\nCOMPOSITION:99% COTON,1% ELASTHANNE', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/63100605_TM.jpg?ts=1582047454368&imwidth=456&imdensity=1', '2020-06-19 20:58:18', NULL, 25, 27, 29),
(25, 'Jean', 39.99, 'Jean Tim slim-fit délavé foncé effet usé', 'Collection denim. Collection casual. Slim-fit. Tissu en coton. Délavé foncé effet usé. Deux poches latérales. Poche gousset. Deux poches plaquées à l\'arrière. Passants pour la ceinture. Fermeture boutonnée.\r\nCouleur Bleu foncé\r\nIntérieur de la jambe long 79.0 cm.\r\nLongueur sous manche. 105.9 cm.\r\nComposition: 99% coton,1% elasthanne', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67076719_TO.jpg?ts=1583415251219&imwidth=456&imdensity=1', '2020-06-19 20:58:18', NULL, 30, 29, 26),
(26, 'Jean', 39.99, 'Jean Alex slim-fit coloré', 'Collection casual. Slim-fit. Tissu en coton style denim. Tissu en coton stretch. Deux poches latérales. Poche gousset. Deux poches plaquées à l\'arrière. Passants pour la ceinture. Fermeture Éclair avec bouton.\r\nCouleur Beige\r\nIntérieur de la jambe long 79.5 cm.\r\nLongueur sous manche. 102.0 cm.\r\nComposition: 97% coton,3% elasthanne', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/outfit/S20/67074411_08-99999999_01.jpg?ts=1582290524954&imwidth=456&imdensity=1', '2020-06-19 20:58:18', NULL, 25, 30, 22),
(27, 'Jean', 29.99, 'Jean Patrick slim fit bleu marine', 'Collection denim. Collection casual. Slim-fit. Couleur bleu foncé. Deux poches latérales. Poche gousset. Deux poches plaquées à l\'arrière. Passants pour la ceinture. Fermeture Éclair avec bouton.\r\nCouleur Bleu pétrole\r\nIntérieur de la jambe long 79.1 cm.\r\nLongueur sous manche. 102.0 cm.\r\nComposition: 98% coton,2% elasthanne', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67014389_59.jpg?ts=1576690446650&imwidth=456&imdensity=1', '2020-06-19 20:58:18', NULL, 29, 25, 30),
(28, 'Jean ', 29.99, 'Jean Jude skinny noir', 'Collection casual. Coupe skinny. Tissu en coton durable. Couleur noire. Deux poches latérales. Poche gousset. Deux poches plaquées à l\'arrière. Passants pour la ceinture. Fermeture Éclair avec bouton.\r\nCouleur Black denim\r\nIntérieur de la jambe long 76.4 cm.\r\nLongueur sous manche. 102.3 cm.\r\nComposition: 98% coton,2% elasthanne', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67010525_TN.jpg?ts=1572865445105&imwidth=456&imdensity=1', '2020-06-19 20:58:18', NULL, 29, 26, 25),
(29, 'Jean', 29.99, 'Jean Jude skinny délavé clair', 'Collection casual. Coupe skinny. Délavé clair effet usé. Passants pour la ceinture. Poche gousset. Fermeture Éclair avec bouton. Deux poches plaquées à l\'arrière. Deux poches latérales.\r\nCouleur Bleu clair \r\nIntérieur de la jambe long 75.5 cm.\r\nLongueur sous manche. 100.0 cm.\r\nComposition: 98% coton,2% elasthanne', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67020519_TC.jpg?ts=1574681709606&imwidth=456&imdensity=1', '2020-06-19 20:58:18', NULL, 28, 30, 25),
(30, 'Jean', 49.99, 'Jean slim-fit délavé clair', 'Collection casual. Slim-fit. Tissu en coton recyclé. Délavé clair effet usé. Deux poches latérales. Poche gousset. Deux poches plaquées à l\'arrière. Passants pour la ceinture. Fermeture Éclair avec bouton.\r\nCouleur Bleu clair\r\nIntérieur de la jambe long 76.5 cm.\r\nLongueur sous manche. 99.0 cm.\r\nComposition: 80% coton,20% coton recyclé', '', 'https://st.mngbcn.com/rcs/pics/static/T6/fotos/S20/67057891_TC.jpg?ts=1584954214851&imwidth=456&imdensity=1', '2020-06-19 20:58:18', NULL, 25, 29, 26);

-- --------------------------------------------------------

--
-- Structure de la table `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `note` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `rating`
--

INSERT INTO `rating` (`UserID`, `ProductID`, `note`) VALUES
(1, 2, 4),
(1, 9, 4),
(1, 4, 2),
(1, 6, 4),
(1, 8, 4),
(1, 15, 4),
(1, 12, 4),
(1, 7, 5),
(1, 1, 1),
(1, 28, 5),
(1, 26, 5),
(1, 30, 3),
(1, 19, 4),
(1, 23, 1),
(4, 5, 4),
(4, 13, 3),
(4, 20, 5),
(4, 19, 4),
(4, 29, 1),
(4, 30, 2),
(4, 26, 1),
(2, 4, 4),
(2, 12, 3),
(2, 13, 4),
(2, 18, 2),
(2, 26, 2),
(2, 30, 3),
(2, 25, 1),
(2, 22, 2),
(3, 6, 3),
(3, 5, 4),
(3, 12, 5),
(3, 17, 3),
(3, 14, 4),
(3, 16, 1),
(3, 2, 1),
(3, 7, 2),
(3, 1, 1),
(3, 8, 3),
(3, 19, 5),
(3, 23, 4),
(3, 21, 4),
(3, 26, 4),
(3, 22, 3),
(3, 25, 2),
(3, 30, 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserEmail` varchar(500) COLLATE latin1_german2_ci DEFAULT NULL,
  `UserPassword` varchar(500) COLLATE latin1_german2_ci DEFAULT NULL,
  `UserFirstName` varchar(50) COLLATE latin1_german2_ci DEFAULT NULL,
  `UserLastName` varchar(50) COLLATE latin1_german2_ci DEFAULT NULL,
  `UserCity` varchar(90) COLLATE latin1_german2_ci DEFAULT NULL,
  `UserState` varchar(20) COLLATE latin1_german2_ci DEFAULT NULL,
  `UserZip` varchar(12) COLLATE latin1_german2_ci DEFAULT NULL,
  `UserRegistrationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UserPhone` varchar(20) COLLATE latin1_german2_ci DEFAULT NULL,
  `UserAddress` varchar(100) COLLATE latin1_german2_ci DEFAULT NULL,
  `topUser` int(11) NOT NULL,
  `topP1` int(11) DEFAULT NULL,
  `topP2` int(11) DEFAULT NULL,
  `topP3` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_german2_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`UserID`, `UserEmail`, `UserPassword`, `UserFirstName`, `UserLastName`, `UserCity`, `UserState`, `UserZip`, `UserRegistrationDate`, `UserPhone`, `UserAddress`, `topUser`, `topP1`, `topP2`, `topP3`) VALUES
(1, 'mohamedaziztahri@gmail.com', '1234', 'aziz', 'tahri', NULL, NULL, NULL, '2020-05-09 01:28:19', NULL, NULL, 3, 5, 14, 17),
(2, 'chokritahri@gmail.com', '123456', 'chokri', 'tahri', 'tunis', 'tunisia', '1006', '2020-06-21 22:34:20', '2015478', '5 rue', 4, 5, 19, 20),
(3, 'amenguetif@gmail.com', 'amen123', 'amen', 'guetif', 'tunis', 'tunisia', '1006', '2020-06-24 13:41:45', '651515648', '5 rue', 1, 9, 15, 28),
(4, 'dali@gmail.com', 'dalitalieni', 'dali', 'mzoughi', 'tunis', 'tunisia', '1006', '2020-06-24 13:51:22', '6984217', '5 rue', 2, 4, 12, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
