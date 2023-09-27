-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 192.168.150.101    Database: sl_work
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
-- Table structure for table `sl_pickup_dispatch_task`
--

DROP TABLE IF EXISTS `sl_pickup_dispatch_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sl_pickup_dispatch_task` (
  `id` bigint NOT NULL COMMENT 'id',
  `order_id` bigint NOT NULL COMMENT '关联订单id',
  `task_type` tinyint DEFAULT NULL COMMENT '任务类型，1为取件任务，2为派件任务',
  `status` int DEFAULT NULL COMMENT '任务状态，1为新任务、2为已完成、3为已取消',
  `sign_status` int DEFAULT '0' COMMENT '签收状态(0为未签收, 1为已签收，2为拒收)',
  `assigned_status` tinyint NOT NULL COMMENT '任务分配状态(2已分配3待人工分配)',
  `sign_recipient` tinyint DEFAULT '1' COMMENT '签收人，1本人，2代收',
  `agency_id` bigint NOT NULL COMMENT '网点ID',
  `courier_id` bigint DEFAULT NULL COMMENT '快递员ID',
  `estimated_start_time` datetime DEFAULT NULL COMMENT '预计开始时间',
  `actual_start_time` datetime DEFAULT NULL COMMENT '实际开始时间',
  `estimated_end_time` datetime DEFAULT NULL COMMENT '预计完成时间',
  `actual_end_time` datetime DEFAULT NULL COMMENT '实际完成时间',
  `cancel_time` datetime DEFAULT NULL COMMENT '取消时间',
  `cancel_reason` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '取消原因',
  `cancel_reason_description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '取消原因具体描述',
  `mark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint DEFAULT '0' COMMENT '删除：0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `created` (`created`) USING BTREE,
  KEY `task_type` (`task_type`) USING BTREE,
  KEY `courier_id` (`courier_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='取件、派件任务信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_pickup_dispatch_task`
--

LOCK TABLES `sl_pickup_dispatch_task` WRITE;
/*!40000 ALTER TABLE `sl_pickup_dispatch_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_pickup_dispatch_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_transport_order`
--

DROP TABLE IF EXISTS `sl_transport_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sl_transport_order` (
  `id` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'id',
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `status` int DEFAULT NULL COMMENT '运单状态(1.新建 2.已装车 3.运输中 4.到达终端网点 5.已签收 6.拒收)',
  `scheduling_status` int DEFAULT NULL COMMENT '调度状态(1.待调度2.未匹配线路3.已调度)',
  `start_agency_id` bigint DEFAULT NULL COMMENT '起始网点id',
  `end_agency_id` bigint DEFAULT NULL COMMENT '终点网点id',
  `current_agency_id` bigint DEFAULT NULL COMMENT '当前所在机构id',
  `next_agency_id` bigint DEFAULT NULL COMMENT '下一个机构id',
  `transport_line` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '完整的运输路线',
  `total_volume` decimal(32,10) DEFAULT NULL COMMENT '货品总体积',
  `total_weight` decimal(32,10) DEFAULT NULL COMMENT '货品总重量',
  `is_rejection` tinyint(1) DEFAULT NULL COMMENT '是否为拒收运单',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order_id` (`order_id`) USING BTREE,
  KEY `created` (`created`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `scheduling_status` (`scheduling_status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='运单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_transport_order`
--

LOCK TABLES `sl_transport_order` WRITE;
/*!40000 ALTER TABLE `sl_transport_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_transport_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_transport_order_task`
--

DROP TABLE IF EXISTS `sl_transport_order_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sl_transport_order_task` (
  `id` bigint NOT NULL COMMENT 'id',
  `transport_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '运单id',
  `transport_task_id` bigint NOT NULL COMMENT '运输任务id',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `transport_order_id` (`transport_order_id`) USING BTREE,
  KEY `transport_task_id` (`transport_task_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='运单与运输任务关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_transport_order_task`
--

LOCK TABLES `sl_transport_order_task` WRITE;
/*!40000 ALTER TABLE `sl_transport_order_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_transport_order_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sl_transport_task`
--

DROP TABLE IF EXISTS `sl_transport_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sl_transport_task` (
  `id` bigint NOT NULL COMMENT 'id',
  `truck_plan_id` bigint DEFAULT NULL COMMENT '车辆计划id',
  `transport_trips_id` bigint DEFAULT NULL COMMENT '车次id',
  `start_agency_id` bigint NOT NULL COMMENT '起始机构id',
  `end_agency_id` bigint NOT NULL COMMENT '目的机构id',
  `status` int NOT NULL COMMENT '任务状态，1为待执行（对应 未发车）、2为进行中（对应在途）、3为待确认（保留状态）、4为已完成（对应 已交付）、5为已取消',
  `assigned_status` tinyint NOT NULL COMMENT '任务分配状态(1未分配2已分配3待人工分配)',
  `loading_status` int NOT NULL COMMENT '满载状态(1.半载2.满载3.空载)',
  `truck_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '车辆id',
  `cargo_pick_up_picture` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '提货凭证',
  `cargo_picture` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '货物照片',
  `transport_certificate` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '运回单凭证',
  `deliver_picture` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '交付货物照片',
  `delivery_latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '提货纬度值',
  `delivery_longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '提货经度值',
  `deliver_latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '交付纬度值',
  `deliver_longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '交付经度值',
  `plan_departure_time` datetime DEFAULT NULL COMMENT '计划发车时间',
  `actual_departure_time` datetime DEFAULT NULL COMMENT '实际发车时间',
  `plan_arrival_time` datetime DEFAULT NULL COMMENT '计划到达时间',
  `actual_arrival_time` datetime DEFAULT NULL COMMENT '实际到达时间',
  `mark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  `distance` double DEFAULT NULL COMMENT '距离，单位：米',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `transport_trips_id` (`truck_plan_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='运输任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sl_transport_task`
--

LOCK TABLES `sl_transport_task` WRITE;
/*!40000 ALTER TABLE `sl_transport_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `sl_transport_task` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `undo_log`
--

LOCK TABLES `undo_log` WRITE;
/*!40000 ALTER TABLE `undo_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `undo_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sl_work'
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
