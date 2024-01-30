-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for Linux (x86_64)
--
-- Host: mysql    Database: as1
-- ------------------------------------------------------
-- Server version	11.2.2-MariaDB-1:11.2.2+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `as1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `as1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `as1`;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `answerid` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(200) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `questionid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  PRIMARY KEY (`answerid`),
  KEY `questionid_idx` (`questionid`),
  KEY `productid_idx` (`productid`),
  CONSTRAINT `productid` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `questionid` FOREIGN KEY (`questionid`) REFERENCES `questions` (`questionid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,'We refurbish the old models and resell them. They are sold for a lower price but work perfectly as well as the same model would have done 10 years ago!','Greg','2024-01-01 00:00:00',1,2),(17,'Haha no! Not at all! That just happens to be the brand\'s name.','adminuser','2024-01-25 16:26:06',2,3),(18,'Yes!','adminuser','2024-01-25 16:52:58',3,6),(19,'So Am I!','adminuser','2024-01-27 19:21:12',33,3);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'TVs'),(2,'Computers'),(3,'Phones'),(4,'Gaming');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customerid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`customerid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (2,'test','c62f60bce54f574daca881635ce633169f8e65d8','test@gmail.com'),(7,'greg','06162f20c663108045469155bc424b39fd19d4c3','greg@hotmail.com'),(8,'test','51abb9636078defbf888d8457a7c76f85c8f114c','test@gmail.com'),(9,'user','a207721d4377033c99a4161e606d7cfbd4b14207','leoplod@gmail.com');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `employeeid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`employeeid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'adminuser','8439faf5a6990be7f61902db8ce5639e7b30153d ','adminuser@edselectronics.com'),(6,'Greg','090b1191f980ce1276359ff363d388e56d5d25ae','greg@edselectronics.com');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `manufacturer` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `image` longblob DEFAULT NULL,
  PRIMARY KEY (`productid`),
  KEY `categoriesid_idx` (`categoryid`),
  CONSTRAINT `categoriesid` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`categoryid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'Samsung S7 Edge','Samsung','A compact and uniquely designed phone with masses of functionality',150,'2020-01-12 00:00:00',3,NULL),(3,'Killer TV','Killer','An old fashioned design with a new twist',200,'2021-04-06 00:00:00',1,NULL),(4,'Xbox Series X','Microsoft','An Xbox',590,'2023-01-14 00:00:00',4,NULL),(5,'PlayStation','Sony','A Playstation',400,'2023-02-09 00:00:00',4,NULL),(6,'QuantumView 65-Inch 4K Smart TV','VisualSpectra','Immerse yourself in a cinematic experience with the QuantumView 65-Inch 4K Smart TV. Featuring HDR technology and a sleek design, this TV is perfect for movie nights and gaming sessions.',799.99,'2024-01-25 00:00:00',1,NULL),(7,'QuantumFleet Gaming Laptop','CyberPulse','Unleash gaming prowess with the QuantumFleet Gaming Laptop. Powered by the latest processors and dedicated graphics, it offers high frame rates and stunning visuals for an immersive gaming experience.',1299.99,'2024-01-25 00:00:00',2,NULL),(8,'EchoStream Pro Smartphone','SonicTech','Elevate your mobile experience with the EchoStream Pro Smartphone. Boasting a vibrant AMOLED display, advanced camera system, and fast-charging capabilities, it\'s a sleek and powerful companion.',699.99,'2024-01-25 00:00:00',3,NULL),(9,'TitanX Pro Gaming Console','FutureGaming Co.','Dominate the gaming realm with the TitanX Pro Gaming Console. Featuring cutting-edge graphics and a vast game library, this console delivers unparalleled gaming performance and entertainment.',449.99,'2024-01-25 00:00:00',4,NULL),(10,'QuantumSpeed Ultra-Slim Laptop','TechInnovate','Enhance your productivity with the QuantumSpeed Ultra-Slim Laptop. Featuring a razor-thin design, powerful performance, and a vibrant display, it\'s the ideal device for work and entertainment on the go.',899.99,'2024-01-25 00:00:00',2,NULL),(11,'UltraView 4K Smart TV','VisionTech','Immerse yourself in stunning visuals with the UltraView 4K Smart TV. Featuring advanced HDR technology and a sleek design, this TV brings entertainment to life.',899.99,'2024-01-25 00:00:00',1,NULL),(13,'Asus VIVOBook Pro 5','Asus','A small, compact laptop useful for basic work and small scale development.',449.99,'2024-01-26 07:50:00',2,NULL),(14,'asd','sda','asdas',123,'2024-01-29 12:15:23',1,'ÿØÿá\0Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0ÿâ4ICC_PROFILE\0\0\0$appl\0\0\0mntrRGB XYZ á\0\0\0\r\0\0 acspAPPL\0\0\0\0APPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0öÖ\0\0\0\0\0Ó-applÊ\Z•‚%M8™ÕÑê‚\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0ü\0\0\0ecprt\0\0d\0\0\0#wtpt\0\0ˆ\0\0\0rXYZ\0\0œ\0\0\0gXYZ\0\0°\0\0\0bXYZ\0\0Ä\0\0\0rTRC\0\0Ø\0\0\0 chad\0\0ø\0\0\0,bTRC\0\0Ø\0\0\0 gTRC\0\0Ø\0\0\0 desc\0\0\0\0\0\0\0Display P3\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0Copyright Apple Inc., 2017\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0ÌXYZ \0\0\0\0\0\0ƒß\0\0=¿ÿÿÿ»XYZ \0\0\0\0\0\0J¿\0\0±7\0\0\n¹XYZ \0\0\0\0\0\0(8\0\0\0\0È¹para\0\0\0\0\0\0\0\0ff\0\0ò§\0\0\rY\0\0Ð\0\0\n[sf32\0\0\0\0\0B\0\0Þÿÿó&\0\0“\0\0ýÿÿû¢ÿÿý£\0\0Ü\0\0ÀnÿÛ\0C\0\n\n\r\n\n\n\n\r\r\r\r\r\rÿÛ\0C                                                   ÿÂ\0Éº\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0\0ò 8ô¹i*ëYJ¾žI4°Ì\0E‰X£Ñ¯Xã°…FßiHž! \0\0\0\0\0\0\0,zŸ÷yÖem•·Š©×ãk«§S–Z¥„“eq]n#UªÑ\0APÙjÉ&rÔ¼ã4³4\0@W1G4,Dp0p¨*\n­tkCkÌÛµ­Ø¨¦tfÛ¥aè~yÚÖ6UÚjF¼E-çS™ã¢µÊ¨5í\"ŠÐPKÌ*¤Ñ\0PAAÑ4wy{S{Ë—$º¹„zÄ¶ÐF*Ò©mž¿†¹uñbÜÏLŠ;k90tµîyÖï­Ï>ëè‘çiF±Ãr®{±F\\ÈêÌs±%DJÔŒp\rAPµU¢¨,¬ž;I£Ít<¾³5¨&A–iËH\nN³™Ò–*©YuÊCsíÒ-\\GèÖ,KRE°ØÜ9íänA„hô!ŠÐS,±!G´Aìsg\"ôss\ni7=	Û‡¬AaÕUt8—rLkbÏ=)¿gF¨WÐŽ*%ŠÖ9Šƒ\'….n?=Q¡®h9¬¨Ôˆ¬ˆ©`¹Z³O§h\"sÚË«ZK3[«“N|J[®ÅMHëG*Ä§£Œ‘yŽl\0 >HE´ê’+<bIP`G2â¹\ZW%h€(\0«d¨e±+Š”(@\0‚¨Õ™1ªƒ\\6Ç\r!ÊŽ;*U\'b±DèÁíET–«ADQU	]™2âÍ`±U\05U\\Â­KOVé™“E¢‚\n(#ÚKYKDO\09µëFDÙÊ®MX¯:1¤Œ`¬G\n¨+¥ˆQ¢¢\n£%l-,¥u\'#QÀŠ„ªŠ£àÁèˆ\0¢\n#Ö¢W¢Ö¥f»()b(\n5E@RÕÖÉ»Þ‹š2@…¶\Z@HØhä\0¤P‡¾¬•ä*‚FŠ#^ÂÔZNuÖ³‰šŠ5$DˆF:\"Wegé¹R§y¬ð•¾‡ì«äKŸoÜ³âGýºE÷VûÒ±ð¥®¸óçÛ}ç-×r÷óv\nÖ³Z¢ÊÕQ\Z8VŽzDJ†LNn \0\0\"¢€\0\nG ºbæ¸h8j‚8È@“¤B¯#Ø§+.Œ‹™bJöX)´¸Ty*Tii°§]¼`²z„†aU EG/Rå/L÷íççaõu²…ð\0\0\0\0\0\0\0\0ŠPá|‹épø>/¸|<òKXOÆ¶†»\Z\0‚ÕYªÃ`…2]DTQ@rª*kRÒ„èÅ˜‰IŠ<h*( ¡\rúÍZÔP|/Eh¢\n…€±ÂÄJ‰§b½ÉjbíbÓÜö\rÅ‹¼éžgéŽÓSYE\0\0\0\0\0\0\0\0\0\0\0\0\0\0wæO¯b>Üõ—¦+Øå 	D\nÈPÔE\Z¨\"¢Š\nHºÍ\0\0\0UU¥J°„ÉÅT!PÁfB\"D\Z9G\njéekË›‰¿€Io{¦w¾¦Žæò\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	óÿ\0Ð,>è»6ÍÜ9é\0—$TÔTÉMQÈŠ*¥ºš¤Èãª ‚‚\n\rU×Ü8¡ÀÕ ñŠ8ADr¤DBÞ¾FªÖæz¾R·Ù\rõO\\\0ç¹§ªÌF¸\0kp¿P\0\0c\'-Ô€\0TË7Ìüc©ð\0Èø£îï(·…½Ïm¸¹h©¨ +iÉ4@\0íª:PÔzf±U\0T\0\0\0\0ÛÒÌ³©Í­ÚY¢(  ‚ƒGU@$„míäl¼ÿ\0¼óýçêVçº™\0<Z_P<Û>lb~£¹b|MSÐ|ÓÛ<¨Ùä›Ëž·1lÒw)¦{/‰{·šÒ—Í»3Ð<SÚøâ‡(Ëg®îej€ÈuõÏ‚ún{s6\\ë9ÜöõT±@ILÑ%UIMI¦Ž\Z*@­Qìá*¦­šwu%æ7påAé\rYˆ‘åi¬^šÌ5ªµNFµ&)6æëi¶Êöé\"ir;xŸvhaîo + C¼ãÐKÙÛÕ²:*\rÀÍ–èeÍxÝ8;Ôæz\"¦¬á6ƒ6[¡Jè\0\0‹ðÆ†6ölPßNzËSE@ŽHêAÍ‚X¬.Ã¯jfó‰¿bw,æÕ‡½•áW½¯YÑÂ”·_Ð[¶ØÃ—â½W\n8›\ZL¬Fº™¡\r ’7¼‰äé:9¨ëº¦³©Êz7¬ýUèÿ\07}#Ó \0\0\0\0WèžuèÇ”ºåÂþ%lô\'åÊ3_ÍzÃÖüÞ<\\ÎSHöI\Zà\0\0\0\0\0å:¿>êùÞ‡\Z\Z©d¨P\0Ö¹–XeÚr»F–©Ñjs6³­Ìü»A¡B¶ž€Ü*ÇB˜Ó–Nú:uœ£¯Buëc%–\"Ìn²\r™y~§™’2@Œ YDmKªE¦TšÙZ1cêp+/í‡ýS·?¨F¸\0\0\0…¹‚Þz](R} ÀÐ¾\ræ:ÉnÀG \0\0\0\0\0~\'ö_5tQÜºÈfã $rGf;U¥Óì9®„–«ˆe¶Î´ðwð‚T´WtÊ\"m_~zœ\r,½×È-ÖÍ6açhKw4lFˆáT@T‡C>ÍXÂK¿³î>áð/Ñ]3î\"(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0lÿ\0•7«iãJÑ¸Ûš¨dJ )~½¨W¢±²Q²ú±²%•«Ìu\\±¡¡Íìš3òÖw™<X½œšóÂmÇhŽ®‹Q½Ù±«ÐEE@\0\0pêjH©ŠjgS¯‘¿ç¦}ðwq¼ý‚C0\0\0\0\0\0\0\0\0\0\0\0\0\0qgaâ~aÂhÏ£#·¯âòõœ×6\\…AÂ5Ö-‚åUïqyfZò!Õ×ç\\_¤€#ÞµÝ¥ÕG	\'[žbÇ­”:ÍŽ·™G4‰\ZÐz¢\n¬ Ö´µ[ÆèçLÔÅfc”tùÏ£úçÙd\0\0ÄàOY9^ŒœE\0\0\0\0f\ZÇ˜ùÉôó	éþeN\\½i™Šºyš½¬µ¹RÖABØ´%Íe©$¨¡—¡\rR]7Æ\\ºrKbÛÈdU‚?hØ<ÿ\0¯bÇ65.BkeêPK©E2\0 EE@QTJÉ3j¢XŠ¥ÑÍÖˆ²v±ÈZeMŽsRO·¼è®˜;ò>L·WRÞo;sQ…žŒaè¶¼¹Õêy£O@Åæ¤C+jÄ¼ý½’Z·Æ€	c[:8³¬îOÌv|ÕRmôŒ|É3»\r™¨ÕFØ××·+•W5®p\"8ì5¼Õ#Ö¹î —²âœÛ#kgµÊ\nÕ¥T…\0hf†šøRËZYZQ&>¾A±ËI?£ôÏÑ3ùoÏºÏ§y¹s´¥^} IÖ+¶ÈWÔk”G¢\nåk‘%APUEIÂÄ n_ç(ît™™Uµ4ä«@¾–cÎÆ+R8¤°SÒ­w4EXAÊ­\"(ƒ§­9$-ABþbÜ‘QÌQP\0Q\0QDŽ`@A6O¥—ª73R‚Ó±{\"ëžÒÌÓëÆ†ÍçgCœõ¸k•	hÐTTG ÉB!ê‘9Àˆ¨*´K‘I\nƒ(U¹)·SEs4õœÝ¨*\rZÆzX‰tRZæÛš¤ò¼T”ŽE*—•ÖR¡‘ÌªôŒE?I«ôš\\|2Š5QÂ«V\0PÊÔp•kh¥RôL?Nçé­NcÇõläê®:ðœ¯°âz<^Xý\n¿™#PHÀG:5×4r\"¨Š \n\"*¢ ¨ª\0€¡3mLDôNNÌ–mEnF­*é½Ÿse9IfjÅzÍ•äª‹4SÊÅR4W: ™`	Ö\' žWIb×?M7iõùëç‘z÷9Óž&žnüÈ’©*‘6FŠ \"ˆ*ª#š$5ö½»~O©>¾ÅgAöéÎÌGœ½|÷žzß/ß‡\n5=Ÿ%ãIQEI²©¤h‚¢˜8c•\\ÐpÕ#È:®Sss¤ãoÂ+Ó?óÎøQ‰š)UXDÒUµ­\nÅ¶×f‚åcI7VÐý]ØgÓãÞ‹£;O§ßs¼œ×YŽÎ}õ¾~ö‹\\þg>‡ð\\æ“áÒÖX–4T8ˆ‘ªÑP^ïƒõN}úž§›ÐíÊƒ´ipé¹Ïífz|õùÞûŸð}š<>¯šóþ›æ~ÿ\0Ž£¾9-×´±£ÅXœ6icI\Z“9j:Fˆ’5ª£$@Žù[–5ð´s–ÓÃ›šFÕ¼´6°´&³Òy£-¨ûj¨ý¹³yã¤¿dzù•‘ÈŠŒ7p;¥ôÝ\'åôí\Z„Sf¿\\Ú:¾výþC­§r}YqóbªoÄ \"Š <V4klÑö_ú—¢ÎcíòÝ°N{Ò†=c€],ü{±|ïÑy~³Š{Ÿíøj\"½\Z4á¤ÓÑY+Õˆ²¶5²EbD¨Œ*#†cégo\"($¶]Î·Q\"–&-©]d±ªs^½Ïgä.ç¿L¿äN³{!ax·+ê>iëó¯f*rö€ \nŠVÏƒ ¸Kåkç¼Î£–ëóÔAAQe\0’S4~–ù›é>^‹|‡\\Îy^¬@&€#žÉ¿Æï¥ž{wœÇ³Š–¾‡Âb\r‚ \"¬¬	±³N\Z¶OÙ\nÖ¢ª ƒ•nkglco˜æIrëBI¡œÂ‹\\ÊÓtË›V+Œ!·JÚìëæ7žæŽ…Õå„j5×*¨á}—É=vwëS—¬É×Èµ{ãYí&üƒŠíø¾¿=¤’\\×,0‰\\â1É\"Q´ÒoñkyëôÞOQæôU¥åØô}\r?	ßã‚\rá2Îçm··K~xgë+,÷ùñ¢ Š×¨(£‘Óª#š*\0ôb=¢**>ÝMöyÌ‹ôºrlðX²öe›IRÆBh+ŒlsLA,tiFLt‘¯4•jª\\qDÐèlÏïçŽôì‡´\0çlmT¹Ä‹¨S\nõ÷£¦¼ƒŒõ¯#íóä|Ìé\\,¶»‰QŠŒÖ„}×\0ÌôúGKç¯¤ùvv&ÏÎÜïO—Â›˜¬^œl»\\až¼ÊÖª£”ZW1gB7£/™•«ž¢\rdX‹\rÜ‹ÏÔ±N-–7³mÑlµ3Z¬#™¾#¦ÕZ,.‹ë	›+Z¾	–^“¨ô\nÁézœüëS°âu*ÏÒsÜ}!Nïj\0 Šg[|“W¬ôüï•yß±|W\Zòei@P¯­¿é8s]ïžÕ˜éùí*Zóóü/¸ñ6ð.>Š9Š+ØáÍDšxÕjDrJ#eÊÕ©†O:ÄÌA;ŠÄôñ¾.¾7¹’1¯sá66¦[t$dŒ[Q&”Ej²ŽGdÕE&ö¬¾¯mËë÷‹`X\"‡!£½Ï’rÚ}^:q50øúç3¯ã»éÑë5Î¬×\'ôüû¯“–¹ê‘CÌ|[ën;7ærÍn[EEFÂvÙž±ÓÏ\n›½~nmŽ¨¼ëÎ­eØº•%ñºÝO)Ëí¦;5BÁ¶\n*´T•Ê×+#¥„˜¦O¦’X‘YŽíš¹z\\Ö}ubš¾¹aÏ­(± ­dðšB$ª#„·VÜ ¦lþÝåžÍ¶Îÿ\0KSÒ±9î¦Ê=L\\ÝÏV%BàŠEÌuÌt<[&¹é“ºLMÀ°óßBÀ7]Éõ„\\ÒžYâÞÓâÜö\nsÒiæõ×=FokÌkÉ½,Röñbìcì^`+5	]8ß<ôÿ\0.åï{¢v=Š#„h\0DQGÇ$Ó\\Õ›W1f•QÈˆª&¾D“ÑIõÎ¬2G¿14¤(ß¦H6C_:äÜOjØëunæ±$Hô-Ÿ/õ×k=5;¼½¥hŸ–›¿‡BNoÐºùÔ\0\0\0PÃ»{‘:ð<ê.ïÅ%õê<†Ö;p~_é^mŠ0tüÀŸR`&§—×Âkeéû¾?=ÑåhöùòC–‰SG2þ{Ðó/MóìúpÜ×sö£Ù9\n*Zª€¨\rGÄc’t@F^èÞ¢¾!Ù×(ibXœÍHÞÍr$QÌz’¤6ˆXÖ–ïæË¨¨’^£¯-bëfªúç—vùëéòÁ??`\0¹šT·Ç¬Ø©oÕó€\0\0\0\0*ùÇ¨Ö9³šì\0<ëÑ©ËÇØçõ<¿OÆ¹©#ß‰X§÷¿—}gŸ^“œï8­p«·½ìø®TÄô¯>ô\'ÙóïöïÏ±G·¯–\'GÑñŠ­Y±Ìr9\Z³¢‚ŒE›¤ÖGNÄ{’#ÙSÑë‹‘\"²wUy&¾5Ò³,Ö‹-Rjx›nVnÒ½4Ç2LÕ¹MWÝtü¿Ôyû	±QÉ±»Çö¿–¬€\0\0\0\0cÍ@ì€\09æû~«ÉÄ\'!BAPGžÔâ]ø±ö9®“¿Ï\0g7¾à»o\'Ùó?%õ-žÇ¢;§4ŽV¥ŠÀEh{$±ŠÕÏEsQF<dÛ3›4›Ä±ÉwZõÄd¨¡žÌôì–b‘àY¤{Cj\\û¹Ü­D–V#ãC×²lÏGY¶= æŒî¸^çÓó”\rñ\0\0\0\0\0¯…ÒòÇR\0\0s?YƒË¿‚+ã#š\Z¨ºÙ=ñ×Ø£Ññð¶°·uÌc3±à»¯\'ÙñþÓ|Æú¨º€±Í± ¡QE@šTUk‡\"´G\"Xµæ‰*E4;äQ±“Õê;Y“Nj¥ËÑW:i\"–,1ùª(¨\'W×y7¥Îû4—Ÿ§Gv½;u{n/²ô|÷¾@\0\0\0\0óvñà#çü´ëbñÊ|}T„3ÈYU®Bè©×ëá»¦QÎ´qŸÔë;Öaô^_±æ^Iî¾;¦}šk×ŠI£ZæX¢NV«J¬YTA@z5@r*ŠöBËoÖ1·óµí³RÛ9õ¡$V7Å‚J‚š/5D!DÅuMé©Vc¼çxl­võ^×ç#¯/­»Ïƒztû;ÃjGÓËó_o^ºy­3ÕO+ƒ‡^ê0òìoéÿ\03ù¿µôypléêF\"Êœû1\\l± Žs%_\\è¹NËž¹Î‹œéóª–6ž\rîV—EÛ˜!¬(Š=’F#š*¨M\0ƒÚæ´²Ä°\0ÓÑPV9¨E,7Ë5wÊ(faî>ËjæIÏ®<‘»§	GKŸ)dTp\0£šâí¬iå™a±8eæõ×GÑoš«ÖA\'ž§vÞ8Tïôž›Å®|¡é¾7§\'nºÒ;×óåçtr/yH‹ÞR •Š‘,%¾¯è^Sêüµ±½šÏ‰›WÅû¿3ë—×˜\n\" MŒÑ!eˆYæÍ*£ezÆâDTV !°ë-§v–¹\0‚ldkM>H%ÇL¦[§Óœâ¤Å4_!Yd’±¤h²‘¶i=´mãÅa1Ì\0\0\0Š¢\0¨˜»ê5Æýh¡(\0‚5Ybˆ‹Þzÿ\0‡û–5ÎíãìsÓyížO7Ë²˜ÿ\0O$±UD–9 \0-AP\0‰I´%EA$\Z\0%=—5ØÅÖ\ZŠÔ5±v\Z{Ûc+åômÏœrM´U7¹ù§\"â5‡ŒQÈŠ›ë[ÏŽ@9ñ\0\0ÉQfòê€g\"£ŒÌ½Lž¾ù‹zHÖˆ®ðXY!s\Z½eè}ãÁ½ç\Zç7ðwùêŽG…/„7¡ç½œ!b¢8AEš¥5TÍUx‹6  ¨°j å³-kœm{,n¾FÜÒÍmŽ˜y÷°÷Š‚,ƒ›9eŽt­V ‘ª,³ÔRËªN›¶kØçàP1€\0\0u[•u©d@$ƒ£æºûTk/W‘©*ÆSÖ\"1I•Ñ{Ïƒ{Ç;Æv|waCÎôy¼Oœ{w‹vÂ5¸ù E±2PÕŠ×‘L„nxÔcÄjª\0©äZQsA³3XcA·…²ºz^dš8šÈfVh\\J0W‰$­‚ª^£y¹àŸ—Ï\0Î@\0TWÖ³_Z•P™Q´%Ñ0Ýw½ÇôœïOJ$©®Ñªª4#&Â>@é½ÇÊ½Kæ·²¥Æµ*\\n/;æ>›Ìtžh’\'\\ÆÙdZîzJˆä¤q ÂUHRV‘¸Qˆô#W \"¨Äx1$bTŽzý9\"Â„›|æÒ÷|LTfú,Ø—>‹vžìð‚ÔZ.µVÆÛÍešêXøÊ’ÕÌíORÇ/¤YÙšyT¤¾•@zg·šûºùTÞyœåžÅ@vtÕÖæ¢éaôåqÕffTlÄ.‘\Zcd„sQOVô/:Õã½y0®GHUÍÁ3eóþ—”Vpá	\\±•3c	F5%H”‰lrÃ:@¤¤B<b,ƒÕ¯ÖHÒ™¾v™MÄšZ+zœËž¹Vm6u¦\"<ÏT¤jO5PºUq+ÐiÖ¨2xq´™&ÎÐBl\04/ço6Q:V	Ý^œ˜®MaféFBÑä^çæjô}SÃ1¸z½?ækvÇµm³£òså¼Ó¼ÛÓ×%£uåzÄ³2	XÔ§!È¥5ˆÄ”#W\"sÈžª±¤	ë*f²ü[ãI–a\rlÝI¤AsÕ€ŠˆåE’K |ë*O\Z­ˆ¡¤Ã^,¤—ZL[SZI3o\\¶ŠQYv£\rbUm±,²„hŽ±îQÐH¤r(—,âší¹lú²Ö²Üòî’=}ªÞÂÞéŒ_?Îr(+ã•‚+]T(Gƒ´ªŠ×JÕceH`èì¥f¬ºã\ry\"±usô¦Ú<ÏV!IÙËÓ†›òPØ\\b7RµS(—J*Ieõ †”™A®™ªe†ªä*j¦Z\Z†`ºf`i™¦¹Aªe¢ë+\Z¦Pj™Hk%šÉ–F™˜V¼¸aÑOÊ®ºôµpÒge29×LÖ2DÖ\\€×\\t76—7ÝÎ‹ÐG†«¶bópÃhÅ\rº¹Â]JeÅöÒBõÌRkdÇ\ZÙ1ÃÿÄ\03\0\0\0\0\0\0 !01\"23@A#$45BP%D`ÿÚ\0\0Ùc›“v\r–ZU¾Ê«!qg*éÔá:-+­KVwÊÙßm®sP™×§D­oµ‹£jf;äÙ^Õf¨R³–÷yfÁ¿JÒ­ÞµÔ\"ÒºPÐ]ÌGI3F\nÓuÊÀQc‚À§Qidµá_±Eè°¢„$]‹»ÖØè*Jg‡ÊÂŸjy]®Cå»²·cJ-î=Ïp-ºcîùÏR…“á°ZTiPÏ®0Þ²T°¦Â\\AV;5ÚÜû¸’rèµ+‚ˆVïÙF.å1»ãØçtÊ—ö¨2oŒ®2Z²¶Ël²Ò´öƒÜ˜®eÓd²’MHø€^Iíü’ðàé\nŠg°z‡9	¡Í<û¹ü·†éOeÑ§éÊëÉ*Ä(¡s_/Ï3•þÆ\'—;¡êYã\'xÎc¦á7Âw…Üì®µ/9YuWß¥[´Bæ]„Ç†\'T]A%ý5-KRÖW0®bç!(\\Õê\n/7l€£rkX¥¿2êêêùƒ•»÷6å«g&médÕ#¾(xRxTŸTùÍ¦È¿­÷[m–•nÕÕÏråj(Ieê\nç]µWß~çPŸÔ‘=oÔ¸àÏUAdpÒvÝjÙ|¬­¶ÊÝ ´«wm•ó²²²ÒV’7ôïBF©X\0ÚBq¾w´m:UïÙÔµ+ç|­²²²¶ð¯—•§µk#•·]jZ—E`¬­ß>.Œ—“â×¹u~å‚Ó´5™ö^;­övVØÿ\0l&¼#×½u~í²ZêÝ‘ºí\\ØÂçF¹Ñ®tk\Zæ0«·ì¬¥î–ûã+wn¯Ü)±jiÍîxN•\Z„fyEÄ«™MPô0Ì@¯Ò±ú^\"Ž^ÔêyØ¬B¹Bg„*\n0¡cÞ“Ïq“ºÊÊÝË«öHPø*}6ºº¾ç9­F¥9îrŠ	§u?bÓ¨8&©øc§-£¥b±»LQ”êJWªŽÂ*LÜFåSÁø”F£­¤7!6¡Á6V;³¥iZS¼÷5;³nÝŠrÐ´«íWbÖÕ­kAås\nÔ\nö«mŽxb|ä óCÃ•b¢á*\nu\r5=8ï9x«áÜ.¬WpuTJzjŠW²W12f»{|+Žô]Ë+/›åd\"qBh˜Œ ##Š¹]r°DlƒÃôÚAÑelŸQeî{°Þ­­T‡´©¢¥¬f%ÁÄ) š™ìœµ´]ßÃ+«öì¢”]Qîä_*aìÊè¸4I)z Ãª±pŽ¥Ã‡ÜWá”˜”x·Uá…¯,,?ìã?cnéPüT¿œæ°>Bó‚`3bo¥£‚Š/º{#qî1 KLoÖ>Æ!aÚ¿jÝ¸~$t”{Å²H^pØ‹ã³ïx—‡ìšâÂ×Žø#§zêý›v\">ÑÔKðSÉu‚áOÅ* ‚:x¾ø€Gà¾‚hdÐ{ñŽ½À	$Ÿ²âßŒŸ	¥¬k¥~†·\r¢ÿ\0 ­¤em5U;éj!v¦÷£Ì<^³Ò*¾Ê/«eøNzð©¯Î»ucŠ\"k˜öÈÅQ[OJí•u´ô@uÊ£m=~Èk©ç“ÄÙ‰ç““\\ÜF–¦oOê°GBpÙÆt!²@ë?+ï\Z.GNîýÜlÿ\0/ìJGáÿ\0›»„iŒ8nuQq&7ÑWQKWS„áSOÄc1ßQQ>#_]HÙjñÌ%b˜®%!‡2½ñduDÕË‹CK5n7…ËŠËxí-e~\'[Q]‰Ö×PâUÐâOÕ§†±¸®ú´«Ä+dž*Ìk~\r‰TÔÉ_ý¸åFC‹ÔÔáËë*°\nT2Ÿf;L*p±ÐVñã8G^îý¼UÚªß›zÅi(°Ú/xšá¾N+ÏKÄí†.\'º«#á¨¢Æ4SÃŽ¶™õµ‘pìFqn\"\\WÒ—ªæ?n	N±h`®Åðù?DÅ[K‡·¢fqe…=±c<)ð Çp˜0 }Môx[ýNþº±¥Ü#G<UÛ$h|r2Çôä=;lm›·ÇcþÍc²L‡ºÙÝrÊÑdÖ•¤Y¶N \"ð[¨„Ú‡µ>}Q³êRÿ\0[?O5=Œ‘°á˜};æ‚\Z†zZnTu\r+ŒºU,QNÇQR>!†áíŒRRƒ%<\ZŠ*J¡5=3¤¦t±SÃm<,’|6‚¥ñÇMpCm%3éàäÃO;vÕÿ\0j/¦æê\\¾Ó~CÝÛ¶tfÓÊî“ÙVÊÊÙd\0ÖsÂæ£-Ö¢®r9Ÿ\Zþeg¯‡2|F\njžÁâzú<w­”Õ@Ùûr;DrRÇôûmLøön¯<rj‚†y”X}<Mš†ŽU>¤ŠHÑÓÈ\"Êè<\'¸l±ZNnQ€Q:…UzŒ+³Åßëi­ÄÏ#Q_Äkñ*ÜM³\nìnŠ¶F­¸ì¸…SñÃˆbø…^‰UËT|aXÍ]]IŒãuÑâ\'ˆÛªÝ¬jqO†§Àí´(if-ôr‘éJ4ñ†ÅJÈ°É\'¢L¿F”/Ò\ný¤œ‹ô¸‚4QÝÔØ~¸k$jmTŽGê4ª5#Ñ>Þ–U(,uó²¶AËPNór®£@£ÔN,þ\r­ÑQÙâïõ´¿ÖÅ¿ÜñE½%Q4˜_éÔ¸ŸGÉX=HÂ©)¹¸Tx|˜©ñ‚Õáð¬^§­©®‘q?o+:B.ýç/95F@s+¬ˆ¶Î¨ÂS£¦™ÌuT°»ÖÊI(Õ”jœG=È]È+]9º \'HÖŽn çu2\0„…s\n«o»HZB²²±]UÕÑÆ€ÊfÜRT¾’¦Žª:ÊnÄôÐU1­\r¦§’Iéà©mEXýåºžÅ1@ÊŒ3«tÔô¬NÁp—\Zz\Z:USAGXšÐÑÙšVA%VêêÚvY»ÎPuwä56’GP#OkÚšË©Ú uå4#w&±ÊÊÉ«KP(û€˜òõêEà/yV\04ÂÄ,;VZU”Kª¹EJÍ\'…ñI7ýãÑ³[­nÉPyµËF§ê\Zˆt.Mh\\²¤\0¶ia9Ö^òƒV›d\0D€¡Å®³ƒ´€ƒ	M«˜Æ§TôÅýÈüÝ]:ÚAc¸kˆ­ûî ÆÙ†À÷¾WÅ,v¡*F„z†ÊX®ç¡e©œí·ªÓÐ›uÑªîNtÅrœ´´\'Ê€©óéF`Ÿ:æ½\\žã<»ÅÎr7X÷1Ü?Ä‚o½Ç1èpÈçžZ©a†ÝÈ<22õ·^¥ðL~²bÐ,¬žÝrÒËì¹rmš®ª‚!ú£nq&”ìA«Ö/]ÓÖJÖúÉS¦‘Ëª\0èÊÊÝ«\'xØøÃ—Vœ‰ßN£‘’³î	\r×²%$’Lø¡²³¬JÑÚ‡ã ãÚƒ[g2á­,Aîxü]üŸ¥;êbÕvN¨‘ÛÚÝK–¹ahª·{¢ÐÂœ,ssÃ˜Z°lr«\r•gÛbXå\ZÜSˆk1Ö—ákEË¨rgÇf¾%ã}”/öM	p‰sõ¯QQ®`.ÄTÎZ‰>vX­.\\²´œâÙ~Ù6Wººi÷Kãe•”ç¦\rBq\nö€ÑönsX+¸—\r¢X‡WÕ¢\\÷2œ”\ZÖe†tÀ7®óµ£(|Ibµº×;º­%Ý2âÌ¥ÂL:®è¥Œ];ÀMjŒY[»u©_¨MùH.ÝÏv§p}*›en!KA8Ã\rq§Æ°Ê¤$Ý’æ…5u;gâÌ*%WÆuO5x¥}i\0¹2˜”ØÚÍ:Çþ\rA\0)/)$ìkWŒ¡ðï9X®YDY65 +YZèŒ›SQ\Zn-Z˜´ÓSä[¥X¦w”ze¬\nx³²²˜ém%;êêi¡m<=ì¸¯G\Z¨ªž©úº„ÊªˆÔxÖ)\ZgâÍŒq ¿Í+×ù¥r<gˆ#ÅØ¡Sq-2~![\".scŠm;Šm;°ÜÃg>@ÈãŸ[N²g%¯½›j\r²Çá±ê\\ ´„ZEó¡Äp¸à¸%{¤áhIwLÜ;ˆF¥Ãëa’z\ZÊv„ÿ\0óÞ-ºÒ´•b™äe\'É5Šwëaú¤Ëâ\n,8bXÝn$æ°¹2 Üº.[\nä5zp½:ô¥zR½1^zv¡ah`íè5G,ÏàÇræiM²c»ñgŒï¹¯{\r6=]oÔÈÿ\0ÔªF;Q*¯Ç\'­‰;ªnwíYjWD•¨­i]”Ÿ$Õ+ô28Ý4˜eh(ªë©hcÅx®¢¥ç¹”È6ÊÊÊÛn¯öòµÎj‘¦Æ@µÝ]¯HQp9ÓÑ¿ÀZ\në´”MÐÇŽÉÙÇòÊOZTç¯\nÐ¶j¼[‹\"TÖTVHÈ\\ôÆ1›-ömæÏ’FcÜ‰%F4ŽnVËJê(\\ü{CÂ*ÊÊÈõMo|4ì–¡ÑùKò^í-&åµs²±Ï,€1]Õ\\å«³nÓ|ž°˜øäNý Æ³D2¸P¶Å\nÅŒº Ë‡:çÆë++eøØOAöoÉŸ%áJœ(jJ­ŽXGR™n–\"oºË¢°ÎýæøW²{É]\0kC•¥-sC)©˜Ø›êœˆMqjtº—”ØS\"cÙÈk‚Ð´.ZÒW\\®¯•ö_\'{K]‘ó¶ý§‹«&ô48~¦èbe<,rª¢†©¿¦BÁ<RDPVFÿ\0nÔ÷\"âäJ\r(Ü Jl77¿%ªç!dÖjW5ÁjZÖ¥u©{JÒ•¥iZU—áYY]¬‡1\0{ç<.”UT½ÚŒ¯e;]ËÈ´9M^\'§|È«+geo±Õ¤AKêKh\"‰Xb#Üï/yr÷L„M°±A·-hbyÔº¬¦=]]]]]]jWWWWWÏ–JÐ…ûEì­Þqº‚6ÐÒú°çSP>I*©N®letN‘Ohxž3$a‰ßq!²Ãô¶ê›ËãËuš,% ¹‘jOy·¹X C·ÝÎs‹hè»r²²²·a¢ê6ÈñÈ¨QÒK\"ƒáØm,4ÐT6¢ôæùß++v°¸5Öº£Ÿ%<Œ¡Ž£ž:ª¶QÇ+…BŽ–¾³lA¤+e8™Ÿn<È ²9gŽFDàÖ™IR¾ÍµËÎ††êw+6†•Ë˜\\	i	ž{pCÌuu?&&´ÃSÉ~%-=<Êªôõ\'2I\r“¥ÔG­hv¦ì¿k¾‡Ã©94ö•ì-‹€	±Z æ¿Ã`l4´Ý©ÃK±9OWWËOEel®¬¬¬¬´žÃ|¿äMÜ::6Ý5NC¤ä÷j4í¹²Ò¬UÐ!2Wù¥•¡„++o¾]\\hèÙÊ01”T¬’•Âž¦8bb2‰5;\'^™I%CäsUU5{*©_G6C¢ºº¿`éŠ\Z1Q‡©±MF(¹BvÈÉ?UªgÉ\\å^Ç•(¸¨ŒÀWè6Y]]mß—µuÖ\'bõM²n\Zàb¾G++¸&¹äv-–2¢˜tÊs	B9´ÅbO®lR~£L ×<èt8ý8š›´â® \ZæÃ¡lÓÍ(†:(KF]/“˜$ll\"/#Á­‹•P€WWÝr®¯Û¨véˆ±ÌFJå.SdköB¼\n\nIjÙúepMÂkÜ£À±™éd¦”Œ†G,%¶lBÑå$J¹u0¡TàULõÌ¥\nj‰L£¨R7™LF—vNT}$¤°ÓW4šX&mD;ª\"åÖþdùb“¸v\'ØP_%ù9{ZUºØ/Å$òÑÀ1*í?ä#‰gU•O«Û°ÖZÄÏ¬¢kÃS<Ö³—WÚÒ©¾»E˜ˆv;\\×·n&!ÝL¿<@±øÚÕùÚÎ¯¨Ì+]6À_¡‰¬ƒ2,®ŽCªð5;+•u}¡P¶Ìì7ùU7åŒ·N#Úy Òõ’k…9­‘¬ŽZ*¸XŒSÖkO7v&ëF;ÍNó°(¾­gË&¦iFEÀ—¹Äl#&¦ü˜a.ªô6åÆŒ.QD[oæ³é4%æµ8÷÷»Oóùr`õmÊ¶º:2²’fV‰ÒË+\"®nXã¢sé¡å§9¬Êé¤ì\rÁÐ7ÝVëÊrjc-Ê;)§e¥«JÐäZU¬¢#P`E£-o¶·\"o°yüQíæ7dvõˆyÇ¿»²ÊÛã•ñœ;eCg‚:ˆ±*PKbV‡Î#N!‚³¹deKS*z‡Ìr;Æó´&6Â«—àºàÃ¡;;ew-n\\Â®Õƒb¹wZWTB²²²±\n’’Z¦Ð:ãedr2Vb¸KXé”U’B_©RÂafXïöö_aÎÈ¦HèÝCÏN ¯¢Äii£*®¾\nESW5ZõT°¶Zù^®Jèº#äöÉsºº‹ËJŸëà\0\ZKæ@X?y(uZ–¤e­jWWW{”]Dª€zdèKPpØiá)­k\r(·e]¬§ÊùÝ]]_iQ6BñÕ¾ &©˜—äýÌ€ÊÕ7Ôrøc5 Ý!Í²aŠêêù]]j\n“\rš©SÐÓÓÓÌõYC.œ5ÑÔC5<”NkšñÙ˜—š†²ž–¯‡éjc®Âê¨;oTxuMj†Saþ¢&@ùg«U¡‘ªŒ5Nk˜îàë¼äì¼\0-6Ru ˆO´ùpºa¾v±®Ða‰FÇJ¡§dC*ªi)¥§©Š®9èd…ÑÎÙ;Ê\"4Ü¦Ãzº¥$l•¸·¹‹¨=‹¬7\n5N%¬Ž§™´”W~·Ó\ZhÌóI\ZÄi„‘÷äå|Â>Ê/œn÷O.ØÏM}KÅÕÕÕÕÓØ¡’y(pèè™n™ÑÆØÛ²¢ñ>’¹•¦†)Ó…M*lŒ~ÙfªJ#z©3ã±08;<geSe¢©‚=Îv•„afe<í‰µöª.™ËŽHÛ(è‘ƒUD<‰íÛÙY[/Â93ËGJ—uØ<]‘ËJ²²²¶Ñî8k#¦Œ™Õ>#O\nŽh¥j¨#2®zR×2VË‡BòêjØI©--z¨ªcGKUUN…KOÉj¡ò³12x%‰Ð¿a6XU#*et±‘=]Cs¥ž§#{Fu2p±xÈ“¸{6LoYËçkI\n÷ÙnÌQ:i)h©©YrÜz„ccÄ¸lEGSQNàAÆ¼>‚H\\ÊòÄÉ ©s§™ø<&æcéê(§¥¦åç+½&/ç\'¸1±;øXí3²Ž˜TM k\'š`\ZišuN_Šrs|10]K°}”%­RI©Î½¶ŽCµ†SËQPÞU2“_zf+\\Õ!O2{#csèæO™¬vÇÆÉðí.£¦’_$ÑÅA$‘Í³¥õPaµ\\ØÕmO¨—Ó³—Äõ_·³	lµ7\n‰­¨Ã4:´aSM÷Ë$MmAd”ÛØ“a­¦O†c>„!”­é¿ž8 åºSz‹@bº’äTµR@úˆ„ÑCVÖÓRÆçžÅteÑSÌ\'‡e{=Gª®®Tt‘Ò2¯XËyt»0j‘K^|Õ7ÝL_S‡Hct5¹=á¢É,®¤‰:’0jcl3f>ÅéÞYò“ãøÈ/ÉQõG8žžÝ\'!²iU;lÌÜÁ Šy\r.©jŸø•{*`mD>®²	˜k¦lp²Ä2{¶u¬õÔs7\\u\Z˜Cµ¶c¦w´•Ê«»)vÈÚgZ¾PñSkß¤Ìnÿ\0ÆÐŸÓ\'}4Ï2ø9…ùri±t¾wæ7&ùÌ®|6NïO5M†Ÿ³0s£äÔ@Ê|RY„Otƒ<fœ±ñ»[Å¥çVíÂ+}O•4^ì?_¤¬s4ùTDÏTUoõ6mÞyºüÝ…¶1…7—W¾L³£=\nºcô’àJoÊÊÈ…¥a²Ý±Ç²­ºéá!Ñv¤‰’¨…W²x„ÑP’Ñ<‚ínÝâZÄìöÑý\nÈ£lcã•GÖzÄ\r¨B-¶alˆ¶ßÆñkk\r’W‡:?øvÛå¬Ÿç6\0Qi6:Å_8$1KHñ${<Šëƒ·Y6*Y¹Ðì©o§ÄñÙ¹tûÃœÂê©&ÂXÐÆU\rRg?×“ã‹Ú=¤Ý»ñ»ñø>l™ñ‘¶ýB[gÉ°+ç|°ªÍ/Ø<Ñ~ÕWnº­ôË”ºM˜Ë?oˆaÕö·[ê?UfmfsýzƒfcŽÓIÜ;{­bŒÞ6”Ä74ØÆ¬€VVÊ–=sÑT‡äç5ƒ!Ò¿¶øÙ\"}£®Ù‹ÿ\0G#Ðo¥§™ä{ªW}nsýz¿Ž4×M6Óö\0£×)<l9BÁoÝº]jZ–¤Ë9Ô¸u;Úè ¥tsÇ(¯~ºí÷*ÿ\0¹³íLÆÕK+C%Ý„ÖR²(ÉZ<ÑÈÇK›æcëk$ÇD†ÓörxÛ5/ÌxZJ±VVQŽ›iqI hn\"êÈ´ÔÖÓÍ\0Ž¸9 ‡†ºîÙpj›÷+³Jñ[_[Q$Dêvâ°¡É‚©ü¸M/\"¸HÓ`­%k¦‚8d«1ŸuÈÚÈÙÈµØtsƒÂ˜tj²êµ+…Ñ7Æì\n¡‘´¸~£‹>ñ´OFmàçÜvë©]U›>UÕŒ„Wqv¨„ÏQ5AÞ|PAÏÁ˜}TµÎ,c¿Šóü¹šÖÆÚË¥s×NªÃEFaÈöôžÄŠ= ¾¡ÅçlÔñvµ_e“[ÓtwÕê*Dµ8Ëi¸Š˜Eˆq	•´|KËät²²ƒ¤©M‘ŽUsc¤Äa©«+c‰R¶:xª1\Z*fÖq?1µ5õu§ñ¶ÙÙ[výTb8Ãñ#ûs1’2¢ªp×C2SVWUs]{ì=½G±\'Åj®º¡á~ÑäàõDÇ\"}EŽn}B¦Æ1\nUKÄµR*œbê~,|j.-¢pÿ\0(ÃTœ[‡57žq$¸•BôQ,`UÑÎç9Ê„\ZFê¬p¿k‡ÿ\0®ª‡2¹ß,¦~§bÓˆ“ä|ŽÚ~ÎOˆhÒNlùåøüì{œE­r}NNÃÊuá¥jÃº,CêìÃ*a–™MUON+Lø”ì¡©†tOv·Ý]_a6ZÖ¥¬®\Z}ÂeŽ$|©¥·TÏêgÜ|n6í]]?Áñ˜ùf~WBÅX+&ÙºiÔàÐáŽGzJuèé×£§^’#b¼¶Ò`\\Ï ì?gÿ\0{ó\\_)©Ø½IŠ¿ñöOñå¹–r£®Ë«««««¨ßb›öL#îU¥iV\\9íÄ¿åCî«DÙ¾UtÜúÿ\0²Äsg¨Òv1]_³¸ù yìÞÊêêë}±OùáÞß\n·RŽÁ²wÇk~)šlÈÚ^&¤6váøŽÅ“žÖ¡©Ûj¾K¦Þ¹»f\rþÐüé.Êõ8ö=œÈÜÃ·ê¸û\":mgÅ27LúÚqNþSöS‹§±º{Lø·±\'WµB¬¹ÕöžªÊÊËÿ\0jïœnkqæAv8¤F:¿º¾æøX|Bž9ßÌ—›°8„Ù\\F•eel‚6+¦_†ï_õ·V‹;MØGûWýJƒ¢ªAg\';‡T\0`º.Šáj¬¬­Û²²ü¬­›]dÐ/%A•:ïw!›\0iZÔµn‹ä†öüŸõ÷Vý?;.¯••¶á#ÿ\0(ÿ\0h¸w…P=ÎŸ	9jZ»÷ÛutO·WMJù]4ô¢¥k0Öô\0iW=è<ö™>¾êª¨WÙlúì²Àã2bnùU(¤çS)…ØÓ¤âÑ˜ªò¶Ë«ý‘nŽ…‹J°]0óM]ræs$p*çmó¶è>]Ì¿_+Ù>¥^¢R¹ò¡P+¢ööz+®i5çÍKnpþ”h‹fºlì‚²¶VVZV•eenÙèŽ 5|¬£¸aÔÀ×…¬œ›\nµ:&£å]rŠÐPk@vœ­œ]Ç9­©+\\¥^D&‘¨Ê$pRJ÷ÊCmÖ–ÈˆÒU·[g!NFº¡”¢Ïœ^›uö]]_mÕÕ÷Hë(^Ò¬Ôl®¢:š‘›pP{W1ˆÊË™˜½@±ÈÈâ®sººº§Ò_pEà\'Ô+m	î•Š×Co…+u³ÂZÊÃ3Xe!F†±¨ú†7žòºh£NÄ \nJjº²iÛã±uu}—Wì³IS²Ù’B¨ú2êêÌ+HÞÕ`€DeÑYCõßÕþåbPÞßpfñôóºW,â°<*(!:Š•Íc$­¤‰OŠ³™×°PFÅ,~š=Eíºº¾WÝlúöì¤ÌÈõAy^jëQZŠ¹*ÊÈ&ô{Ç¹Ä~X¯ŸEut_ÒÛµ û«ª61ŒŽ¢¦\"êúç)4ªÌ\nG´·\n¨46Xî ×ƒÑ™Ý_+çÕ«åu}—ì9K\Z¹k–˜ßqî\0´ Ü¬PiVM“B.a@å}—\nè½\\­EkZÕÕÊ¾ò´ä\r“gpo=s\n.\'\":zhæÅqØÖÙMã´ó¶ëeeel‰÷[Úº«Ù_±e¥iVÏRæ.bæ.bÔUòjºæµ•ÌrÔ~ÒÙkZ³cù”h›	]«³eenÕŽË§„~9»´-+NwW\nèå¥i+IZV•`ºwú®«ªêº®«ªêº®«ªêºçw-e6RÕê6¥¨.‹­KRÔµ-KPZØµ©jZ—0­ejWWNÔV‚´9i+Bk,n¯•ÿ\0ù¯ÿÄ\0(\0\0\0\0\0\0\0 !01@A\"P2aÿÚ\0?ôšˆÀ°G¼N\r0¸E«jÚ¢Á€¢Å\nc6bo*Vå½n\\)[–å*B1x¼¨QüiSŒÿ\0*Tå*}xêžÙõg¦–}íL{\'Ó˜j„n}1ÑE¢ò§éŒåO¢}1íDr;ãº=Ù\n:£	SÞp…\n(´(QüXµBâÂÚ@›ôGTÜ(P£ÐÓQÞQ§M¼\"ÀD*º6ÇêœÒ87œ#¢:fàJe!ö¶µ>˜QÑ	®›ÂsÉå3UU:¡ëSBDŒaEç‰+hê¦Äù™Uãá6™E¤g§l¹UÅ¨J¦vòÜ%jéítØtB‹5–‰(P¦”ÕU²3¥áh¶•Ò!j™-°¸P¡m[X©SiÇŒ)p‹;ÂvT¼X_OPÂ­þN†¥z\"Æô|ãâÏó•7})Tès(ˆ1fi›»årÔêgõn-´ØØ§uÅ©º¨³üæÚ˜ùà\'85\r@ë¹Øë’¦ÎóxÆT©[‘r•J¼pP3…Z›B”Uj†*:­¦J«©uEGQÌE¥J6øøOóÖpeRÔÍ@>VéU*†§8»“pp­Wjq\'’‚Ó»sr\nËÖòœ`\'um(´ŒƒˆN3ˆ³¿ñ;IPþÊ¨ Âuœ‘ÜBœEFÌáTU&É@\"Ð«ÓŽGHL¢Jsbí2ä)Á”å1Îÿ\0*‹^ÇsÓ6._]B§Á½fÈé\nk¸”ãÍéºä\0Ù+êßŽð«b-7›}t°Í„ñ¦›¿\\uÕ&\Z¿àªžq7úè¦½õÓKA—§[ñÞçvcG3¦þbÁU2î–8\0ŽèK¤-FŸõ´ÚmÜ•I¡¾Q÷Ønß(ô7RáåÐH…8¶‹á?Næ‰)Æ~M°¦=AnÎš­ûR¾B…U¿™_ _ Tuíh‚µ:íü^J¤ß¼›wi±(ÝªQÌ‰NÑNœæÔ:‡CqŒjyÀ)xÍ·=»Tá8ï8)3jû³†Q„©´\\\"€ÍÞÁ¶WÄåD@ç6ÜöJ7\Z£\'xD ÒS4Óå\n\rNÓ¤(L¤bÔrh•†í³\\¥Jœ~6”Ö‡Ýå;	T©—ø_³„\0MoÚwœbñDY™F·­ëä_\"œ\"ÑzuœÏ	Ú—^J ÐæÊ­\r\n{M™„ÚT©R¥J•*T©R¥J•*q§YÌðŸT»Ê•+rÜ·-ËrÜ¥n[–äMÁ[–åÿÄ\0\'\0\0\0\0\0\0\0\0\00 !1@A\"PQ`ÿÚ\0?ô¤\'í±3âöL¾_ ½Z(¢¸V;ÿ\0Ž¢±¯s¤é+•?àTJÈãúigh¬/ÒŠôZÀý(úr\\ß5Žœ³!ñ¾1ôÞkÇN\\è®•zoÚOÑ“÷ÎÙEc²ËÙåY,oð¢¶¼«‡QÔYe–YÔuz*óÅmc–Uí®û9™{:º(ê“î)´ì†»ý¼©m|Ÿ9KýØŽ).¦xì=\"Q£KSó*VÈŽ(‹H”–\rGHÓª]cj‡ÜðhÊÖWÊËçg[Ù‘|õöê{j/ÓE÷Ã{¬\rqyu„øJ\rÆÍ?<_$,¯ÆY«*Ž‚Q¢±ôô#KN»¿eÇ¶gÉ\\HG©ŸQ%ì(‰m8q„l¡Ç”Q©§ÕØ†šˆÖe‰.2…L¢1±*Ý®`¾+›Ú%—ÊŠã=‘ö¯á,‹Ù²Ë4åxœË½ä©š.ÖíÑiãKÙïß]øjFÑñß}þA¥ê=Þññ†k¿(þïòM/£ÝïgÆ7ù<c±p¾v·‡Œ2â¤Bf¦¥•£Mþd[¿ÁHPEqž¼!äÒùpÔ}(“£«”ÏÁ±+#\ZÈ·–>¶}‡_sìGØŠç+Løßiw¬\\µümè<O\\æHBô\'sŸˆ^ƒÄø!î¹ÏÁù´ ñ>Ež¡ù´}µ—Í¢ŠÙº|æÅ´Uå[¼L¾›Ñ..»Ç•÷…tèøéùwÄé:‚°©e‹J/Èû/AïEQEQEQEQEQEP˜û”QEQEQE»EÿÄ\0>\0\0\0\0\0! 1\"0@AQ2aq#PR3Bbr¡Cs‘`±Ñ$%S‚ÁÿÚ\0\0?ù X\0Uºœ¥n§/,ô*XO<ÔÖ´»STUzEUE^^\\]ÏM\0¦§|”ïÆÞˆ)©·GÀ)5Wä.wW(GÔFeIj·Š¢™\nwÎü*hòõá2ys•º|Y)ªÝ\'eÌK€öÄó¹ëÍKý—U1Ã˜Sÿ\0fK…OöÍ~cª×6¿?˜ãÒêª-Èn?eH.ÿ\0ð¿Ê°]þóû*ß[©ÍÈü†œ\Z­ÐªV,.>J¬ÇêS´F\'Ð,[<Gõ­ØMeF–­zOÙbt)ÓEðb¹ŸÊø±Gø_ùœÛ·«óºçª¢©AÎnÉÜ±Gø§ÏE(,\rôãáx˜U‡€÷jÅcvÐvê°ZX|ù™òu»w‰<ÒjîV8ÿ\0	žz¯„É»ê:ò¸-,hÅös§ú\nÙÇik‡u\')’ÕQS“™^Kggoß¢\"|H½ù¡¾‡ªÆ>$/¨*|æfí£÷a½Ðƒgn9¼]€M½[ó‰›¶ñé(C†$<mö1ûš¦¦>k€ ÏÈßB!&·Ÿ‘^õðŸüåÈO‹ ¤á.Zh1º¹6æ5wÈ_g‰ù‚}ú´ó¬@Rˆ©-»¼0¿ç\'¹¶¢ºS¢•ªÏ~¢(„FT.c#†C+]h2Ädî…a#ñDç•ð¡ºª!kpìÝ‡#ã}\r\'ü&ÚZ%4èÒ.Â4	¶ëLáƒÐ…1×+-Ì-×qåÆg,nÚŸêä1mMÙ§X¬sŠ÷ÐH+-š;€nò÷»LXQYùš&¬qà¼½Ãªƒb‚XëD^§@™\ZÛhN2 Nj›Ùá®ÚŠMì×<ý*šð‹ùP¡Ù_Ô.:ÚãAŠØŽ‘sVH±L›³ÿ\0õÀ“,°Ì§ÕÊ%‡ÙŽd1Äç/ô¯i<¸M¯b85V“  x•¢³Ý\rƒiW9G±{@´¾V§Ä°Ä‡†)ÕE±ÛCv°z·B£ÿ\0mßð€±>67IÎeG[h3P-/x‘\0¹4ZA¦XÌ=ÇÛ>3Q[Nœ£®€ÎÌˆø}TÚÆ@¬öˆ¢pšíä\r¾ðçèÁßö¬0ì˜ÇŠk%e¶FÞ³º„‚™3i{Í\Z\"9Y¥&éöºNˆ&¬¶Å–xž\"ßûP›bÞs]2fJ±C}XèiÞË‰ø1««L/jS›\"ÔÖ{:ÎblõÄóu²C\';Eiþâ·´uj‰Ú+uqQ¢û>ÎXÁM¡q8¿Êý·Âbö—«”)thL|\'b\\ÃÔ\'4Þl\'¿²hä©qCÕCý£&ß\0Ç¤îÁÐ­¤k»€¶qØ;°Ù·gôÊ‹ž{€„bÑŒhnÙÆhsOB¶„ÒÎÒ[&À`ié…5ÂfÁ&ù è¬-ÒjV˜M¨X,ìBí¹†Òþòª\"gÙÍhv¥m-X÷w!`„ÐÑØ\"×hVÎC[Ø\'5Úü^kÝð\rž˜z,<³DýÅ/§\Zj\'ªkx4¾œ¨/îÁÂÛÇÒrAíÐ¦YbOM8.fœ&TjØC%¯ìá$,ÅßÖ\\G8ô	ÇÍ7‰>>0(Ž*†!‰U¸Tà¹`ˆ3S…KØÓ¬=Þ¸?Ú˜Ùš¤ôPâÛ¶.„÷H†NŠ›ÙÚãL¹úÏí‹ÛËrsQ=h–ÍÃ=Ÿg–Í‚qX>ÉÙ6#,OTOg{E­lhbsn„]h‡i$;hJ³:É»³ÔšM0Át0ùR}–ö¼8Ñ\r7d8ó•Õ++iÑb†hµU+yËÄ¨õW)4ªè.R9+ª¡Z¬\'}Ú>£„ßîö…dMýá@°ÞïÃž.êÉ±ŒbIûÄ™…Úðµ‚êúÚgÅOEi³[#Qç¬”GÙ1DÙ·Ç3+­\rµ¹€íO‰Y û2NŒ*ÁÑYßá%>$;Oê<i•%#t‚tÕkU­úÝ[„E<áÜƒ-Õ¥2ÑGÎÐÀñæ°¶€!ìÍÐ¬Ø<Ð˜M|´˜[/wfE°sgd!ÁhkG@±Ú`µç¹[;;•ÅÎ³0“ä¿ñ¡5ži„×ËI¬- \'E~ª‰hwSE‹…öºjz-ç*ÕRìmSU[ªyˆ+ÑUnÝ[ª‡#îqÏÃ~žGä?é¶sûÿ\0éIK„n\rRTSr¥ØT•UîrÑÕVýåE «ÈJáa¶áá<þÊøÎÓÉ¾®wÝŒª]‰Ù&§t¯¢y×boE>—Qo»uy)Š…ŽÜwº;ÙÃÞŒzvF4c7‰ÜG**©5Uaj™½ÍXN£&õUÑP-¤¤.©º¼°³[÷™ÑÝ|30yœN FÍìú»«‘|C‰Åbrœ¸ŽX{­åK¦o+ÉPª]^gyS8dñC:µŽ¼¾û±?é´œ?¤**ët¸Ž@„	*SU7P*§òY(pzjPhéÊMæK-£»5@øLòÕLÔ©¹H_50«tÏÊŠ\\)6­èjoi­/¦y§[â‰§¦]¥¥ÒòRppR…OÍQÃƒR±FŠÑ÷[„ÄôR²00y©Ú\"vò¦IE+éÀvi*ß¥û*EÓ[¹(«Í2ÎÍ\\S 3F‰_æ@#ÙÛÎú–Ò;‹Šœ®Üˆá÷[±ÜªàUCJü6¯Ãj£\Zº/Å-ô[ñ\\Vñš¢ª­U3¦n™à;4òqX&¾Scä·b-Íä!½•+VHs¾‰Ö÷Š\n6òÙã‰ô…ñ&}!QW.«U­Ú­oÓˆ.š•Õ[¥W!áâa‘U8”º&GMÄÚuB¤9ÖÃn®2PìÍè*¶–—áF\r‹á³¿U3RTÞ©ÍŒœ´[ê—‘ÉHsRF×Á\r÷}]ÒÐìFêsddÄï™âSFÎÇI§UE^v‹îÚ³eÛ§,ÊÀß”H©5NH5êŠoTçÏu#qŽÿ\0µôU»Ê£¤§9üŸÞ-\ZtEŒ¤ð¤ÝTž>CTÒ÷Q}\\N»NN—W’Æï4\Z/2°;Ä2`ˆ¤tæËŽŠrFY’Äµº‹{’¢ÞÉ»É`oTØ=]ªÙÁ•¶´ôÐ/y³ø‡NênÜwPµU*ˆÃrÀîjd­Û¦·•ÊÀ·Îíå»Ç›5<{uMÏÄ±¼hŽÅ¸TÈ´Äð¶¥I•+x	h¶Ö\'jtc~‹g„x{Áº„tX‚Äßæ§§6 º—IQK%U\nÑTqf|)¯cVÍÂaËqØXÍQ†×øP‹³2’‡Ñ Ò¡²nµOÝªžÌÉIâ\\w<þu¶-›¦¢1ðp†ÿ\0*%ž†SQ¡€aLáb5[H[®˜N]‹0š‹ñ·C–|©[ÈªtS»i‚¤d«ÃB	û­™¨[V²©ìuÌÖ(bSL³²µ™CÑn’…Î›n“Û\'wFøÐàÃÔè°»}Ž[\rø…WÄuMµ@ñ\r}Ÿ0SD°Ã¸EoåSî¦‹²K”7UIMyÝ,ô[Ü0{\"ëÃ\"\Z¬-Šd»žë@U&½áÂC¥âÐÝ[Åc|Ñ´@ý´ÄñÄÿ\0‹çy†z£\rÚÂ2R¸·ïËÈe’\ru^%W-nÇglä¿\rR\Z«$Œ(¢£;ž…ûÁ|#ˆv_„-öÍnBMÝ,j˜º$3ÙÛ‰²k[ê*É6#{gÆ<1Gò¤Š†îüìÏÕcÆ?…ÑxQŒþ¹ÛçÁøº\'8ÐK¥ÝDgŸ£ºÊâñøOX›¦aLÍbkv?§–Â¥­ë±NJe’×…\r¼Ÿ/	üV»Êì¨)¬nô\'œÞê\'<-›Ä‹nd>úòÁ„žªoT[ÜñDÑgTSÎ?N	0MQŸ‰´7ÏËˆ½ÝÇ].ˆ5B x–«em5X…í0¿Qb:•‰È¸òØòÌª)•;õË^#=2˜~YbaûßöâÐè„(ÆOFQ0Svc”€XíN2èÛ±:ˆÁ³WÍbuIU*|¼‘È\ZÏ¡h«Â.è<©”Z¡tÕoQlì ú­¥¿u†ÎÂJ8êçTßöãL,ßjúö*l†ÒqÞì¾+°3²øuRm¯/3s²b^C“\ndaÙ\\¶Ì‡U‰¹fZ·B¨šÝÉÖ:h«ÇÛ3ú}P>Je>Ò:SÎ²–)I«tbrž‹jÏSšúž¡beaÿ\0ÂÄÞ³CÕÉ¶vh·7·ÄÛß‹6	7º‰—Ç¸ô_C€ÞªphQcõÄ’š\' äp0L­­¦§²ÃH/;ýîËÿ\0Ø)¸[[.Z¤h{p<ú#hâ(Ç>xnÁL#Å§Ò°¸Hð¶ÖšCÊ0`-‹â-º!-\Z-ó6£j‹öXš¶Íñ`*©r»8jn«Ô–å÷›Ô,.ÝP±x]ÝJ0ÄÞánœ²we·´xºîzøŠoEN—˜öz=m)À÷«U4°\Z¶y×¢ýÔ1IÊBâÃ¡N‡ËÍbåd,n\'•3	ËPZTáºy±³uýÖÎÚ)õ)¶¡bféTßV–­Ò¶-5[Pq»ºØÂ«Ü·¼G[­»;%¢ô\nNé›iÀ ±¿ÀÄHA‘„°ï_D\nMÐŽ^K(!·ªÂ\',MjªøbƒðÝä¶v±O©LeÂñ0¶¶\'aý=Sp•6¯u†™[{<JöO‰»Ó’Çd«ÑmbUæðóáŠ/.=HßZ†óâwÄÚ3õXáÒJ¿0Ñ¢›¹ìnô<¾\"¦§ÉîtX¢(ñ-È+ãYéä¥<.ìVh¶1?\rÚƒ:œ²xšÇfvü\':)›œƒÝaŠ%,‡ˆT-”Oip°Ùë?l.M³³ï—Ý¡nOR°—²yô)ƒè¥Ñ›ÜÏ$qç5\'8(ŒN\\¼®—àD?™c_%…´\n—WU±QÐ¢ßð±DÕ´^óS§<Lª_zo„ê¶P7[ÕËv¤êVÊóÓqÕÎ9Xçø]»pr}™ÞÕ¨…S9³#°™\r[‰O‘cO?,›2¥œzÝ>ù0”à|p“£;ÃÛ†è‘õnS	ÝQ²ý+ð7ªÝ×ºd<³	®>&Ð©!\\+ê¡æJ†J¯[Æj&#ÖM­Â‹â€¦Ì“äqpñdóÏ4×!—j|1$z×„C5F;õjf¦æáÈÛl>”r8ö¦jÇj¦4(°Rz!´ÖeL\ZÃ3@ž¢û+å¬Z¢¢úe—#†éñf©œÁ(eý•M#·Oª0þ®„î©öwjÂŸöEÇ®tŽkùV/¥OÌ§«ÐWÙ?ºŠŒ|å©Ç’–`ð¦2–÷RúiÄ˜ñ6¡zåé!~n6šMuc¢‚ßÕ’ËýÔW©æG\ZyöNÌø]ëÄhhñ\'LUË7ÐäÈÃ€Ècó8Ìßüª-œWb¦,–_î¢˜Îæ|¼®¨’0\\w›tÜe|#Ü&øš†nW ¶–Ö=ª,SÕ×D‹ôŒ9,¿Ý¹¸tc+ËNñžjYå–H;ª›Š˜pPaþ\\WÁûñ`åd­ÈÃx£ZœÑß;ì¶šN¿á9ðôÑš:ºy,Ìoÿ\0\"û§Ä>—ar6ˆºÈvj8¦Dˆg\"ƒ‹~êcªoèI•\n]²bðÁOærÄx\r\'G”|è™ˆj±…3¢“wXCÕºCº—<nŸÃAåChüÎX:IoôOˆu*\\<-2’v#<4¿g:•îVš¹|#)©Å3à€<@ÑC†úø¾ÈDoE‰þ­”3¸ÝJÂÄ\"ŸéœI¿¨L\'Ùß¨Nkzd—+7)ž¼„Údšâg%€·x \"-”aj\rŒÝ:…GH­›Ü”ÚV&tRœÛ>É®ßr‘p™©X¢Äû=³ýHí\\¶®ëÃs>’¶€oÝqÄ‚ÁJç1ßš‹ÝI”H~°8`z¯!.\0»KåÉMUMµ[Âù¶‹qójNdÔð¹aˆ–òñ*L©Ùàÿ\0•ñ\"`Jdœ]ÖÅ¥Mæwb}LÐ†Þœ8¢ë+?R7É5¬ñ¬o3<ÈUå¥~ðT¢Ý7T\"‡¦Vµ† ]8Žû-¡£z-ê¬-XÏD]ÃŒÓpý\"y1¿@üq©ÄüÂÄõ¢Ñh´S‡º¿åÙ·‰ÙtO(WÉl«ù±ÁŸÈp·^)ójû«TnÛ—MM9ÝÉtùÏÝZ¿»{Èà×™H­óE,<Ì—l q ~äTh]ÜW˜}Â0ÏO‘ˆlÔ¬\r×™ÃÊÀýÈ¦ÏóîÜn\'£«ò?z‰©Ñ:#²ÑHð¥Ávp|¸Ð?r*_¡õ¾HFíO‘bìƒFaË^xNÎ×ñ¬çõ\"œ›ûEÓOõ[Ûä1mqÇŽUSæ]ŸÓô™¢œ™í|Ö!£ëÍÍ`Cü8cžªª UNc¸Ï@Ë¥Ü Ï¤Ý%$×ý<Ô³ß‡UL£×-T¡…ªÕV¨ë¦^ÅHñ#:àë‘óæë—Òé·&¼C‹µ¯“Ý–ªš)œø¸rFC%ŒÇ\'ÊKQ`šu[înÕb‘[&îfª|\ZñÛêœ|Ö¥TðO%D-Q$÷»ø¸—™)¹èD€Ò:MÅÞj¤Ùc;F„^1Ÿ5N`9zòRá:;ê§\räy/Ä_äÝ ¡ÌÁ#w¸À¯Ô~A^Sº¥84¿@´l2Í@gt¦ÕÎ\rý·KœŸÎCäÒùó’}8:->AE¥Úqê…iÄ­Óÿ\0oÿÄ\0*\0\0\0\0\0\0\0!1A Qaq0‘¡@±ðÁPÑáñÿÚ\0\0?!è–f»ºX—H4cí/áZ÷œ¦°2ž4†’4&Bt$zQ1ˆ>§`ƒ€¢\"nø–°hä-N˜ahÃ\råÜ½¼º‚cDú%\Z1ö—ÌŸD×Õl%–Ãç\"L°wB‡I9bxQEÈÝCËF^•; Ú¹¡‹	Ø7`Ùv†Ë–hšäà˜J´DÓÈÖ´ñCc]òô¡”iÛ\\•ó¤Lj4i¯.*âŸB\n\rÁŠžE ú\\HÌÊg“µ+8,e§ì]®Ô¼\r;£=µ®pÅÕÛ˜§+M‹ÀN´‰ãD\'^zf‡”ev¼QJ¹<Qo¨ð¨‚¾Ä!‡¢g†°hÉ\"|j*	y	zX™XÍlkâÅ›HÍÓ“;õ	Eí˜ÄUƒt‡Ø\Z…gpæ%PòF#(¨Y!>p‘MV$Ôó_‚/Ú³£C]¢Ï$Æ‰–ÂïB\'&:\"c-Ñ>­´&žaìUŽÍ¼Àµe¢µ5\"Æ1F*XfðbÃ*œÐNðEYòXôwÐÖ©˜øì&J‘pcl§ÜÂ¶X7¬Û4þ¦6z-/È†±==	¾LhØÁ;0Ý|TpRá­kbCHüD‚-Z2µ½è¿`vPÒNre„7˜h¦EŒ¯ª»Šž´·*d½†Èº± ûzÖ¨š\Z\rÑ\Z/Ã\rT‰‘ßQ3aðŒ­õ¥*(Á:éue5ÕüŒ ×ºÔ{†Aî¾P˜HdAU¢\'Ò4=ëmÀb5ð%EÉ¢t¨˜¤Nf:x”Bit„ë¦ã:;áŠld«!$EŠ|tEWLÒ›„Ð}„z¢›”ÐBzWR£\n1ôÍY)¹BtcRjÓä<M€«$B|tF4†Å0Æ»EDDÕ¨Ô7°ù4dt‚]-!Ôß^è0<ïðy_àó¿ÁæsŠl„ìÈõ]P„2VR\'¡°—ÈŒf ÃDøÐJTÈB´nDBé:@Uk£ÒIªTœ°rdvœ´7#bgýg m¿üÓÿ\0É3‡3ß0ØˆÐ—³9ºpý³1>L~J9)¢]Z\'ÅDc^uôR*&HÈ§ª„7på¸oJúnÓqå¿á\rŸ•$&«¯¸Ÿ…sê‡ê¡\"\"\"\"\'Á¹ÿ\0iÔð“}æÔÈø†ƒ“ð_†Jy±ùÃ < ³·À™ªQCß—iLK¤š¤ÛƒS§\"fÚ+î_r[³Ü–ƒ^„¶G°d4ÇœŽâSH*®cñB\n[6Ks4G³ð?Mkôü¤=>wtÃÈåø-~÷áKÂCfu7‡ðZMß•RF®Š]!5ËJm°3v”öÒ‘È{Ãf¿\'°—r„HM<Èlƒ¤e+pf~se–¿»=!1¥~_â½JÆW¦bá¿/Óø¨‡4!uzf§ð)ˆÉ‘6©­ÖhÕ	Î;s˜„ïÓ5hŒƒÀðÈ•zNÂnt‚ú,ÇŸvÙö#%Ý¬/Kù9Š|;ö•íWŸ™t?)J^¹¢|0Û >ã¼4[i†ÁìeNûþ¨vK/ßòÙß&wìWºôQlÐ¿2ùWNWªi”BüC]loWŒ2˜Æûàò›¥u—‰/æ´šŒNËÝ_Ú&_,eÑ!\'Á~é:`úœ“‡$Å–E°·!™›À#R‘%üö%Ô÷F$Ë•ú‡Eîuó\"àõ„!:r!*¶g±ä„Ò”½p„Õí¤Åkú)ò{	®º/lTV:yÿ\0À«ª ¼1HÆ‘{¯Ÿ:B|jMíE@¥Ž˜M)KÔÑ28dWÆaº‹ÿ\0ï°q¼Ür†Ÿ¤?ëwZ=Ì\r&ëékÄ+‘’$ÙèÛmµ;#<;F44–Bô%ò¸J0ªñfýAÂ¶Aë1gi*éŠÏÜ[.úÇS®†-‰ðã£ö\n}~M)z•EÞRÃ&xÞžº/ŽŠ\'‡iE02¶\'ÝÁEJÖél4Î‘‚¬ÉK‘Ê@ãKØšAh½ÐÉb»¢]²bÝÉe<‡O´‰ÊnÍ¤£ÖÂŒ©›l3_,r!ó[ñ\rìÚŸ†#©Òœ7µ6a6îxj›@íñê¼‡ÌŠòG8*ñÇ¶w?ÃïsÚéž—<\\‘é“5¶;å‰£íÏJ2¯í‡à³$cq^»ÜÃ£¾ðBšFöø\Z?H\'s|ŒŒ±&d\rÊ$@#‚8— OÇ‚Q¥Ot!‡ej[Q}¢ÒVnýŠFiw‡µféé‘%Û(R‡ìï;±kcô»4GË\'‚À¹„N¨þ›¬Ršéym›âþ¹2:çcìbûJƒ_M¬-¤;JOMþ_&ï9äµý‹ïÆÃ¯dÑ±õ\'ôCü>óöÙþç‘çßENf×®°ºý™z	G_\'\Z¡Ë§¢—H„ôN­×bÇÔŒšM6h³hqÆ‰91 ð„ÖF#q=áú¯ìÿ\0C·G‡{9žôjÜ’*<3ãOU¨Üýô<ÇÇp¹_z4n	«Ý\Z·0‰¸TMó‘Y,ÖÒg~¥¤ï<Óö¢Ú¸•Š¶Q,ðb‘-G²\"ý	â¢5áŠ\n-‘·°I/ÈÞ0¶6z<iU/bpÿ\0¦X]ðVÚ­D<h„3ÕˆCêÅÜYNÄÌc=%{­Id»#Dð…tc{‰»¢x3ý0Ÿu­qÎæÔÍ_gŠÀ_i*Å}ç3cXô-¿rŸ¿TQHGÈ­„Çú<æïö,ôÏZÛ\\Xg‚\Zk¢ˆØ½#™!´ng—\"¶ðnßàÆ%PkŠ\nan¼Ž±!;N«l7Q-PŠŒjc?ù‡·ÆŸð;,[Êó	¯¬Æ½ÏúK		Ïè¾\\W=ÏèßlYœpo€7´.*&ùõDCWÎÉ¸4ÐÆW km5èPy§ÙƒŽ›_þU{,I!.\n^—¶‰jÍˆ¹®!ÿ\0j9#ÃDd0* ¸€š´\Zt÷\0<x2žèU#8Fa¡·1L ðsDf’ˆÈ°=n9X‘ƒlbnE	VY}ËSØ¾:ÿ\0ØÛ·7/òÌ¤Øœ»\\Nºê;gaœ&QÉ=N1ªá6ÀTß]÷C©bw3í“pÉaT-½”l\'\"UšÑDŠSk°šj¯+>x¢„„¶-\\¥cÑÚ¶‰†6mÕ°°œB oCøH”kÂªÄ!}DrnyÐ	ñ`o3\0‘‚ìs¨Iz	–ã±ŒM¬Æ:ªEæ·LÚE1ÈÔ§ðÏ&ìK‘‘¾¿…”D¢ìAe|x†Ï\"Ÿûž2Ö!´Ñ0#Æ3ù<aõƒI¨ò†¶ŠÛO!ó\'y2¾Ätlø˜U\r\nþ§aÎ³©°‹/p÷žBÕd6‚\\¨k`~oX“±qyÍ‰¾–X““5œ¼±aÈ^vìg“-b±¸˜Fg!aE“©m£ËÀï›Ù‘[3ŸLMU·þ\rÇwAË\nÇÀÌŒ}@B~UàÁ©ÜÌRÜ`Ž•GDÓÁ»Ñ#dTÝ6]¡š=Šëfâ¬ªãìÁ>(6z%n:mÍ‰ÎQ8›Êíüö\Zba7+o–*¼½.—¥äƒžÑÑÆÅa†\'Á«Hˆ9$£žâ2dP.Ñ¿!| Ï\0åú‡‚„EÈ@À“$œ‹øã¹]ØûÇÇÁ‹œã~ïDæÆ[‘4¸LQ%pþ}‰¦ªþcCþÆ>Ë§›ë’©éãA+¡\n*jÐKS»`Vžp´X­†p£ÁMÖ²N™wiÑM$¬÷!ê­à…”‡Ï¡jÜk·hxóØäö“95ü—öCvÅ®qp¯C[î[Þö/ÂVPÔøV“Ã	r9F´!¸ù*¥Èƒ°¼39˜:ÝËLW„¼½4„¶i¨¥×hc`:<ÐsÎ“8ôm*©þÜOMý• ÿ\0†G†C„·j†¥Fªi	Ð›±1þ$€*†°·H\\ŠPx.r¡äm¶F ’ÓÀ\'pwFv=l,Ë!>©ƒvU6ÊÖÅÕ#0…Úëá$$_Äœ‹Ý¸POð77ÅŠ35»—–qÊGL\0v,x–=ŒIt6ìGØf˜Ðù·	0llÝ•‘ÁèŒa°qCÞd\0ŸÚ7á¯¡4Eœ¡1Œ¥Ô¥)zXíbdnŽ}ºjJ²ÀR–IèéfExäý\"T=àãÒ°³vžšøv{\ZW‰yá‡¹92 ý¬Cl*d±6¡HA(;ä0Ž=…õNß‰¸-oN±‘\n5§p&•\nd$›–š`Xu3<ù@Œ.†ªƒ‚zQuŸ(­„ÚÑG¾B0j™¬\r‡qfTÐœ\"ZšÒß6*C¾ËÐÎÛîÌažå3û \rxžI¯b´„PÎ±³6Éú8iØwƒüžÎ›Ý©<‚^É¤èûîÛˆR[Á˜ÀxK\"a#BC3áRÛbY>­—DCmö1]2âf`g…­´\'\r°—ÀÀ«d¨½Á\r­‘	­À†£˜Ú5îµíç bÁg°÷ss¬YâmüŒž+`f2Ù26è|·l‹D™°òèòtá(¶m)tºB\rÅW!Š-‡Œà,“¦‹7a”MÚT9++êm±nQØA%ò\"7Ì†íç‡FªBLsyÑ6–Ö—EÖ¥R+Iù Žuš1|½ŒÅ¨Ÿg’	Ý½Ç„…Ë&ŽáL>c6¬AèY´L‹*ønˆxÑ’pª=é…DVO,£ •å–¡ÕÄÜd°a†Ð‰¤\"!	¢h\"bÆÚ`BÑ\nÔˆ„ø-Cq¢³:–é%sOÓ’É\"×µÈ¼v=ws<ð„³w}‰ÞÅ…\\ÁB|”H>äUw¼¶†ìªlFúQ£½BBÔd3ÑJ]Å¨M\\U „«1¬\'ÂÕSDÀãÜcqTQÖ¥M¸æäkGð\\“\ne³dv3ØÀEX™Æ¹Ö/‰F4Â$Â×‰‰QÈ·°F¯#Ä&,„W!|\0„#Â¨ÁŽ‘$¬¥Ó ÜZºnŸò½<A¶é/$HØ³d@R‰`AøÙìA1Ô¨ÏB@Ë¢ôB„ÒtŽ˜„-¦DÞˆÐ±äÜfÇFÊdX~À›Á`J[Cb\'î5à“Ág‘^¥-n¥Ê)­ãÓt^‹«Z1°7[OÌ*¤ÎÐh^³sMlÎ\"î? Häž‰ÉJ„ÑJ]!šR—¦t=Ô[Ý!•›dQ!l2^IqEö\"ÒLîãB‚<h»ƒo$ézÔÒÈ…–3r…7¯>àÈç$ÁÌÌv8ß\\	»„ðÄî‹F¿©›ÌàõËF.ÅZcVB¢—E9Â!¸æ-ÀlrtÝÃ:D£Ûaª$‘\0]“3IF6pŽÃ\Z9£QZ©	eðÊ/EBM°²HØÆá¼ñ“D&¤éZN«–æ—Qºšð*Ç±qöºCä1’î‰ìØÿ\0ÉB7àeàÒõQT½0[¤leš&û¸÷O%Ì4ñ)á3¾ádd6·èX1Òª¬\'HÂi’²•›Á­¸ìa¦KÉÙŽçâ=àw§±ÂL«¸¨¨F0ØJBéJ‡4j‰Rßg­…5|Ù-÷d²™WôÅ\\Î€Ÿ&ûÍâ8†âñ“r¦Å‚#miD2iMhúé˜†ÏÅÁp.¦YØc\"e¯&7Ðr»´Ùƒ<›¢\nB*ô?Î½˜QJR—«Õö3œÇcÆ\"um0[”-íj#+¼£¢½ÇÈ8ÚÂÃìîFR¿“2•!44Ø‰«Š5º6=#tÓnI\"m‘ãl˜’ò>âU0~ÈgÍæ^YŒäÅ¹ÞøTzWùmœj^ÁDÅ¬­	×€\\>ì‹Jã¥¶òXCBÛx=\",³ mtT¸Ñ_aó‡·ÑÔBiuB‰\"¬±MæP®vH0ŽÍ¥ìZGuµÉ”ô òÅâl“žM°C¼˜äð‡Õ8PW™4j£·¬™‚\"Fª„7‚\'–?”.Ä¿åàÈµÜ‹*¾\'pñ¾Ì_YŸ´ãEËgÓN¶`,­†žN5å°®ŒqI¡q¶…õ‚a±3Q“áåú\Zß¸$l„tMFèhÅ¸c¥è†‡\Z]6ÌöMYFmŸa0Ws–ã²åÃƒB´ú-àq™/¼.ˆM)u\'‘r2Câ›1)Üœ^;4£ª%Qn›~¬2mø±¥@¤ØÞ	áöC “aÐ›[èò<!HZm¦\'DÈ>…)‡B!.	Âr*ŸmZy å”A7Šï±ñ„Æq¤l\"SÑ´g¥gbU72äýÓ¢\'ØBÎÉè‡¡äd—Õ¢×íqìù5ÑJ]rnÉü“AÛåíŽÕä‡j’k³]I™bÑ“À$(ûIýh–´¥ÓaÀ‡ªu6)ÂÓn2°Š™¸|”«‹‚ì*È@ÂÞWÊÀ‡‡ ÓÂ1jz‰cG¸ÐÔ;É^:)Lv_„~?Û‡Ø$šûiÎÙ ï)ø ÐF»Ô<T‚ìöf[_ZìÄÖêCw_Ôt…_‘!OÈÇØcùIM ¥.ªÐœ²“M£Ñ»Ðªø{Ý< »ÍÔOT%Êð#±³Ñl!¬‰\\â‡¿^·Š^O\Z~áîøã~U°µï†‰«€¼§q³úïf\nÌjNU=‡ÔÄðAéŸ†)Kz,GCšAÛÚGfÖÄc}D$\\m¬\r˜>‡¹UO‘±d&ìÐäè´FS<‹€}q5P:°œXÈi¶,~äè„ê¦<S¸Úóÿ\0£¦•…à•åß‚èãˆ(l2z.Y®ÄM÷|¯¬,«¥£7ô£-ŒWc\r0\Z+W6ž!½¦©Ûvhí¤6}†Ñ²£¼3R;ŽÜM“‘ŽQ´žú¡;ã¥ÁãU½<CûCú\Z$ˆˆ1V­Í\ZOeË‡}‘‹ÜNA\'°\\÷6E¿\"·9s1ÁZÂ˜»›o)³gÙ	lÚK¶Ý.zK]Ç:ìQdÜ2j­¸ˆ‡?Þ#‡Hùm±†¾D™?#`ZlcÐìÑ†-Æ,±d	¾Zå({ô(zÒ\'‚–ß•MÓamZ-l7\Z½¸Éú§EÑF‘42$Z\"Ù	ÃÜLÉE~ÑSl6”»xåÿ\07nBs£±Ôº-³J ni‚P¹5‰=/;6üh&íiPÚ(ÒÝ\n0e¹ß\rØ†dv\Z-²ê§¹°7uä[¡›8+ŠŸK¸(ª)\rìl¦©¥—ÁÎŒ| ÛXÜQ±YYEd=2<¨HCófàÍ–íå\r¦m\"ÑH/CÌš¨`{”_Õn!œô^ånOR¡«YÁiÝ7m\'rÅÒ—W“¨èBÕ/dÅå´ Š@–ø\\:çøäTµ|^no¿Lcû\'ãgŒA“&³XB-t¿ƒ@ø\ZæÊ¤½\"rY$+½`ÌþlMJ^«ªŸBßD‡:’hNE¸ÙX†ð•A¢$«UÒú.—LÝEáÌdîíxgÿ\0m¨üÝ8ówØt»¾ÁÝáúBöÎò}ôoEÜ1†Væ\Zz#uð´BÝ¸ÂÄ\"!Ý9ù.»´´{™íÜÙ›e2owÐ³ñ]0ÈÜ]	ÖXÆÖ}7]‹¸ymœˆ{ga.L{é$AOb\n½!)&¶\"!3vvÈ@è\ZOÛéfÄÓð ëÃ	]ú	ÐxÙW?ÐBÓ ŒM¤/]åª`žZ\\‹LçëBa¸îˆCÔ®ÞÄ%ð<±*—6ÓAq-D4dDè};†5¢Št6ŠO~‡ö¬ÞgÆ‹Éz‰„\"”VXòaèžóD\0ê5ÚöAzÍ‰JA?ìüJö6Ç¹fŸ\"J¦$Àû¾ÂØì2{	v2yfm2÷´×ã¡Y¦Ç?óŠ²éZÖ\\iwy&#m\"çþíŽSÙa9Ðó£#½Ðk\rÍ G¸OßÈ·ë-´‡`è^LSvW}â86Q£Ô1—ÕÆ»‡0¬ŒrÚ1ú}!¸èü¡c[´}?Üa\"}2áœ1Á†îÜg7{‚§‚©\"®[\rN[ìÄ§níIW›ÚÌ®û}µrÜÎ~DÒU¦ÒQ«”îBX‘È´šAÀ×¥ ¡“–ôDÙ›çBù’5yeàåT˜”-Îæ°äo§‘iB×Æ=Ì/‡f«s*¢ÜBV™X}Lh³µocFÉ»b*‡ýe1¶O*¬Ç€]c>ŸÑxÑÞÏ\né„ëäBW¹–èZ\'èÅ£cóÒ—âÊù3„ÎÑ™9³[$vd\'Ñ%U\\¸ébv\nà´ÓÝŒã/x¯ý&\r2Ïÿ\0§ª2N]	˜c³¶´í¢ÓgÄ´º-!ö%É*E¥]“Æ»©ÎFªCQéÀ¶œýH1¬ÜÒB øèHA]Å8ÄÙ¬1Õã}ÛÉov¶†ì¾“Ã<=0‹>ú\\¬<.â•6ÜS~r9ß;l‡½ÉßOw±ö,À‡àc¸¾Á	ÿ\0et†æÈÅçÃ9c{ƒ¦çÉSD3gÀöéº1g#‘£zÂr\rÂ/ ¹Èô²á{\r»J%dÖVâ\n¢hG}Ðoú†ƒ—>R,›GŽñð´šŒ\\½úçÊéàQû­¦ó¡Q)Ü÷bé—&ãç¥¾¬¡[+\Z‰Á*U‚B±£~ñä\rÿ\0‚1;mÌÛÜbÀÈ¾›Á_}¬è‡¦>½Äé–Ä±8©¶.tv}‰Òï2ÊÇVQÎØxb(dÉ‘Ëíãz†-œ‹ìHÓþŸÝ`hË½UÚ(—ë§ ¡7}¶cBdŠ<bê~Í„T‹>Àöãäa\Z¢ÿ\0dÞ&‰¾4=y€¥åäû/˜³sðá<Y¢Ð%±Š$:L£}‚cìn-n‡\rIE¥ˆÂ,‚8dˆ!£•+¨	Î«a¶cO4`”)•¿çN×\rîú8Èh;—:žT8LÝÿ\0\n6ÍÃ¶­þ˜š¦3¸OëVüèÁ}ô­ ÇTmÄ1£ze;‹ÓKƒ˜f8/íçSx)Y‚‚tn<\n²]Æ†\">Ã‘IÂÓ=%Î_pÏårœRcÛ¥{DŸhæK|;Â™ß—UE²¶=õý_ôbßeÊì±n=S™“ ¡ný;…ÒÐ[…ÉŠ’}5n5¦“Ê1cÉ\Z¬:º‡ˆjUDÑ8¶î9ºèhŒnÆ³òg*²Ø›£N½¿#8Nÿ\0š?ì±´]ˆxpc•Œ>:ð¿£î$‹|oèäh}M·©,[ºl>c`öÕè¢=†èšzffPòÃÜÌ¶ûéç“\rUÎŽÑñÈ½$GqS´Lfñý‹o\r/è[uÞýçöwõ¸v» íü?¡ò]ØÒÏó‚ù+©N3³H½$~ñÇRãnÉfàãKÐô	F‚A È»”|v\"Z{‹T|äm¼–,\ZUòìáô¥sT¿âÎl¦šuâ¤é_à/dˆ»-OZÎ^å›¸ØÁ!¹Œÿ\0c©¾BýO§ey#š½´Í½‘fÂJï¡u\n(•=»eöHI•‘!J¼Ø%*ß‰@¿l\"×+\"ªÅäšu&zì_˜7IµånÔC]¸Þ˜ÕhŠg„_OûF\0ãÁö1;òBæË7ˆ+[Ý>çŠo‡gäWË?ÔÁW—IF3ª—¡¥êºàÒ\"H~bG†÷1FÍ5\näNÜË¬ØdœmÓÍ`µð„ÇÕ²û;Ï/¤4?Œ‰Y©çk1ïçH\'þBîèÆ‹E¦ÿ\0¦3«Ùírò¦ý¼\n×6¼6XbXTHí_\në´\n›&Ú8hôjA¯Zè†_Àµ&)†qˆÉ‘¦:ˆm+®«&=	ÔŠ¶aJI·|\"óiÌ£Ïß&@×a{¥±/ìo~r6!á±WHäx’»´U¸ÕäÎ“¸¤­·’q““¤ZK‚zoÉò2<ÇI	Ëÿ\0ÂÓ6ƒA›#™î¸1\rmL‰VÕ·­Ñ1ÖºÔµz~ÀöÉÁŠ§£ÝèÁ—£`Š‡–R”¥ƒ \'Â>çŽ(Ò\n´lo¯k\"îµùýJ\r$äÞ”c¬\'Þø)„{4fàÙ¦_”€#V`Þ–òÍ‚Ý‰¾`\'³/SÕi)úrjÍù5d\"©ÈÈÁÉz³­©hõýš	Žc.tÿ\0ƒ³[¦Ñ±tZÁóm%ñV¶ªo¯o0T˜¬	ÑŽëò4©VÈ2ªx®Æþ²0ˆ…{aŽyÑ\Z)FM¢É!ý¥£#™ãó¦o’vÉ‘±ív³ÑiOˆÂƒÑu]G¾Ã|ö#cT>\'¥_BÖè™:„yG‚wZ8÷‘)Q»X‰]æð7‚â&.ï»×…—æ.´¥Ó%Ðïµ ðëÉùK÷¢1­ƒsÐ‘u¿€úP‡Ñ³¤ÚÑi–\nµ­ÚV“¬û¡‡ódæ uºú®„èúI	.ø´¼M½™òà_Å!\rëD¾„ÄZ1 Åœë-½)3¢´ºR”¥Gßó¿ìn¹4„êzŽóã—ù¹uòühðî…!2­!B¯åð#	t³\'¬lÍ¶™IÈˆ‚6èG™¥)z˜°oø3tWà¦¼:øy(º1Ý1Ðƒ$¿óî±Õ_÷ÆÅ(K®Dn*ðZR”¥Iü¢õC%hÖŒÁ°!DV\nŒ¨•ö(oÑœ&îè¥c¨ÉLç­n+ÈÂ3)tîCzÑ$U©upM	0ý»ùM§°XëÉ<BJà=.°ŒŒWà]š2­äoFL‰‚VÌK¢×¡Ýh3¿¡´é:6A.…A1×°~À¶éG¦\"Þ•S§ü^Ü;I_BŒç+ìß¡É{ÄÓh$„5>ˆ‰ÓZ\"igX„„‰$iZ¹F$ªÉ¡ð	‹öG¡õCl!¦¥Ó\Zå°4lëØö~ÿ\0_â¡¨,²±i¶*0Ó\Z&)±þÃ}çIæßñE;Ï Ø÷ª7èeÔ¢“HBt¤º•ô’fFñ«\'GL²üö¼àfóšùo¤[|P×Ù»ø6úÔ§Ë‰ì\ržú`‹CÑè©D#kG¾áw1{?M3½†¡x\ZÊÙ‰’	è‚ôM2R—L™)u€2Ü7¹Žì‡#i°æ¯-Ì+,ìm²7—ƒËÐ®„Ê,	¢×`[õBo>èãF‹G(‡ÀÅÂB”æ1wp\"!ìSJŠQ\'ÿ\0b¡²~t¸žDÒØj„eVâš0&„Pb01¬ZàÁ‚!â96!öŒÇFÍl:†øa•¼3pžˆääh¶½‰nf¾E§‘4Ç\"ÛHQ:C›#Þè¼q\rª8l7¶N\0Ô™ƒI=3FQdq¬È5ù‡c?„Zò)}°ZÂ¢‘¶ˆ¬²´SrihºB$NÃªb]§¤Å«Øý Àîñ€eby£°Ú˜šÀ×‚\ZÛAläJ‹\nfZfïØgË(JB*ÙçUi:#al¹)©X‘t¦Ú¡JMÊÃy%¥…ÙM™)¹Wd8¼ÃSw*CÀc³%-©(¿ói/ÕQ	|(<\";÷dÙ¥.™ÒèmÐ¥ÊÙ”¥e(˜Ÿ&ì$E C-…—œ•§€Éç&ŠiJ\"{évH	\"@¬Tª;7\"‹?búÊ»xÙë­ÖáË¥)Ñ3J4Ç€´ßä´AòÄ-?¡îHqäoî}ÑD~£lx+Ì»QêîŠ`¥g±3\ZkH\Zd$+!5ih‘™û(ÛmnBØ%_†ŠvÐJð¡w†]¹LÖÙh¿Çô2Ê «¹Wr÷¦qjk\nÓˆAZÁè$‡ÕÖFÈÙÛï½è9²¬ð¿¡T8C†4HIVŠV6YFÌÁ/Hl!QP†3%b2or\"8cnä’„\\âƒX‘¬gÉ·nå#¤‚;„™ê((/²/ÎŠQhœ*5ÚÄš.op¸!½`ÇÙè{B~ƒÆ²«¡Aú1+ËovÇ’éD!4ch„¨B]¢„`Öý‰Î5ÈÛéŠ•2d„è¡ZeškK-‹VÊƒd,$rœca—¾´¥/M/BÒV„ÈJ÷=x{ÞOøU˜œÉV­R„Ú\'FL™2Ìˆšh¥ÑE±4fèŠš¥7\' ¼	à«³#³<‚{1›àžÜ-?œÃMƒfYc=Œö3ØÏb>Ä}ˆûö#ìdÉì\'a;4zhôÑ{Ø^ÃÐŒŒJØ\\ˆsmRL)#L¯!¾)ŸGÓ>™ôÏ¦_¯³+³+³=ìGcÐ\\æ€øØ~¤ø¸=SÔFøÒ‰Úø°ý±OB®ßê3Œ_ÀøoÿÚ\0\0\0\0\0\0	©m83ß¾ ‚ ‚bÉ\')…†z»>X§” ’‹“y\0.%Øcyë»‹qîéa†9üo–<s£†,@l_ÊñLßö	–©¼Ê©kL»«:®LöÅ0ZvÆmœÒÚàå4çcÀ1JÙ¦xåªšd¶YµŠH©ÏÉšÜ\"„õê°`Î5°Ó}(Â* ‚‹\"ŠHl²’àÏxyÆã’¥QëÑì—ÿ\0à,èITé#„8H! cM²©ðûº•±ZQRhËTUµ\nÈä–i †»J¢Û&:y«¸¢\0\0\0\0\0B\\\0$lU`ñ)®I¿Jèu\"8 \0\0\0\0\0\0\0\0 24 \nAÌ¡0ÄY˜ˆ—ßtóÀ|Òì\0\0\0\0\0\0\0\0\0\0\0R*Bœ¼9á,PÈ\0ùšPÃX¿±qÄ\0 \0\0 \0\0\0JÔqR$`\00±ÖHbÂ€I? \0aDCL\0\0F~”	,fmN¸&0Zb+åÎÒ\00Ã‚\0\0‚\0\0\0\n“Dßuõý±Æ‹9ˆÈÂDyFÁ+\0\0\0‹\0Â \0\0ßd_}·HÑRSþA«2PIÊä€\0\0C €\0\0m‘£þ¾«dBeJ‚‡)Ð_€\0\0\0\0\0\0\0\0\0\0c5„•±þ²É“:öÖr‚\0DÎM@\0\0\0\0\0\0\0\0(p}Ù„UaÐwJ£dCÂ%|ïßi‘ \0\0\0\0H1qäo‘²¢,t°]Aî¤Ð gÆ»Aš\0Ð:L^5$O¶;¡A»Cqçx]:¢ðŽ&ÿ\0$×5Ó%¡‘Íg©Ûàîª®¨qŠ\nO„uuFv^Ž 2hÕ’­Sýí¶_õ¿èiÎ7Ó‘Ìn­åíž,Ú<xµVHç;JLµæIg§é9ðn™»b@€§ˆ(„5Æu4e@|R/Êlrþh¯˜}úšê‚.ä²f ^ÿ\0è`š,tÊ\\}ä\0éª¯eH\\³]µâm¬…A{C•%,†laK„¼—÷’„¨/#\Z.5°XŒú58¿r‚ÖÍ‚š!‹819Aí0-;Q¤ÉíON©Ö½Då»1d\'Ï´\0|=›#3úÔKŸ¿¬¶†RVÀÿ\0|ñ	JÞ¼–uÐ¤=vmsÈ™;ÚK™$Í£ƒ(†F¢´#ñKÞXj€BH®a	%oT¯p­E¸i¸!ÃD¬?cw¥–g@ç\\CÀ8¯ÌzzÚ\Z0µibším7Î–žQ‘p  €Òx\0¡\n2YŠ\0Î‰û”p\0Á»*/Ù=´×?J•Q`€\0\0@,/³	8+OÔu}#¸^7ûÞ?æŠ  \0\0\n\0Œ¢ûðŒ¸b{‘\nûÊ,„ÊNU•\'ý—<p\0\0\0\0$#mQoz‡C«Dp·éƒ!Û,NÏ%\0\0\0	\0uà\0zs]ÈÂˆÖtpãnÍf9`NBŽž­`\0\0\0\0ÅK“Y&`”¾›U¬á>ZG\"T{¯ÝÜÅ\'«¢\"(ubHÉ0R‹bWŠôqÚƒ­’#qÑ’{®ýGíæÐ½À7ßL Aº•ïyC¿QÊ‹#¬óÄ’ò¯ÛèNŒQG#²†H\\_|µq(]Z²ý\n\Z.ˆ’1˜+âØ„CÐ4^˜xê…ï-Ÿ(]1ŽF’DGÑÀ®%^\0áMM„a\0#\n4oøEˆ¯µ’Á/J!¬/J/ÐGpXVç)Q6B«–B^µÜmÝY˜-Ê©ñÇ¥ã†3\nìq¨Æ:½ôD€;æ…Ÿ¨OEÂ$p†D“ð^Ðû^ý×j\ZNEi×³kx/y¥tÃ]VµV•›™Ñûvaç [\0Z[ñ†LWh³¨Â;Ü$Oñ‘\0Ó\'JÒ	àS]ÿ\0Ñ €Âe€\0@,†(\0$Þ’N=ÓÍò‚	`Ñz´cÿÄ\0 \0\0\0\0\0\0\0\0\0\0 !1A0@QaqÿÚ\0?Ö\"\'âZ\'…ÙÁ®4BLhœ.‹VBjáIj‘\nÂ_k-Š¢Å¯ëŒ˜‚ŒÀÔÇˆlZ™KøiKŠ\\ØŒ	\nÂt7C¡K—büiLBÃñs¼§älÿ\0¥YJQ)\nÐ±rô ¶âë±²•«¼¨˜ö—WèÎ•)JQnÌƒâ±~$œéGeüIÁÎp¥æž)K“ü~tàŸ+¯/‹!5cÿ\0?E¾	‹!N&M˜†…ý&&¼…ˆ~¥ËÃæNH~ñ©(?[ë!84QL‡ô%‰Šådß?¦¤Æ!‰ã ÞQ¼^b$%CSô’-¹óˆ\'!¼»1b_×¾dÉ”¹NÊ>ùA­a¯Ì…/L¥.%q1r¥(ÙqùJ8\'ÉDþ«è—æ§ÎgEÁqeû#­e–QŒ_ÁÏˆÿ\0âæ†±C|Ê‰“\\î´1lËÇ±„äŠ;‚;gô$;Ep¥:&!ß\n>Û:Äi8ô4¾mµïð€è¾®‡ºc\Z„ex¹1\nS¡¬õå©‰b(ž)G4BŸŠG±°ÖLKU4¦½\rm“NÇJ…Êí§Q	¤.¢ Åv\r }³·¸2Tv\ZXÉl?iìs|GxŸGF-¤5ÐBG\\ñ”b‰±1(DE£X™‹VA!!¢$\"\nšŒuf.…Pjr¤í}èCiŸR\Zèí¿ü ‚PPEôhH‘Ž<£þŽø(¢-¾ˆ%u	Y¹)kèÛ}}±Õ¿ÂöÄ6(ÌN\rô~áJR‘BètGÌHM\'qöè~	»ø/èBÐPþß‚ÉÐÐ…ùjÏ#ph$!=‡eŸD&\Z‚EwæF¼Â§Þ:µÁë:2ª+Ô¬êÛèº‚Tê0„‰\r…Úüa`ã\nx%\\þÃoO›á3þ †ŠÜCÂ\'{DÉ„àƒö&…K2ô/A&¢Ê\\YFááøt]ž·ýiX½\nD&ü:2+d\Z<(C±;t= °îî¦1®6ñ¢åæ±¯_;4‡p,Ãy¡BcObôø„‘=™EÐß¾â ®Á(aF!þ…/C^Å<X‰5\ZÆ! –\\CÄ…Ó<?tuÃÚäˆ&Ð_Œ{E™*Œ`\"Ïw¢¦Ö¼AµNÄè}1öÈ¬yK‰âˆO±i‹`²¿­cYH…\"H¸žÁ1\r0Ø”„tnF>4bˆí>£à“ð¼±ôòô‡²Ÿ	â´ôz¦ºàˆF ÷¡äx•\"¯ÊQ­Á/àÍzXü	oÑ«¥.9\nôë\'´1çÐÒÁJQ	—ÅèÏ\ZjÙÁ¶—C–‡P{ŠxB@šˆ(†ÒZõôi7„‰Ð»‚(™\"§ù<jwF?râØ¸\'ÐQ&×\Z\rYôtûbâ^çË‚Ä\\QÞ\rÖô<	Þ.*HË§¶±(¢áJz>±ºî\\ZµO£Æ?xñr7aí’ëS¬\ZÖ‰ž„û‘ÎHG‘Œš4ÖŠYêÌÈtK·=cè$BKN(^\rjêËÛXÏLî‚‹BÜ^„„²e)QK†èe=–}d#££¯˜•‡C»”‚U‡¡Ÿ(ˆC\Z8Q1B/˜ÿ\0PÅî&è‡KÙr—!êï¢K±h¢zðñ×¨¨h‡Må(˜í‹ÁO³$?nÛÙ.!!ªÄ¬„É¤²Š<,Àÿ\0³ìL¤Ä˜’¤zN\r\Zb”CæÜ\Z±žµ<R²Ü¢Š+J(±9e–YJR–wX²Ê(¢ŠQE\rheŠ(ÿÄ\0\0\0\0\0\0\0\0\0\0\0 !01AQ@qÿÚ\0?Äÿ\0€\'–Ë½éz¤$¼´K§\"1˜\\2…ú)KÐ†Ä„‡ƒl!²ŒdÂB\rh³0¢{¾ô<]QBj²Ñ¢Ãî½XŒ¯ÂˆÈ÷¥<lû!	ºäLÄ¨HµƒQþš)K•æ¨}w¦ž‰[Gâ51v‚¥ë¥(Ø±>_}bîÅÅ)p÷Xb>¯øoÎizˆKŠ])J\\1/ñÁôtGŽ”?ä\'[1ìµ’a\rÌ.ÑçøüîØÞ°QÀÛÑLÌ?ÏãmžXB!‡îÖ”L£1;üO^ˆû‡­\"ÃcÕapKø~(z,=!Baì–Qó}ÿ\0‘©´ †4[Ë¤<Õ\"ìjŠ‰óˆ4B\nQ±·Ô$Âà7wDŠ-z4DIGù<¡7\rW|B}<½°ÄBK\nºÝŸ‰‰‰†=Ðú(†&†M\n’?ö’¢L²á²”º®¤áþ€¬FBÓ)J»hI¢’‰B-ÅFÓøÆº<ä¤Úà\\¡åpzÉ:>kzD\\!HCà\"nc>;¤ËxFônŽiŽ­”8OÁ“/u‚¸x£\rË–7È¡Ô6p%„ÄÅÂXþI±±³†Äà…šfáˆ¥Á<¦a4r	4%—ãJx„ùÙað\ZƒÄ!p…à-Krã\ró„]¤{…æ“Ñ‰~Q?‰ì‡²b\\4„iEÏƒSŒ&p7ù„šIî“‘QÀÉ<|BiF,¡!$-Ú!WÒ$+Ê\ZœiItI–!¬™ “–A­¯\'ØÅ)¢×(l†°´‹7\Z˜e½™bG£Ã.E¯rÉ¬ŸÑ#óf¬P¦é¼Šð5å1˜Yx˜COà»/Ì¡ÀèL¼Áô¾¥Àý2ÍO¡¡ÇLÉãÙ‹\nsY—Iª¡89œ2ò\rÆ[!2”¸„&ª!cÂ\Z§O—I¶™ø=\ZÃÊÇÜ!nƒ\'ÀÔê½¡çÎDœ“ÏJR)žBÊ¡ìà¨¿¤tM„´šeÜd1³8°™˜„ÓÐ³>OÐ¶¡&/Ìû“ìR\nK×‡‡–1òÏ\0„ÚmèXnÆìn•¯¯EûrÀÅçˆÇ?l¡`òˆxcé¢ÃXxsZZ˜zÁ¿Ü„& Ï“àJ,SE–<E„/sã\náâtR§b<n¡xC\rU!1K–#Œ§„yÒbƒô^HB™˜GÍ)t„&(±àH¹šMâ¬|îÜ$ ¸<<Ræ„ ‘ãQYY4“½(Èkôoâ)r©	˜)¹›Ú\"NÓ0„ÁcÀ†ˆL!á¢ÑLH´ƒ@šæØÆ¡Îqyè¥ÊyDP‚T4E‹¥\'àÙß§\"‚©!óˆL-)J!8@Ð‚	$’	$‚ ’I$’I$!ú$’I$’I$’I!	ROÿÄ\0*\0\0\0\0!1AQaq ‘¡±0ÁÑáð@ñPÿÚ\0\0?óQ7©MgÜd»1×›Ñ–¼Ã1yA·%ð1Ð¸4ÈàŽ8ŠÒ´&0`€žRYÒ¦›)ˆ–*zƒÕÁ}T˜AS1Ì&¥Ôv	’„áû—Ò–!Uõ¡+òÄº˜‹â\\{KJ”ÀðCR‚¹–ÌP%y\"+)˜4N˜.«©CRÀŠÜßœµkˆ0¾#†Oób,!(Óš–¸hf¨¦f–l•äufuŒW€²ÉvL“)w¶¡ƒ„½JWŽb*õ.`2Ä±¯˜YøŠ\\—>eç—ÜÓk¨í…î?i(²X™g?ÀgðO\n{‰©­Ïˆ)ìÊî„QúŽü%yhWëÛÅ¿Ì¿‚9·eEkæT\\|\0$a ÃHŽnl@±ŽôF 56„•þyTn93pÊ´p2B Ü¨[+\"FVýDeá¢1úw+›ñÜJØ):fòË‹©l“Éÿ\0	}Q¾å€a8¨-=0Ò·Äv²Lw•Ûy)â£Ç]Ô}‹Š,Ê¶¨­(“Y\":EbçH‰æåÊeEÔ¼ÅFñF ’µ˜ÑPÌ8Â1Ÿ\rNÂxyŽßKáB´Ê?)AÐˆY¨6Y„îaž³Á`q³¤©S\"	¨ÃQLÌCs2åÌ0ä0ÒêVÖãJ`ñ\rž%µ¹hŒIkƒB†‹D\Z±\ZY]Áw\ZAGLXT¥Í˜bÍî\0¦€Ã)$þ#¶2Ñ\rNXÂQK\0ÔzCˆ–u\nj6Ž¢¤a`™™ñŸ*T¸$¿EK~PK–Sø®¢¡Àxð—CœMoÀ¥#;‚‰àMj{©PI[%Ôc)DÄ1¾š›%¬\'DiEãÙ¬É8IcpH×”yõbR%5ÙC©B¨ƒAd°¸¹€(“eÅ-Df{RØÀ¶Ë–îÀ˜ræ°[ÁHYƒ®¥U\"c+pÀ7á\nrBdÊ„ó\nÊ™Q¹Få­Dü1+¨)¸ 1)ÀÆ÷þ°ÕŒx–.mEÔ|±K‰aŒSA„LÁ=”øÕµæ$YŽ¦Db8£ÖK‡1Ê.#ˆœ¦[•å‹Šz`Ïa5¹rÙl«€K˜x•\\Lu0ä	§qS0¹Z™—33>§Ô5¬”f’íÔ1aQŠW›ƒ”XQ˜‹ˆãR¥ÐÉI3‰¹F$Jñ*‡bR\\¦ Ô²Y\ZâQ&P3UŠ¨”Hw¢\rÝÅû&‚\ZW\n¥a\n…yHQ´?œDÚy¿Ü+B`Dx†ÑÆ–ÜÂJ`î*U	Oƒ~R¦žsÈíE#Â™=LÔ¸y¹D¤»d[bÉvVË^\'«/4«›èÉA%°f\\Ã´\'q¨Qé3/ÅA¬K%%!R¦™‰©N.>a¾ Ù‰‘ò‘Ä&Ù„ºFÙX…M«Ìˆ;ŒÇµæS*T©S$»‹!\0gÄ¬e¨’tc\"AI¹MÊåæ¥åŸ5Ñ+Å‘¯!Ó¢4˜••*W‹•(jâ-£RüX‰RdNÄ\\ñÒ]bwËRåËÎ¦%¾¥¢®¡0·7.³Çß›ò‘l@ˆ¡Ö’P¾<\Z•s\'á~ È•fQÌºÔÌ±ÙÄDŠ3Ä³.1NIa*âgÆmA³S¨1Ù:CsãÍw	Ñ+ÜˆKóRJxŠRO_…ÁðR0t–’îYñ3‰uj(šÇ‹g¼xÄ&R¿¨½Eñ1_1m×/ÄW™W11ÔÇSˆ^§¨#S‰‚2Ä”b:A’üJÓ0MÅµ8–›˜w)3ÍÔ·(ŠáFÌ¸ÜV¥Ô\Z–Kâ\\‰W2Ëj¼@-Ÿ,@pþæúßŒåÒ\0üQ¨ýáþØ€t?«‰OQí•êTåbo0ß…ˆ¶Ï’óøŒ©R¥yº\Z¶èâ9¶à¹\"˜|ð‚î!4! ÊFOrY\nj(Ô;J¢\rDJ\rŒO%’í(À$&N#XŒ´¤†ãi.£ÜÂ¥}C«Û |\nb¿´eQ…ÿ\0S$þƒÛÏ—…×¸H¥|¥‘~‡ú—dû)”û˜L^åìiêY}Áh\'Ìi‰R J™L§¯Âºð:%J%‰U™~IQ˜2„¬ÄÒô2™Æg1õ\"¢S%JMJ”J%€ŽbéƒD©o	ñrÈ³„–x…%¢Ôk4gØxIF\rÄ„ô–æeÎú%¨h±\rñÄ¬Hþ’µÃeøeƒq)¿r¬æ²·Nìÿ\0HHAªÿ\0ŽKú\'A=õ¨šŸù™_Ù¯œÿ\0Ž>{Ý±í1‡«\0}Ûp»\r?øOLlTä¿£jôÃÂ¡‹æ`îÝ0Õ“:•Ô¢Qâ½Ê’%=ÅáÇæb0½À\n:”ðè˜JgD”FhÔ±)ñZDtþÀÒ¿Qê,ikPå-Ÿk»M±‰hœ4zˆOõFœÆ\rþæ‰&#®,á¿\nÜ«‹à˜x’uZ§ÐDp×O[2Š•Œá*Ù\nÂ«ççÅÞ“ôÎ\'«<~0ú,ðþ¸b5Jµú:~¢èúgeuù`ìñX¸þ~\'—Kn Ó¥3LJLF-++¸ˆzK¶ÑkðBæ}(†Ì…º¯îÀ3RÃ´ã}¸×)PDz”˜E¢ˆE#ó)¹Ž*8%”.|æ<Ç+Ad&\"ÈEèªð·(œÁ÷oc=—ƒêkÿ\0‘‹ÑEòÂ!?Oê¸ô”:ïêW³ °#&üä’ÌßáÇâoÅZÊ·¨bp‹x7Äº€:”3ÒxK™˜³¹¢,˜Ò8fQWjÙüLL‰†¥¦¢®ó:|\næSÔ\rC#c	‰\0Ä8J	zÒàæ\nÕhÈ=º}AÜËs—†³Íô=á¿QD\"êUÔ°ä˜[CdªòD:ðÀüx^9›|2îB,¹rú—.áŽáiÒs<þoÿ\0Q–R8œKü0ÊÄ4€n\" ²û€G”[àBÂåSýDoƒŠ¥å>—…†@C”úÂÈPÄG±½ï•!¯Rª´døÜ~UÂ1Î<†¦Ù¨ædbæ_©~¥ú”3ÒU2ðXëÂ72K–1#â§™P;”u(™â¢j^#³ó¼tGˆ: Gêã¢\r 96\ZÄ1&\Z€?ûP\0ŽÕB)ÅŠý—÷\nãMWÙó£ä×ŠðÄçðË*X)—ò¹n¢±¾ff¥Ö ˆMexdŸSÄ\"\'óˆÝú­(þclÑ\"øHŠTrÿ\0Ø‡D£ŒtØ_@kŸŸþó\0tBÄv1Ñ+Ð0éŠêmvˆkC øàðÇR fTª gÄ%#*Z[ÉRØ)•\Z	\0#ç£ð*X„…–N%K©qqëQ¿s6„Î¾â413$tC¨$©D\rµ9k5õÿ\0ðJ²Èý	ðÅäûx°pý“)pÇÅ>6â:¯/P%B:‡Qíó8òÏŠ”ÌŸˆ/{D•CjÐÔÅG¨¯&O\nJ0×ŒLF¤añÐL¨f¢qÂ\\lµ1m?\n)·ß5ðHf ”­qB2yt…‰à£ò:Éƒñ:¼²¬cæidáðeßˆ\Z«Ïâ”¯ÛRºRK1…‹´äü)!LbÅ§ñÒå­Ø PT€À\0Ê,‰\Zªæf<ŸYøÕ¨-\rî?&>¥rqŒCR³Ç‚nT¢`ÔVN!ê,tNb\"XF¡ÌLy¢T`×‘c‹ˆàñW)ü*3i“G€Œ:‰(‚Š‡Bj‘ÅLùzPÚË”àü£ÙR¢¨t*r¾ãgÇ[Fy*ý\\Nc^£-Çr£lj|K”àrþásþC½¤5ÿ\0ˆEY.Ë±*¥ðäT+ú=bR¥žÙŠqcÇQ1´/¿ˆ%à\0[«ÆkÔÓqx-T­ ÈyÊõ*á¯Z†‚¤H…¤ÖkÔF\rQÁk2þ2(%Uª‹¯Ä®Î2ñ\\D9¢$ûÙŒ`ažÚ*µÿ\0âRéo\rjÇ¯ÝEäí±WˆzˆÂ‚ÕÌÄëÌ»ÕŽÈÕpj¼·úünçÝæb¾®$—>¢lK†ë‚\"Øêb¡àÜpn{ü-EŒ	D¹Iz—%0\"ð™çócøeÁà›ƒ)ñ™Ž¥x¦g~(xñê„Â`d;ër\"ÚË±¥G`+GÜÀxJ÷WøˆtvpÜ®±É¿`L‹bãæèŸ1µjb®jŠöK†Ù\Z9eÿ\0æ¼¦Kˆ}à¾‡.hE|LmÔµÔ¦NëÃŒo*²ÌŸÔ\n‚peªXÓ‰`È	”}MÊ£QzÉ¦Cw®ˆ7©h7–gÎXYLû<7j(*×x…\r/¯©d¨÷ËO÷•ÅvÒ ŸÄz¼¶vÃf@!VòAAxÄ}FHáÅÔÕZºi„áüI›~zD”	X¯…¯YMÍ•ñŠñDk&\rÖ¨ÔW2´Uæ6=&2Øƒœø5ÌK–\'©K)¹R¢®¶á’·ªú•¢^¥ Kê	–T˜ð¼à”FÅ(!bÒ!eÌXð@Ü*ÔAa³HNÒŠg×úÐGÃð Z¿‹—‚°Ç*hGÃXúŒÛ§wt˜bå°Pš¿\"¢FËý ÕŸP×ý ©àÛÆ“¨IôÃ´9øjA_8Š¬U¶ùô¯nZ}‹9ó+O…,•)øÏÝðQC×	Egì5ÿ\0†€jÐ¶hg\Zî–Ìx\"ø\0A(Ó²!HúI§ˆ‡è#àe[t¬Å-[Bú8TÉÊº§øüwüD°«\r| Ëë(²ýÊ\"TãË¿2ó\rã›€åP\'ÄujgÔG˜&¡¨=<q!H ¸âf£†ñ¸|•Ó	â êRK8ˆ†(PtÇƒŒ@Z©5ÊÄ[÷PØK©‹¹}M_QOe‡Ó-Öîÿ\0‰«k×FîÆÎ0,˜„<Àn‹ÿ\0,A¹l±•]„„\0=ƒYÛoò-T½ô&T­—_*R¹¬UÕJð§¯.¦áŽ|hœÏ{‹df¢ôøÑ)ð$Rc‰G‰ðÌ&c·ÓVÀÕ½±Çî<±ÚYýËPŠÿ\0q`d´z‚Ó[‚\r¤0¯ºáø€€­ÄSD>K˜â€ƒ`…Vâ I%À¹ oB0þˆd©‰äYµ5^Ì¿‡øš	Ïûgþ·IQÍÚ³Á†Ñ,dƒf‰~‘\'¹lþGâ\'ÕSZÙþHöC„ºÐ (:o?¨,J¨`ŠÅLö=þÐ®{‹dËJàdìØza<‘]¾Â \'l$«òê?j$h•m/SÑ–ÿ\0e^küdí=–0@‘ÊË4„\0<Â$¦c”&âo L® zË¶j‘5?Ð‚í\"Ó~èL÷öAKâb~¡À5ñYÔFzúÿ\0ƒ2ƒÛ$tVÀæU”%~´ðêk©ÅÃ¶rç+8%$àa‡¡	Œ|EzÝD1·r›Bpµ.îâ1CÏ”Aˆ…E=ˆÈŽ%H˜•Š•¶”Å=-ûƒäÿ\0*Zÿ\0¶1S\'úÑãY’‹ôŠ@Áµ üÇ±ŒÄ+\"Œî˜‹¯·zöq¿ÜK6lm÷zs7pPcSoÈÂ2w#Œ1*ÞŠTð…ORò_ÙcùøcÒbö°ˆé5þ39bg5¢ÿ\0rô–e)Ó¥qó+yˆÍDÍEz¡:J@QÃ(ºÙ3&¾£\\ÕÀÇ0à% ¾ÿ\0êi¯ýÔx±P¸ª}Ëx¿0ª£â.vám|be,\\œDÖøK!2å²•š!bnà¤T°Ü§™V™ÔÄ¹•°†(‹Yu>¦dKEÂ\ZUþSj¢öO²\ZT€èÈü„àhk¤ü\0 š??Ð&DêÁÃ)él šÁ\0\"&o—ó»F­\0¹Ñ\0>!ß˜ÏäRýÂ`|Q÷[ûŠÌL#¨¬,eUÛP¥+µò2>=!œ\n`\0\0h?Ä)ßW#¤—õ1>uø—*Ï\ZòAx#œIK,þ&I¢ñCèEí^‘G¢ZPx¶5‹¸¡2Ç˜ø=#C&2‚cs1–\'á,g^â±)c¨]@ˆms’?½	ÕDGØøÂ6H<Ìyò–4sÄT¤+™‡ŒLsÁÄØ‰É\0(P/P­ìEFæÖ+TÕ“Âkz	­\'_ÿ\0\0…Ë_ò€mø„XAD£¯ÈˆŠ×‡ÿ\0DÀû.*²òt¨)6ú–õ×¦Q!wd…Dµ®ÓzˆÚÞ¥¨ ‹-†Îa•ÛÔT‚aLÙBÌd˜,·1óŠ­–´)Z\"à)\ZA­TJ56Œ+Ü¢~ü\\¿RØ\\.6-˜¸ ¬JJ€©µÂÌi&£\'báøæ\0ZüIì‚%ŸýÍ±\0à›¨œB¥©­VË¸ÂŸ”E†ª$/õ2vª×ÔÖž¢4”2T`Špq	QP´Øc ³	82­lÔâ9©õ,6Ü\"ÒÌÃ˜°wrÜæø\\¶w;…v`Ü¯59§¸JþÂOØQYL\Z™|S)ðW3Oðänå‡¢L~t5ÂºŽ™@0‰¤†Xƒ”B]ÀIc‘?û(\\ãDø:ø—°r­ý‰P´u2ÚÁ=¡„§œT£‰LÔÚô…VMæ%`—KX–TÝóD»—uC1—,TˆI‘)”È8Îe˜~Ñ\"aÄmc\ZÄÀ(ôJî–6¨NpäcÆ,¼J”´Åíþ.W*XDÃæ]á”ñÌ¿/‹¤©GãŒ	pM!b<C<ùÂ2\Z02+ìL\"tÅ‘ùW$„Ä¬Gÿ\0¤ð†Ñ@|Ã†ãôT	—Ün‘kµXë¤3§V¢,DÂÑUS=JóŠ<—Qòéÿ\0¨[‰r^o¨j°zŠ˜ÌbºG¹Ú˜h…“¨ŠT[™í•K‡:m,‹‡‚;Bžæ¢r˜h‚Ì[2GËá¨@ˆ`_½LÜ¬JÜ\Zâ]oqÎà1üÃÔèóx™ATÃ*®8`*›ÕôI©ªüÿ\0ç}s²Èý°EÏ€%YíÌ$k{`…P¯Ø”Ó!6¨ˆLâåWÉL·…ªnvUºÍLl¬baù\ZÌ¡õÅXßá<RÓ#</¸kòË3¿˜;M§2¸¥4XÔÈ&¦!ñb01	|1S,­ež’“RÒ\\#èbZaÐ˜’w	oRëoTdnÙ\ZVMpöþõº z\n?ù†ìCöÆ(ßa~ô€ ²SÈ÷Â.Kµ}¬¡ø	QÇ¸#‡5¦j2Â•dËZaÕ¡ÁÄ¿À2ÐG…Â`¨\"´$xzæCÇÌ¿3Û,Ûu\0sGVQN‘ÔÕF%A×Üÿ\0éŒÐPŸÄöšÑ¯ÝGÒ=\njXË˜ŽñB„¯S$)¿\nq¹q¨G\Zˆ0ØÀ£œÙ=-ÛJHù¶fº	Õ·D¤­2u|¿ˆÆÃâÙµ{cº—ãí©ýZþ˜\"YþäÜ,¿m£ú-–Áž¥ð²Ÿ–Ûõ)dh¡ø	MdÊ«Á1·=ÆÄZÜ0¨q`l”Ü|ÙT‚õ¹`Ê6b¥Ä¤ã@çs%ÉRêÜ,a©s.¦‚¨¼¦Wáê`€™JQ0¦y¿¸ÄÁú”³	ª”µÎ™÷þu)ëk?ˆ@uÌ2ë¡‹neÛYJ—+Ô¨’ÏÆ¥G8ÉHš&LÁMeqà-‚þ&¦Bp^_¢\0@+F|ðµÐ­eaÓz;ù5nÙƒD¥_()s’Q`5_òBÉM\'õVùÎÏæØ¯õD½Ûÿ\0ÁýÏüCéžòÿ\0©{¿Ô1O HêÝöÿ\0Ô¶.öi¼Y—æÙ™f¡8iÔæ|¡ˆ¤¹–i%#\n˜FT1ñµî?¡_p@`ŒaÀC(4ˆä\ZÌ\n’osr1\0DÔSN\rA¾¥Xs¶Hf‚bX…6õ‘Ðßú–Õãc¿túˆf«¢Äå»Âa™…sGDÐæc©bS¹™k‹Á~BQ1Sˆ¼8gÆ\r3bü»™€Ž ˜ªj¼­xÔ\Z‚P}‡×ù½ßr¨>å7úéc¦–~¡9\'ÄßØ…—Âj_ÔEÉ‰pýOú9MŒe|£8O©À+â]B0–]øø‚[s A²œ‡¨wnmA¢¦µÜ-;_õ=Q,‡4±uÙ)K\"i%.ôGŸ¸å»‚3r¬B@æXÂËÒAv0^²)\"¦‰AfDôd-þuõ5†#húe1¤ªBÞÈWÂ±nÇÁR 0JÜ]Å¸¬\"7\rfdCšˆm)zðIp.à¨>è‡µSi&ü‰~á â££€Ü´‡µ|~ž‰ÅjZ¯kàJ°	–æZˆñ(Ü	¬K&©–îÄQÔÃ(œj9Ü«&¥ø„H!É01«˜À¸QF‹ŠˆœÌ8\'Ã+£¨VÔGÏd&¨=ÀåSÄ«H² Ar„¢Qü.Ñðº…c3f¦Kw­D¼:x<­Œ4s1|˜jd–Ëzòn\0â0@\\ÃÄ®D¨éÔ\Z¹b\Zr‰EŽ\ZŽž;ÅS,¡n­zƒçÿ\0¢08¼°z€>ô„@{\"«–\n¸ƒ,Ñ~Û„»™yihXx%Á*9˜Ôu×…)#n!~b1Š¼³\0Ïðº³S-Pµp–/+¶D$ÌˆM˜bÇjL&¢CÌÄ,j/8_RÖ+	¬ô‰n”»Xõ‡fR]a±µ…1Sªž‘SRÉqÌãÁ¿{Q+P	NšŽCQŽ™J—‚õeÈN›ZW/…$Ö51¾b&9‚b‚§%±Gî€Pø¯oHÀ…‘*TIleÙä¦%ŽÒ\rì˜-*)s9˜Ôô¼ËT±ÓšÛq,’ÍÌ)þc¦*ÀuT[	mëŒ\\ª`¯Œi.(qQ¡2¨\n²‚ˆ¨)sEÔbWw(ç¯á¸ÀJjqàß‚µÃQ!†+\nË\0æ°ÿ\0Ä¸·\0Ì/}µdAÛQË\nôKx 0èˆ³ã³l\0–K!(e •,îC))\ZM%~^â\nÂmD^È\"«,p-þy`ÚH0aAï¸òÎ[†V‡HmX’¦\0`:E ²\rtt“\r\nf¬,Ï#5íÄQîª™ñ*021®&¦D1MG¥¦¸\"â¦¥Ñ0À!AáH£¨Ä×…ø³Q*BÄ°HS;kb\n½Q¨¶ëcZIÈGè…ËnŒ2üÃ0«,²ƒ(SMªÕˆEéS0ë–7PøÑs(‰ñQÔ)!]xÞ[âå\\§>´!ô‰Eø	tê¥ª3(“zÄ.ú‡xS,©4¹ÄôÅ–b³MŒK‹ÀÆBÃD+0zH¥ý@êªÄYl©Ês˜è)š\nD4Üâs0Š9Œl²êYš$±D­ÓªqK2ÝK„%@%\"CâŠ¹]ÀiPfÏqè¶õ…4@ª×:Ôbà¶¯¨6o-of˜\Z:ñXpðÁ	oUÊýÆ¶@š¼²•êÆ sÒ|£Ù1Ü¨Ç~\ZOO\n÷™!à¨V9–Y~àáK*Ä3V€†8GxfYT\nÌa´!ô‚ 0¯¢jÒÆ¢¸fc‚£”¥¢Z]3‚`ãÕçˆ^\\&’GI¯\0><ÌøƒåF	ÄÊÉÔ©KCîåª#Ù/iD»/E™LÏ3<A+Àe,*©e\\É¸ÇÁ]¸•q\0`Í¹©}®\n`\\uÖÖº>¢ÉáñÀiL·08tRkjÆ8™ôÁF•CÜ4…L‘ÌæCk˜n^à¥T¦)–€ð¹x˜•~{±-]0–­Ì-mŒƒšHà\Z<Eül¨\0ñŽ@”²À8x‡#s˜ÍZÔÂgÓ0:	utHõÖ¹— ˜¹ˆ¹BYicR×©O¡ëÃy“-5f¿˜P‡L]ïvñyr‡ýAl‘¥2ÕåöŠ\06Ð%t†¢9€b$f=0“¢5,T³^à³D¨˜\rK»\"Ä*,Ñø5nÙÆe¢ò“žA—Æ6¯¢:\0.¯·º­}Tú‹–0;ˆØ‰†±ÿ\0¸é7R–P¯ÈDDL3›—pZ–%—Pb\0â& \"Èåˆã‹—\\@Ô¬.K`ø*££ÌÇˆ·F \"ÙQl\ZÉÙ¯b»ebf2Ù„JR\\¦åÌE 6ÊDŒæAoº—åû¿©“ÙÑ%BùgËñ4@%x@f´\ZV¯©4Rl}¦\0FAh’ŒXMŠÎ’Y¢šÖ±\0–\0·âQDªb5Ü~žˆú7+é\"¢À\\L¡R‚ieÚŽq,XŽpE\Z¸-Ô¦Wáuf\Zˆëó=”7ÅDGzŠ9?¨ÄñPmè¨†,ZƒÔmBûH	tÑ‹ŒÔêÈ)%£Rð­š™A¾%©ÃýAgxÑÂ<¢˜CdÃVe…»™%\n˜-ˆ9…µ3jZ-bâ•r’BãÛÉ*`ä—é0£0úŒÔhJeTS0.ÐËÑ„äŽt°XC¾\"Ã(ææØ@^•ÂK¸¦Œ¥í$ácMKA˜–¨¬&µ(s)Ä´ròÂVèc…Ì8`UHy·!ˆX.­UQ÷üS–w@V2U²ÙhQM£ô”dl.9\0Sz±¡YŽj…êN\'hÛŸ°j”sZŠj4”<vÛB¾â¡.ÝÔ´ ß]ÍY¦EÚ—Û•XÀ1»Äé“Ûé€-­Z^—(&Têî‡]¨d\n\"Žq-”ˆúó©C¤&6Q\0ÚÜÂ,£l¾É†âÕu\nØ1KÝÁ‰ ßqjÄ¡ÂÁìxŸò]Å²­>ÉqXˆ˜eZFê’îPgˆSp•HÁ¢1zfç#BÁÔÄÇŽ<%Ó£ µ˜\0o\'ê Ýº>¥ÕKë§zs¯:øù¸ .òÚ‡íiTÆ(¼\\I\r‚.06I—Ê8ŽÂS332‚âbƒæ-ÊP8ˆR)Åô3/¼cËÃKõ9B”rðÆÏBe´%Ñ[ð{Bƒþ£ÕúÄXLåüTÄllü\"P±!N¡¦s¨³ÖQcRèé,xE–Ëy‹e¦-1‚9ÓÑ‹¦!É#	x–e»KP8y”\Zðˆ§$jƒ X³G1.È\Zÿ\0¸H\0€J4äÂ™C÷\0ÝÕî+—+Ÿ¹¸éëþåD>Oû–\\¸ÿ\0sÔbJ“5(*Ä5. ä†Ê²ÿ\0~\rÊPKdÓ°ÊÃ(ß!‰w¿ÿ\0QÐ\Z1\rµ‚¾¡âp¤æfó+Èaò§ôŒ¹râ¥¦SÕLËÝ¥um‰ù\Z•¬¯òÄrb»¦\ZôUWâÄÄœîãØ;©”¹Wê]ª­… \nUü&PÄ.å:L&PIfF¼—1©UÁ»‚†\"©\Z—^À¶îÙÄxÃ€ó	ÐCéƒQGr·­q,§S§!â\\Û*ÚmT Žá\0\nÍ3î5JY_þ#l`Éú&ëã:\'M 	VÄÏˆEtˆ”Ggõ(.(n–ä™ïÿ\0G©u |ø€úJZúˆªÑK_mGe‚Ð™C¨ø¹GrŽåÊ*QsÔ©‰ˆ—rÅ›‰‚_B³ú\r…àNÈ%ƒM¿ˆh‹b~FÍ´;Ñ˜òô¹‘zÜ¾LŸû!¹q[–÷15âë‰wB73B¢Ý	Œå.¢\\WsT§µVNb	E¡^éþ¨7làw)¯`u\Z¥Ü©C–£A¬Z”¡Õ@hFU±k:š9®%ÎPX	ßË1i6 €å¨Fà/ø!t„žÚ¸4S ð“ãG\0POÚS)”ø:…ÔÉ¸„3/ÉÑ!‚DØT1ø©ÛÒÅ¶ä µåy+}Õ©ZîS\r@)±Á(éÐÒe­O¨ø|J˜BZæâÚtÔ˜¯‚T%7.:­;¶Yà¶™eò`øŽf^â)Œ.%x™‰ÀÊ ;0À¯¢[cˆB¹±se×Ô¯7GýÁ;epŠÌK7T]‘˜tK-L`á\ZïI³øWTµ%Kuv›â/ÞœŽf¢Eé áS)–LË™™R±pK†É&ôŒðóÞã\0ñ	ÏP(u+olªSešIùŽÊµÉw¨\" ˆ%%øœ9×Z‚Í<Gn9gÔ\\r‹˜ôàhtJ&æ=D•.œBü%Ò1-¨œ0%JñYÃ¨n]GD èyÓ1P`²àbÔ>àèƒÄdÕÂ(×(”@ô|ËŒ¨¦r‹ÃË±\Z¶ ‹¦eÕ„–]§Ä¶Í¥*ðc–åL&¨(ÿ\0’U¤Ù^v¶•;\\v¬JÂðNÓ1#qåœ4ÖðÕó‡9,fUÄ«ê{ga*)&8•Räim&5lv…Éèš>Ðó¾Üý˜xU‡Nb9 l˜‚v¹!ÕœF€\0iZ–¡¥ÐGŒËÈ©b\ZÉ˜&\'hByWÇ…©Ï‘Qi/N£îo˜ö”ãÅ¨ƒQŠ©X‡ó,ÀÙ«~f+”Kùj‚	èJÂj½C´\r¨óKÁ%á˜?gÒd%Ú\\Ô:ÛDV\r2æXõàá,ïõ5+â)^ íUo´ú…–VzFlòFrpùµw±™»¸2‚_eÄÜÓrŒL“]êøúñ®¨‹3˜T¡Ìù@$T*À“(\rÌ;îe+^Ò¿I61mh=+p¬E`—~®6´nêóêÈ§˜šË™CM²éŽÄ}ÕåöÆõ³žIó.Z¬`³ˆœe\nö–_©wæÚœ\\ÚååcÁ\ZD)\"n.&Ã.è—µ+ÉQM@ÝF¦a˜Hû¢Ì_B_¹”)ÓùƒQÃðˆ®ç)ÑULLÓ\0˜(TŠLfFŠ‰Y.V—­’©IÅ³½ Å¯ÜÏS¤E£PrÛÖ\'àƒ‡#Ä³ºÞ%*>Š‡×Ç.c>Qnˆê2XCó©Ññª†e,A9d§˜Hž\ne.£|2ûKX—nF®$BÆ1‘1qµÿ\0C Ï¢gc\0Ð\Z*°6, XMC0Òi^Pzò=ÀŽçÔ3=¦ãKàÚ+¨5_!¥¨âÆ¢˜¥K=DÚ£©lÁÑœ\rÌÄ=¥—\0¢\rD`‘‰WˆWQ=\"âåfF([\Z‹{ŠÏSß§˜?Á¨*ÆQÙ &¢šÖ 4¿?øbºñ~i•à©vËƒ!‘²\'mí©B\r/¼Bä¿\nÊƒ§$ÁÔ¡/S™OwRœí¸%mX×8s0û Úµ!R”(ÐÒ=Ä²WÐÚÀÚkÒþ£4u#~Cˆ.g—àŠæ]J!\n¼Æ7~Š\"Q•Œñ”E Â‚áX”Ç?ÒPú!H¸\\25PÝËKÆ#†Q= ÷_‹\"ê\n0—§ås <\'ÌLrŠ\n@çr  ÂD´á×&&*VòäI–~Ûwñq•GŒE_ä..ícÇ…Wó„s¯\0ç!dè¾Qñ˜˜—HV|Ô —ã~62ØžìWÂ,€ª \ZQÌW¦’÷ÄnÝÓÔy«®å=d#jü>DT¹©L1çÍÁ©í,ÔGB£/Q©rŒ%Ábr@JñAÜ®9jTN(€±ÚÍ¥¸s„ÅÀ¤ëQS¤1Øj¾O+TYQÞ7K^%£½}cˆ_Ó5ñˆ,|žˆy\0ƒ²=]ÀÓðNŒÎˆ­tiÖ}ÄM6²1î;{[%Êð\rÁ1¿‰;)§ã¹GË`×D;°ßòÆÈ%Táð‚S¨LŠGÔæWÜôê‚~!\Z»kS–J6àÚEC‹ë—)¥t@N`~	W¤·ÉÜ7nÕBH:Uï˜è+÷-õj¬3z%)ãŠ‡…JîVeÄ‘‹q™~ \róË\rFs7¢:4 —Hê’±K¸éü@«ŠkŸk™ÂðC);çÀ$„*nVª(a;×ÔËRÐôEá)ÿ\0™d©ÊD4\ré/õù\0MÜ;}…LÄN=Ô]â„ovçâY‡ÉPø`åaD¯gÓÝ{t©…U[áèêT\r`áÛXofÞ\"YP6€žŸ\'\"w-Á5µ‘Ða„õ9ñ^,\'Ãžë@†:é’gºt\Z„³1¢¡ÙxXÑ–/Pß’àçT§æQÈÃ®feD•sˆÎ%xÇ‹bs(©D¯S\Z”)4LÜÍ0Üa‹éòIk]ÃW6EQµüD#’kF\'´qª¸|ˆÁ°š€¸ŠP‹è‹ªŠÇ>±\njš°?©¿ñî(i;ÿ\0€—~Ö)»îßÔ\0ŽÖëæ8`,M\'âï}É±˜Y}ÄT3ÂL lä1rÑà±ÌjBOALîè:ê4Xéò7$wÍhÝ+¡s†¸¨a¬K<9–©êˆŠ¿·ÞªÀ³˜ìR™iU!a\Z¾‹ˆ„s–õ2Ø#ýR£“ÜÐ“n_ŽùÛT9e^˜Â.¿RèÌ/–i¹¬ñ‡>-—3\n˜†Z°qø•6—7AkF&G­ÄY&PpGqaê[¦ªbHÕpCÀˆ’&&X,¨2JÁáŽ#Ë3žð@Ï¶Ó¿ˆR§‹¢˜‘ãý;ßŸl¶os_C¨+Ë_þBN¶}>Ì,Ô´Q²»†¿hœŠÎ/5_¬‘YÑ­Ê˜¸éßjEÓ‡ÿ\0ì1ÇYñ	G}‡±f\0eÌc·Ô\nÌúƒ=7\0n·¶ýJw[\'¨®Š£®!ÒðŒÆR±çùŠiþ-èX¬Û@æÉp»¼’\\³Î#ƒÀÌYðU‘ª#4—÷¼Ç”Á?¤ßˆ½æ&–&ÌÜÓ2‡°5Phô€WKBX}xjxf¥æsàä¹Ôø@DY@‡–âµ…¾	ËÐ€N«˜¾×ÜÛ/~£}6Î…œM=¨\'\'_ ÙIŸê˜	Ó5Yqó[#l)\0àlügºáþ‘úMX\nz‡	õkœÄ…V¯/–,ö‹l²\Z?¢…JÖ£­6|Bp¼©[\'bÇ¥Ì¤\Zºc\nC¡‚Z¨ŠÃLÃ´2Ã‚=+†ÂX´ÜLö=\\f’ßSmc‡Á1â¹ r™#j ê\Zb`Ìê\Z,†?ºÆ\0æiÅ	é¸2„!¡Ä!‚’\nÁ-€Šv¢=\\1¢˜ŠÄ©%IdÄ[ ‘LŒ!PX9ø&&llxœS\'õ°o#w\0ü(‚Ä¤—£ôŸˆŒOCL°Dbû=âmvPÕLÇ~Â¿18Š.|ù~ CÛìÔHñ›\n²ˆ²%î)á÷)Z‘C‡’\rWsê -<F^‚Ëþ¥¨ŒµqÙc¹ŒC4ÕD \ZkÙü@p×R¢©zÄ§$e~£l„p¹DBåb ÔA.<AN¤jÕŠC¨ècžÅL] (J³ˆÂ>à‡ŠÉ¼ÔøfR	S”1S%ôš¢²„~aÃëðh&*m‘¦øe9–_ËüMeˆ®³óÂ“qoX\\óÄ¶ÅÀ·ø\ZÁ ­­1jÀq+Æ~¦B>3x¸\\jfè]1X\0i^®),ÃR‹Bn‘©C:†ÇSìKÈõàe’-\0è™O	G•î\\øŽjø”D¬~*Ôª’Ž%J¸Ò1£gˆüAW!,l O§\Z`„|âË]Ê—¦¼R6ÕOXø¯	,1áPÍ‡{–j&R\r(¨œ{š®¿Dø_*’z&#ðGøÀ”xu*ŠÉt=¿ÂÓöâpvÇyb)Sä˜™¨QðÃÀÔ+éñ	ôÑy\"íÈ6õRÇ2¹#Õí»—ÙúP\"Ev—*ÚÁÃ\n8)*¥5ˆGº ]J#»—™l(‰C´--ƒsQrË³œ°WNe\0ºcY!U.7·8ÙD-!ÛÈÌçb(·(…U²£*ýDÜjb15vŠ²êv‰e\nÍr\'dÂJs_…Êç–Fq´Ÿò\Z–kùˆ˜aUÐÇâ2^¹¥¤Øk¢*0ðê[ùPØ’íB…íýM?ËYƒÕÒ}W3{äY×ÿ\0¢;náêà²:´K—0!ˆ®˜bd‘–,W	Ï–ÂTÔ²;fJˆR:È—:‹öéÔËí,É=D¥JIXÇD°2\r¢x/ÂCE{Éid·¸%åøßˆ\n+‰SaÔO?4CÐ}óþFEhÐh\0ã~ `sƒ	kÈOL—,rx3øƒ}D¢ú”ÓÊýÄ’Å\Z^Ç‰\rÑj9WÊ5p¾Çó/PRr¡¸±œDÄŠ™„V\rþ*6x5.> Ñ¼–V/ûƒÆ¨—Š—,Æýf7œÜ0KÖ¥!,ª‹±šÎ#0q~+ÂˆÏÑ™Òl»`µ„»Ì}”7ñ)¸\Z­BFŽÌ(=‚Æq43ô#äë²šaR¢Œê\ZüÒ)ÙÐøà¸2îc¿\"Ñ!”÷6¡ê„À¡\n}#õŸÁß*JCÊ2ÙSàX–Áœ@ÌÚ13ã‰`¨ê¼:¨n0d›L³©e{\Z&!Í#Ž¬6Ý¤U¬uà®bD¥Ô¶j–V¥=øXÁ;ŠVã…¢^µ†1ˆ<øUš*¹}.Æ9…SrÝ0zPªi”‡@ õ4\\yÓõ9ÿ\0\"FéþvL†ë)}¶’,Š³áqñ~\rGQë²,C0Fº­‰R:\r¿ûã7¦\"W€R›\nê=ÂZmmL—·÷Èï‡H)ÂåŒ¨$’–G×å¿€#¹y¯;G,Qy„¢}ÅÊG¼GXF÷ÚŒA1¼Rã¸·Sª%¿9oÉ00‹¼Aê& \0LÖc]¶o0â¦•î“XR08Xê1ô­M…=B“_ã¯¾äó„üóåAoŽœóÆ ×¤†Ê\\,­‘ay´¨÷e?¹D¸ÃãOH27õYXW%×s9á‰€úíäùšMnºbsÕ–HJa•Ÿ1´û]?H:qŽ‘*S\\xÁÂb\\Ixð¤qrÉ´ÛÁ¶nr÷áy„gd\\P+Xõ„>U‰tªøH8–c_S9´t˜—0‚ óDT4~B«M°gâàŸD\0U£Ô4`W!àt0Ld½_è¨%4ºÿ\0ªCú‹ä\rfx4[¹ý‘YEL™îµaß¶XhY@‰[ü\Zxÿ\0Æê;öèÁ-iJ0ÁéÒ£z;S_ª‰6>±¸TDyeé²±¤weËg/FåL5Xå7ÄKÌ«”Ðásx¿\n9ñVÄaa•àÉ+rª;šžžjTq¢Ë”,xÄko3:pK„®rMO„.*+©^£é€³„31(•*T¢\"œáÂ4\'6Ò^E	Ì(D¯;0³aÁ9YäÃ!P?fô!FÇa\n²#~ …«ü}ÊJŠbíË˜¥‹h­}Á‡ ¯è`.P˜qð\\Dk\0ÇÔ]T…·LY¹ƒ$¿3(Ô¸b13+“I™bp•à(\'\\ãÚ±3DÒ\rE\'fÑµ˜™ªz=0B¨Ã¢»„¬¾8ï¶ÚWÛ6fhð)`R/Ù¸xuc‚\\;ÍåÍ!*`ÍËÜcYP.i\"\rP›f¢ªKÚ¤)êB.|#¾YH×¿È‰C¨,>~/ $s\0Ód¥ŸJ¯@n\'‘{‚:”ââ9‘D‰\0^dT$)Z¸7O%YûOêhÆuì‚Û¼Ø/àúŸ@/ú†ë+¤SïPþG>j=øCvû€:‚C¬FHÜ³ý°Æ>Hpfà+àfµä786†®^ÂÖÀ\nî=-NÜ°ý3Þ¡FYÌ&£/¾]Äh¾cq¶ßãofT.nf:›M<\ZóSHM#+¨\ZLJfDê\rä—™Â\ZÅÚ]Çb4ú2Ùuä,½Ì~%_€!gë™Z˜ª~¸I‘-º`-³¡™*gRÔ=z!XÜ»©½Äê~¥zþ¥#Zn9ô\n\r„ ÿ\0¡ÿ\01 UúŸCH=!6ßÁÒ	Wè1ó9éSÑ)3Ôµæq\ZwÔë˜dIÌ>ç5!§õÄ)?Ì·P[›Àc]ÐCS5ú–O„øNÞ.¦‰F¢7©I.eE·3IÄÓÆ ³Rê>¾OÜO–\r³m’éi»úJ·€TÔºQûžˆËc\ZãÎ¥Ñh0ŸðÜ±)MaME ?DØ.¦†eË)ä%Y@å¿ó¬é7Ïp³.æµ_0ÒàáárÏ\0´b¢\0Lzð>§»‡Ð´t¸´*åæÅn¦e¡g³RÎ¥K³^.Ø„xX8˜òUÌ‰Ä5˜ÝËŠ,OH¥Ìqý(«}Jð¸†þxá¢*s÷Oa5àÒatÀ\0J¨!îU•L¤¤¤§så)Ã‰Fµ²ë§æcÊÔ_ÆYw½D‡µæf\nMù¡Ì<Ï%{‘Å>æLy§ó+®Sð\r×‚mÑˆ<´ú#\nÝ¿\0u5Ë—†¼,qá–ù7/N\"ˆ7)ˆ™ÿ\0”S\\3p|ý(ÅS´¨8€N’üŠ¾%J•Ï©Æ-âXòfu—‰©Çø#ïzü\Zš¸eqw-áU(ˆ…ÌøŸ›£ðXýEZ‹*e_xb¾§mFE³ÃtÏ7+1K/\\2×ˆbŠÒ<XbYä.¦J\".¢j]ãRÈ‰©â(·‰Ad¿(´* ZY~Óxw+a©ôcð]…“&Ê”1=”²nT¯¨¶0ÃþA^„*ý:;”sC¸“V­xA˜`x™1à<¢‚÷4\'NE2©ÿ\0‹2§Å§Ô2¨Ô¸nQíf;¬Mð÷õ8GEOié--p¯\n¸GG0j]øMÊ&RÃm%D™ñèË\'ÑD+¼AêŠ“tˆ  ÇáT¨ç˜l˜j/‡@ƒJ¬\Z¸\0´~¥ÍÇuù´Py};î(ëðþTCõ‰{ÜGRüKs-pÌ*\0JDA 0˜Sÿ\0-?tþà¡G¾jz­ÌP6£TÓ0ï„i¹¤Ë4T¦n†zÙv@1x”’›•äqåRˆ!xQ`‘µS=À¨¶âG–VN¥\nÀc–ëU÷uK/håçð³?„d¨Ëñ¨å`Ä.¢¨›S\\Âu‰EãùfÈ0¼Sø˜×ã‚=2£É9!h°¦Æá\\K	{b:L²Â¢Ö¡U6ÿ\0²\noîq)~aP•‘ë\"U#õÌÄ²Ž›a\rÓ–E,bQ)ÕÖ#Z˜¸ÔZbâ¸ˆJIimÌL¹)~n\\Àò²ÍÊ¥~é\\!*¥Ö¡ºÐp}L\nÄ-1¹~FÀzÕÇ‚œ´£––êåÖICÕó)Aà¨¨Ÿ™ý)J}?©Á(OÁÁ4áúE+¢tO(†æn%…J«r†â•ˆÄ2¸~Ñ¯½þâÒØ‰ód^Ð?CÀÉ0s*¯C‚„öªæ\\÷(qè•ÜK	MÝÊ^Xõq/Ü¤72Ï™V@{‹Ñ(}LÞ\"ªªÔôK¸bPñpÍ\0ˆV¦3\næ0ÑtÅP¥9‡y!ÎTØF€ŠÑqLz\"ø<6™˜\'2àÂø%§å’É¡ä¼þÈhüñùÉ‰¶ÿ\0‰Á\rD¸kPõì™‘gõ7ÌEò–C„ºÌ±‹¸.qÔ£5E«àª–/îÌ%Rþ0h—#næqF»NS,Û)»a*^e<âfaU(”‰Z‚ºÔb¤¶ñ„¸Çq¼Ä²1­YW	Ã’C¹år©ÔªôE~ZŒ±]fŠº”| <LøT‰\"u(ÂÊPâ-*Qs¯G~Gà-Z–—G²Töh YRëî,ƒÖjd€ûaêÁó*¬—-!f ÞcC…Â|Ê	YSiüDFyxž“.w)þa Ô˜þ[•®J—*šDU8‘‰GˆbLÀ`D¦		rY¸¸È^e6…\"8ŽÈÔ+Q+ãr¼ìhÌ›îr!K\"Ë43‡hpõ¥­eÄÛñÔÄµÆå½Íž¡tV[£›vB­*h—e@ˆ’ïu1™aá\n+­ÿ\0C™ZT´û¯#ÚZ™Šý¶/Üx(»3:¿QîR£-ÈxÄº	«šœËc·DÇ\r&=Ê•˜~*\0f†LK©„³¨ÆÒ.c¨3® Ç#@ú— j˜™îSû„íaÅ½ÌÃæ+q*a–¢ClP¸`¨‹à[˜ÊªÈ¬S¨ÐÄ\n„)Ä»Ä§så=\"?,%\\¼TÓ(lH.HUpê)D6Æ0áèE“=±¥Àär	‹?‰sñ5š&ù¨vaqêTëÕ¸ˆ>Ê@”\Z.aØ÷‰N;1|FÇ.¯&Š#à–·ã„Ù.êÚ©¹g	>nÆZÆ9d.Uq\0wXÁ¢*Ó iÄGR ¶ú%Ý[§šH¨K/ìÒ‹·\"ýKUžÅ»—Ï„	~“¶²/>0£ù—itO°nSˆOH\'Ä¸²î¡GÜxÂF[Ì111â-òna/Ç€ÆgV/P›n•˜ß¯æ9F™‚¬Eâ‘Žo4*.a]‰ïÆ…[ Š pƒÀá*ŠD9ˆPœ8³ÀKt€¬iˆh>b¾Ep¢ýK¬Ë#økg#ÕCt^“ß’Äµ1¥ŠÏ˜ÕÁpC*8T‹†6fi*lV&A§ð#’ž˜¬?A€•–‚oÒµˆª]˜N\"õ‹(3è¨dgE?¨Å“—ÐÁõFµÒ±2%j| :¸—‹Hôðç„ÒLzL¦!Uç|ÅiÅFÜE Y©Ð˜âU:‚O]t¢F`ê{	`<MÎ!teOIrÉgQeÆåBa Ø„–‰T;¸8†&e](üÂžfËœGñ =Õ¿¨j­ËÄ·m3Óž¼õ\"}þ¥x?q—–u•Ì•f%¸•ÜE;¹šb\r9C¡^ø°‰K(_¥ƒËz+ýÌ»HÃ¬6Êÿ\0hËBãÿ\0È¼P•f‘°Àmq0Þ^…¢…€¨š¤H°s)ÑÔzA¬Éˆ‰‘¹¹`Ò™M%*bd³3	âêˆ”Ô!¨#R±qfå5–™Ç\0¯õ€ÌÔRÙ¨S¼¬¹x–Ëƒ-ÁšP3%«[F ·rÔÈ±YE6®ñ©Š¦cV{`Ž³1Ü³–QÍÄ‹q\0¦Üb+lNñ|ÿ\0¬œÅlÑÇ.ó1¹KsMK2ä~a•4pKŒØšÏrøÂg9­ª¾bÏ/ÔÙœŒ§ÙPª½(³í\"õrÉµ~bŸ\'œKc’nRê¦9\"ÙóNàkl\n¥ˆâ RâX b¨”FÑ¦ˆU™rÅ³è’¼ÄÁÃQË²˜ˆ	b›œ¡Lbï>—ŠX?ÒØ#2•‚u ¥dKRõ™í‰Ô`7Ü¹†=¯ó07·½™q`©¤**Z_W†›Ÿ/ÌÔ¶åú˜j	€»•LSÉ±n\ZÅT(1›.¨µ„‰¢7:ˆ‚6XrVª^-)©R×ÉŽâèÏ|·Ÿ`º”Ä`Ba$@ÕESdKT´ø@éØƒRT#dê¥Œ3M@;Üj`âPÊ	p<¾ yR(#\n€þ([ÿ\0«þˆ¿Š7ÀƒNQ›ð¯1É!¹‚œ¨!/(_=èÚ^¶•ÙKOz{“Üžä÷\"t‡¬x³ÀPâ]j1â\"Œ1SØžÓ2çË9ª£î˜%-ß°¤ !™üÄToÄEOðEi~¥·…-çø\'þ1?ó‰iè–ÿ\0ðêÀú ¹sÙžÌxg(õQ§úŽÔýDtÈ>Ik»@”Fæ-Ú¶™ó‹[Që‚°â[µ{”°†\'Ž ®£áü\'ÅŸ$ö#äŒ<°ß‡Ô#	´!;‡—ñcò>Ìß‘8‡ø\r~B0üøüx„?/ÿÙ');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `question` varchar(200) DEFAULT NULL,
  `date_added` varchar(45) DEFAULT NULL,
  `answered` tinyint(1) DEFAULT 0,
  `productid` int(11) DEFAULT NULL,
  `moderated` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'James','Isnt this a very old model of phone? Why are you still selling it?','2024-01-25 09:39:56',1,2,1),(2,'Jessibelle','I notice this TV says Killer... DOES IT KILL YOU?!','2024-01-25 16:26:06',1,3,1),(3,'Michael','Does it work?','2024-01-25 16:52:58',1,6,1),(25,'greg','This product is called \"Killer TV\"! Does it kill you?!?!','2024-01-27 19:19:09',1,3,1),(33,'greg','I am testing the email system!','2024-01-27 19:21:12',1,3,1);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'as1'
--

--
-- Current Database: `csy2088`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `csy2088` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `csy2088`;

--
-- Dumping routines for database 'csy2088'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-30 14:35:26
