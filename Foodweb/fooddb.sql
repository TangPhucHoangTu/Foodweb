CREATE DATABASE  IF NOT EXISTS `fooddb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fooddb`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fooddb
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `follow_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `follow_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`follow_id`),
  KEY `user_id` (`user_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `imgfood` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `food_type` varchar(50) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`food_id`),
  KEY `menu_id` (`menu_id`),
  KEY `foods_ibfk_2` (`store_id`),
  CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`),
  CONSTRAINT `foods_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (9,NULL,4,'Cơm Trộn Bò Bulgogi','https://res.cloudinary.com/dh8iyyll9/image/upload/v1694347758/oiokd70nuikv5jiy2fkr.jpg',65000.00,'Đồ ăn','Có sẵn'),(10,NULL,4,'Cơm Thăn Heo Rán Giòn','https://res.cloudinary.com/dh8iyyll9/image/upload/v1694349485/nmhidkrj30e165rugea7.jpg',65000.00,'Đồ ăn','Có sẵn'),(11,NULL,5,'Cháo ếch 2 con','https://res.cloudinary.com/dh8iyyll9/image/upload/v1694349568/ms7wnhpmufriaiaebxyi.jpg',89000.00,'Đồ ăn','Có sẵn'),(12,NULL,6,'Trà Sữa Truyền Thống Trân Châu (Size 700ml)','https://res.cloudinary.com/dh8iyyll9/image/upload/v1694349658/sgimpofnxcv8fnqtsyti.jpg',22000.00,'Đồ uống','Có sẵn'),(13,NULL,3,'Cơm cánh gà nướng','https://res.cloudinary.com/dh8iyyll9/image/upload/v1694349766/hg4hnmrjqjxqej2att5g.jpg',79000.00,'Đồ ăn','có sẵn'),(14,NULL,1,'Bánh Mì Chả Cá','https://res.cloudinary.com/dh8iyyll9/image/upload/v1694349869/myhu3fd0kdtdw4hpthcc.jpg',22000.00,'Đồ ăn','Có sẵn'),(15,NULL,NULL,'Cháo ếch 2 con','https://res.cloudinary.com/dh8iyyll9/image/upload/v1694353786/rqdbfxbvga96djqlkzjs.jpg',89000.00,'Đồ ăn','Có sẵn');
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `publish_date` date NOT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `payment_method` enum('online','cash') NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `store_id` (`store_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`food_id`) REFERENCES `foods` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revenuestatistics`
--

DROP TABLE IF EXISTS `revenuestatistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revenuestatistics` (
  `stat_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int DEFAULT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `revenue` decimal(10,2) NOT NULL,
  PRIMARY KEY (`stat_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `revenuestatistics_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revenuestatistics`
--

LOCK TABLES `revenuestatistics` WRITE;
/*!40000 ALTER TABLE `revenuestatistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `revenuestatistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `rating` int NOT NULL,
  `comment` text,
  PRIMARY KEY (`review_id`),
  KEY `user_id` (`user_id`),
  KEY `store_id` (`store_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`food_id`) REFERENCES `foods` (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `imgfoodstore` varchar(255) NOT NULL,
  `location` varchar(200) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  PRIMARY KEY (`store_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `stores_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,NULL,'Bánh Mì Má Hải - Vĩnh Viễn','https://images.foody.vn/res/g10/95580/prof/s640x400/foody-upload-api-foody-mobile-banh-mi-cha-ca-dac-b-180417142723.jpg','187 Vĩnh Viễn, P. 4, Quận 10, TP. HCM',NULL,NULL),(2,NULL,'Trà Sữa Mộc','https://images.foody.vn/res/g102/1013400/prof/s640x400/file_restaurant_photo_oowe_16146-6a83a1c0-210302183441.jpg','100 Đường D5, P. 25, Bình Thạnh, TP. HCM',NULL,NULL),(3,NULL,'Cơm Cánh Gà Nướng A Đỉnh','https://images.foody.vn/res/g118/1176222/prof/s640x400/foody-upload-api-foody-mobile-co-cf6ad076-230705181639.jpg','15D Ngô Quang Huy, P. Thảo Điền, Thành Phố Thủ Đức, TP. HCM',NULL,NULL),(4,NULL,'Hansan - Cơm & Mì Trộn Hàn Quốc','https://images.foody.vn/res/g117/1168380/prof/s576x330/foody-upload-api-foody-mobile-hi-23cee0ed-230420100156.jpeg','25/26 Nguyễn Bỉnh Khiêm, P. Bến Nghé,  Quận 1, TP. HCM',NULL,NULL),(5,NULL,'Cháo ếch - Singapore','https://res.cloudinary.com/dh8iyyll9/image/upload/v1694097407/uue6sbubui5y7t4yhoeg.jpg','7 Hoàng Hoa Thám, P. 6, Bình Thạnh, TP. HCM',NULL,NULL),(6,NULL,'Yumi - Trà Sữa & Milo Dầm Trân Châu','https://images.foody.vn/res/g105/1044554/prof/s576x330/foody-upload-api-foody-mobile-22-200929150032.jpg','237/65/12 Phạm Văn Chiêu, P. 14,  Quận Gò Vấp, TP. HCM',NULL,NULL);
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(15) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (24,'tu7777','$2a$10$5iGgZTIJlPwIJqMXvA9zsO8tp2Lr3kOfFoGtQgSJ2gU2pnLD0ugWq','ROLE_STORE','https://res.cloudinary.com/dh8iyyll9/image/upload/v1693807297/ow2rkp4n1rskrcegy12z.jpg',0,'hoangtu230302@gmail.com','0792193002','Tăng','Tú',NULL),(25,'binh','$2a$10$12j.ZRh6l8infERP9wNGuOgbV5xsjPfhSG2RKR1o8EfOSfr4qc.rW','ROLE_USER','https://res.cloudinary.com/dh8iyyll9/image/upload/v1693808198/kcyvggsusqqckydh7rdy.png',0,'1@gmail.com','1','1','1',NULL),(26,'tai8888','$2a$10$qTdHjZYGFmDtvZh8tidpv.Ntidd/VkWsQxfEp9Ohv3UXaYjlgt5sK','ROLE_USER','https://res.cloudinary.com/dh8iyyll9/image/upload/v1693927597/h3sw3wqfpbsvgueeihc7.jpg',0,'tai8888@gmail.com','0792193003','tai','hoang',NULL),(27,'docongson','$2a$10$/Y3cenlw4NBNBu3wZI95Yefv7nz4fidVFpktfskxeg5ZLisgYm9Ia','ROLE_USER','https://res.cloudinary.com/dh8iyyll9/image/upload/v1694350392/gbwwdame1mzyyi1jflgz.jpg',0,'kaupekute@gmail.com','0792193003','Tú Tăng','Hoàng',NULL),(28,'tu8888','$2a$10$ZcR4SjExPBVPxLO/7eN50O/qZ.3znrHpDE7JU8TVex/CEe2wjATKu','ROLE_USER','https://res.cloudinary.com/dh8iyyll9/image/upload/v1694353074/nnovdczxuzxuemwsqbaf.jpg',0,'kaupekute3@gmail.com','0792193006','Tú Tăng','Hoàng',NULL);
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

-- Dump completed on 2023-09-10 21:41:58
