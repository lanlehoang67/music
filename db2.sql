-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: music_dev
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `artist_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_albums_on_artist_id` (`artist_id`),
  CONSTRAINT `fk_rails_124a79559a` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (1,1,'Buông đôi tay nhau ra ','220px-Buongdoitaynhauramtp.jpg','2019-06-29 11:47:44','2019-06-29 11:47:44'),(2,2,'Touhou Vocal Album','touhou.jpeg','2019-06-29 13:09:58','2019-06-29 13:09:58'),(3,3,'Single','laemtudatinh.jpeg','2019-06-29 13:46:08','2019-06-29 13:46:08');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2019-06-29 09:21:01','2019-06-29 09:21:01');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artists`
--

DROP TABLE IF EXISTS `artists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artists` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `begin_year` int(11) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artists`
--

LOCK TABLES `artists` WRITE;
/*!40000 ALTER TABLE `artists` DISABLE KEYS */;
INSERT INTO `artists` VALUES (1,'Sơn thùng atm ','2019-06-29 18:36:00',5,NULL,'','1526060499277_600.jpg','2019-06-29 11:36:52','2019-06-30 10:08:08',NULL),(2,'Touhou Vocal',NULL,NULL,NULL,'','touhou.jpeg','2019-06-29 13:08:14','2019-06-29 13:08:14',NULL),(3,'Hồ Dương Lâm',NULL,NULL,NULL,'','20381.jpg','2019-06-29 13:44:48','2019-06-29 13:44:48',NULL),(4,'Gotoubun no kimochi',NULL,NULL,NULL,NULL,NULL,'2019-07-07 07:36:24','2019-07-07 07:36:24',NULL),(5,'Itsugo',NULL,NULL,NULL,NULL,NULL,'2019-07-07 08:11:11','2019-07-07 08:11:11',0);
/*!40000 ALTER TABLE `artists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `song_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_user_id` (`user_id`),
  KEY `index_comments_on_song_id` (`song_id`),
  CONSTRAINT `fk_rails_03de2dc08c` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_9bdaf62174` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,2,'cac','2019-07-01 05:49:04','2019-07-01 05:49:04',5,NULL),(2,2,'loz','2019-07-01 06:06:43','2019-07-01 06:06:43',5,NULL),(3,2,'cac','2019-07-01 06:13:03','2019-07-01 06:13:03',5,NULL),(4,2,'cu','2019-07-01 06:14:06','2019-07-01 06:14:06',5,NULL),(5,2,'a','2019-07-01 06:14:56','2019-07-01 06:14:56',5,NULL),(6,2,'loz','2019-07-01 06:33:44','2019-07-01 06:33:44',5,NULL),(7,2,'cc','2019-07-01 06:34:14','2019-07-01 06:34:14',5,NULL),(8,2,'llll','2019-07-01 06:39:32','2019-07-01 06:39:32',5,NULL),(9,2,'ccc','2019-07-01 06:40:19','2019-07-01 06:40:19',5,NULL),(10,2,'aaa','2019-07-01 06:40:57','2019-07-01 06:40:57',5,NULL),(11,2,'aaa','2019-07-01 06:41:02','2019-07-01 06:41:02',5,NULL),(12,2,'asasasa','2019-07-01 06:41:19','2019-07-01 06:41:19',5,NULL),(13,2,'asasasa','2019-07-01 06:42:12','2019-07-01 06:42:12',5,NULL),(14,2,'cai gi','2019-07-01 06:43:49','2019-07-01 06:43:49',5,NULL),(15,2,'???','2019-07-01 06:44:07','2019-07-01 06:44:07',5,NULL),(16,2,'cccc','2019-07-01 06:45:32','2019-07-01 06:45:32',5,NULL),(17,2,'asasa','2019-07-01 06:54:19','2019-07-01 06:54:19',5,NULL),(18,2,'asasa','2019-07-01 06:54:32','2019-07-01 06:54:32',5,NULL),(19,2,'asasa','2019-07-01 06:58:56','2019-07-01 06:58:56',5,NULL),(20,2,'cc','2019-07-01 06:59:11','2019-07-01 06:59:11',5,NULL),(21,2,'asas','2019-07-01 07:00:00','2019-07-01 07:00:00',5,NULL),(22,2,'aaa','2019-07-01 07:00:12','2019-07-01 07:00:12',5,NULL),(23,2,'asasa','2019-07-01 07:00:28','2019-07-01 07:00:28',5,NULL),(24,2,'cac','2019-07-01 07:09:05','2019-07-01 07:09:05',5,NULL),(25,2,'sasasa','2019-07-01 07:09:28','2019-07-01 07:09:28',5,NULL),(26,2,'cc','2019-07-01 07:13:26','2019-07-01 07:13:26',5,NULL),(27,2,'caca','2019-07-01 07:13:49','2019-07-01 07:13:49',5,NULL),(28,2,'asasa','2019-07-01 07:14:55','2019-07-01 07:14:55',5,NULL),(29,2,'sadad','2019-07-01 07:16:07','2019-07-01 07:16:07',5,NULL),(30,2,'sadasa','2019-07-01 07:16:34','2019-07-01 07:16:34',5,NULL),(31,2,'sadasa','2019-07-01 07:16:45','2019-07-01 07:16:45',5,NULL),(32,2,'sadasa','2019-07-01 07:17:31','2019-07-01 07:17:31',5,NULL),(33,2,'sadasa','2019-07-01 07:18:36','2019-07-01 07:18:36',5,NULL),(34,2,'sadasa','2019-07-01 07:18:43','2019-07-01 07:18:43',5,NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `venue` text,
  `phone_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `description` text,
  `paid` tinyint(1) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `hot_picture` varchar(255) DEFAULT NULL,
  `type_event` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Quẩy cùng DJ Soda','2-dj-xinh-nhat-nhi-han-quoc-hap-dan-thanh-nien-viet-boi-phong-cach-sexy-tuyet-dinh-1.jpg','Hanoi,Vietnam ','0935159073','lanlehoang10@gmail.com','Quẩy suốt đêm với DJ Soda ',1,'200000',4,'2019-07-06 06:25:30','2019-07-06 06:45:17','2-dj-xinh-nhat-nhi-han-quoc-hap-dan-thanh-nien-viet-boi-phong-cach-sexy-tuyet-dinh-1.jpg','hot'),(2,'Đen Vâu acoustic ','6.jpg','Đà Nẵng ','0935159073','lanlehoang10@gmail.com','Nghe nhạc cùng rapper ',0,'',10,'2019-07-06 06:45:05','2019-07-06 06:45:05',NULL,'normal');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Pop','','2019-06-29 11:57:10','2019-06-29 11:57:10','6.jpg');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_songs`
--

DROP TABLE IF EXISTS `history_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_songs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `song_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_history_songs_on_user_id` (`user_id`),
  KEY `index_history_songs_on_song_id` (`song_id`),
  CONSTRAINT `fk_rails_47a884e7ae` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`),
  CONSTRAINT `fk_rails_51adf187a9` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_songs`
--

LOCK TABLES `history_songs` WRITE;
/*!40000 ALTER TABLE `history_songs` DISABLE KEYS */;
INSERT INTO `history_songs` VALUES (8,3,5,'2019-07-07 12:10:09','2019-07-07 12:10:09'),(9,3,3,'2019-07-07 12:10:11','2019-07-07 12:10:11'),(10,3,2,'2019-07-07 12:10:12','2019-07-07 12:10:12');
/*!40000 ALTER TABLE `history_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lyrics`
--

DROP TABLE IF EXISTS `lyrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lyrics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start` float DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `end` float DEFAULT NULL,
  `song_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_lyrics_on_song_id` (`song_id`),
  CONSTRAINT `fk_rails_a7a77bd903` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lyrics`
--

LOCK TABLES `lyrics` WRITE;
/*!40000 ALTER TABLE `lyrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `lyrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_favorite_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_notifications_on_user_favorite_id` (`user_favorite_id`),
  KEY `index_notifications_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_87bdc8df03` FOREIGN KEY (`user_favorite_id`) REFERENCES `user_favorites` (`id`),
  CONSTRAINT `fk_rails_b080fb4855` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `play_list_songs`
--

DROP TABLE IF EXISTS `play_list_songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `play_list_songs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `play_list_id` bigint(20) DEFAULT NULL,
  `song_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_play_list_songs_on_play_list_id` (`play_list_id`),
  KEY `index_play_list_songs_on_song_id` (`song_id`),
  CONSTRAINT `fk_rails_4846a2fcce` FOREIGN KEY (`play_list_id`) REFERENCES `play_lists` (`id`),
  CONSTRAINT `fk_rails_d8c0692883` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play_list_songs`
--

LOCK TABLES `play_list_songs` WRITE;
/*!40000 ALTER TABLE `play_list_songs` DISABLE KEYS */;
INSERT INTO `play_list_songs` VALUES (55,41,5,'2019-07-05 10:40:20','2019-07-05 10:40:20'),(65,41,2,'2019-07-05 10:53:30','2019-07-05 10:53:30'),(66,42,2,'2019-07-05 10:53:38','2019-07-05 10:53:38'),(67,41,1,'2019-07-05 10:53:44','2019-07-05 10:53:44'),(68,40,26,'2019-07-07 12:40:33','2019-07-07 12:40:33');
/*!40000 ALTER TABLE `play_list_songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `play_lists`
--

DROP TABLE IF EXISTS `play_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `play_lists` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_play_lists_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_1c5e8fc15e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play_lists`
--

LOCK TABLES `play_lists` WRITE;
/*!40000 ALTER TABLE `play_lists` DISABLE KEYS */;
INSERT INTO `play_lists` VALUES (40,'Touhou',NULL,'2019-07-03 11:50:01','2019-07-03 11:50:01',2),(41,'Touhou2',NULL,'2019-07-03 11:50:08','2019-07-03 11:50:08',2),(42,'Touhou5',NULL,'2019-07-03 12:15:32','2019-07-03 12:15:32',2);
/*!40000 ALTER TABLE `play_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rates`
--

DROP TABLE IF EXISTS `rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rater_id` bigint(20) DEFAULT NULL,
  `rateable_type` varchar(255) DEFAULT NULL,
  `rateable_id` bigint(20) DEFAULT NULL,
  `stars` float NOT NULL,
  `dimension` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rates_on_rater_id` (`rater_id`),
  KEY `index_rates_on_rateable_type_and_rateable_id` (`rateable_type`,`rateable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rates`
--

LOCK TABLES `rates` WRITE;
/*!40000 ALTER TABLE `rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_caches`
--

DROP TABLE IF EXISTS `rating_caches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating_caches` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cacheable_type` varchar(255) DEFAULT NULL,
  `cacheable_id` bigint(20) DEFAULT NULL,
  `avg` float NOT NULL,
  `qty` int(11) NOT NULL,
  `dimension` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rating_caches_on_cacheable_type_and_cacheable_id` (`cacheable_type`,`cacheable_id`),
  KEY `index_rating_caches_on_cacheable_id_and_cacheable_type` (`cacheable_id`,`cacheable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_caches`
--

LOCK TABLES `rating_caches` WRITE;
/*!40000 ALTER TABLE `rating_caches` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating_caches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20190327042309'),('20190327042331'),('20190327042350'),('20190327042410'),('20190327042419'),('20190327042432'),('20190327042438'),('20190327042636'),('20190328063455'),('20190328065442'),('20190328070015'),('20190329014240'),('20190331141329'),('20190331142408'),('20190404131102'),('20190404131128'),('20190404133606'),('20190404133622'),('20190404141415'),('20190406082927'),('20190406082957'),('20190406083348'),('20190406083500'),('20190409170452'),('20190629132323'),('20190629132413'),('20190629172415'),('20190630151518'),('20190630163607'),('20190701061843'),('20190704130243'),('20190704130502'),('20190706052746'),('20190706053805'),('20190706062803'),('20190706062946'),('20190706063023'),('20190706063145'),('20190706112413'),('20190707080321'),('20190707083108'),('20190707083128'),('20190707083428'),('20190707102806'),('20190707102844'),('20190707104611');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_genres`
--

DROP TABLE IF EXISTS `song_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song_genres` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `song_id` bigint(20) DEFAULT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_song_genres_on_song_id` (`song_id`),
  KEY `index_song_genres_on_genre_id` (`genre_id`),
  CONSTRAINT `fk_rails_2667afbc1f` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`),
  CONSTRAINT `fk_rails_d21ad1d041` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_genres`
--

LOCK TABLES `song_genres` WRITE;
/*!40000 ALTER TABLE `song_genres` DISABLE KEYS */;
INSERT INTO `song_genres` VALUES (6,4,1,'2019-06-29 13:37:42','2019-06-29 13:37:42'),(7,5,1,'2019-06-29 13:48:34','2019-06-29 13:48:34');
/*!40000 ALTER TABLE `song_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `songs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `artist_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `length` varchar(255) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `album_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `url_file_name` varchar(255) DEFAULT NULL,
  `url_content_type` varchar(255) DEFAULT NULL,
  `url_file_size` bigint(20) DEFAULT NULL,
  `url_updated_at` datetime DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `lyric` varchar(255) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `picture_file_name` varchar(255) DEFAULT NULL,
  `picture_content_type` varchar(255) DEFAULT NULL,
  `picture_file_size` bigint(20) DEFAULT NULL,
  `picture_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_songs_on_artist_id` (`artist_id`),
  KEY `index_songs_on_album_id` (`album_id`),
  KEY `index_songs_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_5ce8fd4cc7` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`),
  CONSTRAINT `fk_rails_d36a8dd57d` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_f4e40cd655` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,1,'Buông đôi tay nhau ra ','','',NULL,1,'','2019-06-29 11:53:26','2019-07-07 10:13:55',1,'buongdoitay.mp3','audio/mpeg',3653676,'2019-07-07 09:27:49','','',1,'1526060499277_600.jpg','image/jpeg',87056,'2019-07-07 09:27:49'),(2,2,'Kobore Sakura','','',NULL,2,'','2019-06-29 13:10:29','2019-07-07 10:13:47',1,'Kobore_Sakura_-_senya.mp3','audio/mpeg',4995403,'2019-07-07 09:27:10','','',1,'touhou.jpg','image/jpeg',89574,'2019-07-07 09:27:10'),(3,2,'Bad Apple','','',NULL,2,'','2019-06-29 13:17:13','2019-07-07 10:13:24',1,'Bad_Apple___-_nomico.mp3','audio/mpeg',5157474,'2019-07-07 09:26:42','','',1,'badapple.jpg','image/jpeg',101686,'2019-07-07 09:26:42'),(4,2,'Border of life','','',NULL,2,'','2019-06-29 13:37:42','2019-07-07 10:12:53',1,'Border_Of_Life_-_ZUN.mp3','audio/mpeg',1908533,'2019-07-07 09:26:06','','',1,'border.jpg','image/jpeg',87935,'2019-07-07 09:26:06'),(5,3,'Là em tự đa tình ','','',NULL,3,'','2019-06-29 13:48:34','2019-07-07 10:12:42',1,'La_Tu_Em_Da_Tinh_-_Ho_Duong_Lam.mp3','audio/mpeg',4612077,'2019-07-07 09:23:49','','',1,'laemtudatinh.jpeg','image/jpeg',11623,'2019-07-07 09:23:49'),(26,5,'Gotoubun no kimochi','','',NULL,3,'','2019-07-07 10:07:05','2019-07-07 10:14:10',3,'gotoubun_no_kimochi.mp3','audio/mpeg',3643706,'2019-07-07 10:07:05','','',1,'gotoubun.jpg','image/jpeg',85815,'2019-07-07 10:07:05');
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_favorites`
--

DROP TABLE IF EXISTS `user_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `favorite_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_favorites_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_25ed4cb388` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_favorites`
--

LOCK TABLES `user_favorites` WRITE;
/*!40000 ALTER TABLE `user_favorites` DISABLE KEYS */;
INSERT INTO `user_favorites` VALUES (35,2,3,'2019-07-04 14:31:50','2019-07-04 14:31:50'),(36,2,4,'2019-07-04 14:31:51','2019-07-04 14:31:51'),(37,2,2,'2019-07-04 14:31:53','2019-07-04 14:31:53'),(39,3,26,'2019-07-07 11:52:03','2019-07-07 11:52:03'),(40,2,26,'2019-07-07 12:21:47','2019-07-07 12:21:47'),(41,2,26,'2019-07-07 12:24:40','2019-07-07 12:24:40'),(42,2,26,'2019-07-07 12:24:41','2019-07-07 12:24:41'),(43,2,26,'2019-07-07 12:24:54','2019-07-07 12:24:54'),(44,2,26,'2019-07-07 12:24:55','2019-07-07 12:24:55'),(45,2,26,'2019-07-07 12:25:01','2019-07-07 12:25:01'),(46,2,26,'2019-07-07 12:25:02','2019-07-07 12:25:02'),(47,2,26,'2019-07-07 12:25:20','2019-07-07 12:25:20'),(48,2,26,'2019-07-07 12:27:08','2019-07-07 12:27:08'),(49,2,26,'2019-07-07 12:27:09','2019-07-07 12:27:09'),(50,2,26,'2019-07-07 12:27:12','2019-07-07 12:27:12'),(51,2,26,'2019-07-07 12:27:12','2019-07-07 12:27:12'),(52,2,26,'2019-07-07 12:27:13','2019-07-07 12:27:13'),(53,2,26,'2019-07-07 12:27:14','2019-07-07 12:27:14'),(54,2,26,'2019-07-07 12:27:16','2019-07-07 12:27:16');
/*!40000 ALTER TABLE `user_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Lê Hoàng Lân','lanlehoang10@gmail.com',0,NULL,NULL,'','2019-06-29 11:52:12','2019-06-29 11:52:12','$2a$11$uwbAHthME64PViypsSDcyuYsMvDqh6beK2UhkHm8lbJ37.5aQz.Ue',NULL,NULL,NULL,'',NULL,NULL,''),(2,'','lanlehoang67@gmail.com',0,NULL,NULL,'admin','2019-06-30 12:54:39','2019-07-01 07:28:29','$2a$11$YsXcXj1ZxraSpB3ZlLtkF.y1NlwbaRbMKg3rYDaAIit25Jme9FVdq',NULL,NULL,NULL,'',NULL,NULL,''),(3,NULL,'lanlehoang45@gmail.com',NULL,NULL,NULL,NULL,'2019-07-07 10:06:40','2019-07-07 10:06:40','$2a$11$ig0/D3lJKxL6vlP0UOTh6Oa/5C1OOx2sIM9FT2kb6CcVEc2zD1hYy',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2019-07-07 19:53:25
