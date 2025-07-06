-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.5.0-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных mainlogs
CREATE DATABASE IF NOT EXISTS `mainlogs` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `mainlogs`;

-- Дамп структуры для таблица mainlogs.acclog
CREATE TABLE IF NOT EXISTS `acclog` (
  `time` datetime NOT NULL,
  `login` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `hwid` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `ip` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `sclub` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `action` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  KEY `time` (`time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.addinfo
CREATE TABLE IF NOT EXISTS `addinfo` (
  `time` datetime NOT NULL,
  `action` varchar(500) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для процедура mainlogs.addLogsData
DELIMITER //
CREATE PROCEDURE `addLogsData`(IN `in_table` VARCHAR(32),
	IN `in_where` VARCHAR(500),
	IN `in_what` VARCHAR(1000))
    COMMENT 'Добавление данных в логи'
BEGIN
	SET @s = CONCAT('INSERT INTO ', in_table, ' (', in_where, ') VALUES (', in_what,')');
	PREPARE stm FROM @s;
	EXECUTE stm;
END//
DELIMITER ;

-- Дамп структуры для таблица mainlogs.adminlog
CREATE TABLE IF NOT EXISTS `adminlog` (
  `time` datetime NOT NULL,
  `admin` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `action` varchar(350) COLLATE utf8mb4_bin NOT NULL,
  `player` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  KEY `time` (`time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.arrestlog
CREATE TABLE IF NOT EXISTS `arrestlog` (
  `time` datetime DEFAULT NULL,
  `player` int(11) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `reason` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `stars` int(11) DEFAULT NULL,
  `pnick` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `tnick` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.banlog
CREATE TABLE IF NOT EXISTS `banlog` (
  `time` datetime NOT NULL,
  `admin` int(11) NOT NULL,
  `player` int(11) NOT NULL,
  `login` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `until` datetime NOT NULL,
  `reason` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `ishard` tinyint(4) NOT NULL,
  `rgscemailhash` varchar(128) COLLATE utf8mb4_bin DEFAULT '-',
  KEY `time` (`time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.barber_female_beard
CREATE TABLE IF NOT EXISTS `barber_female_beard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `tname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.barber_female_body
CREATE TABLE IF NOT EXISTS `barber_female_body` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `tname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.barber_female_eyebrows
CREATE TABLE IF NOT EXISTS `barber_female_eyebrows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `tname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.barber_female_eyes
CREATE TABLE IF NOT EXISTS `barber_female_eyes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `tname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.barber_female_hair
CREATE TABLE IF NOT EXISTS `barber_female_hair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `tname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.barber_female_lips
CREATE TABLE IF NOT EXISTS `barber_female_lips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `tname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.barber_female_makeup
CREATE TABLE IF NOT EXISTS `barber_female_makeup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `tname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.barber_female_palette
CREATE TABLE IF NOT EXISTS `barber_female_palette` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `tname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.barber_male_beard
CREATE TABLE IF NOT EXISTS `barber_male_beard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `tname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.barber_male_body
CREATE TABLE IF NOT EXISTS `barber_male_body` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `tname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.barber_male_eyebrows
CREATE TABLE IF NOT EXISTS `barber_male_eyebrows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `tname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.barber_male_eyes
CREATE TABLE IF NOT EXISTS `barber_male_eyes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `tname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.barber_male_hair
CREATE TABLE IF NOT EXISTS `barber_male_hair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `tname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.barber_male_lips
CREATE TABLE IF NOT EXISTS `barber_male_lips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `tname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.barber_male_makeup
CREATE TABLE IF NOT EXISTS `barber_male_makeup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `tname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.barber_male_palette
CREATE TABLE IF NOT EXISTS `barber_male_palette` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `tname` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.bpawards
CREATE TABLE IF NOT EXISTS `bpawards` (
  `id` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `data` varchar(50) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.bpawardsold
CREATE TABLE IF NOT EXISTS `bpawardsold` (
  `id` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `data` varchar(50) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.bpawardspremium
CREATE TABLE IF NOT EXISTS `bpawardspremium` (
  `id` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `data` varchar(50) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.bpawardspremiumold
CREATE TABLE IF NOT EXISTS `bpawardspremiumold` (
  `id` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `itemId` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `data` varchar(50) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.bptask
CREATE TABLE IF NOT EXISTS `bptask` (
  `id` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.bus_products
CREATE TABLE IF NOT EXISTS `bus_products` (
  `name` varchar(86) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `otherPrice` int(11) NOT NULL DEFAULT 0,
  `percent` tinyint(4) NOT NULL DEFAULT 0,
  `maxCount` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `itemId` int(11) NOT NULL DEFAULT 0,
  `toggled` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.casinolog
CREATE TABLE IF NOT EXISTS `casinolog` (
  `roulette` bigint(20) DEFAULT 0,
  `horses` bigint(20) DEFAULT 0,
  `spins` bigint(20) DEFAULT 0,
  `bj` bigint(20) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.client_tc
CREATE TABLE IF NOT EXISTS `client_tc` (
  `time` datetime DEFAULT NULL,
  `path` varchar(50) DEFAULT NULL,
  `callback` varchar(100) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_bugs
CREATE TABLE IF NOT EXISTS `clothes_bugs` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  `maxSlots` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_female_accessories
CREATE TABLE IF NOT EXISTS `clothes_female_accessories` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `category` text NOT NULL,
  `price` int(11) NOT NULL,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_female_bodyarmors
CREATE TABLE IF NOT EXISTS `clothes_female_bodyarmors` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `category` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_female_bracelets
CREATE TABLE IF NOT EXISTS `clothes_female_bracelets` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `category` text NOT NULL,
  `price` int(11) NOT NULL,
  `donate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_female_decals
CREATE TABLE IF NOT EXISTS `clothes_female_decals` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `category` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_female_ears
CREATE TABLE IF NOT EXISTS `clothes_female_ears` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `category` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_female_glasses
CREATE TABLE IF NOT EXISTS `clothes_female_glasses` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `category` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_female_hats
CREATE TABLE IF NOT EXISTS `clothes_female_hats` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `clean_hair` tinyint(1) NOT NULL DEFAULT 1,
  `similar` int(11) NOT NULL DEFAULT -1,
  `category` text NOT NULL,
  `price` int(11) NOT NULL,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_female_legs
CREATE TABLE IF NOT EXISTS `clothes_female_legs` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `underwear` tinyint(1) NOT NULL DEFAULT 0,
  `category` text NOT NULL,
  `price` int(11) NOT NULL,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_female_masks
CREATE TABLE IF NOT EXISTS `clothes_female_masks` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `isHair` tinyint(1) NOT NULL DEFAULT 0,
  `isHat` tinyint(1) NOT NULL DEFAULT 0,
  `isGlasses` tinyint(1) NOT NULL DEFAULT 0,
  `category` mediumtext NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  `gender` tinyint(4) NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_female_shoes
CREATE TABLE IF NOT EXISTS `clothes_female_shoes` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `category` text NOT NULL,
  `price` int(11) NOT NULL,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_female_tops
CREATE TABLE IF NOT EXISTS `clothes_female_tops` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `torso` int(11) NOT NULL,
  `textures` mediumtext NOT NULL,
  `similar` int(11) NOT NULL DEFAULT -1,
  `type` smallint(6) NOT NULL DEFAULT -1 COMMENT '-1 - Не может быть вверхом, 0 - полностью закрыта, 1 - Полностью растегнута, 2 - растегнута на половину',
  `undershirt` int(11) NOT NULL DEFAULT -1,
  `undershirt_buttoned` int(11) NOT NULL DEFAULT -1,
  `undershirt_torso` int(11) NOT NULL DEFAULT -1,
  `undershirt_buttoned_torso` int(11) NOT NULL DEFAULT -1,
  `isClearLegs` tinyint(1) NOT NULL DEFAULT 0,
  `category` mediumtext NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_female_torsos
CREATE TABLE IF NOT EXISTS `clothes_female_torsos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  `torso` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_female_watches
CREATE TABLE IF NOT EXISTS `clothes_female_watches` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `category` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_male_accessories
CREATE TABLE IF NOT EXISTS `clothes_male_accessories` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `category` text NOT NULL,
  `price` int(11) NOT NULL,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_male_bodyarmors
CREATE TABLE IF NOT EXISTS `clothes_male_bodyarmors` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `category` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_male_bracelets
CREATE TABLE IF NOT EXISTS `clothes_male_bracelets` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `category` text NOT NULL,
  `price` int(11) NOT NULL,
  `donate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_male_decals
CREATE TABLE IF NOT EXISTS `clothes_male_decals` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `category` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_male_ears
CREATE TABLE IF NOT EXISTS `clothes_male_ears` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `category` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_male_glasses
CREATE TABLE IF NOT EXISTS `clothes_male_glasses` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `category` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_male_hats
CREATE TABLE IF NOT EXISTS `clothes_male_hats` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `clean_hair` tinyint(1) NOT NULL DEFAULT 1,
  `similar` int(11) NOT NULL DEFAULT -1,
  `category` text NOT NULL,
  `price` int(11) NOT NULL,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_male_legs
CREATE TABLE IF NOT EXISTS `clothes_male_legs` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `underwear` tinyint(1) NOT NULL DEFAULT 0,
  `category` text NOT NULL,
  `price` int(11) NOT NULL,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_male_masks
CREATE TABLE IF NOT EXISTS `clothes_male_masks` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `isHair` tinyint(1) NOT NULL DEFAULT 0,
  `isHat` tinyint(1) NOT NULL DEFAULT 0,
  `isGlasses` tinyint(1) NOT NULL DEFAULT 0,
  `category` mediumtext NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  `gender` tinyint(4) NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_male_shoes
CREATE TABLE IF NOT EXISTS `clothes_male_shoes` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `category` text NOT NULL,
  `price` int(11) NOT NULL,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_male_tops
CREATE TABLE IF NOT EXISTS `clothes_male_tops` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `torso` int(11) NOT NULL,
  `textures` mediumtext NOT NULL,
  `similar` int(11) NOT NULL DEFAULT -1,
  `type` smallint(6) NOT NULL DEFAULT -1 COMMENT '-1 - Не может быть вверхом, 0 - полностью закрыта, 1 - Полностью растегнута, 2 - растегнута на половину',
  `undershirt` int(11) NOT NULL DEFAULT -1,
  `undershirt_buttoned` int(11) NOT NULL DEFAULT -1,
  `undershirt_torso` int(11) NOT NULL DEFAULT -1,
  `undershirt_buttoned_torso` int(11) NOT NULL DEFAULT -1,
  `isClearLegs` tinyint(1) NOT NULL DEFAULT 0,
  `category` mediumtext NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_male_torsos
CREATE TABLE IF NOT EXISTS `clothes_male_torsos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  `torso` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_male_watches
CREATE TABLE IF NOT EXISTS `clothes_male_watches` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `category` text NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.clothes_masks
CREATE TABLE IF NOT EXISTS `clothes_masks` (
  `id` int(11) NOT NULL,
  `variation` int(11) NOT NULL DEFAULT -1,
  `cvariation` int(11) NOT NULL DEFAULT 0,
  `textures` text NOT NULL,
  `isHair` tinyint(1) NOT NULL DEFAULT 0,
  `isHat` tinyint(1) NOT NULL DEFAULT 0,
  `isGlasses` tinyint(1) NOT NULL DEFAULT 0,
  `category` mediumtext NOT NULL,
  `can_buy` tinyint(1) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `donate` int(11) NOT NULL DEFAULT 0,
  `gender` tinyint(4) NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для процедура mainlogs.dasd
DELIMITER //
CREATE PROCEDURE `dasd`()
BEGIN
	#Routine body goes here...
	TRUNCATE TABLE acclog;
    TRUNCATE TABLE addinfo;
    TRUNCATE TABLE adminlog;
    TRUNCATE TABLE arrestlog;
    TRUNCATE TABLE banlog;
    TRUNCATE TABLE casinolog;
    TRUNCATE TABLE client_tc;
    TRUNCATE TABLE deletelog;
    TRUNCATE TABLE events;
    TRUNCATE TABLE eventslog;
    TRUNCATE TABLE fraclog;
    TRUNCATE TABLE idlog;
    TRUNCATE TABLE itemslog;
    TRUNCATE TABLE killlog;
    TRUNCATE TABLE moneylog;
    TRUNCATE TABLE namelog;
    TRUNCATE TABLE stocklog;
    TRUNCATE TABLE ticketlog;

END//
DELIMITER ;

-- Дамп структуры для таблица mainlogs.deletelog
CREATE TABLE IF NOT EXISTS `deletelog` (
  `time` datetime DEFAULT NULL,
  `uuid` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `account` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для процедура mainlogs.dsds
DELIMITER //
CREATE PROCEDURE `dsds`()
BEGIN

END//
DELIMITER ;

-- Дамп структуры для таблица mainlogs.events
CREATE TABLE IF NOT EXISTS `events` (
  `ID` int(11) DEFAULT NULL,
  `Event` text DEFAULT NULL,
  `Calls` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.eventslog
CREATE TABLE IF NOT EXISTS `eventslog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AdminStarted` varchar(40) NOT NULL,
  `AdminClosed` varchar(40) DEFAULT NULL,
  `EventName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Members` smallint(5) unsigned NOT NULL DEFAULT 0,
  `MembersLimit` smallint(5) unsigned NOT NULL,
  `Winner` varchar(40) NOT NULL DEFAULT 'Undefined',
  `Reward` int(11) NOT NULL DEFAULT 0,
  `RewardLimit` int(10) unsigned NOT NULL DEFAULT 0,
  `Started` datetime NOT NULL,
  `Ended` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.everydayaward
CREATE TABLE IF NOT EXISTS `everydayaward` (
  `autoId` int(11) NOT NULL AUTO_INCREMENT,
  `day` int(11) NOT NULL DEFAULT 1,
  `type` int(11) NOT NULL DEFAULT 0,
  `desc` varchar(26) NOT NULL DEFAULT '',
  `count` int(11) NOT NULL DEFAULT 0,
  `itemId` int(11) NOT NULL DEFAULT 0,
  `data` varchar(50) NOT NULL DEFAULT '',
  `pngUrl` varchar(86) NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`autoId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=667 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.fraclog
CREATE TABLE IF NOT EXISTS `fraclog` (
  `time` datetime DEFAULT NULL,
  `frac` varchar(25) DEFAULT NULL,
  `player` int(11) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `tname` varchar(50) DEFAULT NULL,
  `action` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.idlog
CREATE TABLE IF NOT EXISTS `idlog` (
  `in` datetime NOT NULL,
  `out` datetime DEFAULT NULL,
  `uuid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `sclub` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `hwid` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL,
  `ip` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `login` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `reason` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  KEY `in` (`in`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.itemslog
CREATE TABLE IF NOT EXISTS `itemslog` (
  `time` datetime NOT NULL,
  `from` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `to` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `type` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `data` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  KEY `time` (`time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.killlog
CREATE TABLE IF NOT EXISTS `killlog` (
  `time` datetime DEFAULT NULL,
  `killer` varchar(50) DEFAULT NULL,
  `weapon` varchar(50) DEFAULT NULL,
  `victim` varchar(50) DEFAULT NULL,
  `pos` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.moneylog
CREATE TABLE IF NOT EXISTS `moneylog` (
  `time` datetime NOT NULL,
  `from` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `to` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `amount` bigint(20) NOT NULL,
  `comment` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  KEY `time` (`time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.namelog
CREATE TABLE IF NOT EXISTS `namelog` (
  `time` datetime NOT NULL,
  `uuid` int(11) NOT NULL,
  `old` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `new` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  KEY `time` (`time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.ores
CREATE TABLE IF NOT EXISTS `ores` (
  `index` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  PRIMARY KEY (`index`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.roulette
CREATE TABLE IF NOT EXISTS `roulette` (
  `autoId` int(11) NOT NULL AUTO_INCREMENT,
  `caseId` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `desc` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `valueMin` int(11) DEFAULT NULL,
  `valueMax` int(11) DEFAULT NULL,
  `returnRB` int(11) DEFAULT NULL,
  `percent` int(11) DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `isChatMessage` tinyint(1) NOT NULL DEFAULT 0,
  `isHudMessage` tinyint(1) NOT NULL DEFAULT 0,
  `itemId` smallint(6) NOT NULL DEFAULT 0,
  `itemData` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`autoId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.stocklog
CREATE TABLE IF NOT EXISTS `stocklog` (
  `time` datetime NOT NULL,
  `frac` int(11) NOT NULL,
  `uuid` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '-1',
  `type` varchar(35) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL,
  `in` tinyint(4) NOT NULL,
  KEY `time` (`time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.systemstate
CREATE TABLE IF NOT EXISTS `systemstate` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `toggle` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.tattoo_head
CREATE TABLE IF NOT EXISTS `tattoo_head` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL DEFAULT '',
  `Dictionary` varchar(50) NOT NULL DEFAULT '',
  `MaleHash` varchar(50) NOT NULL DEFAULT '',
  `FemaleHash` varchar(50) NOT NULL DEFAULT '',
  `Slots` varchar(50) NOT NULL DEFAULT '[]' COMMENT 'Слоты совпадения что бы удалять существующие совпадения',
  `Price` int(11) NOT NULL DEFAULT 0,
  `Donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.tattoo_leftarm
CREATE TABLE IF NOT EXISTS `tattoo_leftarm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL DEFAULT '',
  `Dictionary` varchar(50) NOT NULL DEFAULT '',
  `MaleHash` varchar(50) NOT NULL DEFAULT '',
  `FemaleHash` varchar(50) NOT NULL DEFAULT '',
  `Slots` varchar(50) NOT NULL DEFAULT '[]' COMMENT 'Слоты совпадения что бы удалять существующие совпадения',
  `Price` int(11) NOT NULL DEFAULT 0,
  `Donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.tattoo_leftleg
CREATE TABLE IF NOT EXISTS `tattoo_leftleg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL DEFAULT '',
  `Dictionary` varchar(50) NOT NULL DEFAULT '',
  `MaleHash` varchar(50) NOT NULL DEFAULT '',
  `FemaleHash` varchar(50) NOT NULL DEFAULT '',
  `Slots` varchar(50) NOT NULL DEFAULT '[]' COMMENT 'Слоты совпадения что бы удалять существующие совпадения',
  `Price` int(11) NOT NULL DEFAULT 0,
  `Donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.tattoo_rightarm
CREATE TABLE IF NOT EXISTS `tattoo_rightarm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL DEFAULT '',
  `Dictionary` varchar(50) NOT NULL DEFAULT '',
  `MaleHash` varchar(50) NOT NULL DEFAULT '',
  `FemaleHash` varchar(50) NOT NULL DEFAULT '',
  `Slots` varchar(50) NOT NULL DEFAULT '[]' COMMENT 'Слоты совпадения что бы удалять существующие совпадения',
  `Price` int(11) NOT NULL DEFAULT 0,
  `Donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.tattoo_rightleg
CREATE TABLE IF NOT EXISTS `tattoo_rightleg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL DEFAULT '',
  `Dictionary` varchar(50) NOT NULL DEFAULT '',
  `MaleHash` varchar(50) NOT NULL DEFAULT '',
  `FemaleHash` varchar(50) NOT NULL DEFAULT '',
  `Slots` varchar(50) NOT NULL DEFAULT '[]' COMMENT 'Слоты совпадения что бы удалять существующие совпадения',
  `Price` int(11) NOT NULL DEFAULT 0,
  `Donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.tattoo_torso
CREATE TABLE IF NOT EXISTS `tattoo_torso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL DEFAULT '',
  `Dictionary` varchar(50) NOT NULL DEFAULT '',
  `MaleHash` varchar(50) NOT NULL DEFAULT '',
  `FemaleHash` varchar(50) NOT NULL DEFAULT '',
  `Slots` varchar(50) NOT NULL DEFAULT '[]' COMMENT 'Слоты совпадения что бы удалять существующие совпадения',
  `Price` int(11) NOT NULL DEFAULT 0,
  `Donate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.ticketlog
CREATE TABLE IF NOT EXISTS `ticketlog` (
  `time` datetime DEFAULT NULL,
  `player` int(11) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `sum` int(11) DEFAULT NULL,
  `reason` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `pnick` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `tnick` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица mainlogs.unique
CREATE TABLE IF NOT EXISTS `unique` (
  `time` datetime DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `maxplayers` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для процедура mainlogs.updLogsData
DELIMITER //
CREATE PROCEDURE `updLogsData`(IN `in_table` VARCHAR(32),
	IN `in_datas` VARCHAR(1000),
	IN `in_where` VARCHAR(500))
    COMMENT 'Обновление данных в логах'
BEGIN
    SET @s = CONCAT('UPDATE ', in_table, ' SET ', in_datas, ' WHERE ', in_where);
    PREPARE stm FROM @s;
    EXECUTE stm;
END//
DELIMITER ;
