-- phpMyAdmin SQL Dump
-- version 3.4.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Jeu 10 Novembre 2011 à 19:20
-- Version du serveur: 5.0.92
-- Version de PHP: 5.2.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de données: `thelia`
--

-- --------------------------------------------------------

--
-- Structure de la table `accessoire`
--

CREATE TABLE IF NOT EXISTS `accessoire` (
  `id` int(11) NOT NULL auto_increment,
  `produit` int(11) NOT NULL default '0',
  `accessoire` int(11) NOT NULL default '0',
  `classement` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `produit` (`produit`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `id` int(11) NOT NULL auto_increment,
  `identifiant` text NOT NULL,
  `motdepasse` text NOT NULL,
  `prenom` text NOT NULL,
  `nom` text NOT NULL,
  `profil` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=2 ;

--
-- Contenu de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `identifiant`, `motdepasse`, `prenom`, `nom`, `profil`, `lang`) VALUES
(1, 'admin', '1f0126492a19da5c', 'Admin', 'Admin', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

CREATE TABLE IF NOT EXISTS `adresse` (
  `id` int(11) NOT NULL auto_increment,
  `libelle` varchar(120) NOT NULL default '',
  `client` int(11) NOT NULL default '0',
  `raison` smallint(6) NOT NULL default '0',
  `entreprise` text NOT NULL,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `adresse1` varchar(40) NOT NULL default '',
  `adresse2` varchar(40) NOT NULL default '',
  `adresse3` varchar(40) NOT NULL default '',
  `cpostal` varchar(10) NOT NULL default '',
  `ville` varchar(30) NOT NULL default '',
  `tel` text NOT NULL,
  `pays` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `client` (`client`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `autorisation`
--

CREATE TABLE IF NOT EXISTS `autorisation` (
  `id` int(11) NOT NULL auto_increment,
  `nom` text NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=10 ;

--
-- Contenu de la table `autorisation`
--

INSERT INTO `autorisation` (`id`, `nom`, `type`) VALUES
(1, 'acces_clients', 1),
(2, 'acces_commandes', 1),
(3, 'acces_catalogue', 1),
(4, 'acces_contenu', 1),
(5, 'acces_codespromos', 1),
(6, 'acces_configuration', 1),
(7, 'acces_modules', 1),
(8, 'acces_rechercher', 1),
(9, 'acces_stats', 1);

-- --------------------------------------------------------

--
-- Structure de la table `autorisationdesc`
--

CREATE TABLE IF NOT EXISTS `autorisationdesc` (
  `id` int(11) NOT NULL auto_increment,
  `autorisation` int(11) NOT NULL,
  `titre` text NOT NULL,
  `chapo` text NOT NULL,
  `description` text NOT NULL,
  `postscriptum` text NOT NULL,
  `lang` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `autorisation` (`autorisation`,`lang`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=28 ;

--
-- Contenu de la table `autorisationdesc`
--

INSERT INTO `autorisationdesc` (`id`, `autorisation`, `titre`, `chapo`, `description`, `postscriptum`, `lang`) VALUES
(1, 1, 'Accès aux clients', '', '', '', 1),
(2, 2, 'Accès aux commandes', '', '', '', 1),
(3, 3, 'Accès au catalogue', '', '', '', 1),
(4, 4, 'Accès aux contenus', '', '', '', 1),
(5, 5, 'Accès aux codes promos', '', '', '', 1),
(6, 6, 'Accès à la configuration', '', '', '', 1),
(7, 7, 'Accès aux modules', '', '', '', 1),
(8, 8, 'Accès aux recherches', '', '', '', 1),
(9, 9, 'Accès aux statistiques de ventes', '', '', '', 1),
(10, 1, 'Customer access', '', '', '', 2),
(11, 2, 'Orders access', '', '', '', 2),
(12, 3, 'Catalog access', '', '', '', 2),
(13, 4, 'Content access', '', '', '', 2),
(14, 5, 'Coupon codes access', '', '', '', 2),
(15, 6, 'Configuration access', '', '', '', 2),
(16, 7, 'Plugins access', '', '', '', 2),
(17, 8, 'Search access', '', '', '', 2),
(18, 9, 'Stats access', '', '', '', 2),
(19, 1, 'Acceso a los clientes', '', '', '', 3),
(20, 2, 'Acceso a los pedidos', '', '', '', 3),
(21, 3, 'Acceso al catalogo', '', '', '', 3),
(22, 4, 'Acceso a los contenidos', '', '', '', 3),
(23, 5, 'Acceso a los codigos promocionales', '', '', '', 3),
(24, 6, 'Acceso a la configuración', '', '', '', 3),
(25, 7, 'Acceso a los modulos', '', '', '', 3),
(26, 8, 'Acceso a las búsquedas', '', '', '', 3),
(27, 9, 'Acceso a las estadísticas de ventas', '', '', '', 3);

-- --------------------------------------------------------

--
-- Structure de la table `autorisation_administrateur`
--

CREATE TABLE IF NOT EXISTS `autorisation_administrateur` (
  `id` int(11) NOT NULL auto_increment,
  `administrateur` int(11) NOT NULL,
  `autorisation` int(11) NOT NULL,
  `lecture` smallint(6) NOT NULL,
  `ecriture` smallint(6) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `administrateur` (`administrateur`),
  KEY `autorisation` (`autorisation`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `autorisation_modules`
--

CREATE TABLE IF NOT EXISTS `autorisation_modules` (
  `id` int(11) NOT NULL auto_increment,
  `administrateur` int(11) NOT NULL,
  `module` int(11) NOT NULL,
  `autorise` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `administrateur` (`administrateur`),
  KEY `module` (`module`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `autorisation_profil`
--

CREATE TABLE IF NOT EXISTS `autorisation_profil` (
  `id` int(11) NOT NULL auto_increment,
  `profil` int(11) NOT NULL,
  `autorisation` int(11) NOT NULL,
  `lecture` int(11) NOT NULL,
  `ecriture` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `profil` (`profil`),
  KEY `autorisation` (`autorisation`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=10 ;

--
-- Contenu de la table `autorisation_profil`
--

INSERT INTO `autorisation_profil` (`id`, `profil`, `autorisation`, `lecture`, `ecriture`) VALUES
(1, 2, 1, 1, 1),
(2, 2, 2, 1, 1),
(3, 2, 7, 1, 1),
(4, 2, 8, 1, 1),
(5, 3, 3, 1, 1),
(6, 3, 4, 1, 1),
(7, 3, 5, 1, 1),
(8, 3, 7, 1, 1),
(9, 3, 8, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `caracdisp`
--

CREATE TABLE IF NOT EXISTS `caracdisp` (
  `id` int(11) NOT NULL auto_increment,
  `caracteristique` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `caracteristique` (`caracteristique`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `caracdispdesc`
--

CREATE TABLE IF NOT EXISTS `caracdispdesc` (
  `id` int(11) NOT NULL auto_increment,
  `caracdisp` int(11) NOT NULL default '0',
  `lang` int(11) NOT NULL default '0',
  `titre` text NOT NULL,
  `classement` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `caracdisp` (`caracdisp`,`lang`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `caracteristique`
--

CREATE TABLE IF NOT EXISTS `caracteristique` (
  `id` int(11) NOT NULL auto_increment,
  `affiche` int(11) NOT NULL default '0',
  `classement` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `affiche` (`affiche`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `caracteristiquedesc`
--

CREATE TABLE IF NOT EXISTS `caracteristiquedesc` (
  `id` int(11) NOT NULL auto_increment,
  `caracteristique` int(11) NOT NULL default '0',
  `lang` int(11) NOT NULL default '0',
  `titre` text NOT NULL,
  `chapo` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `caracteristique` (`caracteristique`,`lang`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `caracval`
--

CREATE TABLE IF NOT EXISTS `caracval` (
  `id` int(11) NOT NULL auto_increment,
  `produit` int(11) NOT NULL default '0',
  `caracteristique` int(11) NOT NULL default '0',
  `caracdisp` int(11) NOT NULL default '0',
  `valeur` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `caracteristique` (`caracteristique`,`caracdisp`),
  KEY `caracteristique_valeur` (`caracteristique`,`valeur`(64)),
  KEY `caracteristique_produit` (`caracteristique`,`produit`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL auto_increment,
  `ref` text NOT NULL,
  `datecrea` DATETIME NOT NULL,
  `raison` smallint(6) NOT NULL default '0',
  `entreprise` text NOT NULL,
  `siret` text NOT NULL,
  `intracom` text NOT NULL,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `adresse1` varchar(40) NOT NULL default '',
  `adresse2` varchar(40) NOT NULL default '',
  `adresse3` varchar(40) NOT NULL default '',
  `cpostal` varchar(10) NOT NULL default '',
  `ville` varchar(30) NOT NULL default '',
  `pays` mediumint(9) NOT NULL default '0',
  `telfixe` text NOT NULL,
  `telport` text NOT NULL,
  `email` text NOT NULL,
  `motdepasse` text NOT NULL,
  `parrain` int(11) NOT NULL default '0',
  `type` smallint(6) NOT NULL default '0',
  `pourcentage` int(11) NOT NULL default '0',
  `lang` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ref` (`ref`(30))
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL auto_increment,
  `client` int(11) NOT NULL default '0',
  `adrfact` int(11) NOT NULL,
  `adrlivr` int(11) NOT NULL default '0',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `datefact` date NOT NULL default '0000-00-00',
  `ref` text NOT NULL,
  `transaction` text NOT NULL,
  `livraison` text NOT NULL,
  `facture` text NOT NULL,
  `transport` int(11) NOT NULL default '0',
  `port` float NOT NULL default '0',
  `datelivraison` date NOT NULL default '0000-00-00',
  `remise` float NOT NULL default '0',
  `devise` int(11) NOT NULL,
  `taux` float NOT NULL,
  `colis` text NOT NULL,
  `paiement` int(11) NOT NULL default '0',
  `statut` smallint(6) NOT NULL default '0',
  `lang` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `client` (`client`),
  KEY `ref` (`ref`(30))
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `contenu`
--

CREATE TABLE IF NOT EXISTS `contenu` (
  `id` int(11) NOT NULL auto_increment,
  `datemodif` datetime NOT NULL default '0000-00-00 00:00:00',
  `dossier` int(11) NOT NULL default '0',
  `ligne` smallint(6) NOT NULL default '0',
  `classement` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `dossier` (`dossier`),
  KEY `ligne` (`ligne`),
  KEY `id_ligne` (`id`,`ligne`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `contenuassoc`
--

CREATE TABLE IF NOT EXISTS `contenuassoc` (
  `id` int(11) NOT NULL auto_increment,
  `objet` int(11) NOT NULL default '0',
  `type` int(11) NOT NULL default '0',
  `contenu` int(11) NOT NULL default '0',
  `classement` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `objet` (`objet`,`type`,`contenu`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `contenudesc`
--

CREATE TABLE IF NOT EXISTS `contenudesc` (
  `id` int(11) NOT NULL auto_increment,
  `contenu` int(11) NOT NULL default '0',
  `lang` int(11) NOT NULL default '0',
  `titre` text NOT NULL,
  `chapo` text NOT NULL,
  `description` text NOT NULL,
  `postscriptum` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `contenu` (`contenu`,`lang`),
  FULLTEXT KEY `recherche` (`titre`,`chapo`,`description`,`postscriptum`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `declidisp`
--

CREATE TABLE IF NOT EXISTS `declidisp` (
  `id` int(11) NOT NULL auto_increment,
  `declinaison` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `declinaison` (`declinaison`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `declidispdesc`
--

CREATE TABLE IF NOT EXISTS `declidispdesc` (
  `id` int(11) NOT NULL auto_increment,
  `declidisp` int(11) NOT NULL default '0',
  `lang` int(11) NOT NULL default '0',
  `titre` text NOT NULL,
  `classement` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `declidisp` (`declidisp`,`lang`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `declinaison`
--

CREATE TABLE IF NOT EXISTS `declinaison` (
  `id` int(11) NOT NULL auto_increment,
  `classement` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `declinaisondesc`
--

CREATE TABLE IF NOT EXISTS `declinaisondesc` (
  `id` int(11) NOT NULL auto_increment,
  `declinaison` int(11) NOT NULL default '0',
  `lang` int(11) NOT NULL default '0',
  `titre` text NOT NULL,
  `chapo` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `declinaison` (`declinaison`,`lang`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `devise`
--

CREATE TABLE IF NOT EXISTS `devise` (
  `id` int(11) NOT NULL auto_increment,
  `nom` text NOT NULL,
  `code` text NOT NULL,
  `symbole` text NOT NULL,
  `taux` float NOT NULL default '0',
  `defaut` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM  AUTO_INCREMENT=4 ;

--
-- Contenu de la table `devise`
--

INSERT INTO `devise` (`id`, `nom`, `code`, `symbole`, `taux`, `defaut`) VALUES
(1, 'euro', 'EUR', '€', 1, 1),
(2, 'dollar', 'USD', '$', 1.26, 0),
(3, 'livre', 'GBP', '£', 0.89, 0);

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE IF NOT EXISTS `document` (
  `id` int(11) NOT NULL auto_increment,
  `produit` int(11) NOT NULL default '0',
  `rubrique` int(11) NOT NULL default '0',
  `contenu` int(11) NOT NULL default '0',
  `dossier` int(11) NOT NULL default '0',
  `fichier` text NOT NULL,
  `classement` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `produit` (`produit`),
  KEY `rubrique` (`rubrique`),
  KEY `contenu` (`contenu`),
  KEY `dossier` (`dossier`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `documentdesc`
--

CREATE TABLE IF NOT EXISTS `documentdesc` (
  `id` int(11) NOT NULL auto_increment,
  `document` int(11) NOT NULL default '0',
  `lang` int(11) NOT NULL default '0',
  `titre` text NOT NULL,
  `chapo` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `document` (`document`,`lang`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `dossier`
--

CREATE TABLE IF NOT EXISTS `dossier` (
  `id` int(11) NOT NULL auto_increment,
  `parent` int(11) NOT NULL default '0',
  `lien` text NOT NULL,
  `ligne` smallint(6) NOT NULL default '0',
  `classement` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `parent` (`parent`),
  KEY `ligne` (`ligne`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `dossierdesc`
--

CREATE TABLE IF NOT EXISTS `dossierdesc` (
  `id` int(11) NOT NULL auto_increment,
  `dossier` int(11) NOT NULL default '0',
  `lang` int(11) NOT NULL default '0',
  `titre` text NOT NULL,
  `chapo` text NOT NULL,
  `description` text NOT NULL,
  `postscriptum` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `dossier` (`dossier`,`lang`),
  FULLTEXT KEY `recherche` (`titre`,`chapo`,`description`,`postscriptum`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `exdecprod`
--

CREATE TABLE IF NOT EXISTS `exdecprod` (
  `id` int(11) NOT NULL auto_increment,
  `produit` int(11) NOT NULL default '0',
  `declidisp` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `declidisp` (`declidisp`),
  KEY `produit` (`declidisp`,`produit`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL auto_increment,
  `produit` int(11) NOT NULL default '0',
  `rubrique` int(11) NOT NULL default '0',
  `contenu` int(11) NOT NULL default '0',
  `dossier` int(11) NOT NULL default '0',
  `fichier` text NOT NULL,
  `classement` int(6) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `produit` (`produit`),
  KEY `rubrique` (`rubrique`),
  KEY `contenu` (`contenu`),
  KEY `dossier` (`dossier`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `imagedesc`
--

CREATE TABLE IF NOT EXISTS `imagedesc` (
  `id` int(11) NOT NULL auto_increment,
  `image` int(11) NOT NULL default '0',
  `lang` int(11) NOT NULL default '0',
  `titre` text NOT NULL,
  `chapo` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `image` (`image`,`lang`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `lang`
--

CREATE TABLE IF NOT EXISTS `lang` (
  `id` int(11) NOT NULL auto_increment,
  `description` text NOT NULL,
  `code` varchar(2) NOT NULL,
  `url` varchar(255) NOT NULL,
  `defaut` smallint(6) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `defaut` (`defaut`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=5 ;

--
-- Contenu de la table `lang`
--

INSERT INTO `lang` (`id`, `description`, `code`, `url`, `defaut`) VALUES
(1, 'Français', 'fr', '', 1),
(2, 'English', 'en', '', 0),
(3, 'Espanol', 'es', '', 0),
(4, 'Italiano', 'it', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL auto_increment,
  `nom` text NOT NULL,
  `protege` smallint(6) NOT NULL,
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=6 ;

--
-- Contenu de la table `message`
--

INSERT INTO `message` (`id`, `nom`, `protege`) VALUES
(1, 'changepass', 0),
(2, 'mailconfirmcli', 0),
(3, 'mailconfirmadm', 0),
(4, 'creation_client', 0);

-- --------------------------------------------------------

--
-- Structure de la table `messagedesc`
--

CREATE TABLE IF NOT EXISTS `messagedesc` (
  `id` int(11) NOT NULL auto_increment,
  `message` int(11) NOT NULL default '0',
  `lang` int(11) NOT NULL default '0',
  `intitule` text NOT NULL,
  `titre` text NOT NULL,
  `chapo` text NOT NULL,
  `description` text NOT NULL,
  `descriptiontext` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `message` (`message`,`lang`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=6 ;

--
-- Contenu de la table `messagedesc`
--

INSERT INTO `messagedesc` (`id`, `message`, `lang`, `intitule`, `titre`, `chapo`, `description`, `descriptiontext`) VALUES
(1, 1, 1, 'Mail de changement de mot de passe', 'Votre nouveau mot de passe', '', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="fr">\r\n<head>\r\n<meta http-equiv="Content-Type" content="text/html| charset=utf-8"  />\r\n<title>courriel de confirmation de changement de mot de passe de __URLSITE__ </title>\r\n<style type="text/css">\r\nbody {font-family: Arial, Helvetica, sans-serif|font-size:100%|text-align:center|}\r\n#liencompte {margin:25px 0 |text-align: middle|font-size:10pt|}\r\n#wrapper {width:480pt|margin:0 auto|}\r\n#entete {padding-bottom:20px|margin-bottom:10px|border-bottom:1px dotted #000|}\r\n#logotexte {float:left|width:180pt|height:75pt|border:1pt solid #000|font-size:18pt|text-align:center|}\r\n#logoimg{float:left|}\r\n#h2 {margin:0|padding:0|font-size:140%|text-align:center|}\r\n#h3 {margin:0|padding:0|font-size:120%|text-align:center|}\r\n\r\n</style>\r\n</head>\r\n<body>\r\n<div id="wrapper">\r\n<div id="entete">\r\n<h1 id="logotexte">__NOMSITE__</h1>\r\n<h2 id="info">Changement de mot de passe</h2>\r\n<h5 id="mdp"> Vous avez perdu votre mot de passe. <br />\r\n\r\nVotre nouveau mot de passe est <span style="font-size:80%">__MOTDEPASSE__</span>.</h5>\r\n</div>\r\n</div>\r\n<p id="liencompte">Vous  pouvez &agrave| pr&eacute|sent vous connecter sur <a href="__URLSITE__">__URLSITE__</a>.<br /> N''oubliez pas de modifier votre mot de passe.</p>\r\n\r\n</body>\r\n\r\n</html>', 'Votre nouveau mot de passe est : __MOTDEPASSE__'),
(2, 2, 1, 'Mail de confirmation client', 'Commande : __COMMANDE_REF__', '', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="fr">\r\n<head>\r\n<meta http-equiv="Content-Type" content="text/html| charset=utf-8"  />\r\n<title>courriel de confirmation de commande de __URLSITE__ </title>\r\n<style type="text/css">\r\nbody {font-family: Arial, Helvetica, sans-serif|font-size:100%|text-align:center|}\r\n#liencompte {margin:15px 0 |text-align:center|font-size:10pt|}\r\n#wrapper {width:480pt|margin:0 auto|}\r\n#entete {padding-bottom:20px|margin-bottom:10px|border-bottom:1px dotted #000|}\r\n#logotexte {float:left|width:180pt|height:75pt|border:1pt solid #000|font-size:18pt|text-align:center|}\r\n#logoimg{float:left|}\r\n#h2 {margin:0|padding:0|font-size:140%|text-align:center|}\r\n#h3 {margin:0|padding:0|font-size:120%|text-align:center|}\r\n#tableprix {margin:0 auto|border-collapse:collapse|font-size:80%|}\r\n#intitules {font-weight:bold|text-align:center|}\r\n#ref {width:65pt|border:1px solid #000|}\r\n#designation {width:278pt|border:1px solid #000|}\r\n#pu {width:65pt|border:1px solid #000|}\r\n#qte {width:60pt|border:1px solid #000|}\r\n.ligneproduit{font-weight:normal|}\r\n.cellref{text-align:right|padding-right:6pt|border:1px solid #000|}\r\n.celldsg{text-align:left|padding-left:6pt|border:1px solid #000|}\r\n.cellpu{text-align:right|padding-right:6pt|border:1px solid #000|}\r\n.cellqte{text-align:right|padding-right:6pt|border:1px solid #000|}\r\n.lignevide{border-bottom:1px solid #000|}\r\n.totauxtitre{text-align:right|padding-right:6pt|border-left:1px solid #000|}\r\n.totauxcmdtitre{text-align:right|padding-right:6pt|border-left:1px solid #000|border-bottom:1px solid #000|}\r\n.totauxprix{text-align:right|padding-right:6pt|border:1px solid #000|}\r\n.blocadresses{display:inline|float:left|width:228pt|margin:12pt 4pt 12pt 5pt|font-size:80%|line-height:18pt|text-align:left|border:1px solid #000|}\r\n.stylenom{margin:0|padding:0 0 0 10pt|border-bottom:1px solid #000|}\r\n.styleliste{margin:0|padding:0 0 0 10pt|}\r\n\r\n</style>\r\n</head>\r\n<body>\r\n<div id="wrapper">\r\n<div id="entete">\r\n<h1 id="logotexte">__NOMSITE__</h1>\r\n<h2 id="info">Confirmation de commande</h2>\r\n<h3 id="commande">N&deg| __COMMANDE_REF__ du <span style="font-size:80%">__COMMANDE_DATE__</span></h3>\r\n\r\n</div>\r\n<table id="tableprix" border="0">\r\n<tbody>\r\n<tr id="intitules">\r\n<th id="ref">R&eacute|f&eacute|rence</th> <th id="designation">D&eacute|signation</th> <th id="pu">P.U.  &euro|</th> <th id="qte">Qt&eacute|</th>\r\n</tr>\r\n<VENTEPROD>\r\n\r\n<tr class="ligneproduit">\r\n<td class="cellref">__VENTEPROD_REF__</td>\r\n<td class="celldsg">__VENTEPROD_TITRE__</td>\r\n<td class="cellpu">__VENTEPROD_PRIXU__</td>\r\n<td class="cellqte">__VENTEPROD_QUANTITE__</td>\r\n</tr>\r\n</VENTEPROD>\r\n<!-- insere une ligne vide --> \r\n<tr class="ligneproduit">\r\n<td class="lignevide" colspan="4">&nbsp|</td>\r\n</tr>\r\n<tr class="ligneproduit">\r\n<td class="totauxtitre" colspan="3">Montant total avant remise  &euro|</td>\r\n\r\n<td class="totauxprix">__COMMANDE_TOTAL__</td>\r\n</tr>\r\n<tr class="ligneproduit">\r\n<td class="totauxtitre" colspan="3">Remise  &euro|</td>\r\n<td class="totauxprix">__COMMANDE_REMISE__</td>\r\n</tr>\r\n<tr class="ligneproduit">\r\n<td class="totauxtitre" colspan="3">Port  &euro|</td>\r\n<td class="totauxprix">__COMMANDE_PORT__</td>\r\n</tr>\r\n<tr class="ligneproduit">\r\n<td class="totauxcmdtitre" colspan="3">Montant total de la commande &euro|</td>\r\n\r\n<td class="totauxprix">__COMMANDE_TOTALPORT__</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div class="blocadresses">\r\n<p class="stylenom">LIVRAISON : __COMMANDE_TRANSPORT__</p>\r\n<p class="styleliste">&nbsp|</p>\r\n<p class="styleliste">Nom : __COMMANDE_LIVRRAISON__ __COMMANDE_LIVRPRENOM__ __COMMANDE_LIVRNOM__</p>\r\n<p class="styleliste">N&deg| et rue : __COMMANDE_LIVRADRESSE1__</p>\r\n<p class="styleliste">Compl&eacute|ment : __COMMANDE_LIVRADRESSE2__ __COMMANDE_LIVRADRESSE3__</p>\r\n\r\n<p class="styleliste">Code postal : __COMMANDE_LIVRCPOSTAL__</p>\r\n<p class="styleliste">Ville : __COMMANDE_LIVRVILLE__</p>\r\n<p class="styleliste">Pays : __COMMANDE_LIVRPAYS__</p>\r\n</div>\r\n<div class="blocadresses">\r\n<p class="stylenom">FACTURATION : paiement par __COMMANDE_PAIEMENT__</p>\r\n<p class="styleliste">N&deg| de client : __CLIENT_REF__</p>\r\n<p class="styleliste">Nom : __CLIENT_RAISON__  __CLIENT_FACTPRENOM__  __CLIENT_FACTNOM__</p>\r\n<p class="styleliste">N&deg| et rue : __CLIENT_ADRESSE1__</p>\r\n\r\n<p class="styleliste">Compl&eacute|ment : __CLIENT_ADRESSE2__ __CLIENT_ADRESSE3__</p>\r\n<p class="styleliste">Code postal : __CLIENT_CPOSTAL__</p>\r\n<p class="styleliste">Ville : __CLIENT_VILLE__</p>\r\n<p class="styleliste">Pays : __CLIENT_PAYS__</p>\r\n</div>\r\n<p id="liencompte">Le suivi de votre commande est disponible dans la rubrique mon compte sur <a href="__URLSITE__">__URLSITE__</a></p>\r\n</div>\r\n</body>\r\n</html>', '__CLIENT_REF__ __CLIENT_FACTPRENOM__ __CLIENT_FACTNOM__\r\n__CLIENT_ADRESSE1__ __CLIENT_ADRESSE2__ __CLIENT_ADRESSE3__\r\n__CLIENT_CPOSTAL__ __CLIENT_VILLE__\r\n__CLIENT_PAYS__\r\n\r\nConfirmation de commande __COMMANDE_REF__ du __COMMANDE_DATE__\r\n\r\nLes articles commandés:\r\n<VENTEPROD>\r\nArticle : __VENTEPROD_TITRE__\r\nQuantité : __VENTEPROD_QUANTITE__\r\nPrix unitaire TTC  : __VENTEPROD_PRIXU__ EUR\r\n</VENTEPROD>\r\n-----------------------------------------\r\nMontant total TTC :    __COMMANDE_TOTAL__ EUR \r\nFrais de port TTC :    __COMMANDE_PORT__ EUR \r\nSomme totale:            __COMMANDE_TOTALPORT__ EUR \r\n==================================\r\n\r\nVotre facture est disponible dans la rubrique mon compte sur __URLSITE__'),
(3, 3, 1, 'Mail de confirmation administrateur', 'Nouvelle commande', '', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="fr">\r\n<head>\r\n<meta http-equiv="Content-Type" content="text/html| charset=utf-8"  />\r\n<title>courriel de confirmation de commande de __URLSITE__ </title>\r\n<style type="text/css">\r\nbody {font-family: Arial, Helvetica, sans-serif|font-size:100%|text-align:center|}\r\n#liencompte {margin:15px 0 |text-align:center|font-size:10pt|}\r\n#wrapper {width:480pt|margin:0 auto|}\r\n#entete {padding-bottom:10px|margin-bottom:10px|border-bottom:1px dotted #000|}\r\n#logotexte {float:left|width:180pt|height:75pt|border:1pt solid #000|font-size:18pt|text-align:center|}\r\n#logoimg{float:left|}\r\n#h2 {margin:0|padding:0|font-size:140%|text-align:center|}\r\n#h3 {margin:0|padding:0|font-size:120%|text-align:center|}\r\n#tableprix {margin:0 auto|border-collapse:collapse|font-size:80%|}\r\n#intitules {font-weight:bold|text-align:center|}\r\n#ref {width:65pt|border:1px solid #000|}\r\n#designation {width:278pt|border:1px solid #000|}\r\n#pu {width:65pt|border:1px solid #000|}\r\n#qte {width:60pt|border:1px solid #000|}\r\n.ligneproduit{font-weight:normal|}\r\n.cellref{text-align:right|padding-right:6pt|border:1px solid #000|}\r\n.celldsg{text-align:left|padding-left:6pt|border:1px solid #000|}\r\n.cellpu{text-align:right|padding-right:6pt|border:1px solid #000|}\r\n.cellqte{text-align:right|padding-right:6pt|border:1px solid #000|}\r\n.lignevide{border-bottom:1px solid #000|}\r\n.totauxtitre{text-align:right|padding-right:6pt|border-left:1px solid #000|}\r\n.totauxcmdtitre{text-align:right|padding-right:6pt|border-left:1px solid #000|border-bottom:1px solid #000|}\r\n.totauxprix{text-align:right|padding-right:6pt|border:1px solid #000|}\r\n.blocadresses{display:inline|float:left|width:228pt|margin:12pt 4pt 12pt 5pt|font-size:80%|line-height:18pt|text-align:left|border:1px solid #000|}\r\n.stylenom{margin:0|padding:0 0 0 10pt|border-bottom:1px solid #000|}\r\n.styleliste{margin:0|padding:0 0 0 10pt|}\r\n\r\n</style>\r\n</head>\r\n<body>\r\n<div id="wrapper">\r\n<div id="entete">\r\n<h1 id="logotexte">__NOMSITE__</h1>\r\n<h2 id="info">Une nouvelle commande a &eacute|t&eacute| pass&eacute|e</h2>\r\n\r\n<h3 id="commande">N&deg| __COMMANDE_REF__ du <span style="font-size:80%">__COMMANDE_DATE__</span></h3>\r\n</div>\r\n<table id="tableprix" border="0">\r\n<tbody>\r\n<tr id="intitules">\r\n<th id="ref">R&eacute|f&eacute|rence</th> <th id="designation">D&eacute|signation</th> <th id="pu">P.U.  &euro|</th> <th id="qte">Qt&eacute|</th>\r\n\r\n</tr>\r\n<VENTEPROD>\r\n<tr class="ligneproduit">\r\n<td class="cellref">__VENTEPROD_REF__</td>\r\n<td class="celldsg">__VENTEPROD_TITRE__</td>\r\n<td class="cellpu">__VENTEPROD_PRIXU__</td>\r\n<td class="cellqte">__VENTEPROD_QUANTITE__</td>\r\n</tr>\r\n</VENTEPROD>\r\n<!-- insere une ligne vide --> \r\n<tr class="ligneproduit">\r\n<td class="lignevide" colspan="4">&nbsp|</td>\r\n</tr>\r\n\r\n<tr class="ligneproduit">\r\n<td class="totauxtitre" colspan="3">Montant total avant remise  &euro|</td>\r\n<td class="totauxprix">__COMMANDE_TOTAL__</td>\r\n</tr>\r\n<tr class="ligneproduit">\r\n<td class="totauxtitre" colspan="3">Remise  &euro|</td>\r\n<td class="totauxprix">__COMMANDE_REMISE__</td>\r\n</tr>\r\n<tr class="ligneproduit">\r\n<td class="totauxtitre" colspan="3">Port  &euro|</td>\r\n<td class="totauxprix">__COMMANDE_PORT__</td>\r\n\r\n</tr>\r\n<tr class="ligneproduit">\r\n<td class="totauxcmdtitre" colspan="3">Montant total de la commande &euro|</td>\r\n<td class="totauxprix">__COMMANDE_TOTALPORT__</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<div class="blocadresses">\r\n<p class="stylenom">LIVRAISON : __COMMANDE_TRANSPORT__</p>\r\n<p class="styleliste">&nbsp|</p>\r\n<p class="styleliste">Nom : __COMMANDE_LIVRRAISON__ __COMMANDE_LIVRPRENOM__ __COMMANDE_LIVRNOM__</p>\r\n<p class="styleliste">N&deg| et rue : __COMMANDE_LIVRADRESSE1__</p>\r\n\r\n<p class="styleliste">Compl&eacute|ment : __COMMANDE_LIVRADRESSE2__ __COMMANDE_LIVRADRESSE3__</p>\r\n<p class="styleliste">Code postal : __COMMANDE_LIVRCPOSTAL__</p>\r\n<p class="styleliste">Ville : __COMMANDE_LIVRVILLE__</p>\r\n<p class="styleliste">Pays : __COMMANDE_LIVRPAYS__</p>\r\n</div>\r\n<div class="blocadresses">\r\n<p class="stylenom">FACTURATION : paiement par __COMMANDE_PAIEMENT__</p>\r\n<p class="styleliste">N&deg| de client : __CLIENT_REF__</p>\r\n\r\n<p class="styleliste">Nom : __CLIENT_RAISON__  __CLIENT_FACTPRENOM__  __CLIENT_FACTNOM__</p>\r\n<p class="styleliste">N&deg| et rue : __CLIENT_ADRESSE1__</p>\r\n<p class="styleliste">Compl&eacute|ment : __CLIENT_ADRESSE2__ __CLIENT_ADRESSE3__</p>\r\n<p class="styleliste">Code postal : __CLIENT_CPOSTAL__</p>\r\n<p class="styleliste">Ville : __CLIENT_VILLE__</p>\r\n<p class="styleliste">Pays : __CLIENT_PAYS__</p>\r\n</div>\r\n<p id="liencompte"><a href="__URLSITE__">__URLSITE__</a></p>\r\n\r\n</div>\r\n</body>\r\n</html>', 'Nouvelle commande\r\n\r\n__CLIENT_REF__ __CLIENT_FACTPRENOM__ __CLIENT_FACTNOM__\r\n__CLIENT_ADRESSE1__ __CLIENT_ADRESSE2__ __CLIENT_ADRESSE3__\r\n__CLIENT_CPOSTAL__ __CLIENT_VILLE__\r\n__CLIENT_PAYS__\r\n\r\nConfirmation de commande __COMMANDE_REF__ du __COMMANDE_DATE__\r\n\r\nLes articles commandés:\r\n<VENTEPROD>\r\nArticle : __VENTEPROD_TITRE__\r\nQuantité : __VENTEPROD_QUANTITE__\r\nPrix unitaire TTC  : __VENTEPROD_PRIXU__ EUR\r\n</VENTEPROD>\r\n-----------------------------------------\r\nMontant total TTC :    __COMMANDE_TOTAL__ EUR \r\nFrais de port TTC :    __COMMANDE_PORT__ EUR \r\nSomme totale:            __COMMANDE_TOTALPORT__ EUR \r\n==================================\r\n'),
(4, 4, 1, 'Création compte client', 'Création compte client', '', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="fr">\r\n<head>\r\n<meta http-equiv="Content-Type" content="text/html| charset=utf-8"  />\r\n<title>courriel de confirmation de cr&eacute|ation de compte sur __URLSITE__ </title>\r\n<style type="text/css">\r\nbody {font-family: Arial, Helvetica, sans-serif|font-size:100%|text-align:center|}\r\n#liencompte {margin:25px 0 |text-align: middle|font-size:10pt|}\r\n#wrapper {width:480pt|margin:0 auto|}\r\n#entete {padding-bottom:30px|margin-bottom:10px|border-bottom:1px dotted #000|}\r\n#logotexte {float:left|width:180pt|height:100pt|border:1pt solid #000|font-size:18pt|text-align:center|}\r\n#logoimg{float:left|}\r\n#h2 {margin:0|padding:0|font-size:140%|text-align:center|}\r\n#h4 {margin:0|padding:0|font-size:120%|text-align:center|}\r\n#info3 {font-size:80%|}\r\n.bloccpt{width:480pt|margin:12pt auto|font-size:80%|line-height:18pt|text-align:left|border:1px solid #000|}\r\n.stylenom{margin:0|padding:0 0 0 10pt|border-bottom:1px solid #000|}\r\n.styleliste{margin:0|padding:0 0 0 10pt|}\r\n.styleadr{margin:0|padding:0 0 0 55pt|}\r\n.titre{margin-top:30px|font-size:80%|}\r\n</style>\r\n</head>\r\n<body>\r\n<div id="wrapper">\r\n<div id="entete">\r\n<h1 id="logotexte">__NOMSITE__</h1>\r\n<h2 id="info">Cr&eacute|ation de compte</h2>\r\n\r\n<h4 id="info2"> Vous avez cr&eacute|&eacute| un compte sur <a href="__URLSITE__">__NOMSITE__</a>.</h4>\r\n<h5 id="info3">\r\nvotre identifiant : __EMAIL__ <br />\r\nvotre mot de passe : __MOTDEPASSE__\r\n</h5>\r\n</div>\r\n</div>\r\n<p class="titre"> R&eacute|capitulatif de votre compte :</p>\r\n\r\n<div class="bloccpt">\r\n<p class="stylenom"> __CIVILITE__ __NOM__ __PRENOM__</p>\r\n<p class="styleliste">Adresse : __ADRESSE1__</p>\r\n<p class="styleadr"> __ADRESSE2__</p>\r\n<p class="styleadr"> __ADRESSE3__</p>\r\n<p class="styleliste">Code postal : __CPOSTAL__</p>\r\n<p class="styleliste">Ville : __VILLE__</p>\r\n<p class="styleliste">Pays : __PAYS__</p>\r\n\r\n<p class="styleliste">T&eacute|l&eacute|phone : __TELEPHONE__</p>\r\n<p class="styleliste">email : __EMAIL__</p>\r\n</div>\r\n<p id="liencompte">Vous  pouvez &agrave| pr&eacute|sent vous connecter sur <a href="__URLSITE__">__URLSITE__</a>.</p>\r\n\r\n</body>\r\n</html>', 'Bonjour,\r\n Vous recevez ce mail pour vous avertir que votre compte vient d''être crée sur __NOMSITE__.\r\n \r\n Vos identifiants sont les suivants :\r\n \r\n e-mail : __EMAIL__\r\n mot de passe : __MOTDEPASSE__\r\n \r\n Vous pouvez modifier ces informations sur le <a href="__URLSITE__">site</a>');

-- --------------------------------------------------------

--
-- Structure de la table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(11) NOT NULL auto_increment,
  `nom` text NOT NULL,
  `type` smallint(6) NOT NULL,
  `actif` smallint(6) NOT NULL,
  `classement` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `type` (`type`),
  KEY `actif` (`actif`),
  KEY `nom` (`nom`(64)),
  KEY `type_nom` (`type`,`actif`,`nom`(64))
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `modulesdesc`
--

CREATE TABLE IF NOT EXISTS `modulesdesc` (
  `id` int(11) NOT NULL auto_increment,
  `plugin` text NOT NULL,
  `lang` int(11) NOT NULL default '0',
  `titre` text NOT NULL,
  `chapo` text NOT NULL,
  `description` text NOT NULL,
  `devise` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `plugin` (`plugin`(64),`lang`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--
CREATE TABLE IF NOT EXISTS `pays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` int(11) NOT NULL DEFAULT '0',
  `zone` int(11) NOT NULL DEFAULT '0',
  `defaut` int(11) NOT NULL,
  `tva` smallint(6) NOT NULL,
  `isocode` varchar(4) NOT NULL DEFAULT '',
  `isoalpha2` varchar(2) NOT NULL DEFAULT '',
  `isoalpha3` varchar(4) NOT NULL DEFAULT '',
  `boutique` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `zone` (`zone`),
  KEY `defaut` (`defaut`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM;

--
-- Contenu de la table `pays`
--

INSERT INTO `pays` (`id`, `lang`, `zone`, `defaut`, `tva`, `isocode`, `isoalpha2`, `isoalpha3`, `boutique`) VALUES
(1, 2, 9, 0, 0, '004', 'AF', 'AFG', 0),
(2, 2, 8, 0, 0, '710', 'ZA', 'ZAF', 0),
(3, 2, 7, 0, 0, '008', 'AL', 'ALB', 0),
(4, 2, 7, 0, 0, '012', 'DZ', 'DZA', 0),
(5, 2, 2, 0, 1, '276', 'DE', 'DEU', 0),
(6, 1, 1, 0, 0, '020', 'AD', 'AND', 0),
(7, 2, 8, 0, 0, '024', 'AO', 'AGO', 0),
(8, 2, 9, 0, 0, '028', 'AG', 'ATG', 0),
(9, 2, 8, 0, 0, '682', 'SA', 'SAU', 0),
(10, 3, 9, 0, 0, '032', 'AR', 'ARG', 0),
(11, 2, 7, 0, 0, '051', 'AM', 'ARM', 0),
(12, 2, 9, 0, 0, '036', 'AU', 'AUS', 0),
(13, 2, 4, 0, 1, '040', 'AT', 'AUT', 0),
(14, 2, 7, 0, 0, '031', 'AZ', 'AZE', 0),
(15, 2, 9, 0, 0, '044', 'BS', 'BHS', 0),
(16, 2, 8, 0, 0, '048', 'BR', 'BHR', 0),
(17, 2, 9, 0, 0, '050', 'BD', 'BGD', 0),
(18, 2, 9, 0, 0, '052', 'BB', 'BRB', 0),
(19, 2, 9, 0, 0, '585', 'PW', 'PLW', 0),
(20, 1, 2, 0, 1, '056', 'BE', 'BEL', 0),
(21, 2, 9, 0, 0, '084', 'BL', 'BLZ', 0),
(22, 2, 8, 0, 0, '204', 'BJ', 'BEN', 0),
(23, 2, 9, 0, 0, '064', 'BT', 'BTN', 0),
(24, 2, 7, 0, 0, '112', 'BY', 'BLR', 0),
(25, 2, 9, 0, 0, '104', 'MM', 'MMR', 0),
(26, 2, 9, 0, 0, '068', 'BO', 'BOL', 0),
(27, 2, 7, 0, 0, '070', 'BA', 'BIH', 0),
(28, 2, 8, 0, 0, '072', 'BW', 'BWA', 0),
(29, 2, 9, 0, 0, '076', 'BR', 'BRA', 0),
(30, 2, 9, 0, 0, '096', 'BN', 'BRN', 0),
(31, 2, 7, 0, 1, '100', 'BG', 'BGR', 0),
(32, 2, 8, 0, 0, '854', 'BF', 'BFA', 0),
(33, 2, 8, 0, 0, '108', 'BI', 'BDI', 0),
(34, 2, 9, 0, 0, '116', 'KH', 'KHM', 0),
(35, 2, 8, 0, 0, '120', 'CM', 'CMR', 0),
(246, 2, 9, 0, 0, '124', 'CA', 'CAN', 0),
(37, 2, 8, 0, 0, '132', 'CV', 'CPV', 0),
(38, 2, 9, 0, 0, '152', 'CL', 'CHL', 0),
(39, 2, 9, 0, 0, '156', 'CN', 'CHN', 0),
(40, 2, 7, 0, 1, '196', 'CY', 'CYP', 0),
(41, 3, 9, 0, 0, '170', 'CO', 'COL', 0),
(42, 2, 8, 0, 0, '174', 'KM', 'COM', 0),
(43, 2, 8, 0, 0, '178', 'CG', 'COG', 0),
(44, 2, 9, 0, 0, '184', 'CK', 'COK', 0),
(45, 2, 9, 0, 0, '408', 'KP', 'PRK', 0),
(46, 2, 9, 0, 0, '410', 'KR', 'KOR', 0),
(47, 2, 9, 0, 0, '188', 'CR', 'CRI', 0),
(48, 2, 8, 0, 0, '384', 'CI', 'CIV', 0),
(49, 2, 7, 0, 0, '191', 'HR', 'HRV', 0),
(50, 3, 9, 0, 0, '192', 'CU', 'CUB', 0),
(51, 2, 4, 0, 1, '208', 'DK', 'DNK', 0),
(52, 2, 8, 0, 0, '262', 'DJ', 'DJI', 0),
(53, 2, 9, 0, 0, '212', 'DM', 'DMA', 0),
(54, 2, 8, 0, 0, '818', 'EG', 'EGY', 0),
(55, 2, 8, 0, 0, '784', 'AE', 'ARE', 0),
(56, 2, 9, 0, 0, '218', 'EC', 'ECU', 0),
(57, 2, 8, 0, 0, '232', 'ER', 'ERI', 0),
(58, 3, 3, 0, 1, '724', 'ES', 'ESP', 0),
(59, 2, 7, 0, 1, '233', 'EE', 'EST', 0),
(61, 2, 8, 0, 0, '231', 'ET', 'ETH', 0),
(62, 2, 9, 0, 0, '242', 'FJ', 'FJI', 0),
(63, 2, 5, 0, 1, '246', 'FI', 'FIN', 0),
(64, 2, 1, 1, 1, '250', 'FR', 'FRA', 1),
(65, 2, 8, 0, 0, '266', 'GA', 'GAB', 0),
(66, 2, 8, 0, 0, '270', 'GM', 'GMB', 0),
(67, 2, 7, 0, 0, '268', 'GE', 'GEO', 0),
(68, 2, 8, 0, 0, '288', 'GH', 'GHA', 0),
(69, 2, 6, 0, 1, '300', 'GR', 'GRC', 0),
(70, 2, 9, 0, 0, '308', 'GD', 'GRD', 0),
(71, 3, 9, 0, 0, '320', 'GT', 'GTM', 0),
(72, 2, 8, 0, 0, '324', 'GN', 'GIN', 0),
(73, 2, 8, 0, 0, '624', 'GW', 'GNB', 0),
(74, 2, 8, 0, 0, '226', 'GQ', 'GNQ', 0),
(75, 2, 9, 0, 0, '328', 'GY', 'GUY', 0),
(76, 2, 9, 0, 0, '332', 'HT', 'HTI', 0),
(77, 2, 9, 0, 0, '340', 'HN', 'HND', 0),
(78, 2, 6, 0, 1, '348', 'HU', 'HUN', 0),
(79, 2, 9, 0, 0, '356', 'IN', 'IND', 0),
(80, 2, 9, 0, 0, '360', 'ID', 'IDN', 0),
(81, 2, 8, 0, 0, '364', 'IR', 'IRN', 0),
(82, 2, 8, 0, 0, '368', 'IQ', 'IRQ', 0),
(83, 2, 4, 0, 1, '372', 'IE', 'IRL', 0),
(84, 2, 6, 0, 0, '352', 'IS', 'ISL', 0),
(85, 2, 8, 0, 0, '376', 'IL', 'ISR', 0),
(86, 4, 3, 0, 1, '380', 'IT', 'ITA', 0),
(87, 2, 9, 0, 0, '388', 'JM', 'JAM', 0),
(88, 2, 9, 0, 0, '392', 'JP', 'JPN', 0),
(89, 2, 8, 0, 0, '400', 'JO', 'JOR', 0),
(90, 2, 9, 0, 0, '398', 'KZ', 'KAZ', 0),
(91, 2, 8, 0, 0, '404', 'KE', 'KEN', 0),
(92, 2, 9, 0, 0, '417', 'KG', 'KGZ', 0),
(93, 2, 9, 0, 0, '296', 'KI', 'KIR', 0),
(94, 2, 8, 0, 0, '414', 'KW', 'KWT', 0),
(95, 2, 9, 0, 0, '418', 'LA', 'LAO', 0),
(96, 2, 8, 0, 0, '426', 'LS', 'LSO', 0),
(97, 2, 7, 0, 1, '428', 'LV', 'LVA', 0),
(98, 2, 8, 0, 0, '422', 'LB', 'LBN', 0),
(99, 2, 8, 0, 0, '430', 'LR', 'LBR', 0),
(100, 2, 8, 0, 0, '343', 'LY', 'LBY', 0),
(101, 2, 6, 0, 0, '438', 'LI', 'LIE', 0),
(102, 2, 7, 0, 1, '440', 'LT', 'LTU', 0),
(103, 2, 2, 0, 1, '442', 'LU', 'LUX', 0),
(104, 2, 7, 0, 0, '807', 'MK', 'MKD', 0),
(105, 2, 8, 0, 0, '450', 'MG', 'MDG', 0),
(106, 2, 9, 0, 0, '458', 'MY', 'MYS', 0),
(107, 2, 8, 0, 0, '454', 'MW', 'MWI', 0),
(108, 2, 9, 0, 0, '462', 'MV', 'MDV', 0),
(109, 2, 8, 0, 0, '466', 'ML', 'MLI', 0),
(110, 2, 8, 0, 1, '470', 'MT', 'MLT', 0),
(111, 2, 7, 0, 0, '504', 'MA', 'MAR', 0),
(112, 2, 9, 0, 0, '584', 'MH', 'MHL', 0),
(113, 2, 8, 0, 0, '480', 'MU', 'MUS', 0),
(114, 2, 8, 0, 0, '478', 'MR', 'MRT', 0),
(115, 2, 9, 0, 0, '484', 'MX', 'MEX', 0),
(116, 2, 9, 0, 0, '583', 'FM', 'FSM', 0),
(117, 2, 7, 0, 0, '498', 'MD', 'MDA', 0),
(118, 2, 1, 0, 1, '492', 'MC', 'MCO', 0),
(119, 2, 9, 0, 0, '496', 'MN', 'MNG', 0),
(120, 2, 8, 0, 0, '508', 'MZ', 'MOZ', 0),
(121, 2, 8, 0, 0, '516', 'NA', 'NAM', 0),
(122, 2, 9, 0, 0, '520', 'NR', 'NRU', 0),
(123, 2, 9, 0, 0, '524', 'NP', 'NPL', 0),
(124, 2, 9, 0, 0, '558', 'NI', 'NIC', 0),
(125, 2, 8, 0, 0, '562', 'NE', 'NER', 0),
(126, 2, 8, 0, 0, '566', 'NG', 'NGA', 0),
(127, 2, 9, 0, 0, '570', 'NU', 'NIU', 0),
(128, 2, 5, 0, 0, '578', 'NO', 'NOR', 0),
(129, 2, 9, 0, 0, '554', 'NZ', 'NZL', 0),
(130, 2, 8, 0, 0, '512', 'OM', 'OMN', 0),
(131, 2, 8, 0, 0, '800', 'UG', 'UGA', 0),
(132, 2, 9, 0, 0, '860', 'UZ', 'UZB', 0),
(133, 2, 9, 0, 0, '586', 'PK', 'PAK', 0),
(134, 2, 9, 0, 0, '591', 'PA', 'PAN', 0),
(135, 2, 9, 0, 0, '598', 'PG', 'PNG', 0),
(136, 2, 9, 0, 0, '600', 'PY', 'PRY', 0),
(137, 2, 2, 0, 1, '528', 'NL', 'NLD', 0),
(138, 2, 9, 0, 0, '604', 'PE', 'PER', 0),
(139, 2, 9, 0, 0, '608', 'PH', 'PHL', 0),
(140, 2, 6, 0, 1, '616', 'PL', 'POL', 0),
(141, 2, 4, 0, 1, '620', 'PT', 'PRT', 0),
(142, 2, 8, 0, 0, '634', 'QA', 'QAT', 0),
(143, 2, 8, 0, 0, '140', 'CF', 'CAF', 0),
(144, 2, 9, 0, 0, '214', 'DO', 'DOM', 0),
(145, 2, 6, 0, 1, '203', 'CZ', 'CZE', 0),
(146, 2, 7, 0, 1, '642', 'RO', 'ROU', 0),
(147, 2, 3, 0, 1, '826', 'GB', 'GBR', 0),
(148, 2, 7, 0, 0, '643', 'RU', 'RUS', 0),
(149, 2, 8, 0, 0, '646', 'RW', 'RWA', 0),
(150, 2, 9, 0, 0, '659', 'KN', 'KNA', 0),
(151, 2, 9, 0, 0, '662', 'LC', 'LCA', 0),
(152, 2, 9, 0, 0, '674', 'SM', 'SMR', 0),
(153, 2, 9, 0, 0, '670', 'VC', 'VCT', 0),
(154, 2, 9, 0, 0, '090', 'SB', 'SLB', 0),
(155, 2, 9, 0, 0, '222', 'SV', 'SLV', 0),
(156, 2, 9, 0, 0, '882', 'WS', 'WSM', 0),
(157, 2, 8, 0, 0, '678', 'ST', 'STP', 0),
(158, 2, 8, 0, 0, '686', 'SN', 'SEN', 0),
(159, 2, 9, 0, 0, '690', 'SC', 'SYC', 0),
(160, 2, 8, 0, 0, '694', 'SL', 'SLE', 0),
(161, 2, 9, 0, 0, '702', 'SG', 'SGP', 0),
(162, 2, 6, 0, 1, '703', 'SK', 'SVK', 0),
(163, 2, 6, 0, 1, '705', 'SI', 'SVN', 0),
(164, 2, 8, 0, 0, '706', 'SO', 'SOM', 0),
(165, 2, 8, 0, 0, '729', 'SD', 'SDN', 0),
(166, 2, 9, 0, 0, '144', 'LK', 'LKA', 0),
(167, 2, 5, 0, 1, '752', 'SE', 'SWE', 0),
(168, 1, 5, 0, 0, '756', 'CH', 'CHE', 0),
(169, 2, 9, 0, 0, '740', 'SR', 'SUR', 0),
(170, 2, 8, 0, 0, '748', 'SZ', 'SWZ', 0),
(171, 2, 8, 0, 0, '760', 'SY', 'SYR', 0),
(172, 2, 9, 0, 0, '762', 'TJ', 'TJK', 0),
(173, 2, 8, 0, 0, '834', 'TZ', 'TZA', 0),
(174, 2, 8, 0, 0, '148', 'TD', 'TCD', 0),
(175, 2, 9, 0, 0, '764', 'TH', 'THA', 0),
(176, 2, 8, 0, 0, '768', 'TG', 'TGO', 0),
(177, 2, 9, 0, 0, '776', 'TO', 'TON', 0),
(178, 2, 9, 0, 0, '780', 'TT', 'TTO', 0),
(179, 2, 7, 0, 0, '788', 'TN', 'TUN', 0),
(180, 2, 9, 0, 0, '795', 'TM', 'TKM', 0),
(181, 2, 7, 0, 0, '792', 'TR', 'TUR', 0),
(182, 2, 9, 0, 0, '798', 'TV', 'TUV', 0),
(183, 2, 7, 0, 0, '804', 'UA', 'UKR', 0),
(184, 2, 9, 0, 0, '858', 'UY', 'URY', 0),
(185, 2, 3, 0, 0, '336', 'VA', 'VAT', 0),
(186, 2, 9, 0, 0, '548', 'VU', 'VUT', 0),
(187, 2, 9, 0, 0, '862', 'VE', 'VEN', 0),
(188, 2, 9, 0, 0, '704', 'VN', 'VNM', 0),
(189, 2, 8, 0, 0, '887', 'YE', 'YEM', 0),
(190, 2, 7, 0, 0, '807', 'MK', 'MKD', 0),
(191, 2, 8, 0, 0, '180', 'CD', 'COD', 0),
(192, 2, 8, 0, 0, '894', 'ZM', 'ZMB', 0),
(193, 2, 8, 0, 0, '716', 'ZW', 'ZWE', 0),
(247, 2, 8, 0, 0, '124', 'CA', 'CAN', 0),
(196, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(197, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(198, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(199, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(200, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(201, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(202, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(203, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(204, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(205, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(206, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(207, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(208, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(209, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(210, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(211, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(212, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(213, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(214, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(215, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(216, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(217, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(218, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(219, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(220, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(221, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(222, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(223, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(224, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(225, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(226, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(227, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(228, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(229, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(230, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(231, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(232, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(233, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(234, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(235, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(236, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(237, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(238, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(239, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(240, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(241, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(242, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(243, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(244, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(245, 2, 8, 0, 0, '840', 'US', 'USA', 0),
(248, 2, 8, 0, 0, '124', 'CA', 'CAN', 0),
(249, 2, 8, 0, 0, '124', 'CA', 'CAN', 0),
(250, 2, 8, 0, 0, '124', 'CA', 'CAN', 0),
(251, 2, 8, 0, 0, '124', 'CA', 'CAN', 0),
(252, 2, 8, 0, 0, '124', 'CA', 'CAN', 0),
(253, 2, 8, 0, 0, '124', 'CA', 'CAN', 0),
(254, 2, 8, 0, 0, '124', 'CA', 'CAN', 0),
(255, 2, 8, 0, 0, '124', 'CA', 'CAN', 0),
(256, 2, 8, 0, 0, '124', 'CA', 'CAN', 0),
(257, 2, 8, 0, 0, '124', 'CA', 'CAN', 0),
(258, 2, 8, 0, 0, '124', 'CA', 'CAN', 0),
(259, 1, 10, 0, 0, '312', 'GP', 'GLP', 0),
(260, 1, 10, 0, 0, '254', 'GF', 'GUF', 0),
(261, 1, 10, 0, 0, '474', 'MQ', 'MTQ', 0),
(262, 1, 10, 0, 0, '175', 'YT', 'MYT', 0),
(263, 1, 10, 0, 0, '638', 'RE', 'REU', 0),
(264, 1, 10, 0, 0, '666', 'PM', 'SPM', 0),
(265, 1, 11, 0, 0, '540', 'NC', 'NCL', 0),
(266, 1, 11, 0, 0, '258', 'PF', 'PYF', 0),
(267, 1, 11, 0, 0, '876', 'WF', 'WLF', 0),
(268, 2, 11, 0, 0, '840', 'US', 'USA', 0);

-- --------------------------------------------------------

--
-- Structure de la table `paysdesc`
--

CREATE TABLE IF NOT EXISTS `paysdesc` (
  `id` int(11) NOT NULL auto_increment,
  `pays` int(11) NOT NULL default '0',
  `lang` int(11) NOT NULL default '0',
  `titre` text NOT NULL,
  `chapo` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `pays` (`pays`,`lang`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=838 ;

--
-- Contenu de la table `paysdesc`
--

INSERT INTO `paysdesc` (`id`, `pays`, `lang`, `titre`, `chapo`, `description`) VALUES
(1, 1, 1, 'Afghanistan', '', ''),
(2, 2, 1, 'Afrique du Sud', '', ''),
(3, 3, 1, 'Albanie', '', ''),
(4, 4, 1, 'Algérie', '', ''),
(5, 5, 1, 'Allemagne', '', ''),
(6, 6, 1, 'Andorre', '', ''),
(7, 7, 1, 'Angola', '', ''),
(8, 8, 1, 'Antigua-et-Barbuda', '', ''),
(9, 9, 1, 'Arabie saoudite', '', ''),
(10, 10, 1, 'Argentine', '', ''),
(11, 11, 1, 'Arménie', '', ''),
(12, 12, 1, 'Australie', '', ''),
(13, 13, 1, 'Autriche', '', ''),
(14, 14, 1, 'Azerbaïdjan', '', ''),
(15, 15, 1, 'Bahamas', '', ''),
(16, 16, 1, 'Bahreïn', '', ''),
(17, 17, 1, 'Bangladesh', '', ''),
(18, 18, 1, 'Barbade', '', ''),
(19, 19, 1, 'Belau', '', ''),
(20, 20, 1, 'Belgique', '', ''),
(21, 21, 1, 'Belize', '', ''),
(22, 22, 1, 'Bénin', '', ''),
(23, 23, 1, 'Bhoutan', '', ''),
(24, 24, 1, 'Biélorussie', '', ''),
(25, 25, 1, 'Birmanie', '', ''),
(26, 26, 1, 'Bolivie', '', ''),
(27, 27, 1, 'Bosnie-Herzégovine', '', ''),
(28, 28, 1, 'Botswana', '', ''),
(29, 29, 1, 'Brésil', '', ''),
(30, 30, 1, 'Brunei', '', ''),
(31, 31, 1, 'Bulgarie', '', ''),
(32, 32, 1, 'Burkina', '', ''),
(33, 33, 1, 'Burundi', '', ''),
(34, 34, 1, 'Cambodge', '', ''),
(35, 35, 1, 'Cameroun', '', ''),
(37, 37, 1, 'Cap-Vert', '', ''),
(38, 38, 1, 'Chili', '', ''),
(39, 39, 1, 'Chine', '', ''),
(40, 40, 1, 'Chypre', '', ''),
(41, 41, 1, 'Colombie', '', ''),
(42, 42, 1, 'Comores', '', ''),
(43, 43, 1, 'Congo', '', ''),
(44, 44, 1, 'Cook', '', ''),
(45, 45, 1, 'Corée du Nord', '', ''),
(46, 46, 1, 'Corée du Sud', '', ''),
(47, 47, 1, 'Costa Rica', '', ''),
(48, 48, 1, 'Côte d''Ivoire', '', ''),
(49, 49, 1, 'Croatie', '', ''),
(50, 50, 1, 'Cuba', '', ''),
(51, 51, 1, 'Danemark', '', ''),
(52, 52, 1, 'Djibouti', '', ''),
(53, 53, 1, 'Dominique', '', ''),
(54, 54, 1, 'Égypte', '', ''),
(55, 55, 1, 'Émirats arabes unis', '', ''),
(56, 56, 1, 'Équateur', '', ''),
(57, 57, 1, 'Érythrée', '', ''),
(58, 58, 1, 'Espagne', '', ''),
(59, 59, 1, 'Estonie', '', ''),
(582, 198, 1, 'USA - Arkansas', '', ''),
(61, 61, 1, 'Éthiopie', '', ''),
(62, 62, 1, 'Fidji', '', ''),
(63, 63, 1, 'Finlande', '', ''),
(64, 64, 1, 'France métropolitaine', '', ''),
(65, 65, 1, 'Gabon', '', ''),
(66, 66, 1, 'Gambie', '', ''),
(67, 67, 1, 'Géorgie', '', ''),
(68, 68, 1, 'Ghana', '', ''),
(69, 69, 1, 'Grèce', '', ''),
(70, 70, 1, 'Grenade', '', ''),
(71, 71, 1, 'Guatemala', '', ''),
(72, 72, 1, 'Guinée', '', ''),
(73, 73, 1, 'Guinée-Bissao', '', ''),
(74, 74, 1, 'Guinée équatoriale', '', ''),
(75, 75, 1, 'Guyana', '', ''),
(76, 76, 1, 'Haïti', '', ''),
(77, 77, 1, 'Honduras', '', ''),
(78, 78, 1, 'Hongrie', '', ''),
(79, 79, 1, 'Inde', '', ''),
(80, 80, 1, 'Indonésie', '', ''),
(81, 81, 1, 'Iran', '', ''),
(82, 82, 1, 'Iraq', '', ''),
(83, 83, 1, 'Irlande', '', ''),
(84, 84, 1, 'Islande', '', ''),
(85, 85, 1, 'Israël', '', ''),
(86, 86, 1, 'Italie', '', ''),
(87, 87, 1, 'Jamaïque', '', ''),
(88, 88, 1, 'Japon', '', ''),
(89, 89, 1, 'Jordanie', '', ''),
(90, 90, 1, 'Kazakhstan', '', ''),
(91, 91, 1, 'Kenya', '', ''),
(92, 92, 1, 'Kirghizistan', '', ''),
(93, 93, 1, 'Kiribati', '', ''),
(94, 94, 1, 'Koweït', '', ''),
(95, 95, 1, 'Laos', '', ''),
(96, 96, 1, 'Lesotho', '', ''),
(97, 97, 1, 'Lettonie', '', ''),
(98, 98, 1, 'Liban', '', ''),
(99, 99, 1, 'Liberia', '', ''),
(100, 100, 1, 'Libye', '', ''),
(101, 101, 1, 'Liechtenstein', '', ''),
(102, 102, 1, 'Lituanie', '', ''),
(103, 103, 1, 'Luxembourg', '', ''),
(104, 104, 1, 'Macédoine', '', ''),
(105, 105, 1, 'Madagascar', '', ''),
(106, 106, 1, 'Malaisie', '', ''),
(107, 107, 1, 'Malawi', '', ''),
(108, 108, 1, 'Maldives', '', ''),
(109, 109, 1, 'Mali', '', ''),
(110, 110, 1, 'Malte', '', ''),
(111, 111, 1, 'Maroc', '', ''),
(112, 112, 1, 'Marshall', '', ''),
(113, 113, 1, 'Maurice', '', ''),
(114, 114, 1, 'Mauritanie', '', ''),
(115, 115, 1, 'Mexique', '', ''),
(116, 116, 1, 'Micronésie', '', ''),
(117, 117, 1, 'Moldavie', '', ''),
(118, 118, 1, 'Monaco', '', ''),
(119, 119, 1, 'Mongolie', '', ''),
(120, 120, 1, 'Mozambique', '', ''),
(121, 121, 1, 'Namibie', '', ''),
(122, 122, 1, 'Nauru', '', ''),
(123, 123, 1, 'Népal', '', ''),
(124, 124, 1, 'Nicaragua', '', ''),
(125, 125, 1, 'Niger', '', ''),
(126, 126, 1, 'Nigeria', '', ''),
(127, 127, 1, 'Niue', '', ''),
(128, 128, 1, 'Norvège', '', ''),
(129, 129, 1, 'Nouvelle-Zélande', '', ''),
(130, 130, 1, 'Oman', '', ''),
(131, 131, 1, 'Ouganda', '', ''),
(132, 132, 1, 'Ouzbékistan', '', ''),
(133, 133, 1, 'Pakistan', '', ''),
(134, 134, 1, 'Panama', '', ''),
(135, 135, 1, 'Papouasie', '', ''),
(136, 136, 1, 'Paraguay', '', ''),
(137, 137, 1, 'Pays-Bas', '', ''),
(138, 138, 1, 'Pérou', '', ''),
(139, 139, 1, 'Philippines', '', ''),
(140, 140, 1, 'Pologne', '', ''),
(141, 141, 1, 'Portugal', '', ''),
(142, 142, 1, 'Qatar', '', ''),
(143, 143, 1, 'République centrafricaine', '', ''),
(144, 144, 1, 'République dominicaine', '', ''),
(145, 145, 1, 'République tchèque', '', ''),
(146, 146, 1, 'Roumanie', '', ''),
(147, 147, 1, 'Royaume-Uni', '', ''),
(148, 148, 1, 'Russie', '', ''),
(149, 149, 1, 'Rwanda', '', ''),
(150, 150, 1, 'Saint-Christophe-et-Niévès', '', ''),
(151, 151, 1, 'Sainte-Lucie', '', ''),
(152, 152, 1, 'Saint-Marin', '', ''),
(153, 153, 1, 'Saint-Vincent-et-les Grenadines', '', ''),
(154, 154, 1, 'Salomon', '', ''),
(155, 155, 1, 'Salvador', '', ''),
(156, 156, 1, 'Samoa occidentales', '', ''),
(157, 157, 1, 'Sao Tomé-et-Principe', '', ''),
(158, 158, 1, 'Sénégal', '', ''),
(159, 159, 1, 'Seychelles', '', ''),
(160, 160, 1, 'Sierra Leone', '', ''),
(161, 161, 1, 'Singapour', '', ''),
(162, 162, 1, 'Slovaquie', '', ''),
(163, 163, 1, 'Slovénie', '', ''),
(164, 164, 1, 'Somalie', '', ''),
(165, 165, 1, 'Soudan', '', ''),
(166, 166, 1, 'Sri Lanka', '', ''),
(167, 167, 1, 'Suède', '', ''),
(168, 168, 1, 'Suisse', '', ''),
(169, 169, 1, 'Suriname', '', ''),
(170, 170, 1, 'Swaziland', '', ''),
(171, 171, 1, 'Syrie', '', ''),
(172, 172, 1, 'Tadjikistan', '', ''),
(173, 173, 1, 'Tanzanie', '', ''),
(174, 174, 1, 'Tchad', '', ''),
(175, 175, 1, 'Thaïlande', '', ''),
(176, 176, 1, 'Togo', '', ''),
(177, 177, 1, 'Tonga', '', ''),
(178, 178, 1, 'Trinité-et-Tobago', '', ''),
(179, 179, 1, 'Tunisie', '', ''),
(180, 180, 1, 'Turkménistan', '', ''),
(181, 181, 1, 'Turquie', '', ''),
(182, 182, 1, 'Tuvalu', '', ''),
(183, 183, 1, 'Ukraine', '', ''),
(184, 184, 1, 'Uruguay', '', ''),
(185, 185, 1, 'Vatican', '', ''),
(186, 186, 1, 'Vanuatu', '', ''),
(187, 187, 1, 'Venezuela', '', ''),
(188, 188, 1, 'Viêt Nam', '', ''),
(189, 189, 1, 'Yémen', '', ''),
(190, 190, 1, 'Yougoslavie', '', ''),
(191, 191, 1, 'Zaïre', '', ''),
(192, 192, 1, 'Zambie', '', ''),
(193, 193, 1, 'Zimbabwe', '', ''),
(194, 1, 2, 'Afghanistan', '', ''),
(195, 2, 2, 'South Africa', '', ''),
(196, 3, 2, 'Albania', '', ''),
(197, 4, 2, 'Algeria', '', ''),
(198, 5, 2, 'Germany', '', ''),
(199, 6, 2, 'Andorra', '', ''),
(200, 7, 2, 'Angola', '', ''),
(201, 8, 2, 'Antigua and Barbuda', '', ''),
(202, 9, 2, 'Saudi Arabia', '', ''),
(203, 10, 2, 'Argentina', '', ''),
(204, 11, 2, 'Armenia', '', ''),
(205, 12, 2, 'Australia', '', ''),
(206, 13, 2, 'Austria', '', ''),
(207, 14, 2, 'Azerbaijan', '', ''),
(208, 15, 2, 'Bahamas', '', ''),
(209, 16, 2, 'Bahrain', '', ''),
(210, 17, 2, 'Bangladesh', '', ''),
(211, 18, 2, 'Barbados', '', ''),
(212, 19, 2, 'Belarus', '', ''),
(213, 20, 2, 'Belgium', '', ''),
(214, 21, 2, 'Belize', '', ''),
(215, 22, 2, 'Benin', '', ''),
(216, 23, 2, 'Bhutan', '', ''),
(217, 24, 2, 'Bielorussia', '', ''),
(218, 25, 2, 'Burma', '', ''),
(219, 26, 2, 'Bolivia', '', ''),
(220, 27, 2, 'Bosnia and Herzegovina', '', ''),
(221, 28, 2, 'Botswana', '', ''),
(222, 29, 2, 'Brazil', '', ''),
(223, 30, 2, 'Brunei', '', ''),
(224, 31, 2, 'Bulgaria', '', ''),
(225, 32, 2, 'Burkina', '', ''),
(226, 33, 2, 'Burundi', '', ''),
(227, 34, 2, 'Cambodia', '', ''),
(228, 35, 2, 'Cameroon', '', ''),
(230, 37, 2, 'Cape Verde', '', ''),
(231, 38, 2, 'Chile', '', ''),
(232, 39, 2, 'China', '', ''),
(233, 40, 2, 'Cyprus', '', ''),
(234, 41, 2, 'Colombia', '', ''),
(235, 42, 2, 'Comoros', '', ''),
(236, 43, 2, 'Congo', '', ''),
(237, 44, 2, 'Cook Islands', '', ''),
(238, 45, 2, 'North Korea', '', ''),
(239, 46, 2, 'South Korea', '', ''),
(240, 47, 2, 'Costa Rica', '', ''),
(241, 48, 2, 'Ivory Coast', '', ''),
(242, 49, 2, 'Croatia', '', ''),
(243, 50, 2, 'Cuba', '', ''),
(244, 51, 2, 'Denmark', '', ''),
(245, 52, 2, 'Djibouti', '', ''),
(246, 53, 2, 'Dominica', '', ''),
(247, 54, 2, 'Egypt', '', ''),
(248, 55, 2, 'United Arab Emirates', '', ''),
(249, 56, 2, 'Ecuador', '', ''),
(250, 57, 2, 'Eritrea', '', ''),
(251, 58, 2, 'Spain', '', ''),
(252, 59, 2, 'Estonia', '', ''),
(581, 197, 1, 'USA - Arizona', '', ''),
(254, 61, 2, 'Ethiopia', '', ''),
(255, 62, 2, 'Fiji', '', ''),
(256, 63, 2, 'Finland', '', ''),
(257, 64, 2, 'France metropolitan', '', ''),
(258, 65, 2, 'Gabon', '', ''),
(259, 66, 2, 'Gambia', '', ''),
(260, 67, 2, 'Georgia', '', ''),
(261, 68, 2, 'Ghana', '', ''),
(262, 69, 2, 'Greece', '', ''),
(263, 70, 2, 'Grenada', '', ''),
(264, 71, 2, 'Guatemala', '', ''),
(265, 72, 2, 'Guinea', '', ''),
(266, 73, 2, 'Guinea-Bissau', '', ''),
(267, 74, 2, 'Equatorial Guinea', '', ''),
(268, 75, 2, 'Guyana', '', ''),
(269, 76, 2, 'Haiti', '', ''),
(270, 77, 2, 'Honduras', '', ''),
(271, 78, 2, 'Hungary', '', ''),
(272, 79, 2, 'India', '', ''),
(273, 80, 2, 'Indonesia', '', ''),
(274, 81, 2, 'Iran', '', ''),
(275, 82, 2, 'Iraq', '', ''),
(276, 83, 2, 'Ireland', '', ''),
(277, 84, 2, 'Iceland', '', ''),
(278, 85, 2, 'Israel', '', ''),
(279, 86, 2, 'Italy', '', ''),
(280, 87, 2, 'Jamaica', '', ''),
(281, 88, 2, 'Japan', '', ''),
(282, 89, 2, 'Jordan', '', ''),
(283, 90, 2, 'Kazakhstan', '', ''),
(284, 91, 2, 'Kenya', '', ''),
(285, 92, 2, 'Kyrgyzstan', '', ''),
(286, 93, 2, 'Kiribati', '', ''),
(287, 94, 2, 'Kuwait', '', ''),
(288, 95, 2, 'Laos', '', ''),
(289, 96, 2, 'Lesotho', '', ''),
(290, 97, 2, 'Latvia', '', ''),
(291, 98, 2, 'Lebanon', '', ''),
(292, 99, 2, 'Liberia', '', ''),
(293, 100, 2, 'Libya', '', ''),
(294, 101, 2, 'Liechtenstein', '', ''),
(295, 102, 2, 'Lithuania', '', ''),
(296, 103, 2, 'Luxembourg', '', ''),
(297, 104, 2, 'Macedonia', '', ''),
(298, 105, 2, 'Madagascar', '', ''),
(299, 106, 2, 'Malaysia', '', ''),
(300, 107, 2, 'Malawi', '', ''),
(301, 108, 2, 'Maldives', '', ''),
(302, 109, 2, 'Mali', '', ''),
(303, 110, 2, 'Malta', '', ''),
(304, 111, 2, 'Morocco', '', ''),
(305, 112, 2, 'Marshall Islands', '', ''),
(306, 113, 2, 'Mauritius', '', ''),
(307, 114, 2, 'Mauritania', '', ''),
(308, 115, 2, 'Mexico', '', ''),
(309, 116, 2, 'Micronesia', '', ''),
(310, 117, 2, 'Moldova', '', ''),
(311, 118, 2, 'Monaco', '', ''),
(312, 119, 2, 'Mongolia', '', ''),
(313, 120, 2, 'Mozambique', '', ''),
(314, 121, 2, 'Namibia', '', ''),
(315, 122, 2, 'Nauru', '', ''),
(316, 123, 2, 'Nepal', '', ''),
(317, 124, 2, 'Nicaragua', '', ''),
(318, 125, 2, 'Niger', '', ''),
(319, 126, 2, 'Nigeria', '', ''),
(320, 127, 2, 'Niue', '', ''),
(321, 128, 2, 'Norway', '', ''),
(322, 129, 2, 'New Zealand', '', ''),
(323, 130, 2, 'Oman', '', ''),
(324, 131, 2, 'Uganda', '', ''),
(325, 132, 2, 'Uzbekistan', '', ''),
(326, 133, 2, 'Pakistan', '', ''),
(327, 134, 2, 'Panama', '', ''),
(328, 135, 2, 'Papua Nueva Guinea', '', ''),
(329, 136, 2, 'Paraguay', '', ''),
(330, 137, 2, 'Netherlands', '', ''),
(331, 138, 2, 'Peru', '', ''),
(332, 139, 2, 'Philippines', '', ''),
(333, 140, 2, 'Poland', '', ''),
(334, 141, 2, 'Portugal', '', ''),
(335, 142, 2, 'Qatar', '', ''),
(336, 143, 2, 'Central African Republic', '', ''),
(337, 144, 2, 'Dominican Republic', '', ''),
(338, 145, 2, 'Czech Republic', '', ''),
(339, 146, 2, 'Romania', '', ''),
(340, 147, 2, 'United Kingdom', '', ''),
(341, 148, 2, 'Russia', '', ''),
(342, 149, 2, 'Rwanda', '', ''),
(343, 150, 2, 'Saint Kitts and Nevis', '', ''),
(344, 151, 2, 'Saint Lucia', '', ''),
(345, 152, 2, 'San Marino', '', ''),
(346, 153, 2, 'Saint Vincent and the Grenadines', '', ''),
(347, 154, 2, 'Solomon Islands', '', ''),
(348, 155, 2, 'El Salvador', '', ''),
(349, 156, 2, 'Western Samoa', '', ''),
(350, 157, 2, 'Sao Tome and Principe', '', ''),
(351, 158, 2, 'Senegal', '', ''),
(352, 159, 2, 'Seychelles', '', ''),
(353, 160, 2, 'Sierra Leone', '', ''),
(354, 161, 2, 'Singapore', '', ''),
(355, 162, 2, 'Slovakia', '', ''),
(356, 163, 2, 'Slovenia', '', ''),
(357, 164, 2, 'Somalia', '', ''),
(358, 165, 2, 'Sudan', '', ''),
(359, 166, 2, 'Sri Lanka', '', ''),
(360, 167, 2, 'Sweden', '', ''),
(361, 168, 2, 'Switzerland', '', ''),
(362, 169, 2, 'Suriname', '', ''),
(363, 170, 2, 'Swaziland', '', ''),
(364, 171, 2, 'Syria', '', ''),
(365, 172, 2, 'Tajikistan', '', ''),
(366, 173, 2, 'Tanzania', '', ''),
(367, 174, 2, 'Chad', '', ''),
(368, 175, 2, 'Thailand', '', ''),
(369, 176, 2, 'Togo', '', ''),
(370, 177, 2, 'Tonga', '', ''),
(371, 178, 2, 'Trinidad and Tobago', '', ''),
(372, 179, 2, 'Tunisia', '', ''),
(373, 180, 2, 'Turkmenistan', '', ''),
(374, 181, 2, 'Turkey', '', ''),
(375, 182, 2, 'Tuvalu', '', ''),
(376, 183, 2, 'Ukraine', '', ''),
(377, 184, 2, 'Uruguay', '', ''),
(378, 185, 2, 'The Vatican', '', ''),
(379, 186, 2, 'Vanuatu', '', ''),
(380, 187, 2, 'Venezuela', '', ''),
(381, 188, 2, 'Vietnam', '', ''),
(382, 189, 2, 'Yemen', '', ''),
(383, 190, 2, 'Yougoslavia', '', ''),
(384, 191, 2, 'Zaire', '', ''),
(385, 192, 2, 'Zambia', '', ''),
(386, 193, 2, 'Zimbabwe', '', ''),
(387, 1, 3, 'Afganistán', '', ''),
(388, 2, 3, 'Sudáfrica', '', ''),
(389, 3, 3, 'Albania', '', ''),
(390, 4, 3, 'Argelia', '', ''),
(391, 5, 3, 'Alemania', '', ''),
(392, 6, 3, 'Andorra', '', ''),
(393, 7, 3, 'Angola', '', ''),
(394, 8, 3, 'Antigua y Barbuda', '', ''),
(395, 9, 3, 'Arabia Saudita', '', ''),
(396, 10, 3, 'Argentina', '', ''),
(397, 11, 3, 'Armenia', '', ''),
(398, 12, 3, 'Australia', '', ''),
(399, 13, 3, 'Austria', '', ''),
(400, 14, 3, 'Azerbaiyán', '', ''),
(401, 15, 3, 'Bahamas', '', ''),
(402, 16, 3, 'Bahrein', '', ''),
(403, 17, 3, 'Bangladesh', '', ''),
(404, 18, 3, 'Barbados', '', ''),
(405, 19, 3, 'Belarús', '', ''),
(406, 20, 3, 'Bélgica', '', ''),
(407, 21, 3, 'Belice', '', ''),
(408, 22, 3, 'Benin', '', ''),
(409, 23, 3, 'Bhután', '', ''),
(410, 24, 3, 'Bielorusia', '', ''),
(411, 25, 3, 'Birmania', '', ''),
(412, 26, 3, 'Bolivia', '', ''),
(413, 27, 3, 'Bosnia y Herzegovina', '', ''),
(414, 28, 3, 'Botswana', '', ''),
(415, 29, 3, 'Brasil', '', ''),
(416, 30, 3, 'Brunei', '', ''),
(417, 31, 3, 'Bulgaria', '', ''),
(418, 32, 3, 'Burkina', '', ''),
(419, 33, 3, 'Burundi', '', ''),
(420, 34, 3, 'Camboya', '', ''),
(421, 35, 3, 'Camerún', '', ''),
(730, 246, 1, 'Colombie-Britannique', '', ''),
(423, 37, 3, 'Cabo Verde', '', ''),
(424, 38, 3, 'Chile', '', ''),
(425, 39, 3, 'China', '', ''),
(426, 40, 3, 'Chipre', '', ''),
(427, 41, 3, 'Colombia', '', ''),
(428, 42, 3, 'Comoras', '', ''),
(429, 43, 3, 'Congo', '', ''),
(430, 44, 3, 'Cook', '', ''),
(431, 45, 3, 'Corea del Norte', '', ''),
(432, 46, 3, 'Corea del Sur', '', ''),
(433, 47, 3, 'Costa Rica', '', ''),
(434, 48, 3, 'Costa de Marfil', '', ''),
(435, 49, 3, 'Croacia', '', ''),
(436, 50, 3, 'Cuba', '', ''),
(437, 51, 3, 'Dinamarca', '', ''),
(438, 52, 3, 'Djibouti', '', ''),
(439, 53, 3, 'Dominica', '', ''),
(440, 54, 3, 'Egipto', '', ''),
(441, 55, 3, 'Emiratos Árabes Unidos', '', ''),
(442, 56, 3, 'Ecuador', '', ''),
(443, 57, 3, 'Eritrea', '', ''),
(444, 58, 3, 'España', '', ''),
(445, 59, 3, 'Estonia', '', ''),
(580, 196, 1, 'USA - Alaska', '', ''),
(447, 61, 3, 'Etiopía', '', ''),
(448, 62, 3, 'Fiji', '', ''),
(449, 63, 3, 'Finlandia', '', ''),
(450, 64, 3, 'Francia', '', ''),
(451, 65, 3, 'Gabón', '', ''),
(452, 66, 3, 'Gambia', '', ''),
(453, 67, 3, 'Georgia', '', ''),
(454, 68, 3, 'Ghana', '', ''),
(455, 69, 3, 'Grecia', '', ''),
(456, 70, 3, 'Granada', '', ''),
(457, 71, 3, 'Guatemala', '', ''),
(458, 72, 3, 'Guinea', '', ''),
(459, 73, 3, 'Guinea-Bissau', '', ''),
(460, 74, 3, 'Guinea Ecuatorial', '', ''),
(461, 75, 3, 'Guyana', '', ''),
(462, 76, 3, 'Haití', '', ''),
(463, 77, 3, 'Honduras', '', ''),
(464, 78, 3, 'Hungría', '', ''),
(465, 79, 3, 'India', '', ''),
(466, 80, 3, 'Indonesia', '', ''),
(467, 81, 3, 'Irán', '', ''),
(468, 82, 3, 'Iraq', '', ''),
(469, 83, 3, 'Irlanda', '', ''),
(470, 84, 3, 'Islandia', '', ''),
(471, 85, 3, 'Israel', '', ''),
(472, 86, 3, 'Italia', '', ''),
(473, 87, 3, 'Jamaica', '', ''),
(474, 88, 3, 'Japón', '', ''),
(475, 89, 3, 'Jordania', '', ''),
(476, 90, 3, 'Kazajstán', '', ''),
(477, 91, 3, 'Kenia', '', ''),
(478, 92, 3, 'Kirguistán', '', ''),
(479, 93, 3, 'Kiribati', '', ''),
(480, 94, 3, 'Kuwait', '', ''),
(481, 95, 3, 'Laos', '', ''),
(482, 96, 3, 'Lesotho', '', ''),
(483, 97, 3, 'Letonia', '', ''),
(484, 98, 3, 'Líbano', '', ''),
(485, 99, 3, 'Liberia', '', ''),
(486, 100, 3, 'Libia', '', ''),
(487, 101, 3, 'Liechtenstein', '', ''),
(488, 102, 3, 'Lituania', '', ''),
(489, 103, 3, 'Luxemburgo', '', ''),
(490, 104, 3, 'Macedonia', '', ''),
(491, 105, 3, 'Madagascar', '', ''),
(492, 106, 3, 'Malasia', '', ''),
(493, 107, 3, 'Malawi', '', ''),
(494, 108, 3, 'Maldivas', '', ''),
(495, 109, 3, 'Malí', '', ''),
(496, 110, 3, 'Malta', '', ''),
(497, 111, 3, 'Marruecos', '', ''),
(498, 112, 3, 'Marshall', '', ''),
(499, 113, 3, 'Mauricio', '', ''),
(500, 114, 3, 'Mauritania', '', ''),
(501, 115, 3, 'Méjico', '', ''),
(502, 116, 3, 'Micronesia', '', ''),
(503, 117, 3, 'Moldova', '', ''),
(504, 118, 3, 'Mónaco', '', ''),
(505, 119, 3, 'Mongolia', '', ''),
(506, 120, 3, 'Mozambique', '', ''),
(507, 121, 3, 'Namibia', '', ''),
(508, 122, 3, 'Nauru', '', ''),
(509, 123, 3, 'Nepal', '', ''),
(510, 124, 3, 'Nicaragua', '', ''),
(511, 125, 3, 'Níger', '', ''),
(512, 126, 3, 'Nigeria', '', ''),
(513, 127, 3, 'Niue', '', ''),
(514, 128, 3, 'Noruega', '', ''),
(515, 129, 3, 'Nueva Zelandia', '', ''),
(516, 130, 3, 'Omán', '', ''),
(517, 131, 3, 'Uganda', '', ''),
(518, 132, 3, 'Uzbekistán', '', ''),
(519, 133, 3, 'Pakistán', '', ''),
(520, 134, 3, 'Panamá', '', ''),
(521, 135, 3, 'Papua Nueva Guinea', '', ''),
(522, 136, 3, 'Paraguay', '', ''),
(523, 137, 3, 'Países Bajos', '', ''),
(524, 138, 3, 'Perú', '', ''),
(525, 139, 3, 'Filipinas', '', ''),
(526, 140, 3, 'Polonia', '', ''),
(527, 141, 3, 'Portugal', '', ''),
(528, 142, 3, 'Qatar', '', ''),
(529, 143, 3, 'República Centroafricana', '', ''),
(530, 144, 3, 'República Dominicana', '', ''),
(531, 145, 3, 'República Checa', '', ''),
(532, 146, 3, 'Rumania', '', ''),
(533, 147, 3, 'Reino Unido', '', ''),
(534, 148, 3, 'Rusia', '', ''),
(535, 149, 3, 'Ruanda', '', ''),
(536, 150, 3, 'San Cristóbal', '', ''),
(537, 151, 3, 'Santa Lucía', '', ''),
(538, 152, 3, 'San Marino', '', ''),
(539, 153, 3, 'San Vicente y las Granadinas', '', ''),
(540, 154, 3, 'Salomón', '', ''),
(541, 155, 3, 'El Salvador', '', ''),
(542, 156, 3, 'Samoa', '', ''),
(543, 157, 3, 'Santo Tomé y Príncipe', '', ''),
(544, 158, 3, 'Senegal', '', ''),
(545, 159, 3, 'Seychelles', '', ''),
(546, 160, 3, 'Sierra Leona', '', ''),
(547, 161, 3, 'Singapur', '', ''),
(548, 162, 3, 'Eslovaquia', '', ''),
(549, 163, 3, 'Eslovenia', '', ''),
(550, 164, 3, 'Somalia', '', ''),
(551, 165, 3, 'Sudán', '', ''),
(552, 166, 3, 'Sri Lanka', '', ''),
(553, 167, 3, 'Suecia', '', ''),
(554, 168, 3, 'Suiza', '', ''),
(555, 169, 3, 'Suriname', '', ''),
(556, 170, 3, 'Swazilandia', '', ''),
(557, 171, 3, 'Siria', '', ''),
(558, 172, 3, 'Tayikistán', '', ''),
(559, 173, 3, 'Tanzanía', '', ''),
(560, 174, 3, 'Chad', '', ''),
(561, 175, 3, 'Tailandia', '', ''),
(562, 176, 3, 'Togo', '', ''),
(563, 177, 3, 'Tonga', '', ''),
(564, 178, 3, 'Trinidad y Tabago', '', ''),
(565, 179, 3, 'Túnez', '', ''),
(566, 180, 3, 'Turkmenistán', '', ''),
(567, 181, 3, 'Turquía', '', ''),
(568, 182, 3, 'Tuvalu', '', ''),
(569, 183, 3, 'Ucrania', '', ''),
(570, 184, 3, 'Uruguay', '', ''),
(571, 185, 3, 'El Vatican', '', ''),
(572, 186, 3, 'Vanuatu', '', ''),
(573, 187, 3, 'Venezuela', '', ''),
(574, 188, 3, 'Viet Nam', '', ''),
(575, 189, 3, 'Yemen', '', ''),
(576, 190, 3, 'Yugoslavia', '', ''),
(577, 191, 3, 'Zaire', '', ''),
(578, 192, 3, 'Zambia', '', ''),
(579, 193, 3, 'Zimbabwe', '', ''),
(583, 199, 1, 'USA - California', '', ''),
(584, 200, 1, 'USA - Colorado', '', ''),
(585, 201, 1, 'USA - Connecticut', '', ''),
(586, 202, 1, 'USA - Delaware', '', ''),
(587, 203, 1, 'USA - District Of Columbia', '', ''),
(588, 204, 1, 'USA - Florida', '', ''),
(589, 205, 1, 'USA - Georgia', '', ''),
(590, 206, 1, 'USA - Hawaii', '', ''),
(591, 207, 1, 'USA - Idaho', '', ''),
(592, 208, 1, 'USA - Illinois', '', ''),
(593, 209, 1, 'USA - Indiana', '', ''),
(594, 210, 1, 'USA - Iowa', '', ''),
(595, 211, 1, 'USA - Kansas', '', ''),
(596, 212, 1, 'USA - Kentucky', '', ''),
(597, 213, 1, 'USA - Louisiana', '', ''),
(598, 214, 1, 'USA - Maine', '', ''),
(599, 215, 1, 'USA - Maryland', '', ''),
(600, 216, 1, 'USA - Massachusetts', '', ''),
(601, 217, 1, 'USA - Michigan', '', ''),
(602, 218, 1, 'USA - Minnesota', '', ''),
(603, 219, 1, 'USA - Mississippi', '', ''),
(604, 220, 1, 'USA - Missouri', '', ''),
(605, 221, 1, 'USA - Montana', '', ''),
(606, 222, 1, 'USA - Nebraska', '', ''),
(607, 223, 1, 'USA - Nevada', '', ''),
(608, 224, 1, 'USA - New Hampshire', '', ''),
(609, 225, 1, 'USA - New Jersey', '', ''),
(610, 226, 1, 'USA - New Mexico', '', ''),
(611, 227, 1, 'USA - New York', '', ''),
(612, 228, 1, 'USA - North Carolina', '', ''),
(613, 229, 1, 'USA - North Dakota', '', ''),
(614, 230, 1, 'USA - Ohio', '', ''),
(615, 231, 1, 'USA - Oklahoma', '', ''),
(616, 232, 1, 'USA - Oregon', '', ''),
(617, 233, 1, 'USA - Pennsylvania', '', ''),
(618, 234, 1, 'USA - Rhode Island', '', ''),
(619, 235, 1, 'USA - South Carolina', '', ''),
(620, 236, 1, 'USA - South Dakota', '', ''),
(621, 237, 1, 'USA - Tennessee', '', ''),
(622, 238, 1, 'USA - Texas', '', ''),
(623, 239, 1, 'USA - Utah', '', ''),
(624, 240, 1, 'USA - Vermont', '', ''),
(625, 241, 1, 'USA - Virginia', '', ''),
(626, 242, 1, 'USA - Washington', '', ''),
(627, 243, 1, 'USA - West Virginia', '', ''),
(628, 244, 1, 'USA - Wisconsin', '', ''),
(629, 245, 1, 'USA - Wyoming', '', ''),
(630, 196, 2, 'USA - Alaska', '', ''),
(631, 197, 2, 'USA - Arizona', '', ''),
(632, 198, 2, 'USA - Arkansas', '', ''),
(633, 199, 2, 'USA - California', '', ''),
(634, 200, 2, 'USA - Colorado', '', ''),
(635, 201, 2, 'USA - Connecticut', '', ''),
(636, 202, 2, 'USA - Delaware', '', ''),
(637, 203, 2, 'USA - District Of Columbia', '', ''),
(638, 204, 2, 'USA - Florida', '', ''),
(639, 205, 2, 'USA - Georgia', '', ''),
(640, 206, 2, 'USA - Hawaii', '', ''),
(641, 207, 2, 'USA - Idaho', '', ''),
(642, 208, 2, 'USA - Illinois', '', ''),
(643, 209, 2, 'USA - Indiana', '', ''),
(644, 210, 2, 'USA - Iowa', '', ''),
(645, 211, 2, 'USA - Kansas', '', ''),
(646, 212, 2, 'USA - Kentucky', '', ''),
(647, 213, 2, 'USA - Louisiana', '', ''),
(648, 214, 2, 'USA - Maine', '', ''),
(649, 215, 2, 'USA - Maryland', '', ''),
(650, 216, 2, 'USA - Massachusetts', '', ''),
(651, 217, 2, 'USA - Michigan', '', ''),
(652, 218, 2, 'USA - Minnesota', '', ''),
(653, 219, 2, 'USA - Mississippi', '', ''),
(654, 220, 2, 'USA - Missouri', '', ''),
(655, 221, 2, 'USA - Montana', '', ''),
(656, 222, 2, 'USA - Nebraska', '', ''),
(657, 223, 2, 'USA - Nevada', '', ''),
(658, 224, 2, 'USA - New Hampshire', '', ''),
(659, 225, 2, 'USA - New Jersey', '', ''),
(660, 226, 2, 'USA - New Mexico', '', ''),
(661, 227, 2, 'USA - New York', '', ''),
(662, 228, 2, 'USA - North Carolina', '', ''),
(663, 229, 2, 'USA - North Dakota', '', ''),
(664, 230, 2, 'USA - Ohio', '', ''),
(665, 231, 2, 'USA - Oklahoma', '', ''),
(666, 232, 2, 'USA - Oregon', '', ''),
(667, 233, 2, 'USA - Pennsylvania', '', ''),
(668, 234, 2, 'USA - Rhode Island', '', ''),
(669, 235, 2, 'USA - South Carolina', '', ''),
(670, 236, 2, 'USA - South Dakota', '', ''),
(671, 237, 2, 'USA - Tennessee', '', ''),
(672, 238, 2, 'USA - Texas', '', ''),
(673, 239, 2, 'USA - Utah', '', ''),
(674, 240, 2, 'USA - Vermont', '', ''),
(675, 241, 2, 'USA - Virginia', '', ''),
(676, 242, 2, 'USA - Washington', '', ''),
(677, 243, 2, 'USA - West Virginia', '', ''),
(678, 244, 2, 'USA - Wisconsin', '', ''),
(679, 245, 2, 'USA - Wyoming', '', ''),
(680, 196, 3, 'USA - Alaska', '', ''),
(681, 197, 3, 'USA - Arizona', '', ''),
(682, 198, 3, 'USA - Arkansas', '', ''),
(683, 199, 3, 'USA - California', '', ''),
(684, 200, 3, 'USA - Colorado', '', ''),
(685, 201, 3, 'USA - Connecticut', '', ''),
(686, 202, 3, 'USA - Delaware', '', ''),
(687, 203, 3, 'USA - District Of Columbia', '', ''),
(688, 204, 3, 'USA - Florida', '', ''),
(689, 205, 3, 'USA - Georgia', '', ''),
(690, 206, 3, 'USA - Hawaii', '', ''),
(691, 207, 3, 'USA - Idaho', '', ''),
(692, 208, 3, 'USA - Illinois', '', ''),
(693, 209, 3, 'USA - Indiana', '', ''),
(694, 210, 3, 'USA - Iowa', '', ''),
(695, 211, 3, 'USA - Kansas', '', ''),
(696, 212, 3, 'USA - Kentucky', '', ''),
(697, 213, 3, 'USA - Louisiana', '', ''),
(698, 214, 3, 'USA - Maine', '', ''),
(699, 215, 3, 'USA - Maryland', '', ''),
(700, 216, 3, 'USA - Massachusetts', '', ''),
(701, 217, 3, 'USA - Michigan', '', ''),
(702, 218, 3, 'USA - Minnesota', '', ''),
(703, 219, 3, 'USA - Mississippi', '', ''),
(704, 220, 3, 'USA - Missouri', '', ''),
(705, 221, 3, 'USA - Montana', '', ''),
(706, 222, 3, 'USA - Nebraska', '', ''),
(707, 223, 3, 'USA - Nevada', '', ''),
(708, 224, 3, 'USA - New Hampshire', '', ''),
(709, 225, 3, 'USA - New Jersey', '', ''),
(710, 226, 3, 'USA - New Mexico', '', ''),
(711, 227, 3, 'USA - New York', '', ''),
(712, 228, 3, 'USA - North Carolina', '', ''),
(713, 229, 3, 'USA - North Dakota', '', ''),
(714, 230, 3, 'USA - Ohio', '', ''),
(715, 231, 3, 'USA - Oklahoma', '', ''),
(716, 232, 3, 'USA - Oregon', '', ''),
(717, 233, 3, 'USA - Pennsylvania', '', ''),
(718, 234, 3, 'USA - Rhode Island', '', ''),
(719, 235, 3, 'USA - South Carolina', '', ''),
(720, 236, 3, 'USA - South Dakota', '', ''),
(721, 237, 3, 'USA - Tennessee', '', ''),
(722, 238, 3, 'USA - Texas', '', ''),
(723, 239, 3, 'USA - Utah', '', ''),
(724, 240, 3, 'USA - Vermont', '', ''),
(725, 241, 3, 'USA - Virginia', '', ''),
(726, 242, 3, 'USA - Washington', '', ''),
(727, 243, 3, 'USA - West Virginia', '', ''),
(728, 244, 3, 'USA - Wisconsin', '', ''),
(729, 245, 3, 'USA - Wyoming', '', ''),
(783, 247, 2, 'Canada - Alberta', '', ''),
(782, 246, 2, 'Canada - Colombie-Britannique', '', ''),
(781, 258, 1, 'Canada - Nunavut', '', ''),
(780, 257, 1, 'Canada - Territoires-du-Nord-Ouest', '', ''),
(779, 256, 1, 'Canada - Yukon', '', ''),
(778, 255, 1, 'Canada - Terre-Neuve-et-Labrador    ', '', ''),
(777, 254, 1, 'Canada - Île-du-Prince-Édouard    ', '', ''),
(776, 253, 1, 'Canada - Nouvelle-Écosse', '', ''),
(775, 252, 1, 'Canada - Nouveau-Brunswick', '', ''),
(774, 251, 1, 'Canada - Québec', '', ''),
(773, 250, 1, 'Canada - Ontario', '', ''),
(772, 249, 1, 'Canada - Manitoba', '', ''),
(771, 248, 1, 'Canada - Saskatchewan', '', ''),
(770, 247, 1, 'Canada - Alberta', '', ''),
(769, 246, 1, 'Canada - Colombie-Britannique', '', ''),
(790, 254, 2, 'Canada - Île-du-Prince-Édouard    ', '', ''),
(789, 253, 2, 'Canada - Nouvelle-Écosse', '', ''),
(788, 252, 2, 'Canada - Nouveau-Brunswick', '', ''),
(787, 251, 2, 'Canada - Québec', '', ''),
(786, 250, 2, 'Canada - Ontario', '', ''),
(785, 249, 2, 'Canada - Manitoba', '', ''),
(784, 248, 2, 'Canada - Saskatchewan', '', ''),
(791, 255, 2, 'Canada - Terre-Neuve-et-Labrador    ', '', ''),
(792, 256, 2, 'Canada - Yukon', '', ''),
(793, 257, 2, 'Canada - Territoires-du-Nord-Ouest', '', ''),
(794, 258, 2, 'Canada - Nunavut', '', ''),
(795, 246, 3, 'Canada - Colombie-Britannique', '', ''),
(796, 247, 3, 'Canada - Alberta', '', ''),
(797, 248, 3, 'Canada - Saskatchewan', '', ''),
(798, 249, 3, 'Canada - Manitoba', '', ''),
(799, 250, 3, 'Canada - Ontario', '', ''),
(800, 251, 3, 'Canada - Québec', '', ''),
(801, 252, 3, 'Canada - Nouveau-Brunswick', '', ''),
(802, 253, 3, 'Canada - Nouvelle-Écosse', '', ''),
(803, 254, 3, 'Canada - Île-du-Prince-Édouard    ', '', ''),
(804, 255, 3, 'Canada - Terre-Neuve-et-Labrador    ', '', ''),
(805, 256, 3, 'Canada - Yukon', '', ''),
(806, 257, 3, 'Canada - Territoires-du-Nord-Ouest', '', ''),
(807, 258, 3, 'Canada - Nunavut', '', ''),
(808, 259, 1, 'Guadeloupe', '', ''),
(809, 260, 1, 'Guyane Française', '', ''),
(810, 261, 1, 'Martinique', '', ''),
(811, 262, 1, 'Mayotte', '', ''),
(812, 263, 1, 'Réunion(La)', '', ''),
(813, 264, 1, 'St Pierre et Miquelon', '', ''),
(814, 265, 1, 'Nouvelle-Calédonie', '', ''),
(815, 259, 2, 'Guadeloupe', '', ''),
(816, 260, 2, 'Guyane Française', '', ''),
(817, 261, 2, 'Martinique', '', ''),
(818, 262, 2, 'Mayotte', '', ''),
(819, 263, 2, 'Réunion(La)', '', ''),
(820, 264, 2, 'St Pierre et Miquelon', '', ''),
(821, 265, 2, 'Nouvelle-Calédonie', '', ''),
(822, 259, 3, 'Guadeloupe', '', ''),
(823, 260, 3, 'Guyane Française', '', ''),
(824, 261, 3, 'Martinique', '', ''),
(825, 262, 3, 'Mayotte', '', ''),
(826, 263, 3, 'Réunion(La)', '', ''),
(827, 264, 3, 'St Pierre et Miquelon', '', ''),
(828, 265, 3, 'Nouvelle-Calédonie', '', ''),
(829, 266, 1, 'Polynésie française', '', ''),
(830, 266, 2, 'Polynésie française', '', ''),
(831, 266, 3, 'Polynésie française', '', ''),
(832, 267, 1, 'Wallis-et-Futuna', '', ''),
(833, 267, 2, 'Wallis-et-Futuna', '', ''),
(834, 267, 3, 'Wallis-et-Futuna', '', ''),
(835, 268, 1, 'USA - Alabama', '', ''),
(836, 268, 2, 'USA - Alabama', '', ''),
(837, 268, 3, 'USA - Alabama', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `id` int(11) NOT NULL auto_increment,
  `ref` text NOT NULL,
  `datemodif` datetime NOT NULL default '0000-00-00 00:00:00',
  `prix` float NOT NULL default '0',
  `ecotaxe` float NOT NULL,
  `promo` smallint(6) NOT NULL default '0',
  `prix2` float NOT NULL default '0',
  `rubrique` int(11) NOT NULL default '0',
  `nouveaute` smallint(6) NOT NULL default '0',
  `perso` int(11) NOT NULL default '0',
  `stock` int(11) NOT NULL default '0',
  `ligne` smallint(6) NOT NULL default '0',
  `garantie` int(11) NOT NULL default '0',
  `poids` float NOT NULL default '0',
  `tva` float NOT NULL default '0',
  `classement` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `ref` (`ref`(30)),
  KEY `ligne` (`ligne`),
  KEY `rubrique` (`rubrique`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `produitdesc`
--

CREATE TABLE IF NOT EXISTS `produitdesc` (
  `id` int(11) NOT NULL auto_increment,
  `produit` int(11) NOT NULL default '0',
  `lang` int(11) NOT NULL default '0',
  `titre` text NOT NULL,
  `chapo` text NOT NULL,
  `description` text NOT NULL,
  `postscriptum` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `produit` (`produit`,`lang`),
  FULLTEXT KEY `recherche` (`titre`,`chapo`,`description`,`postscriptum`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

CREATE TABLE IF NOT EXISTS `profil` (
  `id` int(11) NOT NULL auto_increment,
  `nom` text NOT NULL,
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=4 ;

--
-- Contenu de la table `profil`
--

INSERT INTO `profil` (`id`, `nom`) VALUES
(1, 'superadministrateur'),
(2, 'gestionnairecommande'),
(3, 'gestionnairecatalogue');

-- --------------------------------------------------------

--
-- Structure de la table `profildesc`
--

CREATE TABLE IF NOT EXISTS `profildesc` (
  `id` int(11) NOT NULL auto_increment,
  `profil` int(11) NOT NULL,
  `titre` text NOT NULL,
  `chapo` text NOT NULL,
  `description` text NOT NULL,
  `postscriptum` text NOT NULL,
  `lang` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `profil` (`profil`,`lang`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=10 ;

--
-- Contenu de la table `profildesc`
--

INSERT INTO `profildesc` (`id`, `profil`, `titre`, `chapo`, `description`, `postscriptum`, `lang`) VALUES
(1, 1, 'Super administrateur', '', '', '', 1),
(2, 2, 'Gestionnaire des commandes', '', '', '', 1),
(3, 3, 'Gestionnaire du catalogue', '', '', '', 1),
(4, 1, 'Super administrator', '', '', '', 2),
(5, 2, 'Order manager', '', '', '', 2),
(6, 3, 'Catalog manager', '', '', '', 2),
(7, 1, 'Super administrador', '', '', '', 3),
(8, 2, 'Gestión de los pedidos', '', '', '', 3),
(9, 3, 'Gestión del catalogo', '', '', '', 3);

-- --------------------------------------------------------

--
-- Structure de la table `promo`
--

CREATE TABLE IF NOT EXISTS `promo` (
  `id` int(11) NOT NULL auto_increment,
  `code` text NOT NULL,
  `type` smallint(6) NOT NULL default '0',
  `valeur` float NOT NULL default '0',
  `mini` float NOT NULL default '0',
  `utilise` int(11) NOT NULL default '0',
  `limite` smallint(6) NOT NULL default '0',
  `datefin` date NOT NULL,
  `actif` tinyint(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `utilise` (`utilise`),
  KEY `code` (`code`(64))
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `promoutil`
--

CREATE TABLE IF NOT EXISTS `promoutil` (
  `id` int(11) NOT NULL auto_increment,
  `promo` int(11) NOT NULL,
  `commande` int(11) NOT NULL,
  `code` text NOT NULL,
  `type` smallint(6) NOT NULL,
  `valeur` float NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `promo` (`promo`),
  KEY `commande` (`commande`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `raison`
--

CREATE TABLE IF NOT EXISTS `raison` (
  `id` int(11) NOT NULL auto_increment,
  `defaut` smallint(6) NOT NULL,
  `classement` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=4 ;

--
-- Contenu de la table `raison`
--

INSERT INTO `raison` (`id`, `defaut`, `classement`) VALUES
(1, 1, 1),
(2, 0, 2),
(3, 0, 3);

-- --------------------------------------------------------

--
-- Structure de la table `raisondesc`
--

CREATE TABLE IF NOT EXISTS `raisondesc` (
  `id` int(11) NOT NULL auto_increment,
  `raison` int(11) NOT NULL,
  `lang` int(11) NOT NULL,
  `court` text NOT NULL,
  `long` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `raison` (`raison`,`lang`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=7 ;

--
-- Contenu de la table `raisondesc`
--

INSERT INTO `raisondesc` (`id`, `raison`, `lang`, `court`, `long`) VALUES
(1, 1, 1, 'Mme', 'Madame'),
(2, 2, 1, 'Mlle', 'Mademoiselle'),
(3, 3, 1, 'M', 'Monsieur'),
(4, 1, 2, 'Mrs', 'Madam'),
(5, 2, 2, 'Miss', 'Miss'),
(6, 3, 2, 'Mr', 'Sir');

-- --------------------------------------------------------

--
-- Structure de la table `reecriture`
--

CREATE TABLE IF NOT EXISTS `reecriture` (
  `id` int(11) NOT NULL auto_increment,
  `url` varchar(255) NOT NULL,
  `fond` varchar(255) NOT NULL,
  `param` varchar(255) NOT NULL,
  `lang` int(11) NOT NULL,
  `actif` smallint(6) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `url` (`url`,`lang`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `rubcaracteristique`
--

CREATE TABLE IF NOT EXISTS `rubcaracteristique` (
  `id` int(11) NOT NULL auto_increment,
  `rubrique` int(11) NOT NULL default '0',
  `caracteristique` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `rubrique` (`rubrique`,`caracteristique`),
  KEY `caracteristique` (`caracteristique`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `rubdeclinaison`
--

CREATE TABLE IF NOT EXISTS `rubdeclinaison` (
  `id` int(11) NOT NULL auto_increment,
  `rubrique` int(11) NOT NULL default '0',
  `declinaison` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `rubrique` (`rubrique`,`declinaison`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `rubrique`
--

CREATE TABLE IF NOT EXISTS `rubrique` (
  `id` int(11) NOT NULL auto_increment,
  `parent` int(11) NOT NULL default '0',
  `lien` text NOT NULL,
  `ligne` smallint(6) NOT NULL default '0',
  `classement` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `parent` (`parent`),
  KEY `ligne` (`ligne`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `rubriquedesc`
--

CREATE TABLE IF NOT EXISTS `rubriquedesc` (
  `id` int(11) NOT NULL auto_increment,
  `rubrique` int(11) NOT NULL default '0',
  `lang` int(11) NOT NULL default '0',
  `titre` text NOT NULL,
  `chapo` text NOT NULL,
  `description` text NOT NULL,
  `postscriptum` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `rubrique` (`rubrique`,`lang`),
  FULLTEXT KEY `recherche` (`titre`,`chapo`,`description`,`postscriptum`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `smtpconfig`
--

CREATE TABLE IF NOT EXISTS `smtpconfig` (
  `id` int(11) NOT NULL auto_increment,
  `serveur` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `secure` varchar(30) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

CREATE TABLE IF NOT EXISTS `statut` (
  `id` int(11) NOT NULL auto_increment,
  `nom` text NOT NULL,
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=6 ;

--
-- Contenu de la table `statut`
--

INSERT INTO `statut` (`id`, `nom`) VALUES
(1, 'nonpaye'),
(2, 'paye'),
(3, 'traitement'),
(4, 'envoye'),
(5, 'annule');

-- --------------------------------------------------------

--
-- Structure de la table `statutdesc`
--

CREATE TABLE IF NOT EXISTS `statutdesc` (
  `id` int(11) NOT NULL auto_increment,
  `statut` int(11) NOT NULL default '0',
  `lang` int(11) NOT NULL default '0',
  `titre` text NOT NULL,
  `chapo` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `statut` (`statut`,`lang`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=33 ;

--
-- Contenu de la table `statutdesc`
--

INSERT INTO `statutdesc` (`id`, `statut`, `lang`, `titre`, `chapo`, `description`) VALUES
(23, 1, 1, 'Non payé', '', ''),
(24, 2, 1, 'payé', '', ''),
(25, 3, 1, 'Traitement', '', ''),
(26, 4, 1, 'Envoyé', '', ''),
(27, 5, 1, 'Annulé', '', ''),
(28, 1, 2, 'Not paid', '', ''),
(29, 2, 2, 'Paid', '', ''),
(30, 3, 2, 'Processed', '', ''),
(31, 4, 2, 'Sent', '', ''),
(32, 5, 2, 'Canceled', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE IF NOT EXISTS `stock` (
  `id` int(11) NOT NULL auto_increment,
  `declidisp` int(11) NOT NULL default '0',
  `produit` int(11) NOT NULL default '0',
  `valeur` int(11) NOT NULL default '0',
  `surplus` float NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `declidisp` (`declidisp`),
  KEY `produit` (`produit`),
  KEY `produit_valeur` (`produit`,`valeur`),
  KEY `declidisp_valeur` (`declidisp`,`valeur`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `transzone`
--

CREATE TABLE IF NOT EXISTS `transzone` (
  `id` int(11) NOT NULL auto_increment,
  `transport` int(11) NOT NULL default '0',
  `zone` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `transport` (`transport`),
  KEY `zone` (`zone`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=2 ;

--
-- Contenu de la table `transzone`
--

INSERT INTO `transzone` (`id`, `transport`, `zone`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `variable`
--

CREATE TABLE IF NOT EXISTS `variable` (
  `id` int(11) NOT NULL auto_increment,
  `nom` text NOT NULL,
  `valeur` text NOT NULL,
  `protege` smallint(6) NOT NULL,
  `cache` smallint(6) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `nom` (`nom`(64))
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=19 ;

--
-- Contenu de la table `variable`
--

INSERT INTO `variable` (`id`, `nom`, `valeur`, `protege`, `cache`) VALUES
(1, 'emailcontact', 'commande@monsite.com', 1, 0),
(2, 'emailfrom', 'commande@monsite.com', 1, 0),
(3, 'nomsite', 'Mon Site', 1, 0),
(4, 'urlsite', 'http://www.monsite.com', 0, 1),
(5, 'tva', '19.6', 1, 0),
(6, 'style_chem', '/template/style_editeur.css', 0, 0),
(7, 'rsspass', '', 1, 0),
(8, 'memcache', '0', 1, 0),
(9, 'version', '1542', 1, 1),
(10, 'rewrite', '0', 1, 0),
(11, 'prx_show_time', '1', 0, 1),
(12, 'prx_use_cache', '1', 0, 1),
(13, 'prx_allow_debug', '0', 0, 1),
(14, 'prx_cache_file_lifetime', '24', 0, 1),
(15, 'prx_cache_check_period', '2', 0, 1),
(16, 'prx_cache_check_time', '1320948202', 0, 1),
(17, 'verifstock', '1', 1, 0),
(18, 'un_domaine_par_langue', '0', 0, 1),
(19, 'action_si_trad_absente', '1', 0, 1),
(20, 'utilisercacheplugin', '0', 1, 0),
(21, 'emailscommande', 'commande@monsite.com', 1, 0),
(22, 'sanitize_admin', 0, 1, 1),
(23, 'htmlpurifier_whiteList', 'www.youtube.com/embed/\nplayer.vimeo.com/video/\nmaps.google.*/', 1, 1),
(24, 'qualite_vignettes_jpeg', '75', 1, 0),
(25, 'qualite_vignettes_png', '7', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `venteadr`
--

CREATE TABLE IF NOT EXISTS `venteadr` (
  `id` int(11) NOT NULL auto_increment,
  `raison` smallint(6) NOT NULL default '0',
  `entreprise` text NOT NULL,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `adresse1` varchar(40) NOT NULL default '',
  `adresse2` varchar(40) NOT NULL default '',
  `adresse3` varchar(40) NOT NULL default '',
  `cpostal` varchar(10) NOT NULL default '',
  `ville` varchar(30) NOT NULL default '',
  `tel` text NOT NULL,
  `pays` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ventedeclidisp`
--

CREATE TABLE IF NOT EXISTS `ventedeclidisp` (
  `id` int(11) NOT NULL auto_increment,
  `venteprod` int(11) NOT NULL,
  `declidisp` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `venteprod` (`venteprod`),
  KEY `declidisp` (`declidisp`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `venteprod`
--

CREATE TABLE IF NOT EXISTS `venteprod` (
  `id` int(11) NOT NULL auto_increment,
  `ref` text NOT NULL,
  `titre` text NOT NULL,
  `chapo` text NOT NULL,
  `description` text NOT NULL,
  `quantite` int(11) NOT NULL default '0',
  `prixu` float NOT NULL default '0',
  `tva` float NOT NULL default '0',
  `commande` int(11) NOT NULL default '0',
  `parent` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `commande` (`commande`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `zone`
--

CREATE TABLE IF NOT EXISTS `zone` (
  `id` int(11) NOT NULL auto_increment,
  `nom` text NOT NULL,
  `unite` float NOT NULL default '0',
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8 ENGINE=MYISAM AUTO_INCREMENT=12 ;

--
-- Contenu de la table `zone`
--

INSERT INTO `zone` (`id`, `nom`, `unite`) VALUES
(1, 'France', 0),
(2, 'inter zone 1', 0),
(3, 'inter Zone 2', 0),
(4, 'inter Zone 3', 0),
(5, 'inter Zone 4', 0),
(6, 'inter Zone 5', 0),
(7, 'inter Zone 6', 0),
(8, 'inter Zone 7', 0),
(9, 'inter Zone 8', 0),
(10, 'Outre-Mer DOM', 0),
(11, 'Outre-Mer TOM', 0);