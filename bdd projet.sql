-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projet
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autrefrais`
--

DROP TABLE IF EXISTS `autrefrais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autrefrais` (
  `id_autreFrais` int unsigned NOT NULL,
  `date` varchar(45) NOT NULL,
  `libelée` varchar(45) NOT NULL,
  `montant` varchar(45) NOT NULL,
  PRIMARY KEY (`id_autreFrais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autrefrais`
--

LOCK TABLES `autrefrais` WRITE;
/*!40000 ALTER TABLE `autrefrais` DISABLE KEYS */;
/*!40000 ALTER TABLE `autrefrais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frais`
--

DROP TABLE IF EXISTS `frais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frais` (
  `id_frais` int unsigned NOT NULL,
  `nuitée` varchar(45) NOT NULL,
  `kilometre` varchar(45) NOT NULL,
  `repas` varchar(45) NOT NULL,
  `fk_utilisateur` varchar(36) NOT NULL,
  PRIMARY KEY (`id_frais`),
  KEY `fk_utilisateur _idx` (`fk_utilisateur`),
  CONSTRAINT `fk_utilisateur ` FOREIGN KEY (`fk_utilisateur`) REFERENCES `utilisateur` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frais`
--

LOCK TABLES `frais` WRITE;
/*!40000 ALTER TABLE `frais` DISABLE KEYS */;
/*!40000 ALTER TABLE `frais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frais_autresfrais`
--

DROP TABLE IF EXISTS `frais_autresfrais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frais_autresfrais` (
  `fk_frais` int unsigned NOT NULL,
  `fk_autrefrais` int unsigned NOT NULL,
  PRIMARY KEY (`fk_frais`,`fk_autrefrais`),
  KEY `fk_frais _idx` (`fk_frais`),
  KEY `fk_autrefrais_idx` (`fk_autrefrais`),
  CONSTRAINT `fk_autrefrais` FOREIGN KEY (`fk_autrefrais`) REFERENCES `autrefrais` (`id_autreFrais`),
  CONSTRAINT `fk_frais ` FOREIGN KEY (`fk_frais`) REFERENCES `frais` (`id_frais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frais_autresfrais`
--

LOCK TABLES `frais_autresfrais` WRITE;
/*!40000 ALTER TABLE `frais_autresfrais` DISABLE KEYS */;
/*!40000 ALTER TABLE `frais_autresfrais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id_type` int unsigned NOT NULL,
  `rang` varchar(45) NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `uuid` varchar(36) NOT NULL,
  `identifiant` varchar(45) NOT NULL,
  `mdp` varchar(45) NOT NULL,
  `fk_type` int unsigned NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `fk_type_idx` (`fk_type`),
  CONSTRAINT `fk_type` FOREIGN KEY (`fk_type`) REFERENCES `type` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-13 13:19:39
