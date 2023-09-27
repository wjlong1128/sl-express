-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 192.168.150.101    Database: sl_users
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
-- Table structure for table `sl_address_book`
--

DROP TABLE IF EXISTS `sl_address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sl_address_book` (
  `id` bigint NOT NULL COMMENT 'id',
  `user_id` bigint DEFAULT NULL COMMENT '用户id',
  `type` tinyint(1) DEFAULT '1' COMMENT '地址簿类型  1寄件 2收件',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电话号',
  `extension_number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分机号',
  `province_id` bigint DEFAULT NULL COMMENT '所属省份id',
  `city_id` bigint DEFAULT NULL COMMENT '所属城市id',
  `county_id` bigint DEFAULT NULL COMMENT '所属区县id',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '详细地址',
  `company_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '公司名称',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否展示 0:否，1:是',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认 0:否，1:是',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='地址簿';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_address_book`
--

LOCK TABLES `sl_address_book` WRITE;
/*!40000 ALTER TABLE `sl_address_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_member`
--

DROP TABLE IF EXISTS `sl_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sl_member` (
  `id` bigint NOT NULL COMMENT 'id',
  `auth_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '统一认证id',
  `id_card_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '身份证号',
  `id_card_no_verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '身份证号是否验证0：未验证 1：验证通过 2：验证未通过',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机号',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `open_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '微信openID',
  `sex` tinyint DEFAULT NULL COMMENT '性别 1-男，0-女',
  `birthday` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '生日',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `auth_id` (`auth_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_member`
--

LOCK TABLES `sl_member` WRITE;
/*!40000 ALTER TABLE `sl_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sl_users'
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
