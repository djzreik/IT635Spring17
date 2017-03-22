-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: WoW
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ClassSpecs`
--

DROP TABLE IF EXISTS `ClassSpecs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClassSpecs` (
  `ClassID` int(11) NOT NULL,
  `SpecID` int(11) NOT NULL,
  KEY `ClassID` (`ClassID`),
  KEY `SpecID` (`SpecID`),
  CONSTRAINT `ClassSpecs_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `Classes` (`ClassID`),
  CONSTRAINT `ClassSpecs_ibfk_2` FOREIGN KEY (`SpecID`) REFERENCES `Specs` (`SpecID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClassSpecs`
--

LOCK TABLES `ClassSpecs` WRITE;
/*!40000 ALTER TABLE `ClassSpecs` DISABLE KEYS */;
INSERT INTO `ClassSpecs` VALUES (1,1),(1,2),(1,3),(12,4),(12,5),(2,6),(2,7),(2,8),(2,9),(3,10),(3,11),(3,12),(4,13),(4,14),(4,15),(5,16),(5,17),(5,18),(6,19),(6,20),(6,21),(7,22),(7,23),(7,24),(8,25),(8,26),(8,27),(9,28),(9,29),(9,30),(10,31),(10,32),(10,33),(11,34),(11,35),(11,36);
/*!40000 ALTER TABLE `ClassSpecs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Classes`
--

DROP TABLE IF EXISTS `Classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Classes` (
  `Name` varchar(255) NOT NULL,
  `ClassID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Classes`
--

LOCK TABLES `Classes` WRITE;
/*!40000 ALTER TABLE `Classes` DISABLE KEYS */;
INSERT INTO `Classes` VALUES ('Death Knight',1),('Druid',2),('Hunter ',3),('Mage',4),('Monk',5),('Paladin',6),('Priest ',7),('Rogue',8),('Shaman',9),('Warlock',10),('Warrior',11),('Demon Hunter',12);
/*!40000 ALTER TABLE `Classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipment`
--

DROP TABLE IF EXISTS `Equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Equipment` (
  `Name` varchar(255) NOT NULL,
  `EquipmentID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) NOT NULL,
  `PrimaryStat` varchar(255) NOT NULL,
  `Slot` varchar(255) NOT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `SpecID` int(11) DEFAULT NULL,
  PRIMARY KEY (`EquipmentID`),
  KEY `ClassID` (`ClassID`),
  KEY `SpecID` (`SpecID`),
  CONSTRAINT `Equipment_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `Classes` (`ClassID`),
  CONSTRAINT `Equipment_ibfk_2` FOREIGN KEY (`SpecID`) REFERENCES `Specs` (`SpecID`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipment`
--

LOCK TABLES `Equipment` WRITE;
/*!40000 ALTER TABLE `Equipment` DISABLE KEYS */;
INSERT INTO `Equipment` VALUES ('Dreadwyrm Crown',1,'Plate','Strength','Head',1,1),('Dreadwyrm Breastplate',2,'Plate','Strength','Chest',1,1),('Dreadwyrm Legplates',3,'Plate','Strength','Legs',1,1),('Dreadwyrm Shoulderguards',4,'Plate','Strength','Shoulders',1,1),('Demonwyrm Crown',5,'Plate','Agility','Head',1,2),('Demonwyrm Breastplate',6,'Plate','Agility','Chest',1,2),('Demonwyrm Legplates',7,'Plate','Agility','Legs',1,2),('Demonwyrm Shoulderguards',8,'Plate','Agility','Shoulders',1,2),('Bloodwyrm Crown',9,'Plate','Stamina','Head',1,3),('Bloodwyrm Breastplate',10,'Plate','Stamina','Chest',1,3),('Bloodwyrm Legplates',11,'Plate','Stamina','Legs',1,3),('Bloodwyrm Shoulderguards',12,'Plate','Stamina','Shoulders',1,3),('Mask Of Second Sight',13,'Leather','Agility','Head',12,4),('Tunic Of Second Sight',14,'Leather','Agility','Chest',12,4),('Legwraps of Second Sight',15,'Leather','Agility','Legs',12,4),('Shoulderguards of Second Sight',16,'Plate','Strength','Shoulders',12,4),('Mask Of Third Sight',17,'Leather','Stamina','Head',12,5),('Tunic Of Third Sight',18,'Leather','Stamina','Chest',12,5),('Legwraps of Third Sight',19,'Leather','Stamina','Legs',12,5),('Shoulderguards of Third Sight',20,'Plate','Stamina','Shoulders',12,5),('Hood of the Astral Warden',21,'Leather','Agility','Head',2,6),('Robe of the Astral Warden',22,'Leather','Agility','Chest',2,6),('Leggings of the Astral Warden',23,'Leather','Agility','Legs',2,6),('Mantle of the Astral Warden',24,'Leather','Agility','Shoulders',2,6),('Hood of the Spectral Warden',25,'Leather','Intellect','Head',2,7),('Robe of the Spectral Warden',26,'Leather','Intellect','Chest',2,7),('Leggings of the Spectral Warden',27,'Leather','Intellect','Legs',2,7),('Mantle of the Spectral Warden',28,'Leather','Intellect','Shoulders',2,7),('Hood of the Orbital Warden',29,'Leather','Stamina','Head',2,8),('Robe of the Orbital Warden',30,'Leather','Stamina','Chest',2,8),('Leggings of the Orbital Warden',31,'Leather','Stamina','Legs',2,8),('Mantle of the Orbital Warden',32,'Leather','Stamina','Shoulders',2,8),('Hood of the Portal Warden',33,'Leather','Spirit','Head',2,9),('Robe of the Portal Warden',34,'Leather','Spirit','Chest',2,9),('Leggings of the Portal Warden',35,'Leather','Spirit','Legs',2,9),('Mantle of the Portal Warden',36,'Leather','Spirit','Shoulders',2,9),('Eagletalon Cowl',37,'Mail','Agility','Head',3,10),('Eagletalon Tunic',38,'Mail','Agility','Chest',3,10),('Eagletalon Legchains',39,'Mail','Agility','Legs',3,10),('Eagletalon Spaulders',40,'Mail','Agility','Shoulders',3,10),('Hawktalon Cowl',41,'Mail','Versatility','Head',3,11),('Hawktalon Tunic',42,'Mail','Versatility','Chest',3,11),('Hawktalon Legchains',43,'Mail','Versatility','Legs',3,11),('Hawktalon Spaulders',44,'Mail','Versatility','Shoulders',3,11),('Harpietalon Cowl',45,'Mail','Mastery','Head',3,12),('Harpietalon Tunic',46,'Mail','Mastery','Chest',3,12),('Harpietalon Legchains',47,'Mail','Mastery','Legs',3,12),('Harpietalon Spaulders',48,'Mail','Mastery','Shoulders',3,12),('Hood of Everburning Knowledge',49,'Cloth','Intellect','Head',4,13),('Robe of Everburning Knowledge',50,'Cloth','Intellect','Chest',4,13),('Leggings of Everburning Knowledge',51,'Cloth','Intellect','Legs',4,13),('Mantle of Everburning Knowledge',52,'Cloth','Mastery','Shoulders',4,13),('Hood of Foreverburning Knowledge',53,'Cloth','Mastery','Head',4,14),('Robe of Foreverburning Knowledge',54,'Cloth','Mastery','Chest',4,14),('Leggings of Foreverburning Knowledge',55,'Cloth','Mastery','Legs',4,14),('Mantle of Foreverburning Knowledge',56,'Cloth','Mastery','Shoulders',4,14),('Hood of Everfreezing Knowledge',57,'Cloth','Haste','Head',4,15),('Robe of Everfreezing Knowledge',58,'Cloth','Haste','Chest',4,15),('Leggings of Everfreezing Knowledge',59,'Cloth','Haste','Legs',4,15),('Mantle of Everfreezing Knowledge',60,'Cloth','Haste','Shoulders',4,15),('Hood of Enveloped Dissonance',61,'Leather','Stamina','Head',5,16),('Tunic of Enveloped Dissonance',62,'Leather','Stamina','Chest',5,16),('Leggings of Enveloped Dissonance',63,'Leather','Stamina','Legs',5,16),('Pauldrons of Enveloped Dissonance',64,'Leather','Stamina','Shoulders',5,16),('Hood of Developed Dissonance',65,'Leather','Spirit','Head',5,17),('Tunic of Developed Dissonance',66,'Leather','Spirit','Chest',5,17),('Leggings of Developed Dissonance',67,'Leather','Spirit','Legs',5,17),('Pauldrons of Developed Dissonance',68,'Leather','Spirit','Shoulders',5,17),('Hood of Undeveloped Dissonance',69,'Leather','Agility','Head',5,18),('Tunic of Undeveloped Dissonance',70,'Leather','Agility','Chest',5,18),('Leggings of Undeveloped Dissonance',71,'Leather','Agility','Legs',5,18),('Pauldrons of Undeveloped Dissonance',72,'Leather','Agility','Shoulders',5,18),('Helmet of the Highlord',73,'Plate','Spirit','Head',6,19),('Breastplate of the Highlord',74,'Plate','Spirit','Chest',6,19),('Legplates of the Highlord',75,'Plate','Spirit','Legs',6,19),('Pauldrons of the Highlord',76,'Plate','Spirit','Shoulders',6,19),('Helmet of the Lowlord',77,'Plate','Stamina','Head',6,20),('Breastplate of the Lowlord',78,'Plate','Stamina','Chest',6,20),('Legplates of the Lowlord',79,'Plate','Stamina','Legs',6,20),('Pauldrons of the Lowlord',80,'Plate','Stamina','Shoulders',6,20),('Helmet of the Midlord',81,'Plate','Strength','Head',6,21),('Breastplate of the Midlord',82,'Plate','Strength','Chest',6,21),('Legplates of the Midlord',83,'Plate','Strength','Legs',6,21),('Pauldrons of the Midlord',84,'Plate','Strength','Shoulders',6,21),('Purifier\'s Gorget',85,'Cloth','Spirit','Head',7,22),('Purifier\'s Cassock',86,'Cloth','Spirit','Chest',7,22),('Purifier\'s Leggings',87,'Cloth','Spirit','Legs',7,22),('Purifier\'s Mantle',88,'Cloth','Spirit','Shoulders',7,22),('Redeemer\'s Gorget',89,'Cloth','Intellect','Head',7,23),('Redeemer\'s Cassock',90,'Cloth','Intellect','Chest',7,23),('Redeemer\'s Leggings',91,'Cloth','Intellect','Legs',7,23),('Redeemer\'s Mantle',92,'Cloth','Intellect','Shoulders',7,23),('Invoker\'s Gorget',93,'Cloth','Mastery','Head',7,24),('Invoker\'s Cassock',94,'Cloth','Mastery','Chest',7,24),('Invoker\'s Leggings',95,'Cloth','Mastery','Legs',7,24),('Invoker\'s Mantle',96,'Cloth','Mastery','Shoulders',7,24),('Doomblade Cowl',97,'Leather','Agility','Head',8,25),('Doomblade Tunic',98,'Leather','Agility','Chest',8,25),('Doomblade Pants',99,'Leather','Agility','Legs',8,25),('Doomblade Spaulders',100,'Leather','Agility','Shoulders',8,25),('Zoomblade Cowl',101,'Leather','Versatility','Head',8,26),('Zoomblade Tunic',102,'Leather','Versatility','Chest',8,26),('Zoomblade Pants',103,'Leather','Versatility','Legs',8,26),('Zoomblade Spaulders',104,'Leather','Versatility','Shoulders',8,26),('Smallblade Cowl',105,'Leather','Crit Strike','Head',8,27),('Smallblade Tunic',106,'Leather','Crit Strike','Chest',8,27),('Smallblade Pants',107,'Leather','Crit Strike','Legs',8,27),('Smallblade Spaulders',108,'Leather','Crit Strike','Shoulders',8,27),('Helm of Shackled Elements',109,'Mail','Spirit','Head',9,28),('Raiment of Shackled Elements',110,'Mail','Spirit','Chest',9,28),('Leggings of Shackled Elements',111,'Mail','Spirit','Legs',9,28),('Pauldrons of Shackled Elements',112,'Mail','Spirit','Shoulders',9,28),('Helm of Broken Elements',113,'Mail','Strength','Head',9,29),('Raiment of Broken Elements',114,'Mail','Strength','Chest',9,29),('Leggings of Broken Elements',115,'Mail','Strength','Legs',9,29),('Pauldrons of Broken Elements',116,'Mail','Strength','Shoulders',9,29),('Helm of Pure Elements',117,'Mail','Intellect','Head',9,30),('Raiment of Pure Elements',118,'Mail','Intellect','Chest',9,30),('Leggings of Pure Elements',119,'Mail','Intellect','Legs',9,30),('Pauldrons of Pure Elements',120,'Mail','Intellect','Shoulders',9,30),('Eyes of Azj\'Aqir',121,'Cloth','Intellect','Head',10,31),('Finery of Azj\'Aqir',122,'Cloth','Intellect','Chest',10,31),('Leggings of Azj\'Aqir',123,'Cloth','Intellect','Legs',10,31),('Pauldrons of Azj\'Aqir',124,'Cloth','Intellect','Shoulders',10,31),('Eyes of Rah',125,'Cloth','Mastery','Head',10,32),('Finery of Rah',126,'Cloth','Mastery','Chest',10,32),('Leggings of Rah',127,'Cloth','Mastery','Legs',10,32),('Pauldrons of Rah',128,'Cloth','Mastery','Shoulders',10,32),('Eyes of Tut',129,'Cloth','Crit Strike','Head',10,33),('Finery of Tut',130,'Cloth','Crit Strike','Chest',10,33),('Leggings of Tut',131,'Cloth','Crit Strike','Legs',10,33),('Pauldrons of Tut',132,'Cloth','Crit Strike','Shoulders',10,33),('Warhelm of the Obsidian Aspect',133,'Plate','Stamina','Head',11,34),('Chestplate of the Obsidian Aspect',134,'Plate','Stamina','Chest',11,34),('Legplates of the Obsidian Aspect',135,'Plate','Stamina','Legs',11,34),('Shoulderplates of the Obsidian Aspect',136,'Plate','Stamina','Shoulders',11,34),('Warhelm of the Steel Aspect',137,'Plate','Crit Strike','Head',11,35),('Chestplate of the Steel Aspect',138,'Plate','Crit Strike','Chest',11,35),('Legplates of the Steel Aspect',139,'Plate','Crit Strike','Legs',11,35),('Shoulderplates of the Steel Aspect',140,'Plate','Crit Strike','Shoulders',11,35),('Warhelm of the Bronze Aspect',141,'Plate','Strength','Head',11,36),('Chestplate of the Bronze Aspect',142,'Plate','Strength','Chest',11,36),('Legplates of the Bronze Aspect',143,'Plate','Strength','Legs',11,36),('Shoulderplates of the Bronze Aspect',144,'Plate','Strength','Shoulders',11,36);
/*!40000 ALTER TABLE `Equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Specs`
--

DROP TABLE IF EXISTS `Specs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Specs` (
  `Name` varchar(255) NOT NULL,
  `SpecID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) NOT NULL,
  PRIMARY KEY (`SpecID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Specs`
--

LOCK TABLES `Specs` WRITE;
/*!40000 ALTER TABLE `Specs` DISABLE KEYS */;
INSERT INTO `Specs` VALUES ('Blood',1,'Tank'),('Frost',2,'DPS'),('Unholy',3,'DPS'),('Havoc',4,'DPS'),('Vengeance',5,'Tank'),('Balance',6,'DPS'),('Feral',7,'DPS'),('Guardian',8,'Tank'),('Druid Restoration',9,'Healer'),('Beast Mastery',10,'DPS'),('Marksmanship',11,'DPS'),('Survival',12,'DPS'),('Arcane',13,'DPS'),('Fire',14,'DPS'),('Frost',15,'DPS'),('Brewmaster',16,'Tank'),('Mistweaver',17,'Healer'),('Windwalker',18,'DPS'),('Holy',19,'Healer'),('Protection',20,'Tank'),('Retribution',21,'DPS'),('Discipline',22,'Healer'),('Holy',23,'Healer'),('Shadow',24,'DPS'),('Assassination',25,'DPS'),('Outlaw',26,'DPS'),('Subtlety',27,'DPS'),('Elemental',28,'DPS'),('Enhancement',29,'DPS'),('Shaman Restoration',30,'Healer'),('Affliction',31,'DPS'),('Demonolgy',32,'DPS'),('Destruction',33,'DPS'),('Arms',34,'DPS'),('Fury',35,'DPS'),('Protection',36,'Tank');
/*!40000 ALTER TABLE `Specs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password`
--

DROP TABLE IF EXISTS `password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password` (
  `Password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password`
--

LOCK TABLES `password` WRITE;
/*!40000 ALTER TABLE `password` DISABLE KEYS */;
INSERT INTO `password` VALUES ('wowadmin');
/*!40000 ALTER TABLE `password` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-22  0:49:24
