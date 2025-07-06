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


-- Дамп структуры базы данных main
CREATE DATABASE IF NOT EXISTS `main` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `main`;

-- Дамп структуры для таблица main.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `login` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `hwid` varchar(256) CHARACTER SET utf8mb4 NOT NULL,
  `ip` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `socialclub` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `redbucks` int(11) NOT NULL DEFAULT 0,
  `viplvl` int(11) NOT NULL,
  `vipdate` datetime NOT NULL,
  `promocodes` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `bonuscodes` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `character1` int(11) NOT NULL,
  `character2` int(11) NOT NULL,
  `character3` int(11) NOT NULL,
  `characters` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT '[-2,-2,-2,-2,-2,-2]',
  `present` tinyint(4) NOT NULL DEFAULT 0,
  `refpresent` tinyint(4) NOT NULL DEFAULT 0,
  `case` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT '[0,0,0]',
  `RefferalId` int(11) NOT NULL DEFAULT 0,
  `isSubscribe` tinyint(1) NOT NULL DEFAULT 0,
  `SubscribeEndTime` datetime NOT NULL DEFAULT current_timestamp(),
  `SubscribeTime` datetime NOT NULL DEFAULT current_timestamp(),
  `CollectionGifts` varchar(500) COLLATE utf8mb4_bin NOT NULL DEFAULT '[]',
  `ReceivedAward` varchar(75) COLLATE utf8mb4_bin NOT NULL DEFAULT '[0,0,0,0,0,0,0,0,1]',
  `ReceivedAwardWeek` int(11) NOT NULL DEFAULT 0,
  `ReceivedAwardDonate` int(11) NOT NULL DEFAULT 0,
  `Unique` varchar(16) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `LastSelectCharUUID` int(11) NOT NULL DEFAULT 0,
  `ExitDate` datetime NOT NULL DEFAULT current_timestamp(),
  `ga` varchar(25) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`login`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.adminaccess
CREATE TABLE IF NOT EXISTS `adminaccess` (
  `command` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `isadmin` tinyint(1) DEFAULT NULL,
  `minrank` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.adminaccessold
CREATE TABLE IF NOT EXISTS `adminaccessold` (
  `command` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `isadmin` tinyint(1) NOT NULL,
  `minrank` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `uuid` int(11) NOT NULL,
  `alog` tinyint(4) NOT NULL DEFAULT 0,
  `elog` tinyint(4) NOT NULL DEFAULT 0,
  `winlog` tinyint(4) NOT NULL DEFAULT 0,
  `agm` tinyint(4) NOT NULL DEFAULT 0,
  `kl` tinyint(4) NOT NULL DEFAULT 0,
  `hidenick` tinyint(4) NOT NULL DEFAULT 0,
  `hideme` tinyint(4) NOT NULL DEFAULT 0,
  `redname` tinyint(4) NOT NULL DEFAULT 1,
  `esp` tinyint(4) NOT NULL DEFAULT 0,
  `invise` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.advertised
CREATE TABLE IF NOT EXISTS `advertised` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Author` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `AuthorSIM` int(11) NOT NULL,
  `AD` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `Link` varchar(150) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `Editor` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `EditedAD` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `Opened` datetime NOT NULL,
  `Closed` datetime NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT 0,
  `Type` tinyint(4) NOT NULL DEFAULT 0,
  `IsPremium` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.alcoclubs
CREATE TABLE IF NOT EXISTS `alcoclubs` (
  `id` int(10) unsigned NOT NULL DEFAULT 0,
  `alco1` int(11) DEFAULT 0,
  `alco2` int(11) DEFAULT 0,
  `alco3` int(11) DEFAULT 0,
  `pricemod` int(11) DEFAULT 100,
  `mats` int(11) DEFAULT 5000,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.auctions
CREATE TABLE IF NOT EXISTS `auctions` (
  `autoId` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `createUUID` int(11) NOT NULL,
  `betCount` int(11) NOT NULL,
  `lastBetUUID` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `text` varchar(264) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `image` varchar(154) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `createPrice` int(11) NOT NULL,
  `lastPrice` int(11) NOT NULL,
  `betsData` text COLLATE utf8mb4_bin NOT NULL,
  `isEnd` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`autoId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.banned
CREATE TABLE IF NOT EXISTS `banned` (
  `uuid` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `account` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `time` datetime NOT NULL,
  `until` datetime NOT NULL,
  `ishard` tinyint(4) NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `socialclub` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `hwid` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `reason` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `byadmin` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `rgscemailhash` varchar(128) COLLATE utf8mb4_bin DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.battlepass
CREATE TABLE IF NOT EXISTS `battlepass` (
  `autoId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT 0,
  `seasonId` tinyint(4) NOT NULL DEFAULT 1,
  `tasksDay` text COLLATE utf8mb4_bin NOT NULL,
  `tasksWeek` text COLLATE utf8mb4_bin NOT NULL,
  `lvl` int(11) NOT NULL DEFAULT 0,
  `exp` int(11) NOT NULL DEFAULT 0,
  `isPremium` tinyint(1) NOT NULL DEFAULT 0,
  `tookReward` text COLLATE utf8mb4_bin NOT NULL,
  `tookRewardPremium` text COLLATE utf8mb4_bin NOT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`autoId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1084 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.bindcfg
CREATE TABLE IF NOT EXISTS `bindcfg` (
  `uuid` int(11) NOT NULL,
  `bindSetting` varchar(800) COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `chatSetting` varchar(150) COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `animFavorites` text COLLATE utf8mb4_bin NOT NULL,
  `animBind` varchar(86) COLLATE utf8mb4_bin NOT NULL DEFAULT '[0,0,0,0,0,0,0,0,0,0]',
  `adminOption` varchar(150) COLLATE utf8mb4_bin NOT NULL DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.bonuscodes
CREATE TABLE IF NOT EXISTS `bonuscodes` (
  `code` varchar(50) DEFAULT 'changeit',
  `used` bigint(20) unsigned DEFAULT 0,
  `limit` bigint(20) unsigned DEFAULT 0,
  `msg_r` varchar(400) DEFAULT 'Вы успешно активировали бонус код!',
  `exp_r` tinyint(3) unsigned DEFAULT 0,
  `money_r` int(10) unsigned DEFAULT 0,
  `vip_r` tinyint(3) unsigned DEFAULT 0,
  `vipdays_r` smallint(5) unsigned DEFAULT 0,
  `itemsm_r` varchar(4096) DEFAULT '[]',
  `itemsf_r` varchar(4096) DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.businesses
CREATE TABLE IF NOT EXISTS `businesses` (
  `id` int(11) NOT NULL,
  `owner` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `sellprice` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `products` text COLLATE utf8mb4_bin NOT NULL,
  `enterpoint` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `unloadpoint` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `money` int(11) NOT NULL,
  `mafia` int(11) NOT NULL,
  `orders` text COLLATE utf8mb4_bin NOT NULL,
  `tax` double DEFAULT 0.013,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.businesshistory
CREATE TABLE IF NOT EXISTS `businesshistory` (
  `autoid` int(11) NOT NULL AUTO_INCREMENT,
  `bizid` int(11) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT curdate(),
  `uuid` int(11) NOT NULL DEFAULT 0,
  `item` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`autoid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.business_info_points
CREATE TABLE IF NOT EXISTS `business_info_points` (
  `id` int(11) NOT NULL,
  `position` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `IsDelete` tinyint(1) NOT NULL DEFAULT 0,
  `DeleteData` datetime DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `lastname` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `health` int(11) DEFAULT NULL,
  `armor` int(11) DEFAULT NULL,
  `lvl` int(11) DEFAULT NULL,
  `exp` int(11) DEFAULT NULL,
  `money` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `work` int(11) DEFAULT NULL,
  `fraction` int(11) DEFAULT NULL,
  `fractionlvl` int(11) DEFAULT NULL,
  `drugaddi` smallint(5) unsigned DEFAULT 0,
  `arrest` int(11) DEFAULT NULL,
  `demorgan` int(11) DEFAULT NULL,
  `wanted` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL,
  `biz` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `adminlvl` int(11) DEFAULT NULL,
  `licenses` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `unwarn` datetime DEFAULT NULL,
  `unmute` int(11) DEFAULT 0,
  `warns` int(11) DEFAULT NULL,
  `onduty` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lasthour` int(11) DEFAULT NULL,
  `hotel` int(11) DEFAULT NULL,
  `hotelleft` int(11) DEFAULT NULL,
  `contacts` varchar(2500) CHARACTER SET utf8mb4 DEFAULT NULL,
  `achiev` varchar(2450) COLLATE utf8mb4_bin DEFAULT NULL,
  `sim` int(11) DEFAULT NULL,
  `PetName` varchar(30) COLLATE utf8mb4_bin NOT NULL DEFAULT 'null',
  `pos` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `demorganinfo` varchar(350) COLLATE utf8mb4_bin DEFAULT '{"Admin":"-1","Reason":"-1"}',
  `warninfo` varchar(1000) COLLATE utf8mb4_bin DEFAULT '{"Admin":["-1","-1","-1"],"Reason":["-1","-1","-1"]}',
  `time` varchar(250) COLLATE utf8mb4_bin DEFAULT '{"TotalTime":0,"Day":16,"TodayTime":0,"Month":3,"MonthTime":0,"Year":2020,"YearTime":0,"Week":1,"WeekTime":0}',
  `deaths` bigint(20) unsigned DEFAULT 0,
  `kills` bigint(20) unsigned DEFAULT 0,
  `earnedmoney` bigint(20) unsigned DEFAULT 0,
  `eattimes` bigint(20) unsigned DEFAULT 0,
  `revived` bigint(20) unsigned DEFAULT 0,
  `handshaked` bigint(20) unsigned DEFAULT 0,
  `jobskills` varchar(2048) COLLATE utf8mb4_bin DEFAULT '{}',
  `refcode` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL,
  `WeddingUUID` int(11) NOT NULL DEFAULT 0,
  `WeddingName` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `MissionTask` text COLLATE utf8mb4_bin NOT NULL,
  `IsBannedMP` tinyint(1) NOT NULL DEFAULT 0,
  `BanMPReason` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `IsBannedCrime` tinyint(1) NOT NULL DEFAULT 0,
  `BanCrimeReason` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `SelectedQuest` varchar(42) COLLATE utf8mb4_bin NOT NULL,
  `isForbesShow` tinyint(1) NOT NULL DEFAULT 0,
  `FractionTasksData` varchar(350) COLLATE utf8mb4_bin NOT NULL DEFAULT '[]',
  `isLucky` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.chatcfg
CREATE TABLE IF NOT EXISTS `chatcfg` (
  `uuid` int(11) DEFAULT NULL,
  `setting` varchar(1200) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.compensation
CREATE TABLE IF NOT EXISTS `compensation` (
  `auto_Id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) COLLATE utf8mb4_bin DEFAULT '0',
  `UUID` int(11) NOT NULL,
  `Title` varchar(86) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `Text` varchar(450) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `Money` int(11) NOT NULL DEFAULT 0,
  `Donate` int(11) NOT NULL DEFAULT 0,
  `ItemID` int(11) NOT NULL DEFAULT 0,
  `Data` varchar(26) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `Toggled` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`auto_Id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.containers
CREATE TABLE IF NOT EXISTS `containers` (
  `id` int(11) DEFAULT NULL COMMENT 'Уникальный индификатор',
  `type` varchar(255) DEFAULT NULL COMMENT 'Тип контейнера',
  `position` text DEFAULT NULL COMMENT 'Позиция модели контейнера',
  `rotation` text DEFAULT NULL COMMENT 'Поворот модели контейнера',
  `price` bigint(20) DEFAULT NULL COMMENT 'Стартовая цена контейнера',
  `max_bet` bigint(20) DEFAULT NULL COMMENT 'Максимальная ставка за контейнер',
  `step` bigint(20) DEFAULT NULL COMMENT 'Минимальный ход за ставку',
  `non_ref_dep` int(11) DEFAULT NULL COMMENT 'Невозвратный залог'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.customization
CREATE TABLE IF NOT EXISTS `customization` (
  `uuid` int(11) NOT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `parents` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `features` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `appearance` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL,
  `hair` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `tattoos` text COLLATE utf8mb4_bin DEFAULT NULL,
  `eyec` int(11) DEFAULT NULL,
  `iscreated` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для процедура main.da
DELIMITER //
CREATE PROCEDURE `da`()
BEGIN
ALTER TABLE `characters` AUTO_INCREMENT = 1;
END//
DELIMITER ;

-- Дамп структуры для таблица main.doorscontrol
CREATE TABLE IF NOT EXISTS `doorscontrol` (
  `id` varchar(16) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `toggled` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.e-dev_chiptuning
CREATE TABLE IF NOT EXISTS `e-dev_chiptuning` (
  `vehicleId` int(11) NOT NULL,
  `handlings` text DEFAULT NULL,
  `controllers` text DEFAULT NULL,
  PRIMARY KEY (`vehicleId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.economy
CREATE TABLE IF NOT EXISTS `economy` (
  `bizMin` float DEFAULT 0.5,
  `bizMax` float DEFAULT 1.5,
  `drugsPrice` int(10) unsigned DEFAULT 60,
  `busPrices` varchar(50) DEFAULT '[3,4,3,4,4,8]',
  `colPay` int(10) unsigned DEFAULT 7,
  `elecPay` int(10) unsigned DEFAULT 7,
  `postPay` int(10) unsigned DEFAULT 3,
  `lawnPay` int(10) unsigned DEFAULT 2,
  `gangCarDelivery` int(10) unsigned DEFAULT 500,
  `mafCarDelivery` int(10) unsigned DEFAULT 500,
  `policeAward` int(10) unsigned DEFAULT 200,
  `minGunLic` int(10) unsigned DEFAULT 5000,
  `maxGunLic` int(10) unsigned DEFAULT 6000,
  `minPMLic` int(10) unsigned DEFAULT 15000,
  `maxPMLic` int(10) unsigned DEFAULT 20000,
  `maxTicket` int(10) unsigned DEFAULT 7000,
  `minHeal` int(10) unsigned DEFAULT 50,
  `maxHeal` int(10) unsigned DEFAULT 400,
  `captureWin` int(10) unsigned DEFAULT 300,
  `bizwarWin` int(10) unsigned DEFAULT 300,
  `mafiaBizAward` int(10) unsigned DEFAULT 120,
  `gangPointAward` int(10) unsigned DEFAULT 100,
  `licPrices` varchar(70) DEFAULT '[600,1000,3000,6000,10000,10000]',
  `hotelRent` int(10) unsigned DEFAULT 100,
  `smsCost` int(10) unsigned DEFAULT 10,
  `adCost` int(10) unsigned DEFAULT 6,
  `evacCar` int(10) unsigned DEFAULT 200,
  `adEditCost` float DEFAULT 0.4,
  `minDice` int(10) unsigned DEFAULT 1000,
  `maxDice` int(10) unsigned DEFAULT 150000,
  `BMdrill` int(10) unsigned DEFAULT 20000,
  `BMlockpick` int(10) unsigned DEFAULT 200,
  `BMalockpick` int(10) unsigned DEFAULT 1200,
  `BMcuffs` int(10) unsigned DEFAULT 600,
  `BMpocket` int(10) unsigned DEFAULT 600,
  `BMwanted` int(10) unsigned DEFAULT 800,
  `busPay` int(10) unsigned DEFAULT 30,
  `BMuncuff` int(10) unsigned DEFAULT 2000,
  `DONOTUSE` tinyint(4) NOT NULL,
  `BlackMarketGunLic` int(11) DEFAULT 12000,
  `BlackMarketMedCard` int(11) DEFAULT 8000,
  `BlackRadioInterceptord` int(11) DEFAULT 8000,
  `BlackQrFake` int(11) DEFAULT 8000,
  PRIMARY KEY (`DONOTUSE`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.e_candidates
CREATE TABLE IF NOT EXISTS `e_candidates` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Election` mediumint(8) unsigned NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Votes` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.e_points
CREATE TABLE IF NOT EXISTS `e_points` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Election` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `X` float NOT NULL DEFAULT 0,
  `Y` float NOT NULL DEFAULT 0,
  `Z` float NOT NULL DEFAULT 0,
  `Dimension` int(10) unsigned NOT NULL DEFAULT 0,
  `Opened` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.e_voters
CREATE TABLE IF NOT EXISTS `e_voters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Election` mediumint(8) unsigned DEFAULT NULL,
  `Login` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `TimeVoted` datetime DEFAULT NULL,
  `VotedFor` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.familyzones
CREATE TABLE IF NOT EXISTS `familyzones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orgid` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.family_activities
CREATE TABLE IF NOT EXISTS `family_activities` (
  `id` int(11) DEFAULT NULL,
  `owner` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `point` text DEFAULT NULL,
  `heading` int(11) DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `lastcapture` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.fracranks
CREATE TABLE IF NOT EXISTS `fracranks` (
  `uuid` int(11) NOT NULL DEFAULT -1,
  `name` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `id` int(11) NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT curdate(),
  `avatar` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `departmentId` int(11) NOT NULL DEFAULT 0,
  `departmentRank` int(11) NOT NULL DEFAULT 0,
  `access` varchar(1500) CHARACTER SET utf8mb4 NOT NULL DEFAULT '[]',
  `lock` varchar(1500) CHARACTER SET utf8mb4 NOT NULL DEFAULT '[]',
  `score` int(11) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime NOT NULL DEFAULT curdate(),
  `time` varchar(350) COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `tasks` varchar(350) COLLATE utf8mb4_bin NOT NULL DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.fractionaccess
CREATE TABLE IF NOT EXISTS `fractionaccess` (
  `fraction` int(11) DEFAULT NULL,
  `commands` varchar(1024) CHARACTER SET latin1 NOT NULL DEFAULT '{}',
  `weapons` varchar(1024) CHARACTER SET latin1 NOT NULL DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.fractionlogs
CREATE TABLE IF NOT EXISTS `fractionlogs` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `fraction` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `uuid` int(11) NOT NULL DEFAULT -1,
  `rank` tinyint(4) NOT NULL DEFAULT 0,
  `text` text CHARACTER SET utf8mb4 NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`auto_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.fractionranks
CREATE TABLE IF NOT EXISTS `fractionranks` (
  `fraction` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `payday` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL,
  `clothesm` text NOT NULL,
  `clothesf` text NOT NULL,
  `access` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.fractionrankscrazy
CREATE TABLE IF NOT EXISTS `fractionrankscrazy` (
  `fraction` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `payday` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `access` text COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.fractions
CREATE TABLE IF NOT EXISTS `fractions` (
  `id` int(11) NOT NULL,
  `drugs` int(11) NOT NULL,
  `mats` int(11) NOT NULL,
  `medkits` int(11) NOT NULL,
  `coalore` int(11) NOT NULL DEFAULT 0,
  `ironore` int(11) NOT NULL DEFAULT 0,
  `sulfurore` int(11) NOT NULL DEFAULT 0,
  `preciousore` int(11) NOT NULL DEFAULT 0,
  `money` int(11) NOT NULL,
  `lastserial` int(11) NOT NULL DEFAULT 0,
  `weapons` text COLLATE utf8mb4_bin DEFAULT NULL,
  `isopen` tinyint(4) NOT NULL DEFAULT 0,
  `isopengunstock` tinyint(4) NOT NULL DEFAULT 0,
  `fuellimit` int(11) NOT NULL,
  `fuelleft` int(11) NOT NULL,
  `clothingsets` text COLLATE utf8mb4_bin NOT NULL,
  `discord` varchar(24) COLLATE utf8mb4_bin DEFAULT '',
  `departments` text COLLATE utf8mb4_bin DEFAULT NULL,
  `tasksData` varchar(350) COLLATE utf8mb4_bin DEFAULT '[]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.fractionvehicles
CREATE TABLE IF NOT EXISTS `fractionvehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fraction` int(11) NOT NULL,
  `number` tinytext CHARACTER SET latin1 NOT NULL,
  `model` tinytext CHARACTER SET latin1 NOT NULL,
  `position` varchar(100) CHARACTER SET latin1 NOT NULL,
  `rotation` varchar(100) CHARACTER SET latin1 NOT NULL,
  `rank` int(11) NOT NULL,
  `defaultrank` int(11) NOT NULL DEFAULT -1,
  `colorprim` int(11) NOT NULL DEFAULT 0,
  `colorsec` int(11) NOT NULL DEFAULT 0,
  `components` varchar(2048) COLLATE utf8mb4_bin NOT NULL DEFAULT '{"PrimColor":{"Red":255,"Green":255,"Blue":255,"Alpha":255},"SecColor":{"Red":255,"Green":255,"Blue":255,"Alpha":255},"PrimModColor":-1,"SecModColor":-1,"Muffler":-1,"SideSkirt":-1,"Hood":-1,"Spoiler":-1,"Lattice":-1,"Wings":-1,"Roof":-1,"Vinyls":-1,"FrontBumper":-1,"RearBumper":-1,"Engine":-1,"Turbo":-1,"Horn":-1,"Transmission":-1,"WindowTint":0,"Suspension":-1,"Brakes":-1,"Headlights":-1,"NumberPlate":0,"Wheels":-1,"WheelsType":0,"WheelsColor":0,"NeonColor":{"Red":0,"Green":0,"Blue":0,"Alpha":0},"Armor":-1}',
  `isDimension` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.fractionvehiclesbackup
CREATE TABLE IF NOT EXISTS `fractionvehiclesbackup` (
  `fraction` int(11) NOT NULL,
  `number` tinytext CHARACTER SET latin1 NOT NULL,
  `model` tinytext CHARACTER SET latin1 NOT NULL,
  `position` varchar(100) CHARACTER SET latin1 NOT NULL,
  `rotation` varchar(100) CHARACTER SET latin1 NOT NULL,
  `rank` int(11) NOT NULL,
  `defaultrank` int(11) NOT NULL DEFAULT -1,
  `colorprim` int(11) NOT NULL DEFAULT 0,
  `colorsec` int(11) NOT NULL DEFAULT 0,
  `components` varchar(2048) COLLATE utf8mb4_bin NOT NULL DEFAULT '{"PrimColor":{"Red":255,"Green":255,"Blue":255,"Alpha":255},"SecColor":{"Red":255,"Green":255,"Blue":255,"Alpha":255},"PrimModColor":-1,"SecModColor":-1,"Muffler":-1,"SideSkirt":-1,"Hood":-1,"Spoiler":-1,"Lattice":-1,"Wings":-1,"Roof":-1,"Vinyls":-1,"FrontBumper":-1,"RearBumper":-1,"Engine":-1,"Turbo":-1,"Horn":-1,"Transmission":-1,"WindowTint":0,"Suspension":-1,"Brakes":-1,"Headlights":-1,"NumberPlate":0,"Wheels":-1,"WheelsType":0,"WheelsColor":0,"NeonColor":{"Red":0,"Green":0,"Blue":0,"Alpha":0},"Armor":-1}',
  `isDimension` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.fraction_clothing_sets
CREATE TABLE IF NOT EXISTS `fraction_clothing_sets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fraction` int(11) DEFAULT 0,
  `rank` int(11) DEFAULT 1,
  `gender` tinyint(4) DEFAULT 1,
  `name` tinytext COLLATE utf8mb4_bin DEFAULT NULL,
  `clothing_index` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.friends
CREATE TABLE IF NOT EXISTS `friends` (
  `first` varchar(50) NOT NULL,
  `second` varchar(50) NOT NULL,
  `fullname` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.furniture
CREATE TABLE IF NOT EXISTS `furniture` (
  `uuid` int(11) NOT NULL,
  `furniture` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `access` varchar(400) DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.gangspoints
CREATE TABLE IF NOT EXISTS `gangspoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gangid` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.garages
CREATE TABLE IF NOT EXISTS `garages` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT -1,
  `position` varchar(80) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `rotation` varchar(80) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `upgraded` int(11) NOT NULL DEFAULT -1,
  `carSlots` varchar(1000) COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.houses
CREATE TABLE IF NOT EXISTS `houses` (
  `id` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT 0,
  `position` varchar(80) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 1000000,
  `locked` tinyint(4) NOT NULL DEFAULT 0,
  `garage` int(11) NOT NULL DEFAULT 0,
  `bank` int(11) NOT NULL DEFAULT 0,
  `healkit` tinyint(4) DEFAULT 0,
  `roommates` varchar(2024) COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `alarm` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для процедура main.InsertItemData
DELIMITER //
CREATE PROCEDURE `InsertItemData`(IN `in_data_id` VARCHAR(32),
	IN `in_item_id` SMALLINT,
	IN `in_item_count` SMALLINT,
	IN `in_item_data` VARCHAR(46),
	IN `in_location` VARCHAR(24),
	IN `in_slotId` SMALLINT)
BEGIN
	DECLARE rId INT DEFAULT 0; 
	INSERT INTO `items_data`(`data_id`, `item_id`, `item_count`, `item_data`, `location`, `slotId`) VALUES (in_data_id, in_item_id, in_item_count, in_item_data, in_location, in_slotId);
	SET rId = LAST_INSERT_ID(); 
	SELECT rId;
END//
DELIMITER ;

-- Дамп структуры для таблица main.items_data
CREATE TABLE IF NOT EXISTS `items_data` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_id` varchar(32) COLLATE utf8mb4_bin DEFAULT '-1_-1_True',
  `item_id` smallint(6) DEFAULT NULL,
  `item_count` int(11) DEFAULT NULL,
  `item_data` varchar(46) COLLATE utf8mb4_bin DEFAULT NULL,
  `location` varchar(24) COLLATE utf8mb4_bin DEFAULT NULL,
  `slotId` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`auto_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.livingcity
CREATE TABLE IF NOT EXISTS `livingcity` (
  `VehicleX` float NOT NULL,
  `VehicleY` float NOT NULL,
  `VehicleZ` float NOT NULL,
  `VehicleR` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.lottery
CREATE TABLE IF NOT EXISTS `lottery` (
  `number` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.lottery_players
CREATE TABLE IF NOT EXISTS `lottery_players` (
  `number` int(10) unsigned NOT NULL,
  `ticket` int(10) unsigned NOT NULL,
  `player` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.mine_stocks
CREATE TABLE IF NOT EXISTS `mine_stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coal` int(11) NOT NULL DEFAULT 0,
  `iron` int(11) NOT NULL DEFAULT 0,
  `gold` int(11) NOT NULL DEFAULT 0,
  `sulfur` int(11) NOT NULL DEFAULT 0,
  `emerald` int(11) NOT NULL DEFAULT 0,
  `ruby` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.money
CREATE TABLE IF NOT EXISTS `money` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL,
  `holder` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `balance` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=108209 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.notes
CREATE TABLE IF NOT EXISTS `notes` (
  `Item_Id` int(11) NOT NULL,
  `Name` varchar(46) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `Text` text CHARACTER SET utf8mb4 NOT NULL,
  `Type` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bizid` int(11) NOT NULL,
  `prodname` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.organizations
CREATE TABLE IF NOT EXISTS `organizations` (
  `Organization` int(11) NOT NULL AUTO_INCREMENT,
  `OwnerUUID` int(11) NOT NULL DEFAULT -1,
  `Name` varchar(30) DEFAULT NULL,
  `OfficeUP` tinyint(4) DEFAULT 0,
  `Customs` tinyint(4) DEFAULT 0,
  `Stock` tinyint(4) DEFAULT 0,
  `CrimeOptions` tinyint(4) DEFAULT 0,
  `PistolScheme` tinyint(4) DEFAULT 0,
  `PistolMk2Scheme` tinyint(4) DEFAULT 0,
  `Pistol50Scheme` tinyint(4) DEFAULT 0,
  `HeavyPistolScheme` tinyint(4) DEFAULT 0,
  `PumpShotgunScheme` tinyint(4) DEFAULT 0,
  `DoubleBarrelShotgunScheme` tinyint(4) DEFAULT 0,
  `SawnOffShotgunScheme` tinyint(4) DEFAULT 0,
  `MiniSMGScheme` tinyint(4) DEFAULT 0,
  `SMGMk2Scheme` tinyint(4) DEFAULT 0,
  `MachinePistolScheme` tinyint(4) DEFAULT 0,
  `MicroSMGScheme` tinyint(4) DEFAULT 0,
  `CombatPDWScheme` tinyint(4) DEFAULT 0,
  `CompactRifleScheme` tinyint(4) DEFAULT 0,
  `AssaultRifleScheme` tinyint(4) DEFAULT 0,
  `ArmorScheme` tinyint(4) DEFAULT 0,
  `Drugs` int(11) DEFAULT 0,
  `Mats` int(11) DEFAULT 0,
  `MedKits` int(11) DEFAULT 0,
  `Money` int(11) DEFAULT 0,
  `Weapons` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `IsOpen` tinyint(4) DEFAULT 0,
  `Status` tinyint(4) DEFAULT 1,
  `BlipID` int(11) DEFAULT -1,
  `BlipColor` tinyint(3) unsigned DEFAULT 0,
  `BlipXYZ` varchar(150) DEFAULT '{"x":0,"y":0,"z":0}',
  `Ranks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `departments` text DEFAULT NULL,
  `discord` varchar(24) DEFAULT '',
  `salary` tinyint(4) DEFAULT 0,
  `color` varchar(56) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}',
  `date` datetime DEFAULT current_timestamp(),
  `slogan` varchar(85) DEFAULT '',
  `attackingCount` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}',
  `protectingCount` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}',
  `houseid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Organization`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.orglogs
CREATE TABLE IF NOT EXISTS `orglogs` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `organization` smallint(6) NOT NULL DEFAULT 0,
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `uuid` int(11) NOT NULL DEFAULT -1,
  `rank` tinyint(4) NOT NULL DEFAULT 0,
  `text` text CHARACTER SET utf8mb4 NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`auto_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.orgranks
CREATE TABLE IF NOT EXISTS `orgranks` (
  `uuid` int(11) NOT NULL DEFAULT -1,
  `name` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `id` int(11) DEFAULT 0,
  `rank` int(11) DEFAULT 0,
  `date` datetime DEFAULT curdate(),
  `avatar` varchar(255) CHARACTER SET utf8mb4 DEFAULT '',
  `departmentId` int(11) DEFAULT 0,
  `departmentRank` int(11) DEFAULT 0,
  `access` varchar(1500) COLLATE utf8mb4_bin DEFAULT '[]',
  `lock` varchar(1500) COLLATE utf8mb4_bin DEFAULT '[]',
  `score` int(11) DEFAULT 0,
  `lastLoginDate` datetime DEFAULT curdate(),
  `time` varchar(350) COLLATE utf8mb4_bin DEFAULT '{}',
  `tasks` varchar(350) COLLATE utf8mb4_bin DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.orgvehicles
CREATE TABLE IF NOT EXISTS `orgvehicles` (
  `organization` int(11) NOT NULL,
  `number` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `position` tinyint(4) NOT NULL DEFAULT 0,
  `rank` int(11) NOT NULL DEFAULT 0,
  `components` varchar(2048) COLLATE utf8mb4_bin NOT NULL DEFAULT '{"PrimColor":{"Red":255,"Green":255,"Blue":255,"Alpha":255},"SecColor":{"Red":255,"Green":255,"Blue":255,"Alpha":255},"PrimModColor":-1,"SecModColor":-1,"Muffler":-1,"SideSkirt":-1,"Hood":-1,"Spoiler":-1,"Lattice":-1,"Wings":-1,"Roof":-1,"Vinyls":-1,"FrontBumper":-1,"RearBumper":-1,"Engine":-1,"Turbo":-1,"Horn":-1,"Transmission":-1,"WindowTint":0,"Suspension":-1,"Brakes":-1,"Headlights":-1,"NumberPlate":0,"Wheels":-1,"WheelsType":0,"WheelsColor":0,"NeonColor":{"Red":0,"Green":0,"Blue":0,"Alpha":0},"Armor":-1}',
  `dirt` float DEFAULT 0,
  `petrol` int(11) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.othervehicles
CREATE TABLE IF NOT EXISTS `othervehicles` (
  `type` int(11) DEFAULT NULL,
  `number` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `model` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `position` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `rotation` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `color1` int(11) DEFAULT NULL,
  `color2` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.pet
CREATE TABLE IF NOT EXISTS `pet` (
  `AutoId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `OwnerUUID` int(11) NOT NULL,
  `Model` bigint(20) NOT NULL DEFAULT 0,
  `Health` int(11) NOT NULL DEFAULT 100,
  `Death` datetime NOT NULL,
  `InGame` tinyint(1) NOT NULL DEFAULT 0,
  `Position` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `Heading` float NOT NULL DEFAULT 0,
  `Rotation` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `Dimension` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`AutoId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.phoneinfo
CREATE TABLE IF NOT EXISTS `phoneinfo` (
  `uuid` int(11) NOT NULL,
  `contacts` text COLLATE utf8mb4_bin NOT NULL,
  `blackList` text COLLATE utf8mb4_bin NOT NULL,
  `settings` varchar(500) COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `gallery` text COLLATE utf8mb4_bin NOT NULL,
  `recents` text COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.phonemessage
CREATE TABLE IF NOT EXISTS `phonemessage` (
  `autoId` int(11) NOT NULL AUTO_INCREMENT,
  `fromUuid` int(11) NOT NULL DEFAULT 0,
  `fromPhone` int(11) NOT NULL DEFAULT 0,
  `toUuid` int(11) NOT NULL DEFAULT 0,
  `toPhone` int(11) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `text` text CHARACTER SET utf8mb4 NOT NULL,
  `fromStatus` tinyint(1) NOT NULL DEFAULT 0,
  `toStatus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`autoId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.phonetinder
CREATE TABLE IF NOT EXISTS `phonetinder` (
  `uuid` int(11) DEFAULT NULL,
  `avatar` varchar(250) COLLATE utf8mb4_bin DEFAULT NULL,
  `text` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `isVisible` tinyint(1) DEFAULT NULL,
  `likes` text COLLATE utf8mb4_bin DEFAULT NULL,
  `noLikes` text COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.player_armors
CREATE TABLE IF NOT EXISTS `player_armors` (
  `uuid` int(11) NOT NULL,
  `list` text DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.promocodes_new
CREATE TABLE IF NOT EXISTS `promocodes_new` (
  `promo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'changeit',
  `createdby` int(10) unsigned DEFAULT 0,
  `used` bigint(20) unsigned DEFAULT 0,
  `rewardreceived` bigint(20) unsigned DEFAULT 0,
  `rewardlimit` bigint(20) unsigned DEFAULT 0,
  `msg_r` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT 'Вы достигли первого уровня и успешно активировали бонус за промокод, приятной игры!',
  `money_r` int(10) unsigned DEFAULT 3000,
  `vip_r` tinyint(3) unsigned DEFAULT 0,
  `vipdays_r` smallint(5) unsigned DEFAULT 0,
  `items_r` varchar(4096) DEFAULT '[{"Data":"null","ID":10,"Type":10,"Count":3,"IsActive":false},{"Data":"null","ID":3,"Type":3,"Count":3,"IsActive":false}]',
  `don_r` double DEFAULT 0,
  `donlogin_r` varchar(50) DEFAULT NULL,
  `donated` bigint(20) DEFAULT 0,
  `donreceived` bigint(20) DEFAULT 0,
  PRIMARY KEY (`promo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.promo_timing
CREATE TABLE IF NOT EXISTS `promo_timing` (
  `id` int(11) NOT NULL,
  `promo` varchar(100) NOT NULL,
  `used` int(11) NOT NULL,
  `date` date NOT NULL,
  `added` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Author` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Question` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
  `Respondent` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Response` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `Opened` datetime NOT NULL,
  `Closed` datetime DEFAULT NULL,
  `Status` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.questschar
CREATE TABLE IF NOT EXISTS `questschar` (
  `q_auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `q_actor_name` varchar(42) NOT NULL,
  `q_line` smallint(6) NOT NULL,
  `q_status` tinyint(4) NOT NULL DEFAULT 0,
  `q_time` datetime NOT NULL DEFAULT current_timestamp(),
  `char_id` int(11) NOT NULL,
  `q_complete` tinyint(1) NOT NULL DEFAULT 0,
  `q_stage` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Сколько пройдено пунктов, нужно только для меню',
  `q_data` varchar(50) NOT NULL DEFAULT '[0,0,0]',
  `q_use` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Нуцжно для худа',
  PRIMARY KEY (`q_auto_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=836 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.refferals
CREATE TABLE IF NOT EXISTS `refferals` (
  `uuid` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `uuidref` int(11) DEFAULT NULL,
  `success` tinyint(1) DEFAULT 0,
  `cost` smallint(6) DEFAULT 0,
  `createdate` datetime DEFAULT NULL,
  `successdate` datetime DEFAULT NULL,
  `refcode` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.reports
CREATE TABLE IF NOT EXISTS `reports` (
  `reportId` int(11) NOT NULL AUTO_INCREMENT,
  `characterId` int(11) DEFAULT NULL,
  `dynamicId` int(11) DEFAULT -1,
  `text` varchar(9999) COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `opened` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `closed` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `adminId` int(11) DEFAULT -1,
  PRIMARY KEY (`reportId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.safes
CREATE TABLE IF NOT EXISTS `safes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minamount` int(11) NOT NULL,
  `maxamount` int(11) NOT NULL,
  `pos` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `rotation` float NOT NULL DEFAULT 0,
  `address` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для процедура main.SelectItemsData
DELIMITER //
CREATE PROCEDURE `SelectItemsData`(IN `in_data_id` VARCHAR(32))
BEGIN
	SELECT * FROM `items_data` WHERE `data_id` = in_data_id ORDER BY `slotId` ASC;
END//
DELIMITER ;

-- Дамп структуры для таблица main.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `hash` varchar(75) COLLATE utf8mb4_bin NOT NULL,
  `login` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `data` datetime NOT NULL,
  `oneTime` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`hash`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.ticketlog
CREATE TABLE IF NOT EXISTS `ticketlog` (
  `time` datetime DEFAULT NULL,
  `player` int(11) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `sum` int(11) DEFAULT NULL,
  `reason` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для процедура main.UpdateItemData
DELIMITER //
CREATE PROCEDURE `UpdateItemData`(IN `in_data_id` VARCHAR(32),
	IN `in_item_count` SMALLINT,
	IN `in_item_data` VARCHAR(46),
	IN `in_location` VARCHAR(24),
	IN `in_slotId` SMALLINT,
	IN `in_auto_id` INT)
    COMMENT 'Обновление инвентаря'
BEGIN
	UPDATE `items_data` SET `data_id` = in_data_id, `item_count` = in_item_count, `item_data` = in_item_data, `location` = in_location, `slotId` = in_slotId WHERE `auto_id` = in_auto_id LIMIT 1;
END//
DELIMITER ;

-- Дамп структуры для таблица main.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  `holder` varchar(256) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `health` int(11) NOT NULL,
  `fuel` int(11) NOT NULL DEFAULT 0,
  `components` varchar(2048) COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `position` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL,
  `rotation` varchar(80) COLLATE utf8mb4_bin DEFAULT NULL,
  `keynum` int(11) NOT NULL DEFAULT 0,
  `dirt` float NOT NULL DEFAULT 0,
  `tag` varchar(11) COLLATE utf8mb4_bin NOT NULL DEFAULT 'null',
  PRIMARY KEY (`auto_id`) USING BTREE,
  KEY `auto_id` (`auto_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.vehicleticket
CREATE TABLE IF NOT EXISTS `vehicleticket` (
  `autoId` int(11) NOT NULL AUTO_INCREMENT,
  `vehAutoId` int(11) NOT NULL DEFAULT 0,
  `vehNumber` varchar(15) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `holderAutoId` int(11) NOT NULL DEFAULT 0,
  `holderName` varchar(65) COLLATE utf8mb4_bin NOT NULL,
  `policAutoId` int(11) NOT NULL DEFAULT 0,
  `policName` varchar(65) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `text` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `link` varchar(150) COLLATE utf8mb4_bin NOT NULL,
  `time` datetime NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `isEvac` tinyint(1) NOT NULL DEFAULT 0,
  `toggled` tinyint(1) NOT NULL DEFAULT 0,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`autoId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.wars
CREATE TABLE IF NOT EXISTS `wars` (
  `id` smallint(6) DEFAULT NULL,
  `objectId` smallint(6) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `attackingId` smallint(6) DEFAULT NULL,
  `protectingId` smallint(6) DEFAULT NULL,
  `mapName` varchar(65) COLLATE utf8mb4_bin DEFAULT NULL,
  `mapId` smallint(6) DEFAULT NULL,
  `position` varchar(75) COLLATE utf8mb4_bin DEFAULT '{}',
  `range` float DEFAULT NULL,
  `gripType` tinyint(4) DEFAULT NULL,
  `composition` tinyint(4) DEFAULT NULL,
  `weaponsCategory` tinyint(4) DEFAULT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица main.weapons
CREATE TABLE IF NOT EXISTS `weapons` (
  `id` int(11) NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_bin DEFAULT NULL,
  `weapons` varchar(8192) COLLATE utf8mb4_bin DEFAULT NULL,
  `lastserial` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

