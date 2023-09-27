-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 192.168.150.101    Database: sl_sms
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
-- Table structure for table `sl_sms_record`
--

DROP TABLE IF EXISTS `sl_sms_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sl_sms_record` (
  `id` bigint NOT NULL COMMENT '短信发送记录id',
  `send_channel_id` bigint NOT NULL COMMENT '发送通道id，对应sl_sms_third_channel的主键',
  `batch_id` bigint NOT NULL COMMENT '发送批次id，用于判断这些数据是同一批次发送的',
  `app_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '发起发送请求的微服务名称，如：sl-express-ms-work',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `sms_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '短信内容，一般为json格式的参数数据，用于填充短信模板中的占位符参数',
  `status` int NOT NULL COMMENT '发送状态，1：成功，2：失败',
  `created` datetime NOT NULL COMMENT '创建时间',
  `updated` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `created` (`created`) USING BTREE,
  KEY `batch_id` (`batch_id`) USING BTREE,
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='短信发送记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_sms_record`
--

LOCK TABLES `sl_sms_record` WRITE;
/*!40000 ALTER TABLE `sl_sms_record` DISABLE KEYS */;
INSERT INTO `sl_sms_record` VALUES (1633008675024318466,1552846618315661316,1633008674902683649,'sl-express-ms-work','12345678901','123',1,'2023-03-07 15:36:23','2023-03-07 15:36:23'),(1633008675041095682,1552846618315661316,1633008674902683649,'sl-express-ms-work','12345678902','123',1,'2023-03-07 15:36:23','2023-03-07 15:36:23'),(1633014969605042177,1552846618315661316,1633014969521156098,'sl-express-ms-work','12345678901','123',1,'2023-03-07 16:01:23','2023-03-07 16:01:23'),(1633014969621819393,1552846618315661316,1633014969521156098,'sl-express-ms-work','12345678902','123',1,'2023-03-07 16:01:23','2023-03-07 16:01:23'),(1633026301519785985,1552846618315661316,1633026301360402433,'sl-express-ms-work','13888888888','测试短信',1,'2023-03-07 16:46:25','2023-03-07 16:46:25');
/*!40000 ALTER TABLE `sl_sms_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_sms_third_channel`
--

DROP TABLE IF EXISTS `sl_sms_third_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sl_sms_third_channel` (
  `id` bigint NOT NULL COMMENT '主键id',
  `sms_type` int NOT NULL COMMENT '短信类型，1：验证类型短信，2：通知类型短信',
  `content_type` int NOT NULL COMMENT '内容类型，1:文字短信，2：语音短信',
  `sms_code` int NOT NULL COMMENT '短信code，短信微服务发放的code，与sms_code是一对多的关系',
  `template_code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '第三方平台模板code',
  `send_channel` int NOT NULL COMMENT '第三方短信平台码',
  `sign_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '签名',
  `sms_priority` int NOT NULL COMMENT '数字越大优先级越高',
  `account` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '三方平台对应的账户信息，如：accessKeyId、accessKeySecret等，以json格式存储，使用时自行解析',
  `status` int NOT NULL COMMENT '通道状态1：使用 中，2：已经停用',
  `created` datetime NOT NULL COMMENT '创建时间',
  `updated` datetime NOT NULL COMMENT '更新时间',
  `is_delete` bit(1) NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `created` (`created`) USING BTREE,
  KEY `sms_priority` (`sms_priority`),
  KEY `index_type` (`sms_type`,`content_type`,`sms_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='短信发送通道';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_sms_third_channel`
--

LOCK TABLES `sl_sms_third_channel` WRITE;
/*!40000 ALTER TABLE `sl_sms_third_channel` DISABLE KEYS */;
INSERT INTO `sl_sms_third_channel` VALUES (1552846618315661316,1,1,1001,'SMS_205474767',1,'神领物流',1,'{\"accessKeyId\":\"xxxxxxx\",\"accessKeySecret\":\"xxxxxxx\",\"endpoint\":\"dysmsapi.aliyuncs.com\"}',1,'2023-03-07 08:54:58','2023-03-07 08:55:00',_binary '\0');
/*!40000 ALTER TABLE `sl_sms_third_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sl_sms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-27 19:57:44
