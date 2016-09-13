-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (armv7l)
--
-- Host: localhost    Database: db_tfg2
-- ------------------------------------------------------
-- Server version	5.5.44-0+deb8u1

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
-- Table structure for table `configuracion`
--

DROP TABLE IF EXISTS `configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `colores` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion`
--

LOCK TABLES `configuracion` WRITE;
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
INSERT INTO `configuracion` VALUES (0,'contraste');
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispositivo`
--

DROP TABLE IF EXISTS `dispositivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispositivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `rHab` int(11) NOT NULL,
  `servicio` int(11) NOT NULL,
  `tipoDispositivo` varchar(255) NOT NULL,
  `tipoComponente` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispositivo`
--

LOCK TABLES `dispositivo` WRITE;
/*!40000 ALTER TABLE `dispositivo` DISABLE KEYS */;
INSERT INTO `dispositivo` VALUES (1,'Panel 1',4,3,'DimmingLighting','actuator'),(2,'Panel 2',4,3,'DimmingLighting','actuator'),(3,'Panel 3',4,3,'DimmingLighting','actuator'),(4,'Panel 4',4,3,'DimmingLighting','actuator'),(5,'Panel Todos',4,3,'DimmingLighting','actuator'),(6,'Tubo Led',2,3,'DimmingLighting','actuator'),(7,'Tubo bajo consumo',2,3,'DimmingLighting','actuator'),(8,'Tubo normal',2,3,'DimmingLighting','actuator'),(9,'Downlight 13w',2,3,'DimmingLighting','actuator'),(10,'Downlight led',2,3,'DimmingLighting','actuator'),(11,'Dicroica led',2,3,'DimmingLighting','actuator'),(12,'Dicroica bajo consumo',2,3,'DimmingLighting','actuator'),(13,'Dicroica',2,3,'DimmingLighting','actuator'),(14,'Incandescente spot bajo consumo',2,3,'DimmingLighting','actuator'),(15,'Incandescente spot',2,3,'DimmingLighting','actuator'),(16,'Energymeter1',4,4,'EnergyMeter','actuator'),(17,'Luz 1',3,3,'DimmingLighting','actuator'),(18,'Luz 2',3,3,'DimmingLighting','actuator'),(19,'Luz 3',3,3,'DimmingLighting','actuator'),(20,'Luz 4',3,3,'DimmingLighting','actuator'),(21,'Luz 5',3,3,'DimmingLighting','actuator'),(22,'HumiditySensorIndoor',4,6,'WeatherStation','sensor'),(23,'HumiditySensorOutdoor',1,6,'WeatherStation','sensor'),(24,'PresenceSensor1',3,5,'MotionSensor','sensor'),(25,'PresenceSensor2',4,5,'MotionSensor','sensor'),(26,'PresenceSensor3',4,5,'MotionSensor','sensor'),(27,'TemperatureSensorIndoor',4,6,'TempSensor','sensor'),(28,'TemperatureSensorOutdoor',1,6,'TempSensor','sensor'),(29,'Luminaria1',4,3,'BinaryLighting','actuator'),(30,'Luminaria2',4,3,'BinaryLighting','actuator'),(31,'Blind1',4,2,'Blind','object'),(32,'Blind2',4,2,'Blind','object'),(33,'Energymeter2',2,4,'EnergyMeter','actuator'),(34,'LuxesPresencia2',4,5,'MotionSensor','sensor'),(35,'Lampara 1',3,3,'DimmingLighting','actuator'),(36,'Lampara 2',3,3,'DimmingLighting','actuator'),(37,'Tira Led RGB',3,3,'DimmingLighting','sensor'),(38,'Manubrio',4,5,'MotionSensor','sensor'),(39,'TemperatureSensorWallIndoor',4,6,'TempSensor','sensor');
/*!40000 ALTER TABLE `dispositivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disptienepropiedad`
--

DROP TABLE IF EXISTS `disptienepropiedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disptienepropiedad` (
  `idDisp` int(11) NOT NULL,
  `idProp` varchar(255) NOT NULL,
  `ultimoValor` varchar(5) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idDisp`,`idProp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disptienepropiedad`
--

LOCK TABLES `disptienepropiedad` WRITE;
/*!40000 ALTER TABLE `disptienepropiedad` DISABLE KEYS */;
INSERT INTO `disptienepropiedad` VALUES (1,'dataDimmerBlue','0','2016-07-27 23:52:59'),(1,'dataDimmerGreen','0','2016-07-27 23:52:59'),(1,'dataDimmerRed','0','2016-07-27 23:52:55'),(1,'dimmer',NULL,'2016-07-27 21:58:36'),(1,'dimmerBlue',NULL,'2016-07-27 21:58:36'),(1,'dimmerGreen',NULL,'2016-07-27 21:58:36'),(1,'dimmerRed',NULL,'2016-07-27 21:58:36'),(2,'dataDimmerBlue','0','2016-07-27 23:52:55'),(2,'dataDimmerGreen','0','2016-07-27 23:52:55'),(2,'dataDimmerRed','0','2016-07-27 23:52:55'),(2,'dimmer',NULL,'2016-07-27 21:58:36'),(2,'dimmerBlue',NULL,'2016-07-27 21:58:36'),(2,'dimmerGreen',NULL,'2016-07-27 21:58:36'),(2,'dimmerRed',NULL,'2016-07-27 21:58:36'),(3,'dataDimmerBlue','0','2016-07-27 23:52:55'),(3,'dataDimmerGreen','0','2016-07-27 23:52:55'),(3,'dataDimmerRed','0','2016-07-27 23:52:55'),(3,'dimmer',NULL,'2016-07-27 21:58:36'),(3,'dimmerBlue',NULL,'2016-07-27 21:58:36'),(3,'dimmerGreen',NULL,'2016-07-27 21:58:36'),(3,'dimmerRed',NULL,'2016-07-27 21:58:36'),(4,'dataDimmerBlue','0','2016-07-27 23:52:55'),(4,'dataDimmerGreen','0','2016-07-27 23:52:55'),(4,'dataDimmerRed','0','2016-07-27 23:52:55'),(4,'dimmer',NULL,'2016-07-27 21:58:36'),(4,'dimmerBlue',NULL,'2016-07-27 21:58:36'),(4,'dimmerGreen',NULL,'2016-07-27 21:58:36'),(4,'dimmerRed',NULL,'2016-07-27 21:58:36'),(5,'dimmer',NULL,'2016-07-27 21:58:36'),(5,'dimmerBlue',NULL,'2016-07-27 21:58:36'),(5,'dimmerGreen',NULL,'2016-07-27 21:58:36'),(5,'dimmerRed',NULL,'2016-07-27 21:58:36'),(5,'switch',NULL,'2016-07-27 21:58:36'),(6,'dataSwitch','true','2016-07-27 23:52:55'),(6,'switch',NULL,'2016-07-27 21:58:36'),(7,'dataSwitch','false','2016-07-27 23:52:55'),(7,'switch',NULL,'2016-07-27 21:58:36'),(8,'dataSwitch','false','2016-07-27 23:52:55'),(8,'switch',NULL,'2016-07-27 21:58:36'),(9,'dataSwitch','false','2016-07-27 23:52:55'),(9,'switch',NULL,'2016-07-27 21:58:36'),(10,'dataSwitch','false','2016-07-27 23:52:55'),(10,'switch',NULL,'2016-07-27 21:58:37'),(11,'dataSwitch','false','2016-07-27 23:52:55'),(11,'switch',NULL,'2016-07-27 21:58:37'),(12,'dataSwitch','false','2016-07-27 23:52:55'),(12,'switch',NULL,'2016-07-27 21:58:37'),(13,'dataSwitch','false','2016-07-27 23:52:55'),(13,'switch',NULL,'2016-07-27 21:58:37'),(14,'dataSwitch','false','2016-07-27 23:52:55'),(14,'switch',NULL,'2016-07-27 21:58:37'),(15,'dataSwitch','false','2016-07-27 23:52:55'),(15,'switch',NULL,'2016-07-27 21:58:37'),(16,'dataActivePower','27.79','2016-07-27 23:52:55'),(16,'dataApparentPower','53.59','2016-07-27 23:52:55'),(16,'dataIntensity','0.24','2016-07-27 23:52:55'),(16,'dataKwh','45.58','2016-07-27 23:52:55'),(16,'dataVoltage','223.5','2016-07-27 23:52:55'),(17,'dataDimmer','0','2016-07-27 23:52:55'),(17,'dataSwitch','false','2016-07-27 23:52:55'),(17,'dimmer',NULL,'2016-07-27 21:58:37'),(17,'switch',NULL,'2016-07-27 21:58:37'),(18,'dataSwitch','false','2016-07-27 23:52:55'),(18,'switch',NULL,'2016-07-27 21:58:37'),(19,'dataSwitch','false','2016-07-27 23:52:55'),(19,'switch',NULL,'2016-07-27 21:58:37'),(20,'dataSwitch','false','2016-07-27 23:52:55'),(20,'switch',NULL,'2016-07-27 21:58:37'),(21,'dataSwitch','false','2016-07-27 23:52:55'),(21,'switch',NULL,'2016-07-27 21:58:37'),(22,'dataHumidity','0.0','2016-07-27 23:52:55'),(23,'dataHumidity','40.36','2016-07-27 23:52:55'),(24,'dataSensor','1','2016-07-27 23:52:55'),(25,'dataSensor','0','2016-07-27 23:52:55'),(26,'dataSensor','0','2016-07-27 23:52:55'),(27,'dataTemp','0.0','2016-07-27 23:52:55'),(28,'dataTemp','25.1','2016-07-27 23:52:55'),(29,'dataSwitch','false','2016-07-27 23:52:55'),(29,'switch',NULL,'2016-07-27 21:58:37'),(30,'dataSwitch','false','2016-07-27 23:52:56'),(30,'switch',NULL,'2016-07-27 21:58:37'),(31,'moveBlind',NULL,'2016-07-27 21:58:37'),(32,'moveBlind',NULL,'2016-07-27 21:58:37'),(33,'dataActivePower','31.1','2016-07-27 23:52:56'),(33,'dataApparentPower','60.9','2016-07-27 23:52:56'),(33,'dataIntensity','0.26','2016-07-27 23:52:56'),(33,'dataKwh','50.97','2016-07-27 23:52:56'),(33,'dataVoltage','223.7','2016-07-27 23:52:56'),(34,'dataSensor','0','2016-07-27 23:52:56'),(35,'dataDimmer','0','2016-07-27 23:52:56'),(35,'dimmer',NULL,'2016-07-27 21:58:37'),(36,'dataDimmer','0','2016-07-27 23:52:56'),(36,'dimmer',NULL,'2016-07-27 21:58:37'),(37,'dataDimmerBlue','0','2016-07-27 23:52:56'),(37,'dataDimmerGreen','0','2016-07-27 23:52:56'),(37,'dataDimmerRed','0','2016-07-27 23:52:56'),(37,'dimmerBlue',NULL,'2016-07-27 21:58:37'),(37,'dimmerGreen',NULL,'2016-07-27 21:58:37'),(37,'dimmerRed',NULL,'2016-07-27 21:58:37'),(38,'dataSensor','1','2016-07-27 23:52:56'),(39,'dataTemp','23.54','2016-07-27 23:52:56');
/*!40000 ALTER TABLE `disptienepropiedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitacion`
--

DROP TABLE IF EXISTS `habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion`
--

LOCK TABLES `habitacion` WRITE;
/*!40000 ALTER TABLE `habitacion` DISABLE KEYS */;
INSERT INTO `habitacion` VALUES (1,'Exterior'),(2,'LightsPanel'),(3,'Maletin'),(4,'Sittingroom'),(5,'Workplace');
/*!40000 ALTER TABLE `habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilaordenes`
--

DROP TABLE IF EXISTS `pilaordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pilaordenes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `orden` text NOT NULL,
  `realizado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilaordenes`
--

LOCK TABLES `pilaordenes` WRITE;
/*!40000 ALTER TABLE `pilaordenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pilaordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propiedad`
--

DROP TABLE IF EXISTS `propiedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propiedad` (
  `nombre` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `acceso` varchar(255) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad`
--

LOCK TABLES `propiedad` WRITE;
/*!40000 ALTER TABLE `propiedad` DISABLE KEYS */;
INSERT INTO `propiedad` VALUES ('dataActivePower','DYNAMIC','READ'),('dataApparentPower','DYNAMIC','READ'),('dataDimmer','DYNAMIC','READ'),('dataDimmerBlue','DYNAMIC','READ'),('dataDimmerGreen','DYNAMIC','READ'),('dataDimmerRed','DYNAMIC','READ'),('dataHumidity','DYNAMIC','READ'),('dataIntensity','DYNAMIC','READ'),('dataKwh','DYNAMIC','READ'),('dataSensor','DYNAMIC','READ'),('dataSwitch','DYNAMIC','READ'),('dataTemp','DYNAMIC','READ'),('dataVoltage','DYNAMIC','READ'),('dimmer','DYNAMIC','WRITE'),('dimmerBlue','DYNAMIC','WRITE'),('dimmerGreen','DYNAMIC','WRITE'),('dimmerRed','DYNAMIC','WRITE'),('moveBlind','DYNAMIC','WRITE'),('switch','DYNAMIC','WRITE');
/*!40000 ALTER TABLE `propiedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'Alarm'),(2,'Blinds'),(3,'Lighting'),(4,'Meters'),(5,'Sensing'),(6,'Weather');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-27 23:53:00
