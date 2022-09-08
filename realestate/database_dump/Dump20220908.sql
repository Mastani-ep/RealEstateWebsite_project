-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: www_project
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Agents');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,25),(2,1,26),(3,1,27),(4,1,28);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add agent',7,'add_agent'),(26,'Can change agent',7,'change_agent'),(27,'Can delete agent',7,'delete_agent'),(28,'Can view agent',7,'view_agent'),(29,'Can add property',8,'add_property'),(30,'Can change property',8,'change_property'),(31,'Can delete property',8,'delete_property'),(32,'Can view property',8,'view_property');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$IIcE8oZiEt0LLKQBSLCLR5$PliQcQTo9xWThLovykBK/x0v3QfPmYM2Ik+lQKrHrLk=','2022-09-08 15:10:42.706062',1,'edyta','','','eparuch@student.agh.edu.pl',1,1,'2022-08-13 18:24:55.995086'),(11,'pbkdf2_sha256$390000$bOxPBoWCzkbTImmXgj4AnH$DM6OHqoX+m8fxTlANImTiPvpp7/bhnQe5yamUvtLrls=',NULL,0,'Account1','Jan','Kowalski','eparuch@student.agh.edu.pl',0,1,'2022-09-07 20:58:13.000000'),(12,'pbkdf2_sha256$390000$jdK8ODaMHSiB1VZ55iuzFz$Ve6Jryh8qjDshSrL94bExiO2vmrVaWXbTHAxGLdMDqM=','2022-09-08 15:44:43.147648',0,'Agent-Adam','Adam','Nowak','edyta.paruch@onet.pl',0,1,'2022-09-07 21:00:47.000000'),(13,'pbkdf2_sha256$390000$qoQLeAlPUw2EQp7Oi55W5F$v83rROwJutddM/+5xS8bEo/WMDasq5LIZi67d+OXk5A=','2022-09-08 15:48:16.819916',0,'Account2','Zofia','Mak','eparuch@student.agh.edu.pl',0,1,'2022-09-07 21:12:26.000000'),(14,'pbkdf2_sha256$390000$lJTXWikMDGm7yXbzMCo1m6$Zu3mcefkUo7VQqlshfgpq+Wji3X8UVlqJwMk8BoX444=','2022-09-08 15:14:12.142982',0,'Agent-Anna','Anna','Słowik','edyta.paruch@onet.pl',0,1,'2022-09-07 21:17:04.000000'),(16,'pbkdf2_sha256$390000$6NyHo77h2vO9iJ1DkiEPDl$ZIP/RCGa8oAmI3vSvPziOww/SoXPbiON5LfXgd630vw=',NULL,0,'e','A','B','test@test.com',0,1,'2022-09-08 00:11:08.253929'),(17,'pbkdf2_sha256$390000$AqOIkwWFFXYMGpXjCN7YIz$0am5Iv49Wmyfdnub0MEG5R01WOPcIVhQnZ3NimJdxis=',NULL,0,'kontotestowe','konto','konto','test@test.com',0,1,'2022-09-08 00:15:28.139472'),(18,'pbkdf2_sha256$390000$UTfcHpJKJqKMFHo5iL58Ts$sBJUZ8hKARC5g7BS4ArvAuurrTKc10SmvopAY5KB3H4=',NULL,0,'test','test_imie','test_nazwisko','test@test.com',0,1,'2022-09-08 00:17:00.476637'),(19,'pbkdf2_sha256$390000$gmz0tY4qoPydXBCABz35OJ$Vz1YM0DwYsVVMaGm6LyAwePhZTuLhGUL2m8m+ewA6Oo=',NULL,0,'test2','test_imie','test_nazwisko','test@test.com',0,1,'2022-09-08 00:19:36.442354'),(20,'pbkdf2_sha256$390000$3HY1cSTdqYgHJRrgO5CjRc$I1gPWzeRIHtthOTZk0JijdJU0RGEMSGGTKVrk+HHU6M=',NULL,0,'test3','test_imie','test_nazwisko','test@test.com',0,1,'2022-09-08 00:20:31.590797');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (4,12,1),(5,14,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-08-13 23:38:34.424443','2','morzejednakenie',3,'',4,1),(2,'2022-08-18 22:00:22.086956','1','test',1,'[{\"added\": {}}]',7,1),(3,'2022-08-18 22:02:39.569774','1','test property',1,'[{\"added\": {}}]',8,1),(4,'2022-08-21 18:22:16.065583','2','Kraków, Podgórze',1,'[{\"added\": {}}]',8,1),(5,'2022-09-04 19:49:03.688949','3','nowekonto',3,'',4,1),(6,'2022-09-04 19:49:32.803962','4','test',1,'[{\"added\": {}}]',4,1),(7,'2022-09-04 20:25:21.627127','4','test',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(8,'2022-09-04 20:25:21.633127','4','test',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(9,'2022-09-05 01:25:44.894826','4','1',3,'',8,1),(10,'2022-09-05 01:25:49.363463','3','1',3,'',8,1),(11,'2022-09-05 17:08:09.062034','6','Nowa oferta wooow!!!',2,'[{\"changed\": {\"fields\": [\"Agent\", \"Is published\"]}}]',8,1),(12,'2022-09-06 18:36:09.277428','1','Agents',1,'[{\"added\": {}}]',3,1),(13,'2022-09-06 18:36:43.753981','5','Testowy_agent',1,'[{\"added\": {}}]',4,1),(14,'2022-09-06 18:37:21.183145','5','Testowy_agent',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(16,'2022-09-06 19:04:49.697746','1','test',3,'',7,1),(17,'2022-09-06 20:17:35.656206','3','123456789',1,'[{\"added\": {}}]',7,1),(18,'2022-09-06 20:19:33.810708','1','Agents',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(19,'2022-09-06 21:22:39.170130','5','Testowy_agent',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(20,'2022-09-06 21:31:15.600861','1','test property',2,'[{\"changed\": {\"fields\": [\"Agent\"]}}]',8,1),(21,'2022-09-06 21:31:20.991197','2','Kraków, Podgórze',2,'[{\"changed\": {\"fields\": [\"Agent\"]}}]',8,1),(22,'2022-09-06 21:31:29.679545','6','Nowa oferta wooow!!!',2,'[{\"changed\": {\"fields\": [\"Agent\"]}}]',8,1),(23,'2022-09-06 21:31:33.745386','5','test',2,'[{\"changed\": {\"fields\": [\"Agent\"]}}]',8,1),(24,'2022-09-06 21:32:15.218576','5','Testowy_agent',2,'[]',4,1),(25,'2022-09-06 22:02:53.215874','3','Testowy_agent',3,'',7,1),(26,'2022-09-06 22:03:04.191704','5','Testowy_agent',3,'',4,1),(27,'2022-09-06 22:03:59.779808','8','Agent',1,'[{\"added\": {}}]',4,1),(28,'2022-09-06 22:04:21.884636','8','Agent',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(29,'2022-09-06 22:04:24.909722','4','Agent',1,'[{\"added\": {}}]',7,1),(30,'2022-09-06 22:25:53.400164','2','Kraków, Podgórze',2,'[{\"changed\": {\"fields\": [\"Agent\"]}}]',8,1),(31,'2022-09-06 22:25:57.923178','1','test property',2,'[{\"changed\": {\"fields\": [\"Agent\"]}}]',8,1),(32,'2022-09-06 23:31:38.639929','6','Nowa oferta wooow!!!',2,'[{\"changed\": {\"fields\": [\"Agent\"]}}]',8,1),(33,'2022-09-06 23:31:49.897528','5','test',2,'[{\"changed\": {\"fields\": [\"Agent\"]}}]',8,1),(34,'2022-09-06 23:35:47.462354','7','Ważna oferta nie usuwać',1,'[{\"added\": {}}]',8,1),(35,'2022-09-07 00:57:44.604773','7','Ważna oferta nie usuwać',2,'[{\"changed\": {\"fields\": [\"Is published\"]}}]',8,1),(36,'2022-09-07 16:12:42.696597','9','PrawdziwyAgent',1,'[{\"added\": {}}]',4,1),(37,'2022-09-07 16:12:53.637808','5','PrawdziwyAgent',1,'[{\"added\": {}}]',7,1),(38,'2022-09-07 16:13:56.166022','10','EdytaOwner',1,'[{\"added\": {}}]',4,1),(39,'2022-09-07 16:14:38.693128','8','Sprawdzamy wysyłanie maili',1,'[{\"added\": {}}]',8,1),(40,'2022-09-07 16:15:16.623102','9','PrawdziwyAgent',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(41,'2022-09-07 16:15:31.882369','10','EdytaOwner',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(42,'2022-09-07 18:23:44.937935','8','Sprawdzamy wysyłanie maili',2,'[{\"changed\": {\"fields\": [\"Is published\"]}}]',8,1),(43,'2022-09-07 20:57:06.915273','9','PrawdziwyAgent',3,'',4,1),(44,'2022-09-07 20:57:06.921285','4','test',3,'',4,1),(45,'2022-09-07 20:57:06.923364','6','test_2',3,'',4,1),(46,'2022-09-07 20:57:06.925283','7','test_3',3,'',4,1),(47,'2022-09-07 20:57:14.645097','8','Agent',3,'',4,1),(48,'2022-09-07 20:57:14.647160','10','EdytaOwner',3,'',4,1),(49,'2022-09-07 20:58:13.291675','11','Account1',1,'[{\"added\": {}}]',4,1),(50,'2022-09-07 21:00:48.005123','12','Agent-Adam',1,'[{\"added\": {}}]',4,1),(51,'2022-09-07 21:01:51.453175','6','Agent-Adam',1,'[{\"added\": {}}]',7,1),(52,'2022-09-07 21:10:39.422090','9','Apartment for rent, Cracow',1,'[{\"added\": {}}]',8,1),(53,'2022-09-07 21:10:51.202758','9','Apartment for rent, Cracow',2,'[]',8,1),(54,'2022-09-07 21:12:26.634828','13','Account2',1,'[{\"added\": {}}]',4,1),(55,'2022-09-07 21:14:20.886772','10','House for sale, Wieliczka',1,'[{\"added\": {}}]',8,1),(56,'2022-09-07 21:17:04.959472','14','Agent-Anna',1,'[{\"added\": {}}]',4,1),(57,'2022-09-07 21:17:15.484549','7','Agent-Anna',1,'[{\"added\": {}}]',7,1),(58,'2022-09-07 21:22:35.987550','11','Apartment for sale, Cracow, Mistrzejowice',1,'[{\"added\": {}}]',8,1),(59,'2022-09-07 21:27:49.368074','12','Apartment for rent, Cracow',1,'[{\"added\": {}}]',8,1),(60,'2022-09-07 21:28:26.887089','12','Agent-Adam',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(61,'2022-09-07 21:28:56.197130','14','Agent-Anna',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',4,1),(62,'2022-09-07 21:29:24.909256','11','Account1',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(63,'2022-09-07 21:29:39.449164','13','Account2',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(64,'2022-09-07 23:50:18.554422','15','konto',3,'',4,1),(65,'2022-09-08 01:07:48.995204','14','test2',3,'',8,1),(66,'2022-09-08 01:07:49.000203','13','testowa oferta',3,'',8,1),(67,'2022-09-08 06:07:48.979594','16','test',2,'[{\"changed\": {\"fields\": [\"Agent\"]}}]',8,1),(68,'2022-09-08 06:24:28.798676','16','test',2,'[{\"changed\": {\"fields\": [\"Is published\"]}}]',8,1),(69,'2022-09-08 07:18:37.666237','18','2',3,'',8,1),(70,'2022-09-08 15:10:56.949838','19','Testowa oferta edytowana',2,'[{\"changed\": {\"fields\": [\"Agent\"]}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'estatesite','agent'),(8,'estatesite','property'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-08-11 22:02:13.277326'),(2,'auth','0001_initial','2022-08-11 22:02:13.778324'),(3,'admin','0001_initial','2022-08-11 22:02:13.908331'),(4,'admin','0002_logentry_remove_auto_add','2022-08-11 22:02:13.922324'),(5,'admin','0003_logentry_add_action_flag_choices','2022-08-11 22:02:13.936324'),(6,'contenttypes','0002_remove_content_type_name','2022-08-11 22:02:14.025323'),(7,'auth','0002_alter_permission_name_max_length','2022-08-11 22:02:14.085331'),(8,'auth','0003_alter_user_email_max_length','2022-08-11 22:02:14.133325'),(9,'auth','0004_alter_user_username_opts','2022-08-11 22:02:14.148328'),(10,'auth','0005_alter_user_last_login_null','2022-08-11 22:02:14.208324'),(11,'auth','0006_require_contenttypes_0002','2022-08-11 22:02:14.212331'),(12,'auth','0007_alter_validators_add_error_messages','2022-08-11 22:02:14.227344'),(13,'auth','0008_alter_user_username_max_length','2022-08-11 22:02:14.297327'),(14,'auth','0009_alter_user_last_name_max_length','2022-08-11 22:02:14.360324'),(15,'auth','0010_alter_group_name_max_length','2022-08-11 22:02:14.391324'),(16,'auth','0011_update_proxy_permissions','2022-08-11 22:02:14.409324'),(17,'auth','0012_alter_user_first_name_max_length','2022-08-11 22:02:14.473324'),(18,'sessions','0001_initial','2022-08-11 22:02:14.515325'),(19,'estatesite','0001_initial','2022-08-18 19:35:19.470979'),(20,'estatesite','0002_property_agent_property_date','2022-08-18 20:57:45.483523'),(21,'estatesite','0003_property_description','2022-08-18 21:41:33.487102'),(22,'estatesite','0004_remove_property_photo_7_remove_property_photo_8','2022-08-21 18:17:53.926477'),(23,'estatesite','0002_property_user','2022-08-24 20:56:45.407489'),(24,'estatesite','0003_alter_property_user','2022-08-24 20:59:57.881138'),(25,'estatesite','0004_alter_property_is_published','2022-09-04 19:52:40.176701'),(26,'estatesite','0005_alter_property_agent_alter_property_transaction_and_more','2022-09-05 01:21:05.915835'),(27,'estatesite','0006_alter_property_user','2022-09-05 01:26:01.064627'),(28,'estatesite','0007_agent_user_alter_property_agent','2022-09-06 19:11:23.780401'),(29,'estatesite','0008_remove_agent_email_remove_agent_name_and_more','2022-09-06 20:16:41.673109'),(30,'estatesite','0009_alter_property_photo_1_alter_property_photo_2_and_more','2022-09-07 21:04:20.737099'),(31,'estatesite','0010_alter_property_photo_1_alter_property_photo_2_and_more','2022-09-07 21:06:35.404418'),(32,'estatesite','0011_alter_property_photo_1_alter_property_photo_2_and_more','2022-09-07 21:10:28.910921');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('kmqridlutq9823je1f99oqcu153be3vf','.eJxVjEEOwiAQRe_C2hBgoFNcuvcMZGAGWzVtUtqV8e7apAvd_vfef6lE2zqkrcmSRlZnZUGdfsdM5SHTTvhO023WZZ7WZcx6V_RBm77OLM_L4f4dDNSGb10shmIMGIwZkcH62mWHlgQjB2_IQxV2vatd9Bn6QGKkBAxOGCBa9f4A7I83dQ:1oWJlI:fM7bPrqCu8VMR6NyZuZUTGOm1Xb6TS1Fw0SVFvCR7Q4','2022-09-22 15:48:16.823094');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatesite_agent`
--

DROP TABLE IF EXISTS `estatesite_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estatesite_agent` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone` varchar(12) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estatesite_agent_user_id_912ed10c_uniq` (`user_id`),
  CONSTRAINT `estatesite_agent_user_id_912ed10c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatesite_agent`
--

LOCK TABLES `estatesite_agent` WRITE;
/*!40000 ALTER TABLE `estatesite_agent` DISABLE KEYS */;
INSERT INTO `estatesite_agent` VALUES (6,'509123876','photo/2022/09/07/Adam.jpg',12),(7,'478935768','photo/2022/09/07/Anna.jpg',14);
/*!40000 ALTER TABLE `estatesite_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatesite_property`
--

DROP TABLE IF EXISTS `estatesite_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estatesite_property` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `transaction` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `address` varchar(200) NOT NULL,
  `price` int NOT NULL,
  `size` int NOT NULL,
  `rooms` int NOT NULL,
  `bathrooms` int NOT NULL,
  `garage` int NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `photo_1` varchar(100) NOT NULL,
  `photo_2` varchar(100) NOT NULL,
  `photo_3` varchar(100) NOT NULL,
  `photo_4` varchar(100) NOT NULL,
  `photo_5` varchar(100) NOT NULL,
  `photo_6` varchar(100) NOT NULL,
  `agent_id` bigint DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estatesite_property_agent_id_f7761f7c_fk_estatesite_agent_id` (`agent_id`),
  KEY `estatesite_property_user_id_a6b7ed4d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `estatesite_property_agent_id_f7761f7c_fk_estatesite_agent_id` FOREIGN KEY (`agent_id`) REFERENCES `estatesite_agent` (`id`),
  CONSTRAINT `estatesite_property_user_id_a6b7ed4d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatesite_property`
--

LOCK TABLES `estatesite_property` WRITE;
/*!40000 ALTER TABLE `estatesite_property` DISABLE KEYS */;
INSERT INTO `estatesite_property` VALUES (9,'Apartment for rent, Cracow','rental','apartment','Kraków,  ul. Rakowicka 20',2500,55,2,1,0,1,'photo/2022/09/07/furniture-998265_1280.jpg','photo/2022/09/07/bedroom_mzWtaBe.jpg','photo/2022/09/07/bathroom-2094733_1280.jpg','photo/2022/09/07/kitchen_WUKvdWS.jpg','','','',6,'2022-09-07 22:57:21.000000','Wygodne mieszkanie w centrum Krakowa',11),(10,'House for sale, Wieliczka','sale','house','Wieliczka, ul. Sadowa 10',890000,150,3,2,1,1,'photo/2022/09/07/house1_ko1pm5I.jpg','photo/2022/09/07/bathroom_KLVW33l.jpg','photo/2022/09/07/kitchen_1xhRgYi.jpg','photo/2022/09/07/bedroom-5772286_1280.jpg','photo/2022/09/07/bedroom2.jfif','photo/2022/09/07/garden_ildzFKP.jpeg','photo/2022/09/07/living_room_vzNz71F.jpg',6,'2022-09-07 23:10:55.000000','Dom na sprzedaż w Wieliczce koło Krakowa',13),(11,'Apartment for sale','sale','apartment','Kraków, Mistrzejowice ul. Korony Polskiej 2',500000,50,2,1,0,1,'photo/2022/09/07/living-room-1835923_1280.jpg','photo/2022/09/07/bedroom_2VQ6SnH.jpg','photo/2022/09/07/kitchen-2165756_1280.jpg','photo/2022/09/07/bathroom-2094733_1280_6yowz3j.jpg','','','',7,'2022-09-07 23:14:46.000000','Dwupokojowe mieszkanie po remoncie, w pełni wyposażone, z piwnicą o powierzchni 4,5 m2. Znajduje się w cichej i spokojnej okolicy.',13),(12,'Apartment for rent, Cracow','rental','apartment','Kraków, Krowodrza, ul. Chocimska 4/19',1700,40,2,1,0,1,'photo/2022/09/07/chairs-2181968_1280.jpg','photo/2022/09/07/kitchen-2165756_1280_yhFUXgf.jpg','photo/2022/09/07/bathroom-2094733_1280_XyGm3IU.jpg','photo/2022/09/07/bed-1834327_1280.jpg','','','',7,'2022-09-07 23:22:42.000000','Mieszkanie na wynajem dla studentów AGH. Z opłatami za media cena to 2200zł.',11),(20,'Pokazowa oferta','sale','apartment','pokazowy adres',200000,50,2,1,0,0,'photo/2022/09/08/bedroom.jpg','photo/2022/09/08/chairs-2181968_1280_FqTyy24.jpg','','','','','',NULL,'2022-09-08 17:42:37.642859','Pokazowy opis',13);
/*!40000 ALTER TABLE `estatesite_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'www_project'
--

--
-- Dumping routines for database 'www_project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-08 18:06:49
