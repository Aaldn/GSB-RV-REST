drop database if exists gsb_rv;
create database gsb_rv;
use gsb_rv;
-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: gsb_rv
-- ------------------------------------------------------
-- Server version	10.5.15-MariaDB
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!40101 SET NAMES utf8mb4 */
;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;
/*!40103 SET TIME_ZONE='+00:00' */
;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;
--
-- Table structure for table `ActiviteCompl`
--
DROP TABLE IF EXISTS `ActiviteCompl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `ActiviteCompl` (
  `ac_num` int(11) NOT NULL DEFAULT 0,
  `ac_date` date DEFAULT NULL,
  `ac_lieu` varchar(50) DEFAULT NULL,
  `ac_theme` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ac_num`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `ActiviteCompl`
--
LOCK TABLES `ActiviteCompl` WRITE;
/*!40000 ALTER TABLE `ActiviteCompl` DISABLE KEYS */
;
/*!40000 ALTER TABLE `ActiviteCompl` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Composant`
--
DROP TABLE IF EXISTS `Composant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Composant` (
  `cmp_code` varchar(8) NOT NULL DEFAULT '',
  `cmp_libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cmp_code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Composant`
--
LOCK TABLES `Composant` WRITE;
/*!40000 ALTER TABLE `Composant` DISABLE KEYS */
;
/*!40000 ALTER TABLE `Composant` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Constituer`
--
DROP TABLE IF EXISTS `Constituer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Constituer` (
  `med_depotlegal` varchar(20) NOT NULL DEFAULT '',
  `cmp_code` varchar(8) NOT NULL DEFAULT '',
  `cst_qte` float DEFAULT NULL,
  PRIMARY KEY (`med_depotlegal`, `cmp_code`),
  KEY `FK_CONSTITUER_COMPOSANT` (`cmp_code`),
  CONSTRAINT `FK_CONSTITUER_COMPOSANT` FOREIGN KEY (`cmp_code`) REFERENCES `Composant` (`cmp_code`),
  CONSTRAINT `FK_CONSTITUER_MEDICAMENT` FOREIGN KEY (`med_depotlegal`) REFERENCES `Medicament` (`med_depotlegal`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Constituer`
--
LOCK TABLES `Constituer` WRITE;
/*!40000 ALTER TABLE `Constituer` DISABLE KEYS */
;
/*!40000 ALTER TABLE `Constituer` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Dosage`
--
DROP TABLE IF EXISTS `Dosage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Dosage` (
  `dos_code` varchar(20) NOT NULL DEFAULT '',
  `dos_quantite` varchar(20) DEFAULT NULL,
  `dos_unite` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dos_code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Dosage`
--
LOCK TABLES `Dosage` WRITE;
/*!40000 ALTER TABLE `Dosage` DISABLE KEYS */
;
/*!40000 ALTER TABLE `Dosage` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Famille`
--
DROP TABLE IF EXISTS `Famille`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Famille` (
  `fam_code` varchar(6) NOT NULL DEFAULT '',
  `fam_libelle` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`fam_code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Famille`
--
LOCK TABLES `Famille` WRITE;
/*!40000 ALTER TABLE `Famille` DISABLE KEYS */
;
INSERT INTO `Famille`
VALUES ('AA', 'Antalgiques en association'),
  (
    'AAA',
    'Antalgiques antipyrétiques en association'
  ),
  ('AAC', "Antidépresseur d\'action centrale"),
  ('AAH', 'Antivertigineux antihistaminique H1'),
  ('ABA', 'Antibiotique antituberculeux'),
  ('ABC', 'Antibiotique antiacnéique local'),
  (
    'ABP',
    'Antibiotique de la famille des béta-lactamines (pénicilline A)'
  ),
  ('AFC', 'Antibiotique de la famille des cyclines'),
  (
    'AFM',
    'Antibiotique de la famille des macrolides'
  ),
  ('AH', 'Antihistaminique H1 local'),
  (
    'AIM',
    'Antidépresseur imipraminique (tricyclique)'
  ),
  (
    'AIN',
    'Antidépresseur inhibiteur sélectif de la recapture de la sérotonine'
  ),
  ('ALO', 'Antibiotique local (ORL)'),
  ('ANS', 'Antidépresseur IMAO non sélectif'),
  ('AO', 'Antibiotique ophtalmique'),
  ('AP', 'Antipsychotique normothymique'),
  ('AUM', 'Antibiotique urinaire minute'),
  (
    'CRT',
    'Corticoïde, antibiotique et antifongique à usage local'
  ),
  ('HYP', 'Hypnotique antihistaminique'),
  ('PSA', 'Psychostimulant, antiasthénique');
/*!40000 ALTER TABLE `Famille` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Formuler`
--
DROP TABLE IF EXISTS `Formuler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Formuler` (
  `med_depotlegaL` varchar(20) NOT NULL DEFAULT '',
  `pre_code` varchar(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`med_depotlegaL`, `pre_code`),
  KEY `FK_FORMULER_PRESENTATION` (`pre_code`),
  CONSTRAINT `FK_FORMULER_MEDICAMENT` FOREIGN KEY (`med_depotlegaL`) REFERENCES `Medicament` (`med_depotlegal`),
  CONSTRAINT `FK_FORMULER_PRESENTATION` FOREIGN KEY (`pre_code`) REFERENCES `Presentation` (`pre_code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Formuler`
--
LOCK TABLES `Formuler` WRITE;
/*!40000 ALTER TABLE `Formuler` DISABLE KEYS */
;
/*!40000 ALTER TABLE `Formuler` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Interagir`
--
DROP TABLE IF EXISTS `Interagir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Interagir` (
  `med_perturbateur` varchar(20) NOT NULL DEFAULT '',
  `med_perturbe` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`med_perturbateur`, `med_perturbe`),
  KEY `FK_INTERAGIR_PERTURBE_MEDICAMENT` (`med_perturbe`),
  CONSTRAINT `FK_INTERAGIR_PERTURBATEUR_MEDICAMENT` FOREIGN KEY (`med_perturbateur`) REFERENCES `Medicament` (`med_depotlegal`),
  CONSTRAINT `FK_INTERAGIR_PERTURBE_MEDICAMENT` FOREIGN KEY (`med_perturbe`) REFERENCES `Medicament` (`med_depotlegal`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Interagir`
--
LOCK TABLES `Interagir` WRITE;
/*!40000 ALTER TABLE `Interagir` DISABLE KEYS */
;
/*!40000 ALTER TABLE `Interagir` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Inviter`
--
DROP TABLE IF EXISTS `Inviter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Inviter` (
  `ac_num` int(11) NOT NULL DEFAULT 0,
  `pra_num` int(11) NOT NULL DEFAULT 0,
  `specialisation` char(1) DEFAULT NULL,
  PRIMARY KEY (`ac_num`, `pra_num`),
  KEY `FK_INVITER_PRATICIEN` (`pra_num`),
  CONSTRAINT `FK_INVITER_ACTIVITE_COMPL` FOREIGN KEY (`ac_num`) REFERENCES `ActiviteCompl` (`ac_num`),
  CONSTRAINT `FK_INVITER_PRATICIEN` FOREIGN KEY (`pra_num`) REFERENCES `Praticien` (`pra_num`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Inviter`
--
LOCK TABLES `Inviter` WRITE;
/*!40000 ALTER TABLE `Inviter` DISABLE KEYS */
;
/*!40000 ALTER TABLE `Inviter` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Laboratoire`
--
DROP TABLE IF EXISTS `Laboratoire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Laboratoire` (
  `lab_code` varchar(4) NOT NULL DEFAULT '',
  `lab_nom` varchar(20) DEFAULT NULL,
  `lab_chefvente` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`lab_code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Laboratoire`
--
LOCK TABLES `Laboratoire` WRITE;
/*!40000 ALTER TABLE `Laboratoire` DISABLE KEYS */
;
INSERT INTO `Laboratoire`
VALUES ('BC', 'Bichat', 'Suzanne Terminus'),
  ('GY', 'Gyverny', 'Marcel MacDouglas'),
  ('SW', 'Swiss Kane', 'Alain Poutre');
/*!40000 ALTER TABLE `Laboratoire` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Medicament`
--
DROP TABLE IF EXISTS `Medicament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Medicament` (
  `med_depotlegal` varchar(20) NOT NULL DEFAULT '',
  `med_nomcommercial` varchar(50) DEFAULT NULL,
  `fam_code` varchar(6) DEFAULT NULL,
  `med_composition` varchar(510) DEFAULT NULL,
  `med_effets` varchar(510) DEFAULT NULL,
  `med_contreindic` varchar(510) DEFAULT NULL,
  `med_prixechantillon` float DEFAULT NULL,
  PRIMARY KEY (`med_depotlegal`),
  KEY `FK_MEDICAMENT_FAMILLE` (`fam_code`),
  CONSTRAINT `FK_MEDICAMENT_FAMILLE` FOREIGN KEY (`fam_code`) REFERENCES `Famille` (`fam_code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Medicament`
--
LOCK TABLES `Medicament` WRITE;
/*!40000 ALTER TABLE `Medicament` DISABLE KEYS */
;
INSERT INTO `Medicament`
VALUES (
    '3MYC7',
    'TRIMYCINE',
    'CRT',
    'Triamcinolone (acétonide) + Néomycine + Nystatine',
    'Ce médicament est un corticoïde à activité forte ou très forte associé à un antibiotique et un antifongique, utilisé en application locale dans certaines atteintes cutanées surinfectées.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie à l\'\'un des constituants, d\'\'infections de la peau ou de parasitisme non traités, d\'\'acné. Ne pas appliquer sur une plaie, ni sous un pansement occlusif.',
    NULL
  ),
  (
    'ADIMOL9',
    'ADIMOL',
    'ABP',
    'Amoxicilline + Acide clavulanique',
    'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie aux pénicillines ou aux céphalosporines.',
    NULL
  ),
  (
    'AMOPIL7',
    'AMOPIL',
    'ABP',
    'Amoxicilline',
    'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie aux pénicillines. Il doit être administré avec prudence en cas d\'\'allergie aux céphalosporines.',
    NULL
  ),
  (
    'AMOX45',
    'AMOXAR',
    'ABP',
    'Amoxicilline',
    'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.',
    'La prise de ce médicament peut rendre positifs les tests de dépistage du dopage.',
    NULL
  ),
  (
    'AMOXIG12',
    'AMOXI Gé',
    'ABP',
    'Amoxicilline',
    'Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie aux pénicillines. Il doit être administré avec prudence en cas d\'\'allergie aux céphalosporines.',
    NULL
  ),
  (
    'APATOUX22',
    'APATOUX Vitamine C',
    'ALO',
    'Tyrothricine + Tétracène + Acide ascorbique (Vitamine C)',
    'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie à l\'\'un des constituants, en cas de phénylcétonurie et chez l\'\'enfant de moins de 6 ans.',
    NULL
  ),
  (
    'BACTIG10',
    'BACTIGEL',
    'ABC',
    'Erythromycine',
    'Ce médicament est utilisé en application locale pour traiter l\'\'acné et les infections cutanées bactériennes associées.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie aux antibiotiques de la famille des macrolides ou des lincosanides.',
    NULL
  ),
  (
    'BACTIV13',
    'BACTIVIL',
    'AFM',
    'Erythromycine',
    'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie aux macrolides (dont le chef de file est l\'\'érythromycine).',
    NULL
  ),
  (
    'BITALV',
    'BIVALIC',
    'AAA',
    'Dextropropoxyphène + Paracétamol',
    'Ce médicament est utilisé pour traiter les douleurs d\'\'intensité modérée ou intense.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie aux médicaments de cette famille, d\'\'insuffisance hépatique ou d\'\'insuffisance rénale.',
    NULL
  ),
  (
    'CARTION6',
    'CARTION',
    'AAA',
    'Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol',
    'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.',
    'Ce médicament est contre-indiqué en cas de troubles de la coagulation (tendances aux hémorragies), d\'\'ulcère gastroduodénal, maladies graves du foie.',
    NULL
  ),
  (
    'CLAZER6',
    'CLAZER',
    'AFM',
    'Clarithromycine',
    'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques. Il est également utilisé dans le traitement de l\'\'ulcère gastro-duodénal, en association avec d\'\'autres médicaments.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie aux macrolides (dont le chef de file est l\'\'érythromycine).',
    NULL
  ),
  (
    'DEPRIL9',
    'DEPRAMIL',
    'AIM',
    'Clomipramine',
    'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères, certaines douleurs rebelles, les troubles obsessionnels compulsifs et certaines énurésies chez l\'\'enfant.',
    'Ce médicament est contre-indiqué en cas de glaucome ou d\'\'adénome de la prostate, d\'\'infarctus récent, ou si vous avez reçu un traitement par IMAO durant les 2 semaines précédentes ou en cas d\'\'allergie aux atidépresseurs imipraminiques.',
    NULL
  ),
  (
    'DIMIRTAM6',
    'DIMIRTAM',
    'AAC',
    'Mirtazapine',
    'Ce médicament est utilisé pour traiter les épisodes dépressifs sévères.',
    'La prise de ce produit est contre-indiquée en cas de d\'\'allergie à l\'\'un des constituants.',
    NULL
  ),
  (
    'DOLRIL7',
    'DOLORIL',
    'AAA',
    'Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol',
    'Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie au Paracétamol ou aux salicylates.',
    NULL
  ),
  (
    'DORNOM8',
    'NORMADOR',
    'HYP',
    'Doxylamine',
    'Ce médicament est utilisé pour traiter l\'\'insomnie chez l\'\'adulte.',
    'Ce médicament est contre-indiqué en cas de glaucome, de certains troubles urinaires (rétention urinaire) et chez l\'\'enfant de moins de 15 ans.',
    NULL
  ),
  (
    'EQUILARX6',
    'EQUILAR',
    'AAH',
    'Méclozine',
    'Ce médicament est utilisé pour traiter les vertiges et pour prévenir le mal des transports.',
    'Ce médicament ne doit pas être utilisé en cas d\'\'allergie au produit, en cas de glaucome ou de rétention urinaire.',
    NULL
  ),
  (
    'EVILR7',
    'EVEILLOR',
    'PSA',
    'Adrafinil',
    'Ce médicament est utilisé pour traiter les troubles de la vigilance et certains symptomes neurologiques chez le sujet agé.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie à  l\'\'un des constituants.',
    NULL
  ),
  (
    'INSXT5',
    'INSECTIL',
    'AH',
    'Diphénydramine',
    'Ce médicament est utilisé en application locale sur les piqûres d\'\'insecte et l\'\'urticaire.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie aux antihistaminiques.',
    NULL
  ),
  (
    'JOVAI8',
    'JOVENIL',
    'AFM',
    'Josamycine',
    'Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie aux macrolides (dont le chef de file est l\'\'érythromycine).',
    NULL
  ),
  (
    'LIDOXY23',
    'LIDOXYTRACINE',
    'AFC',
    'Oxytétracycline +Lidocaïne',
    'Ce médicament est utilisé en injection intramusculaire pour traiter certaines infections spécifiques.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie à  l\'\'un des constituants. Il ne doit pas être associé aux rétinoïdes.',
    NULL
  ),
  (
    'LITHOR12',
    'LITHORINE',
    'AP',
    'Lithium',
    'Ce médicament est indiqué dans la prévention des psychoses maniaco-dépressives ou pour traiter les états maniaques.',
    'Ce médicament ne doit pas être utilisé si vous êtes allergique au lithium. Avant de prendre ce traitement, signalez à  votre Médecin traitant si vous souffrez d\'\'insuffisance rénale, ou si vous avez un régime sans sel.',
    NULL
  ),
  (
    'PARMOL16',
    'PARMOCODEINE',
    'AA',
    'Codéine + Paracétamol',
    'Ce médicament est utilisé pour le traitement des douleurs lorsque des antalgiques simples ne sont pas assez efficaces.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie à  l\'\'un des constituants, chez l\'\'enfant de moins de 15 Kg, en cas d\'\'insuffisance hépatique ou respiratoire, d\'\'asthme, de phénylcétonurie et chez la femme qui allaite.',
    NULL
  ),
  (
    'PHYSOI8',
    'PHYSICOR',
    'PSA',
    'Sulbutiamine',
    'Ce médicament est utilisé pour traiter les baisses d\'\'activité physique ou psychique, souvent dans un contexte de dépression.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie à l\'\'un des constituants.',
    NULL
  ),
  (
    'PIRIZ8',
    'PIRIZAN',
    'ABA',
    'Pyrazinamide',
    'Ce médicament est utilisé, en association à d\'\'autres antibiotiques, pour traiter la tuberculose.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie à  l\'\'un des constituants, d\'\'insuffisance rénale ou hépatique, d\'\'hyperuricémie ou de porphyrie.',
    NULL
  ),
  (
    'POMDI20',
    'POMADINE',
    'AO',
    'Bacitracine',
    'Ce médicament est utilisé pour traiter les infections oculaires de la surface de l\'\'oeil.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie aux antibiotiques appliqués localement.',
    NULL
  ),
  (
    'TROXT21',
    'TROXADET',
    'AIN',
    'Paroxétine',
    'Ce médicament est utilisé pour traiter la dépression et les troubles obsessionnels compulsifs. Il peut également être utilisé en prévention des crises de panique avec ou sans agoraphobie.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie au produit.',
    NULL
  ),
  (
    'TXISOL22',
    'TOUXISOL Vitamine C',
    'ALO',
    'Tyrothricine + Acide ascorbique (Vitamine C)',
    'Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.',
    'Ce médicament est contre-indiqué en cas d\'\'allergie à l\'\'un des constituants et chez l\'\'enfant de moins de 6 ans.',
    NULL
  ),
  (
    'URIEG6',
    'URIREGUL',
    'AUM',
    'Fosfomycine trométamol',
    'Ce médicament est utilisé pour traiter les infections urinaires simples chez la femme de moins de 65 ans.',
    'La prise de ce médicament est contre-indiquée en cas d\'\'allergie à l\'\'un des constituants et d\'\'insuffisance rénale.',
    NULL
  );
/*!40000 ALTER TABLE `Medicament` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Motif`
--
DROP TABLE IF EXISTS `Motif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Motif` (
  `mot_code` varchar(10) NOT NULL DEFAULT '',
  `mot_libelle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mot_code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Motif`
--
LOCK TABLES `Motif` WRITE;
/*!40000 ALTER TABLE `Motif` DISABLE KEYS */
;
INSERT INTO `Motif`
VALUES (
    'NOUV',
    'Présentation de nouveautés / actualisation'
  ),
  ('PERIO', 'Visite périodique'),
  ('REMON', 'Remontage'),
  ('SOLI', 'Solicitation');
/*!40000 ALTER TABLE `Motif` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Offrir`
--
DROP TABLE IF EXISTS `Offrir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Offrir` (
  `vis_matricule` varchar(20) NOT NULL DEFAULT '',
  `rap_num` int(11) NOT NULL DEFAULT 0,
  `med_depotlegal` varchar(20) NOT NULL DEFAULT '',
  `off_quantite` int(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`vis_matricule`, `rap_num`, `med_depotlegal`),
  KEY `FK_OFFRIR_MEDICAMENT` (`med_depotlegal`),
  CONSTRAINT `FK_OFFRIR_MEDICAMENT` FOREIGN KEY (`med_depotlegal`) REFERENCES `Medicament` (`med_depotlegal`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Offrir`
--
LOCK TABLES `Offrir` WRITE;
/*!40000 ALTER TABLE `Offrir` DISABLE KEYS */
;
INSERT INTO `Offrir`
VALUES ('a131', 1, 'EVILR7', 2),
  ('a131', 1, 'PHYSOI8', 5);
/*!40000 ALTER TABLE `Offrir` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Posseder`
--
DROP TABLE IF EXISTS `Posseder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Posseder` (
  `pra_num` int(11) NOT NULL DEFAULT 0,
  `spe_code` varchar(10) NOT NULL DEFAULT '',
  `pos_diplome` varchar(20) DEFAULT NULL,
  `pos_coefprescription` float DEFAULT NULL,
  PRIMARY KEY (`pra_num`, `spe_code`),
  KEY `FK_POSSEDER_SPECIALITE` (`spe_code`),
  CONSTRAINT `FK_POSSEDER_PRATICIEN` FOREIGN KEY (`pra_num`) REFERENCES `Praticien` (`pra_num`),
  CONSTRAINT `FK_POSSEDER_SPECIALITE` FOREIGN KEY (`spe_code`) REFERENCES `Specialite` (`spe_code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Posseder`
--
LOCK TABLES `Posseder` WRITE;
/*!40000 ALTER TABLE `Posseder` DISABLE KEYS */
;
/*!40000 ALTER TABLE `Posseder` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Praticien`
--
DROP TABLE IF EXISTS `Praticien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Praticien` (
  `pra_num` int(11) NOT NULL DEFAULT 0,
  `pra_nom` varchar(50) DEFAULT NULL,
  `pra_prenom` varchar(60) DEFAULT NULL,
  `pra_adresse` varchar(100) DEFAULT NULL,
  `pra_cp` varchar(10) DEFAULT NULL,
  `pra_ville` varchar(50) DEFAULT NULL,
  `pra_coefnotoriete` float DEFAULT NULL,
  `typ_code` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`pra_num`),
  KEY `FK_PRATICIEN_TYPE_PRATICIEN` (`typ_code`),
  CONSTRAINT `FK_PRATICIEN_TYPE_PRATICIEN` FOREIGN KEY (`typ_code`) REFERENCES `TypePraticien` (`typ_code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Praticien`
--
LOCK TABLES `Praticien` WRITE;
/*!40000 ALTER TABLE `Praticien` DISABLE KEYS */
;
INSERT INTO `Praticien`
VALUES (
    1,
    'Notini',
    'Alain',
    '114 r Authie',
    '85000',
    'LA ROCHE SUR YON',
    290.03,
    'MH'
  ),
  (
    2,
    'Gosselin',
    'Albert',
    '13 r Devon',
    '41000',
    'BLOIS',
    307.49,
    'MV'
  ),
  (
    3,
    'Delahaye',
    'André',
    '36 av 6 Juin',
    '25000',
    'BESANCON',
    185.79,
    'PS'
  ),
  (
    4,
    'Leroux',
    'André',
    '47 av Robert Schuman',
    '60000',
    'BEAUVAIS',
    172.04,
    'PH'
  ),
  (
    5,
    'Desmoulins',
    'Anne',
    '31 r St Jean',
    '30000',
    'NIMES',
    94.75,
    'PO'
  ),
  (
    6,
    'Mouel',
    'Anne',
    '27 r Auvergne',
    '80000',
    'AMIENS',
    45.2,
    'MH'
  ),
  (
    7,
    'Desgranges-Lentz',
    'Antoine',
    '1 r Albert de Mun',
    '29000',
    'MORLAIX',
    20.07,
    'MV'
  ),
  (
    8,
    'Marcouiller',
    'Arnaud',
    '31 r St Jean',
    '68000',
    'MULHOUSE',
    396.52,
    'PS'
  ),
  (
    9,
    'Dupuy',
    'Benoit',
    '9 r Demolombe',
    '34000',
    'MONTPELLIER',
    395.66,
    'PH'
  ),
  (
    10,
    'Lerat',
    'Bernard',
    '31 r St Jean',
    '59000',
    'LILLE',
    257.79,
    'PO'
  ),
  (
    11,
    'Marçais-Lefebvre',
    'Bertrand',
    '86Bis r Basse',
    '67000',
    'STRASBOURG',
    450.96,
    'MH'
  ),
  (
    12,
    'Boscher',
    'Bruno',
    '94 r Falaise',
    '10000',
    'TROYES',
    356.14,
    'MV'
  ),
  (
    13,
    'Morel',
    'Catherine',
    '21 r Chateaubriand',
    '75000',
    'PARIS',
    379.57,
    'PS'
  ),
  (
    14,
    'Guivarch',
    'Chantal',
    '4 av Gén Laperrine',
    '45000',
    'ORLEANS',
    114.56,
    'PH'
  ),
  (
    15,
    'Bessin-Grosdoit',
    'Christophe',
    '92 r Falaise',
    '6000',
    'NICE',
    222.06,
    'PO'
  ),
  (
    16,
    'Rossa',
    'Claire',
    '14 av Thiès',
    '6000',
    'NICE',
    529.78,
    'MH'
  ),
  (
    17,
    'Cauchy',
    'Denis',
    '5 av Ste Thérèse',
    '11000',
    'NARBONNE',
    458.82,
    'MV'
  ),
  (
    18,
    'Gaffé',
    'Dominique',
    '9 av 1ère Armée Française',
    '35000',
    'RENNES',
    213.4,
    'PS'
  ),
  (
    19,
    'Guenon',
    'Dominique',
    '98 bd Mar Lyautey',
    '44000',
    'NANTES',
    175.89,
    'PH'
  ),
  (
    20,
    'Prévot',
    'Dominique',
    '29 r Lucien Nelle',
    '87000',
    'LIMOGES',
    151.36,
    'PO'
  ),
  (
    21,
    'Houchard',
    'Eliane',
    '9 r Demolombe',
    '49100',
    'ANGERS',
    436.96,
    'MH'
  ),
  (
    22,
    'Desmons',
    'Elisabeth',
    '51 r Bernières',
    '29000',
    'QUIMPER',
    281.17,
    'MV'
  ),
  (
    23,
    'Flament',
    'Elisabeth',
    '11 r Pasteur',
    '35000',
    'RENNES',
    315.6,
    'PS'
  ),
  (
    24,
    'Goussard',
    'Emmanuel',
    '9 r Demolombe',
    '41000',
    'BLOIS',
    40.72,
    'PH'
  ),
  (
    25,
    'Desprez',
    'Eric',
    '9 r Vaucelles',
    '33000',
    'BORDEAUX',
    406.85,
    'PO'
  ),
  (
    26,
    'Coste',
    'Evelyne',
    '29 r Lucien Nelle',
    '19000',
    'TULLE',
    441.87,
    'MH'
  ),
  (
    27,
    'Lefebvre',
    'Frédéric',
    '2 pl Wurzburg',
    '55000',
    'VERDUN',
    573.63,
    'MV'
  ),
  (
    28,
    'Lemée',
    'Frédéric',
    '29 av 6 Juin',
    '56000',
    'VANNES',
    326.4,
    'PS'
  ),
  (
    29,
    'Martin',
    'Frédéric',
    'Bât A 90 r Bayeux',
    '70000',
    'VESOUL',
    506.06,
    'PH'
  ),
  (
    30,
    'Marie',
    'Frédérique',
    '172 r Caponière',
    '70000',
    'VESOUL',
    313.31,
    'PO'
  ),
  (
    31,
    'Rosenstech',
    'Geneviève',
    '27 r Auvergne',
    '75000',
    'PARIS',
    366.82,
    'MH'
  ),
  (
    32,
    'Pontavice',
    'Ghislaine',
    '8 r Gaillon',
    '86000',
    'POITIERS',
    265.58,
    'MV'
  ),
  (
    33,
    'Leveneur-Mosquet',
    'Guillaume',
    '47 av Robert Schuman',
    '64000',
    'PAU',
    184.97,
    'PS'
  ),
  (
    34,
    'Blanchais',
    'Guy',
    '30 r Authie',
    '8000',
    'SEDAN',
    502.48,
    'PH'
  ),
  (
    35,
    'Leveneur',
    'Hugues',
    '7 pl St Gilles',
    '62000',
    'ARRAS',
    7.39,
    'PO'
  ),
  (
    36,
    'Mosquet',
    'Isabelle',
    '22 r Jules Verne',
    '76000',
    'ROUEN',
    77.1,
    'MH'
  ),
  (
    37,
    'Giraudon',
    'Jean-Christophe',
    '1 r Albert de Mun',
    '38100',
    'VIENNE',
    92.62,
    'MV'
  ),
  (
    38,
    'Marie',
    'Jean-Claude',
    '26 r Hérouville',
    '69000',
    'LYON',
    120.1,
    'PS'
  ),
  (
    39,
    'Maury',
    'Jean-François',
    '5 r Pierre Girard',
    '71000',
    'CHALON SUR SAONE',
    13.73,
    'PH'
  ),
  (
    40,
    'Dennel',
    'Jean-Louis',
    '7 pl St Gilles',
    '28000',
    'CHARTRES',
    550.69,
    'PO'
  ),
  (
    41,
    'Ain',
    'Jean-Pierre',
    '4 résid Olympia',
    '2000',
    'LAON',
    5.59,
    'MH'
  ),
  (
    42,
    'Chemery',
    'Jean-Pierre',
    '51 pl Ancienne Boucherie',
    '14000',
    'CAEN',
    396.58,
    'MV'
  ),
  (
    43,
    'Comoz',
    'Jean-Pierre',
    '35 r Auguste Lechesne',
    '18000',
    'BOURGES',
    340.35,
    'PS'
  ),
  (
    44,
    'Desfaudais',
    'Jean-Pierre',
    '7 pl St Gilles',
    '29000',
    'BREST',
    71.76,
    'PH'
  ),
  (
    45,
    'Phan',
    'Jérôme',
    '9 r Clos Caillet',
    '79000',
    'NIORT',
    451.61,
    'PO'
  ),
  (
    46,
    'Riou',
    'Line',
    '43 bd Gén Vanier',
    '77000',
    'MARNE LA VALLEE',
    193.25,
    'MH'
  ),
  (
    47,
    'Chubilleau',
    'Louis',
    '46 r Eglise',
    '17000',
    'SAINTES',
    202.07,
    'MV'
  ),
  (
    48,
    'Lebrun',
    'Lucette',
    '178 r Auge',
    '54000',
    'NANCY',
    410.41,
    'PS'
  ),
  (
    49,
    'Goessens',
    'Marc',
    '6 av 6 Juin',
    '39000',
    'DOLE',
    548.57,
    'PH'
  ),
  (
    50,
    'Laforge',
    'Marc',
    '5 résid Prairie',
    '50000',
    'SAINT LO',
    265.05,
    'PO'
  ),
  (
    51,
    'Millereau',
    'Marc',
    '36 av 6 Juin',
    '72000',
    'LA FERTE BERNARD',
    430.42,
    'MH'
  ),
  (
    52,
    'Dauverne',
    'Marie-Christine',
    '69 av Charlemagne',
    '21000',
    'DIJON',
    281.05,
    'MV'
  ),
  (
    53,
    'Vittorio',
    'Myriam',
    '3 pl Champlain',
    '94000',
    'BOISSY SAINT LEGER',
    356.23,
    'PS'
  ),
  (
    54,
    'Lapasset',
    'Nhieu',
    '31 av 6 Juin',
    '52000',
    'CHAUMONT',
    107,
    'PH'
  ),
  (
    55,
    'Plantet-Besnier',
    'Nicole',
    '10 av 1ère Armée Française',
    '86000',
    'CHATELLEREAULT',
    369.94,
    'PO'
  ),
  (
    56,
    'Chubilleau',
    'Pascal',
    '3 r Hastings',
    '15000',
    'AURRILLAC',
    290.75,
    'MH'
  ),
  (
    57,
    'Robert',
    'Pascal',
    '31 r St Jean',
    '93000',
    'BOBIGNY',
    162.41,
    'MV'
  ),
  (
    58,
    'Jean',
    'Pascale',
    '114 r Authie',
    '49100',
    'SAUMUR',
    375.52,
    'PS'
  ),
  (
    59,
    'Chanteloube',
    'Patrice',
    '14 av Thiès',
    '13000',
    'MARSEILLE',
    478.01,
    'PH'
  ),
  (
    60,
    'Lecuirot',
    'Patrice',
    'résid St Pères 55 r Pigacière',
    '54000',
    'NANCY',
    239.66,
    'PO'
  ),
  (
    61,
    'Gandon',
    'Patrick',
    '47 av Robert Schuman',
    '37000',
    'TOURS',
    599.06,
    'MH'
  ),
  (
    62,
    'Mirouf',
    'Patrick',
    '22 r Puits Picard',
    '74000',
    'ANNECY',
    458.42,
    'MV'
  ),
  (
    63,
    'Boireaux',
    'Philippe',
    '14 av Thiès',
    '10000',
    'CHALON EN CHAMPAGNE',
    454.48,
    'PS'
  ),
  (
    64,
    'Cendrier',
    'Philippe',
    '7 pl St Gilles',
    '12000',
    'RODEZ',
    164.16,
    'PH'
  ),
  (
    65,
    'Duhamel',
    'Philippe',
    '114 r Authie',
    '34000',
    'MONTPELLIER',
    98.62,
    'PO'
  ),
  (
    66,
    'Grigy',
    'Philippe',
    '15 r Mélingue',
    '44000',
    'CLISSON',
    285.1,
    'MH'
  ),
  (
    67,
    'Linard',
    'Philippe',
    '1 r Albert de Mun',
    '81000',
    'ALBI',
    486.3,
    'MV'
  ),
  (
    68,
    'Lozier',
    'Philippe',
    '8 r Gaillon',
    '31000',
    'TOULOUSE',
    48.4,
    'PS'
  ),
  (
    69,
    'Dechâtre',
    'Pierre',
    '63 av Thiès',
    '23000',
    'MONTLUCON',
    253.75,
    'PH'
  ),
  (
    70,
    'Goessens',
    'Pierre',
    '22 r Jean Romain',
    '40000',
    'MONT DE MARSAN',
    426.19,
    'PO'
  ),
  (
    71,
    'Leménager',
    'Pierre',
    '39 av 6 Juin',
    '57000',
    'METZ',
    118.7,
    'MH'
  ),
  (
    72,
    'Née',
    'Pierre',
    '39 av 6 Juin',
    '82000',
    'MONTAUBAN',
    72.54,
    'MV'
  ),
  (
    73,
    'Guyot',
    'Pierre-Laurent',
    '43 bd Gén Vanier',
    '48000',
    'MENDE',
    352.31,
    'PS'
  ),
  (
    74,
    'Chauchard',
    'Roger',
    '9 r Vaucelles',
    '13000',
    'MARSEILLE',
    552.19,
    'PH'
  ),
  (
    75,
    'Mabire',
    'Roland',
    '11 r Boutiques',
    '67000',
    'STRASBOURG',
    422.39,
    'PO'
  ),
  (
    76,
    'Leroy',
    'Soazig',
    '45 r Boutiques',
    '61000',
    'ALENCON',
    570.67,
    'MH'
  ),
  (
    77,
    'Guyot',
    'Stéphane',
    '26 r Hérouville',
    '46000',
    'FIGEAC',
    28.85,
    'MV'
  ),
  (
    78,
    'Delposen',
    'Sylvain',
    '39 av 6 Juin',
    '27000',
    'DREUX',
    292.01,
    'PS'
  ),
  (
    79,
    'Rault',
    'Sylvie',
    '15 bd Richemond',
    '2000',
    'SOISSON',
    526.6,
    'PH'
  ),
  (
    80,
    'Renouf',
    'Sylvie',
    '98 bd Mar Lyautey',
    '88000',
    'EPINAL',
    425.24,
    'PO'
  ),
  (
    81,
    'Alliet-Grach',
    'Thierry',
    '14 av Thiès',
    '7000',
    'PRIVAS',
    451.31,
    'MH'
  ),
  (
    82,
    'Bayard',
    'Thierry',
    '92 r Falaise',
    '42000',
    'SAINT ETIENNE',
    271.71,
    'MV'
  ),
  (
    83,
    'Gauchet',
    'Thierry',
    '7 r Desmoueux',
    '38100',
    'GRENOBLE',
    406.1,
    'PS'
  ),
  (
    84,
    'Bobichon',
    'Tristan',
    '219 r Caponière',
    '9000',
    'FOIX',
    218.36,
    'PH'
  ),
  (
    85,
    'Duchemin-Laniel',
    'Véronique',
    '130 r St Jean',
    '33000',
    'LIBOURNE',
    265.61,
    'PO'
  ),
  (
    86,
    'Laurent',
    'Younès',
    '34 r Demolombe',
    '53000',
    'MAYENNE',
    496.1,
    'MH'
  );
/*!40000 ALTER TABLE `Praticien` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Prescrire`
--
DROP TABLE IF EXISTS `Prescrire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Prescrire` (
  `med_depotlegal` varchar(20) NOT NULL DEFAULT '',
  `tin_code` varchar(10) NOT NULL DEFAULT '',
  `dos_code` varchar(20) NOT NULL DEFAULT '',
  `pre_posologie` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`med_depotlegal`, `tin_code`, `dos_code`),
  KEY `FK_PRESCRIRE_TYPE_INDIVIDU` (`tin_code`),
  KEY `FK_PRESCRIRE_DOSAGE` (`dos_code`),
  CONSTRAINT `FK_PRESCRIRE_DOSAGE` FOREIGN KEY (`dos_code`) REFERENCES `Dosage` (`dos_code`),
  CONSTRAINT `FK_PRESCRIRE_MEDICAMENT` FOREIGN KEY (`med_depotlegal`) REFERENCES `Medicament` (`med_depotlegal`),
  CONSTRAINT `FK_PRESCRIRE_TYPE_INDIVIDU` FOREIGN KEY (`tin_code`) REFERENCES `TypeIndividu` (`tin_code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Prescrire`
--
LOCK TABLES `Prescrire` WRITE;
/*!40000 ALTER TABLE `Prescrire` DISABLE KEYS */
;
/*!40000 ALTER TABLE `Prescrire` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Presentation`
--
DROP TABLE IF EXISTS `Presentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Presentation` (
  `pre_code` varchar(4) NOT NULL DEFAULT '',
  `pre_libelle` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`pre_code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Presentation`
--
LOCK TABLES `Presentation` WRITE;
/*!40000 ALTER TABLE `Presentation` DISABLE KEYS */
;
/*!40000 ALTER TABLE `Presentation` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `RapportVisite`
--
DROP TABLE IF EXISTS `RapportVisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `RapportVisite` (
  `vis_matricule` varchar(20) NOT NULL DEFAULT '',
  `rap_num` int(11) NOT NULL DEFAULT 0,
  `rap_date_visite` date NOT NULL,
  `rap_date_redaction` date NOT NULL DEFAULT CURRENT_DATE(),
  `rap_bilan` varchar(510) DEFAULT '',
  `rap_coefficient` int(11) NOT NULL DEFAULT 0,
  `pra_num` int(11) DEFAULT NULL,
  `rap_motif` varchar(10) DEFAULT NULL,
  `rap_lu` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`vis_matricule`, `rap_num`),
  KEY `FK_RAPPORT_VISITE_PRATICIEN` (`pra_num`),
  KEY `FK_RAPPORT_MOTIF` (`rap_motif`),
  CONSTRAINT `FK_RAPPORT_MOTIF` FOREIGN KEY (`rap_motif`) REFERENCES `Motif` (`mot_code`),
  CONSTRAINT `FK_RAPPORT_VISITE_PRATICIEN` FOREIGN KEY (`pra_num`) REFERENCES `Praticien` (`pra_num`),
  CONSTRAINT `FK_RAPPORT_VISITE_VISITEUR` FOREIGN KEY (`vis_matricule`) REFERENCES `Visiteur` (`vis_matricule`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `RapportVisite`
--
LOCK TABLES `RapportVisite` WRITE;
/*!40000 ALTER TABLE `RapportVisite` DISABLE KEYS */
;
INSERT INTO `RapportVisite`
VALUES (
    'a131',
    1,
    '2021-09-05',
    '2021-09-06',
    'L\'entrevue a duré 35 minutes, et le praticien a été receptif.',
    3,
    57,
    'PERIO',
    0
  ),
  (
    'a17',
    2,
    '2021-09-14',
    '2021-09-16',
    'L\'entrevue a duré 20 minutes, et le praticien n\'a pas été receptif.',
    2,
    53,
    'NOUV',
    0
  ),
  (
    'a17',
    5,
    '2021-10-01',
    '2021-10-05',
    'L\'entrevue n\'a durée que 15 minutes, car le praticien n\'a pas souhaité poursuivre.',
    1,
    18,
    'NOUV',
    0
  ),
  (
    'a17',
    6,
    '2021-10-06',
    '2021-10-08',
    'L\'entrevue a duré 25 minutes, et le praticien était hésitant.',
    2,
    62,
    'PERIO',
    0
  ),
  (
    'a17',
    8,
    '2021-10-12',
    '2021-10-14',
    'L\'entrevue a duré 20 minutes, et le praticien n\'a pas été receptif.',
    2,
    84,
    'NOUV',
    0
  ),
  (
    'a17',
    10,
    '2021-10-17',
    '2021-10-30',
    'L\'entrevue a duré 40 minutes, et une autre visite a été planifiée avec le praticien.',
    5,
    36,
    'SOLI',
    0
  ),
  (
    'b16',
    3,
    '2021-09-14',
    '2021-09-15',
    'L\'entrevue a duré 2 minutes, et le praticien m\'a chassé de son cabinet.',
    0,
    8,
    'REMON',
    0
  ),
  (
    'b16',
    9,
    '2021-10-24',
    '2021-10-25',
    'L\'entrevue a duré 2 minutes, et le praticien m\'a chassé de son cabinet.',
    0,
    30,
    'REMON',
    0
  ),
  (
    'g53',
    4,
    '2021-09-23',
    '2021-09-26',
    'L\'entrevue a duré 45 minutes, et le praticien a été très enthousiaste.',
    5,
    13,
    'NOUV',
    0
  ),
  (
    'o26',
    7,
    '2021-10-07',
    '2021-10-08',
    'L\'entrevue a duré 40 minutes, et une autre visite a été planifiée avec le praticien.',
    5,
    69,
    'SOLI',
    0
  );
/*!40000 ALTER TABLE `RapportVisite` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Realiser`
--
DROP TABLE IF EXISTS `Realiser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Realiser` (
  `ac_num` int(11) NOT NULL DEFAULT 0,
  `vis_matricule` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`ac_num`, `vis_matricule`),
  KEY `FK_REALISER_VISITEUR` (`vis_matricule`),
  CONSTRAINT `FK_REALISER_ACTIVITE_COMPL` FOREIGN KEY (`ac_num`) REFERENCES `ActiviteCompl` (`ac_num`),
  CONSTRAINT `FK_REALISER_VISITEUR` FOREIGN KEY (`vis_matricule`) REFERENCES `Visiteur` (`vis_matricule`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Realiser`
--
LOCK TABLES `Realiser` WRITE;
/*!40000 ALTER TABLE `Realiser` DISABLE KEYS */
;
/*!40000 ALTER TABLE `Realiser` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Region`
--
DROP TABLE IF EXISTS `Region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Region` (
  `reg_code` varchar(4) NOT NULL DEFAULT '',
  `sec_code` varchar(2) DEFAULT NULL,
  `reg_nom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`reg_code`),
  KEY `FK_REGION_SECTEUR` (`sec_code`),
  CONSTRAINT `FK_REGION_SECTEUR` FOREIGN KEY (`sec_code`) REFERENCES `Secteur` (`sec_code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Region`
--
LOCK TABLES `Region` WRITE;
/*!40000 ALTER TABLE `Region` DISABLE KEYS */
;
INSERT INTO `Region`
VALUES ('AL', 'E', 'Alsace Lorraine'),
  ('AQ', 'S', 'Aquitaine'),
  ('AU', 'P', 'Auvergne'),
  ('BG', 'O', 'Bretagne'),
  ('BN', 'O', 'Basse Normandie'),
  ('BO', 'E', 'Bourgogne'),
  ('CA', 'N', 'Champagne Ardennes'),
  ('CE', 'P', 'Centre'),
  ('FC', 'E', 'Franche Comté'),
  ('HN', 'N', 'Haute Normandie'),
  ('IF', 'P', 'Ile de France'),
  ('LG', 'S', 'Languedoc'),
  ('LI', 'P', 'Limousin'),
  ('MP', 'S', 'Midi Pyrénée'),
  ('NP', 'N', 'Nord Pas de Calais'),
  ('PA', 'S', 'Provence Alpes Cote d\'\'Azur'),
  ('PC', 'O', 'Poitou Charente'),
  ('PI', 'N', 'Picardie'),
  ('PL', 'O', 'Pays de Loire'),
  ('RA', 'E', 'Rhone Alpes'),
  ('RO', 'S', 'Roussilon'),
  ('VD', 'O', 'Vendée');
/*!40000 ALTER TABLE `Region` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Secteur`
--
DROP TABLE IF EXISTS `Secteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Secteur` (
  `sec_code` varchar(2) NOT NULL DEFAULT '',
  `sec_libelle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sec_code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Secteur`
--
LOCK TABLES `Secteur` WRITE;
/*!40000 ALTER TABLE `Secteur` DISABLE KEYS */
;
INSERT INTO `Secteur`
VALUES ('E', 'Est'),
  ('N', 'Nord'),
  ('O', 'Ouest'),
  ('P', 'Paris centre'),
  ('S', 'Sud');
/*!40000 ALTER TABLE `Secteur` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Specialite`
--
DROP TABLE IF EXISTS `Specialite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Specialite` (
  `spe_code` varchar(10) NOT NULL DEFAULT '',
  `spe_libelle` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`spe_code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Specialite`
--
LOCK TABLES `Specialite` WRITE;
/*!40000 ALTER TABLE `Specialite` DISABLE KEYS */
;
INSERT INTO `Specialite`
VALUES ('ACP', 'anatomie et cytologie pathologiques'),
  ('AMV', 'angéiologie, Médecine vasculaire'),
  (
    'ARC',
    'anesthésiologie et réanimation chirurgicale'
  ),
  ('BM', 'biologie médicale'),
  (
    'CAC',
    'cardiologie et affections cardio-vasculaires'
  ),
  (
    'CCT',
    'chirurgie cardio-vasculaire et thoracique'
  ),
  ('CG', 'chirurgie générale'),
  ('CMF', 'chirurgie maxillo-faciale'),
  ('COM', 'cancérologie, oncologie médicale'),
  ('COT', 'chirurgie orthopédique et traumatologie'),
  (
    'CPR',
    'chirurgie plastique reconstructrice et esthétique'
  ),
  ('CU', 'chirurgie urologique'),
  ('CV', 'chirurgie vasculaire'),
  ('DN', 'diabétologie-nutrition, nutrition'),
  ('DV', 'dermatologie et vénéréologie'),
  ('EM', 'endocrinologie et métabolismes'),
  ('ETD', 'évaluation et traitement de la douleur'),
  (
    'GEH',
    'gastro-entérologie et hépatologie (appareil digestif)'
  ),
  ('GMO', 'gynécologie médicale, obstétrique'),
  ('GO', 'gynécologie-obstétrique'),
  ('HEM', 'maladies du sang (hématologie)'),
  ('MBS', 'Médecine et biologie du sport'),
  ('MDT', 'Médecine du travail'),
  ('MMO', 'Médecine manuelle - ostéopathie'),
  ('MN', 'Médecine nucléaire'),
  ('MPR', 'Médecine physique et de réadaptation'),
  (
    'MTR',
    'Médecine tropicale, pathologie infectieuse et tropicale'
  ),
  ('NEP', 'néphrologie'),
  ('NRC', 'neurochirurgie'),
  ('NRL', 'neurologie'),
  ('ODM', 'orthopédie dento maxillo-faciale'),
  ('OPH', 'ophtalmologie'),
  ('ORL', 'oto-rhino-laryngologie'),
  (
    'PEA',
    'psychiatrie de l\'\'enfant et de l\'\'adolescent'
  ),
  ('PME', 'pédiatrie maladies des enfants'),
  ('PNM', 'pneumologie'),
  ('PSC', 'psychiatrie'),
  (
    'RAD',
    'radiologie (radiodiagnostic et imagerie médicale)'
  ),
  (
    'RDT',
    'radiothérapie (oncologie option radiothérapie)'
  ),
  ('RGM', 'reproduction et gynécologie médicale'),
  ('RHU', 'rhumatologie'),
  ('STO', 'stomatologie'),
  ('SXL', 'sexologie'),
  ('TXA', 'toxicomanie et alcoologie');
/*!40000 ALTER TABLE `Specialite` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Travailler`
--
DROP TABLE IF EXISTS `Travailler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Travailler` (
  `vis_matricule` varchar(20) NOT NULL DEFAULT '',
  `jjmmaa` date NOT NULL,
  `reg_code` varchar(4) NOT NULL DEFAULT '',
  `tra_role` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`vis_matricule`, `jjmmaa`, `reg_code`),
  KEY `FK_TRAVAILLER_REGION` (`reg_code`),
  CONSTRAINT `FK_TRAVAILLER_REGION` FOREIGN KEY (`reg_code`) REFERENCES `Region` (`reg_code`),
  CONSTRAINT `FK_TRAVAILLER_VISITEUR` FOREIGN KEY (`vis_matricule`) REFERENCES `Visiteur` (`vis_matricule`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Travailler`
--
LOCK TABLES `Travailler` WRITE;
/*!40000 ALTER TABLE `Travailler` DISABLE KEYS */
;
INSERT INTO `Travailler`
VALUES ('a131', '2014-01-05', 'BN', 'Visiteur'),
  ('a131', '2014-03-03', 'BG', 'Visiteur'),
  ('a17', '2014-01-05', 'RA', 'Visiteur'),
  ('a55', '2014-03-02', 'RO', 'Visiteur'),
  ('a93', '2008-02-10', 'PC', 'Visiteur'),
  ('b13', '2014-03-03', 'AL', 'Visiteur'),
  ('b16', '2014-04-04', 'BG', 'Visiteur'),
  ('b19', '2008-02-10', 'PL', 'Visiteur'),
  ('b25', '2001-01-01', 'PL', 'Délégué'),
  ('b25', '2014-03-02', 'PL', 'Visiteur'),
  ('b28', '2008-02-10', 'LG', 'Visiteur'),
  ('b34', '2014-01-20', 'CE', 'Délégué'),
  ('b4', '2003-03-01', 'AQ', 'Visiteur'),
  ('b50', '2003-03-01', 'PA', 'Visiteur'),
  ('b59', '2014-03-02', 'RA', 'Visiteur'),
  ('c14', '2003-03-01', 'PA', 'Responsable'),
  ('c14', '2014-04-04', 'PA', 'Délégué'),
  ('c3', '2014-01-05', 'CA', 'Visiteur'),
  ('c54', '2014-01-05', 'AL', 'Visiteur'),
  ('d13', '2014-01-05', 'PL', 'Visiteur'),
  ('d51', '2003-03-01', 'FC', 'Responsable'),
  ('e22', '2014-03-12', 'AL', 'Visiteur'),
  ('e24', '2008-02-10', 'AL', 'Responsable'),
  ('e39', '2014-03-12', 'IF', 'Visiteur'),
  ('e49', '2014-03-03', 'MP', 'Visiteur'),
  ('e5', '2003-03-01', 'AQ', 'Responsable'),
  ('e52', '2014-01-05', 'HN', 'Visiteur'),
  ('f21', '2014-01-20', 'RA', 'Visiteur'),
  ('f39', '2014-04-04', 'RA', 'Visiteur'),
  ('f4', '2014-03-02', 'MP', 'Visiteur'),
  ('g19', '2014-03-03', 'IF', 'Visiteur'),
  ('g30', '2003-03-01', 'PI', 'Responsable'),
  ('g53', '2014-02-20', 'BG', 'Visiteur'),
  ('g7', '2014-03-03', 'LI', 'Visiteur'),
  ('h13', '2014-01-20', 'LI', 'Visiteur'),
  ('h30', '2003-03-01', 'IF', 'Visiteur'),
  ('h35', '2014-01-20', 'AU', 'Visiteur'),
  ('h40', '2014-01-05', 'CA', 'Visiteur'),
  ('j45', '2003-03-01', 'CA', 'Responsable'),
  ('j50', '2014-01-05', 'NP', 'Visiteur'),
  ('j8', '2008-02-10', 'IF', 'Responsable'),
  ('k4', '2014-03-03', 'LG', 'Visiteur'),
  ('k53', '2014-01-05', 'AL', 'Délégué'),
  ('k53', '2014-02-20', 'CA', 'Visiteur'),
  ('l14', '2014-03-02', 'PL', 'Visiteur'),
  ('l23', '2014-03-02', 'PC', 'Visiteur'),
  ('l46', '2014-03-03', 'PL', 'Visiteur'),
  ('l56', '2014-03-03', 'FC', 'Visiteur'),
  ('m35', '2014-03-12', 'MP', 'Visiteur'),
  ('m45', '2014-03-12', 'AL', 'Visiteur'),
  ('n42', '2014-03-03', 'HN', 'Visiteur'),
  ('n58', '2014-01-05', 'CE', 'Visiteur'),
  ('n59', '2014-03-02', 'PI', 'Visiteur'),
  ('o26', '2014-03-02', 'LG', 'Visiteur'),
  ('p32', '2014-01-20', 'IF', 'Visiteur'),
  ('p40', '2008-02-10', 'BN', 'Responsable'),
  ('p41', '2008-02-10', 'PC', 'Visiteur'),
  ('p42', '2014-03-02', 'PI', 'Visiteur'),
  ('p49', '2014-02-20', 'CE', 'Visiteur'),
  ('p49', '2015-02-20', 'CE', 'Délégué'),
  ('p49', '2017-02-20', 'CE', 'Responsable'),
  ('p49', '2018-02-20', 'CE', 'Visiteur'),
  ('p6', '2004-05-02', 'AQ', 'Visiteur'),
  ('p7', '2014-03-12', 'RO', 'Visiteur'),
  ('p8', '2014-01-05', 'BO', 'Visiteur'),
  ('q17', '2003-03-01', 'BN', 'Visiteur'),
  ('r24', '2014-02-20', 'BN', 'Visiteur'),
  ('r58', '2014-03-12', 'BG', 'Visiteur'),
  ('s10', '2014-03-03', 'FC', 'Visiteur'),
  ('s21', '2014-01-05', 'LI', 'Visiteur'),
  ('t43', '2014-03-02', 'BO', 'Visiteur'),
  ('t47', '2004-05-02', 'PI', 'Visiteur'),
  ('t55', '2014-03-02', 'MP', 'Visiteur'),
  ('t60', '2014-03-12', 'CE', 'Visiteur');
/*!40000 ALTER TABLE `Travailler` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `TypeIndividu`
--
DROP TABLE IF EXISTS `TypeIndividu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `TypeIndividu` (
  `tin_code` varchar(10) NOT NULL DEFAULT '',
  `tin_libelle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`tin_code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `TypeIndividu`
--
LOCK TABLES `TypeIndividu` WRITE;
/*!40000 ALTER TABLE `TypeIndividu` DISABLE KEYS */
;
/*!40000 ALTER TABLE `TypeIndividu` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `TypePraticien`
--
DROP TABLE IF EXISTS `TypePraticien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `TypePraticien` (
  `typ_code` varchar(6) NOT NULL DEFAULT '',
  `typ_libelle` varchar(50) DEFAULT NULL,
  `typ_lieu` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`typ_code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `TypePraticien`
--
LOCK TABLES `TypePraticien` WRITE;
/*!40000 ALTER TABLE `TypePraticien` DISABLE KEYS */
;
INSERT INTO `TypePraticien`
VALUES (
    'MH',
    'Médecin Hospitalier',
    'Hopital ou clinique'
  ),
  ('MV', 'Médecine de Ville', 'Cabinet'),
  (
    'PH',
    'Pharmacien Hospitalier',
    'Hopital ou clinique'
  ),
  ('PO', 'Pharmacien Officine', 'Pharmacie'),
  ('PS', 'Personnel de santé', 'Centre paramédical');
/*!40000 ALTER TABLE `TypePraticien` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `Visiteur`
--
DROP TABLE IF EXISTS `Visiteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!40101 SET character_set_client = utf8 */
;
CREATE TABLE `Visiteur` (
  `vis_matricule` varchar(20) NOT NULL DEFAULT '',
  `vis_nom` varchar(50) DEFAULT NULL,
  `vis_prenom` varchar(100) DEFAULT NULL,
  `vis_adresse` varchar(100) DEFAULT NULL,
  `vis_cp` varchar(10) DEFAULT NULL,
  `vis_ville` varchar(60) DEFAULT NULL,
  `vis_dateembauche` date DEFAULT NULL,
  `sec_code` varchar(2) DEFAULT NULL,
  `lab_code` varchar(4) DEFAULT NULL,
  `vis_mdp` varchar(30) DEFAULT 'azerty',
  PRIMARY KEY (`vis_matricule`),
  KEY `FK_VISITEUR_SECTEUR` (`sec_code`),
  KEY `FK_VISITEUR_LABORATOIRE` (`lab_code`),
  CONSTRAINT `FK_VISITEUR_LABORATOIRE` FOREIGN KEY (`lab_code`) REFERENCES `Laboratoire` (`lab_code`),
  CONSTRAINT `FK_VISITEUR_SECTEUR` FOREIGN KEY (`sec_code`) REFERENCES `Secteur` (`sec_code`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `Visiteur`
--
LOCK TABLES `Visiteur` WRITE;
/*!40000 ALTER TABLE `Visiteur` DISABLE KEYS */
;
INSERT INTO `Visiteur`
VALUES (
    'a131',
    'Villechalane',
    'Louis',
    '8 cours Lafontaine',
    '29000',
    'BREST',
    '2012-11-08',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'a17',
    'Andre',
    'David',
    '1 rue Aimon de Chissee',
    '38100',
    'GRENOBLE',
    '2008-06-19',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'a55',
    'Bedos',
    'Christian',
    '1 rue Bénédictins',
    '65000',
    'TARBES',
    '2007-09-07',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'a93',
    'Tusseau',
    'Louis',
    '22 rue Renou',
    '86000',
    'POITIERS',
    '2001-02-09',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'b13',
    'Bentot',
    'Pascal',
    '11 avenue 6 Juin',
    '67000',
    'STRASBOURG',
    '2003-11-06',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'b16',
    'Bioret',
    'Luc',
    '1 rue Linne',
    '35000',
    'RENNES',
    '2003-01-06',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'b19',
    'Bunisset',
    'Francis',
    '10 rue Nicolas Chorier',
    '85000',
    'LA ROCHE SUR YON',
    '2013-09-23',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'b25',
    'Bunisset',
    'Denise',
    '1 rue Lionne',
    '49100',
    'ANGERS',
    '2007-03-04',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'b28',
    'Cacheux',
    'Bernard',
    '114 rue Authie',
    '34000',
    'MONTPELLIER',
    '2008-02-10',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'b34',
    'Cadic',
    'Eric',
    '123 rue Caponière',
    '41000',
    'BLOIS',
    '2012-06-03',
    'P',
    'SW',
    'azerty'
  ),
  (
    'b4',
    'Charoze',
    'Catherine',
    '100 place Géants',
    '33000',
    'BORDEAUX',
    '2009-05-07',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'b50',
    'Clepkens',
    'Christophe',
    '12 rue Fédérico Garcia Lorca',
    '13000',
    'MARSEILLE',
    '2011-08-18',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'b59',
    'Cottin',
    'Vincenne',
    '36 square Capucins',
    '5000',
    'GAP',
    '2010-12-19',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'c14',
    'Daburon',
    'François',
    '13 rue Champs Elysées',
    '6000',
    'NICE',
    '2012-01-20',
    'S',
    'SW',
    'azerty'
  ),
  (
    'c3',
    'De',
    'Philippe',
    '13 rue Charles Peguy',
    '10000',
    'TROYES',
    '2005-05-29',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'c54',
    'Debelle',
    'Michel',
    '181 rue Caponière',
    '88000',
    'EPINAL',
    '2004-09-19',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'd13',
    'Debelle',
    'Jeanne',
    '134 rue Stalingrad',
    '44000',
    'NANTES',
    '2012-05-25',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'd51',
    'Debroise',
    'Michel',
    '2 avenue 6 Juin',
    '70000',
    'VESOUL',
    '2011-08-17',
    'E',
    'GY',
    'azerty'
  ),
  (
    'e22',
    'Desmarquest',
    'Nathalie',
    '14 rue Fédérico Garcia Lorca',
    '54000',
    'NANCY',
    '2013-04-18',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'e24',
    'Desnost',
    'Pierre',
    '16 rue Barral de Montferrat',
    '55000',
    'VERDUN',
    '2013-04-18',
    'E',
    'SW',
    'azerty'
  ),
  (
    'e39',
    'Dudouit',
    'Frédéric',
    '18 quai Xavier Jouvin',
    '75000',
    'PARIS',
    '2013-04-18',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'e49',
    'Duncombe',
    'Claude',
    '19 avenue Alsace Lorraine',
    '9000',
    'FOIX',
    '2012-09-16',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'e5',
    'Enault-Pascreau',
    'Céline',
    '25B rue Stalingrad',
    '40000',
    'MONT DE MARSAN',
    '2012-09-16',
    'S',
    'GY',
    'azerty'
  ),
  (
    'e52',
    'Eynde',
    'Valérie',
    '3 rue Henri Moissan',
    '76000',
    'ROUEN',
    '2012-09-16',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'f21',
    'Finck',
    'Jacques',
    'route Montreuil Bellay',
    '74000',
    'ANNECY',
    '2012-09-16',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'f39',
    'Frémont',
    'Fernande',
    '4 rue Jean Giono',
    '69000',
    'LYON',
    '2005-05-29',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'f4',
    'Gest',
    'Alain',
    '30 rue Authie',
    '46000',
    'FIGEAC',
    '2005-05-29',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'g19',
    'Gheysen',
    'Galassus',
    '32 boulevard Mar Foch',
    '75000',
    'PARIS',
    '2005-05-29',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'g30',
    'Girard',
    'Yvon',
    '31 avenue du 6 Juin',
    '80000',
    'AMIENS',
    '2012-05-25',
    'N',
    'GY',
    'azerty'
  ),
  (
    'g53',
    'Gombert',
    'Luc',
    '32 rue Emile Gueymard',
    '56000',
    'VANNES',
    '2012-05-25',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'g7',
    'Guindon',
    'Caroline',
    '40 rue Mar Montgomery',
    '87000',
    'LIMOGES',
    '2012-05-25',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'h13',
    'Guindon',
    'François',
    '44 rue Picotière',
    '19000',
    'TULLE',
    '2012-05-25',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'h30',
    'Igigabel',
    'Guy',
    '33 rue Arlequin',
    '94000',
    'CRETEIL',
    '2008-06-19',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'h35',
    'Jourdren',
    'Pierre',
    '34 avenue Jean Perrot',
    '15000',
    'AURRILLAC',
    '2008-06-19',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'h40',
    'Juttard',
    'Pierre-Raoul',
    '34 cours Jean Jaurès',
    '8000',
    'SEDAN',
    '2008-06-19',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'j45',
    'Euré-Morel',
    'Saout',
    '38 cours Berriat',
    '52000',
    'CHAUMONT',
    '2008-06-19',
    'N',
    'SW',
    'azerty'
  ),
  (
    'j50',
    'Landré',
    'Philippe',
    '4 avenue du Général Laperrine',
    '59000',
    'LILLE',
    '2000-05-01',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'j8',
    'Langeard',
    'Hugues',
    '39 avenue Jean Perrot',
    '93000',
    'BAGNOLET',
    '2000-05-01',
    'P',
    'GY',
    'azerty'
  ),
  (
    'k4',
    'Lanne',
    'Bernard',
    '4 rue Bayeux',
    '30000',
    'NIMES',
    '2000-05-01',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'k53',
    'Le',
    'Noël',
    '4 avenue Beauvert',
    '68000',
    'MULHOUSE',
    '2000-05-01',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'l14',
    'Le',
    'Jean',
    '39 rue Raspail',
    '53000',
    'LAVAL',
    '2000-05-01',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'l23',
    'Leclercq',
    'Servane',
    '11 rue Quinconce',
    '18000',
    'BOURGES',
    '1998-11-23',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'l46',
    'Lecornu',
    'Jean-Bernard',
    '4 boulevard du Maréchal Foch',
    '72000',
    'LA FERTE BERNARD',
    '1998-11-23',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'l56',
    'Lecornu',
    'Ludovic',
    '4 rue Abel Servien',
    '25000',
    'BESANCON',
    '1998-11-23',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'm35',
    'Lejard',
    'Agnès',
    '4 rue Anthoard',
    '82000',
    'MONTAUBAN',
    '1998-11-23',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'm45',
    'Lesaulnier',
    'Pascal',
    '47 rue Thiers',
    '57000',
    'METZ',
    '1998-11-23',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'n42',
    'Letessier',
    'Stéphane',
    '5 chemin de Capuche',
    '27000',
    'EVREUX',
    '1998-11-23',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'n58',
    'Loirat',
    'Didier',
    '12 avenue Bourg la Croix',
    '45000',
    'ORLEANS',
    '1998-11-23',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'n59',
    'Maffezzoli',
    'Thibaud',
    '5 rue Chateaubriand',
    '2000',
    'LAON',
    '2005-12-21',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'o26',
    'Mancini',
    'Anne',
    '5 rue D\'\'Agier',
    '48000',
    'MENDE',
    '2005-12-21',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'p32',
    'Marcouiller',
    'Gérard',
    '7 place St Gilles',
    '91000',
    'ISSY LES MOULINEAUX',
    '2005-12-21',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'p40',
    'Michel',
    'Jean-Claude',
    '5 rue Gabriel Péri',
    '61000',
    'FLERS',
    '2005-12-21',
    'O',
    'SW',
    'azerty'
  ),
  (
    'p41',
    'Montecot',
    'Françoise',
    '6 rue Paul Valéry',
    '17000',
    'SAINTES',
    '2005-12-21',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'p42',
    'Notini',
    'Veronique',
    '5 rue du Lieutenant Chabal',
    '60000',
    'BEAUVAIS',
    '2005-12-21',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'p49',
    'Onfroy',
    'Den',
    '5 rue Sidonie Jacolin',
    '37000',
    'TOURS',
    '2005-12-21',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'p6',
    'Pascreau',
    'Charles',
    '57 boulevard Mar Foch',
    '64000',
    'PAU',
    '1997-03-30',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'p7',
    'Pernot',
    'Claude-Noël',
    '6 rue Alexandre 1 de Yougoslavie',
    '11000',
    'NARBONNE',
    '2003-01-02',
    NULL,
    'SW',
    'azerty'
  ),
  (
    'p8',
    'Perrier',
    'Maître',
    '6 rue Aubert Dubayet',
    '71000',
    'CHALON SUR SAONE',
    '2006-06-23',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'q17',
    'Petit',
    'Jean-Louis',
    '7 rue Ernest Renan',
    '50000',
    'SAINT LO',
    '2009-06-07',
    NULL,
    'GY',
    'azerty'
  ),
  (
    'r24',
    'Piquery',
    'Patrick',
    '9 rue Vaucelles',
    '14000',
    'CAEN',
    '2007-04-29',
    'O',
    'GY',
    'azerty'
  ),
  (
    'r58',
    'Quiquandon',
    'Joëll',
    '7 rue Ernest Renan',
    '29000',
    'QUIMPER',
    '2006-09-30',
    NULL,
    'GY',
    'azerty'
  ),
  (
    's10',
    'Retailleau',
    'Josselin',
    '88 bis rue Saumuroise',
    '39000',
    'DOLE',
    '2011-12-05',
    NULL,
    'SW',
    'azerty'
  ),
  (
    's21',
    'Retailleau',
    'Pascal',
    '32 boulevard Ayrault',
    '23000',
    'MONTLUCON',
    '2009-05-09',
    NULL,
    'SW',
    'azerty'
  ),
  (
    't43',
    'Souron',
    'Maryse',
    '7B rue Gay Lussac',
    '21000',
    'DIJON',
    '2003-09-03',
    NULL,
    'SW',
    'azerty'
  ),
  (
    't47',
    'Tiphagne',
    'Patrick',
    '7B rue Gay Lussac',
    '62000',
    'ARRAS',
    '1997-08-29',
    NULL,
    'SW',
    'azerty'
  ),
  (
    't55',
    'Tréhet',
    'Alain',
    '7D chemin Barral',
    '12000',
    'RODEZ',
    '1994-11-29',
    NULL,
    'SW',
    'azerty'
  ),
  (
    't60',
    'Tusseau',
    'Josselin',
    '63 rue Bon Repos',
    '28000',
    'CHARTRES',
    '1991-03-29',
    NULL,
    'GY',
    'azerty'
  );
/*!40000 ALTER TABLE `Visiteur` ENABLE KEYS */
;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */
;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */
;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */
;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */
;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */
;
-- Dump completed on 2022-03-14 10:41:04