CREATE DATABASE  IF NOT EXISTS `db_111408512` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_111408512`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 192.168.56.101    Database: db_111408512
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ratings` (
  `rating_id` int NOT NULL AUTO_INCREMENT,
  `proposal_option_id` int NOT NULL,
  `rating` int NOT NULL,
  PRIMARY KEY (`rating_id`),
  CONSTRAINT `fk_proposal_option_id` FOREIGN KEY (`rating_id`) REFERENCES `tbl_proposal_option` (`proposal_option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,23,3),(2,13,4),(3,14,3),(4,17,4),(5,21,3),(6,1,3),(7,9,3),(8,3,2),(9,24,4),(10,2,3),(11,19,5),(12,19,5),(13,1,3),(14,16,2),(15,17,5),(16,18,3);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `review` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `response` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `fk_proposal_id_idx` (`proposal_id`),
  CONSTRAINT `fk_proposal_id` FOREIGN KEY (`proposal_id`) REFERENCES `tbl_proposals` (`proposal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,12,'物流速度太慢了，等了很久才收到貨，產品品質也一般。','非常抱歉給您帶來不便，我們會加強物流管理，並對產品質量進行檢查，感謝您的反饋。'),(2,6,'這款產品的CP值很高，值得推薦。','非常感謝您的推薦，我們會繼續努力，提供更多高CP值的產品！'),(3,7,'使用過程中發現了一些小問題，希望能改進。','感謝您的反饋，請您聯繫我們的客服，我們會盡快解決您的問題並進行改進。'),(4,9,'價錢合理，品質優良，使用體驗也很好，是個不錯的選擇。',''),(5,11,'產品一般，與預期有差距。',''),(6,1,'包裝有點簡陋，產品本身還可以，但感覺CP值不高。','感謝您的反饋，我們會改進包裝並進一步提升產品CP值，希望下次能讓您更滿意。'),(7,5,'使用感受不錯','感謝您的肯定，我們會繼續努力，為您提供更好的使用體驗。'),(8,2,'產品有損壞，雖然客服處理了，但感覺購物體驗不好。',''),(9,12,'品質不錯',''),(10,2,'包裝破損，收到時有些失望，產品倒是正常。','抱歉讓您失望了，我們會改進包裝，確保未來的物流過程中不再出現這樣的問題。'),(11,9,'這款產品真的很不錯','非常感謝您的肯定，我們會繼續努力，提供更多優質產品！'),(12,9,'這款產品品質很好，做工精細，使用起來非常方便。非常推薦！','非常感謝您的推薦，我們很高興您喜歡這款產品，期待您再次光臨。'),(13,1,'用了一段時間後出現問題，感覺產品質量有待提高。','非常抱歉讓您遇到這個問題，請聯繫客服，我們會提供解決方案並改進產品質量。'),(14,9,'產品描述與實物有些出入，感覺有點被誤導了，不是很滿意。','對不起給您帶來困擾，我們會重新審視產品描述，確保與實物一致，感謝您的反饋。'),(15,9,'非常實用，設計也很美觀，完全滿足我的需求。',''),(16,9,'使用時感覺不太順手，設計有待改進。','感謝您的反饋，我們會仔細研究改進設計，讓使用體驗更加順暢。');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_followed_proposals`
--

DROP TABLE IF EXISTS `tbl_followed_proposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_followed_proposals` (
  `member_id` int NOT NULL,
  `proposal_id` int NOT NULL,
  KEY `fk_member_id_idx` (`member_id`),
  KEY `fk_proposal_id_idx` (`proposal_id`),
  CONSTRAINT `fk_member_id2` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`),
  CONSTRAINT `fk_proposal_id1` FOREIGN KEY (`proposal_id`) REFERENCES `tbl_proposals` (`proposal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_followed_proposals`
--

LOCK TABLES `tbl_followed_proposals` WRITE;
/*!40000 ALTER TABLE `tbl_followed_proposals` DISABLE KEYS */;
INSERT INTO `tbl_followed_proposals` VALUES (1,2),(1,3),(1,4),(2,7),(3,1),(3,9),(3,5),(3,4),(4,1),(5,2),(5,3),(5,9),(7,1),(7,5),(7,7),(7,6),(8,7),(9,9),(10,1);
/*!40000 ALTER TABLE `tbl_followed_proposals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_member`
--

DROP TABLE IF EXISTS `tbl_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cellphone_number` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_member`
--

LOCK TABLES `tbl_member` WRITE;
/*!40000 ALTER TABLE `tbl_member` DISABLE KEYS */;
INSERT INTO `tbl_member` VALUES (1,'李小明','366 苗栗縣銅鑼鄉民權中路319號','0921003614','in.consequat@yahoo.com'),(2,'王小新','600 嘉義市東區世賢八路24號','0988008346','adipiscing.enim.mi@outlook.com'),(3,'張小紅','325 桃園市龍潭區淮子埔七路29號','0922830125','nullam.velit@yahoo.com'),(4,'陳小玉','540 南投縣南投市三和六路1499號','0958351743','sed.auctor@hotmail.com'),(5,'林小青','508 彰化縣和美鎮潭北路1500號','0912587773','sagittis.nullam@google.com'),(6,'黃小剛','711 臺南市歸仁區崙頂二街1111號','0960105109','nec.leo.morbi@protonmail.com'),(7,'廖小白','411 臺中市太平區北田南路14號','0961749001','sociosqu.ad@yahoo.com'),(8,'吳小蘭','801 高雄市前金區自立九路18號','0928735721','proin.non@protonmail.com'),(9,'劉小波','201 基隆市信義區義四路222號','0968169143','arcu.vel.quam@hotmail.com'),(10,'柯小智','622 嘉義縣大林鎮早知到街31號','0970691667','dui.quis.accumsan@google.com'),(11,'syd','hofse','0978666555','sydneyliao@gmail.com'),(12,'sss','taipei','0988777678','sydeny'),(13,'jiiiiifiyi','taipei','0999889009','111408512'),(14,'王大明','taipei','0988333243','111408512@gmail.com');
/*!40000 ALTER TABLE `tbl_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_member_tbl_sponsor_record`
--

DROP TABLE IF EXISTS `tbl_member_tbl_sponsor_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_member_tbl_sponsor_record` (
  `tbl_member_member_id` int NOT NULL,
  `tbl_sponsor_record_sponsor_record_id` int NOT NULL,
  PRIMARY KEY (`tbl_member_member_id`,`tbl_sponsor_record_sponsor_record_id`),
  KEY `fk_tbl_member_has_tbl_sponsor_record_tbl_member1_idx` (`tbl_member_member_id`),
  KEY `fk_tbl_member_has_tbl_sponsor_record_tbl_sponsor_record1_idx` (`tbl_sponsor_record_sponsor_record_id`),
  CONSTRAINT `fk_tbl_member_has_tbl_sponsor_record_tbl_member1` FOREIGN KEY (`tbl_member_member_id`) REFERENCES `tbl_member` (`member_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_member_has_tbl_sponsor_record_tbl_sponsor_record1` FOREIGN KEY (`tbl_sponsor_record_sponsor_record_id`) REFERENCES `tbl_sponsor_record` (`sponsor_record_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_member_tbl_sponsor_record`
--

LOCK TABLES `tbl_member_tbl_sponsor_record` WRITE;
/*!40000 ALTER TABLE `tbl_member_tbl_sponsor_record` DISABLE KEYS */;
INSERT INTO `tbl_member_tbl_sponsor_record` VALUES (1,1),(1,2),(1,3),(3,4),(3,5),(3,6),(4,8),(5,7),(7,9),(7,10),(7,11),(8,12),(8,13),(8,14),(10,15),(10,16),(10,17),(10,18),(10,19),(10,20);
/*!40000 ALTER TABLE `tbl_member_tbl_sponsor_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_password`
--

DROP TABLE IF EXISTS `tbl_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_password` (
  `password_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `hashedpwd` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt` char(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`password_id`,`member_id`),
  UNIQUE KEY `member_id_UNIQUE` (`member_id`),
  UNIQUE KEY `hashed_password_UNIQUE` (`hashedpwd`),
  UNIQUE KEY `salt_UNIQUE` (`salt`),
  CONSTRAINT `fk_member_id` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_password`
--

LOCK TABLES `tbl_password` WRITE;
/*!40000 ALTER TABLE `tbl_password` DISABLE KEYS */;
INSERT INTO `tbl_password` VALUES (1,1,'8d5ec65935ab2991386a2df50db27491','0oplfZ16tyLX'),(2,2,'37d3f919a7230c12a33ad33bb6a62940','7gB%z9Svg8EW'),(3,3,'d2898e8f01641dc2f1c7ae967f589764','JJQF0j%tkx3i'),(4,4,'6072444ce37a3e5e18db29c07d9bff2f','Rv$uGmL&C!%g'),(5,5,'58e537835456d27b4861bf1d0848c341','XcZg6Be^cU2y'),(6,6,'bad812356d04169c5231aca6dbf2e895','aZjy*GvZt@s*'),(7,7,'ce94f4cd7665791f28eb1b0339e1a146','j8tI5!wG88PM'),(8,8,'79f1c375a8045aae0647826d07cc6f77','n7UDOe0uspZk'),(9,9,'8a6b92d74b7c32075652a700e57a2bc7','wlmM33nAD@SR'),(10,10,'302b047e1bd5db87510915390368a5ac','&@^ODhk0MH&l'),(11,11,'poiuytrewqasdfghjklmnbvcxzaswerf','qwertyuiopas'),(12,12,'sjbsslgkng.0og','egwofmpsr123'),(13,13,'UUUU','sthj'),(14,14,'1ksebgwejgbwlegbjsbgle','2suaoqjduh');
/*!40000 ALTER TABLE `tbl_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_proposal_option`
--

DROP TABLE IF EXISTS `tbl_proposal_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_proposal_option` (
  `proposal_option_id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `proposal_option_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(13,4) NOT NULL,
  PRIMARY KEY (`proposal_option_id`),
  KEY `proposal_id_idx` (`proposal_id`),
  CONSTRAINT `proposal_id` FOREIGN KEY (`proposal_id`) REFERENCES `tbl_proposals` (`proposal_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_proposal_option`
--

LOCK TABLES `tbl_proposal_option` WRITE;
/*!40000 ALTER TABLE `tbl_proposal_option` DISABLE KEYS */;
INSERT INTO `tbl_proposal_option` VALUES (1,1,'The All 100周年紀念【回憶重溫】',2400.0000),(2,2,'斜背包 - A款式',350.0000),(3,2,'斜背包 - B款式',550.0000),(4,3,'紙藝便籤夾 - A套組',250.0000),(5,3,'紙藝便籤夾 - B套組',350.0000),(6,3,'紙藝便籤夾 - C套組',450.0000),(7,4,'芒果鳳梨 - 5入',500.0000),(8,4,'芒果鳳梨 - 10入',900.0000),(9,5,'鋼鼓學院 - A課程',3600.0000),(10,5,'鋼鼓學院 - B課程',4800.0000),(11,5,'鋼鼓學院 - C課程',6000.0000),(12,6,'ZLight MINi補光折疊穩定器 - A套組',3000.0000),(13,6,'ZLight MINi補光折疊穩定器 - B套組',3500.0000),(14,7,'日系可愛風格電動麻將組',10000.0000),(15,8,'DIY木工四合一工具',2000.0000),(16,9,'奇幻狗狗塔羅牌 - 柴犬套組',1000.0000),(17,9,'奇幻狗狗塔羅牌 - 哈士奇套組',1000.0000),(18,9,'奇幻狗狗塔羅牌 - 拉布拉多套組',1000.0000),(19,9,'單純想贊助',1000.0000),(20,10,'美妝工具烘乾機',800.0000),(21,11,'斜背包 - A款式',450.0000),(22,11,'斜背包 - B款式',550.0000),(23,12,'輕便雨傘 - A款式',1200.0000),(24,12,'輕便雨傘 - B款式',1200.0000),(25,12,'輕便雨傘 - C款式',1200.0000),(26,12,'輕便雨傘-D款式',1300.0000),(27,11,'斜背包 - C款式',660.0000),(28,11,'斜背包 - D款式',680.0000);
/*!40000 ALTER TABLE `tbl_proposal_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_proposal_option_tbl_sponsor_record`
--

DROP TABLE IF EXISTS `tbl_proposal_option_tbl_sponsor_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_proposal_option_tbl_sponsor_record` (
  `tbl_proposal_option_proposal_option_id` int NOT NULL,
  `tbl_sponsor_record_sponsor_record_id` int NOT NULL,
  PRIMARY KEY (`tbl_proposal_option_proposal_option_id`,`tbl_sponsor_record_sponsor_record_id`),
  KEY `fk_tbl_proposal_option_has_tbl_sponsor_record_tbl_sponsor_r_idx` (`tbl_sponsor_record_sponsor_record_id`),
  CONSTRAINT `fk_tbl_proposal_option_has_tbl_sponsor_record_tbl_proposal_op1` FOREIGN KEY (`tbl_proposal_option_proposal_option_id`) REFERENCES `tbl_proposal_option` (`proposal_option_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_proposal_option_has_tbl_sponsor_record_tbl_sponsor_rec1` FOREIGN KEY (`tbl_sponsor_record_sponsor_record_id`) REFERENCES `tbl_sponsor_record` (`sponsor_record_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_proposal_option_tbl_sponsor_record`
--

LOCK TABLES `tbl_proposal_option_tbl_sponsor_record` WRITE;
/*!40000 ALTER TABLE `tbl_proposal_option_tbl_sponsor_record` DISABLE KEYS */;
INSERT INTO `tbl_proposal_option_tbl_sponsor_record` VALUES (23,1),(13,2),(6,3),(14,4),(17,5),(21,6),(1,7),(8,8),(9,9),(7,10),(3,11),(24,12),(13,13),(2,14),(19,15),(19,16),(1,17),(16,18),(17,19),(18,20);
/*!40000 ALTER TABLE `tbl_proposal_option_tbl_sponsor_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_proposals`
--

DROP TABLE IF EXISTS `tbl_proposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_proposals` (
  `proposal_id` int NOT NULL AUTO_INCREMENT,
  `proposal_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_raised` decimal(13,4) NOT NULL,
  `goal` decimal(13,4) NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_num` int NOT NULL,
  `proposal_content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int NOT NULL,
  PRIMARY KEY (`proposal_id`,`member_id`),
  UNIQUE KEY `prposal_title_UNIQUE` (`proposal_title`),
  KEY `fk_member_id_idx` (`member_id`),
  CONSTRAINT `fk_member_id1` FOREIGN KEY (`member_id`) REFERENCES `tbl_member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_proposals`
--

LOCK TABLES `tbl_proposals` WRITE;
/*!40000 ALTER TABLE `tbl_proposals` DISABLE KEYS */;
INSERT INTO `tbl_proposals` VALUES (1,'The All 100周年紀念【回憶重溫】音樂再現，穿越時光之牆！獨家合作：星宇樂團x陳藝、彩色西瓜樂團。',9600.0000,100000.0000,'Expired',43,'在這場特別的百年紀念活動中，我們將透過星宇樂團和彩色西瓜樂團的精彩表演，帶您穿越時光，重溫過去的音樂經典。這將是一場難忘的音樂之旅，讓我們一起共同回憶、感受、並創造新的回憶！','音樂','2024-01-16','2024-02-16',1),(2,'【台灣風情】EZPACK 隨身斜背包，多功能口袋設計，讓你輕鬆出門！',4500.0000,5000.0000,'Ongoing',1150,'EZPACK 隨身斜背包是您出門的最佳選擇！不僅設計時尚，而且充滿台灣風情。多功能口袋設計，讓您可以輕鬆攜帶所需物品，無論是日常生活還是旅行，都能夠輕鬆自在！','時尚','2024-04-30','2024-05-30',2),(3,'持續支持性別平等！「共融」紙藝便籤夾，讓你與性別平等同行！',2250.0000,30000.0000,'Ongoing',8,'我們堅定地支持性別平等，並致力於打破性別界限。這款「共融」紙藝便籤夾不僅實用，更是一種對性別平等的呼籲和支持。讓我們攜手共同建立一個更加公平、平等的社會！','藝術','2024-04-17','2024-05-17',2),(4,'【令人驚艷】台灣新鳳梨品種：芒果鳳梨，帶給你獨特的口感體驗！',4300.0000,2000.0000,'Ongoing',236,'芒果鳳梨，這種全新的台灣特色水果，結合了芒果的香甜和鳳梨的清爽，帶給您絕佳的口感體驗！讓我們一起享受這份令人驚艷的美味！','飲食','2024-03-21','2024-05-21',2),(5,'鋼鼓音樂熱潮！加入Formosa Beats，成為鋼鼓樂手！',14400.0000,35000.0000,'Ongoing',251,'Formosa Beats 是您成為鋼鼓樂手的最佳選擇！我們提供專業的鋼鼓教學和表演，讓您在音樂的世界中展現自己的才華，一起享受鋼鼓音樂的熱潮！','音樂','2024-05-01','2024-06-01',4),(6,'【絕妙設計】ZLight MINi補光折疊穩定器，自拍必備良伴！',10500.0000,10000.0000,'Expired',5893,'ZLight MINi補光折疊穩定器，是您自拍時的最佳助手！絕妙的設計和高品質的補光效果，讓您在自拍時輕鬆展現最佳狀態，捕捉每一個美好時刻！','攝影','2024-01-06','2024-03-06',6),(7,'日系可愛風格電動麻將組',10000.0000,300000.0000,'Ongoing',31,'讓我們一起來享受日系可愛風格的電動麻將組帶來的樂趣吧！這款電動麻將組不僅外觀可愛，而且操作簡單，讓你愛不釋手。','遊戲','2024-05-03','2024-06-03',6),(8,'一機搞定木工創意！DIY木工四合一工具，享受手作樂趣！',0.0000,100000.0000,'Prepublish',0,'您是否喜歡親手製作木工作品？現在有了DIY木工四合一工具，您可以輕鬆應對各種木工創意！無論是裁切、鑽床、砂光還是車輪，都能在這一款工具上輕松實現！讓我們一起享受手作樂趣，創造出屬於自己的精美木工作品！','教育','2024-07-04','2024-08-04',8),(9,'探索神秘命運！奇幻狗狗塔羅牌，解讀未來之謎！',19000.0000,20000.0000,'Ongoing',57,'每個人心中都有著一份對未來的好奇與渴望，而奇幻狗狗塔羅牌將為您打開神秘的命運之門！透過這套獨特的塔羅牌，您將能夠解讀未來的種種謎團，探索自己的命運之路。讓我們一起勇敢地面對未來，探索命運的奧秘！','藝術','2024-04-18','2024-06-18',8),(10,'weye美妝專業烘乾機，讓你的化妝品保持乾爽清潔！，拒絕刷菌上臉！',0.0000,30000.0000,'Terminated',3148,'每天使用的化妝品是否也讓您感到困擾？現在有了weye美妝專業烘乾機，讓您的化妝品保持乾爽清潔，徹底拒絕刷菌上臉的煩惱！這款烘乾機擁有UV紫外線滅菌功能，能夠有效殺滅化妝品中的細菌，讓您的皮膚更加健康，化妝效果更加持久！','科技','2024-02-26','2024-04-26',9),(11,'【潮流精品】SWAGPACK 斜背包，時尚設計，展現個人風格！',450.0000,8000.0000,'Terminated',124,'您是否渴望擁有一款時尚又實用的斜背包？SWAGPACK 斜背包將會是您的最佳選擇！時尚設計，展現個人風格，無論是日常穿搭還是旅行出行，都能夠襯托出您獨特的品味和風格！讓我們一起成為街頭的時尚潮流！','時尚','2024-04-10','2024-05-10',10),(12,'【世界上重量最輕折傘 】UM slim 秒收輕便雨傘，讓你無負擔',8400.0000,10000.0000,'Terminated',825,'UM slim 秒收輕便雨傡不僅是一件抗風雨的實用工具，更是一種生活方式的象徵。它的獨特之處在於它的極輕極薄設計，成為世界上重量最輕的折傡之一。這款雨傡採用先進的材料和工藝，使其重量極輕，方便攜帶，無論是放在包包裡、手提袋還是口袋中，都絲毫不會增添負擔。其獨特的秒收設計讓您在下雨時迅速打開，隨時為您提供防雨保護，同時收起來也同樣輕鬆迅速。UM slim 雨傡的便攜性和實用性將讓您在雨天的城市生活中輕鬆自在，無懼風雨。','時尚','2024-02-01','2024-04-01',10);
/*!40000 ALTER TABLE `tbl_proposals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sponsor_record`
--

DROP TABLE IF EXISTS `tbl_sponsor_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_sponsor_record` (
  `sponsor_record_id` int NOT NULL AUTO_INCREMENT,
  `sponsor_id` int NOT NULL,
  `proposal_option_id` int NOT NULL,
  `purchase_volume` int NOT NULL,
  `item_price` decimal(13,4) NOT NULL,
  `total_price` decimal(13,4) NOT NULL,
  PRIMARY KEY (`sponsor_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sponsor_record`
--

LOCK TABLES `tbl_sponsor_record` WRITE;
/*!40000 ALTER TABLE `tbl_sponsor_record` DISABLE KEYS */;
INSERT INTO `tbl_sponsor_record` VALUES (1,1,23,3,1200.0000,3600.0000),(2,1,13,2,3500.0000,7000.0000),(3,1,6,5,450.0000,2250.0000),(4,3,14,1,10000.0000,10000.0000),(5,3,17,4,1000.0000,4000.0000),(6,3,21,1,450.0000,450.0000),(7,5,1,3,2400.0000,7200.0000),(8,4,8,2,900.0000,1800.0000),(9,7,9,4,3600.0000,14400.0000),(10,7,7,5,500.0000,2500.0000),(11,7,3,5,550.0000,2750.0000),(12,8,24,4,1200.0000,4800.0000),(13,8,13,1,3500.0000,3500.0000),(14,8,2,5,350.0000,1750.0000),(15,10,19,1,1000.0000,1000.0000),(16,10,19,2,1000.0000,2000.0000),(17,10,1,1,2400.0000,2400.0000),(18,10,16,5,1000.0000,5000.0000),(19,10,17,4,1000.0000,4000.0000),(20,10,18,3,1000.0000,3000.0000);
/*!40000 ALTER TABLE `tbl_sponsor_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_111408512'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateProposalOption` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`111408512`@`192.168.56.1` PROCEDURE `sp_CreateProposalOption`(
    IN input_proposal_option_id INT,
    IN input_proposal_id INT,
    IN input_proposal_option_name VARCHAR(255),
    IN input_price DECIMAL(13, 4)
   
)
BEGIN
 DECLARE affected_row_num INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET affected_row_num = 0;
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO tbl_proposal_option (proposal_option_id, proposal_id, proposal_option_name, price)
    VALUES (input_proposal_option_id, input_proposal_id, input_proposal_option_name, input_price);
	SET affected_row_num = ROW_COUNT();
    COMMIT;
SELECT affected_row_num AS affected_row_num;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateSponsorRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`111408512`@`192.168.56.1` PROCEDURE `sp_CreateSponsorRecord`(
    IN _sponsor_record_id INT,
    IN _sponsor_id INT,
    IN _proposal_option_id INT,
    IN _purchase_volume INT
)
BEGIN
    DECLARE affected_row_num INT;
    DECLARE total_volume INT;
    DECLARE proposal_status VARCHAR(20);

    SELECT p.status INTO proposal_status
    FROM tbl_proposals p
    JOIN tbl_proposal_option o ON p.proposal_id = o.proposal_id
    WHERE o.proposal_option_id = _proposal_option_id;

    IF proposal_status != 'ONGOING' THEN
        SET affected_row_num = 0;
        SELECT affected_row_num AS affected_row_num;
        rollback;
    END IF;

    SELECT COALESCE(SUM(purchase_volume), 0) INTO total_volume
    FROM tbl_sponsor_record
    WHERE sponsor_id = _sponsor_id
    AND proposal_option_id = _proposal_option_id;

    IF total_volume + _purchase_volume > 5 THEN
        SET affected_row_num = 0;
    ELSE
        SET affected_row_num = 1;
    END IF;

    SELECT affected_row_num AS affected_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`111408512`@`192.168.56.1` PROCEDURE `sp_DeleteMember`(
    IN input_member_id INT
)
BEGIN
    DECLARE status_code INT;
    DECLARE member_name VARCHAR(100);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        
        ROLLBACK;
        SET status_code = 2;
        SELECT status_code, input_member_id AS member_id, member_name AS name;
    END;

  
    START TRANSACTION;


    SELECT name INTO member_name
    FROM tbl_member
    WHERE member_id = input_member_id;

    IF member_name IS NULL THEN
        SET status_code = 2;
        ROLLBACK;
        SELECT status_code, input_member_id AS member_id, member_name AS name;
        Rollback;
    END IF;

    
    DELETE FROM tbl_sponsor_record
    WHERE sponsor_id = input_member_id;

 
    DELETE FROM tbl_proposals
    WHERE member_id = input_member_id;

  
    DELETE FROM tbl_followed_proposals
    WHERE member_id = input_member_id;

    DELETE FROM tbl_password
    WHERE member_id = input_member_id;


    DELETE FROM tbl_member
    WHERE member_id = input_member_id;

    COMMIT;

    SET status_code = 1;
    SELECT status_code AS status_code, input_member_id AS member_id, member_name AS name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetFollowedProposalsByMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`111408512`@`192.168.56.1` PROCEDURE `sp_GetFollowedProposalsByMember`(
in input_member_id int)
BEGIN
SELECT 
        fp.member_id,
        p.proposal_id,
        p.proposal_title,
        p.amount_raised,
        p.goal
    FROM 
        tbl_followed_proposals fp
        JOIN tbl_proposals p ON fp.proposal_id = p.proposal_id
    WHERE 
        fp.member_id = input_member_id
        AND p.status = 'Ongoing';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetOngoingProposalOptionbyRating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`111408512`@`192.168.56.1` PROCEDURE `sp_GetOngoingProposalOptionbyRating`(
in _rating INT)
BEGIN
    SELECT 
        po.proposal_id,
        p.proposal_title,
        po.proposal_option_name,
        ROUND(AVG(r.rating), 2) AS rating_avg
    FROM 
        tbl_proposal_option po
        JOIN tbl_proposals p ON po.proposal_id = p.proposal_id
        JOIN ratings r ON po.proposal_option_id = r.proposal_option_id
    WHERE 
        p.status = "ongoing"  
    GROUP BY 
        po.proposal_id, p.proposal_title, po.proposal_option_name
    HAVING 
        rating_avg >= _rating
    ORDER BY 
        rating_avg DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetProposalByCompletionRate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`111408512`@`192.168.56.1` PROCEDURE `sp_GetProposalByCompletionRate`(
in _ratio float)
BEGIN
declare ratio float;
select
p.proposal_id,
p.proposal_title,
p.amount_raised,
p.goal,
convert(p.amount_raised/p.goal,decimal(6,2)) AS ratio 
FROM 
tbl_proposals p 
WHERE 
(p.amount_raised/p.goal)>=_ratio 
ORDER BY 
	convert(p.amount_raised/p.goal,decimal(6,2)) DESC;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetRecommendedProposals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`111408512`@`192.168.56.1` PROCEDURE `sp_GetRecommendedProposals`(
    IN input_member_id INT
)
BEGIN
    DECLARE proposal_count INT;

    
    CREATE TEMPORARY TABLE IF NOT EXISTS TempRecommendedProposals AS
    (
        SELECT DISTINCT p.proposal_id, p.proposal_title, p.status, p.view_num
        FROM tbl_proposals p
        JOIN tbl_sponsor_record sr ON p.proposal_id = sr.proposal_option_id
        JOIN tbl_sponsor_record sr2 ON sr.sponsor_id = sr2.sponsor_id
        WHERE sr2.sponsor_id = input_member_id
        AND p.status = 'Ongoing'
        AND p.member_id != input_member_id
    );

  
    SELECT COUNT(*) INTO proposal_count
    FROM TempRecommendedProposals;

    
    IF proposal_count = 0 THEN
        SELECT proposal_id, proposal_title, 
         CASE
                WHEN status = 'Prepublished' THEN 1
                WHEN status = 'Ongoing' THEN 2
                WHEN status = 'Expired'THEN 3
                WHEN status = 'Terminated' THEN 4
                ELSE 'UNKNOWN'
            END AS status, 
            view_num
        FROM tbl_proposals
        WHERE status = 'Ongoing'
        ORDER BY view_num DESC
        LIMIT 5;
    ELSE
        SELECT proposal_id, proposal_title, 
        CASE
                WHEN status = 'Prepublished' THEN 1
                WHEN status = 'Ongoing' THEN 2
                WHEN status = 'Expired'THEN 3
                WHEN status = 'Terminated' THEN 4
                ELSE 'UNKNOWN'
            END AS status, 
            view_num
        FROM TempRecommendedProposals
        ORDER BY view_num DESC
        LIMIT 5;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS TempRecommendedProposals;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetUnrepliedReviews` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`111408512`@`192.168.56.1` PROCEDURE `sp_GetUnrepliedReviews`(
    IN input_member_id INT
)
BEGIN
    SELECT 
        p.member_id,
        r.proposal_id,
        p.proposal_title,
        r.review_id,
        r.review,
        CASE
            WHEN r.response = '' THEN 'null'
            ELSE r.response
        END AS response
    FROM 
        reviews r
        JOIN tbl_proposals p ON r.proposal_id = p.proposal_id
    WHERE 
        p.member_id = input_member_id
        AND r.response = '';
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`111408512`@`192.168.56.1` PROCEDURE `sp_Login`(
    IN input_email VARCHAR(255),
    IN input_hashedPwd CHAR(32)
    
)
BEGIN
	DECLARE status_code INT;
    DECLARE current_hashPwd CHAR(32);
    DECLARE member_exists INT;
    
    
    IF input_email IS NULL OR input_hashedPwd IS NULL THEN
        SET status_code = 3;
        SELECT status_code AS status_code;
        ROLLBACK;
        
    END IF;
    
    SELECT COUNT(*) INTO member_exists
    FROM tbl_member
    WHERE email = input_email;

    IF member_exists = 0 THEN
     
        SET status_code = 3;
        SELECT status_code AS status_code;
    ELSE
        
        SELECT hashedpwd INTO current_hashPwd
        FROM tbl_password
        WHERE member_id = (SELECT member_id FROM tbl_member WHERE email = input_email);
        
       
        IF current_hashPwd != input_hashedPwd THEN
            
            SET status_code = 2;
        ELSE

            SET status_code = 1;
        END IF;
    END IF;
     SELECT status_code AS status_code;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`111408512`@`192.168.56.1` PROCEDURE `sp_RegisterMember`(
in _email varchar(100),
in _hashedPwd char(32),
in _salt char(12),
in _name varchar(45),
in _address varchar(50),
in _cellphone_number varchar(10)

)
BEGIN
	DECLARE status_code INT;
    DECLARE member_exists INT;
    
    -- 檢查 email 是否已存在
    SELECT COUNT(*) INTO member_exists
    FROM tbl_member
    WHERE email = _email;
    
    IF member_exists > 0 THEN
        -- Email 已存在
        SET status_code = 2;
        SELECT status_code AS status_code;
    ELSE
        -- 插入新會員
        BEGIN
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                -- 其他錯誤
                SET status_code = 3;
                SELECT status_code AS status_code;
                ROLLBACK;
            END;
            
            START TRANSACTION;
            
            INSERT INTO tbl_member (email, name, address, cellphone_number)
            VALUES (_email, _name, _address, _cellphone_number);
            
            INSERT INTO tbl_password (member_id, hashedpwd, salt)
            VALUES (LAST_INSERT_ID(), _hashedPwd, _salt);
            
            COMMIT;
            
            -- 註冊成功
            SET status_code = 1;
        END;
        
    END IF;
    SELECT status_code AS status_code;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateProposalStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`111408512`@`192.168.56.1` PROCEDURE `sp_UpdateProposalStatus`(
    IN input_proposal_id INT,
    IN input_status int
    
)
BEGIN
	DECLARE affected_row_num INT;
    DECLARE status_text VARCHAR(20);
    DECLARE current_status varchar(20);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET affected_row_num = 0;
        ROLLBACK;
        SELECT affected_row_num AS affected_row_num;
    END;
    
    SELECT status INTO current_status
    FROM tbl_proposals
    WHERE proposal_id = input_proposal_id;
    
IF input_status = 1 THEN
        SET status_text = 'Prepublish';
    ELSEIF input_status = 2 THEN
        SET status_text = 'Ongoing';
    ELSEIF input_status = 3 THEN
        SET status_text = 'Expired';
    ELSEIF input_status = 4 THEN
        SET status_text = 'Terminated';
    ELSE
        
        SET affected_row_num = 0;
        SELECT affected_row_num AS affected_row_num;
        Rollback;
    END IF;
IF (current_status = 'PRE-PUBLISH' AND input_status IN (2, 3, 4))
        OR (current_status = 'ONGOING' AND input_status IN (3, 4))
        OR (current_status = 'EXPIRED' AND input_status = 4)
        OR (current_status = 'Terminated') THEN
        START TRANSACTION;
    

    UPDATE tbl_proposals
    SET status = status_text
    WHERE proposal_id = input_proposal_id;
	SET affected_row_num = ROW_COUNT();

    COMMIT;

    
    select affected_row_num AS affected_row_num;
    ELSE
        SET affected_row_num = 0;
        SELECT affected_row_num AS affected_row_num;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdatePwd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`111408512`@`192.168.56.1` PROCEDURE `sp_UpdatePwd`(
    IN input_member_id INT,
    IN input_original_hashPwd CHAR(32),
    IN input_hashedPwd CHAR(32),
    IN input_salt CHAR(12)
    
)
BEGIN
 
	Declare status_code INT;
    DECLARE current_hashPwd CHAR(32);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION

 
    IF input_member_id IS NULL OR input_original_hashPwd IS NULL OR input_hashedPwd IS NULL OR input_salt IS NULL THEN
        SET status_code = 3;
        rollback;
        SELECT status_code AS status_code;
    END IF;


    SELECT hashedpwd INTO current_hashPwd
    FROM tbl_password
    WHERE member_id = input_member_id;

  
    IF current_hashPwd != input_original_hashPwd THEN
 
        SET status_code = 2;
        SELECT status_code AS status_code;
    ELSE
 
        START TRANSACTION;
        
        UPDATE tbl_password
        SET hashedpwd = input_hashedPwd, salt = input_salt
        WHERE member_id = input_member_id;
		SET status_code = 1;
        COMMIT;


       SELECT status_code AS status_code;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-10 19:46:31
