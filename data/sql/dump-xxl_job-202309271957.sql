-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 192.168.150.101    Database: xxl_job
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
-- Table structure for table `xxl_job_group`
--

DROP TABLE IF EXISTS `xxl_job_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行器名称',
  `address_type` tinyint NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_group`
--

LOCK TABLES `xxl_job_group` WRITE;
/*!40000 ALTER TABLE `xxl_job_group` DISABLE KEYS */;
INSERT INTO `xxl_job_group` VALUES (1,'xxl-job-executor-sample','示例执行器',0,NULL,'2023-09-27 19:57:37'),(4,'sl-express-ms-base','基础微服务',0,NULL,'2023-09-27 19:57:37');
/*!40000 ALTER TABLE `xxl_job_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_info`
--

DROP TABLE IF EXISTS `xxl_job_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint NOT NULL DEFAULT '0' COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint NOT NULL DEFAULT '0' COMMENT '上次调度时间',
  `trigger_next_time` bigint NOT NULL DEFAULT '0' COMMENT '下次调度时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_info`
--

LOCK TABLES `xxl_job_info` WRITE;
/*!40000 ALTER TABLE `xxl_job_info` DISABLE KEYS */;
INSERT INTO `xxl_job_info` VALUES (1,1,'测试任务1','2018-11-03 22:21:31','2018-11-03 22:21:31','XXL','','CRON','0 0 0 * * ? *','DO_NOTHING','FIRST','demoJobHandler','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2018-11-03 22:21:31','',0,0,0),(3,4,'处理错误消息','2022-05-15 15:06:50','2022-07-23 21:44:02','张志君','','CRON','* 0/10 * * * ?','DO_NOTHING','ROUND','failMsgJob','','SERIAL_EXECUTION',0,0,'BEAN','','GLUE代码初始化','2022-05-15 15:06:50','',0,0,0);
/*!40000 ALTER TABLE `xxl_job_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_lock`
--

DROP TABLE IF EXISTS `xxl_job_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_lock` (
  `lock_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_lock`
--

LOCK TABLES `xxl_job_lock` WRITE;
/*!40000 ALTER TABLE `xxl_job_lock` DISABLE KEYS */;
INSERT INTO `xxl_job_lock` VALUES ('schedule_lock');
/*!40000 ALTER TABLE `xxl_job_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_log`
--

DROP TABLE IF EXISTS `xxl_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job_group` int NOT NULL COMMENT '执行器主键ID',
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int NOT NULL COMMENT '调度-结果',
  `trigger_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '调度-日志',
  `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int NOT NULL COMMENT '执行-状态',
  `handle_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '执行-日志',
  `alarm_status` tinyint NOT NULL DEFAULT '0' COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `I_trigger_time` (`trigger_time`) USING BTREE,
  KEY `I_handle_code` (`handle_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_log`
--

LOCK TABLES `xxl_job_log` WRITE;
/*!40000 ALTER TABLE `xxl_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_log_report`
--

DROP TABLE IF EXISTS `xxl_job_log_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_log_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime DEFAULT NULL COMMENT '调度-时间',
  `running_count` int NOT NULL DEFAULT '0' COMMENT '运行中-日志数量',
  `suc_count` int NOT NULL DEFAULT '0' COMMENT '执行成功-日志数量',
  `fail_count` int NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `i_trigger_day` (`trigger_day`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_log_report`
--

LOCK TABLES `xxl_job_log_report` WRITE;
/*!40000 ALTER TABLE `xxl_job_log_report` DISABLE KEYS */;
INSERT INTO `xxl_job_log_report` VALUES (1,'2022-04-27 00:00:00',0,0,0,NULL),(2,'2022-04-26 00:00:00',0,0,0,NULL),(3,'2022-04-25 00:00:00',0,0,0,NULL),(4,'2022-04-28 00:00:00',0,0,0,NULL),(5,'2022-04-29 00:00:00',0,0,0,NULL),(6,'2022-04-30 00:00:00',0,0,0,NULL),(7,'2022-05-01 00:00:00',0,0,0,NULL),(8,'2022-05-02 00:00:00',0,0,0,NULL),(9,'2022-05-03 00:00:00',0,0,0,NULL),(10,'2022-05-04 00:00:00',0,0,0,NULL),(11,'2022-05-05 00:00:00',0,0,0,NULL),(12,'2022-05-06 00:00:00',0,0,0,NULL),(13,'2022-05-07 00:00:00',0,0,0,NULL),(14,'2022-05-08 00:00:00',0,0,0,NULL),(15,'2022-05-09 00:00:00',0,0,0,NULL),(16,'2022-05-10 00:00:00',0,0,0,NULL),(17,'2022-05-11 00:00:00',0,0,0,NULL),(18,'2022-05-12 00:00:00',0,0,0,NULL),(19,'2022-05-13 00:00:00',0,0,0,NULL),(20,'2022-05-14 00:00:00',0,10,4,NULL),(21,'2022-05-15 00:00:00',0,9,2,NULL),(22,'2022-05-16 00:00:00',0,4,0,NULL),(23,'2022-05-17 00:00:00',0,20,0,NULL),(24,'2022-05-18 00:00:00',0,0,0,NULL),(25,'2022-05-19 00:00:00',0,0,0,NULL),(26,'2022-05-20 00:00:00',0,6,2,NULL),(27,'2022-05-21 00:00:00',0,9,0,NULL),(28,'2022-05-22 00:00:00',0,0,0,NULL),(29,'2022-05-23 00:00:00',0,0,0,NULL),(30,'2022-05-24 00:00:00',0,0,0,NULL),(31,'2022-05-25 00:00:00',0,0,0,NULL),(32,'2022-05-26 00:00:00',0,0,0,NULL),(33,'2022-05-27 00:00:00',0,0,0,NULL),(34,'2022-05-28 00:00:00',0,0,0,NULL),(35,'2022-05-29 00:00:00',0,0,0,NULL),(36,'2022-05-30 00:00:00',0,0,0,NULL),(37,'2022-05-31 00:00:00',0,0,0,NULL),(38,'2022-06-01 00:00:00',0,0,0,NULL),(39,'2022-06-02 00:00:00',0,0,0,NULL),(40,'2022-06-03 00:00:00',0,0,0,NULL),(41,'2022-06-04 00:00:00',0,0,0,NULL),(42,'2022-06-05 00:00:00',0,0,0,NULL),(43,'2022-06-06 00:00:00',0,0,0,NULL),(44,'2022-06-07 00:00:00',0,0,0,NULL),(45,'2022-06-08 00:00:00',0,0,0,NULL),(46,'2022-06-09 00:00:00',0,0,0,NULL),(47,'2022-06-10 00:00:00',0,0,0,NULL),(48,'2022-06-11 00:00:00',0,0,0,NULL),(49,'2022-06-12 00:00:00',0,0,0,NULL),(50,'2022-06-13 00:00:00',0,0,0,NULL),(51,'2022-06-14 00:00:00',0,0,0,NULL),(52,'2022-06-15 00:00:00',0,0,0,NULL),(53,'2022-06-16 00:00:00',0,0,0,NULL),(54,'2022-06-17 00:00:00',0,0,0,NULL),(55,'2022-06-18 00:00:00',0,0,0,NULL),(56,'2022-06-19 00:00:00',0,0,0,NULL),(57,'2022-06-20 00:00:00',0,0,0,NULL),(58,'2022-06-21 00:00:00',0,0,0,NULL),(59,'2022-06-22 00:00:00',0,0,0,NULL),(60,'2022-06-23 00:00:00',0,0,0,NULL),(61,'2022-06-24 00:00:00',0,0,0,NULL),(62,'2022-06-25 00:00:00',0,0,0,NULL),(63,'2022-06-26 00:00:00',0,0,0,NULL),(64,'2022-06-27 00:00:00',0,0,0,NULL),(65,'2022-06-28 00:00:00',0,0,0,NULL),(66,'2022-06-29 00:00:00',0,0,0,NULL),(67,'2022-06-30 00:00:00',0,0,0,NULL),(68,'2022-07-01 00:00:00',0,0,0,NULL),(69,'2022-07-02 00:00:00',0,0,0,NULL),(70,'2022-07-03 00:00:00',0,0,0,NULL),(71,'2022-07-04 00:00:00',0,0,0,NULL),(72,'2022-07-05 00:00:00',0,0,0,NULL),(73,'2022-07-06 00:00:00',0,0,0,NULL),(74,'2022-07-07 00:00:00',0,0,0,NULL),(75,'2022-07-08 00:00:00',0,3,0,NULL),(76,'2022-07-09 00:00:00',0,0,0,NULL),(77,'2022-07-10 00:00:00',0,0,0,NULL),(78,'2022-07-11 00:00:00',0,0,0,NULL),(79,'2022-07-12 00:00:00',0,0,0,NULL),(80,'2022-07-13 00:00:00',0,0,0,NULL),(81,'2022-07-14 00:00:00',0,0,0,NULL),(82,'2022-07-15 00:00:00',0,0,0,NULL),(83,'2022-07-16 00:00:00',0,0,0,NULL),(84,'2022-07-17 00:00:00',0,0,0,NULL),(85,'2022-07-18 00:00:00',0,0,0,NULL),(86,'2022-07-19 00:00:00',0,0,0,NULL),(87,'2022-07-20 00:00:00',0,0,0,NULL),(88,'2022-07-21 00:00:00',0,0,0,NULL),(89,'2022-07-22 00:00:00',0,0,0,NULL),(90,'2022-07-23 00:00:00',0,0,0,NULL),(91,'2022-07-24 00:00:00',0,0,0,NULL),(92,'2022-07-25 00:00:00',0,0,0,NULL),(93,'2022-07-26 00:00:00',0,0,0,NULL),(94,'2022-07-27 00:00:00',0,0,0,NULL),(95,'2022-07-28 00:00:00',0,0,0,NULL),(96,'2022-07-29 00:00:00',0,0,0,NULL),(97,'2022-07-30 00:00:00',0,0,0,NULL),(98,'2022-07-31 00:00:00',0,0,0,NULL),(99,'2022-08-01 00:00:00',0,0,0,NULL),(100,'2022-08-02 00:00:00',0,0,0,NULL),(101,'2022-08-03 00:00:00',0,0,0,NULL),(102,'2022-08-04 00:00:00',0,0,0,NULL),(103,'2022-08-05 00:00:00',0,0,0,NULL),(104,'2022-08-06 00:00:00',0,0,0,NULL),(105,'2022-08-07 00:00:00',0,0,0,NULL),(106,'2022-08-08 00:00:00',0,0,0,NULL),(107,'2022-08-09 00:00:00',0,0,0,NULL),(108,'2022-08-10 00:00:00',0,0,0,NULL),(109,'2022-08-11 00:00:00',0,0,0,NULL),(110,'2022-08-12 00:00:00',0,0,0,NULL),(111,'2022-08-13 00:00:00',0,0,0,NULL),(112,'2022-08-14 00:00:00',0,0,0,NULL),(113,'2022-08-15 00:00:00',0,0,0,NULL),(114,'2022-08-16 00:00:00',0,0,0,NULL),(115,'2022-08-17 00:00:00',0,0,0,NULL),(116,'2022-08-18 00:00:00',0,0,0,NULL),(117,'2022-08-19 00:00:00',0,0,0,NULL),(118,'2022-08-20 00:00:00',0,0,0,NULL),(119,'2022-08-21 00:00:00',0,0,0,NULL),(120,'2022-08-22 00:00:00',0,0,0,NULL),(121,'2022-08-23 00:00:00',0,0,0,NULL),(122,'2022-08-24 00:00:00',0,0,0,NULL),(123,'2022-08-25 00:00:00',0,0,0,NULL),(124,'2022-08-26 00:00:00',0,0,0,NULL),(125,'2022-08-27 00:00:00',0,0,0,NULL),(126,'2022-08-28 00:00:00',0,0,0,NULL),(127,'2022-08-29 00:00:00',0,0,0,NULL),(128,'2022-08-30 00:00:00',0,0,0,NULL),(129,'2022-08-31 00:00:00',0,0,0,NULL),(130,'2022-09-01 00:00:00',0,0,0,NULL),(131,'2022-09-02 00:00:00',0,0,0,NULL),(132,'2022-09-03 00:00:00',0,0,0,NULL),(133,'2022-09-04 00:00:00',0,0,0,NULL),(134,'2022-09-05 00:00:00',0,0,0,NULL),(135,'2022-09-06 00:00:00',0,0,0,NULL),(136,'2022-09-07 00:00:00',0,0,0,NULL),(137,'2022-09-08 00:00:00',0,0,0,NULL),(138,'2022-09-09 00:00:00',0,0,0,NULL),(139,'2022-09-10 00:00:00',0,0,0,NULL),(140,'2022-09-11 00:00:00',0,0,0,NULL),(141,'2022-09-12 00:00:00',0,0,0,NULL),(142,'2022-09-13 00:00:00',0,0,0,NULL),(143,'2022-09-14 00:00:00',0,0,0,NULL),(144,'2022-09-15 00:00:00',0,0,0,NULL),(145,'2022-09-16 00:00:00',0,0,0,NULL),(146,'2022-09-17 00:00:00',0,0,0,NULL),(147,'2022-09-18 00:00:00',0,0,0,NULL),(148,'2022-09-19 00:00:00',0,0,0,NULL),(149,'2022-09-20 00:00:00',0,0,0,NULL),(150,'2022-09-21 00:00:00',0,0,0,NULL),(151,'2022-09-22 00:00:00',0,0,0,NULL),(152,'2022-09-23 00:00:00',0,0,0,NULL),(153,'2022-09-24 00:00:00',0,0,0,NULL),(154,'2022-09-25 00:00:00',0,0,0,NULL),(155,'2022-09-26 00:00:00',0,0,0,NULL),(156,'2022-09-27 00:00:00',0,0,0,NULL),(157,'2022-09-28 00:00:00',0,0,0,NULL),(158,'2022-09-29 00:00:00',0,0,0,NULL),(159,'2022-09-30 00:00:00',0,0,0,NULL),(160,'2022-10-01 00:00:00',0,0,0,NULL),(161,'2022-10-02 00:00:00',0,0,0,NULL),(162,'2022-10-03 00:00:00',0,0,0,NULL),(163,'2022-10-04 00:00:00',0,0,0,NULL),(164,'2022-10-05 00:00:00',0,0,0,NULL),(165,'2022-10-06 00:00:00',0,0,0,NULL),(166,'2022-10-07 00:00:00',0,0,0,NULL),(167,'2022-10-08 00:00:00',0,0,0,NULL),(168,'2022-10-09 00:00:00',0,0,0,NULL),(169,'2022-10-10 00:00:00',0,0,0,NULL),(170,'2022-10-11 00:00:00',0,0,0,NULL),(171,'2022-10-12 00:00:00',0,0,0,NULL),(172,'2022-10-13 00:00:00',0,0,0,NULL),(173,'2022-10-14 00:00:00',0,0,0,NULL),(174,'2022-10-15 00:00:00',0,0,0,NULL),(175,'2022-10-16 00:00:00',0,0,0,NULL),(176,'2022-10-17 00:00:00',0,0,0,NULL),(177,'2022-10-18 00:00:00',0,0,0,NULL),(178,'2022-10-19 00:00:00',0,0,0,NULL),(179,'2022-10-20 00:00:00',0,0,0,NULL),(180,'2022-10-21 00:00:00',0,0,0,NULL),(181,'2022-10-22 00:00:00',0,0,0,NULL),(182,'2022-10-23 00:00:00',0,0,0,NULL),(183,'2022-10-24 00:00:00',0,0,0,NULL),(184,'2022-10-25 00:00:00',0,0,0,NULL),(185,'2022-10-26 00:00:00',0,0,0,NULL),(186,'2022-10-27 00:00:00',0,0,0,NULL),(187,'2022-11-07 00:00:00',0,0,0,NULL),(188,'2022-11-06 00:00:00',0,0,0,NULL),(189,'2022-11-05 00:00:00',0,0,0,NULL),(190,'2022-11-10 00:00:00',0,0,0,NULL),(191,'2022-11-09 00:00:00',0,0,0,NULL),(192,'2022-11-08 00:00:00',0,0,0,NULL),(193,'2022-12-13 00:00:00',0,0,0,NULL),(194,'2022-12-12 00:00:00',0,0,0,NULL),(195,'2022-12-11 00:00:00',0,0,0,NULL),(196,'2022-12-14 00:00:00',0,0,0,NULL),(197,'2022-12-15 00:00:00',0,0,0,NULL),(198,'2022-12-16 00:00:00',0,0,0,NULL),(199,'2022-12-17 00:00:00',0,0,0,NULL),(200,'2022-12-18 00:00:00',0,0,0,NULL),(201,'2022-12-19 00:00:00',0,0,0,NULL),(202,'2022-12-20 00:00:00',0,0,0,NULL),(203,'2022-12-21 00:00:00',0,0,0,NULL),(204,'2022-12-22 00:00:00',0,0,0,NULL),(205,'2022-12-23 00:00:00',0,0,0,NULL),(206,'2022-12-24 00:00:00',0,0,0,NULL),(207,'2022-12-25 00:00:00',0,0,0,NULL),(208,'2022-12-26 00:00:00',0,0,0,NULL),(209,'2022-12-27 00:00:00',0,0,0,NULL),(210,'2022-12-28 00:00:00',0,0,0,NULL),(211,'2022-12-29 00:00:00',0,0,0,NULL),(212,'2022-12-30 00:00:00',0,0,0,NULL),(213,'2022-12-31 00:00:00',0,0,0,NULL),(214,'2023-01-01 00:00:00',0,0,0,NULL),(215,'2023-01-02 00:00:00',0,0,0,NULL),(216,'2023-01-03 00:00:00',0,0,0,NULL),(217,'2023-01-04 00:00:00',0,0,0,NULL),(218,'2023-01-05 00:00:00',0,0,0,NULL),(219,'2023-01-10 00:00:00',0,0,0,NULL),(220,'2023-01-09 00:00:00',0,0,0,NULL),(221,'2023-01-08 00:00:00',0,0,0,NULL),(222,'2023-01-11 00:00:00',0,0,0,NULL),(223,'2023-01-14 00:00:00',0,0,0,NULL),(224,'2023-01-13 00:00:00',0,0,0,NULL),(225,'2023-01-12 00:00:00',0,0,0,NULL),(226,'2023-01-29 00:00:00',0,0,0,NULL),(227,'2023-01-28 00:00:00',0,0,0,NULL),(228,'2023-01-27 00:00:00',0,0,0,NULL),(229,'2023-01-30 00:00:00',0,0,0,NULL),(230,'2023-01-31 00:00:00',0,0,0,NULL),(231,'2023-02-01 00:00:00',0,0,0,NULL),(232,'2023-02-02 00:00:00',0,0,0,NULL),(233,'2023-02-03 00:00:00',0,0,0,NULL),(234,'2023-03-03 00:00:00',0,0,0,NULL),(235,'2023-03-02 00:00:00',0,0,0,NULL),(236,'2023-03-01 00:00:00',0,0,0,NULL),(237,'2023-03-06 00:00:00',0,0,0,NULL),(238,'2023-03-05 00:00:00',0,0,0,NULL),(239,'2023-03-04 00:00:00',0,0,0,NULL),(240,'2023-03-07 00:00:00',0,0,0,NULL),(241,'2023-03-08 00:00:00',0,0,0,NULL),(242,'2023-03-09 00:00:00',0,0,0,NULL),(243,'2023-03-10 00:00:00',0,0,0,NULL),(244,'2023-03-11 00:00:00',0,0,0,NULL),(245,'2023-03-12 00:00:00',0,0,0,NULL),(246,'2023-03-13 00:00:00',0,0,0,NULL),(247,'2023-03-14 00:00:00',0,0,0,NULL),(248,'2023-09-14 00:00:00',0,0,0,NULL),(249,'2023-09-13 00:00:00',0,0,0,NULL),(250,'2023-09-12 00:00:00',0,0,0,NULL),(251,'2023-09-15 00:00:00',0,0,0,NULL),(252,'2023-09-16 00:00:00',0,0,0,NULL),(253,'2023-09-17 00:00:00',0,0,0,NULL),(254,'2023-09-18 00:00:00',0,0,0,NULL),(255,'2023-09-19 00:00:00',0,0,0,NULL),(256,'2023-09-22 00:00:00',0,0,0,NULL),(257,'2023-09-21 00:00:00',0,0,0,NULL),(258,'2023-09-20 00:00:00',0,0,0,NULL),(259,'2023-09-23 00:00:00',0,0,0,NULL),(260,'2023-09-24 00:00:00',0,0,0,NULL),(261,'2023-09-25 00:00:00',0,0,0,NULL),(262,'2023-09-26 00:00:00',0,0,0,NULL),(263,'2023-09-27 00:00:00',0,0,0,NULL);
/*!40000 ALTER TABLE `xxl_job_log_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_logglue`
--

DROP TABLE IF EXISTS `xxl_job_logglue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_logglue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_logglue`
--

LOCK TABLES `xxl_job_logglue` WRITE;
/*!40000 ALTER TABLE `xxl_job_logglue` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_logglue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_registry`
--

DROP TABLE IF EXISTS `xxl_job_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_registry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registry_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registry_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `i_g_k_v` (`registry_group`,`registry_key`(191),`registry_value`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_registry`
--

LOCK TABLES `xxl_job_registry` WRITE;
/*!40000 ALTER TABLE `xxl_job_registry` DISABLE KEYS */;
/*!40000 ALTER TABLE `xxl_job_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xxl_job_user`
--

DROP TABLE IF EXISTS `xxl_job_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xxl_job_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `role` tinyint NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `i_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xxl_job_user`
--

LOCK TABLES `xxl_job_user` WRITE;
/*!40000 ALTER TABLE `xxl_job_user` DISABLE KEYS */;
INSERT INTO `xxl_job_user` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e',1,NULL);
/*!40000 ALTER TABLE `xxl_job_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'xxl_job'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-27 19:57:45
