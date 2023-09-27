-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 192.168.150.101    Database: sl_driver
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `sl_driver_job`
--

DROP TABLE IF EXISTS `sl_driver_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sl_driver_job` (
  `id` bigint NOT NULL COMMENT 'id',
  `start_agency_id` bigint DEFAULT NULL COMMENT '起始机构id',
  `end_agency_id` bigint DEFAULT NULL COMMENT '目的机构id',
  `status` int DEFAULT NULL COMMENT '作业状态，1为待执行（对应 待提货）、2为进行中（对应在途）、3为改派（对应 已交付）、4为已完成（对应 已交付）、5为已作废',
  `driver_id` bigint DEFAULT NULL COMMENT '司机id',
  `transport_task_id` bigint DEFAULT NULL COMMENT '运输任务id',
  `start_handover` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '提货对接人',
  `finish_handover` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '交付对接人',
  `plan_departure_time` datetime DEFAULT NULL COMMENT '计划发车时间',
  `actual_departure_time` datetime DEFAULT NULL COMMENT '实际发车时间',
  `plan_arrival_time` datetime DEFAULT NULL COMMENT '计划到达时间',
  `actual_arrival_time` datetime DEFAULT NULL COMMENT '实际到达时间',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `task_transport_id` (`transport_task_id`) USING BTREE,
  KEY `created` (`created`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='司机作业单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_driver_job`
--

LOCK TABLES `sl_driver_job` WRITE;
/*!40000 ALTER TABLE `sl_driver_job` DISABLE KEYS */;
INSERT INTO `sl_driver_job` VALUES (1564518281538510850,1010142916737434337,1010144009236186209,6,1010191621448484833,1564518280960434178,NULL,NULL,'2022-08-30 17:40:00','2022-08-30 15:47:37','2022-08-30 17:50:00','2022-08-30 15:48:00','2022-08-30 15:40:00','2022-08-30 15:40:00'),(1564518282121519105,1010142916737434337,1010144009236186209,6,1010250185638660993,1564518280960434178,NULL,NULL,'2022-08-30 17:40:00','2022-08-30 15:47:37','2022-08-30 17:50:00','2022-08-30 15:48:00','2022-08-30 15:40:00','2022-08-30 15:40:00'),(1564523566340579330,1010142916737434337,1010154300397261281,6,1010191621448484833,1564523566106435585,NULL,NULL,'2022-08-30 18:01:00','2022-08-30 16:27:29','2022-08-30 18:31:00','2022-08-30 16:29:01','2022-08-30 16:01:00','2022-08-30 16:01:00'),(1564523566877450241,1010142916737434337,1010154300397261281,6,1010250185638660993,1564523566106435585,NULL,NULL,'2022-08-30 18:01:00','2022-08-30 16:27:29','2022-08-30 18:31:00','2022-08-30 16:29:01','2022-08-30 16:01:00','2022-08-30 16:01:00'),(1564529102909939713,1010154300397261281,1010142916737434337,6,1006930511861656865,1564529102063427586,NULL,NULL,'2022-08-30 18:12:00','2022-08-30 16:32:01','2022-08-30 18:22:00','2022-08-30 16:32:51','2022-08-30 16:23:00','2022-08-30 16:23:00'),(1564529103937544193,1010154300397261281,1010142916737434337,6,1010190982911837697,1564529102063427586,NULL,NULL,'2022-08-30 18:12:00','2022-08-30 16:32:01','2022-08-30 18:22:00','2022-08-30 16:32:51','2022-08-30 16:23:01','2022-08-30 16:23:01'),(1564529104294060034,1010154300397261281,1010142916737434337,6,1010250583241903297,1564529102063427586,NULL,NULL,'2022-08-30 18:12:00','2022-08-30 16:32:01','2022-08-30 18:22:00','2022-08-30 16:32:51','2022-08-30 16:23:01','2022-08-30 16:23:01'),(1564529354475905026,1010154300397261281,1010142916737434337,6,1010190982911837697,1564529354136903681,NULL,NULL,'2022-08-30 18:12:00','2022-08-30 16:37:03','2022-08-30 18:22:00','2022-08-30 16:37:26','2022-08-30 16:24:00','2022-08-30 16:24:00'),(1564529355721613314,1010154300397261281,1010142916737434337,6,1010250583241903297,1564529354136903681,NULL,NULL,'2022-08-30 18:12:00','2022-08-30 16:37:03','2022-08-30 18:22:00','2022-08-30 16:37:26','2022-08-30 16:24:01','2022-08-30 16:24:01'),(1564535907337707522,1010142916737434337,1010144009236186209,6,1006250633854868641,1564535899100831746,NULL,NULL,'2022-08-30 18:50:00','2022-08-30 16:53:45','2022-08-30 19:00:00','2022-08-30 16:54:18','2022-08-30 16:50:03','2022-08-30 16:50:03'),(1564535908788936705,1010142916737434337,1010144009236186209,6,1010191621448484833,1564535899100831746,NULL,NULL,'2022-08-30 18:50:00','2022-08-30 16:53:45','2022-08-30 19:00:00','2022-08-30 16:54:18','2022-08-30 16:50:03','2022-08-30 16:50:03'),(1564535909992701953,1010142916737434337,1010144009236186209,6,1010250185638660993,1564535899100831746,NULL,NULL,'2022-08-30 18:50:00','2022-08-30 16:53:45','2022-08-30 19:00:00','2022-08-30 16:54:18','2022-08-30 16:50:03','2022-08-30 16:50:03'),(1564762656352837634,996725895563695297,996785261423634945,1,1006930511861656865,1564762656013836289,NULL,NULL,'2022-08-31 09:51:00',NULL,'2022-08-31 10:51:00',NULL,'2022-08-31 07:51:04','2022-08-31 07:51:04'),(1564762658873614337,996725895563695297,996785261423634945,1,1010190982911837697,1564762656013836289,NULL,NULL,'2022-08-31 09:51:00',NULL,'2022-08-31 10:51:00',NULL,'2022-08-31 07:51:04','2022-08-31 07:51:04'),(1564762660123516929,996725895563695297,996785261423634945,1,1010250583241903297,1564762656013836289,NULL,NULL,'2022-08-31 09:51:00',NULL,'2022-08-31 10:51:00',NULL,'2022-08-31 07:51:05','2022-08-31 07:51:05'),(1564766419058761729,996785261423634945,1006252890226880993,1,1006930511861656865,1564766418686205954,NULL,NULL,'2022-08-31 10:06:00',NULL,'2022-08-31 11:06:00',NULL,'2022-08-31 08:06:01','2022-08-31 08:06:01'),(1564766420736483329,996785261423634945,1006252890226880993,1,1010190982911837697,1564766418686205954,NULL,NULL,'2022-08-31 10:06:00',NULL,'2022-08-31 11:06:00',NULL,'2022-08-31 08:06:01','2022-08-31 08:06:01'),(1564766422284181505,996785261423634945,1006252890226880993,1,1010250583241903297,1564766418686205954,NULL,NULL,'2022-08-31 10:06:00',NULL,'2022-08-31 11:06:00',NULL,'2022-08-31 08:06:02','2022-08-31 08:06:02'),(1564766668305276929,1006252890226880993,996785261423634945,1,1006930511861656865,1564766667853029377,NULL,NULL,'2022-08-31 10:07:00',NULL,'2022-08-31 11:07:00',NULL,'2022-08-31 08:07:00','2022-08-31 08:07:00'),(1564766668657598466,1006252890226880993,996785261423634945,1,1010190982911837697,1564766667853029377,NULL,NULL,'2022-08-31 10:07:00',NULL,'2022-08-31 11:07:00',NULL,'2022-08-31 08:07:00','2022-08-31 08:07:00'),(1564766669039280129,1006252890226880993,996785261423634945,1,1010250583241903297,1564766667853029377,NULL,NULL,'2022-08-31 10:07:00',NULL,'2022-08-31 11:07:00',NULL,'2022-08-31 08:07:01','2022-08-31 08:07:01'),(1564768179865329666,996785261423634945,996725895563695297,1,1006930511861656865,1564768178637135874,NULL,NULL,'2022-08-31 10:13:00',NULL,'2022-08-31 11:13:00',NULL,'2022-08-31 08:13:01','2022-08-31 08:13:01'),(1564768181220089857,996785261423634945,996725895563695297,1,1010190982911837697,1564768178637135874,NULL,NULL,'2022-08-31 10:13:00',NULL,'2022-08-31 11:13:00',NULL,'2022-08-31 08:13:01','2022-08-31 08:13:01'),(1564768182751010817,996785261423634945,996725895563695297,1,1010250583241903297,1564768178637135874,NULL,NULL,'2022-08-31 10:13:00',NULL,'2022-08-31 11:13:00',NULL,'2022-08-31 08:13:01','2022-08-31 08:13:01'),(1564860297560530945,1010144009236186209,1010142916737434337,6,1010191621448484833,1564860296222294017,NULL,NULL,'2022-08-31 14:20:00','2022-08-31 15:37:52','2022-08-31 14:30:00','2022-08-31 15:38:02','2022-08-31 14:19:03','2022-08-31 14:19:03'),(1564860310474792962,1010144009236186209,1010142916737434337,6,1010250185638660993,1564860296222294017,NULL,NULL,'2022-08-31 14:20:00','2022-08-31 15:37:52','2022-08-31 14:30:00','2022-08-31 15:38:02','2022-08-31 14:19:06','2022-08-31 14:19:06'),(1564877900945367042,996725895563695297,996785261423634945,6,1010191621448484833,1564877900622151682,NULL,NULL,'2022-08-31 15:40:00','2022-08-31 15:38:42','2022-08-31 16:40:00','2022-08-31 15:38:47','2022-08-31 15:29:00','2022-08-31 15:29:00'),(1564877901226385410,996725895563695297,996785261423634945,6,1010250185638660993,1564877900622151682,NULL,NULL,'2022-08-31 15:40:00','2022-08-31 15:38:42','2022-08-31 16:40:00','2022-08-31 15:38:47','2022-08-31 15:29:00','2022-08-31 15:29:00'),(1564883186250752001,996785261423634945,1006252890226880993,6,1010191621448484833,1564883185344528385,NULL,NULL,'2022-08-31 15:55:00','2022-08-31 15:50:36','2022-08-31 16:55:00','2022-08-31 15:50:43','2022-08-31 15:50:00','2022-08-31 15:50:00'),(1564883187416768514,996785261423634945,1006252890226880993,6,1010250185638660993,1564883185344528385,NULL,NULL,'2022-08-31 15:55:00','2022-08-31 15:50:36','2022-08-31 16:55:00','2022-08-31 15:50:43','2022-08-31 15:50:01','2022-08-31 15:50:01'),(1564885453813129218,1006252890226880993,996785261423634945,6,1010191621448484833,1564885453120815106,NULL,NULL,'2022-08-31 16:11:00','2022-08-31 15:59:11','2022-08-31 17:11:00','2022-08-31 18:34:07','2022-08-31 15:59:01','2022-08-31 15:59:01'),(1564885454266114050,1006252890226880993,996785261423634945,6,1010250185638660993,1564885453120815106,NULL,NULL,'2022-08-31 16:11:00','2022-08-31 15:59:11','2022-08-31 17:11:00','2022-08-31 18:34:07','2022-08-31 15:59:01','2022-08-31 15:59:01'),(1564886214429188098,996785261423634945,996725895563695297,6,1010191621448484833,1564886211895574530,NULL,NULL,'2022-08-31 16:10:00','2022-08-31 16:02:38','2022-08-31 17:10:00','2022-08-31 18:33:45','2022-08-31 16:02:02','2022-08-31 16:02:02'),(1564886217432309761,996785261423634945,996725895563695297,6,1010250185638660993,1564886211895574530,NULL,NULL,'2022-08-31 16:10:00','2022-08-31 16:02:38','2022-08-31 17:10:00','2022-08-31 18:33:45','2022-08-31 16:02:03','2022-08-31 16:02:03'),(1564921949383368705,996725895563695297,996785261423634945,6,1010191621448484833,1564921948640595970,NULL,NULL,'2022-08-31 18:33:00',NULL,'2022-08-31 19:33:00','2022-08-31 18:26:27','2022-08-31 18:24:02','2022-08-31 18:24:02'),(1564921950637465601,996725895563695297,996785261423634945,6,1010250185638660993,1564921948640595970,NULL,NULL,'2022-08-31 18:33:00',NULL,'2022-08-31 19:33:00','2022-08-31 18:26:27','2022-08-31 18:24:03','2022-08-31 18:24:03'),(1564924208007684097,996785261423634945,1006252890226880993,6,1010191621448484833,1564924206799343618,NULL,NULL,'2022-08-31 18:42:00','2022-08-31 18:34:29','2022-08-31 19:42:00','2022-08-31 18:34:39','2022-08-31 18:33:01','2022-08-31 18:33:01'),(1564924208792018945,996785261423634945,1006252890226880993,6,1010250185638660993,1564924206799343618,NULL,NULL,'2022-08-31 18:42:00','2022-08-31 18:34:29','2022-08-31 19:42:00','2022-08-31 18:34:39','2022-08-31 18:33:01','2022-08-31 18:33:01'),(1564925472124772354,1006252890226880993,996785261423634945,6,1010191621448484833,1564925469783969793,NULL,NULL,'2022-08-31 18:44:00','2022-08-31 18:38:37','2022-08-31 19:44:00','2022-08-31 18:38:47','2022-08-31 18:38:02','2022-08-31 18:38:02'),(1564925473890574337,1006252890226880993,996785261423634945,6,1010250185638660993,1564925469783969793,NULL,NULL,'2022-08-31 18:44:00','2022-08-31 18:38:37','2022-08-31 19:44:00','2022-08-31 18:38:47','2022-08-31 18:38:03','2022-08-31 18:38:03'),(1564925968403210242,996785261423634945,996725895563695297,6,1010191621448484833,1564925968000176129,NULL,NULL,'2022-08-31 18:47:00','2022-08-31 18:40:32','2022-08-31 19:47:00','2022-08-31 18:40:44','2022-08-31 18:40:00','2022-08-31 18:40:00'),(1564925969099464706,996785261423634945,996725895563695297,6,1010250185638660993,1564925968000176129,NULL,NULL,'2022-08-31 18:47:00','2022-08-31 18:40:32','2022-08-31 19:47:00','2022-08-31 18:40:44','2022-08-31 18:40:01','2022-08-31 18:40:01'),(1564941067562065922,996725895563695297,996785261423634945,6,1010191621448484833,1564941066676686849,NULL,NULL,'2022-08-31 19:50:00','2022-08-31 19:40:18','2022-08-31 20:50:00','2022-08-31 19:40:23','2022-08-31 19:40:00','2022-08-31 19:40:00'),(1564941068044410881,996725895563695297,996785261423634945,6,1010250185638660993,1564941066676686849,NULL,NULL,'2022-08-31 19:50:00','2022-08-31 19:40:18','2022-08-31 20:50:00','2022-08-31 19:40:23','2022-08-31 19:40:00','2022-08-31 19:40:00'),(1564943335346741250,996785261423634945,1006252890226880993,6,1010191621448484833,1564943334285201409,NULL,NULL,'2022-08-31 19:56:00','2022-08-31 19:49:28','2022-08-31 20:56:00','2022-08-31 19:49:48','2022-08-31 19:49:01','2022-08-31 19:49:01'),(1564943335812308993,996785261423634945,1006252890226880993,6,1010250185638660993,1564943334285201409,NULL,NULL,'2022-08-31 19:56:00','2022-08-31 19:49:28','2022-08-31 20:56:00','2022-08-31 19:49:48','2022-08-31 19:49:01','2022-08-31 19:49:01'),(1564947865283141633,1006252890226880993,996785261423634945,4,1010191621448484833,1564947864590700546,NULL,NULL,'2022-08-31 20:13:00','2022-09-01 11:56:00','2022-08-31 21:13:00','2022-09-01 11:56:21','2022-08-31 20:07:01','2022-08-31 20:07:01'),(1564947865979396098,1006252890226880993,996785261423634945,4,1010250185638660993,1564947864590700546,NULL,NULL,'2022-08-31 20:13:00','2022-09-01 11:56:00','2022-08-31 21:13:00','2022-09-01 11:56:21','2022-08-31 20:07:01','2022-08-31 20:07:01'),(1565125029173469186,996725895563695297,996785261423634945,1,1006930511861656865,1565125028632023042,NULL,NULL,'2022-09-01 09:51:00',NULL,'2022-09-01 10:51:00',NULL,'2022-09-01 07:51:00','2022-09-01 07:51:00'),(1565125030150742018,996725895563695297,996785261423634945,1,1010190982911837697,1565125028632023042,NULL,NULL,'2022-09-01 09:51:00',NULL,'2022-09-01 10:51:00',NULL,'2022-09-01 07:51:00','2022-09-01 07:51:00'),(1565125030670835713,996725895563695297,996785261423634945,1,1010250583241903297,1565125028632023042,NULL,NULL,'2022-09-01 09:51:00',NULL,'2022-09-01 10:51:00',NULL,'2022-09-01 07:51:01','2022-09-01 07:51:01'),(1565130565411479553,996785261423634945,996725895563695297,1,1010190982911837697,1565130565213966337,NULL,NULL,'2022-09-01 10:13:00',NULL,'2022-09-01 11:13:00',NULL,'2022-09-01 08:13:00','2022-09-01 08:13:00'),(1565130565881241602,996785261423634945,996725895563695297,1,1010250583241903297,1565130565213966337,NULL,NULL,'2022-09-01 10:13:00',NULL,'2022-09-01 11:13:00',NULL,'2022-09-01 08:13:00','2022-09-01 08:13:00'),(1565247844673462273,1010154300397261281,1010142916737434337,1,1010190982911837697,1565247839485235201,NULL,NULL,'2022-09-01 15:55:00',NULL,'2022-09-01 16:05:00',NULL,'2022-09-01 15:59:02','2022-09-01 15:59:02'),(1565247845160001538,1010154300397261281,1010142916737434337,1,1010250583241903297,1565247839485235201,NULL,NULL,'2022-09-01 15:55:00',NULL,'2022-09-01 16:05:00',NULL,'2022-09-01 15:59:02','2022-09-01 15:59:02'),(1565487436458696706,996725895563695297,996785261423634945,1,1006930511861656865,1565487435989614594,NULL,NULL,'2022-09-02 09:51:00',NULL,'2022-09-02 10:51:00',NULL,'2022-09-02 07:51:05','2022-09-02 07:51:05'),(1565487438790729729,996725895563695297,996785261423634945,1,1010190982911837697,1565487435989614594,NULL,NULL,'2022-09-02 09:51:00',NULL,'2022-09-02 10:51:00',NULL,'2022-09-02 07:51:05','2022-09-02 07:51:05'),(1565487441068236801,996725895563695297,996785261423634945,1,1010250583241903297,1565487435989614594,NULL,NULL,'2022-09-02 09:51:00',NULL,'2022-09-02 10:51:00',NULL,'2022-09-02 07:51:06','2022-09-02 07:51:06'),(1565492955495866369,996785261423634945,996725895563695297,1,1010190982911837697,1565492954594770946,NULL,NULL,'2022-09-02 10:13:00',NULL,'2022-09-02 11:13:00',NULL,'2022-09-02 08:13:01','2022-09-02 08:13:01'),(1565492955948851202,996785261423634945,996725895563695297,1,1010250583241903297,1565492954594770946,NULL,NULL,'2022-09-02 10:13:00',NULL,'2022-09-02 11:13:00',NULL,'2022-09-02 08:13:01','2022-09-02 08:13:01'),(1565537766236037121,996725895563695297,996785261423634945,6,1015194862758244801,1565537765142003713,NULL,NULL,'2022-09-02 11:18:00','2022-09-02 11:13:05','2022-09-02 12:18:00','2022-09-02 11:13:24','2022-09-02 11:11:04','2022-09-02 11:11:04'),(1565537768794562562,996725895563695297,996785261423634945,6,1015194994115458945,1565537765142003713,NULL,NULL,'2022-09-02 11:18:00','2022-09-02 11:13:05','2022-09-02 12:18:00','2022-09-02 11:13:24','2022-09-02 11:11:05','2022-09-02 11:11:05'),(1565539010128191490,996785261423634945,1006252890226880993,6,1015194862758244801,1565539008312737794,NULL,NULL,'2022-09-02 11:27:00','2022-09-02 11:16:46','2022-09-02 12:27:00','2022-09-02 11:16:52','2022-09-02 11:16:01','2022-09-02 11:16:01'),(1565539011336151041,996785261423634945,1006252890226880993,6,1015194994115458945,1565539008312737794,NULL,NULL,'2022-09-02 11:27:00','2022-09-02 11:16:46','2022-09-02 12:27:00','2022-09-02 11:16:52','2022-09-02 11:16:01','2022-09-02 11:16:01'),(1565541778851176450,1006252890226880993,996785261423634945,6,1015194862758244801,1565541778226905089,NULL,NULL,'2022-09-02 11:34:00','2022-09-02 11:27:21','2022-09-02 12:34:00','2022-09-02 11:27:31','2022-09-02 11:27:01','2022-09-02 11:27:01'),(1565541780252073986,1006252890226880993,996785261423634945,6,1015194994115458945,1565541778226905089,NULL,NULL,'2022-09-02 11:34:00','2022-09-02 11:27:21','2022-09-02 12:34:00','2022-09-02 11:27:31','2022-09-02 11:27:01','2022-09-02 11:27:01'),(1565542532303364098,996785261423634945,996725895563695297,6,1015194862758244801,1565542531515514881,NULL,NULL,'2022-09-02 11:38:00','2022-09-02 11:30:11','2022-09-02 12:38:00','2022-09-02 11:30:17','2022-09-02 11:30:01','2022-09-02 11:30:01'),(1565542533104476161,996785261423634945,996725895563695297,6,1015194994115458945,1565542531515514881,NULL,NULL,'2022-09-02 11:38:00','2022-09-02 11:30:11','2022-09-02 12:38:00','2022-09-02 11:30:17','2022-09-02 11:30:01','2022-09-02 11:30:01'),(1566706731641544705,1010142916737434337,1010154300397261281,6,1015307902115969377,1566706724889395201,NULL,NULL,'2022-09-05 18:36:00','2022-09-05 16:38:56','2022-09-05 18:46:00','2022-09-05 17:00:18','2022-09-05 16:36:07','2022-09-05 16:36:07'),(1566706733734502401,1010142916737434337,1010154300397261281,6,1015308917598912481,1566706724889395201,NULL,NULL,'2022-09-05 18:36:00','2022-09-05 16:38:56','2022-09-05 18:46:00','2022-09-05 17:00:18','2022-09-05 16:36:08','2022-09-05 16:36:08'),(1567063074734006273,1010154300397261281,1010142916737434337,1,1010190982911837697,1567063070474264577,NULL,NULL,'2022-09-06 18:12:00',NULL,'2022-09-06 18:22:00',NULL,'2022-09-06 16:12:06','2022-09-06 16:12:06'),(1567063076747272193,1010154300397261281,1010142916737434337,1,1010250583241903297,1567063070474264577,NULL,NULL,'2022-09-06 18:12:00',NULL,'2022-09-06 18:22:00',NULL,'2022-09-06 16:12:07','2022-09-06 16:12:07'),(1567440798283653122,1010142916737434337,1010154300397261281,6,1015307902115969377,1567440795987226625,NULL,NULL,'2022-09-07 19:13:00','2022-09-08 09:14:20','2022-09-07 19:28:00','2022-09-08 09:14:52','2022-09-07 17:13:03','2022-09-07 17:13:03'),(1567440800225615873,1010142916737434337,1010154300397261281,6,1015308917598912481,1567440795987226625,NULL,NULL,'2022-09-07 19:13:00','2022-09-08 09:14:20','2022-09-07 19:28:00','2022-09-08 09:14:52','2022-09-07 17:13:03','2022-09-07 17:13:03'),(1567440805011316738,1010142916737434337,1010154300397261281,6,1017106905216155137,1567440795987226625,NULL,NULL,'2022-09-07 19:13:00','2022-09-08 09:14:20','2022-09-07 19:28:00','2022-09-08 09:14:52','2022-09-07 17:13:04','2022-09-07 17:13:04');
/*!40000 ALTER TABLE `sl_driver_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `undo_log`
--

DROP TABLE IF EXISTS `undo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `undo_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `branch_id` bigint NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `context` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int NOT NULL,
  `log_created` datetime NOT NULL,
  `log_modified` datetime NOT NULL,
  `ext` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ux_undo_log` (`xid`,`branch_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1101 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undo_log`
--

LOCK TABLES `undo_log` WRITE;
/*!40000 ALTER TABLE `undo_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `undo_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sl_driver'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-27 19:57:43
