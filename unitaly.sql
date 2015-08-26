-- MySQL dump 10.13  Distrib 5.6.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: unitaly
-- ------------------------------------------------------
-- Server version	5.6.24-0ubuntu2

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
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('superadmin','1',1433495096);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('accessBackend',2,'Can access backend',NULL,NULL,1433495094,1433495094),('admin',1,'Admin',NULL,NULL,1433495096,1433495096),('administrateDirectories',2,'Can administrate all \"Directories\" module',NULL,NULL,1433495098,1433500856),('administrateRbac',2,'Can administrate all \"RBAC\" module',NULL,NULL,1433495094,1433495094),('administrateUsers',2,'Can administrate all \"Users\" module',NULL,NULL,1433495096,1433495096),('BCreatePermissions',2,'Can create permissions',NULL,NULL,1433495095,1433495095),('BCreateRestaurant',2,'Can delete backend tour types',NULL,NULL,1433500857,1433500857),('BCreateRoles',2,'Can create roles',NULL,NULL,1433495095,1433495095),('BCreateRules',2,'Can create rules',NULL,NULL,1433495095,1433495095),('BCreateShowplace',2,'Can create backend showplaces',NULL,NULL,1433495098,1433500856),('BCreateShowplaceType',2,'Can create backend showplace types',NULL,NULL,1433495098,1433500856),('BCreateTourType',2,'Can create backend tour types',NULL,NULL,1433495099,1433500856),('BCreateUsers',2,'Can create backend users',NULL,NULL,1433495097,1433495097),('BDeletePermissions',2,'Can delete permissions',NULL,NULL,1433495095,1433495095),('BDeleteRestaurant',2,'Can delete backend tour types',NULL,NULL,1433500857,1433500857),('BDeleteRoles',2,'Can delete roles',NULL,NULL,1433495095,1433495095),('BDeleteRules',2,'Can delete rules',NULL,NULL,1433495095,1433495095),('BDeleteShowplace',2,'Can delete backend showplaces',NULL,NULL,1433495098,1433500856),('BDeleteShowplaceType',2,'Can delete backend showplace types',NULL,NULL,1433495099,1433500856),('BDeleteTourType',2,'Can delete backend tour types',NULL,NULL,1433495099,1433500856),('BDeleteUsers',2,'Can delete backend users',NULL,NULL,1433495097,1433495097),('BUpdatePermissions',2,'Can update permissions',NULL,NULL,1433495095,1433495095),('BUpdateRestaurant',2,'Can delete backend tour types',NULL,NULL,1433500857,1433500857),('BUpdateRoles',2,'Can update roles',NULL,NULL,1433495095,1433495095),('BUpdateRules',2,'Can update rules',NULL,NULL,1433495095,1433495095),('BUpdateShowplace',2,'Can update backend showplaces',NULL,NULL,1433495098,1433500856),('BUpdateShowplaceType',2,'Can update backend showplace types',NULL,NULL,1433495099,1433500856),('BUpdateTourType',2,'Can update backend tour types',NULL,NULL,1433495099,1433500856),('BUpdateUsers',2,'Can update backend users',NULL,NULL,1433495097,1433495097),('BViewPermissions',2,'Can view permissions list',NULL,NULL,1433495095,1433495095),('BViewRestaurant',2,'Can delete backend tour types',NULL,NULL,1433500856,1433500856),('BViewRoles',2,'Can view roles list',NULL,NULL,1433495095,1433495095),('BViewRules',2,'Can view rules list',NULL,NULL,1433495095,1433495095),('BViewShowplace',2,'Can view backend showplaces list',NULL,NULL,1433495098,1433500856),('BViewShowplaceType',2,'Can view backend showplace types list',NULL,NULL,1433495098,1433500856),('BViewTourType',2,'Can view backend tour types list',NULL,NULL,1433495099,1433500856),('BViewUsers',2,'Can view backend users list',NULL,NULL,1433495096,1433495096),('createUsers',2,'Can create users',NULL,NULL,1433495097,1433495097),('deleteOwnUsers',2,'Can delete own user profile','author',NULL,1433495097,1433495097),('deleteUsers',2,'Can delete users',NULL,NULL,1433495097,1433495097),('superadmin',1,'Super admin',NULL,NULL,1433495096,1433495096),('updateOwnUsers',2,'Can update own user profile','author',NULL,1433495097,1433495097),('updateUsers',2,'Can update users',NULL,NULL,1433495097,1433495097),('user',1,'User',NULL,NULL,1433495096,1433495096),('viewUsers',2,'Can view users list',NULL,NULL,1433495097,1433495097);
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('superadmin','accessBackend'),('superadmin','admin'),('superadmin','administrateDirectories'),('superadmin','administrateRbac'),('superadmin','administrateUsers'),('administrateRbac','BCreatePermissions'),('administrateDirectories','BCreateRestaurant'),('administrateRbac','BCreateRoles'),('administrateRbac','BCreateRules'),('administrateDirectories','BCreateShowplace'),('administrateDirectories','BCreateShowplaceType'),('administrateDirectories','BCreateTourType'),('administrateUsers','BCreateUsers'),('administrateRbac','BDeletePermissions'),('administrateDirectories','BDeleteRestaurant'),('administrateRbac','BDeleteRoles'),('administrateRbac','BDeleteRules'),('administrateDirectories','BDeleteShowplace'),('administrateDirectories','BDeleteShowplaceType'),('administrateDirectories','BDeleteTourType'),('administrateUsers','BDeleteUsers'),('administrateRbac','BUpdatePermissions'),('administrateDirectories','BUpdateRestaurant'),('administrateRbac','BUpdateRoles'),('administrateRbac','BUpdateRules'),('administrateDirectories','BUpdateShowplace'),('administrateDirectories','BUpdateShowplaceType'),('administrateDirectories','BUpdateTourType'),('administrateUsers','BUpdateUsers'),('administrateRbac','BViewPermissions'),('administrateDirectories','BViewRestaurant'),('administrateRbac','BViewRoles'),('administrateRbac','BViewRules'),('administrateDirectories','BViewShowplace'),('administrateDirectories','BViewShowplaceType'),('administrateDirectories','BViewTourType'),('administrateUsers','BViewUsers'),('administrateUsers','createUsers'),('administrateUsers','deleteOwnUsers'),('deleteUsers','deleteOwnUsers'),('administrateUsers','deleteUsers'),('administrateUsers','updateOwnUsers'),('updateUsers','updateOwnUsers'),('administrateUsers','updateUsers'),('admin','user'),('administrateUsers','viewUsers');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
INSERT INTO `auth_rule` VALUES ('author','O:28:\"vova07\\rbac\\rules\\AuthorRule\":3:{s:4:\"name\";s:6:\"author\";s:9:\"createdAt\";i:1433495094;s:9:\"updatedAt\";i:1433495094;}',1433495094,1433495094);
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `snippet` text NOT NULL,
  `content` longtext NOT NULL,
  `image_url` varchar(64) NOT NULL,
  `preview_url` varchar(64) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `status_id` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  KEY `views` (`views`),
  KEY `created_at` (`created_at`),
  KEY `updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(20) NOT NULL COMMENT 'идентификатор',
  `name` varchar(50) NOT NULL COMMENT 'наименование города',
  `spellings` text NOT NULL COMMENT 'дополнительные варианты написания',
  `region_id` int(11) NOT NULL COMMENT 'региональная принадлежность',
  `visit_image_id` int(11) DEFAULT NULL COMMENT 'визитка города',
  `arms_image_id` int(11) DEFAULT NULL COMMENT 'герб города',
  `description` text NOT NULL COMMENT 'описание',
  `latitude` varchar(255) DEFAULT NULL COMMENT 'широта',
  `longitude` varchar(255) DEFAULT NULL COMMENT 'долгота',
  `hub_id` int(11) DEFAULT NULL COMMENT 'идентификатор',
  `history` text COMMENT 'краткая история города',
  PRIMARY KEY (`id`),
  KEY `fk_city_region_id_region_id` (`region_id`),
  KEY `fk_city_visit_image_id_image_id` (`visit_image_id`),
  KEY `fk_city_arms_image_id_image_id` (`arms_image_id`),
  KEY `fk_city_hub_id_hub_id` (`hub_id`),
  CONSTRAINT `fk_city_arms_image_id_image_id` FOREIGN KEY (`arms_image_id`) REFERENCES `image` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_city_hub_id_hub_id` FOREIGN KEY (`hub_id`) REFERENCES `hub` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_city_region_id_region_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_city_visit_image_id_image_id` FOREIGN KEY (`visit_image_id`) REFERENCES `image` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `model_class` int(11) unsigned NOT NULL,
  `model_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `status_id` tinyint(2) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  KEY `created_at` (`created_at`),
  KEY `updated_at` (`updated_at`),
  KEY `FK_comment_parent` (`parent_id`),
  KEY `FK_comment_author` (`author_id`),
  KEY `FK_comment_model_class` (`model_class`),
  CONSTRAINT `FK_comment_author` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_comment_model_class` FOREIGN KEY (`model_class`) REFERENCES `comments_models` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_comment_parent` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_models`
--

DROP TABLE IF EXISTS `comments_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments_models` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `status_id` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `status_id` (`status_id`),
  KEY `created_at` (`created_at`),
  KEY `updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_models`
--

LOCK TABLES `comments_models` WRITE;
/*!40000 ALTER TABLE `comments_models` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'наименование',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hub`
--

DROP TABLE IF EXISTS `hub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'наименование',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hub`
--

LOCK TABLES `hub` WRITE;
/*!40000 ALTER TABLE `hub` DISABLE KEYS */;
/*!40000 ALTER TABLE `hub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ext` varchar(4) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'jpg',NULL,1433421700,NULL),(2,'jpg',NULL,1433421947,NULL),(3,'jpg',NULL,1433429573,NULL),(4,'jpg',NULL,1433429605,NULL),(5,'jpg',NULL,1433429626,NULL),(6,'jpg',NULL,1433429890,NULL),(7,'jpg',NULL,1433430176,NULL),(8,'jpg',NULL,1433477632,NULL),(9,'jpg',NULL,1433484987,NULL),(10,'jpg',NULL,1433485206,NULL),(11,'jpg',NULL,1433485381,NULL),(12,'jpg',NULL,1433493623,NULL),(13,'jpg',NULL,1433493760,NULL),(14,'jpg',NULL,1433502961,NULL),(15,'jpg',NULL,1433503124,NULL),(16,'jpg',NULL,1433503932,NULL),(17,'jpg',NULL,1433504027,NULL),(18,'jpg',NULL,1433504605,NULL),(19,'jpg',NULL,1433504683,NULL),(20,'jpg',NULL,1433504711,NULL),(21,'jpg',NULL,1433505468,NULL),(22,'jpg',NULL,1433505883,NULL),(23,'jpg',NULL,1433506121,NULL),(24,'jpg',NULL,1433506182,NULL),(25,'jpg',NULL,1433506329,NULL),(26,'jpg',NULL,1433506472,NULL),(27,'jpg',NULL,1433506529,NULL),(28,'jpg',NULL,1433506766,NULL),(29,'jpg',NULL,1433506769,NULL),(30,'jpg',NULL,1433506931,NULL);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lang`
--

DROP TABLE IF EXISTS `lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(5) NOT NULL,
  `local` varchar(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lang`
--

LOCK TABLES `lang` WRITE;
/*!40000 ALTER TABLE `lang` DISABLE KEYS */;
INSERT INTO `lang` VALUES (1,'en','en-US','English',0,0,0),(2,'ru','ru-RU','Russian',1,0,0),(3,'it','it-It','Italian',0,0,0);
/*!40000 ALTER TABLE `lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_message_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `translation` text,
  PRIMARY KEY (`id`),
  KEY `message_source_message_id__source_message_id` (`source_message_id`),
  KEY `message_lang_id__lang_id` (`lang_id`),
  CONSTRAINT `message_lang_id__lang_id` FOREIGN KEY (`lang_id`) REFERENCES `lang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_source_message_id__source_message_id` FOREIGN KEY (`source_message_id`) REFERENCES `source_message` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,2,1,'All Rights Reserved'),(2,3,1,'Blogs'),(3,4,1,'Change email'),(4,5,1,'Change password'),(5,6,1,'Contacts'),(6,7,1,'Edit profile'),(7,8,1,'GO BACK TO THE HOMEPAGE'),(8,9,1,'Settings'),(9,10,1,'Sign In'),(10,11,1,'Sign Out'),(11,12,1,'Sign Up'),(12,13,1,'Toggle navigation'),(13,14,1,'Backend'),(14,15,1,'Access control'),(15,16,1,'Blogs'),(16,17,1,'Comments'),(17,18,1,'Dashboard'),(18,19,1,'Hello, {name}'),(19,20,1,'Home'),(20,21,1,'Member since'),(21,22,1,'Models management'),(22,23,1,'Online'),(23,24,1,'Permissions'),(24,25,1,'Profile'),(25,26,1,'Roles'),(26,27,1,'Rules'),(27,28,1,'Sign out'),(28,29,1,'Toggle navigation'),(29,30,1,'Users'),(30,31,1,'Directories'),(31,32,1,'Restaurants'),(32,33,1,'Go to site'),(33,2,2,'Все права защищены'),(34,3,2,'Блоги'),(35,4,2,'Сменить e-mail'),(36,5,2,'Сменить пароль'),(37,6,2,'Контакты'),(38,7,2,'Редактировать профиль'),(39,8,2,'ВЕРНУТЬСЯ ОБРАТНО НА ГЛАВНУЮ СТРАНИЦУ'),(40,9,2,'Настройки'),(41,10,2,'Авторизация'),(42,11,2,'Выйти'),(43,12,2,'Регистрация'),(44,13,2,'Показать/Скрыть меню'),(45,14,2,'Админка'),(46,34,2,'Обратная связь'),(47,15,2,'Управление доступом'),(48,16,2,'Блоги'),(49,17,2,'Комментарии'),(50,18,2,'Панель управления'),(51,19,2,'Здравствуйте, {name}'),(52,20,2,'Главная'),(53,21,2,'Зарегестрирован с'),(54,22,2,'Управления моделями'),(55,23,2,'Онлайн'),(56,24,2,'Права'),(57,25,2,'Профиль'),(58,26,2,'Роли'),(59,27,2,'Правила'),(60,28,2,'Выход'),(61,29,2,'Показать/Скрыть меню'),(62,30,2,'Пользователи'),(63,35,2,'Feedback'),(64,36,2,'FAQ'),(65,37,2,'Статичные страницы'),(66,38,2,'Языки'),(67,39,2,'Переводы'),(68,31,2,'Справочники'),(69,32,2,'Рестораны'),(70,40,2,'Достопримечательности'),(71,41,2,'Типы достопримечательностей'),(72,33,2,'Перейти на сайт'),(73,42,2,'ID достопримечательности'),(74,43,2,'Название достопримечательности'),(75,44,2,'Организация-провайдер услуг'),(76,45,2,'Тип достопримечательности'),(77,46,2,'Местонахождение достопримечательности, регион'),(78,47,2,'Местонахождение достопримечательности, город'),(79,48,2,'Местонахождение достопримечательности, адрес'),(80,49,2,'Основное изображение достопримечательности'),(81,50,2,'Дополнительное изображение достопримечательности'),(82,51,2,'Координаты достопримечательности на карте'),(83,52,2,'Широта'),(84,53,2,'Долгота'),(85,54,2,'Краткое описание достопримечательности'),(86,55,2,'Подробное описание достопримечательности'),(87,56,2,'Имя представителя достопримечательности'),(88,57,2,'Телефон представителя достопримечательности'),(89,58,2,'Email представителя достопримечательности'),(90,59,2,'Сайт достопримечательности'),(91,60,2,'Акк Facebook'),(92,61,2,'Акк Instagram'),(93,62,2,'Цена посещения'),(94,63,2,'Для взрослого'),(95,64,2,'Для ребёнка'),(96,65,2,'Расписание работы'),(97,66,2,'Наличие экскурсии по достопримечательности'),(98,67,2,'Стоимость экскурсии'),(99,68,2,'В группе с гидом'),(100,69,2,'Индивидуальная с гидом'),(101,70,2,'Аудио гид'),(102,71,2,'Дополнительные товары и услуги, доступные при посещении'),(103,72,2,'Название достопримечательности'),(104,73,2,'Достопримечательности'),(105,74,2,'Список'),(106,75,2,'Достопримечательности'),(107,76,2,'Создание'),(108,77,2,'Достопримечательности'),(109,78,2,'Редактирование'),(110,79,2,'Добавить'),(111,80,2,'Сохранить'),(112,81,2,'ID типа достопримечательности'),(113,82,2,'Название типа достопримечательнсоти'),(114,83,2,'Описание типа достопримечательности'),(115,84,2,'Изображение типа достопримечательности'),(116,85,2,'Типы достопримечательностей'),(117,86,2,'Список'),(118,87,2,'Типы достопримечательностей'),(119,88,2,'Создание'),(120,89,2,'Типы достопримечательностей'),(121,90,2,'Редактирование'),(122,91,2,'Добавить'),(123,92,2,'Сохранить'),(124,93,2,'ID ресторана'),(125,94,2,'Название достопримечательности'),(126,95,2,'Местонахождение ресторана, регион'),(127,96,2,'Местонахождение ресторана, город'),(128,97,2,'Местонахождение ресторана, адрес'),(129,98,2,'Основное изображение ресторана'),(130,99,2,'Дополнительное изображение ресторана'),(131,100,2,'Координаты ресторана на карте'),(132,101,2,'Широта'),(133,102,2,'Долгота'),(134,103,2,'Краткое описание ресторана'),(135,104,2,'Подробное описание ресторана'),(136,105,2,'Имя представителя ресторана'),(137,106,2,'Телефон представителя ресторана'),(138,107,2,'Email представителя ресторана'),(139,108,2,'Сайт ресторана'),(140,109,2,'Акк Facebook'),(141,110,2,'Акк Instagram'),(142,111,2,'Цена посещения'),(143,112,2,'Для взрослого'),(144,113,2,'Для ребёнка'),(145,114,2,'Расписание работы'),(146,115,2,'Наличие экскурсии по достопримечательности'),(147,116,2,'Стоимость экскурсии'),(148,117,2,'В группе с гидом'),(149,118,2,'Индивидуальная с гидом'),(150,119,2,'Аудио гид'),(151,120,2,'Дополнительные товары и услуги, доступные при посещении'),(152,121,2,'Название ресторана'),(153,1,2,'Рестораны'),(154,122,2,'Список'),(155,123,2,'Рестораны'),(156,124,2,'Создание'),(157,125,2,'Рестораны'),(158,126,2,'Редактирование'),(159,127,2,'Добавить'),(160,128,2,'Сохранить'),(161,129,2,'ID ресторана'),(162,130,2,'ergerg'),(163,131,2,'Изображение'),(164,132,2,'Вывод ресторана на фронт-енд');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_category`
--

DROP TABLE IF EXISTS `message_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_category`
--

LOCK TABLES `message_category` WRITE;
/*!40000 ALTER TABLE `message_category` DISABLE KEYS */;
INSERT INTO `message_category` VALUES (1,'restaurant'),(2,'themes-site'),(3,'themes-admin'),(4,'showplace'),(5,'showplace-type');
/*!40000 ALTER TABLE `message_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1433164069),('m140418_204054_create_module_tbl',1433164077),('m140506_102106_rbac_init',1433495094),('m140526_193056_create_module_tbl',1433164112),('m140911_074715_create_module_tbl',1433164132),('m150602_055233_showplace',1433244234),('m150602_073405_translate_messages',1433315312),('m150602_074458_city',1433245022),('m150602_080320_create_restaurants_table',1433247534),('m150602_113145_regions',1433307602),('m150603_060124_showplacelang',1433413335),('m150603_074300_create_table_occupancy_type',1433319847),('m150604_081152_showplacetype_lang',1433425757),('m150604_091235_showplace_type_alter',1433425759),('m150604_101438_create_table_tour_type',1433415817),('m150604_130646_showplaces_type_insert',1433495089),('m150604_134501_create_table_tour_type',1433426048),('m150605_070506_alter_tour_type',1433495092),('m150605_070929_rbac',1433495099),('m150605_093257_alter_table_restaurant',1433505900);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `occupancy_sub_type`
--

DROP TABLE IF EXISTS `occupancy_sub_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `occupancy_sub_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'наименование',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occupancy_sub_type`
--

LOCK TABLES `occupancy_sub_type` WRITE;
/*!40000 ALTER TABLE `occupancy_sub_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `occupancy_sub_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `occupancy_type`
--

DROP TABLE IF EXISTS `occupancy_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `occupancy_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID Типа размещения',
  `name_rus` varchar(255) DEFAULT NULL COMMENT 'Название типа проживания, русский',
  `name_ita` varchar(255) DEFAULT NULL COMMENT 'Название типа проживания, итальянский',
  `subtype_id` int(11) DEFAULT NULL COMMENT 'Подтип места размещения',
  `image_id` int(11) DEFAULT NULL COMMENT 'Изображение типа размещения',
  `identifier` int(11) DEFAULT NULL COMMENT 'идентификатор',
  PRIMARY KEY (`id`),
  KEY `fk_occupancy_type_occupancy_sub_type` (`subtype_id`),
  CONSTRAINT `fk_occupancy_type_occupancy_sub_type` FOREIGN KEY (`subtype_id`) REFERENCES `occupancy_sub_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occupancy_type`
--

LOCK TABLES `occupancy_type` WRITE;
/*!40000 ALTER TABLE `occupancy_type` DISABLE KEYS */;
INSERT INTO `occupancy_type` VALUES (2,'456u47u47u','456u4i7467i46i7',NULL,NULL,NULL),(3,'eetre56j45j6','3567345u64j67',NULL,NULL,NULL);
/*!40000 ALTER TABLE `occupancy_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `avatar_url` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `FK_profile_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Administration','Site','');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(20) NOT NULL COMMENT 'идентификатор',
  `name` varchar(50) NOT NULL COMMENT 'наименование города',
  `spellings` text NOT NULL COMMENT 'дополнительные варианты написания',
  `visit_image_id` int(11) DEFAULT NULL COMMENT 'визитка региона',
  `arms_image_id` int(11) DEFAULT NULL COMMENT 'герб региона',
  `city_id` int(11) DEFAULT NULL COMMENT 'административный центр региона',
  `description` text NOT NULL COMMENT 'описание',
  PRIMARY KEY (`id`),
  KEY `fk_region_city_id_city_id` (`city_id`),
  KEY `fk_region_visit_image_id_image_id` (`visit_image_id`),
  KEY `fk_region_arms_image_id_image_id` (`arms_image_id`),
  CONSTRAINT `fk_region_arms_image_id_image_id` FOREIGN KEY (`arms_image_id`) REFERENCES `image` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_region_city_id_city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_region_visit_image_id_image_id` FOREIGN KEY (`visit_image_id`) REFERENCES `image` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'2','vova','frg',NULL,NULL,NULL,'ergter');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Ресторана',
  `frontend` smallint(6) DEFAULT NULL COMMENT 'Вывод ресторана на фронт-енд',
  `name` varchar(255) DEFAULT NULL COMMENT 'Название ресторана',
  `spellings` varchar(255) DEFAULT NULL COMMENT 'Дополнительные варианты написания',
  `rest_net` varchar(255) DEFAULT NULL COMMENT 'Принадлежность к сети ресторанов',
  `stars` int(11) DEFAULT NULL COMMENT 'Звездность',
  `region_id` int(11) DEFAULT NULL COMMENT 'Региональная принадлежность',
  `city_id` int(11) DEFAULT NULL COMMENT 'Принадлежность к городу',
  `latitude` decimal(10,0) DEFAULT NULL COMMENT 'Широта',
  `longitude` decimal(10,0) DEFAULT NULL COMMENT 'Долгота',
  `logo_image_id` int(11) DEFAULT NULL COMMENT 'Изображение - логотип ресторана',
  `menu_image_id` int(11) DEFAULT NULL COMMENT 'Загрузить меню',
  `address` varchar(255) DEFAULT NULL COMMENT 'Адрес ресторана',
  `hotel_id` int(11) DEFAULT NULL COMMENT 'Находится в одном здании с отелем',
  `worktime` varchar(255) DEFAULT NULL COMMENT 'Время работы',
  `main_phone` varchar(255) DEFAULT NULL COMMENT 'Основной телефон ресторана',
  `add_phone` varchar(255) DEFAULT NULL COMMENT 'Дополнительные телефоны',
  `site` varchar(255) DEFAULT NULL COMMENT 'Официальный сайт',
  `facebook` varchar(255) DEFAULT NULL COMMENT 'Aкк Facebook',
  `instagram` varchar(255) DEFAULT NULL COMMENT 'Акк Instagram',
  `identifier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_restaurant_city` (`city_id`),
  KEY `fk_restaurant_hotel` (`hotel_id`),
  KEY `fk_restaurant_region` (`region_id`),
  CONSTRAINT `fk_restaurant_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_restaurant_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_restaurant_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_lang`
--

DROP TABLE IF EXISTS `restaurant_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `worktime` text,
  PRIMARY KEY (`id`),
  KEY `fk_restaurant_lang___restaurant` (`restaurant_id`),
  KEY `fk_restaurant_lang___lang` (`lang_id`),
  CONSTRAINT `fk_restaurant_lang___lang` FOREIGN KEY (`lang_id`) REFERENCES `lang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_restaurant_lang___restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_lang`
--

LOCK TABLES `restaurant_lang` WRITE;
/*!40000 ALTER TABLE `restaurant_lang` DISABLE KEYS */;
INSERT INTO `restaurant_lang` VALUES (1,8,1,'er',NULL),(2,8,2,'er',NULL),(3,8,3,'et',NULL),(4,9,1,'456',NULL),(5,9,2,'456',NULL),(6,9,3,'456',NULL);
/*!40000 ALTER TABLE `restaurant_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showplace`
--

DROP TABLE IF EXISTS `showplace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `showplace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` int(11) NOT NULL COMMENT 'Идентификатор достопримечательности',
  `name` varchar(255) NOT NULL COMMENT 'Название',
  `org_service_provider` text,
  `showplace_type_id` int(11) NOT NULL COMMENT 'Тип достопримечательности',
  `city_id` int(11) NOT NULL COMMENT 'Город/место',
  `address` varchar(255) NOT NULL COMMENT 'Адрес',
  `image_id` int(11) DEFAULT NULL COMMENT 'Основное изображение',
  `additional_image_id` int(11) DEFAULT NULL COMMENT 'Доп.изображение',
  `latitude` varchar(255) DEFAULT NULL COMMENT 'Широта',
  `longitude` varchar(255) DEFAULT NULL COMMENT 'Долгота',
  `short_description` varchar(255) NOT NULL COMMENT 'Краткое описание',
  `description` text NOT NULL COMMENT 'Подробное описание',
  `representative_name` varchar(255) DEFAULT NULL COMMENT 'Имя представителя',
  `representative_phone` varchar(255) DEFAULT NULL COMMENT 'Телефон представителя',
  `representative_email` varchar(50) DEFAULT NULL COMMENT 'Email представителя',
  `site` varchar(255) DEFAULT NULL COMMENT 'Сайт',
  `facebook` varchar(255) DEFAULT NULL COMMENT 'Ссылка на facebook',
  `instagram` varchar(255) DEFAULT NULL COMMENT 'Ссылка на инстаграм',
  `price_adult` double(10,2) DEFAULT NULL COMMENT 'Цена посещения для взрослого',
  `price_child` double(10,2) DEFAULT NULL COMMENT 'Цена посещения для ребенка',
  `schedule` varchar(255) DEFAULT NULL COMMENT 'Расписание работы',
  `has_excursion` tinyint(1) DEFAULT NULL COMMENT 'Наличие экскурсии',
  `price_excursion_guide_group` double DEFAULT NULL COMMENT 'Стоимость экскурсии в группе с гидом',
  `price_excursion_guide_individual` double DEFAULT NULL COMMENT 'Стоимость индивидуальной экскурсии с гидом',
  `price_excursion_guide_audio` double DEFAULT NULL COMMENT 'Стоимость экскурсии аудио-гид',
  `additional` text COMMENT 'Дополнительные товары и услуги',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_showplace_identifier` (`identifier`),
  KEY `fk_showplace_showplace_type_id__showplace_type_id` (`showplace_type_id`),
  KEY `fk_showplace_image_id__image_id` (`image_id`),
  KEY `fk_showplace_additional_image_id__image_id` (`additional_image_id`),
  KEY `fk_showplace_city_id__city_id` (`city_id`),
  CONSTRAINT `fk_showplace_additional_image_id__image_id` FOREIGN KEY (`additional_image_id`) REFERENCES `image` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_showplace_city_id__city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_showplace_image_id__image_id` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_showplace_showplace_type_id__showplace_type_id` FOREIGN KEY (`showplace_type_id`) REFERENCES `showplace_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showplace`
--

LOCK TABLES `showplace` WRITE;
/*!40000 ALTER TABLE `showplace` DISABLE KEYS */;
/*!40000 ALTER TABLE `showplace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showplace_lang`
--

DROP TABLE IF EXISTS `showplace_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `showplace_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `showplace_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_showplace_lang_showplace_id__showplace_id` (`showplace_id`),
  KEY `fk_showplace_lang_lang_id__lang_id` (`lang_id`),
  CONSTRAINT `fk_showplace_lang_lang_id__lang_id` FOREIGN KEY (`lang_id`) REFERENCES `lang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_showplace_lang_showplace_id__showplace_id` FOREIGN KEY (`showplace_id`) REFERENCES `showplace` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showplace_lang`
--

LOCK TABLES `showplace_lang` WRITE;
/*!40000 ALTER TABLE `showplace_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `showplace_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showplace_type`
--

DROP TABLE IF EXISTS `showplace_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `showplace_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` int(11) NOT NULL COMMENT 'Идентификатор типа достопримечательности',
  `name` varchar(255) NOT NULL COMMENT 'Название',
  `description` text,
  `image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx_showplace_type_identifier` (`identifier`),
  KEY `showplace_type_image_id__image_id` (`image_id`),
  CONSTRAINT `showplace_type_image_id__image_id` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showplace_type`
--

LOCK TABLES `showplace_type` WRITE;
/*!40000 ALTER TABLE `showplace_type` DISABLE KEYS */;
INSERT INTO `showplace_type` VALUES (1,1,'памятник','скульптура',NULL),(2,2,'музей','',NULL),(3,3,'галерея живописи, фотографии','',NULL),(4,4,'городской парк','',NULL),(5,5,'национальный парк/заповедник','',NULL),(6,6,'площадь','',NULL),(7,7,'городской район','',NULL),(8,8,'парк развлечений','',NULL),(9,9,'объект архитектуры','дворец, замок, мост',NULL),(10,10,'религиозный объект','',NULL),(11,11,'театр','',NULL),(12,12,'порт','',NULL),(13,13,'историческое место','',NULL),(14,14,'канал','',NULL),(15,15,'природный объект','водопад, гора/скала, местность .. и прочие красоты',NULL);
/*!40000 ALTER TABLE `showplace_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showplace_type_lang`
--

DROP TABLE IF EXISTS `showplace_type_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `showplace_type_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `showplace_type_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `fk_showplace_type_lang_showplace__type_id__showplace_type_id` (`showplace_type_id`),
  KEY `fk_showplace_type_lang_lang_id__lang_id` (`lang_id`),
  CONSTRAINT `fk_showplace_type_lang_lang_id__lang_id` FOREIGN KEY (`lang_id`) REFERENCES `lang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_showplace_type_lang_showplace__type_id__showplace_type_id` FOREIGN KEY (`showplace_type_id`) REFERENCES `showplace_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showplace_type_lang`
--

LOCK TABLES `showplace_type_lang` WRITE;
/*!40000 ALTER TABLE `showplace_type_lang` DISABLE KEYS */;
INSERT INTO `showplace_type_lang` VALUES (1,1,2,'памятник','скульптура'),(2,2,2,'музей',''),(3,3,2,'галерея живописи, фотографии',''),(4,4,2,'городской парк',''),(5,5,2,'национальный парк/заповедник',''),(6,6,2,'площадь',''),(7,7,2,'городской район',''),(8,8,2,'парк развлечений',''),(9,9,2,'объект архитектуры','дворец, замок, мост'),(10,10,2,'религиозный объект',''),(11,11,2,'театр',''),(12,12,2,'порт',''),(13,13,2,'историческое место',''),(14,14,2,'канал',''),(15,15,2,'природный объект','водопад, гора/скала, местность .. и прочие красоты');
/*!40000 ALTER TABLE `showplace_type_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `source_message`
--

DROP TABLE IF EXISTS `source_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `message` text,
  PRIMARY KEY (`id`),
  KEY `source_message_category_id__message_category_id` (`category_id`),
  CONSTRAINT `source_message_category_id__message_category_id` FOREIGN KEY (`category_id`) REFERENCES `message_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `source_message`
--

LOCK TABLES `source_message` WRITE;
/*!40000 ALTER TABLE `source_message` DISABLE KEYS */;
INSERT INTO `source_message` VALUES (1,1,'BACKEND_INDEX_TITLE'),(2,2,'All Rights Reserved'),(3,2,'Blogs'),(4,2,'Change email'),(5,2,'Change password'),(6,2,'Contacts'),(7,2,'Edit profile'),(8,2,'GO BACK TO THE HOMEPAGE'),(9,2,'Settings'),(10,2,'Sign In'),(11,2,'Sign Out'),(12,2,'Sign Up'),(13,2,'Toggle navigation'),(14,2,'Backend'),(15,3,'Access control'),(16,3,'Blogs'),(17,3,'Comments'),(18,3,'Dashboard'),(19,3,'Hello, {name}'),(20,3,'Home'),(21,3,'Member since'),(22,3,'Models management'),(23,3,'Online'),(24,3,'Permissions'),(25,3,'Profile'),(26,3,'Roles'),(27,3,'Rules'),(28,3,'Sign out'),(29,3,'Toggle navigation'),(30,3,'Users'),(31,3,'Directories'),(32,3,'Restaurants'),(33,3,'GO_TO_SITE'),(34,2,'Feedback'),(35,3,'Feedback'),(36,3,'Faq'),(37,3,'Static Pages'),(38,3,'Lang'),(39,3,'Translations'),(40,3,'Showplaces'),(41,3,'ShowplacesType'),(42,4,'IDENTIFIER'),(43,4,'NAME'),(44,4,'ORG_SERVICE_PROVIDER'),(45,4,'SHOWPLACE_TYPE_ID'),(46,4,'REGION_ID'),(47,4,'CITY_ID'),(48,4,'ADDRESS'),(49,4,'IMAGE_ID'),(50,4,'ADDITIONAL_IMAGE_ID'),(51,4,'COORDS'),(52,4,'LATITUDE'),(53,4,'LONGITUDE'),(54,4,'SHORT_DESCRIPTION'),(55,4,'DESCRIPTION'),(56,4,'REPRESENTATIVE_NAME'),(57,4,'REPRESENTATIVE_PHONE'),(58,4,'REPRESENTATIVE_EMAIL'),(59,4,'SITE'),(60,4,'FACEBOOK'),(61,4,'INSTAGRAM'),(62,4,'PRICE'),(63,4,'PRICE_ADULT'),(64,4,'PRICE_CHILD'),(65,4,'SCHEDULE'),(66,4,'HAS_EXCURSION'),(67,4,'PRICE_EXCURSION'),(68,4,'PRICE_EXCURSION_GUIDE_GROUP'),(69,4,'PRICE_EXCURSION_GUIDE_INDIVIDUAL'),(70,4,'PRICE_EXCURSION_GUIDE_AUDIO'),(71,4,'ADDITIONAL'),(72,4,'TRANSLATION_NAME'),(73,4,'BACKEND_INDEX_TITLE'),(74,4,'BACKEND_INDEX_SUBTITLE'),(75,4,'BACKEND_CREATE_TITLE'),(76,4,'BACKEND_CREATE_SUBTITLE'),(77,4,'BACKEND_UPDATE_TITLE'),(78,4,'BACKEND_UPDATE_SUBTITLE'),(79,4,'BACKEND_CREATE_SUBMIT'),(80,4,'BACKEND_UPDATE_SUBMIT'),(81,5,'IDENTIFIER'),(82,5,'TRANSLATION_NAME'),(83,5,'TRANSLATION_DESCRIPTION'),(84,5,'IMAGE'),(85,5,'BACKEND_INDEX_TITLE'),(86,5,'BACKEND_INDEX_SUBTITLE'),(87,5,'BACKEND_CREATE_TITLE'),(88,5,'BACKEND_CREATE_SUBTITLE'),(89,5,'BACKEND_UPDATE_TITLE'),(90,5,'BACKEND_UPDATE_SUBTITLE'),(91,5,'BACKEND_CREATE_SUBMIT'),(92,5,'BACKEND_UPDATE_SUBMIT'),(93,1,'IDENTIFIER'),(94,1,'NAME'),(95,1,'REGION_ID'),(96,1,'CITY_ID'),(97,1,'ADDRESS'),(98,1,'LOGO_IMAGE_ID'),(99,1,'MENU_IMAGE_ID'),(100,1,'COORDS'),(101,1,'LATITUDE'),(102,1,'LONGITUDE'),(103,1,'SHORT_DESCRIPTION'),(104,1,'DESCRIPTION'),(105,1,'REPRESENTATIVE_NAME'),(106,1,'REPRESENTATIVE_PHONE'),(107,1,'REPRESENTATIVE_EMAIL'),(108,1,'SITE'),(109,1,'FACEBOOK'),(110,1,'INSTAGRAM'),(111,1,'PRICE'),(112,1,'PRICE_ADULT'),(113,1,'PRICE_CHILD'),(114,1,'SCHEDULE'),(115,1,'HAS_EXCURSION'),(116,1,'PRICE_EXCURSION'),(117,1,'PRICE_EXCURSION_GUIDE_GROUP'),(118,1,'PRICE_EXCURSION_GUIDE_INDIVIDUAL'),(119,1,'PRICE_EXCURSION_GUIDE_AUDIO'),(120,1,'ADDITIONAL'),(121,1,'TRANSLATION_NAME'),(122,1,'BACKEND_INDEX_SUBTITLE'),(123,1,'BACKEND_CREATE_TITLE'),(124,1,'BACKEND_CREATE_SUBTITLE'),(125,1,'BACKEND_UPDATE_TITLE'),(126,1,'BACKEND_UPDATE_SUBTITLE'),(127,1,'BACKEND_CREATE_SUBMIT'),(128,1,'BACKEND_UPDATE_SUBMIT'),(129,1,'ID'),(130,1,'TRANSLATION_DESCRIPTION'),(131,1,'IMAGE'),(132,1,'FRONTEND');
/*!40000 ALTER TABLE `source_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_type`
--

DROP TABLE IF EXISTS `tour_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `image_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tour_type_image_id__image_id` (`image_id`),
  CONSTRAINT `fk_tour_type_image_id__image_id` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_type`
--

LOCK TABLES `tour_type` WRITE;
/*!40000 ALTER TABLE `tour_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_type_lang`
--

DROP TABLE IF EXISTS `tour_type_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tour_type_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_type_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `fk_tour_type_lang_tour_type_id__tour_type_id` (`tour_type_id`),
  KEY `fk_tour_type_lang_lang_id__lang_id` (`lang_id`),
  CONSTRAINT `fk_tour_type_lang_lang_id__lang_id` FOREIGN KEY (`lang_id`) REFERENCES `lang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tour_type_lang_tour_type_id__tour_type_id` FOREIGN KEY (`tour_type_id`) REFERENCES `tour_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_type_lang`
--

LOCK TABLES `tour_type_lang` WRITE;
/*!40000 ALTER TABLE `tour_type_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_type_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_email`
--

DROP TABLE IF EXISTS `user_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_email` (
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `token` varchar(53) NOT NULL,
  PRIMARY KEY (`user_id`,`token`),
  CONSTRAINT `FK_user_email_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_email`
--

LOCK TABLES `user_email` WRITE;
/*!40000 ALTER TABLE `user_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `token` varchar(53) NOT NULL,
  `role` varchar(64) NOT NULL DEFAULT 'user',
  `status_id` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `role` (`role`),
  KEY `status_id` (`status_id`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@demo.com','$2y$13$I6f8kR0rA6fPmHcm61iZEOs/ZMzyoQlUbbKlSMH4RUheQvyueVrmW','gs4Dk99J8fPffGI1e5NkgNSLOSTLxzbC','qUUa-MxeGL8tOeowFGpqmi5LEG80ZHI0_1433164077','superadmin',1,1433164076,1433164076);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-07  4:44:03
