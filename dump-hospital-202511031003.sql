-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `analise`
--

DROP TABLE IF EXISTS `analise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analise` (
  `analise_id` int NOT NULL AUTO_INCREMENT,
  `laboratorio_id` int DEFAULT NULL,
  `doente_id` int DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `data_analise` date DEFAULT NULL,
  `resultado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`analise_id`),
  KEY `laboratorio_id` (`laboratorio_id`),
  KEY `doente_id` (`doente_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analise`
--

LOCK TABLES `analise` WRITE;
/*!40000 ALTER TABLE `analise` DISABLE KEYS */;
INSERT INTO `analise` VALUES (1,1,1,'Sangue','2024-01-12','Normal'),(2,2,2,'Urina','2024-02-13','Infecção'),(3,3,3,'Raio-X','2024-03-14','Fratura'),(4,4,4,'PCR','2024-04-15','Positivo'),(5,5,5,'Glicemia','2024-05-16','Alta'),(6,6,6,'Tensão','2024-06-17','Elevada'),(7,7,7,'Sangue','2024-07-18','Normal'),(8,8,8,'Urina','2024-08-19','Normal'),(9,9,9,'Hemograma','2024-09-20','Baixo'),(10,10,10,'Raio-X','2024-10-21','Normal'),(11,11,11,'Sangue','2024-01-13','Normal'),(12,12,12,'Urina','2024-02-14','Infecção'),(13,13,13,'Raio-X','2024-03-15','Normal'),(14,14,14,'PCR','2024-04-16','Negativo'),(15,15,15,'Glicemia','2024-05-17','Alta'),(16,16,16,'Tensão','2024-06-18','Normal'),(17,17,17,'Sangue','2024-07-19','Normal'),(18,18,18,'Urina','2024-08-20','Normal'),(19,19,19,'Hemograma','2024-09-21','Baixo'),(20,20,20,'Raio-X','2024-10-22','Normal');
/*!40000 ALTER TABLE `analise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doente`
--

DROP TABLE IF EXISTS `doente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doente` (
  `doente_id` int NOT NULL AUTO_INCREMENT,
  `hospital_id` int DEFAULT NULL,
  `num_interno` varchar(20) DEFAULT NULL,
  `data_entrada` date DEFAULT NULL,
  `data_saida` date DEFAULT NULL,
  `diagnostico` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`doente_id`),
  KEY `hospital_id` (`hospital_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doente`
--

LOCK TABLES `doente` WRITE;
/*!40000 ALTER TABLE `doente` DISABLE KEYS */;
INSERT INTO `doente` VALUES (1,1,'D001','2024-01-10','2024-01-15','Gripe'),(2,2,'D002','2024-02-11',NULL,'Pneumonia'),(3,3,'D003','2024-03-12','2024-03-20','Fratura'),(4,4,'D004','2024-04-13',NULL,'Covid-19'),(5,5,'D005','2024-05-14','2024-05-22','Diabetes'),(6,6,'D006','2024-06-15',NULL,'Hipertensão'),(7,7,'D007','2024-07-16','2024-07-25','Apendicite'),(8,8,'D008','2024-08-17',NULL,'Bronquite'),(9,9,'D009','2024-09-18','2024-09-26','Anemia'),(10,10,'D010','2024-10-19',NULL,'Asma'),(11,11,'D011','2024-01-05','2024-01-10','Otite'),(12,12,'D012','2024-02-06',NULL,'Tosse Crónica'),(13,13,'D013','2024-03-07','2024-03-14','Gastrite'),(14,14,'D014','2024-04-08',NULL,'Covid-19'),(15,15,'D015','2024-05-09','2024-05-16','Colesterol Alto'),(16,16,'D016','2024-06-10',NULL,'Gripe'),(17,17,'D017','2024-07-11','2024-07-18','Dor Lombar'),(18,18,'D018','2024-08-12',NULL,'Dermatite'),(19,19,'D019','2024-09-13','2024-09-20','Sinusite'),(20,20,'D020','2024-10-14',NULL,'Ansiedade');
/*!40000 ALTER TABLE `doente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empregado`
--

DROP TABLE IF EXISTS `empregado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empregado` (
  `empregado_id` int NOT NULL AUTO_INCREMENT,
  `hospital_id` int DEFAULT NULL,
  `num_ordem` varchar(30) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `vencimento` decimal(10,2) DEFAULT NULL,
  `data_contratacao` date DEFAULT NULL,
  PRIMARY KEY (`empregado_id`),
  KEY `hospital_id` (`hospital_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empregado`
--

LOCK TABLES `empregado` WRITE;
/*!40000 ALTER TABLE `empregado` DISABLE KEYS */;
INSERT INTO `empregado` VALUES (1,1,'E001','Médico',3200.00,'2018-05-10'),(2,1,'E002','Enfermeiro',1800.00,'2019-03-15'),(3,2,'E003','Médico',3400.00,'2017-06-12'),(4,2,'E004','Administrativo',1500.00,'2020-07-01'),(5,3,'E005','Médico',3100.00,'2016-09-20'),(6,3,'E006','Enfermeiro',1900.00,'2021-01-10'),(7,4,'E007','Médico',3600.00,'2015-11-25'),(8,4,'E008','Administrativo',1400.00,'2022-03-02'),(9,5,'E009','Médico',3000.00,'2018-10-05'),(10,6,'E010','Enfermeiro',1850.00,'2019-02-08'),(11,7,'E011','Médico',3300.00,'2017-05-14'),(12,8,'E012','Enfermeiro',1750.00,'2020-09-09'),(13,9,'E013','Médico',3500.00,'2016-01-01'),(14,10,'E014','Administrativo',1550.00,'2021-06-06'),(15,11,'E015','Médico',3250.00,'2019-07-07'),(16,12,'E016','Enfermeiro',1800.00,'2020-08-08'),(17,13,'E017','Médico',3100.00,'2017-03-03'),(18,14,'E018','Enfermeiro',1850.00,'2022-09-09'),(19,15,'E019','Médico',3450.00,'2015-12-12'),(20,16,'E020','Administrativo',1600.00,'2021-04-04');
/*!40000 ALTER TABLE `empregado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermaria`
--

DROP TABLE IF EXISTS `enfermaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermaria` (
  `enfermaria_id` int NOT NULL AUTO_INCREMENT,
  `hospital_id` int DEFAULT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  `camas` int DEFAULT NULL,
  PRIMARY KEY (`enfermaria_id`),
  KEY `hospital_id` (`hospital_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermaria`
--

LOCK TABLES `enfermaria` WRITE;
/*!40000 ALTER TABLE `enfermaria` DISABLE KEYS */;
INSERT INTO `enfermaria` VALUES (1,1,'ENF-A1',20),(2,1,'ENF-A2',25),(3,2,'ENF-B1',15),(4,2,'ENF-B2',30),(5,3,'ENF-C1',20),(6,3,'ENF-C2',20),(7,4,'ENF-D1',25),(8,5,'ENF-E1',20),(9,6,'ENF-F1',30),(10,7,'ENF-G1',18),(11,8,'ENF-H1',22),(12,9,'ENF-I1',28),(13,10,'ENF-J1',24),(14,11,'ENF-K1',26),(15,12,'ENF-L1',20),(16,13,'ENF-M1',30),(17,14,'ENF-N1',25),(18,15,'ENF-O1',20),(19,16,'ENF-P1',18),(20,17,'ENF-Q1',22);
/*!40000 ALTER TABLE `enfermaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermeiro`
--

DROP TABLE IF EXISTS `enfermeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermeiro` (
  `enfermeiro_id` int NOT NULL AUTO_INCREMENT,
  `hospital_id` int DEFAULT NULL,
  `enfermaria_id` int DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `vencimento` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`enfermeiro_id`),
  KEY `hospital_id` (`hospital_id`),
  KEY `enfermaria_id` (`enfermaria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermeiro`
--

LOCK TABLES `enfermeiro` WRITE;
/*!40000 ALTER TABLE `enfermeiro` DISABLE KEYS */;
INSERT INTO `enfermeiro` VALUES (1,1,1,'Ana Costa','Chefe',2000.00),(2,1,2,'Bruno Silva','Auxiliar',1600.00),(3,2,3,'Carla Pereira','Chefe',1900.00),(4,3,5,'Daniel Rocha','Auxiliar',1700.00),(5,4,7,'Eva Martins','Chefe',2100.00),(6,5,8,'Filipe Gomes','Auxiliar',1650.00),(7,6,9,'Gabriela Sousa','Chefe',1950.00),(8,7,10,'Hugo Nunes','Auxiliar',1750.00),(9,8,11,'Inês Duarte','Chefe',2000.00),(10,9,12,'João Lopes','Auxiliar',1600.00),(11,10,13,'Liliana Freitas','Chefe',2100.00),(12,11,14,'Miguel Tavares','Auxiliar',1800.00),(13,12,15,'Nádia Silva','Chefe',2050.00),(14,13,16,'Oscar Ramos','Auxiliar',1750.00),(15,14,17,'Patrícia Alves','Chefe',1950.00),(16,15,1,'Rui Pinto','Auxiliar',1700.00),(17,16,2,'Sofia Castro','Chefe',2000.00),(18,17,3,'Tiago Mendes','Auxiliar',1600.00),(19,18,4,'Vera Reis','Chefe',2100.00),(20,19,5,'Zé Ferreira','Auxiliar',1750.00);
/*!40000 ALTER TABLE `enfermeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitais`
--

DROP TABLE IF EXISTS `hospitais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospitais` (
  `hospital_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  PRIMARY KEY (`hospital_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitais`
--

LOCK TABLES `hospitais` WRITE;
/*!40000 ALTER TABLE `hospitais` DISABLE KEYS */;
INSERT INTO `hospitais` VALUES (1,'Hospital Central de Lisboa','Lisboa'),(2,'Hospital São João','Porto'),(3,'Hospital de Braga','Braga'),(4,'Hospital Garcia de Orta','Almada'),(5,'Hospital de Évora','Évora'),(6,'Hospital de Coimbra','Coimbra'),(7,'Hospital de Faro','Faro'),(8,'Hospital de Setúbal','Setúbal'),(9,'Hospital do Barreiro','Barreiro'),(10,'Hospital de Leiria','Leiria'),(11,'Hospital de Aveiro','Aveiro'),(12,'Hospital de Santarém','Santarém'),(13,'Hospital de Viseu','Viseu'),(14,'Hospital de Castelo Branco','Castelo Branco'),(15,'Hospital de Vila Real','Vila Real'),(16,'Hospital de Beja','Beja'),(17,'Hospital de Portalegre','Portalegre'),(18,'Hospital da Guarda','Guarda'),(19,'Hospital do Funchal','Funchal'),(20,'Hospital de Ponta Delgada','Ponta Delgada');
/*!40000 ALTER TABLE `hospitais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratorio`
--

DROP TABLE IF EXISTS `laboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratorio` (
  `laboratorio_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `morada` varchar(100) NOT NULL,
  PRIMARY KEY (`laboratorio_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratorio`
--

LOCK TABLES `laboratorio` WRITE;
/*!40000 ALTER TABLE `laboratorio` DISABLE KEYS */;
INSERT INTO `laboratorio` VALUES (1,'Lab Central','Lisboa'),(2,'Lab Norte','Porto'),(3,'Lab Sul','Faro'),(4,'Lab Beiras','Coimbra'),(5,'Lab Minho','Braga'),(6,'Lab Tejo','Santarém'),(7,'Lab Alentejo','Évora'),(8,'Lab Madeira','Funchal'),(9,'Lab Açores','Ponta Delgada'),(10,'Lab Litoral','Aveiro'),(11,'Lab Centro','Leiria'),(12,'Lab Oeste','Setúbal'),(13,'Lab Interior','Guarda'),(14,'Lab Serra','Viseu'),(15,'Lab Hospitalar','Barreiro'),(16,'Lab Avançado','Vila Real'),(17,'Lab Clínico','Beja'),(18,'Lab Diagnóstico','Portalegre'),(19,'Lab Vida','Castelo Branco'),(20,'Lab Saúde+','Lisboa');
/*!40000 ALTER TABLE `laboratorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `empregado_id` int NOT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`empregado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,'Cardiologia'),(3,'Neurologia'),(5,'Ortopedia'),(7,'Pediatria'),(9,'Dermatologia'),(11,'Ginecologia'),(13,'Oftalmologia'),(15,'Urologia'),(17,'Oncologia'),(19,'Psiquiatria');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hospital'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-03 10:03:26
