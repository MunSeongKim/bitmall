-- MySQL dump 10.13  Distrib 5.1.44, for Win64 (unknown)
--
-- Host: localhost    Database: bitmall
-- ------------------------------------------------------
-- Server version	5.1.44-community

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `o_no` int(11) NOT NULL,
  `bank` varchar(10) NOT NULL,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`o_no`),
  CONSTRAINT `FK_order_TO_account` FOREIGN KEY (`o_no`) REFERENCES `order` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'1','홍길동'),(9,'1','1');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `content` varchar(1024) NOT NULL,
  `group_no` int(11) NOT NULL,
  `order_no` int(11) NOT NULL,
  `depth` int(11) NOT NULL,
  `reg_date` date DEFAULT NULL,
  `u_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `FK_member_TO_board` (`u_id`),
  CONSTRAINT `FK_member_TO_board` FOREIGN KEY (`u_id`) REFERENCES `member` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `o_no` int(11) NOT NULL,
  `no` varchar(20) NOT NULL,
  `bank` varchar(10) NOT NULL,
  `due_date` varchar(8) NOT NULL,
  `password` int(2) NOT NULL,
  `installment` int(11) NOT NULL,
  PRIMARY KEY (`o_no`),
  CONSTRAINT `FK_order_TO_card` FOREIGN KEY (`o_no`) REFERENCES `order` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (2,'1111-1111-1111-1111','2','11/11',11,12);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `u_id` varchar(20) NOT NULL,
  `p_code` varchar(20) NOT NULL,
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`u_id`,`p_code`),
  KEY `FK_product_TO_cart` (`p_code`),
  CONSTRAINT `FK_product_TO_cart` FOREIGN KEY (`p_code`) REFERENCES `product` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_member_TO_cart` FOREIGN KEY (`u_id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('admin','AIR FORCE 1 (GS)','2018-04-17'),('hong','AIR FORCE 1 (GS)','2018-04-18');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_suboption`
--

DROP TABLE IF EXISTS `cart_suboption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_suboption` (
  `u_id` varchar(20) NOT NULL,
  `p_code` varchar(20) NOT NULL,
  `so_no` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_id`,`p_code`,`so_no`),
  KEY `FK_suboption_TO_cart_suboption` (`so_no`),
  CONSTRAINT `FK_suboption_TO_cart_suboption` FOREIGN KEY (`so_no`) REFERENCES `suboption` (`no`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_cart_TO_cart_suboption` FOREIGN KEY (`u_id`, `p_code`) REFERENCES `cart` (`u_id`, `p_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_suboption`
--

LOCK TABLES `cart_suboption` WRITE;
/*!40000 ALTER TABLE `cart_suboption` DISABLE KEYS */;
INSERT INTO `cart_suboption` VALUES ('admin','AIR FORCE 1 (GS)',4,1),('hong','AIR FORCE 1 (GS)',5,1);
/*!40000 ALTER TABLE `cart_suboption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `image_path` varchar(100) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'NIKE','/product/images/logo/nike.png'),(6,'ADIDAS','/product/images/logo/adidas.png'),(7,'FILA','/product/images/logo/fila.png');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqboard`
--

DROP TABLE IF EXISTS `faqboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faqboard` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` varchar(256) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqboard`
--

LOCK TABLES `faqboard` WRITE;
/*!40000 ALTER TABLE `faqboard` DISABLE KEYS */;
INSERT INTO `faqboard` VALUES (1,'123','2');
/*!40000 ALTER TABLE `faqboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `name` varchar(10) NOT NULL,
  `birth` varchar(10) DEFAULT NULL,
  `tel` varchar(13) DEFAULT NULL,
  `phone` varchar(13) NOT NULL,
  `zipcode` varchar(7) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `classify` enum('user','admin') NOT NULL,
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('admin','*4ACFE3202A5FF5CF467898FC58AAB1D615029441','관리자','0000-00-00','00-0000-0000','000-0000-0000','000-000','admin','admin@bitmall.com','admin','2018-04-17'),('hong','*23AE809DDACAF96AF0FD78ED04B6A265E05AA257','홍길동','1982-03-01','02-1234-5678','010-1234-5678','464-545','서울시 강남구 역삼동','hong@cafe24.com','user','2018-04-17');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option`
--

LOCK TABLES `option` WRITE;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
INSERT INTO `option` VALUES (1,'사이즈'),(2,'성별');
/*!40000 ALTER TABLE `option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `o_name` varchar(10) NOT NULL,
  `o_tel` varchar(13) NOT NULL,
  `o_phone` varchar(13) NOT NULL,
  `o_email` varchar(50) NOT NULL,
  `o_zipcode` varchar(7) DEFAULT NULL,
  `o_address` varchar(100) NOT NULL,
  `r_name` varchar(10) NOT NULL,
  `r_tel` varchar(13) NOT NULL,
  `r_phone` varchar(13) NOT NULL,
  `r_email` varchar(50) NOT NULL,
  `r_zipcode` varchar(7) DEFAULT NULL,
  `r_address` varchar(100) NOT NULL,
  `require` varchar(256) NOT NULL,
  `pay_type` enum('card','account') NOT NULL,
  `state` varchar(10) NOT NULL,
  `tot_price` int(11) NOT NULL,
  `reg_date` date DEFAULT NULL,
  `u_id` varchar(20) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `FK_member_TO_order` (`u_id`),
  CONSTRAINT `FK_member_TO_order` FOREIGN KEY (`u_id`) REFERENCES `member` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'홍길동','02-1234-5678','010-1234-5678','hong@cafe24.com','464-545','서울시 강남구 역삼동','홍길동','02-1234-5678','010-1234-5678','hong@cafe24.com','464-545','서울시 강남구 역삼동','1','account','1',111500,'2018-04-17','hong'),(2,'홍길동','02-1234-5678','010-1234-5678','hong@cafe24.com','464-545','서울시 강남구 역삼동','홍길동','02-1234-5678','010-1234-5678','hong@cafe24.com','464-545','서울시 강남구 역삼동','123','card','1',656500,'2018-04-17','hong'),(9,'홍길동','02-1234-5678','010-1234-5678','hong@cafe24.com','464-545','서울시 강남구 역삼동','홍길동','02-1234-5678','010-1234-5678','hong@cafe24.com','464-545','서울시 강남구 역삼동','','account','3',111500,'2018-04-18','hong');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderproduct`
--

DROP TABLE IF EXISTS `orderproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderproduct` (
  `o_no` int(11) NOT NULL,
  `p_code` varchar(20) NOT NULL,
  PRIMARY KEY (`o_no`,`p_code`),
  KEY `FK_product_TO_orderproduct` (`p_code`),
  CONSTRAINT `FK_product_TO_orderproduct` FOREIGN KEY (`p_code`) REFERENCES `product` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_order_TO_orderproduct` FOREIGN KEY (`o_no`) REFERENCES `order` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderproduct`
--

LOCK TABLES `orderproduct` WRITE;
/*!40000 ALTER TABLE `orderproduct` DISABLE KEYS */;
INSERT INTO `orderproduct` VALUES (9,'AIR FORCE 1 (GS)');
/*!40000 ALTER TABLE `orderproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderproduct_suboption`
--

DROP TABLE IF EXISTS `orderproduct_suboption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderproduct_suboption` (
  `o_no` int(11) NOT NULL,
  `p_code` varchar(20) NOT NULL,
  `so_no` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`o_no`,`p_code`,`so_no`),
  KEY `FK_suboption_TO_orderproduct_suboption` (`so_no`),
  CONSTRAINT `FK_suboption_TO_orderproduct_suboption` FOREIGN KEY (`so_no`) REFERENCES `suboption` (`no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_orderproduct_TO_orderproduct_suboption` FOREIGN KEY (`o_no`, `p_code`) REFERENCES `orderproduct` (`o_no`, `p_code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderproduct_suboption`
--

LOCK TABLES `orderproduct_suboption` WRITE;
/*!40000 ALTER TABLE `orderproduct_suboption` DISABLE KEYS */;
INSERT INTO `orderproduct_suboption` VALUES (9,'AIR FORCE 1 (GS)',5,1);
/*!40000 ALTER TABLE `orderproduct_suboption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `maker` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(256) NOT NULL,
  `state` enum('sale','not-sale','sold-out') NOT NULL,
  `newItem` tinyint(1) DEFAULT '0',
  `hitItem` tinyint(1) DEFAULT '0',
  `saleItem` tinyint(1) DEFAULT '0',
  `discount` int(11) DEFAULT NULL,
  `image_path1` varchar(100) NOT NULL,
  `image_path2` varchar(100) NOT NULL,
  `image_path3` varchar(100) NOT NULL,
  `reg_date` date NOT NULL,
  `c_no` int(11) NOT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_category_TO_product` (`c_no`),
  CONSTRAINT `FK_category_TO_product` FOREIGN KEY (`c_no`) REFERENCES `category` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('AIR FORCE 1 (GS)','나이키 에어 포스 1','나이키',109000,'신발','sale',1,1,NULL,NULL,'/product/images/thumb/201831794013502.jpg','/product/images/detail/201831794013504.jpg','/product/images/detail/201831794013506.jpg','2018-04-17',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option`
--

DROP TABLE IF EXISTS `product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_option` (
  `p_code` varchar(20) NOT NULL,
  `o_no` int(11) NOT NULL,
  PRIMARY KEY (`p_code`,`o_no`),
  KEY `FK_option_TO_product_option` (`o_no`),
  CONSTRAINT `FK_option_TO_product_option` FOREIGN KEY (`o_no`) REFERENCES `option` (`no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_product_TO_product_option` FOREIGN KEY (`p_code`) REFERENCES `product` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option`
--

LOCK TABLES `product_option` WRITE;
/*!40000 ALTER TABLE `product_option` DISABLE KEYS */;
INSERT INTO `product_option` VALUES ('AIR FORCE 1 (GS)',1);
/*!40000 ALTER TABLE `product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suboption`
--

DROP TABLE IF EXISTS `suboption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suboption` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `o_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `FK_option_TO_suboption` (`o_no`),
  CONSTRAINT `FK_option_TO_suboption` FOREIGN KEY (`o_no`) REFERENCES `option` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suboption`
--

LOCK TABLES `suboption` WRITE;
/*!40000 ALTER TABLE `suboption` DISABLE KEYS */;
INSERT INTO `suboption` VALUES (1,'210',1),(2,'215',1),(3,'220',1),(4,'225',1),(5,'230',1),(6,'235',1),(7,'240',1),(8,'245',1),(9,'250',1),(10,'Men',2),(11,'Women',2),(12,'Unisex',2);
/*!40000 ALTER TABLE `suboption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_admin_order_list`
--

DROP TABLE IF EXISTS `v_admin_order_list`;
/*!50001 DROP VIEW IF EXISTS `v_admin_order_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_admin_order_list` (
  `orderNo` int(11),
  `regDate` date,
  `productName` varchar(100),
  `totPrice` int(11),
  `orderName` varchar(10),
  `payType` enum('card','account'),
  `state` varchar(10),
  `count` bigint(21)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_cart`
--

DROP TABLE IF EXISTS `v_cart`;
/*!50001 DROP VIEW IF EXISTS `v_cart`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_cart` (
  `u_id` varchar(20),
  `productCode` varchar(20),
  `suboptionNo` int(11),
  `productName` varchar(100),
  `imagePath` varchar(100),
  `optionName` varchar(50),
  `price` int(11),
  `suboptionName` varchar(50),
  `amount` int(11),
  `regDate` date
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_info_order`
--

DROP TABLE IF EXISTS `v_info_order`;
/*!50001 DROP VIEW IF EXISTS `v_info_order`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_info_order` (
  `userId` varchar(20),
  `orderNo` int(11),
  `productCode` varchar(20),
  `imagePath` varchar(100),
  `productName` varchar(100),
  `optionName` varchar(50),
  `suboptionName` varchar(50),
  `amount` int(11),
  `price` int(11),
  `discount` int(11)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_inquire_order`
--

DROP TABLE IF EXISTS `v_inquire_order`;
/*!50001 DROP VIEW IF EXISTS `v_inquire_order`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_inquire_order` (
  `userId` varchar(20),
  `regDate` date,
  `no` int(11),
  `name` varchar(100),
  `totPrice` int(11),
  `state` varchar(10),
  `count` bigint(21)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_order_product`
--

DROP TABLE IF EXISTS `v_order_product`;
/*!50001 DROP VIEW IF EXISTS `v_order_product`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_order_product` (
  `productCode` varchar(20),
  `suboptionNo` int(11),
  `productName` varchar(100),
  `imagePath` varchar(100),
  `optionName` varchar(50),
  `price` int(11),
  `suboptionName` varchar(50)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_product`
--

DROP TABLE IF EXISTS `v_product`;
/*!50001 DROP VIEW IF EXISTS `v_product`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_product` (
  `code` varchar(20),
  `name` varchar(100),
  `maker` varchar(50),
  `price` int(11),
  `description` varchar(256),
  `state` enum('sale','not-sale','sold-out'),
  `newItem` tinyint(1),
  `hitItem` tinyint(1),
  `saleItem` tinyint(1),
  `discount` int(11),
  `imagePath1` varchar(100),
  `imagePath2` varchar(100),
  `imagePath3` varchar(100),
  `regDate` date,
  `categoryNo` int(11),
  `optionNo` int(11),
  `categoryName` varchar(50),
  `optionName` varchar(50)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_admin_order_list`
--

/*!50001 DROP TABLE IF EXISTS `v_admin_order_list`*/;
/*!50001 DROP VIEW IF EXISTS `v_admin_order_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`bitmall`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_admin_order_list` AS (select `o`.`no` AS `orderNo`,`o`.`reg_date` AS `regDate`,`p`.`name` AS `productName`,`o`.`tot_price` AS `totPrice`,`o`.`o_name` AS `orderName`,`o`.`pay_type` AS `payType`,`o`.`state` AS `state`,count(0) AS `count` from (((`order` `o` join `orderproduct` `op`) join `product` `p`) join `orderproduct_suboption` `op_so`) where ((`o`.`no` = `op`.`o_no`) and (`op`.`p_code` = `p`.`code`) and (`op_so`.`o_no` = `op`.`o_no`) and (`op_so`.`p_code` = `op`.`p_code`)) group by `o`.`no` order by `o`.`reg_date` desc) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_cart`
--

/*!50001 DROP TABLE IF EXISTS `v_cart`*/;
/*!50001 DROP VIEW IF EXISTS `v_cart`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`bitmall`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_cart` AS (select `c`.`u_id` AS `u_id`,`c`.`p_code` AS `productCode`,`cs`.`so_no` AS `suboptionNo`,`vp`.`name` AS `productName`,`vp`.`imagePath1` AS `imagePath`,`vp`.`optionName` AS `optionName`,`vp`.`price` AS `price`,`so`.`name` AS `suboptionName`,`cs`.`amount` AS `amount`,`c`.`reg_date` AS `regDate` from (((`cart` `c` join `cart_suboption` `cs`) join `suboption` `so`) join `v_product` `vp`) where ((`c`.`u_id` = `cs`.`u_id`) and (`c`.`p_code` = `cs`.`p_code`) and (`cs`.`so_no` = `so`.`no`) and (`c`.`p_code` = `vp`.`code`)) order by `c`.`reg_date` desc) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_info_order`
--

/*!50001 DROP TABLE IF EXISTS `v_info_order`*/;
/*!50001 DROP VIEW IF EXISTS `v_info_order`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`bitmall`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_info_order` AS (select `o`.`u_id` AS `userId`,`o`.`no` AS `orderNo`,`p`.`code` AS `productCode`,`p`.`image_path1` AS `imagePath`,`p`.`name` AS `productName`,`opt`.`name` AS `optionName`,`so`.`name` AS `suboptionName`,`op_so`.`amount` AS `amount`,`p`.`price` AS `price`,`p`.`discount` AS `discount` from ((((((`orderproduct` `op` join `orderproduct_suboption` `op_so`) join `suboption` `so`) join `product` `p`) join `product_option` `p_o`) join `option` `opt`) join `order` `o`) where ((`op`.`o_no` = `op_so`.`o_no`) and (`op`.`p_code` = `op_so`.`p_code`) and (`op_so`.`so_no` = `so`.`no`) and (`op`.`p_code` = `p`.`code`) and (`p`.`code` = `p_o`.`p_code`) and (`p_o`.`o_no` = `opt`.`no`) and (`o`.`no` = `op`.`o_no`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_inquire_order`
--

/*!50001 DROP TABLE IF EXISTS `v_inquire_order`*/;
/*!50001 DROP VIEW IF EXISTS `v_inquire_order`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`bitmall`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_inquire_order` AS (select `o`.`u_id` AS `userId`,`o`.`reg_date` AS `regDate`,`o`.`no` AS `no`,`p`.`name` AS `name`,`o`.`tot_price` AS `totPrice`,`o`.`state` AS `state`,count(0) AS `count` from (((`order` `o` join `orderproduct` `op`) join `product` `p`) join `orderproduct_suboption` `op_so`) where ((`o`.`no` = `op`.`o_no`) and (`op`.`p_code` = `p`.`code`) and (`op_so`.`o_no` = `op`.`o_no`) and (`op_so`.`p_code` = `op`.`p_code`)) group by `o`.`no` order by `o`.`reg_date` desc) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_order_product`
--

/*!50001 DROP TABLE IF EXISTS `v_order_product`*/;
/*!50001 DROP VIEW IF EXISTS `v_order_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`bitmall`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_order_product` AS (select `p`.`code` AS `productCode`,`so`.`no` AS `suboptionNo`,`p`.`name` AS `productName`,`p`.`image_path1` AS `imagePath`,`o`.`name` AS `optionName`,`p`.`price` AS `price`,`so`.`name` AS `suboptionName` from (((`product` `p` join `product_option` `po`) join `option` `o`) join `suboption` `so`) where ((`p`.`code` = `po`.`p_code`) and (`po`.`o_no` = `o`.`no`) and (`o`.`no` = `so`.`o_no`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_product`
--

/*!50001 DROP TABLE IF EXISTS `v_product`*/;
/*!50001 DROP VIEW IF EXISTS `v_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`bitmall`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_product` AS (select `p`.`code` AS `code`,`p`.`name` AS `name`,`p`.`maker` AS `maker`,`p`.`price` AS `price`,`p`.`description` AS `description`,`p`.`state` AS `state`,`p`.`newItem` AS `newItem`,`p`.`hitItem` AS `hitItem`,`p`.`saleItem` AS `saleItem`,`p`.`discount` AS `discount`,`p`.`image_path1` AS `imagePath1`,`p`.`image_path2` AS `imagePath2`,`p`.`image_path3` AS `imagePath3`,`p`.`reg_date` AS `regDate`,`p`.`c_no` AS `categoryNo`,`po`.`o_no` AS `optionNo`,`c`.`name` AS `categoryName`,`o`.`name` AS `optionName` from (((`product` `p` join `category` `c`) join `option` `o`) join `product_option` `po`) where ((`p`.`c_no` = `c`.`no`) and (`p`.`code` = `po`.`p_code`) and (`po`.`o_no` = `o`.`no`)) order by `p`.`reg_date` desc) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-18 21:03:28
