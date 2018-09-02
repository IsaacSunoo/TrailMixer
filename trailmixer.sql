-- MySQL dump 10.13  Distrib 5.7.21, for osx10.9 (x86_64)
--
-- Host: localhost    Database: trailmixer
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(45) DEFAULT NULL,
  `street2` varchar(45) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'123 Main St',NULL,'Denver','Colorado',NULL,NULL),(2,'1122 Main St',NULL,'Denver','Colorado',NULL,NULL),(3,'12345 Main St',NULL,'Denver','Colorado',NULL,NULL),(4,'123 Test Trail',NULL,'Denver','Colorado',NULL,NULL),(5,'701 S Franklin St',NULL,'Denver','Colorado',NULL,NULL),(6,'1700 N Sheridan Blvd',NULL,'Denver','Colorado',NULL,NULL),(7,'1312 W Geddes Ave',NULL,'Denver','Colorado',NULL,NULL),(8,NULL,NULL,'Denver','Colorado','40.3105',-105.6403),(9,NULL,NULL,'Denver','Colorado','39.9787',-105.2755),(10,NULL,NULL,'Denver','Colorado','39.9511',-105.3378),(11,NULL,NULL,'Denver','Colorado','39.9997',-105.283),(12,NULL,NULL,'Denver','Colorado','40.1108',-105.7463),(13,NULL,NULL,'Denver','Colorado','40.02',-105.2979),(14,NULL,NULL,'Denver','Colorado','40.0202',-105.2977),(15,NULL,NULL,'Denver','Colorado','40.2078',-105.5664),(16,NULL,NULL,'Denver','Colorado','40.2717',-105.5566),(17,NULL,NULL,'Denver','Colorado','39.9388',-105.2582);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (1,'Denver','Colorado');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `difficulty`
--

DROP TABLE IF EXISTS `difficulty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `difficulty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difficulty`
--

LOCK TABLES `difficulty` WRITE;
/*!40000 ALTER TABLE `difficulty` DISABLE KEYS */;
INSERT INTO `difficulty` VALUES (1,'Beginner'),(2,'Easy'),(3,'Moderate'),(4,'Hard'),(5,'Expert');
/*!40000 ALTER TABLE `difficulty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preference`
--

DROP TABLE IF EXISTS `preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `difficulty_id` int(11) DEFAULT NULL,
  `trail_distance` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `altitude` int(11) DEFAULT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profile_preference_idx` (`profile_id`),
  KEY `fk_area_preference_idx` (`area_id`),
  KEY `fk_preference_difficulty_idx` (`difficulty_id`),
  CONSTRAINT `fk_area_preference` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_preference_difficulty` FOREIGN KEY (`difficulty_id`) REFERENCES `difficulty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_preference` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preference`
--

LOCK TABLES `preference` WRITE;
/*!40000 ALTER TABLE `preference` DISABLE KEYS */;
INSERT INTO `preference` VALUES (1,2,8,1,10000,1),(2,5,20,1,15000,2),(3,5,50,1,20000,3);
/*!40000 ALTER TABLE `preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `age` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `img_url` varchar(500) DEFAULT NULL,
  `bio` varchar(500) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_profile_idx` (`user_id`),
  KEY `fk_profile_address_idx` (`address_id`),
  CONSTRAINT `fk_profile_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,1,'John','Wick',34,1,'https://skilldistillery.com/wp-content/uploads/2017/01/AndyCPicSDWEB-250x250.jpg','I enjoy spending time with my dog.','Male'),(2,2,'test','user',23,2,'https://imagesvc.timeincapp.com/v3/mm/image?url=https%3A%2F%2Fewedit.files.wordpress.com%2F2015%2F01%2Foffice-space_320.jpg%3Fw%3D320&w=700&q=85',NULL,'Male'),(3,3,'Steve','Rogers',143,3,'http://cdn2-www.mandatory.com/assets/uploads/2014/03/Captain-America-The-Winter-Soldier.jpg',NULL,'Male');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trailmixer`.`profile_BEFORE_DELETE` BEFORE DELETE ON `profile` FOR EACH ROW
BEGIN

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `profile_reason`
--

DROP TABLE IF EXISTS `profile_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_reason` (
  `profile_id` int(11) NOT NULL,
  `reason_id` int(11) NOT NULL,
  KEY `fk_reason_profile_reason_idx` (`reason_id`),
  KEY `fk_profile_profile_reason_idx` (`profile_id`),
  CONSTRAINT `fk_profile_profile_reason` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reason_profile_reason` FOREIGN KEY (`reason_id`) REFERENCES `reason` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_reason`
--

LOCK TABLES `profile_reason` WRITE;
/*!40000 ALTER TABLE `profile_reason` DISABLE KEYS */;
INSERT INTO `profile_reason` VALUES (1,1),(1,2),(1,3),(2,2),(2,1),(2,3),(3,3);
/*!40000 ALTER TABLE `profile_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_trail`
--

DROP TABLE IF EXISTS `profile_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `trail_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profile_profile_trail_idx` (`profile_id`),
  KEY `fk_trail_profile_trail_idx` (`trail_id`),
  CONSTRAINT `fk_profile_profile_trail` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trail_profile_trail` FOREIGN KEY (`trail_id`) REFERENCES `trail` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_trail`
--

LOCK TABLES `profile_trail` WRITE;
/*!40000 ALTER TABLE `profile_trail` DISABLE KEYS */;
INSERT INTO `profile_trail` VALUES (1,1,1,4),(2,1,2,5),(3,1,6,5),(4,2,4,5),(5,3,7,4);
/*!40000 ALTER TABLE `profile_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reason`
--

DROP TABLE IF EXISTS `reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reason` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reason`
--

LOCK TABLES `reason` WRITE;
/*!40000 ALTER TABLE `reason` DISABLE KEYS */;
INSERT INTO `reason` VALUES (1,'Fun'),(2,'Social'),(3,'Fitness');
/*!40000 ALTER TABLE `reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trail`
--

DROP TABLE IF EXISTS `trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `altitude` int(11) DEFAULT NULL,
  `img_url` varchar(500) DEFAULT NULL,
  `difficulty_id` int(11) NOT NULL,
  `distance` double DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_trail_address_idx` (`address_id`),
  KEY `fk_trail_difficulty_idx` (`difficulty_id`),
  CONSTRAINT `fk_trail_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trail_difficulty` FOREIGN KEY (`difficulty_id`) REFERENCES `difficulty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trail`
--

LOCK TABLES `trail` WRITE;
/*!40000 ALTER TABLE `trail` DISABLE KEYS */;
INSERT INTO `trail` VALUES (1,'test trail','testing',5000,NULL,3,23,4),(2,'Washington Park Loop','Washington Park Loop is a 2.3 mile heavily trafficked loop trail located near Denver, Colorado that features a lake and is good for all skill levels. The trail offers a number of activity options and is best used from April until October. Dogs are also able to use this trail but must be kept on leash.',5600,NULL,1,2.3,5),(3,'Sloan Lake Park','Sloan Lake Park is a 2.6 mile loop trail located near Denver, Colorado and is good for all skill levels. The trail offers a number of activity options and is accessible year-round. Dogs are also able to use this trail but must be kept on leash.',5321,NULL,1,2.6,6),(4,'Highline Canal Trail','Highline Canal Trail is a 16.5 mile out and back trail located near Englewood, Colorado that features a lake and is rated as moderate. The trail is primarily used for hiking, trail running, and mountain biking and is accessible year-round. Dogs are also able to use this trail.',5511,NULL,2,16.5,7),(5,'Beaver Brook and Chavez Trail Loop','Beaver Brook and Chavez Trail Loop is a 5.1 mile heavily trafficked loop trail located near Golden, Colorado that features a river and is rated as moderate. The trail offers a number of activity options and is best used from March until November. Dogs are also able to use this trail but must be kept on leash.',7755,NULL,3,5.1,NULL),(6,'Bear Creek Trail to Sister City Park','Bear Creek Trail to Sister City Park is a 4.7 mile moderately trafficked out and back trail located near Lakewood, Colorado that features beautiful wild flowers and is rated as moderate. The trail offers a number of activity options and is best used from May until October.',9520,NULL,3,4.7,NULL),(7,'Maxwell Falls Lower Trail','Maxwell Falls Lower Trail is a 4.2 mile heavily trafficked loop trail located near Evergreen, Colorado that features a waterfall and is rated as moderate. The trail offers a number of activity options and is best used from March until October. Dogs are also able to use this trail but must be kept on leash.',8484,NULL,2,4.2,NULL),(8,'Red Rocks Trail','Red Rocks Trail is a 5.8 mile moderately trafficked out and back trail located near Morrison, Colorado that offers scenic views and is rated as moderate. The trail offers a number of activity options and is accessible year-round. Dogs and horses are also able to use this trail.',6280,NULL,2,5.8,NULL),(9,'Mount Morrison South Ridge Trail','Mount Morrison South Ridge Trail is a 3.2 mile lightly trafficked out and back trail located near Morrison, Colorado that features beautiful wild flowers and is rated as difficult. The trail offers a number of activity options and is accessible year-round. Dogs are also able to use this trail.',7893,NULL,4,3.2,NULL),(10,'Beaver Brook Trail','Beaver Brook Trail is a 11.1 mile moderately trafficked loop trail located near Golden, Colorado that features a lake and is rated as difficult. The trail offers a number of activity options and is best used from May until November. Dogs are also able to use this trail but must be kept on leash.',7788,NULL,4,11.1,NULL),(11,'Emerald Lake Trail','Emerald Lake Trail is a 3.1 mile heavily trafficked out and back trail located near Estes Park, Colorado that features a lake and is rated as moderate. The trail offers a number of activity options and is best used from April until November.',10110,NULL,3,3.1,NULL),(12,'Mallory Cave','Mallory Cave is a 2.4 mile moderately trafficked out and back trail located near Boulder, Colorado that features beautiful wild flowers and is rated as moderate. The trail offers a number of activity options and is best used from March until October. Dogs are also able to use this trail but must be kept on leash.',68256,NULL,2,2.4,NULL),(13,'Mount Falcon Park Upper Loop','Mount Falcon Park Upper Loop is a 3.9 mile moderately trafficked loop trail located near Morrison, Colorado that features beautiful wild flowers and is rated as moderate. The trail offers a number of activity options and is best used from May until November. Dogs are also able to use this trail but must be kept on leash.',7838,NULL,3,3.9,NULL),(14,'Parmalee Trail Loop','Parmalee Trail Loop is a 3 mile heavily trafficked loop trail located near Morrison, Colorado and is rated as moderate. The trail offers a number of activity options and is best used from May until October. Dogs are also able to use this trail but must be kept on leash.',7799,NULL,2,3,NULL),(15,'Rattlesnake Gulch Trail','Rattlesnake Gulch Trail is a 3.4 mile moderately trafficked loop trail located near Eldorado Springs, Colorado that features beautiful wild flowers and is rated as moderate. The trail offers a number of activity options and is best used from May until November. Dogs are also able to use this trail but must be kept on leash.',6727,NULL,3,3.4,NULL),(16,'Green Mountain West Trail','Green Mountain West Trail is a 2.5 mile moderately trafficked out and back trail located near Boulder, Colorado that features beautiful wild flowers and is rated as moderate. The trail offers a number of activity options and is best used from April until October. Dogs are also able to use this trail.',7927,NULL,2,2.5,NULL),(17,'Longs Peak - Keyhole Route','the 13th highest mountain in the state and one of the most visited peaks with a notoriously elusive summit. The trail is well-marked and can be crowded on summer weekends, but Longs nevertheless delivers on the promise of incredible views and worthy terrain.',14255,'https://static.rootsrated.com/image/upload/s--3KWs7nqV--/t_rr_large_natural/mptssljbr3nagp44qe4b.jpg',5,15,NULL),(18,'Mount Bierstadt','A great starter mountain for those hoping to hike all of Colorado’s 58 14,000’ summits. The typical descent back to Guanella Pass involves bushwhacking through moose-infested swampland, where 7-foot tall willows create a natural garden maze.',14060,'https://static.rootsrated.com/image/upload/s--sGeMXaBm--/t_rr_large_natural/pzstgbl71dkjlkmtybyi.jpg',3,6,NULL),(19,'Lizard Head Peak','Lizard Head Peak is one of the toughest 13,000’ mountains in Colorado to summit, thanks to the chossy, loose, 400’ vertical tower that requires 5.8-graded climbing on poor rock to reach its highest point. Standing at the base of the crumbling tower (an extinct volcanic pipe) makes the fact that it was originally climbed in 1920 even more impressive.',13000,'https://static.rootsrated.com/image/upload/s--VrLqwm0G--/t_rr_large_natural/ozueigyacpdyezcdryb4.jpg',3,7,NULL),(20,'Black Canyon of the Gunnison','Black Canyon of the Gunnison flips the script by bringing you down rather than up. The “trails” are more like suggested scrambles rather than fully developed hiking paths. Rivers flow deep along the canyon floor, a shadowy place where the towering walls feel like the entrance to the netherworld. Wandering the canyon base is so unique for Colorado, it deserves a visit for adventurous hikers who aren’t afraid to get a little dirty on the way down.',3000,'https://static.rootsrated.com/image/upload/s--VrLqwm0G--/t_rr_large_natural/ozueigyacpdyezcdryb4.jpg',4,1,NULL),(21,'Bison Peak','The gradual hike up to treeline tends to go quickly, and it can get hot and dry in the summer—bring extra water! Cresting treeline opens up views of the wobbly, blocky, stone towers, some of which are over 150’ tall and seemingly transported from the Moab desert. Thankfully, the summit is a half-mile hike off the main trail across grassy meadows with a few easy hills or rock scrambles to the top. ',12431,'https://static.rootsrated.com/image/upload/s--NzILZ4mx--/t_rr_large_natural/upzbheurea6xgcstnrol.jpg',2,11,NULL),(22,'Star Dune at Great Sand Dunes National Park','In the early spring when the rivers run through the fine sand basin, the landscape transforms into a living, breathing desert in a compact package. Above the dunes stand the Sangre de Cristo Peaks, many towering over 13,000’. Wandering among the dunes can be as long or as short as you like it to be—consider it your own personal sandbox.',13000,'https://static.rootsrated.com/image/upload/s--o6AjXYCc--/t_rr_large_natural/dgbvdmbditmw4kxoselc.jpg',1,4,NULL),(23,'Lion Lakes at Rocky Mountain National Park','Accessed by the less-crowded Wild Basin Trailhead, this trail is mostly on the shared Thunder Lake Trail before eventually splitting off into one of Colorado’s most exquisite backcountry basins. Though the trail eventually fades out, navigation is relatively easy: follow the lakes, streams, and waterfalls up to the next tier. Wildflowers abound and the pristine meadows have all the natural charm of Rocky Mountain National Park’s best settings—minus the crowds. Don’t let the high mileage fool you, most of the trail is flat and easy to cruise.',13579,'https://static.rootsrated.com/image/upload/s--l8bI4rTQ--/t_rr_large_natural/qnjqus2s2cq2ob7g1mfv.jpg',3,12,NULL),(24,'Pyramid Peak','With good route finding, however, the standard route will stay at a tricky but solid Class 3. Most hikers start in the blackness of early morning (3 am is a reasonable start time), chugging up a steep headwall to an exciting scramble to the top (roughly a mile). Mountain goats are regular spectators, and the rock is solid for Elk Range terrain, especially in contrast to the neighboring Maroon Bells.',14018,'https://static.rootsrated.com/image/upload/s--l2eOCPrH--/t_rr_large_natural/aca1vybohrmiaybcgspc.jpg',5,8.2,NULL),(25,'Boulder’s Guardians of the Flatirons','The trio of peaks that stand over Boulder’s iconic Flatirons make for an excellent day hike, which can be done as a loop or a point to point (approximately 12 or 10 miles respectively). Hikers can start at several different trailheads, all within the civilized confines of the city of Boulder. A popular route starts at Gregory Canyon Trailhead near Chautauqua and begins by ascending 3.2 miles to 8,150’ Green Mountain.',8150,'https://static.rootsrated.com/image/upload/s--DcwBr00k--/t_rr_large_natural/prahwftvn53i1vgwlp2t.jpg',3,10,NULL),(26,'San Luis Peak','San Luis Peak is a nice, long day hike (13.5 miles from the Stewart Creek Trailhead) through one of Colorado’s most vibrant basins. The gradually ascending trail is mellow, Class 1 terrain that starts in a piney forest, passes ponds and pools, and eventually opens up to large meadows with trickling streams, dense beds of colorful flowers, and wide-open views. It’s rarely crowded, despite being one of the 14ers, and the rocky trail at the top is welcoming and easy to follow.',14014,'https://static.rootsrated.com/image/upload/s--D0RndliL--/t_rr_large_natural/uqdluwlnzfz9cb3xn5fa.jpg',3,13.5,NULL),(27,'Lost Man Lake','This hike is roughly 7 miles out-and-back and follows the Lost Man Loop Trail through a rocky, rugged basin. The chunky glacial rock debris is offset by serene lakes on the south side of Lost Man Pass, most notably Independence Lake. Keep hiking up Lost Man Pass up to 12,850’, where the dark, inky waters of Lost Man Lake reveal themselves on the north side. It’s a great place to have a mountain picnic or a chilly dip.',12850,'https://static.rootsrated.com/image/upload/s--M9N0cJwz--/t_rr_large_natural/qdmjnnjxcqtudkkbbsuu.jpg',3,7,NULL),(28,'Mount Elbert','This 9 mile out-and-back follows a solid trail from forest to treeline, where hikers get acquainted with the thin air and the possible heartbreak of a pair of false summits. Fear not, the actual summit is not far past the second false summit, and the wide, flat apex has a collection of wide shelters. There is very little exposure along the way, though the views of the town of Leadville and the Sawatch Range are mighty impressive. ',14420,'https://static.rootsrated.com/image/upload/s--kOOT8Rv9--/t_rr_large_natural/yxp1evxae44chypenzgc.jpg',3,9,NULL),(29,'Mica Basin','The Zirkel Wilderness is one of the lushest mountain regions in Colorado thanks to its northern location and relatively low elevation. The same storms that keep the rivers flowing provide the ski area’s legendary winter powder. As a result, the area is rich with flowers, flora, and colorful grasses and willows. Mica Lake is a small, greenish blue pool that is a favorite with canines.',12057,'https://static.rootsrated.com/image/upload/s--ce8op_v0--/t_rr_large_natural/rw9j4zkcd3ikemmxwnpp.jpg',2,7.6,NULL),(30,'Argentine Pass','Argentine Pass connects two basins, one accessed from Guanella Pass near Georgetown and a second accessed from Montezuma near Keystone Resort. Both access points require a little 4x4 action to reach. The eastern approach from Guanella has a parking area at the mining ghost town of Waldorf, where a battered building that once housed the post office still stands. ',13207,'https://static.rootsrated.com/image/upload/s--1VUd_PeC--/t_rr_large_natural/tdyfkjz1ubcqnc7roy15.jpg',2,5,NULL),(31,'Peak 6 via the Colorado Trail','This beautiful section of the Colorado Trail ascends through a shady forest before emerging from treeline in roughly 3 miles to open meadows and stellar views of Copper Mountain to the west and the town of Breckenridge to the east. It is easy to get off trail and walk along the gently rounded hills to gain the ridge between Peaks 6 and 5 and take in the views.',12840,'https://static.rootsrated.com/image/upload/s--JBKVmZbo--/t_rr_large_natural/gc4kdsladtnjbbh3ys1a.jpg',2,7,NULL),(32,'The Devil’s Causeway','The Devil’s Causeway sits in the Flattop Wilderness, an isolated patch of mountains that are accessed from the town of Yampa between I-70 and Steamboat Springs. The hike itself is a nice, 6 mile round trip starting from the East Fork Trail. The namesake feature is a non-technical but heady 50-foot stretch of rock that narrows to 3 feet wide and has drops of 60-80 feet off either side.',10280,'https://static.rootsrated.com/image/upload/s--_pB-YWxs--/t_rr_large_natural/opxni380lcwmlsuod1hm.jpg',4,6,NULL),(33,'Ice Lakes Basin','Ice Lakes Basin offers a snapshot of what makes the San Juan range so special. This 7-mile round trip follows a steep but steady trail through the forest to a series of shimmering, blue alpine lakes, including Island Lake. Creeks cascade through the green valleys and roll over rounded rock walls, painting them a mixture of green, black, and grey. ',13780,'https://static.rootsrated.com/image/upload/s--NqwsqxCR--/t_rr_large_natural/mmmqlfb3jtidhsocfbol.jpg',3,7,NULL),(34,'Sharkstooth Trail','The La Plata Mountains can be found in southern Colorado. The Sharkstooth Trail is an excellent way to tour this lonely chain of distinct peaks. Starting from the Sharkstooth Trailhead, a hike up to Sharkstooth Pass and back may satisfy your mountain cravings. From the start you’ll see the remarkable alternating red and white stripes of 13,232’ Hesperus Mountain, one of the four sacred Navajo mountains.',13232,'https://static.rootsrated.com/image/upload/s--xjTxFLJt--/t_rr_large_natural/lfm1nbxpagxgki4jogyt.jpg',3,4,NULL),(35,'Rattlesnake Arches','The Colorado Plateau in Mesa County is home to McInnis Canyons, an area many Coloradans have no idea exists. This spectacular desert playground has the second highest concentration of natural sandstone arches in the world. There is a lot of open terrain to explore, but a tour on the Rattlesnake Arches Trail is the best way to take it all in. The arches here resemble prehistoric fossils, pockmarked and elegantly curved.',12840,'https://static.rootsrated.com/image/upload/s--Aj69fL7q--/t_rr_large_natural/j5sfnjha5tnp8qqvn23u.jpg',3,7,NULL),(36,'James Peak','The appeal of the mountain isn’t just its proximity to the Denver metro area—its standard route also ascends one of Colorado’s last remaining glaciers, the St. Marys Glacier. The glacier is safe for foot travel, as it lacks deep crevasses. A tiny ski area once operated year-round on the glacier from 1930-1986, and the remains of the ski lift can be seen on the way up to the trailhead parking. ',13301,'https://static.rootsrated.com/image/upload/s--LwS4p4RV--/t_rr_large_natural/gacwm6ckoe4xlu7vuaaj.jpg',3,8,NULL),(37,'Devils Thumb Lake','Devils Thumb Lake is located in Indian Peaks Wilderness north of Boulder Colorado and can be accessed via a 6.5-mile (one-way) steep and challenging hike. Wildflowers, alpine meadows, small waterfalls, and cascades all beckon those who have the stamina to explore these heights in the Front Range near Denver.\n',11042,'https://dayhikesneardenver.com/wp-content/uploads/2018/08/devils-thumb-lake-bosley-cc.jpg',4,13,NULL),(38,'Lost Lake Hike Near Nederland','Lost Lake is a hike to a beautiful alpine lake surrounded by the mountains of Indian Peaks. Just over one hour northwest of Denver, the trail up to lost lake takes you along the course of Middle Boulder creek, a slide waterfall, a set of tumbling cascades, and a variety of wildflowers that decorate the borders of the trail, the creeksides, and the small meadows that open up along the trail. In the winter months, the trail up to Lost Lake makes for a good snowshoeing route and cross-country trail.',8642,'https://dayhikesneardenver.com/wp-content/uploads/2017/09/lost-lake-near-nederland-cc-bfagan.jpg',3,4,NULL),(39,'Chief Mountain ','Chief Mountain is a 1.5-mile hike in the mountains just one hour outside of Denver, Colorado. The Chief Mountain trail travels through alpine forest, then breaks out into high-country tundra, eventually gaining panoramic views of surrounding mountains. Chief Mountain gives hikers an incredible vantage point to survey the changing colors of Fall spread out in 360 degrees below.',10800,'https://dayhikesneardenver.com/wp-content/uploads/2018/08/chief-mountain-colorado-near-peak-rlee-cc.jpg',3,3,NULL),(40,'Booth Creek Falls','Booth Creek Falls is a 60-foot waterfall located in the Eagles Nest Wilderness near Vail, Colorado. The journey to the waterfall requires a strenuous, 2-mile hike along the banks of Booth Creek.',8460,'https://dayhikesneardenver.com/wp-content/uploads/2017/03/00-booth-falls-near-vail-header.jpg',3,4,NULL),(41,'Shanahan Ridge','The Shanahan Ridge Loop Hike is an easy, 4-mile lollipop-loop trail with stunning views of the Shanahan Ridge of the Flatirons in Boulder, Colorado.',6500,'https://dayhikesneardenver.com/wp-content/uploads/2017/04/00-shanahan-ridge-loop-trail-near-boulder-header.jpg',1,4,NULL),(42,'Tarryall Falls','The Tarryall Falls Trail is a short hike across a small canyon to a waterfall that pours into Tarryall Creek. The slopes of snow-capped peaks along Boreas pass make for a majestic backdrop against the contrasting sage grasslands of surrounding South Park.Tarryall Falls.',8900,'https://dayhikesneardenver.com/wp-content/uploads/2017/03/00-tarryall-falls-near-jefferson-header.jpg',1,0.5,NULL),(43,'Ridgeline Open Space','Ridgeline Open Space is nestled in the Meadows residential area of Castle Rock. This network of over 13 miles of trails winds through elevated grasslands and gamble oak with a backdrop of distant snow-capped peaks of the Front Range. Hike it or bike it for a quick escape from the work week.',6600,'https://dayhikesneardenver.com/wp-content/uploads/2017/11/ridgeline-open-space-castle-rock-00-header.jpg',1,1,NULL),(44,'St. Vrain Mountain','The St. Vrain Mountain trail is just a 3-mile hike into Indian Peaks Wilderness to stunning views of the rocky peaks of Wild Basin. Hike up and additional 1.5 miles from the RMNP boundary to the summit of St. Vrain mountain for 360-degree panoramic views of a wildflower-laden wilderness.',8800,'https://dayhikesneardenver.com/wp-content/uploads/2018/05/stvraintrail-looking-into-wild-basion-header2.jpg',4,9,NULL),(45,'Butler Gulch','The Butler Gulch Trail near Berthoud Falls is a moderately difficult out-and-back trail with a balance of shade on the first half and then above treeline with spectacular views of peaks and wildflowers all around. Activities here include stream crossings and steep climbs, and one can visit an old mine above the treeline. This is also a great snowshoeing hike during winter and is a well-known skiing destination.',10400,'https://dayhikesneardenver.com/wp-content/uploads/2017/03/00-butler-gulch-berthoud-falls-header.jpg',3,5,NULL),(46,'Bear Canyon Loop','The Bear Canyon Loop Hike near Boulder, Colorado is a beautiful trail that spans wide open spaces and meadows near National Center for Atmospheric Research. The Bear Canyon Loop is a relatively easy 3.3-mile loop that features some of the best views of the Flatirons in Boulder.',6080,'https://dayhikesneardenver.com/wp-content/uploads/2017/04/00-ncar-bear-canyon-loop-trail-near-boulder-header.jpg',1,3.5,NULL),(47,'Garden of the Gods','Garden of the Gods is argueabley the best place to hike in Colorado Springs. Designated a National Natural Landmark, the park is known for its towering red sandstone formations and panoramic views of Pikes Peak. Garden of the Gods features 6 different hiking trail options, spanning from easy to moderate and 1/2 mile to 2.5 mile hikes.\nGarden of the Gods is argueabley the best place to hike in Colorado Springs. Designated a National Natural Landmark, the park is known for its towering red sandstone formations and panoramic views of Pikes Peak. Garden of the Gods features 6 different hiking trail options, spanning from easy to moderate and 1/2 mile to 2.5 mile hikes.\n',6200,'https://dayhikesneardenver.com/wp-content/uploads/2018/05/garden-of-the-gods-with-foothills-header.jpg',2,3,NULL),(48,'Long Lake Loop','Long Lake offers an easy 1.5 mile loop hike in Indian Peaks Wilderness. Located about 1 hour West of Boulder, Colorado, Long Lake is an easy-to-access alpine lake with stunning scenery. It’s a popular spot, especially in the Summer months.',10500,'https://dayhikesneardenver.com/wp-content/uploads/2017/06/long-lake-indian-peaks-cc-bombaci-01.jpg',1,1.5,NULL),(49,'Sky Pond','Sky Pond is in a deep valley carved by Taylor Glacier and capped by Taylor and Powell Peak.',11014,'https://cdn-files.apstatic.com/hike/7000658_medium_1421342187.jpg',4,8.3,8),(50,'Bear Peak','A must-do hike for Boulder locals and visitors alike!',8396,'https://cdn-files.apstatic.com/hike/7005382_medium_1435421346.jpg',4,5.7,9),(51,'Walker Ranch','An awesome and challenging hike near Boulder with great scenery.',7335,'https://cdn-files.apstatic.com/hike/7039625_medium_1509471374.jpg',4,7.6,10),(52,'Royal Arch','A classic Boulder hike to a natural arch with great views.',6917,'https://cdn-files.apstatic.com/hike/7003311_medium_1430066482.jpg',4,3.3,11),(53,'Monarch Lake to Crater Lake','Gorgeous scenery with waterfalls and wildflowers ending at a breathtaking cirque and glacier lake.',10343,'https://cdn-files.apstatic.com/hike/7002724_medium_1429034967.jpg',3,14.9,12),(54,'Sunshine Lion\'s Lair Loop','Great Mount Sanitas views are the reward for this gentler loop in Sunshine Canyon.',6802,'https://cdn-files.apstatic.com/hike/7004292_medium_1431704842.jpg',3,5.3,13),(55,'Mount Sanitas Loop','Very popular and scenic loop right from the edge of town.',6780,'https://cdn-files.apstatic.com/hike/7004292_medium_1431704842.jpg',4,3.2,14),(56,'Ouzel Falls & Back','Three waterfalls, one mountain creek, and 5.5 miles of alpine bliss.',9376,'https://cdn-files.apstatic.com/hike/7000669_medium_1421344155.jpg',3,5.4,15),(57,'Longs Peak - Keyhole Route','A beautiful and rewarding route to the summit of an iconic Colorado peak.',14214,'https://cdn-files.apstatic.com/hike/7037747_medium_1506469648.jpg',5,14.2,16),(58,'Boulder Skyline Traverse','The classic long mountain route in Boulder.',8522,'https://cdn-files.apstatic.com/hike/7003740_medium_1430703555.jpg',5,16.3,17);
/*!40000 ALTER TABLE `trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'johnWick@gmail.com','myDoggo',1),(2,'test@user.com','testuser',1),(3,'captAmerica@usa.org','1234',1),(4,'anotherTest@gmail.com','1111',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-02 12:24:35
