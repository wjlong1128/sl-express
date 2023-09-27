-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 192.168.150.101    Database: sl_carriage
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
-- Table structure for table `sl_carriage`
--

DROP TABLE IF EXISTS `sl_carriage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sl_carriage` (
  `id` bigint NOT NULL COMMENT '运费模板id',
  `template_type` tinyint NOT NULL COMMENT '模板类型，1-同城寄 2-省内寄 3-经济区互寄 4-跨省',
  `transport_type` tinyint NOT NULL COMMENT '运送类型，1-普快 2-特快',
  `associated_city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联城市，1-全国 2-京津冀 3-江浙沪 4-川渝 5-黑吉辽',
  `first_weight` double NOT NULL COMMENT '首重价格',
  `continuous_weight` double NOT NULL DEFAULT '1' COMMENT '续重价格',
  `light_throwing_coefficient` int NOT NULL COMMENT '轻抛系数',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='运费模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_carriage`
--

LOCK TABLES `sl_carriage` WRITE;
/*!40000 ALTER TABLE `sl_carriage` DISABLE KEYS */;
INSERT INTO `sl_carriage` VALUES (18,3,1,'2',12,5,6000,'2022-07-12 14:13:01','2022-07-29 10:19:58'),(30,2,1,'1',12,3,8000,'2022-07-20 16:29:07','2022-07-20 16:29:07'),(1556209394973114370,3,1,'3',13,5,6000,'2022-08-07 17:23:27','2022-08-07 17:23:27'),(1564798093038030850,3,1,'4',22,12,8000,'2022-08-31 10:11:53','2022-09-28 14:22:51'),(1569529619629838338,4,1,'1',18,5,12000,'2022-09-13 11:33:16','2022-09-13 11:33:16'),(1569529951348953090,3,1,'5',12,5,12000,'2022-09-13 11:34:36','2022-09-13 11:34:36'),(1702874079557693442,1,1,'1',12,2,12000,'2023-09-16 10:36:33','2023-09-16 10:36:33');
/*!40000 ALTER TABLE `sl_carriage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sl_carriage'
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
