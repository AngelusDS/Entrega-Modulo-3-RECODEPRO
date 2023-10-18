CREATE DATABASE  IF NOT EXISTS `revoarviagens` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `revoarviagens`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: revoarviagens
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `cadastra_reserva`
--

DROP TABLE IF EXISTS `cadastra_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadastra_reserva` (
  `dataViagem` datetime DEFAULT NULL,
  `dataHospedagem` datetime DEFAULT NULL,
  `idFuncionario` int NOT NULL,
  `idHospedagem` int NOT NULL,
  KEY `idFuncionario` (`idFuncionario`),
  KEY `idHospedagem` (`idHospedagem`),
  CONSTRAINT `cadastra_reserva_ibfk_1` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idFuncionario`),
  CONSTRAINT `cadastra_reserva_ibfk_2` FOREIGN KEY (`idHospedagem`) REFERENCES `hospedagem` (`idHospedagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastra_reserva`
--

LOCK TABLES `cadastra_reserva` WRITE;
/*!40000 ALTER TABLE `cadastra_reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `cadastra_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nomeCliente` varchar(255) NOT NULL,
  `idadeCliente` int NOT NULL,
  `idFuncionario` int NOT NULL,
  `idGuia` int NOT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `idFuncionario` (`idFuncionario`),
  KEY `idGuia` (`idGuia`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idFuncionario`),
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`idGuia`) REFERENCES `guia` (`idGuia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destino`
--

DROP TABLE IF EXISTS `destino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destino` (
  `idDestino` int NOT NULL AUTO_INCREMENT,
  `nomeDestino` varchar(255) NOT NULL,
  `paisDestino` varchar(255) NOT NULL,
  `preco` float NOT NULL,
  `idFuncionario` int NOT NULL,
  PRIMARY KEY (`idDestino`),
  KEY `idFuncionario` (`idFuncionario`),
  CONSTRAINT `destino_ibfk_1` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destino`
--

LOCK TABLES `destino` WRITE;
/*!40000 ALTER TABLE `destino` DISABLE KEYS */;
/*!40000 ALTER TABLE `destino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `idFuncionario` int NOT NULL AUTO_INCREMENT,
  `idadeFuncionario` int DEFAULT NULL,
  `nomeFuncionario` varchar(255) NOT NULL,
  PRIMARY KEY (`idFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (18,1,'Mahô Beckman');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guia`
--

DROP TABLE IF EXISTS `guia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guia` (
  `idGuia` int NOT NULL AUTO_INCREMENT,
  `nomeGuia` varchar(255) NOT NULL,
  `idadeGuia` int DEFAULT NULL,
  `paisGuia` varchar(255) NOT NULL,
  `idDestino` int NOT NULL,
  `idFuncionario` int NOT NULL,
  PRIMARY KEY (`idGuia`),
  KEY `idDestino` (`idDestino`),
  KEY `idFuncionario` (`idFuncionario`),
  CONSTRAINT `guia_ibfk_1` FOREIGN KEY (`idDestino`) REFERENCES `destino` (`idDestino`),
  CONSTRAINT `guia_ibfk_2` FOREIGN KEY (`idFuncionario`) REFERENCES `funcionario` (`idFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guia`
--

LOCK TABLES `guia` WRITE;
/*!40000 ALTER TABLE `guia` DISABLE KEYS */;
/*!40000 ALTER TABLE `guia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospedagem`
--

DROP TABLE IF EXISTS `hospedagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospedagem` (
  `idHospedagem` int NOT NULL AUTO_INCREMENT,
  `nomeHospedagem` varchar(255) NOT NULL,
  `paisHospedagem` varchar(255) NOT NULL,
  PRIMARY KEY (`idHospedagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospedagem`
--

LOCK TABLES `hospedagem` WRITE;
/*!40000 ALTER TABLE `hospedagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospedagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'revoarviagens'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-18 10:06:13
