-- MySQL dump 10.13  Distrib 5.1.73, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: CCLDAS_PRODUCTION
-- ------------------------------------------------------
-- Server version	5.1.73-0ubuntu0.10.04.1

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
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter` (
  `id_counter` int(11) NOT NULL AUTO_INCREMENT,
  `integer_timestamp` bigint(20) DEFAULT NULL,
  `first_counter` int(11) DEFAULT NULL,
  `second_counter` int(11) DEFAULT NULL,
  `psu_counter` int(11) DEFAULT NULL,
  `third_counter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_counter`)
) ENGINE=InnoDB AUTO_INCREMENT=818 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--
-- WHERE:  1 limit 100

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES (1,1,0,0,0,0),(2,1363808748237,0,0,0,0),(3,1363808753887,0,0,0,0),(4,1363811019452,0,0,0,0),(5,1363811147427,0,0,0,0),(6,1363811387167,0,0,0,0),(7,1363811525705,0,0,0,0),(8,1363811555509,0,0,0,0),(9,1363811590459,0,0,0,0),(10,1363811656618,0,0,0,0),(11,1363811790502,0,0,0,0),(12,1363811861609,131,68,42,7),(13,1363812155922,962,645,403,103),(14,1363812849937,1416,972,547,139),(15,1363814739826,75,59,0,0),(16,1363815193581,0,0,0,0),(17,1363815297647,0,0,0,0),(18,1363894097626,1389,910,667,177),(19,1363895035011,1687,1122,718,183),(20,1363895940269,1869,1161,663,172),(21,1363897045218,1867,1197,713,175),(22,1364486165067,11414,7403,4103,1063),(23,1364491580263,0,0,0,0),(24,1364491582597,4920,3622,2027,567),(25,1364492230358,16642,12027,5477,1549),(26,1364493196862,238,156,89,22),(27,1364493451675,586,386,224,54),(28,1364493682168,20731,14315,6294,1688),(29,1364499459573,17241,11862,5077,1342),(30,1367251120061,0,0,0,0),(31,1367252119238,0,0,0,0),(32,1367252329259,0,0,19,11),(33,1367252532101,0,0,5,2),(34,1367252923336,3402,1957,1141,374),(35,1367255265894,2445,1408,724,255),(36,1367256962257,0,0,0,0),(37,1367256997940,4427,2627,1222,426),(38,1367260449583,0,0,0,0),(39,1367260473936,9563,5606,2659,361),(40,1367859485146,0,0,0,0),(41,1367859502796,0,0,0,0),(42,1367859535400,0,0,0,0),(43,1367860102764,30,13,5,0),(44,1367860534530,7,3,3,2),(45,1367860812574,0,0,0,0),(46,1367861144728,18,22,0,0),(47,1367861661834,79,52,33,16),(48,1367863495811,0,0,0,0),(49,1367863509749,0,0,0,0),(50,1367863544809,120,67,47,14),(51,1367863749723,0,0,0,0),(52,1367864001943,0,0,0,0),(53,1367864052935,0,0,0,0),(54,1367865174288,0,0,0,0),(55,1367865193722,0,0,0,0),(56,1367865197746,0,0,0,0),(57,1367865229399,144,89,61,14),(58,1367865408108,3774,2228,1207,401),(59,1367868608176,156,94,51,12),(60,1367868986854,310,172,104,34),(61,1367869263019,352,210,101,39),(62,1367869545895,283,156,83,31),(63,1367869834688,0,0,0,0),(64,1367869868362,0,0,0,0),(65,1367870152956,303,173,83,27),(66,1367870451937,4496,2625,1226,441),(67,1367871633624,0,0,0,0),(68,1367877416111,9671,6218,3189,898),(69,1367878405772,8043,6116,2896,1454),(70,1367879205328,9639,4001,2135,52),(71,1367880018872,13244,10036,4292,2186),(72,1367959822508,3892,2939,2442,1288),(73,1368028600655,9472,7244,6042,3270),(74,1368031354277,1921,1421,1156,628),(75,1368032704333,0,0,0,0),(76,1368032817110,0,0,0,0),(77,1368033075934,0,0,0,0),(78,1368033368879,0,0,0,0),(79,1368033607999,2402,1771,1413,697),(80,1368036221399,12756,9372,5995,3129),(81,1368049126088,10501,5420,3275,520),(82,1368052937086,7908,5950,3166,1577),(83,1368210860168,0,1,0,0),(84,1368216188816,0,0,0,0),(85,1368219772272,3311,2545,2193,1136),(86,1368220863809,0,0,0,0),(87,1368220883666,0,0,0,0),(88,1368221027908,0,0,0,0),(89,1368221342558,0,0,0,0),(90,1368222251755,0,0,0,0),(91,1368222627027,0,0,0,0),(92,1368222847791,0,0,0,0),(93,1368223041766,0,0,0,0),(94,1368223216443,0,0,0,0),(95,1368223382565,0,0,0,0),(96,1368223440250,0,0,0,0),(97,1368223582014,0,0,0,0),(98,1368223688113,0,0,0,0),(99,1368223802821,0,0,0,0),(100,1368223989219,0,0,0,0);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter_small`
--

DROP TABLE IF EXISTS `counter_small`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counter_small` (
  `id_counter` int(11) NOT NULL AUTO_INCREMENT,
  `integer_timestamp` bigint(20) DEFAULT NULL,
  `first_counter` int(11) DEFAULT NULL,
  `second_counter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_counter`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter_small`
--
-- WHERE:  1 limit 100

LOCK TABLES `counter_small` WRITE;
/*!40000 ALTER TABLE `counter_small` DISABLE KEYS */;
INSERT INTO `counter_small` VALUES (1,0,0,0);
/*!40000 ALTER TABLE `counter_small` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcs_points`
--

DROP TABLE IF EXISTS `dcs_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcs_points` (
  `integer_timestamp` bigint(20) NOT NULL,
  `dcs_x` float DEFAULT NULL,
  `dcs_y` float DEFAULT NULL,
  `id_dcs_spot` int(11) DEFAULT NULL,
  PRIMARY KEY (`integer_timestamp`),
  KEY `id_dcs_spot` (`id_dcs_spot`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcs_points`
--
-- WHERE:  1 limit 100

LOCK TABLES `dcs_points` WRITE;
/*!40000 ALTER TABLE `dcs_points` DISABLE KEYS */;
INSERT INTO `dcs_points` VALUES (1355189069656,-1.5,3.5,NULL),(1355189071938,1,0.5,NULL),(1355189073716,-1,0.5,NULL),(1355189074110,-1.5,0,NULL),(1355189074521,-3.5,3.5,NULL),(1355189075312,-0.5,0,NULL),(1355189075716,-3.5,4.5,NULL),(1355189076445,-1,-4.5,NULL),(1355189076843,-1,-4,NULL),(1355189077238,-0.5,0,NULL),(1355189078509,-1.5,-3.5,NULL),(1355189078909,-4,0.5,NULL),(1355189079508,-4.5,4.5,NULL),(1355189080845,-1.5,0,NULL),(1355189081292,-3.5,-4.5,NULL),(1355189082312,0,0.5,NULL),(1355189082712,-1,3.5,NULL),(1355189083143,-4.5,0.5,NULL),(1355189083582,-1,-1,NULL),(1355189085828,-3.5,0,NULL),(1355189086298,-1.5,0.5,NULL),(1355189087471,-4.5,-4.5,NULL),(1355189089857,-4,0,NULL),(1355189090901,0,0.5,NULL),(1355189091331,-4.5,0,NULL),(1355189091801,-1.5,0.5,NULL),(1355189094216,0,4.5,NULL),(1355189094681,-1,1,NULL),(1355189095181,-1.5,1.5,NULL),(1355189095655,-1,0,NULL),(1355189096123,-1.5,0,NULL),(1355189097898,-1,0,NULL),(1355189098723,-3.5,1.5,NULL),(1355189099711,-4,0,NULL),(1355189100160,-0.5,0,NULL),(1355189100610,0,-4.5,NULL),(1355189101512,-1,0,NULL),(1355189101924,-1.5,0,NULL),(1355189103105,0,-0.5,NULL),(1355189103644,1.5,4.5,NULL),(1355189104051,-3.5,1,NULL),(1355189104459,-0.5,4,NULL),(1355189105381,-1,0,NULL),(1355189106303,-1,0,NULL),(1355189107109,-0.5,0,NULL),(1355189107984,-2,0.5,NULL),(1355189109633,-5.5,-1,NULL),(1355189111841,-1,0.5,NULL),(1355189112716,-1.5,1.5,NULL),(1355189113104,-0.5,1,NULL),(1355189113962,0,0,NULL),(1355189114508,-1.5,1,NULL),(1355189115491,-1,4.5,NULL),(1355189115890,0,-4.5,NULL),(1355189117049,-0.5,0,NULL),(1355189117656,-4.5,4,NULL),(1355189119809,4,-5,NULL),(1355189120237,-2,0.5,NULL),(1355189120626,0,1,NULL),(1355189121115,-0.5,0,NULL),(1355189123593,0,0.5,NULL),(1355189125783,-1.5,0,NULL),(1355189126164,0.5,1.5,NULL),(1355189126987,-4.5,0,NULL),(1355189127586,-1,0,NULL),(1355189128394,-1.5,3.5,NULL),(1355189128973,-1,0,NULL),(1355189130366,-3.5,1,NULL),(1355189130775,-3.5,0,NULL),(1355189131665,-0.5,0.5,NULL),(1355189132529,0,1.5,NULL),(1355189132976,-1.5,-1.5,NULL),(1355189133464,-0.5,0,NULL),(1355189134176,-3.5,2,NULL),(1355189134984,-1,3.5,NULL),(1355189135502,-4,1,NULL),(1355189135899,-1.5,1,NULL),(1355189136377,-1,-1.5,NULL),(1355189140189,-4.5,1.5,NULL),(1355189141320,-4,1.5,NULL),(1355189141703,0,-4,NULL),(1355189142261,-4.5,0,NULL),(1355189142709,0,1.5,NULL),(1355189143711,-1,-4,NULL),(1355189145187,-1.5,-0.5,NULL),(1355189145640,-1,0.5,NULL),(1355189146255,-3.5,0,NULL),(1355189146648,-4.5,0.5,NULL),(1355189147032,-4,-4,NULL),(1355189147844,-1,0,NULL),(1355189148393,-4.5,0,NULL),(1355189149230,-0.5,0.5,NULL),(1355189150160,0,1,NULL),(1355189151105,-0.5,4.5,NULL),(1355189151984,-0.5,0.5,NULL),(1355189152386,-1,-4,NULL),(1355189152784,-4,0,NULL),(1355189153208,-1.5,4.5,NULL),(1355189154024,0,-4,NULL),(1355189154836,0.5,0,NULL);
/*!40000 ALTER TABLE `dcs_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcs_spot`
--

DROP TABLE IF EXISTS `dcs_spot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcs_spot` (
  `id_dcs_spot` int(11) NOT NULL AUTO_INCREMENT,
  `integer_timestamp` bigint(20) DEFAULT NULL,
  `dcs_spot_x` float DEFAULT NULL,
  `dcs_spot_y` float DEFAULT NULL,
  `spot_width_x` float DEFAULT NULL,
  `spot_width_y` float DEFAULT NULL,
  `spot_size` int(11) DEFAULT NULL,
  `id_experiment_settings` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id_dcs_spot`),
  KEY `idx_id_experiment_settings` (`id_experiment_settings`)
) ENGINE=InnoDB AUTO_INCREMENT=1440 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcs_spot`
--
-- WHERE:  1 limit 100

LOCK TABLES `dcs_spot` WRITE;
/*!40000 ALTER TABLE `dcs_spot` DISABLE KEYS */;
INSERT INTO `dcs_spot` VALUES (1,1355242211175,-1.087,-0.399,0.630616,0.395131,500,NULL),(2,1355242217914,-1.087,-0.399,0.630616,0.395131,500,NULL),(3,1355242224725,-1.087,-0.399,0.630616,0.395131,500,NULL),(4,1355242231331,-1.087,-0.399,0.630616,0.395131,500,NULL),(5,1355242238071,-1.087,-0.399,0.630616,0.395131,500,NULL),(6,1355242244801,-1.087,-0.399,0.630616,0.395131,500,NULL),(7,1355242698912,-1.26946,-0.309381,0.810588,0.469954,501,NULL),(8,1355242703084,-1.264,-0.31,0.810606,0.469965,500,NULL),(9,1355243154481,-1.08283,-0.473054,0.779233,0.410039,501,NULL),(10,1355243159494,-1.082,-0.481,0.779252,0.410046,500,NULL),(11,1355243164568,-1.082,-0.481,0.779252,0.410046,500,NULL),(12,1355243581296,-1.22754,-0.441118,0.922789,0.51524,501,NULL),(13,1355243996539,-1.26148,-0.438124,0.818648,0.501891,501,NULL),(14,1355244396336,-1.23253,-0.522954,0.825337,0.432636,501,NULL),(15,1355244810524,-1.07884,-0.664671,0.847856,0.441893,501,NULL),(16,1355244816260,-1.09,-0.657,0.847885,0.441904,500,NULL),(17,1355245213835,-1.29242,-0.643713,0.741523,0.485649,501,NULL),(18,1355245219970,-1.295,-0.644,0.73364,0.486112,500,NULL),(19,1355245225687,-1.295,-0.644,0.73364,0.486112,500,NULL),(20,1355245596724,-1.30339,-0.661677,0.814471,0.893696,501,NULL),(21,1355245601292,-1.304,-0.66,0.81339,0.879753,500,NULL),(22,1355245974265,-1.11078,-0.476048,0.857827,0.475134,501,NULL),(23,1355246344895,-1.27545,-0.523952,0.818221,0.477891,501,NULL),(24,1355246713456,-1.36627,-0.456088,0.697962,0.421261,501,NULL),(25,1355247072449,-1.11377,-0.474052,0.830841,0.445083,501,NULL),(26,1355247076534,-1.113,-0.476,0.830667,0.440923,500,NULL),(27,1355247080658,-1.113,-0.476,0.830667,0.440923,500,NULL),(28,1355247443124,-1.17465,-0.567864,0.682225,0.379462,501,NULL),(29,1355247788559,-1.29541,-0.542914,0.507934,0.395778,501,NULL),(30,1355251999004,-0.407186,-0.314371,0.913351,0.506185,501,NULL),(31,1355252389178,-0.854291,-0.406188,0.881386,0.489708,501,NULL),(32,1355252779559,-0.97505,-0.351297,0.977234,0.491568,501,NULL),(33,1355253153475,-0.987026,-0.501996,0.905672,0.516333,501,NULL),(34,1355253531559,-1.02595,-0.300399,1.03583,0.698637,501,NULL),(35,1355253886212,-1.03693,-0.4002,0.92217,0.484237,501,NULL),(36,1355253890838,-1.037,-0.401,0.929005,0.489017,500,NULL),(37,1355253895510,-1.037,-0.401,0.929005,0.489017,500,NULL),(38,1355253900179,-1.037,-0.401,0.929005,0.489017,500,NULL),(39,1355254258079,-0.828343,-0.689621,1.01132,0.820437,501,NULL),(40,1355254262184,-0.832,-0.693,1.00958,0.819933,500,NULL),(41,1355254616229,-0.884232,-0.49002,0.873942,0.441888,501,NULL),(42,1355254985801,-0.749501,-0.462076,0.980374,0.543415,501,NULL),(43,1355255358633,-1.09082,-0.302395,0.869194,0.633137,501,NULL),(44,1355255756239,-1.02994,-0.290419,1.02217,0.760116,501,NULL),(45,1355255760354,-1.031,-0.291,1.03039,0.770006,500,NULL),(46,1355256121024,-1.02096,-0.53992,0.910424,0.461247,501,NULL),(47,1355256126981,-1.023,-0.539,0.910142,0.460622,500,NULL),(48,1355256482973,-0.976048,-0.336327,0.956899,0.571769,501,NULL),(49,1355256843757,-1.08483,-0.315369,1.08606,0.560143,501,NULL),(50,1355256853721,-1.084,-0.32,1.08608,0.560194,500,NULL),(51,1355257239575,-1.07285,-0.338323,0.82141,0.448052,501,NULL),(52,1355257620308,-0.932136,-0.259481,0.931478,0.413741,501,NULL),(53,1355257986843,-1.18363,-0.439122,0.866108,0.454701,501,NULL),(54,1355257993820,-1.183,-0.439,0.86561,0.448509,500,NULL),(55,1355258000473,-1.183,-0.439,0.86561,0.448509,500,NULL),(56,1355258400453,-1.41417,-0.340319,0.865359,0.503649,501,NULL),(57,1355258796073,-1.36727,-0.45509,1.04195,0.758824,501,NULL),(58,1355259190767,-1.3982,-0.426148,0.821947,0.544359,501,NULL),(59,1355259196482,-1.401,-0.426,0.819411,0.540474,500,NULL),(60,1355259590633,-1.37525,-0.374251,0.759237,0.420834,501,NULL),(61,1355259981386,-1.21856,-0.523952,0.927301,0.462972,501,NULL),(62,1355260388326,-1.29441,-0.297405,0.671831,0.428695,501,NULL),(63,1355260393475,-1.296,-0.3,0.671855,0.428329,500,NULL),(64,1355260398647,-1.296,-0.3,0.671855,0.428329,500,NULL),(65,1355260403810,-1.296,-0.3,0.671855,0.428329,500,NULL),(66,1355260788585,-1.47705,-0.431138,0.818725,0.505743,501,NULL),(67,1355261193293,-1.3004,-0.327345,0.812246,0.448294,501,NULL),(68,1355261198178,-1.294,-0.321,0.812265,0.448305,500,NULL),(69,1355261609737,-1.29441,-0.322355,0.788865,0.413128,501,NULL),(70,1355261615108,-1.294,-0.324,0.787154,0.411365,500,NULL),(71,1355261620458,-1.294,-0.324,0.787154,0.411365,500,NULL),(72,1355262047040,-0.749501,-0.536926,1.23938,0.407107,501,NULL),(73,1355262461933,-0.152695,-0.45509,0.461206,0.812722,501,NULL),(74,1355262858234,0.0239521,-0.778443,0.806597,1.03169,501,NULL),(75,1355263272120,0.0329341,-0.737525,1.10478,0.760327,501,NULL),(76,1355263277001,0.045,-0.726,1.10483,0.760415,500,NULL),(77,1355263281926,0.045,-0.726,1.10483,0.760415,500,NULL),(78,1355263286947,0.045,-0.726,1.10483,0.760415,500,NULL),(79,1355263291872,0.045,-0.726,1.10483,0.760415,500,NULL),(80,1355263697497,-0.0568862,-0.637725,0.564862,0.780802,501,NULL),(81,1355263704274,-0.066,-0.63,0.564907,0.780867,500,NULL),(82,1355264128379,-0.0279441,-0.788423,0.810177,1.01891,501,NULL),(83,1355264550809,0.140719,-0.483034,0.964632,0.79313,501,NULL),(84,1355264555264,0.141,-0.486,0.965146,0.777414,500,NULL),(85,1355265003602,0.0439122,-0.357285,0.81755,0.49229,501,NULL),(86,1355265009401,0.036,-0.367,0.817605,0.492314,500,NULL),(87,1355265015219,0.036,-0.367,0.817605,0.492314,500,NULL),(88,1355265474792,0.184631,-0.408184,0.759906,1.1618,501,NULL),(89,1355265915202,0.5998,-0.602794,0.663855,1.0399,501,NULL),(90,1355266343987,0.516966,-0.600798,0.396965,0.518374,501,NULL),(91,1355266805316,0.697605,-0.641717,0.704707,0.870579,501,NULL),(92,1355266811419,0.691,-0.634,0.704781,0.870637,500,NULL),(93,1355266817462,0.691,-0.634,0.704781,0.870637,500,NULL),(94,1355266823551,0.691,-0.634,0.704781,0.870637,500,NULL),(95,1355267278078,0.60978,-0.528942,0.65542,0.70291,501,NULL),(96,1355267722946,0.38523,-0.363273,1.14804,0.795964,501,NULL),(97,1355267728551,0.379,-0.363,1.14815,0.796026,500,NULL),(98,1355268166109,0.293413,-0.608782,0.599051,0.853326,501,NULL),(99,1355268624205,0.498004,-0.305389,1.14469,0.895124,501,NULL),(100,1355268629620,0.511,-0.305,1.14484,0.895236,500,NULL);
/*!40000 ALTER TABLE `dcs_spot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dust_event`
--

DROP TABLE IF EXISTS `dust_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dust_event` (
  `id_dust_event` bigint(20) NOT NULL AUTO_INCREMENT,
  `integer_timestamp` bigint(20) DEFAULT NULL,
  `velocity` float NOT NULL,
  `mass` float NOT NULL,
  `charge` float NOT NULL,
  `radius` float DEFAULT NULL,
  `passed` int(11) DEFAULT NULL,
  `id_experiment_settings` int(11) DEFAULT NULL,
  `id_pelletron_data` int(10) unsigned zerofill DEFAULT NULL,
  `estimate_source` tinyint(4) DEFAULT NULL,
  `estimate_quality` tinyint(4) DEFAULT NULL,
  `file_location` tinyint(4) DEFAULT NULL,
  `id_dust_info` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_dust_event`),
  KEY `id_pelletron` (`id_pelletron_data`),
  KEY `id_experiment_settings` (`id_experiment_settings`),
  KEY `timestamp` (`integer_timestamp`),
  KEY `mass` (`mass`),
  KEY `velocity` (`velocity`),
  KEY `charge` (`charge`),
  KEY `file_location` (`file_location`),
  KEY `id_dust_info_idx` (`id_dust_info`),
  CONSTRAINT `fk_id_dust_info` FOREIGN KEY (`id_dust_info`) REFERENCES `dust_info` (`id_dust_info`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_experiment_settings` FOREIGN KEY (`id_experiment_settings`) REFERENCES `experiment_settings` (`id_experiment_settings`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_pelletron` FOREIGN KEY (`id_pelletron_data`) REFERENCES `pelletron_data` (`id_pelletron_data`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2019298 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dust_event`
--
-- WHERE:  1 limit 100

LOCK TABLES `dust_event` WRITE;
/*!40000 ALTER TABLE `dust_event` DISABLE KEYS */;
INSERT INTO `dust_event` VALUES (1,1340137854565,-1,-1,-1,-1,0,1,0000000001,1,0,1,1),(2,1340137862772,-1,-1,-1,-1,0,1,0000000001,1,0,1,1),(3,1340137884610,-1,-1,-1,-1,0,1,0000000001,1,0,1,1),(4,1340137893875,-1,-1,-1,-1,0,1,0000000001,1,0,1,1),(5,1340137974293,-1,-1,-1,-1,0,1,0000000001,1,0,1,1),(6,1340137987092,23506.6,2.02557e-18,2.79813e-16,3.94537e-08,1,1,0000000001,1,1,1,1),(7,1340137991346,-1,-1,-1,-1,0,1,0000000001,1,0,1,1),(8,1340138035199,-1,-1,-1,-1,0,1,0000000001,1,0,1,1),(9,1340138049371,-1,-1,-1,-1,0,1,0000000001,1,0,1,1),(10,1340138067434,-1,-1,-1,-1,0,1,0000000001,1,0,1,1),(11,1340138076017,7872.76,2.074e-17,3.21368e-16,8.56725e-08,1,1,0000000001,1,1,1,1),(12,1340138107783,-1,-1,-1,-1,0,1,0000000001,1,0,1,1),(13,1340138133962,-1,-1,-1,-1,0,1,0000000001,1,0,1,1),(14,1340138139347,-1,-1,-1,-1,0,1,0000000001,1,0,1,1),(15,1340138198672,-1,-1,-1,-1,0,1,0000000001,1,0,1,1),(16,1340138199498,-1,-1,-1,-1,0,1,0000000001,1,0,1,1),(17,1340137854565,-1,-1,-1,-1,0,3,0000000003,1,0,1,1),(18,1340137862772,-1,-1,-1,-1,0,3,0000000003,1,0,1,1),(19,1340137884610,-1,-1,-1,-1,0,3,0000000003,1,0,1,1),(20,1340137893875,-1,-1,-1,-1,0,3,0000000003,1,0,1,1),(21,1340137974293,-1,-1,-1,-1,0,3,0000000003,1,0,1,1),(22,1340137987092,23506.6,2.02557e-18,2.79813e-16,3.94537e-08,1,3,0000000003,1,1,1,1),(23,1340137991346,-1,-1,-1,-1,0,3,0000000003,1,0,1,1),(24,1340138035199,-1,-1,-1,-1,0,3,0000000003,1,0,1,1),(25,1340138049371,-1,-1,-1,-1,0,3,0000000003,1,0,1,1),(26,1340138067434,-1,-1,-1,-1,0,3,0000000003,1,0,1,1),(27,1340138076017,7872.76,2.074e-17,3.21368e-16,8.56725e-08,1,3,0000000003,1,1,1,1),(28,1340138107783,-1,-1,-1,-1,0,3,0000000003,1,0,1,1),(29,1340138133962,-1,-1,-1,-1,0,3,0000000003,1,0,1,1),(30,1340138139347,-1,-1,-1,-1,0,3,0000000003,1,0,1,1),(31,1340138198672,-1,-1,-1,-1,0,3,0000000003,1,0,1,1),(32,1340138199498,-1,-1,-1,-1,0,3,0000000003,1,0,1,1),(33,1340371855957,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(34,1340371871858,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(35,1340371884997,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(36,1340371893831,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(37,1340371903351,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(38,1340371905635,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(39,1340371910648,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(40,1340371911236,11742.7,8.88629e-18,3.06335e-16,6.45871e-08,1,4,0000000004,1,1,1,1),(41,1340371916352,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(42,1340371924626,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(43,1340371926714,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(44,1340371930559,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(45,1340371934456,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(46,1340371935663,19588.3,3.56808e-18,3.42269e-16,4.76486e-08,1,4,0000000004,1,1,1,1),(47,1340371936073,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(48,1340371950328,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(49,1340371979976,18470.5,2.05706e-17,1.75446e-15,8.54386e-08,1,4,0000000004,1,1,1,1),(50,1340372010305,75801.9,2.10127e-19,3.01843e-16,1.85381e-08,1,4,0000000004,1,1,1,1),(51,1340372019991,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(52,1340372024026,13392.2,5.88741e-17,2.63978e-15,1.21305e-07,1,4,0000000004,1,1,1,1),(53,1340372028186,15535.9,6.1933e-18,3.7371e-16,5.72637e-08,1,4,0000000004,1,1,1,1),(54,1340372028368,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(55,1340372110891,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(56,1340372120134,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(57,1340372125368,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(58,1340372143070,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(59,1340372149309,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(60,1340372189628,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(61,1340372197492,19629.9,1.64779e-17,1.58737e-15,7.93486e-08,1,4,0000000004,1,1,1,1),(62,1340372221027,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(63,1340372247247,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(64,1340372262287,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(65,1340372276929,6152.22,4.61872e-17,4.37044e-16,1.11878e-07,1,4,0000000004,1,1,1,1),(66,1340372281206,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(67,1340372312148,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(68,1340372316528,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(69,1340372355627,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(70,1340372362428,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(71,1340372416391,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(72,1340372432626,8844.14,2.14999e-17,4.20424e-16,8.67063e-08,1,4,0000000004,1,1,1,1),(73,1340372435448,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(74,1340372438530,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(75,1340372440928,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(76,1340372442389,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(77,1340372457889,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(78,1340372461049,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(79,1340372470769,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(80,1340372497749,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(81,1340372501961,5713.99,4.61695e-17,3.76855e-16,1.11864e-07,1,4,0000000004,1,1,1,1),(82,1340372530971,5423.39,7.605e-17,5.59218e-16,1.32111e-07,1,4,0000000004,1,1,1,1),(83,1340372532053,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(84,1340372532612,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(85,1340372541479,3722.83,9.33378e-17,3.23403e-16,1.41446e-07,1,4,0000000004,1,1,1,1),(86,1340372548488,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(87,1340372562089,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(88,1340372582168,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(89,1340372592556,12383.2,8.54149e-18,3.27446e-16,6.37407e-08,1,4,0000000004,1,1,1,1),(90,1340372620351,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(91,1340372623949,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(92,1340372670770,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(93,1340372680468,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(94,1340372709292,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(95,1340372710772,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(96,1340372733269,5367.48,4.32803e-17,3.11725e-16,1.0948e-07,1,4,0000000004,1,1,1,1),(97,1340372744489,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(98,1340372745991,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(99,1340372752227,-1,-1,-1,-1,0,4,0000000004,1,0,1,1),(100,1340372761508,-1,-1,-1,-1,0,4,0000000004,1,0,1,1);
/*!40000 ALTER TABLE `dust_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dust_event_small`
--

DROP TABLE IF EXISTS `dust_event_small`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dust_event_small` (
  `id_dust_event` bigint(20) NOT NULL AUTO_INCREMENT,
  `integer_timestamp` bigint(20) DEFAULT NULL,
  `velocity` float NOT NULL,
  `mass` float NOT NULL,
  `charge` float NOT NULL,
  `radius` float DEFAULT NULL,
  `passed` int(11) DEFAULT NULL,
  `id_experiment_settings` int(11) DEFAULT NULL,
  `estimate_source` tinyint(4) DEFAULT NULL,
  `estimate_quality` tinyint(4) DEFAULT NULL,
  `file_location` tinyint(4) DEFAULT NULL,
  `id_dust_info` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_dust_event`),
  KEY `timestamp` (`integer_timestamp`),
  KEY `mass` (`mass`),
  KEY `velocity` (`velocity`),
  KEY `charge` (`charge`),
  KEY `file_location` (`file_location`),
  KEY `id_dust_info_idx` (`id_dust_info`),
  KEY `fk_id_experiment_setting_idx` (`id_experiment_settings`),
  CONSTRAINT `fk_id_dust_info_small` FOREIGN KEY (`id_dust_info`) REFERENCES `dust_info_small` (`id_dust_info`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_experiment_settings_small` FOREIGN KEY (`id_experiment_settings`) REFERENCES `experiment_settings_small` (`id_experiment_settings`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dust_event_small`
--
-- WHERE:  1 limit 100

LOCK TABLES `dust_event_small` WRITE;
/*!40000 ALTER TABLE `dust_event_small` DISABLE KEYS */;
INSERT INTO `dust_event_small` VALUES (1,0,0,0,0,0,0,NULL,0,0,0,NULL);
/*!40000 ALTER TABLE `dust_event_small` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dust_info`
--

DROP TABLE IF EXISTS `dust_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dust_info` (
  `id_dust_info` int(11) NOT NULL AUTO_INCREMENT,
  `integer_timestamp` bigint(20) DEFAULT NULL,
  `dust_type` int(11) DEFAULT NULL,
  `source_builder` int(11) DEFAULT NULL,
  `dust_source_notes` text,
  `initial_dust_mass` float DEFAULT NULL,
  `final_dust_mass` float DEFAULT NULL,
  `shot_count` bigint(20) DEFAULT NULL,
  `run_time` float DEFAULT NULL,
  `transfer_from_small` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_dust_info`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dust_info`
--
-- WHERE:  1 limit 100

LOCK TABLES `dust_info` WRITE;
/*!40000 ALTER TABLE `dust_info` DISABLE KEYS */;
INSERT INTO `dust_info` VALUES (1,0,0,0,'Historical Dust Source',NULL,NULL,NULL,NULL,NULL),(2,1350082800000,0,1,'Old one didn\'t fire well',NULL,NULL,NULL,NULL,NULL),(3,1352491735138,0,0,'Changed for Andrew\'s Experiment',NULL,NULL,NULL,NULL,NULL),(4,1353096535138,0,1,'Changed for Anna\rChanged for Anna\rChanged for Anna\rChanged for Anna',0,0.3,NULL,NULL,NULL),(5,1357324396873,0,0,'Normal change of source\rKeith is not happy with this dust source -Keith\rNormal change of source\rKeith is not happy with this dust source -Keith\r\rKeith is not happy with this dust source -Keith\rNormal change of source\rKeith is not happy with this dust source -Keith\rNormal change of source\rKeith is not happy with this dust source -Keith\r\rKeith is not happy with this dust source -Keith\rNormal change of source\rKeith is not happy with this dust source -Keith\nKeith became happier\rNormal change of source\rKeith is not happy with this dust source -Keith\r\rKeith is not happy with this dust source -Keith\rNormal change of source\rKeith is not happy with this dust source -Keith\rNormal change of source\rKeith is not happy with this dust source -Keith\r\rKeith is not happy with this dust source -Keith',1.2,0.79,NULL,NULL,NULL),(6,1360953196873,0,1,'\r',1.2,0.7,242371,NULL,NULL),(7,1368725596873,0,1,'\r\r\r',1.2,0.92,1820945,NULL,NULL),(8,1375120543227,0,1,'\r\r\r',1.15,0.92,678349,NULL,NULL),(9,1376759213634,0,1,'\r\r\r\r\r\r\r\rRight at the beginning of the source, fast particles were being produced at a good rate.  Then a spark killed the accelerator and after that it no longer had fast particles.',1.2,0.8,1164285,13.3631,NULL),(10,1379706700690,1,0,'Put 3 scoops of dust into source.\rPut 3 scoops of dust into source. This source did not shoot well...',0,0,18006,148.645,NULL),(11,1380311500690,1,0,'Tested on small accelerator and was shooting there.',0,0,100314,29.5841,NULL),(12,1380994955245,0,0,'\rNot very many fast particles.  Was not pointed too well.',1.6,0.75,3148724,61.7173,NULL),(13,1382116989862,0,1,'New source for Stereo test\rNew source for Stereo test',1.2,0.39,17428764,61.3716,NULL),(14,1383936712571,0,0,'Keith\'s last source, taken from off the small accelerator.  Had one big spark prior to use and continued to spark throughout use until fast dust ran out.',1.1,0.74,1347161,22.2121,NULL),(15,1386035482180,0,2,'Was jarred slightly when putting onto the big accelerator.  Used up last bit of Iron dust mix.  Needle was not as sharp but could not be sharpened more.',1.2,1.09,51794,1.37105,0),(16,1389034750855,7,3,'First source with this type of dust',0.2,0.16,22345,12.9964,1),(17,1389912533794,1,2,'The amount of dust used is not known.  This dust was used for the last LDEX run.  Ran really well, shot lots of dust and various speeds, fastest dust yet at 69 km/s',0.5,0.35,118184,41.3739,0),(18,1391821026255,16,1,'New general use iron mix source. Did not shoot, shorted.',1.2,1.1,2115,4.45654,0),(19,1392420562272,16,1,'Testing FE 3-2 to see if it works on SA.\nShot fine and no dust was left in reservoir.  Final dust mass was taken from the two chambers outside of the reservoir',0.61,0.25,1106249,32.9774,1),(20,1394137862732,16,2,'New iron source for general use.  Shot for the first week, ran out of fast particles after a week.',0.9,0.75,714796,32.9847,0),(21,1394137862732,16,2,'0.26 g new dust and a new needle.  Fast dust ran out ver quickly',0.9,0.64,714796,32.9847,0),(22,1397861832982,37,1,'Brand new mix of Iron dust hopefully it will work.  It shot well but not as many large or slow particles.',0.9,0.77,129937,17.5016,0),(23,1400260838347,42,1,'Brand new mix of Iron dust hopefully it will work.',0.9,0.77,381033,30.4053,0),(26,1402686000000,2,1,'Nickel dust first time in big accelerator',0.46,0,295391,34.2659,0);
/*!40000 ALTER TABLE `dust_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dust_info_small`
--

DROP TABLE IF EXISTS `dust_info_small`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dust_info_small` (
  `id_dust_info` int(11) NOT NULL AUTO_INCREMENT,
  `integer_timestamp` bigint(20) DEFAULT NULL,
  `dust_type` int(11) DEFAULT NULL,
  `source_builder` int(11) DEFAULT NULL,
  `dust_source_notes` text,
  `initial_dust_mass` float DEFAULT NULL,
  `final_dust_mass` float DEFAULT NULL,
  `shot_count` bigint(20) DEFAULT NULL,
  `run_time` float DEFAULT NULL,
  `transfer_to_big` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_dust_info`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='Dust info table for small accelerator';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dust_info_small`
--
-- WHERE:  1 limit 100

LOCK TABLES `dust_info_small` WRITE;
/*!40000 ALTER TABLE `dust_info_small` DISABLE KEYS */;
INSERT INTO `dust_info_small` VALUES (1,0,0,0,'testing',0,0,0,0,0),(2,1390518024019,11,1,'First test of graphite mix for better graphite dust',0.13,0,NULL,NULL,0),(3,1392148056199,16,1,'Testing FE 3-2 to see if it works on SA.',0.61,0,NULL,NULL,1),(4,1402679748964,48,1,'Testing Nickel Mix',0.42,0,NULL,NULL,0);
/*!40000 ALTER TABLE `dust_info_small` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dust_type`
--

DROP TABLE IF EXISTS `dust_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dust_type` (
  `id_dust_type` int(11) NOT NULL AUTO_INCREMENT,
  `dust_name` text,
  `dust_type` smallint(6) DEFAULT NULL,
  `batch_no` smallint(6) DEFAULT NULL,
  `dust_density` float DEFAULT NULL,
  `source_weight` float DEFAULT NULL,
  `size` text,
  `bottle_weight` float DEFAULT NULL,
  `dust_weight` float DEFAULT NULL,
  `comments` text,
  `shoots` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_dust_type`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dust_type`
--
-- WHERE:  1 limit 100

LOCK TABLES `dust_type` WRITE;
/*!40000 ALTER TABLE `dust_type` DISABLE KEYS */;
INSERT INTO `dust_type` VALUES (0,'Iron',3,1,7874,1.2,'0.05-3.5 µm',16.19,0,'Mix of Iron 1-1 and Iron 2-1',1),(1,'Olivine',1,1,3320,0.5,'?',15.85,0.34,'Shot very well and got fastest particle seen so far at 69 km/s',1),(2,'Nickel',1,1,8908,0.6,'<300-500 nm (<1µm)',15.89,3.99,'Nanoshel\nIs very clumpy.  After shooting, much of the dust was stuck together in sheets.  Particle size range appears to be much larger than indicated, but could be caused by clumped together dust.',0),(3,'Iron',1,1,7874,1.2,'0.1-3.5 µm',16.01,0.17,'Heidelberg iron dust 713',1),(4,'Iron',2,1,7874,1.2,'50-100 nm',0,0,'Heidelberg iron dust Fe 96.02',0),(5,'Iron',4,1,7874,0,'60-80 nm',15.85,18.47,'',0),(6,'Graphite',1,1,2160,0,'1-2 µm',15.94,4.75,'',1),(7,'Graphite',2,1,2160,0.14,'<100 nm',15.9,4.95,'',0),(8,'Silver',1,1,10490,0,'80-100 nm',0,0,'',0),(9,'Latex',1,1,940,0,'?',13.75,0.13,'Coated with Polypyrrole\nSample 3',0),(10,'Latex',2,1,940,0,'1-10 µm',16,0.46,'PPY Coated, SP Armes',0),(11,'Mix',1,1,2160,0.13,'100-200 nm and 1-2 µm',12.94,0.1,'Mix 5:8 ratio of Graphite 1-1 and 2-1.',0),(12,'Mix',2,1,2160,0.11,'100-200 nm and 1-2 µm',0,0,'Mix 3:8 ratio of Graphite 1-1 and 2-1.',0),(13,'Iron',5,1,7874,1.2,'1-3 µm',50,98.94,'Spherical 98+%\nLot #: D28X020',0),(14,'Iron',6,1,7874,1.2,'',16.36,17.93,'Heidelberg Iron dust 711',0),(15,'Moly',1,1,0,0,'',75.79,50,'',0),(16,'Iron',3,2,7874,1.2,'0.05-3.5 µm',16.19,2.04,'Mixed from Iron 1-1 and Iron 2-1 in a 8:1 mix by volume.',1),(17,'Tungsten',1,1,0,0,'',16.01,5.04,'WC 59/6',0),(18,'Graphite',3,1,2160,0,'',16.2,0.26,'',0),(19,'Silica',1,1,0,0,'',15.92,0.86,'PPY coated nanocomposite APS',0),(20,'Silica',2,1,0,0,'',16.17,0.99,'PPY coated nanocomposite FeCl3',0),(21,'PvA',1,1,0,0,'',15.88,0.78,'PPY coated',0),(22,'Latex',3,1,940,0,'',15.95,0.29,'PPY coated sulfur rich PMPV',0),(23,'Pyrhotite',1,1,0,0,'',16.18,0.18,'PPY coated',0),(24,'JSC 1',1,1,0,0,'',0,22.64,'25 um',0),(25,'Iron',7,1,7874,0,'',0,500,'LOT # J17T020\n-50 + 100 mesh',0),(26,'ACS',1,1,0,0,'',0,97.14,'Cas # 100-97-0',0),(27,'Stainless Steel',1,1,0,0,'',0,99.65,'53-63',0),(28,'Flurothane',1,1,0,0,'',112.78,50,'CAS # 206-44-0',0),(29,'Stainless Steel',1,2,0,0,'',0,0,'',0),(30,'Stainless Steel',2,1,0,0,'',0,106.16,'45-53',0),(31,'Perylene',1,1,0,0,'',0,44.33,'Batch# 04215PY',0),(32,'Iron',8,1,7874,0,'<10 micron',42.27,2.79,'CAS # 7439-89-6\nSigma Aldrich',0),(33,'Nickel',2,1,8908,0,'< micron',0,119.66,'CAS # 7440-02-0',0),(34,'Anthracene',1,1,0,0,'',78.82,35,'LOT # G4455A',0),(35,'Meteor Simulant',1,1,0,0,'',0,51.36,'',0),(36,'Silica',3,1,0,0,'0.5 um',16.09,0.82,'PPY coated SIlica\nVeerle\'s Dust',0),(37,'Mix',3,1,7874,1.2,'60 nm - 10 µm',15.84,0.93,'8:1 mix of Iron-8-1 and Iron-4-1.  Seems to have a lack of large and/or slow particles',1),(38,'Silica',4,1,0,0.3,'1 Micron',53.75,10,'PPY coated silica made by Prof. Armes for Zoltan',0),(39,'Iron',9,1,7874,0,'10-30 nm',45.19,5,'Nano Powder\nCAS # 7439-89-6\nLot # H19X042',0),(40,'Iron',8,2,7874,0,'<10 micron',0,250,'<10 Micron\nLot # G19X048\nCas # 7439-89-6',0),(41,'Mix',4,1,2160,0,'',16.25,3.06,'Mix of 711 and 96.02 (6-1 and 2-1)\nDoes not form homogenous mix',0),(42,'Mix',5,1,7874,0.9,'10 µm - 60 nm',15.89,-0.46,'Mix of Iron 8-1, Iron 5-1 and Iron 4-1 in an 6:2:1 by volume ratio.',0),(43,'Silica',5,1,0,0,'0.5 Micron',53.82,4,'PPY coated Silica made by Prof. Armes',0),(44,'Silica',6,1,0,0,'',79.48,15,'PPU coated silica made with APS by Prof. Armes\nNano-composites',0),(45,'Nickel',3,1,8908,0,'40-70 nm',16.1,4.66,'Nanoshel\nNanoPowder',0),(46,'Nickel',4,1,8908,0,'3-7 Micron',12.26,10,'Alfa Aesar Nickel Powder\nLot: D06X023',0),(47,'Nickel',5,1,8908,0,'2.2-3 Micron',13.78,10,'Alfa Aesar Nickel Powder\nLot: H10X012',0),(48,'Mix',6,1,8908,0,'40-70 and 300-500 nm',0,0.06,'8:1 Mixture of Ni 1-1 and 3-1 respectivly',0);
/*!40000 ALTER TABLE `dust_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiment_settings`
--

DROP TABLE IF EXISTS `experiment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiment_settings` (
  `id_experiment_settings` int(11) NOT NULL AUTO_INCREMENT,
  `integer_timestamp` bigint(20) DEFAULT NULL,
  `id_groups` int(11) DEFAULT NULL,
  `tag` text,
  `description` text,
  PRIMARY KEY (`id_experiment_settings`),
  KEY `integer_timestamp` (`integer_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_settings`
--
-- WHERE:  1 limit 100

LOCK TABLES `experiment_settings` WRITE;
/*!40000 ALTER TABLE `experiment_settings` DISABLE KEYS */;
INSERT INTO `experiment_settings` VALUES (1,1340137854565,0,'',''),(2,1340137854565,0,'',''),(3,1340137854565,1,'Run 4.1','Test'),(4,1340371855957,1,'Run 12','Test'),(5,1349981735953,2,'10-11',''),(6,1349985613309,2,'10-11 (10 and above)',''),(7,1349985953948,2,'10-11 (5 and above)',''),(8,1350320678212,2,'Open',''),(9,1350324177150,2,'5+ kms',''),(10,1350399106565,2,'open2',''),(11,1350658222228,2,'Alignment Testing','Test the alignment'),(12,1350659007269,2,'Alignment Testing 5+','Test the alignment'),(13,1350675260142,2,'Alignment Testing 5+ v2','Test the alignment'),(14,1350675915189,2,'Alignment Testing v2','Test the alignment'),(15,1350919929794,2,'Open 3','Test the alignment'),(16,1350920178699,2,'1.5+','Test the alignment'),(17,1350920389614,2,'5+ km/s 2','Test the alignment'),(18,1350924305552,2,'1+ km/s ','Test the alignment'),(19,1350924904821,2,'5+ km/s ','Test the alignment'),(20,1350934504803,2,'5+ km/s  3','Test the alignment'),(21,1350938373024,2,'1+ km/s  3','Test the alignment'),(22,1350939192742,2,'5+ km/s  4','Test the alignment'),(23,1351003950828,2,'5+ km/s 5','Test the alignment'),(24,1351017706010,2,'1+ km/s 5','Test the alignment'),(25,1351092614663,2,'Test6','Anna\'s notes'),(26,1351111812025,2,'Test7','Anna\'s notes'),(27,1351113588699,2,'Test8','Anna\'s notes'),(28,1351177408411,2,'Test9','Anna\'s notes'),(29,1351181836487,2,'Test10','sampling rate changed to 90M'),(30,1351183903829,2,'Test11','sampling rate changed to 80M'),(31,1351198020885,2,'Test12','sampling rate changed to 80M'),(32,1351198186258,2,'Test12','sampling rate changed to 10M'),(33,1351266651057,2,'Test12','sampling rate changed to 10M'),(34,1351270300998,2,'Test13','Test of DAQ vi 1.2'),(35,1351271914223,2,'Test14','Test of DAQ vi 1.2 updated sampling rate'),(36,1351277620410,2,'Test15','Test of updated DAQ'),(37,1351524747978,2,'Test16','Anna\'s Notes'),(38,1351626222403,2,'Test1','NDA Leela'),(39,1351626891706,3,'Test1','NDA Leela'),(40,1351627047629,3,'Test1','NDA Leela'),(41,1351873055449,3,'Test1','NDA Leela'),(42,1351874245476,3,'Test1','NDA Leela'),(43,1352148187456,4,'Test1','7 um Al foil no Kapton tape backing.  Spot finding.'),(44,1352157954229,4,'Test2','7 um Al foil no Kapton tape backing with marked spot.  Spot finding.'),(45,1352214744457,4,'Test3','3mm grid foil.'),(46,1352214831451,4,'Test3','3mm grid foil 1.'),(47,1352214866099,4,'Test3','3mm grid foil 1. Disc A2'),(48,1352219122359,4,'Test3','3mm grid foil 1. Disc A3'),(49,1352219186751,4,'Test4','3mm grid foil 1. Disc A3'),(50,1352219202651,4,'Test4','3mm grid foil 1. Disc A3'),(51,1352247672178,4,'Test5','35 x 35 mm optical flat'),(52,1352301848320,4,'Test6','3 mm foil, Al 0.8 um mesh No. 2-B2, position 11'),(53,1352306010826,4,'Test7','3 mm foil, Al 0.8 um mesh No. 2-B2, position 12'),(54,1352306045899,4,'Test7','3 mm foil, Al 0.8 um mesh No. 2-B1, position 10'),(55,1352310272403,4,'Test8','3 mm foil, Al 0.8 um mesh No. 2-B3, position 9'),(56,1352311799119,4,'Test8','3 mm foil, Al 0.8 um, donut, No. 2-A1, position 9 '),(57,1352391736109,4,'Test8','3 mm foil, Au 2 um, donut, No. 3-A2, position 7'),(58,1352391793553,4,'Test9','3 mm foil, Au 2 um, donut, No. 3-A2, position 7'),(59,1352395335123,4,'Test10','3 mm foil, Au 2 um, donut, No. 3-A3, position 7'),(60,1352395368180,4,'Test10','3 mm foil, Au 2 um, donut, No. 3-A3, position 6'),(61,1352395377853,4,'Test10','3 mm foil, Au 2 um, donut, No. 3-A1, position 6'),(62,1352828561104,5,'Source Testing',''),(63,1352829245042,5,'Source Testing',''),(64,1352829315596,5,'Source Testing (5+)',''),(65,1352829964046,5,'Source Testing (5+2)',''),(66,1352830671032,5,'Run1',''),(67,1352836327304,5,'Run2',''),(68,1352839790796,5,'Run3',''),(69,1352844695231,5,'Run4',''),(70,1352911058990,5,'Iridium initial tests',''),(71,1352911217088,5,'run5',''),(72,1352916718809,5,'Run6',''),(73,1352926182955,5,'Run7',''),(74,1352932537538,5,'Run8',''),(75,1352933159018,5,'Run9',''),(76,1352999357125,5,'Run10',''),(77,1353012692164,5,'Run11',''),(78,1353085050742,5,'Run12',''),(79,1353348115144,2,'Run 1 11/19',''),(80,1353355731177,2,'Run 2 11/19',''),(81,1353434169850,2,'Run 3 11/20',''),(82,1353948203208,6,'Run1','Niobium Target'),(83,1353952089669,6,'Run2','Niobium Target'),(84,1353966288977,6,'Run3','Niobium Target Spectra'),(85,1353969771586,6,'Run4','Niobium Target'),(86,1354035652963,6,'Run5','Tungsten Tantalum Target'),(87,1354046539507,6,'Run6','Tungsten Tantalum Target Spectra'),(88,1354119766986,6,'Run7','Witness Plate'),(89,1354132811267,6,'Run8','Witness Plate 10V'),(90,1354207033284,6,'Run9','Witness Plate 20V'),(91,1354215706374,6,'Run10','Witness Plate 20V'),(92,1354227376014,6,'Run11','Witness Plate 10V'),(93,1354560941900,7,'test1','PMT + MCP'),(94,1354574268279,7,'test2','PMT + MCP 5k'),(95,1354638563912,7,'test3','PMT + MCP 5k quartz'),(96,1354644758848,7,'test4','PMT + MCP  quartz 5k on mcp'),(97,1354645526155,7,'test5','PMT + MCP  5k quartz'),(98,1354725051316,7,'test1','Fibers no selection'),(99,1354728602205,7,'test6','Fibers no selection'),(100,1354731262190,7,'test7','Fibers 5k+');
/*!40000 ALTER TABLE `experiment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiment_settings_small`
--

DROP TABLE IF EXISTS `experiment_settings_small`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiment_settings_small` (
  `id_experiment_settings` int(11) NOT NULL AUTO_INCREMENT,
  `integer_timestamp` bigint(20) DEFAULT NULL,
  `id_groups` int(11) DEFAULT NULL,
  `tag` text,
  `description` text,
  PRIMARY KEY (`id_experiment_settings`),
  KEY `integer_timestamp` (`integer_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiment_settings_small`
--
-- WHERE:  1 limit 100

LOCK TABLES `experiment_settings_small` WRITE;
/*!40000 ALTER TABLE `experiment_settings_small` DISABLE KEYS */;
INSERT INTO `experiment_settings_small` VALUES (1,0,9,'Initial test','Testing'),(2,1403909032020,9,'Initial test','Testing Small Accelerator');
/*!40000 ALTER TABLE `experiment_settings_small` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_names` varchar(45) DEFAULT NULL,
  `id_groups` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_groups`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--
-- WHERE:  1 limit 100

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES ('June Lightflash',1),('Anna Spectrometer',2),('NDA',3),('Throop Foils',4),('November Lightflash',5),('David Malaspina',6),('Keith the Drake',7),('Evans little thingy',8),('Maintenance',9),('Neutral Gas',10),('STEREO',11),('Eric Christian',12),('Solar Cell',13),('LDEX',14),('Mehoke Foils',15),('Ejecta Experiments 2014',16),('ODINSun',17),('New Group Name',18),('HyperSuda',19),('Todd Bradley Florida Group',20);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_environ`
--

DROP TABLE IF EXISTS `lab_environ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_environ` (
  `integer_timestamp` bigint(20) NOT NULL,
  `temp` float DEFAULT NULL,
  `pressure` float DEFAULT NULL,
  PRIMARY KEY (`integer_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_environ`
--
-- WHERE:  1 limit 100

LOCK TABLES `lab_environ` WRITE;
/*!40000 ALTER TABLE `lab_environ` DISABLE KEYS */;
INSERT INTO `lab_environ` VALUES (1394469292212,74.8,627.127),(1394472907326,74.6,626.452),(1394476526808,75.2,625.701),(1394479534788,75.3,624.726),(1394483147055,75.9,623.676),(1394486716399,76.2,622.926),(1394488193266,76.6,622.626),(1394491811874,77.1,621.876),(1394495437208,77.7,621.201),(1394499065314,75.9,620.976),(1394502695088,75.7,621.126),(1394506332351,75.5,621.051),(1394509949049,75.2,620.901),(1394513564733,75.2,620.751),(1394517201139,75,620.601),(1394520828810,74.6,620.601),(1394524440465,74.6,620.526),(1394528067027,74.4,620.151),(1394531676577,74.3,620.751),(1394535302334,74.3,620.676),(1394538936835,74.1,621.126),(1394542555219,73.9,622.476),(1394546177594,73.9,622.851),(1394549794278,73.7,623.601),(1394553420656,73.9,624.726),(1394557028713,74.1,626.752),(1394560646530,73.9,627.877),(1394564267507,73.5,630.052),(1394567887343,73.5,630.952),(1394571498528,73.5,631.627),(1394575118633,73.4,632.302),(1394578771984,73.5,633.127),(1394582387824,73.2,633.427),(1394586015048,73.7,634.102),(1394589619798,74.1,634.477),(1394631546108,73.2,635.002),(1394633755491,73.9,635.002),(1394637364435,74.6,634.852),(1394640974780,74.6,634.627),(1394644585845,75.2,634.252),(1394648217282,74.6,633.727),(1394651827018,73.4,633.277),(1394655874767,75,632.302),(1394659480853,75,631.852),(1394663096664,75,631.627),(1394666723331,75,631.177),(1394670326923,74.4,631.252),(1394673938114,74.4,631.552),(1394677550393,75.2,631.777),(1394681156761,74.3,631.927),(1394684766783,74.6,631.852),(1394688370187,74.6,631.627),(1394691992104,74.4,631.177),(1394695600514,74.3,630.877),(1394699214317,74.1,630.352),(1394702849932,74.1,629.752),(1394706451343,74.1,629.227),(1394710067795,74.1,629.152),(1394713679952,74.1,628.852),(1394717284812,73.9,628.777),(1394720908163,74.3,628.477),(1394724518390,74.8,628.252),(1394728133377,75.5,627.577),(1394731761896,74.8,626.977),(1394735373867,75,625.851),(1394738993480,75,625.401),(1394742608087,75.2,624.876),(1394746231681,75.3,624.651),(1394749857100,75.7,624.576),(1394753467054,75.5,624.501),(1394757082168,75.2,623.901),(1394760691748,75,623.976),(1394764317737,74.4,624.651),(1394767932533,74.4,625.026),(1394771556749,75.5,625.551),(1394775163872,74.3,626.227),(1394778776836,74.4,626.902),(1394782396861,75.2,627.802),(1394786017133,75.5,628.552),(1394789636628,75.3,628.477),(1394793292790,75.3,628.552),(1394796892863,75.2,628.852),(1394800516859,75,628.702),(1394804116896,74.8,628.852),(1394807726596,74.8,628.702),(1394811347631,74.4,628.777),(1394812991951,75,628.627),(1394813361466,75,628.552),(1394816965860,75,628.327),(1394820576128,75,627.877),(1394824198582,75,627.277),(1394827805235,75.2,626.602),(1394831416270,75.3,625.926),(1394835029181,75.3,625.326),(1394838653029,76.1,625.326),(1394842262301,75.2,625.401),(1394845871957,75,625.476),(1394849506057,74.6,625.251),(1394853126161,74.1,625.551),(1394856730317,73.7,625.776);
/*!40000 ALTER TABLE `lab_environ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operator`
--

DROP TABLE IF EXISTS `operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operator` (
  `integer_timestamp` bigint(20) NOT NULL,
  `operator_id` int(11) NOT NULL,
  PRIMARY KEY (`integer_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operator`
--
-- WHERE:  1 limit 100

LOCK TABLES `operator` WRITE;
/*!40000 ALTER TABLE `operator` DISABLE KEYS */;
INSERT INTO `operator` VALUES (0,0),(1359076707769,0),(1359149189276,0),(1359149193526,1),(1359149225626,0),(1359151356898,1),(1359152635561,0),(1359405516474,1),(1360601773241,4),(1360859935017,2),(1361209216188,4),(1361984490165,2),(1362091164725,4),(1362158144536,2),(1362412942496,3),(1362513877798,2),(1363203329061,0),(1363203333761,3),(1369237613306,4),(1369325372785,3),(1369348298542,4),(1369416780920,3),(1369759903993,2),(1374610026214,0),(1374610033214,2),(1375368635735,4),(1375392974444,2),(1378216856305,3),(1378219804085,4),(1378225419349,3),(1379947795902,0),(1379947802652,2),(1381414059063,3),(1382369183853,2),(1384214817651,3),(1397221237096,1),(1397741840568,6),(1398106856262,3),(1398184175615,1),(1399476109345,6),(1400086809443,3),(1401313178137,0),(1401313183738,6),(1401979516387,4),(1403009748961,3),(1403553134863,4),(1404589192114,6);
/*!40000 ALTER TABLE `operator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operator_small`
--

DROP TABLE IF EXISTS `operator_small`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operator_small` (
  `integer_timestamp` bigint(20) NOT NULL,
  `operator_id` int(11) NOT NULL,
  PRIMARY KEY (`integer_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operator_small`
--
-- WHERE:  1 limit 100

LOCK TABLES `operator_small` WRITE;
/*!40000 ALTER TABLE `operator_small` DISABLE KEYS */;
INSERT INTO `operator_small` VALUES (0,0),(1389995978665,3),(1389996501604,5),(1404756603787,0),(1404756607587,5);
/*!40000 ALTER TABLE `operator_small` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelletron_data`
--

DROP TABLE IF EXISTS `pelletron_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pelletron_data` (
  `id_pelletron_data` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `integer_timestamp` bigint(20) DEFAULT NULL,
  `high_voltage` float DEFAULT NULL,
  `positive_high_voltage_supply` double DEFAULT NULL,
  `negative_high_voltage_supply` double DEFAULT NULL,
  `hv_control_difference` double DEFAULT NULL,
  `vacuum_pressure` float DEFAULT NULL,
  `radiation` double DEFAULT NULL,
  `column_current` float DEFAULT NULL,
  `lost_charge` double DEFAULT NULL,
  `chain_current` float DEFAULT NULL,
  `control_high_voltage` double DEFAULT NULL,
  PRIMARY KEY (`id_pelletron_data`)
) ENGINE=InnoDB AUTO_INCREMENT=2534513 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelletron_data`
--
-- WHERE:  1 limit 100

LOCK TABLES `pelletron_data` WRITE;
/*!40000 ALTER TABLE `pelletron_data` DISABLE KEYS */;
INSERT INTO `pelletron_data` VALUES (0000000001,1340137854565,2,0,0,0,0,0,0,0,0,0),(0000000002,1340137854565,0,0,0,0,0,0,0,0,0,0),(0000000003,1340137854565,2,0,0,0,0,0,0,0,0,0),(0000000004,1340371855957,2,0,0,0,0,0,0,0,0,0),(0000000005,1349102205479,0,1.04304003715515,-1.00622701644897,-500,9.66825e-08,0.0467894487082958,0,0,0,3),(0000000006,1349102208082,0,1.04304003715515,-1.00622701644897,-500,9.72277e-08,0.0592388287186623,0,0,0.14652,3),(0000000007,1349102210484,0.00369048,1.04304003715515,-1.01849794387817,-500,9.66825e-08,0.0639007613062858,0,0,0,3),(0000000008,1349102212886,0.030754,1.04304003715515,-1.01849794387817,-500,9.72277e-08,0.0589829497039318,0,0,0,3),(0000000009,1349102215287,0.0578175,1.04304003715515,-1.00622701644897,-500,9.66825e-08,0.0463861115276814,0,0,0,3),(0000000010,1349102217687,0.0824206,1.04304003715515,-1.01849794387817,-500,9.72277e-08,0.0385912694036961,0,0,0,3),(0000000011,1349102220090,0.103333,1.04304003715515,-1.00622701644897,-500,9.66825e-08,0.0485431216657162,0,0,0,3),(0000000012,1349102222490,0.121786,1.04304003715515,-1.00622701644897,-500,9.66825e-08,0.0472985506057739,0,0,0,3),(0000000013,1349102224892,0.132857,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0396925397217274,0,0,0.19536,3),(0000000014,1349102227294,0.107024,2.02472496032715,-2.00018310546875,-500,9.66825e-08,0.0491776317358017,0,0.488400489091873,0.39072,3),(0000000015,1349102229696,0.0799603,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0398647412657738,0,0.537240505218506,0.2442,3),(0000000016,1349102232100,0.0615079,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0422637984156609,0,0.244200199842453,0.586081,3),(0000000017,1349102234500,0.0442857,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0529330782592297,0,0,0.4884,3),(0000000018,1349102236903,0.030754,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0510208196938038,0,0.244200199842453,0,3),(0000000019,1349102239304,0.0221429,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0578451082110405,0,0.195360198616982,0.19536,3),(0000000020,1349102241704,0.0135318,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0550360083580017,0,0.586080610752106,0.29304,3),(0000000021,1349102244104,0.00615079,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0769741535186768,0,0.390720397233963,0.4884,3),(0000000022,1349102246507,0.00123016,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0577200390398502,0,0,0.683761,3),(0000000023,1349102248908,0.00123016,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0551552586257458,0,0.488400489091873,0,3),(0000000024,1349102251308,0.00492063,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0446137003600597,0,0,0.19536,3),(0000000025,1349102253709,0.00738095,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0455898381769657,0,0.341880291700363,0,3),(0000000026,1349102256110,0.00738095,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0385912694036961,0.02442,-0.0244200192391872,0.14652,3),(0000000027,1349102258510,0.00861111,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0431885309517384,0.0732601,0.146520093083382,0,3),(0000000028,1349102260910,0.00861111,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0396925397217274,0.04884,-0.0244200192391872,0.0976801,3),(0000000029,1349102263313,0.00861111,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0341861210763454,0.0732601,-0.0732600688934326,0.34188,3),(0000000030,1349102265713,0.00861111,2.02472496032715,-2.00018310546875,-500,9.66825e-08,0.0358533300459385,0.0732601,-0.0732600688934326,0,3),(0000000031,1349102268113,0.00861111,2.02472496032715,-2.00018310546875,-500,9.66825e-08,0.0448072403669357,0.0732601,-0.0488400496542454,0,3),(0000000032,1349102270514,0.00738095,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0376018509268761,0.04884,-0.0488400496542454,0,3),(0000000033,1349102272914,0.00615079,2.02472496032715,-2.00018310546875,-500,9.66825e-08,0.0326670594513416,0,-0.0244200192391872,0,3),(0000000034,1349102275314,0.00492063,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0290636904537678,0,0.537240505218506,0,3),(0000000035,1349102277715,0.00369048,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.026026239618659,0,0,0,3),(0000000036,1349102280119,0.00123016,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0238161701709032,0,0,0,3),(0000000037,1349102282521,0,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0264235604554415,0,0,0,3),(0000000038,1349102284922,0.00123016,2.02472496032715,-2.00018310546875,-500,9.66825e-08,0.0236620306968689,0,0.244200199842453,0,3),(0000000039,1349102287326,0.00123016,2.02472496032715,-2.00018310546875,-500,9.66825e-08,0.0264235604554415,0,0,0,3),(0000000040,1349102289728,0.00246032,2.02472496032715,-2.00018310546875,-500,9.66825e-08,0.0274733193218708,0,0,0,3),(0000000041,1349102292129,0.00492063,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0254139192402363,0,0,0,3),(0000000042,1349102294532,0.00615079,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0349341109395027,0,0,0,3),(0000000043,1349102296933,0.00738095,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0304810907691717,0,0,0,3),(0000000044,1349102299335,0.00984127,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0271776095032692,0,0,0.2442,3),(0000000045,1349102301736,0.0110714,2.03699588775635,-2.00018310546875,-500,9.72277e-08,0.0245488900691271,0,0,0,3),(0000000046,1349102304139,0.0110714,2.02472496032715,-2.00018310546875,-500,9.66825e-08,0.0269433297216892,0,0,0,3),(0000000047,1349102306541,0.0135318,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0436584502458572,0,0,0,3),(0000000048,1349102308944,0.0147619,2.02472496032715,-2.00018310546875,-500,9.66825e-08,0.0433758907020092,0,0,0,3),(0000000049,1349102311347,0.0159921,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.037683330476284,0,0,0,3),(0000000050,1349102313747,0.0172222,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0323854684829712,0,0,0,3),(0000000051,1349102316148,0.0184524,2.02472496032715,-2.00018310546875,-500,9.66825e-08,0.0345580913126469,0,0,0,3),(0000000052,1349102318550,0.0196825,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0367967411875725,0,0,0,3),(0000000053,1349102320953,0.0209127,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0321062915027142,0,0,0,3),(0000000054,1349102323356,0.0221429,2.02472496032715,-2.00018310546875,-500,9.66825e-08,0.0280137304216623,0,0,0,3),(0000000055,1349102325757,0.023373,2.02472496032715,-2.00018310546875,-500,9.66825e-08,0.0371166989207268,0,0,0,3),(0000000056,1349102328162,0.0246032,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0374394282698631,0,0,0,3),(0000000057,1349102330563,0.0258333,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0586012117564678,0,0,0,3),(0000000058,1349102332963,0.0270635,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0645960494875908,0,0,0,3),(0000000059,1349102335364,0.0295238,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0500365681946278,0,0,0,3),(0000000060,1349102337764,0.0282937,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0490713082253933,0,0,0,3),(0000000061,1349102340165,0.030754,2.02472496032715,-2.00018310546875,-500,9.66825e-08,0.0817832797765732,0,0,0,3),(0000000062,1349102342566,0.030754,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0830318033695221,0,0,0,3),(0000000063,1349102344966,0.0319841,2.02472496032715,-2.00018310546875,-500,9.72277e-08,0.0807280763983727,0,0,0,3),(0000000064,1349102347366,0.0332143,2.02472496032715,-2.00018310546875,-500,9.72277e-08,0.0553945302963257,0,0,0,3),(0000000065,1349102349769,0.0332143,2.03699588775635,-2.00018310546875,-500,9.72277e-08,0.0461857505142689,0,0,0,3),(0000000066,1349102352170,0.0332143,2.03699588775635,-2.00018310546875,-500,9.72277e-08,0.053857609629631,0,0,0,3),(0000000067,1349102354570,0.0344444,2.03699588775635,-2.00018310546875,-500,9.72277e-08,0.0613262318074703,0,0,0,3),(0000000068,1349102356970,0.0356746,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0487537086009979,0,0,0,3),(0000000069,1349102361770,0.0405952,2.03699588775635,-2.00018310546875,-500,9.72277e-08,0.0640392228960991,0,0,0,3),(0000000070,1349102364173,0.0418254,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.048648301512003,0,0,0,3),(0000000071,1349102366576,0.0418254,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0414484813809395,0,0,0,3),(0000000072,1349102368978,0.0418254,2.02472496032715,-2.00018310546875,-500,9.66825e-08,0.0354674197733402,0,0,0,3),(0000000073,1349102371378,0.0430556,2.02472496032715,-2.00018310546875,-500,9.72277e-08,0.0310806706547737,0,0,0,3),(0000000074,1349102373779,0.0442857,2.02472496032715,-2.00018310546875,-500,9.66825e-08,0.0477098189294338,0,0,0,3),(0000000075,1349102376179,0.0455159,2.03699588775635,-2.00018310546875,-500,9.72277e-08,0.0482289418578148,0,0,0,3),(0000000076,1349102378580,0.046746,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0398647412657738,0,0,0,3),(0000000077,1349102380982,0.046746,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0416282899677754,0,0,0,3),(0000000078,1349102383385,0.0479762,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0418088883161545,0,0,0,3),(0000000079,1349102385788,0.0492063,2.02472496032715,-2.00018310546875,-500,9.66825e-08,0.0738729014992714,0,0,0,3),(0000000080,1349102388188,0.0504365,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0556348413228989,0,0,0,3),(0000000081,1349102390590,0.0504365,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0502536408603191,0,0,0,3),(0000000082,1349102392994,0.0516667,2.02472496032715,-2.00018310546875,-500,9.72277e-08,0.0521371513605118,0,0,0,3),(0000000083,1349102395395,0.0528968,2.03699588775635,-2.00018310546875,-500,9.66825e-08,0.0535090304911137,0,0,0,3),(0000000084,1349102397799,0.054127,2.02472496032715,-2.00018310546875,-500,9.72277e-08,0.0678931102156639,0,0,0,3),(0000000085,1349102400201,0.0528968,3.03095197677612,-2.99413895606995,-500,9.72277e-08,0.0623973496258259,0,2.19780206680298,1.90476,2),(0000000086,1349102402602,0.0135318,3.01868104934692,-2.99413895606995,-500,9.72277e-08,0.0567292086780071,0,2.68620300292969,2.39316,2),(0000000087,1349102405006,0.0209127,3.03095197677612,-3.00640988349915,-500,9.72277e-08,0.0651577264070511,0.0976801,2.44200205802917,2.39316,2),(0000000088,1349102407406,0.0492063,3.01868104934692,-3.00640988349915,-500,9.66825e-08,0.0593671910464764,0.51282,2.27106189727783,2.34432,2),(0000000089,1349102409808,0.0713492,3.01868104934692,-2.99413895606995,-500,9.72277e-08,0.0684834495186806,0.879121,1.9291820526123,2.73504,2),(0000000090,1349102412212,0.0898016,3.01868104934692,-2.99413895606995,-500,9.72277e-08,0.0741933807730675,1.221,1.22100102901459,2.05128,2),(0000000091,1349102414614,0.105794,3.03095197677612,-3.00640988349915,-500,9.72277e-08,0.0550360083580017,1.4652,1.17216098308563,2.63736,2),(0000000092,1349102417016,0.118095,3.01868104934692,-2.99413895606995,-500,9.72277e-08,0.0529330782592297,1.63614,1.05006098747253,2.63736,2),(0000000093,1349102419417,0.126706,3.03095197677612,-2.99413895606995,-500,9.66825e-08,0.0432821102440357,1.80708,0.659340679645538,2.58852,2),(0000000094,1349102421819,0.131627,3.01868104934692,-3.00640988349915,-500,9.66825e-08,0.0365585908293724,1.92918,0.415140390396118,2.63736,2),(0000000095,1349102424221,0.141468,3.03095197677612,-2.99413895606995,-500,9.66825e-08,0.0384245812892914,2.05128,0.195360198616982,2.442,2),(0000000096,1349102426623,0.145159,3.01868104934692,-2.99413895606995,-500,9.72277e-08,0.0332376211881638,2.12454,0.586080610752106,2.34432,2),(0000000097,1349102429026,0.147619,3.01868104934692,-3.00640988349915,-500,9.72277e-08,0.0293164104223251,2.1978,0.0732600688934326,2.78388,2),(0000000098,1349102431428,0.150079,3.01868104934692,-3.00640988349915,-500,9.66825e-08,0.0325259603559971,2.22222,0.0732600688934326,2.49084,2),(0000000099,1349102436229,0.15377,3.01868104934692,-2.99413895606995,-500,9.72277e-08,0.0256348997354507,2.29548,0,2.34432,2),(0000000100,1349102438630,0.155,3.03095197677612,-2.99413895606995,-500,9.72277e-08,0.0232558492571115,2.29548,0.0976800993084908,2.442,2);
/*!40000 ALTER TABLE `pelletron_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psu`
--

DROP TABLE IF EXISTS `psu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `psu` (
  `integer_timestamp` bigint(20) NOT NULL,
  `velocity_max` float DEFAULT NULL,
  `velocity_min` float DEFAULT NULL,
  `charge_max` float DEFAULT NULL,
  `charge_min` float DEFAULT NULL,
  `mass_max` float DEFAULT NULL,
  `mass_min` float DEFAULT NULL,
  `var1` tinyint(4) DEFAULT NULL,
  `var2` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`integer_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psu`
--
-- WHERE:  1 limit 100

LOCK TABLES `psu` WRITE;
/*!40000 ALTER TABLE `psu` DISABLE KEYS */;
INSERT INTO `psu` VALUES (1350950601971,1.5,1,NULL,NULL,NULL,NULL,NULL,NULL),(1350950921124,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1351003962337,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1351017713388,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1351092623616,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1351111817403,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1351113594731,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1351177413736,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1351197968953,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1351198129638,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1351198188468,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1351266657969,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1351270310658,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1351271915626,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1351277622190,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1351524777441,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1351626231715,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1351626903972,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1351627059374,2.99792e+08,2.5,NULL,NULL,NULL,NULL,NULL,NULL),(1351873261484,2.99792e+08,2.5,NULL,NULL,NULL,NULL,NULL,NULL),(1351874253694,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1352148194082,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1352157957379,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1352214790428,2.99792e+08,2,NULL,NULL,NULL,NULL,NULL,NULL),(1352214833728,2.99792e+08,2,NULL,NULL,NULL,NULL,NULL,NULL),(1352219128372,2.99792e+08,2,NULL,NULL,NULL,NULL,NULL,NULL),(1352219188872,2.99792e+08,2,NULL,NULL,NULL,NULL,NULL,NULL),(1352219214736,2.99792e+08,3,NULL,NULL,NULL,NULL,NULL,NULL),(1352247690119,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1352301854404,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1352306026246,2.99792e+08,2,NULL,NULL,NULL,NULL,NULL,NULL),(1352310281486,2.99792e+08,3,NULL,NULL,NULL,NULL,NULL,NULL),(1352391742315,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1352395337128,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1352395370228,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1352395379129,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1352828563940,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1352829305145,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1352829317348,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1352829965321,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1352830673746,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1352836379893,2.99792e+08,10,NULL,NULL,NULL,NULL,NULL,NULL),(1352839809557,10,5,NULL,NULL,NULL,NULL,NULL,NULL),(1352844709356,2.99792e+08,10,NULL,NULL,NULL,NULL,NULL,NULL),(1352911068693,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1352911218595,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1352916770200,2.99792e+08,20,NULL,NULL,NULL,NULL,NULL,NULL),(1352926259148,15,5,NULL,NULL,NULL,NULL,NULL,NULL),(1352932590211,10,2.5,NULL,NULL,NULL,NULL,NULL,NULL),(1352933253069,2.99792e+08,30,NULL,NULL,NULL,NULL,NULL,NULL),(1352999378610,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1353010520770,15,8,NULL,NULL,NULL,NULL,NULL,NULL),(1353012706291,2.99792e+08,20,NULL,NULL,NULL,NULL,NULL,NULL),(1353085057739,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1353348123134,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1353355710313,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1353355751563,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1353434172826,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1353948246972,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1353952098578,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1353966291413,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1353969774398,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1354035655832,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1354046540845,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1354119772749,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1354132814302,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1354207035143,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1354215708382,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1354227378008,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1354560944028,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1354574270317,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1354638565479,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1354638584929,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1354644761943,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1354644786442,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1354645527501,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1354725572186,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1354728576193,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1354728604168,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1354731274273,2.99792e+08,5,NULL,NULL,NULL,NULL,NULL,NULL),(1354827497293,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1354827515444,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1354832610894,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1354906295712,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1355420124037,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1355506842649,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1355506878599,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1355785211340,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1355785235041,2.99792e+08,0,NULL,NULL,NULL,NULL,NULL,NULL),(1355860899786,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1355860986537,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1355871311691,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1355873190610,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1355873415512,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1355873440913,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1355876016336,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1355876508744,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1355876693097,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1355876711847,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL),(1355876735498,2.99792e+08,1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `psu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `run_times`
--

DROP TABLE IF EXISTS `run_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `run_times` (
  `start_timestamp` bigint(20) NOT NULL,
  `stop_timestamp` bigint(20) DEFAULT NULL,
  `id_experiment_settings` int(11) DEFAULT NULL,
  PRIMARY KEY (`start_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run_times`
--
-- WHERE:  1 limit 100

LOCK TABLES `run_times` WRITE;
/*!40000 ALTER TABLE `run_times` DISABLE KEYS */;
INSERT INTO `run_times` VALUES (1391724297856,1391724303456,461),(1391712557196,1391714388204,459),(1391709747995,1391712389197,458),(1391705306159,1391709296781,457),(1391705295358,1391705302158,456),(1391641350619,1391643309031,455),(1391639170812,1391641212209,454),(1391626800081,1391630308092,453),(1391623509065,1391626710680,452),(1391620442442,1391623379240,451),(1391618004826,1391619197833,450),(1391615404807,1391617901029,449),(1391558427623,1391561397293,448),(1391556202209,1391558093820,447),(1391556151811,1391556200409,447),(1391555742204,1391555793808,447),(1391539767027,1391542228050,446),(1391539650225,1391539682866,446),(1391539629424,1391539636626,446),(1391535370000,1391539545624,445),(1391531150209,1391535257802,444),(1391469532609,1391473514626,443),(1391466675202,1391469325659,442),(1391462043187,1391466353794,441),(1391461680173,1391462036624,441),(1391460491371,1391461419167,440),(1391460217542,1391460313411,440),(1391459683165,1391460151176,440),(1391459380335,1391459673738,440),(1391458866729,1391459378336,440),(1391458794530,1391458865129,440),(1391452940213,1391454461403,439),(1391452428210,1391452938611,439),(1391447286183,1391452256210,438),(1391122951940,1391125958551,437),(1391122880939,1391122914940,437),(1391107691244,1391110609273,436),(1391107492044,1391107640445,436),(1391098893401,1391103051244,435),(1391096869590,1391098756198,434),(1390947669214,1390952229040,433),(1390944357198,1390947592212,432),(1390943905796,1390944227196,431),(1390941026777,1390943901793,431),(1390941025378,1390941025978,431),(1390929319274,1390933258094,430),(1390924281648,1390928773470,429),(1390855423740,1390857845367,428),(1390854172535,1390855099141,427),(1390845754727,1390846422583,426),(1390843658918,1390845345929,425),(1390841422905,1390842488512,424),(1390589697459,1390591491068,423),(1390589305256,1390589691659,423),(1390588318654,1390589301657,423),(1390584430827,1390587036855,422),(1390584324828,1390584325427,421),(1390582916438,1390583805427,421),(1390580627159,1390582909864,421),(1390580624013,1390580625210,420),(1390580548008,1390580619209,420),(1390579531006,1390580544208,420),(1390511832074,1390515519095,419),(1390509345662,1390511520491,419),(1390493733579,1390498798422,418),(1390346256366,1390348786177,417),(1390328563909,1390330277920,416),(1390323300041,1390326084866,415),(1390322705643,1390323143243,415),(1390322593841,1390322702483,415),(1390322449041,1390322586442,415),(1390243703605,1390246393420,414),(1390243333803,1390243656605,414),(1390243273004,1390243277402,414),(1390243256054,1390243262003,414),(1390243206003,1390243238804,414),(1390241505409,1390241764196,413),(1390241110192,1390241494847,413),(1390240923392,1390241104793,413),(1390240873590,1390240915991,413),(1390240789392,1390240872190,413),(1390240744592,1390240782590,413),(1390240701979,1390240739627,413),(1390240600189,1390240692378,413),(1390240587017,1390240589991,413),(1390238612140,1390238895743,413),(1390238576338,1390238604738,413),(1390238516541,1390238573338,413),(1390238487740,1390238502142,413),(1390238456742,1390238471342,413),(1389830179655,1389831018406,412),(1389829426050,1389830082453,412),(1389828108446,1389829001648,412),(1389827271245,1389828101443,412),(1389826476834,1389827227038,412),(1389826072821,1389826468436,412),(1389825440828,1389826062622,412),(1389823971421,1389824848026,412),(1389822468410,1389822813817,412),(1389822004411,1389822342614,412);
/*!40000 ALTER TABLE `run_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `run_times_small`
--

DROP TABLE IF EXISTS `run_times_small`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `run_times_small` (
  `start_timestamp` bigint(20) NOT NULL,
  `stop_timestamp` bigint(20) DEFAULT NULL,
  `id_experiment_settings` int(11) DEFAULT NULL,
  PRIMARY KEY (`start_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run_times_small`
--
-- WHERE:  1 limit 100

LOCK TABLES `run_times_small` WRITE;
/*!40000 ALTER TABLE `run_times_small` DISABLE KEYS */;
INSERT INTO `run_times_small` VALUES (0,0,0);
/*!40000 ALTER TABLE `run_times_small` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_settings`
--

DROP TABLE IF EXISTS `source_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_settings` (
  `integer_timestamp` bigint(20) NOT NULL,
  `einzel_voltage` float DEFAULT NULL,
  `needle_voltage` float DEFAULT NULL,
  `frequency` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `amplitude` float DEFAULT NULL,
  `x_voltage` float DEFAULT NULL,
  `y_voltage` float DEFAULT NULL,
  `settings_id` text,
  `id_source_settings` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`integer_timestamp`),
  KEY `id_source_settings` (`id_source_settings`)
) ENGINE=InnoDB AUTO_INCREMENT=1928 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_settings`
--
-- WHERE:  1 limit 100

LOCK TABLES `source_settings` WRITE;
/*!40000 ALTER TABLE `source_settings` DISABLE KEYS */;
INSERT INTO `source_settings` VALUES (1350515439068,0,0,1,0,0,0,0,'Auto',1),(1350515439187,0,0,1,0,0,0,0,'Auto',2),(1350515458612,0,0,1,0,0,0,0,'Auto',3),(1350515509415,0,0,1,0,0,0,0,'Auto',4),(1350518650117,8.1,9.1,1,0,4.55,0,0,'Auto',5),(1350578704157,8.1,9.1,20,0,4.55,0,0,'Auto',6),(1350579378332,0,0,1,0,0,0,0,'Auto',7),(1350602946965,8.1,9.1,20,0,4.55,4.5,4.5,'Auto',8),(1350603198320,0,0,1,0,0,0,0,'Auto',9),(1350603227816,0,0,1,0,0,0,0,'Auto',10),(1350603241159,0,0,1,0,0,0,0,'Auto',11),(1350603246040,0,0,1,0,0,0,0,'Auto',12),(1350603294136,0,0,1,0,0,0,0,'Auto',13),(1350603344888,0,0,1,0,0,0,0,'Auto',14),(1350603576516,8.1,9.1,20.02,0,4.55,0,0,'Auto',15),(1350603987112,5,0,1,0,0,0,0,'Auto',16),(1350604077359,5,0,1,0,0,0,0,'Auto',17),(1350604219090,1,0,1,0,0,0,0,'Auto',18),(1350659404878,8.15,9.1,25,0,4.5,4.35,4.5,'Auto',19),(1350659405043,8.15,9.1,25,0,4.5,4.35,4.5,'Auto',20),(1350669857953,8.15,9.1,1,0,4.5,4.35,4.5,'Auto test',21),(1350676344901,8.12,9.1,1,0,4.5,0,0,'Auto',22),(1350686152638,0,0,0,0,0,0,0,'Automatic Update at  10/19/2012 4:35:52 PM',23),(1350686244459,0,0,0,0,0,0,0,'Automatic Update at  10/19/2012 4:37:24 PM',24),(1350686276692,0,0,0,0,0,0,0,'Automatic Update at  10/19/2012 4:37:56 PM',25),(1350686399114,0,0,0,0,0,0,0,'Automatic Update at  10/19/2012 4:39:59 PM',26),(1350686446426,0,0,0,0,0,0,0,'Automatic Update at  10/19/2012 4:40:46 PM',27),(1350686636886,0,0,0,0,0,0,0,'Automatic Update at  10/19/2012 4:43:56 PM',28),(1350687814041,0,0,0,0,0,0,0,'Automatic Update at  10/19/2012 5:03:34 PM',29),(1350689468917,0,0,1,0,0,0,0,'Awesome settings that work',30),(1350689469107,0,0,1,0,0,0,0,'Awesome settings that work',31),(1350689528303,0,0,0,0,0,0,0,'Automatic Update at  10/19/2012 5:32:08 PM',32),(1350689655405,0,0,0,0,0,0,0,'Automatic Update at  10/19/2012 5:34:15 PM',33),(1350689991488,0,0,5,0,0,2,1,'Automatic Update at  10/19/2012 5:39:51 PM',34),(1350923894948,8.15,9.1,24.99,0,4.5,0,0,'Working settings',35),(1350923895900,8.15,9.1,24.99,0,4.5,0,0,'Working settings',36),(1350925646900,8.15,9.1,25,0,4.5,0,0,'Working settings',37),(1350925647597,8.15,9.1,25,0,4.5,0,0,'Working settings',38),(1350925648452,8.15,9.1,25,0,4.5,0,0,'Working settings',39),(1350933532686,8.15,9.1,1,0,4.5,0,0,'Automatic Update at  10/22/2012 1:18:52 PM',40),(1350933752122,0,0,1,0,0,0,0,'Automatic Update at  10/22/2012 1:22:32 PM',41),(1350934174094,8.15,9.1,1,0,4.5,0,0,'',42),(1350934177813,8.15,9.1,1,0,4.5,0,0,'Test',43),(1350934178720,8.15,9.1,1,0,4.5,0,0,'Test',44),(1350934196400,8.15,9.1,1,0,4.5,0,0,'Automatic Update at  10/22/2012 1:29:56 PM',45),(1350934454033,8.15,9.1,1,0,4.5,0,0,'Test',46),(1350934457404,8.15,9.1,1,0,4.5,0,0,'Test 1',47),(1350934458193,8.15,9.1,1,0,4.5,0,0,'Test 1',48),(1350943037411,8.15,9.1,40,0,4.5,0,0,'Anna\'s Settings',49),(1350943039587,8.15,9.1,40,0,4.5,0,0,'Automatic Update at  10/22/2012 3:57:19 PM',50),(1350943288917,0,0,5,3,0,0,0,'test of width',51),(1350943320142,0,0,4,2,0,0,0,'Automatic Update at  10/22/2012 4:02:00 PM',52),(1350943830592,8.15,9.1,40,3,4.5,0,0,'Automatic Update at  10/22/2012 4:10:30 PM',53),(1350944100628,1,1,1,0,1,0,0,'Automatic Update at  10/22/2012 4:15:00 PM',54),(1350945513905,8.15,9.1,40,3,4.5,0,0,'Automatic Update at  10/22/2012 4:38:33 PM',55),(1350945888770,8.15,9.1,40,3,4.5,0,0,'Automatic Update at  10/22/2012 4:44:48 PM',56),(1350945971457,0,0,1,0,0,0,0,'Automatic Update at  10/22/2012 4:46:11 PM',57),(1350946296582,8.15,9.1,40,3,4.5,0,0,'Automatic Update at  10/22/2012 4:51:36 PM',58),(1350946476490,8.15,9.1,40,3,4.5,0,0,'Automatic Update at  10/22/2012 4:54:36 PM',59),(1350946749716,0.99,0,1,0.1,0,0,0,'Automatic Update at  10/22/2012 4:59:09 PM',60),(1350946862058,8.15,9.1,40,3,4.5,0,0,'Automatic Update at  10/22/2012 5:01:02 PM',61),(1350947189916,8.15,9.1,40,3,4.5,0,0,'Automatic Update at  10/22/2012 5:06:29 PM',62),(1350947626886,8.15,9.1,40,3,4.5,0,0,'Automatic Update at  10/22/2012 5:13:46 PM',63),(1350947934382,8.15,9.1,40,3,4.5,0,0,'Automatic Update at  10/22/2012 5:18:54 PM',64),(1350948478348,8.15,9.1,40,3,4.5,0,0,'Automatic Update at  10/22/2012 5:27:58 PM',65),(1350949065331,8.15,9.1,40,3,4.5,2,1,'Automatic Update at  10/22/2012 5:37:45 PM',66),(1350949184585,0,0,1,0,1,1.5,2,'Automatic Update at  10/22/2012 5:39:44 PM',67),(1350949281818,0.2,0.3,1,0,0.4,0.5,1,'Automatic Update at  10/22/2012 5:41:21 PM',68),(1350949315320,0,0,1,0,0,1,2,'Automatic Update at  10/22/2012 5:41:55 PM',69),(1350949421097,0.2,0.3,1,0,0.4,0.5,0.6,'Automatic Update at  10/22/2012 5:43:41 PM',70),(1350949531651,3,2,1,0,4,2,4,'Automatic Update at  10/22/2012 5:45:31 PM',71),(1351011167332,8.13,9.1,25.01,3,4.5,0,0,'Anna\'s Settings (Updated with working Giraffes)',72),(1351011251192,8.13,9.1,25.01,3,4.5,0,0,'Anna\'s Settings (Updated with working Giraffes)',73),(1351018898704,8.11,9.1,15,3,4.5,0,0,'Automatic Update at  10/23/2012 1:01:38 PM',74),(1351021450740,0,0,1,0.1,0,0,0,'test',75),(1351021451682,0,0,1,0.1,0,0,0,'test',76),(1351021479146,0,0,1,0.1,0,0,0,'test 1',77),(1351021479882,0,0,1,0.1,0,0,0,'test 1',78),(1351021496594,0,0,1,0.1,0,0,0,'Automatic Update at  10/23/2012 1:44:56 PM',79),(1351021949256,0,0,1,0.1,0,0,0,'Automatic Update at  10/23/2012 1:52:29 PM',80),(1351022364186,0,0,1,0.1,0,0,0,'Automatic Update at  10/23/2012 1:59:24 PM',81),(1351023005626,0,0,1,0.1,0,0,0,'test 3',82),(1351023591944,0,0,3,5,0,0,0,'test 4',83),(1351023620040,0,0,3,5,0,0,0,'Automatic Update at  10/23/2012 2:20:20 PM',84),(1351036429860,8.13,9.1,15,3,4.5,4.5,4.5,'Automatic Update at  10/23/2012 5:53:49 PM',85),(1351115177389,8.15,9.1,1,3,4.5,4.5,4.5,'Anna\'s Settings',86),(1351115203533,8.15,9.1,1,3,4.5,4.5,4.5,'Anna\'s Settings1',87),(1351115236607,8.15,9.1,1,3,4.5,4.5,4.5,'test mctesty',88),(1351115237896,8.15,9.1,1,3,4.5,4.5,4.5,'test mctesty',89),(1351115264286,8.15,9.1,1,3,4.5,4.5,4.5,'Automatic Update at  10/24/2012 3:47:44 PM',90),(1351116770141,0,0,1,0.1,0,0,0,'Test\"',91),(1351116771829,0,0,1,0.1,0,0,0,'Test\"',92),(1351116796591,0,0,1,0.1,0,0,0,'this is a \"test\" setting',93),(1351116836295,0,0,1,0.1,0,0,0,'Automatic Update at  10/24/2012 4:13:56 PM',94),(1351117639042,0,0,1,0.1,0,0,0,'Automatic Update at  10/24/2012 4:27:19 PM',95),(1351119957773,0,0,1,0.1,0,0,0,'Automatic Update at  10/24/2012 5:05:57 PM',96),(1351120664189,8.13,9.1,15,3,4.5,4.5,4.5,'Test \'Test\' \"Test\" test test.',97),(1351120674885,8.13,9.1,15,3,4.5,4.5,4.5,'Automatic Update at  10/24/2012 5:17:54 PM',98),(1351199683732,8.13,9.1,20.04,3,4.5,4.5,4.5,'Automatic Update at  10/25/2012 3:14:43 PM',99),(1351200261131,0,0,1,0.1,0,0,0,'Automatic Update at  10/25/2012 3:24:21 PM',100);
/*!40000 ALTER TABLE `source_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_settings_small`
--

DROP TABLE IF EXISTS `source_settings_small`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_settings_small` (
  `integer_timestamp` bigint(20) NOT NULL,
  `needle_voltage` float DEFAULT NULL,
  `frequency` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `amplitude` float DEFAULT NULL,
  `settings_id` text,
  `id_source_settings` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`integer_timestamp`),
  KEY `id_source_settings` (`id_source_settings`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_settings_small`
--
-- WHERE:  1 limit 100

LOCK TABLES `source_settings_small` WRITE;
/*!40000 ALTER TABLE `source_settings_small` DISABLE KEYS */;
INSERT INTO `source_settings_small` VALUES (0,0,0,0,0,'0',1),(1402091978226,0,10,5,0,' (saved at  6/6/2014 3:59:38 PM)',2),(1402429012404,5,10,5,4,'DT: Mix-5-1Time: 6/10/2014 1:36:52 PM)',3),(1402433589324,7,10,5,10,'DT: Mix-5-1Time: 6/10/2014 2:53:09 PM)',4),(1402672689502,7,10,5,10,'DT: Iron-3-2Time: 6/13/2014 9:18:09 AM)',5),(1403647369521,4,10,5,10,'DT: Iron-3-2Time: 6/24/2014 4:02:49 PM)',6),(1403889589669,7,10,5,10,'DT: Iron-3-2Time: 6/27/2014 11:19:49 AM)',7),(1403890196120,7,10,5,10,'DT: Mix-6-1Time: 6/27/2014 11:29:56 AM)',8);
/*!40000 ALTER TABLE `source_settings_small` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-08 10:11:22
