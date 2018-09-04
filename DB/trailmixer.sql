-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema trailmixer
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `trailmixer` ;

-- -----------------------------------------------------
-- Schema trailmixer
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trailmixer` DEFAULT CHARACTER SET utf8 ;
USE `trailmixer` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `active` TINYINT(1) NULL DEFAULT 1,
  `admin` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL,
  `street2` VARCHAR(45) NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `latitude` VARCHAR(50) NULL,
  `longitude` DOUBLE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profile` ;

CREATE TABLE IF NOT EXISTS `profile` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `address_id` INT NOT NULL,
  `img_url` BLOB NULL,
  `bio` VARCHAR(500) NULL,
  `gender` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_profile_idx` (`user_id` ASC),
  INDEX `fk_profile_address_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_profile`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `area` ;

CREATE TABLE IF NOT EXISTS `area` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `difficulty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `difficulty` ;

CREATE TABLE IF NOT EXISTS `difficulty` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `preference`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `preference` ;

CREATE TABLE IF NOT EXISTS `preference` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `difficulty_id` INT NULL,
  `trail_distance` INT NULL,
  `area_id` INT NULL,
  `altitude` INT NULL,
  `profile_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_profile_preference_idx` (`profile_id` ASC),
  INDEX `fk_area_preference_idx` (`area_id` ASC),
  INDEX `fk_preference_difficulty_idx` (`difficulty_id` ASC),
  CONSTRAINT `fk_profile_preference`
    FOREIGN KEY (`profile_id`)
    REFERENCES `profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_area_preference`
    FOREIGN KEY (`area_id`)
    REFERENCES `area` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_preference_difficulty`
    FOREIGN KEY (`difficulty_id`)
    REFERENCES `difficulty` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trail` ;

CREATE TABLE IF NOT EXISTS `trail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(1000) NULL,
  `altitude` INT NULL,
  `img_url` BLOB NULL,
  `difficulty_id` INT NOT NULL,
  `distance` DOUBLE NULL,
  `address_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trail_address_idx` (`address_id` ASC),
  INDEX `fk_trail_difficulty_idx` (`difficulty_id` ASC),
  CONSTRAINT `fk_trail_address`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trail_difficulty`
    FOREIGN KEY (`difficulty_id`)
    REFERENCES `difficulty` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profile_trail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profile_trail` ;

CREATE TABLE IF NOT EXISTS `profile_trail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `profile_id` INT NOT NULL,
  `trail_id` INT NOT NULL,
  `rating` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_profile_profile_trail_idx` (`profile_id` ASC),
  INDEX `fk_trail_profile_trail_idx` (`trail_id` ASC),
  CONSTRAINT `fk_profile_profile_trail`
    FOREIGN KEY (`profile_id`)
    REFERENCES `profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trail_profile_trail`
    FOREIGN KEY (`trail_id`)
    REFERENCES `trail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reason`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reason` ;

CREATE TABLE IF NOT EXISTS `reason` (
  `id` INT NOT NULL,
  `name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `profile_reason`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `profile_reason` ;

CREATE TABLE IF NOT EXISTS `profile_reason` (
  `profile_id` INT NOT NULL,
  `reason_id` INT NOT NULL,
  INDEX `fk_reason_profile_reason_idx` (`reason_id` ASC),
  INDEX `fk_profile_profile_reason_idx` (`profile_id` ASC),
  CONSTRAINT `fk_reason_profile_reason`
    FOREIGN KEY (`reason_id`)
    REFERENCES `reason` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_profile_reason`
    FOREIGN KEY (`profile_id`)
    REFERENCES `profile` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS trailuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'trailuser'@'localhost' IDENTIFIED BY 'trailuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'trailuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `trailmixer`;
INSERT INTO `user` (`id`, `username`, `password`, `active`, `admin`) VALUES (1, 'johnWick@gmail.com', 'myDoggo', 1, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `admin`) VALUES (2, 'test@user.com', 'testuser', 1, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `admin`) VALUES (3, 'captAmerica@usa.org', '1234', 1, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `admin`) VALUES (4, 'anotherTest@gmail.com', '1111', 0, 0);
INSERT INTO `user` (`id`, `username`, `password`, `active`, `admin`) VALUES (5, 'admin@admin.com', 'admin', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `trailmixer`;
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `latitude`, `longitude`) VALUES (1, '123 Main St', NULL, 'Denver', 'Colorado', NULL, NULL);
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `latitude`, `longitude`) VALUES (2, '1122 Main St', NULL, 'Denver', 'Colorado', NULL, NULL);
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `latitude`, `longitude`) VALUES (3, '12345 Main St', NULL, 'Denver', 'Colorado', NULL, NULL);
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `latitude`, `longitude`) VALUES (4, '123 Test Trail', NULL, 'Denver', 'Colorado', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `profile`
-- -----------------------------------------------------
START TRANSACTION;
USE `trailmixer`;
INSERT INTO `profile` (`id`, `user_id`, `first_name`, `last_name`, `age`, `address_id`, `img_url`, `bio`, `gender`) VALUES (1, 1, 'John', 'Wick', 34, 1, 0x68747470733A2F2F736B696C6C64697374696C6C6572792E636F6D2F77702D636F6E74656E742F75706C6F6164732F323031372F30312F416E64794350696353445745422D323530783235302E6A7067, 'I enjoy spending time with my dog.', 'Male');
INSERT INTO `profile` (`id`, `user_id`, `first_name`, `last_name`, `age`, `address_id`, `img_url`, `bio`, `gender`) VALUES (2, 2, 'test', 'user', 23, 2, 0x68747470733A2F2F696D6167657376632E74696D65696E636170702E636F6D2F76332F6D6D2F696D6167653F75726C3D68747470732533412532462532466577656469742E66696C65732E776F726470726573732E636F6D2532463230313525324630312532466F66666963652D73706163655F3332302E6A70672533467725334433323026773D37303026713D3835, NULL, 'Male');
INSERT INTO `profile` (`id`, `user_id`, `first_name`, `last_name`, `age`, `address_id`, `img_url`, `bio`, `gender`) VALUES (3, 3, 'Steve', 'Rogers', 143, 3, 0x687474703A2F2F63646E322D7777772E6D616E6461746F72792E636F6D2F6173736574732F75706C6F6164732F323031342F30332F4361707461696E2D416D65726963612D5468652D57696E7465722D536F6C646965722E6A7067, NULL, 'Male');
INSERT INTO `profile` (`id`, `user_id`, `first_name`, `last_name`, `age`, `address_id`, `img_url`, `bio`, `gender`) VALUES (4, 4, 'another', 'test', 22, 2, NULL, NULL, 'Female');
INSERT INTO `profile` (`id`, `user_id`, `first_name`, `last_name`, `age`, `address_id`, `img_url`, `bio`, `gender`) VALUES (5, 5, 'admin', 'user', 30, 1, NULL, NULL, 'Female');

COMMIT;


-- -----------------------------------------------------
-- Data for table `area`
-- -----------------------------------------------------
START TRANSACTION;
USE `trailmixer`;
INSERT INTO `area` (`id`, `city`, `state`) VALUES (1, 'Denver', 'Colorado');

COMMIT;


-- -----------------------------------------------------
-- Data for table `difficulty`
-- -----------------------------------------------------
START TRANSACTION;
USE `trailmixer`;
INSERT INTO `difficulty` (`id`, `name`) VALUES (1, 'Beginner');
INSERT INTO `difficulty` (`id`, `name`) VALUES (2, 'Easy');
INSERT INTO `difficulty` (`id`, `name`) VALUES (3, 'Moderate');
INSERT INTO `difficulty` (`id`, `name`) VALUES (4, 'Hard');
INSERT INTO `difficulty` (`id`, `name`) VALUES (5, 'Expert');

COMMIT;


-- -----------------------------------------------------
-- Data for table `preference`
-- -----------------------------------------------------
START TRANSACTION;
USE `trailmixer`;
INSERT INTO `preference` (`id`, `difficulty_id`, `trail_distance`, `area_id`, `altitude`, `profile_id`) VALUES (1, 2, 8, 1, 10000, 1);
INSERT INTO `preference` (`id`, `difficulty_id`, `trail_distance`, `area_id`, `altitude`, `profile_id`) VALUES (2, 5, 20, 1, 15000, 2);
INSERT INTO `preference` (`id`, `difficulty_id`, `trail_distance`, `area_id`, `altitude`, `profile_id`) VALUES (3, 5, 50, 1, 20000, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trail`
-- -----------------------------------------------------
START TRANSACTION;
USE `trailmixer`;
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (1, 'test trail', 'testing', 5000, NULL, 3, 23, 4);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Washington Park Loop', 'Washington Park Loop is a 2.3 mile heavily trafficked loop trail located near Denver, Colorado that features a lake and is good for all skill levels. The trail offers a number of activity options and is best used from April until October. Dogs are also able to use this trail but must be kept on leash.', 5600, NULL, 1, 2.3, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Sloan Lake Park', 'Sloan Lake Park is a 2.6 mile loop trail located near Denver, Colorado and is good for all skill levels. The trail offers a number of activity options and is accessible year-round. Dogs are also able to use this trail but must be kept on leash.', 5321, NULL, 1, 2.6, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Highline Canal Trail', 'Highline Canal Trail is a 16.5 mile out and back trail located near Englewood, Colorado that features a lake and is rated as moderate. The trail is primarily used for hiking, trail running, and mountain biking and is accessible year-round. Dogs are also able to use this trail.', 5511, NULL, 2, 16.5, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Beaver Brook and Chavez Trail Loop', 'Beaver Brook and Chavez Trail Loop is a 5.1 mile heavily trafficked loop trail located near Golden, Colorado that features a river and is rated as moderate. The trail offers a number of activity options and is best used from March until November. Dogs are also able to use this trail but must be kept on leash.', 7755, NULL, 3, 5.1, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Bear Creek Trail to Sister City Park', 'Bear Creek Trail to Sister City Park is a 4.7 mile moderately trafficked out and back trail located near Lakewood, Colorado that features beautiful wild flowers and is rated as moderate. The trail offers a number of activity options and is best used from May until October.', 9520, NULL, 3, 4.7, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Maxwell Falls Lower Trail', 'Maxwell Falls Lower Trail is a 4.2 mile heavily trafficked loop trail located near Evergreen, Colorado that features a waterfall and is rated as moderate. The trail offers a number of activity options and is best used from March until October. Dogs are also able to use this trail but must be kept on leash.', 8484, NULL, 2, 4.2, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Red Rocks Trail', 'Red Rocks Trail is a 5.8 mile moderately trafficked out and back trail located near Morrison, Colorado that offers scenic views and is rated as moderate. The trail offers a number of activity options and is accessible year-round. Dogs and horses are also able to use this trail.', 6280, NULL, 2, 5.8, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Mount Morrison South Ridge Trail', 'Mount Morrison South Ridge Trail is a 3.2 mile lightly trafficked out and back trail located near Morrison, Colorado that features beautiful wild flowers and is rated as difficult. The trail offers a number of activity options and is accessible year-round. Dogs are also able to use this trail.', 7893, NULL, 4, 3.2, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Beaver Brook Trail', 'Beaver Brook Trail is a 11.1 mile moderately trafficked loop trail located near Golden, Colorado that features a lake and is rated as difficult. The trail offers a number of activity options and is best used from May until November. Dogs are also able to use this trail but must be kept on leash.', 7788, NULL, 4, 11.1, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Emerald Lake Trail', 'Emerald Lake Trail is a 3.1 mile heavily trafficked out and back trail located near Estes Park, Colorado that features a lake and is rated as moderate. The trail offers a number of activity options and is best used from April until November.', 10110, NULL, 3, 3.1, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Mallory Cave', 'Mallory Cave is a 2.4 mile moderately trafficked out and back trail located near Boulder, Colorado that features beautiful wild flowers and is rated as moderate. The trail offers a number of activity options and is best used from March until October. Dogs are also able to use this trail but must be kept on leash.', 68256, NULL, 2, 2.4, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Mount Falcon Park Upper Loop', 'Mount Falcon Park Upper Loop is a 3.9 mile moderately trafficked loop trail located near Morrison, Colorado that features beautiful wild flowers and is rated as moderate. The trail offers a number of activity options and is best used from May until November. Dogs are also able to use this trail but must be kept on leash.', 7838, NULL, 3, 3.9, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Parmalee Trail Loop', 'Parmalee Trail Loop is a 3 mile heavily trafficked loop trail located near Morrison, Colorado and is rated as moderate. The trail offers a number of activity options and is best used from May until October. Dogs are also able to use this trail but must be kept on leash.', 7799, NULL, 2, 3.0, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Rattlesnake Gulch Trail', 'Rattlesnake Gulch Trail is a 3.4 mile moderately trafficked loop trail located near Eldorado Springs, Colorado that features beautiful wild flowers and is rated as moderate. The trail offers a number of activity options and is best used from May until November. Dogs are also able to use this trail but must be kept on leash.', 6727, NULL, 3, 3.4, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Green Mountain West Trail', 'Green Mountain West Trail is a 2.5 mile moderately trafficked out and back trail located near Boulder, Colorado that features beautiful wild flowers and is rated as moderate. The trail offers a number of activity options and is best used from April until October. Dogs are also able to use this trail.', 7927, NULL, 2, 2.5, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Longs Peak - Keyhole Route', 'the 13th highest mountain in the state and one of the most visited peaks with a notoriously elusive summit. The trail is well-marked and can be crowded on summer weekends, but Longs nevertheless delivers on the promise of incredible views and worthy terrain.', 14255, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D334B5773376E71562D2D2F745F72725F6C617267655F6E61747572616C2F6D707473736C6A6272336E6167703434716534622E6A7067, 5, 15, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Mount Bierstadt', 'A great starter mountain for those hoping to hike all of Colorado’s 58 14,000’ summits. The typical descent back to Guanella Pass involves bushwhacking through moose-infested swampland, where 7-foot tall willows create a natural garden maze.', 14060, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D7347654D5861426D2D2D2F745F72725F6C617267655F6E61747572616C2F707A737467626C3731646B6A6C6B6D74796279692E6A7067, 3, 6, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Lizard Head Peak', 'Lizard Head Peak is one of the toughest 13,000’ mountains in Colorado to summit, thanks to the chossy, loose, 400’ vertical tower that requires 5.8-graded climbing on poor rock to reach its highest point. Standing at the base of the crumbling tower (an extinct volcanic pipe) makes the fact that it was originally climbed in 1920 even more impressive.', 13000, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D56724C71776D30472D2D2F745F72725F6C617267655F6E61747572616C2F6F7A75656967796163706479657A6364727962342E6A7067, 3, 7, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Black Canyon of the Gunnison', 'Black Canyon of the Gunnison flips the script by bringing you down rather than up. The “trails” are more like suggested scrambles rather than fully developed hiking paths. Rivers flow deep along the canyon floor, a shadowy place where the towering walls feel like the entrance to the netherworld. Wandering the canyon base is so unique for Colorado, it deserves a visit for adventurous hikers who aren’t afraid to get a little dirty on the way down.', 3000, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D56724C71776D30472D2D2F745F72725F6C617267655F6E61747572616C2F6F7A75656967796163706479657A6364727962342E6A7067, 4, 1, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Bison Peak', 'The gradual hike up to treeline tends to go quickly, and it can get hot and dry in the summer—bring extra water! Cresting treeline opens up views of the wobbly, blocky, stone towers, some of which are over 150’ tall and seemingly transported from the Moab desert. Thankfully, the summit is a half-mile hike off the main trail across grassy meadows with a few easy hills or rock scrambles to the top. ', 12431, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D4E7A494C5A346D782D2D2F745F72725F6C617267655F6E61747572616C2F75707A626865757265613678676373746E726F6C2E6A7067, 2, 11, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Star Dune at Great Sand Dunes National Park', 'In the early spring when the rivers run through the fine sand basin, the landscape transforms into a living, breathing desert in a compact package. Above the dunes stand the Sangre de Cristo Peaks, many towering over 13,000’. Wandering among the dunes can be as long or as short as you like it to be—consider it your own personal sandbox.', 13000, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D6F36416A585943632D2D2F745F72725F6C617267655F6E61747572616C2F64676276646D626469746D77346B786F73656C632E6A7067, 1, 4, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Lion Lakes at Rocky Mountain National Park', 'Accessed by the less-crowded Wild Basin Trailhead, this trail is mostly on the shared Thunder Lake Trail before eventually splitting off into one of Colorado’s most exquisite backcountry basins. Though the trail eventually fades out, navigation is relatively easy: follow the lakes, streams, and waterfalls up to the next tier. Wildflowers abound and the pristine meadows have all the natural charm of Rocky Mountain National Park’s best settings—minus the crowds. Don’t let the high mileage fool you, most of the trail is flat and easy to cruise.', 13579, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D6C386249347254512D2D2F745F72725F6C617267655F6E61747572616C2F716E6A7175733273326371326F623767316D66762E6A7067, 3, 12, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Pyramid Peak', 'With good route finding, however, the standard route will stay at a tricky but solid Class 3. Most hikers start in the blackness of early morning (3 am is a reasonable start time), chugging up a steep headwall to an exciting scramble to the top (roughly a mile). Mountain goats are regular spectators, and the rock is solid for Elk Range terrain, especially in contrast to the neighboring Maroon Bells.', 14018, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D6C32654F435072482D2D2F745F72725F6C617267655F6E61747572616C2F616361317679626F68726D6961796263677370632E6A7067, 5, 8.2, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Boulder’s Guardians of the Flatirons', 'The trio of peaks that stand over Boulder’s iconic Flatirons make for an excellent day hike, which can be done as a loop or a point to point (approximately 12 or 10 miles respectively). Hikers can start at several different trailheads, all within the civilized confines of the city of Boulder. A popular route starts at Gregory Canyon Trailhead near Chautauqua and begins by ascending 3.2 miles to 8,150’ Green Mountain.', 8150, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D446377427230306B2D2D2F745F72725F6C617267655F6E61747572616C2F70726168776674766E353369317667776C7032742E6A7067, 3, 10, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'San Luis Peak', 'San Luis Peak is a nice, long day hike (13.5 miles from the Stewart Creek Trailhead) through one of Colorado’s most vibrant basins. The gradually ascending trail is mellow, Class 1 terrain that starts in a piney forest, passes ponds and pools, and eventually opens up to large meadows with trickling streams, dense beds of colorful flowers, and wide-open views. It’s rarely crowded, despite being one of the 14ers, and the rocky trail at the top is welcoming and easy to follow.', 14014, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D4430526E646C694C2D2D2F745F72725F6C617267655F6E61747572616C2F7571646C75776C6E7A667A39636233786E3566612E6A7067, 3, 13.5, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Lost Man Lake', 'This hike is roughly 7 miles out-and-back and follows the Lost Man Loop Trail through a rocky, rugged basin. The chunky glacial rock debris is offset by serene lakes on the south side of Lost Man Pass, most notably Independence Lake. Keep hiking up Lost Man Pass up to 12,850’, where the dark, inky waters of Lost Man Lake reveal themselves on the north side. It’s a great place to have a mountain picnic or a chilly dip.', 12850, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D4D394E30634A777A2D2D2F745F72725F6C617267655F6E61747572616C2F71646D6A6E6E6A7863717475646B6B62627375752E6A7067, 3, 7, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Mount Elbert', 'This 9 mile out-and-back follows a solid trail from forest to treeline, where hikers get acquainted with the thin air and the possible heartbreak of a pair of false summits. Fear not, the actual summit is not far past the second false summit, and the wide, flat apex has a collection of wide shelters. There is very little exposure along the way, though the views of the town of Leadville and the Sawatch Range are mighty impressive. ', 14420, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D6B4F4F54385276392D2D2F745F72725F6C617267655F6E61747572616C2F797870316576786165343463687970656E7A67632E6A7067, 3, 9, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Mica Basin', 'The Zirkel Wilderness is one of the lushest mountain regions in Colorado thanks to its northern location and relatively low elevation. The same storms that keep the rivers flowing provide the ski area’s legendary winter powder. As a result, the area is rich with flowers, flora, and colorful grasses and willows. Mica Lake is a small, greenish blue pool that is a favorite with canines.', 12057, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D6365386F705F76302D2D2F745F72725F6C617267655F6E61747572616C2F7277396A347A6B636433696B656D6D78776E70702E6A7067, 2, 7.6, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Argentine Pass', 'Argentine Pass connects two basins, one accessed from Guanella Pass near Georgetown and a second accessed from Montezuma near Keystone Resort. Both access points require a little 4x4 action to reach. The eastern approach from Guanella has a parking area at the mining ghost town of Waldorf, where a battered building that once housed the post office still stands. ', 13207, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D315655645F5065432D2D2F745F72725F6C617267655F6E61747572616C2F746479666B6A7A31756263716E6337726F7931352E6A7067, 2, 5, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Peak 6 via the Colorado Trail', 'This beautiful section of the Colorado Trail ascends through a shady forest before emerging from treeline in roughly 3 miles to open meadows and stellar views of Copper Mountain to the west and the town of Breckenridge to the east. It is easy to get off trail and walk along the gently rounded hills to gain the ridge between Peaks 6 and 5 and take in the views.', 12840, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D4A424B566D5A626F2D2D2F745F72725F6C617267655F6E61747572616C2F6763346B64736C6164746E6A62626833797331612E6A7067, 2, 7, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'The Devil’s Causeway', 'The Devil’s Causeway sits in the Flattop Wilderness, an isolated patch of mountains that are accessed from the town of Yampa between I-70 and Steamboat Springs. The hike itself is a nice, 6 mile round trip starting from the East Fork Trail. The namesake feature is a non-technical but heady 50-foot stretch of rock that narrows to 3 feet wide and has drops of 60-80 feet off either side.', 10280, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D5F70422D595778732D2D2F745F72725F6C617267655F6E61747572616C2F6F70786E693338306C63776D6C73756F6431686D2E6A7067, 4, 6, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Ice Lakes Basin', 'Ice Lakes Basin offers a snapshot of what makes the San Juan range so special. This 7-mile round trip follows a steep but steady trail through the forest to a series of shimmering, blue alpine lakes, including Island Lake. Creeks cascade through the green valleys and roll over rounded rock walls, painting them a mixture of green, black, and grey. ', 13780, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D4E717773717843522D2D2F745F72725F6C617267655F6E61747572616C2F6D6D6D716C6662336A74696468736F6366626F6C2E6A7067, 3, 7, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Sharkstooth Trail', 'The La Plata Mountains can be found in southern Colorado. The Sharkstooth Trail is an excellent way to tour this lonely chain of distinct peaks. Starting from the Sharkstooth Trailhead, a hike up to Sharkstooth Pass and back may satisfy your mountain cravings. From the start you’ll see the remarkable alternating red and white stripes of 13,232’ Hesperus Mountain, one of the four sacred Navajo mountains.', 13232, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D786A5478464C4A742D2D2F745F72725F6C617267655F6E61747572616C2F6C666D316E627870616778676B69346A6F6779742E6A7067, 3, 4, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Rattlesnake Arches', 'The Colorado Plateau in Mesa County is home to McInnis Canyons, an area many Coloradans have no idea exists. This spectacular desert playground has the second highest concentration of natural sandstone arches in the world. There is a lot of open terrain to explore, but a tour on the Rattlesnake Arches Trail is the best way to take it all in. The arches here resemble prehistoric fossils, pockmarked and elegantly curved.', 12840, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D416A3639664C37712D2D2F745F72725F6C617267655F6E61747572616C2F6A3573666E6A686135746E70387171766E3233752E6A7067, 3, 7, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'James Peak', 'The appeal of the mountain isn’t just its proximity to the Denver metro area—its standard route also ascends one of Colorado’s last remaining glaciers, the St. Marys Glacier. The glacier is safe for foot travel, as it lacks deep crevasses. A tiny ski area once operated year-round on the glacier from 1930-1986, and the remains of the ski lift can be seen on the way up to the trailhead parking. ', 13301, 0x68747470733A2F2F7374617469632E726F6F747372617465642E636F6D2F696D6167652F75706C6F61642F732D2D4C775334703452562D2D2F745F72725F6C617267655F6E61747572616C2F676163776D36636B6F6534786C7537767561616A2E6A7067, 3, 8, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Devils Thumb Lake', 'Devils Thumb Lake is located in Indian Peaks Wilderness north of Boulder Colorado and can be accessed via a 6.5-mile (one-way) steep and challenging hike. Wildflowers, alpine meadows, small waterfalls, and cascades all beckon those who have the stamina to explore these heights in the Front Range near Denver.\n', 11042, 0x68747470733A2F2F64617968696B65736E65617264656E7665722E636F6D2F77702D636F6E74656E742F75706C6F6164732F323031382F30382F646576696C732D7468756D622D6C616B652D626F736C65792D63632E6A7067, 4, 13, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Lost Lake Hike Near Nederland', 'Lost Lake is a hike to a beautiful alpine lake surrounded by the mountains of Indian Peaks. Just over one hour northwest of Denver, the trail up to lost lake takes you along the course of Middle Boulder creek, a slide waterfall, a set of tumbling cascades, and a variety of wildflowers that decorate the borders of the trail, the creeksides, and the small meadows that open up along the trail. In the winter months, the trail up to Lost Lake makes for a good snowshoeing route and cross-country trail.', 8642, 0x68747470733A2F2F64617968696B65736E65617264656E7665722E636F6D2F77702D636F6E74656E742F75706C6F6164732F323031372F30392F6C6F73742D6C616B652D6E6561722D6E656465726C616E642D63632D62666167616E2E6A7067, 3, 4, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Chief Mountain ', 'Chief Mountain is a 1.5-mile hike in the mountains just one hour outside of Denver, Colorado. The Chief Mountain trail travels through alpine forest, then breaks out into high-country tundra, eventually gaining panoramic views of surrounding mountains. Chief Mountain gives hikers an incredible vantage point to survey the changing colors of Fall spread out in 360 degrees below.', 10800, 0x68747470733A2F2F64617968696B65736E65617264656E7665722E636F6D2F77702D636F6E74656E742F75706C6F6164732F323031382F30382F63686965662D6D6F756E7461696E2D636F6C6F7261646F2D6E6561722D7065616B2D726C65652D63632E6A7067, 3, 3, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Booth Creek Falls', 'Booth Creek Falls is a 60-foot waterfall located in the Eagles Nest Wilderness near Vail, Colorado. The journey to the waterfall requires a strenuous, 2-mile hike along the banks of Booth Creek.', 8460, 0x68747470733A2F2F64617968696B65736E65617264656E7665722E636F6D2F77702D636F6E74656E742F75706C6F6164732F323031372F30332F30302D626F6F74682D66616C6C732D6E6561722D7661696C2D6865616465722E6A7067, 3, 4, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Shanahan Ridge', 'The Shanahan Ridge Loop Hike is an easy, 4-mile lollipop-loop trail with stunning views of the Shanahan Ridge of the Flatirons in Boulder, Colorado.', 6500, 0x68747470733A2F2F64617968696B65736E65617264656E7665722E636F6D2F77702D636F6E74656E742F75706C6F6164732F323031372F30342F30302D7368616E6168616E2D72696467652D6C6F6F702D747261696C2D6E6561722D626F756C6465722D6865616465722E6A7067, 1, 4, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Tarryall Falls', 'The Tarryall Falls Trail is a short hike across a small canyon to a waterfall that pours into Tarryall Creek. The slopes of snow-capped peaks along Boreas pass make for a majestic backdrop against the contrasting sage grasslands of surrounding South Park.Tarryall Falls.', 8900, 0x68747470733A2F2F64617968696B65736E65617264656E7665722E636F6D2F77702D636F6E74656E742F75706C6F6164732F323031372F30332F30302D7461727279616C6C2D66616C6C732D6E6561722D6A6566666572736F6E2D6865616465722E6A7067, 1, .5, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Ridgeline Open Space', 'Ridgeline Open Space is nestled in the Meadows residential area of Castle Rock. This network of over 13 miles of trails winds through elevated grasslands and gamble oak with a backdrop of distant snow-capped peaks of the Front Range. Hike it or bike it for a quick escape from the work week.', 6600, 0x68747470733A2F2F64617968696B65736E65617264656E7665722E636F6D2F77702D636F6E74656E742F75706C6F6164732F323031372F31312F72696467656C696E652D6F70656E2D73706163652D636173746C652D726F636B2D30302D6865616465722E6A7067, 1, 1, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'St. Vrain Mountain', 'The St. Vrain Mountain trail is just a 3-mile hike into Indian Peaks Wilderness to stunning views of the rocky peaks of Wild Basin. Hike up and additional 1.5 miles from the RMNP boundary to the summit of St. Vrain mountain for 360-degree panoramic views of a wildflower-laden wilderness.', 8800, 0x68747470733A2F2F64617968696B65736E65617264656E7665722E636F6D2F77702D636F6E74656E742F75706C6F6164732F323031382F30352F7374767261696E747261696C2D6C6F6F6B696E672D696E746F2D77696C642D626173696F6E2D686561646572322E6A7067, 4, 9, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Butler Gulch', 'The Butler Gulch Trail near Berthoud Falls is a moderately difficult out-and-back trail with a balance of shade on the first half and then above treeline with spectacular views of peaks and wildflowers all around. Activities here include stream crossings and steep climbs, and one can visit an old mine above the treeline. This is also a great snowshoeing hike during winter and is a well-known skiing destination.', 10400, 0x68747470733A2F2F64617968696B65736E65617264656E7665722E636F6D2F77702D636F6E74656E742F75706C6F6164732F323031372F30332F30302D6275746C65722D67756C63682D62657274686F75642D66616C6C732D6865616465722E6A7067, 3, 5, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Bear Canyon Loop', 'The Bear Canyon Loop Hike near Boulder, Colorado is a beautiful trail that spans wide open spaces and meadows near National Center for Atmospheric Research. The Bear Canyon Loop is a relatively easy 3.3-mile loop that features some of the best views of the Flatirons in Boulder.', 6080, 0x68747470733A2F2F64617968696B65736E65617264656E7665722E636F6D2F77702D636F6E74656E742F75706C6F6164732F323031372F30342F30302D6E6361722D626561722D63616E796F6E2D6C6F6F702D747261696C2D6E6561722D626F756C6465722D6865616465722E6A7067, 1, 3.5, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Garden of the Gods', 'Garden of the Gods is argueabley the best place to hike in Colorado Springs. Designated a National Natural Landmark, the park is known for its towering red sandstone formations and panoramic views of Pikes Peak. Garden of the Gods features 6 different hiking trail options, spanning from easy to moderate and 1/2 mile to 2.5 mile hikes.\nGarden of the Gods is argueabley the best place to hike in Colorado Springs. Designated a National Natural Landmark, the park is known for its towering red sandstone formations and panoramic views of Pikes Peak. Garden of the Gods features 6 different hiking trail options, spanning from easy to moderate and 1/2 mile to 2.5 mile hikes.\n', 6200, 0x68747470733A2F2F64617968696B65736E65617264656E7665722E636F6D2F77702D636F6E74656E742F75706C6F6164732F323031382F30352F67617264656E2D6F662D7468652D676F64732D776974682D666F6F7468696C6C732D6865616465722E6A7067, 2, 3, NULL);
INSERT INTO `trail` (`id`, `name`, `description`, `altitude`, `img_url`, `difficulty_id`, `distance`, `address_id`) VALUES (DEFAULT, 'Long Lake Loop', 'Long Lake offers an easy 1.5 mile loop hike in Indian Peaks Wilderness. Located about 1 hour West of Boulder, Colorado, Long Lake is an easy-to-access alpine lake with stunning scenery. It’s a popular spot, especially in the Summer months.', 10500, 0x68747470733A2F2F64617968696B65736E65617264656E7665722E636F6D2F77702D636F6E74656E742F75706C6F6164732F323031372F30362F6C6F6E672D6C616B652D696E6469616E2D7065616B732D63632D626F6D626163692D30312E6A7067, 1, 1.5, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `profile_trail`
-- -----------------------------------------------------
START TRANSACTION;
USE `trailmixer`;
INSERT INTO `profile_trail` (`id`, `profile_id`, `trail_id`, `rating`) VALUES (DEFAULT, 1, 1, 4);
INSERT INTO `profile_trail` (`id`, `profile_id`, `trail_id`, `rating`) VALUES (DEFAULT, 1, 2, 5);
INSERT INTO `profile_trail` (`id`, `profile_id`, `trail_id`, `rating`) VALUES (DEFAULT, 1, 6, 5);
INSERT INTO `profile_trail` (`id`, `profile_id`, `trail_id`, `rating`) VALUES (DEFAULT, 2, 4, 5);
INSERT INTO `profile_trail` (`id`, `profile_id`, `trail_id`, `rating`) VALUES (DEFAULT, 3, 7, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `reason`
-- -----------------------------------------------------
START TRANSACTION;
USE `trailmixer`;
INSERT INTO `reason` (`id`, `name`) VALUES (1, 'Fun');
INSERT INTO `reason` (`id`, `name`) VALUES (2, 'Social');
INSERT INTO `reason` (`id`, `name`) VALUES (3, 'Fitness');

COMMIT;


-- -----------------------------------------------------
-- Data for table `profile_reason`
-- -----------------------------------------------------
START TRANSACTION;
USE `trailmixer`;
INSERT INTO `profile_reason` (`profile_id`, `reason_id`) VALUES (1, 1);
INSERT INTO `profile_reason` (`profile_id`, `reason_id`) VALUES (1, 2);
INSERT INTO `profile_reason` (`profile_id`, `reason_id`) VALUES (1, 3);
INSERT INTO `profile_reason` (`profile_id`, `reason_id`) VALUES (2, 2);
INSERT INTO `profile_reason` (`profile_id`, `reason_id`) VALUES (2, 1);
INSERT INTO `profile_reason` (`profile_id`, `reason_id`) VALUES (2, 3);
INSERT INTO `profile_reason` (`profile_id`, `reason_id`) VALUES (3, 3);

COMMIT;

