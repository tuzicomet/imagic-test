-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `ownerId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rhxwsjjauexawdufvwmbhjeewtfmiwhdichd` (`ownerId`),
  CONSTRAINT `fk_mrgglplrtstlqjieoyugjgjsvhrtyujdwpwz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rhxwsjjauexawdufvwmbhjeewtfmiwhdichd` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_zjxzbnvgjaedqtapdjwtcnautxarvrlfqvue` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_klqqukyiqtorvincfkjcsjkobmmwgkiyxbzj` (`dateRead`),
  KEY `fk_bgmvinrgbkllswitllbcrozwvdydxnganfts` (`pluginId`),
  CONSTRAINT `fk_bgmvinrgbkllswitllbcrozwvdydxnganfts` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wzbqbnziswmzqnwiulfcykjacyvxeyawxqfo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ezhespcfinywswyagxkhyllrhmebdnjhjiva` (`sessionId`,`volumeId`),
  KEY `idx_txqmtduadckojiszdyrhkdgqmcpqjqqstqse` (`volumeId`),
  CONSTRAINT `fk_hjolkdgjcctjekaqgvbataiztelhaowuupqx` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ikiudgczonmgrzleogxoctwhfocrwaquipxl` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gxvrajcbvhrqqyhzoyhkcpgwoypiseiitvuw` (`filename`,`folderId`),
  KEY `idx_fwamstdvzmxttbipggxsvsxsjzkxogmxvnvc` (`folderId`),
  KEY `idx_veuzcllobkjkecgntnrkgossdntdrrogiuug` (`volumeId`),
  KEY `fk_odzqfahfppnbthtiowyrwjodwztfhvdmucke` (`uploaderId`),
  CONSTRAINT `fk_beqfkfehtodizslwggtrpsrftcmjmrhyelun` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hlsnxlolnaxjbioeumzuiheibcwakzpgymxn` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_odzqfahfppnbthtiowyrwjodwztfhvdmucke` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rgdblbohxsktwxvwljuzfgxdztowyjvbyqxs` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cxbodsezbenkvbsyeoqwptwhuvehacyrebjy` (`groupId`),
  KEY `fk_dushpbhubigfoyrhkzibxhrenqdnkjylsowv` (`parentId`),
  CONSTRAINT `fk_dushpbhubigfoyrhkzibxhrenqdnkjylsowv` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vnnbiynodrznnamgxgonrnzbtjwzcftzqjmn` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yzlsgyyoeoaoojwhdvowtsfopqdkeyoismiv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zkdywsjpnvnribfqryyiudllqhlypetrcrhh` (`name`),
  KEY `idx_tdgamwwtupnzvjvpswdtqbosfywvpiiifmnz` (`handle`),
  KEY `idx_auhbsoegbfllghutajjgtgudnclqpnqjfpku` (`structureId`),
  KEY `idx_vyxbkdrvytkzcyezxrszlsezgiludcxhverz` (`fieldLayoutId`),
  KEY `idx_ttduzejpfhuavgdbvknfnlhztxmivmpnvbhi` (`dateDeleted`),
  CONSTRAINT `fk_xahrjpzbyowkvewnphcyxjlcjnbjjeusqqbc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xvjcviaejceqnvavmjdxphxwwqmywuxwdoos` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lxjjdjzeksrnmrergfjtwuchqjayirmxkcrm` (`groupId`,`siteId`),
  KEY `idx_zbmcalxccimawoiqametkfdhacnmwlmxpfsd` (`siteId`),
  CONSTRAINT `fk_suqazvfmuuophrweswjzmgveynmdzvhjhyzj` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yfjwuksgfdnephqynbdssqgtrdglooyjuiun` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_pmcogczaynegzkgvhpmhqugrjkflzbsmskyb` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_tacrtmzuqqkgwrieqnhnjnukleotymyaftar` (`siteId`),
  KEY `fk_ovsblnxlobstiyvsrxpjxhqizptgquxrmyhe` (`userId`),
  CONSTRAINT `fk_cmobuvcspivjbjaroftpuqrdvedtbwkcopth` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ovsblnxlobstiyvsrxpjxhqizptgquxrmyhe` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_tacrtmzuqqkgwrieqnhnjnukleotymyaftar` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_uixxviuntcztdqpxprqryasfazrtarljfoxi` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_osvfrvyvgjuydivsijpcrvdmcnpyfaeoshyw` (`siteId`),
  KEY `fk_tojhzczfpjrnzlobuqqvzbkqbbbxjyxciznh` (`fieldId`),
  KEY `fk_tijbshysizvzvmtghtsmqrwujfxtekqenhmi` (`userId`),
  CONSTRAINT `fk_osvfrvyvgjuydivsijpcrvdmcnpyfaeoshyw` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sdqdddxxsvztbtnmxayugacgdynldqiczrdx` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tijbshysizvzvmtghtsmqrwujfxtekqenhmi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_tojhzczfpjrnzlobuqqvzbkqbbbxjyxciznh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qksjashtpfbegkyjbtzymgloszailqcytfhu` (`elementId`,`siteId`),
  KEY `idx_fsueeekfnkbyycxccsgtjpfuuljzoymxdnts` (`siteId`),
  KEY `idx_sqknrqulikoupvskmfurhstmthlwtoerdvrl` (`title`),
  CONSTRAINT `fk_pynfjftbrgfexvxobhxnwydgqjatrkakxmmw` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xvrpdckhbdgszgpqkpfmgkcwkskyppbcjjwr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_xtmjrhpqykpuzogotqxakcfdqrowpuludufq` (`userId`),
  CONSTRAINT `fk_xtmjrhpqykpuzogotqxakcfdqrowpuludufq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zlnloxtbnykwjwxvotyggpcauzwbgxqbcqcr` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_zxfgzkpjuktfawrruaizjxbijyrrcohodljy` (`creatorId`,`provisional`),
  KEY `idx_ocsbfwyqjrzqtfatalfozhsimrlakfzjzely` (`saved`),
  KEY `fk_grleufxsacvnkhmjocfpimpzhphjfuflqifb` (`canonicalId`),
  CONSTRAINT `fk_grleufxsacvnkhmjocfpimpzhphjfuflqifb` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pmwjmupoyabcumsiotfypvufowxezkabvngw` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_xalobsvpctwrmhtpwuirzeqpevdgftxsvhps` (`elementId`,`timestamp`,`userId`),
  KEY `fk_rzvkgnnjngcggxxykrsgxrtnntdjimuwmygq` (`userId`),
  KEY `fk_gsrviadbvyqbksmpmfsayaygvfadiokfvwls` (`siteId`),
  KEY `fk_izngujzbiwdimkkwzkqsnlhdbdzpjvxleaay` (`draftId`),
  CONSTRAINT `fk_gsrviadbvyqbksmpmfsayaygvfadiokfvwls` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_izngujzbiwdimkkwzkqsnlhdbdzpjvxleaay` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jylyeitbamwqkgraqjwtrilxfwjzobfnspxo` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rzvkgnnjngcggxxykrsgxrtnntdjimuwmygq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cejsohvsxahfpryltaakczpeqhjugkvpkyhe` (`dateDeleted`),
  KEY `idx_ggjecssexgevdnvgszmydhtmytzfhdxbpnnm` (`fieldLayoutId`),
  KEY `idx_rnrquhuinskqwbvtvcvyiilfgnjltvjudljn` (`type`),
  KEY `idx_gajgfyfyoryaioyedudolvyarknanaqpgvtb` (`enabled`),
  KEY `idx_cipgimsnazvxmzkghfndbcoejmclmlvmypwa` (`canonicalId`),
  KEY `idx_xydrsoefolzmlifucnrigrscfxsfwsgmijhp` (`archived`,`dateCreated`),
  KEY `idx_mzzxvdauflaclctlgweyjtfaennxdmtawmwv` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_gkdqbuaxtnnkswspwotrmivvdgfojdvxeuib` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_hygskpdtwirnxfaewkhhhdpbdxxqlvlepkty` (`draftId`),
  KEY `fk_liqwaqjrzhxptdqxvoneblxafeujbzyujskn` (`revisionId`),
  CONSTRAINT `fk_hygskpdtwirnxfaewkhhhdpbdxxqlvlepkty` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jmdsmlkmjgmthfntktcrcqchnvowzknhckgf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_liqwaqjrzhxptdqxvoneblxafeujbzyujskn` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ytqkatminchahygsxvsshwkebnscfqjmgjih` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tunumhjziiyyuhzepxyhomyjrzrgmujbmdji` (`elementId`,`siteId`),
  KEY `idx_ljcnblyideywzkgaaerjwlyhofasyjtdzqbn` (`siteId`),
  KEY `idx_xfsbatvxwolaybpijtgeokdmfuxedfsdynhd` (`slug`,`siteId`),
  KEY `idx_jyllonbextafkchjszwwmlqpsndomiyfhspx` (`enabled`),
  KEY `idx_ujwsvsqqgqcratbuolbtgdoblamusxrtkuhy` (`uri`,`siteId`),
  CONSTRAINT `fk_tohozqkgwylcworxjcvdiiapgsektwdqfpmy` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xhzptfywccgfxyuekblhysrafvruypbczmoy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dqxhvnpwadwqdhfwkclznxoikojqxaoodahf` (`postDate`),
  KEY `idx_odiijrianzvsyansvzqhknrvverpboikmllw` (`expiryDate`),
  KEY `idx_dzoryxlmfbobmyihpvudwxvowjqpcyaihdpj` (`authorId`),
  KEY `idx_jgicvgfrlfiheouajichdfrsqufevuueufft` (`sectionId`),
  KEY `idx_kkwhkhfxwxdekkhzxnybmwrymjfxzhzsveei` (`typeId`),
  KEY `fk_fwpwyatfgprjmztwdgkmzworhrhcmgncaijz` (`parentId`),
  CONSTRAINT `fk_dggdiqhnofhpcocpzqkujfbumbpazxnnoyoj` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fwpwyatfgprjmztwdgkmzworhrhcmgncaijz` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sxnjnjfdznucjwzsavjkvltygrucdnxhzhqy` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wfnqjkyszycrsctxpubqvclowrliewtuutlz` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zpvbnyqhawuogywrkblbmmdoynatxmapgrrk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wtpmptikxutfzssvubiwrmpinwtfiaqnlgun` (`name`,`sectionId`),
  KEY `idx_xdcbdluzvwijpkxumcxveukxwzvoeaprvspe` (`handle`,`sectionId`),
  KEY `idx_qbfxibakahvzocvwocceyrexzmeocbzxevqv` (`sectionId`),
  KEY `idx_hjumlyqkfdckbrrjvhkdxywvmurpkyluohxx` (`fieldLayoutId`),
  KEY `idx_aywniuvheeytqradijcrsgirbondgrqtmgqe` (`dateDeleted`),
  CONSTRAINT `fk_dlzlpylywkiqkqblprdahbtxnypsuwtjpldx` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zsdpuhwwhznswjsbtzgdxahlwmqrqngfyrbn` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_otqffnbphnpmjhcldlihnaehybtnxcpgkvhp` (`name`),
  KEY `idx_ymbpblepfgukpkqpwpzwylixjbgmyjgxqhrh` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mdjzvosjfrrqoybvnzguhjdxumhlcfotzhgr` (`layoutId`,`fieldId`),
  KEY `idx_iyoojcjpzmkumrzfongliqidwliskbuvmnmq` (`sortOrder`),
  KEY `idx_fcscyuduvyiqpcimzxpgklejqjqxxvsozuwh` (`tabId`),
  KEY `idx_ixshbhapzydknoyigegmowekivgtdabvexwy` (`fieldId`),
  CONSTRAINT `fk_gydsedvotiaymektnrnsyiiplzawpicwwvmh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uzuianlllntttzwdhtqujbbsevlrcrsltcwo` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xyacalauixfjcmqexocvagkqfetjgexxjxct` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zmwavxdmbmkvedetmyhnnyndcjkgppkrvlkh` (`dateDeleted`),
  KEY `idx_vxdtustdyorxaahjxfclddbjdunlehropcnm` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text,
  `elements` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qgsquydhtoiudcmtdvnupsqqgzqoyiqqjaml` (`sortOrder`),
  KEY `idx_xcgmyquxhbxwxecspbktwgphkxwirdkjaymn` (`layoutId`),
  CONSTRAINT `fk_ombzxzgcnltiohjoacedjyuaobkoyydwrvmg` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uyscegfxggdxplphdsavhsdrknaxqcuypens` (`handle`,`context`),
  KEY `idx_ezucwbbwowumapcuftrrrgcioohscssphmkl` (`groupId`),
  KEY `idx_lyyrhaazpabznuebzwwpbiwwemstmnzhdacz` (`context`),
  CONSTRAINT `fk_qgljwtzbfckjrrxaizlmvlavpjqdmagufcdn` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qbshhvxhsqiizwkqoqruvxlvjfjnttrnqzav` (`name`),
  KEY `idx_aasssnbtnwalandshhzzsdegjoufthxypwed` (`handle`),
  KEY `idx_wrvitxtxpquihiyewslulhgmvbiatjlcrtdk` (`fieldLayoutId`),
  KEY `idx_sgychuhtudsqepwgetwncbnjpajjabbycdcg` (`sortOrder`),
  CONSTRAINT `fk_fcaalrahmsvnnrxqyyjyprrdaishszihvimx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vtcnjxijbmhpffubvyhhguesiwsgzwnnctli` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qdnwipebgojdzrjdpfmlfbpozweojmuvvzxl` (`accessToken`),
  UNIQUE KEY `idx_hudrodweuobcgsdqqqwsrpresrladedcslfc` (`name`),
  KEY `fk_buveadqemxsixhrnwqstqjajpqzlrowlddup` (`schemaId`),
  CONSTRAINT `fk_buveadqemxsixhrnwqstqjajpqzlrowlddup` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ccrcredgikeatcyzngagjefmhcktxjbwebmd` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_loyzecqybxhohumhdboebehcucriwrqlpxdw` (`name`),
  KEY `idx_mrfjpmupqavvspclqxthtdnooagufbqmgzzz` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pdadoqgwktfvxknkwmoktbxcbwmdovmjrlkx` (`primaryOwnerId`),
  KEY `idx_qdwhypdvjpgpxgmycxljqqoriwopblbnbcfd` (`fieldId`),
  KEY `idx_bpsxsagmkrfojfvrgovdbucatxzehjnyfrhz` (`typeId`),
  CONSTRAINT `fk_ayxgxpnqdgfdhnzjscvaolqkpggqbfkcyjgz` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_edulvvwtnzvhtsqjbooqktpyfycymvtixvvv` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kikauxudusgnbkamklbithiyufiacuuxejhe` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kygparudybbsuguzrlckkttbaijhvybrlqpm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_mokabakailtgeqidplunqvmcouksxefrybxw` (`ownerId`),
  CONSTRAINT `fk_kxzkcwevmhyoihcuhdjvgzjaftswotetnqwo` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mokabakailtgeqidplunqvmcouksxefrybxw` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hfucizdwalonghnzovvuvwygxswanzagokwk` (`name`,`fieldId`),
  KEY `idx_pbkvalkafhtjozqbzijchcugoowanogtjcwr` (`handle`,`fieldId`),
  KEY `idx_ocxtfenolxhxafehkvvkujvkvjjltozoisnq` (`fieldId`),
  KEY `idx_nrjznnlgvktvoqnayprxsavcpazfqsfcnlwb` (`fieldLayoutId`),
  CONSTRAINT `fk_lrfaamydoyhpmthmjcwxovwbnphwnbpfknhk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qjtflodweqekeigbikqsfdivxccufdgafcnk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rsisyrmtxuoxwthpgldghcnxferhtucnimqv` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_seinkzqosrytjeomgbjbbfqxsiifnerwflus` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_njcpgavnlgfhechmgsyhdtfbpalqngvpkkic` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_lczlkifgbtfvclkmxzdtvqerkstvqesrrzzw` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_erblxalultrzldgawhbyeeuyihhaiyghhcqi` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_ygxoqtulsmusikuhofxnayovkfjwcoiabypd` (`sourceId`),
  KEY `idx_qujutlrtjdfukjsdwkmnjqnhskbeueldrxme` (`targetId`),
  KEY `idx_nuturgqcsijvcswskaihkslxvhgjqwedbumc` (`sourceSiteId`),
  CONSTRAINT `fk_pmjoalytrxdjkauaechadofjhusrktrnbyfq` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vqsydvepslleknfjziijtmmzkqiyojfremmp` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zncjoudpwtbdiqhlmgtdgxegppbisslyxygy` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_klrleysgnmyitsnsqdbcmxaslbpvkpjpmtop` (`canonicalId`,`num`),
  KEY `fk_agkybvxvzxgzwfuqiybajatzefmfmjkjfhjo` (`creatorId`),
  CONSTRAINT `fk_agkybvxvzxgzwfuqiybajatzefmfmjkjfhjo` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zlulbksxgnlneopgghfuaqwmelxgdwrslfec` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_vxpwgisncjdulcveepvuphgxxrwdzbapbtvw` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ygzcjjhdzzuabnhqzojfdybpoqwdhdslmwro` (`handle`),
  KEY `idx_yexwltwnvtiukzxrhpxvitzfakuyxaouubqx` (`name`),
  KEY `idx_otyflhuhjjkituxeckwlierwddsfrswottzj` (`structureId`),
  KEY `idx_vtsxixixlxozyxbvdmqsfhyiapvwpehcbxpi` (`dateDeleted`),
  CONSTRAINT `fk_qcvmrqwnbkxbrstqnphvmdspastrvoqdymba` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cgkcjkpdrzjbswhubeajuxdkouylbvgwztix` (`sectionId`,`siteId`),
  KEY `idx_irpxxpkoaldprfaoocjsekcpkiypfvbvqzyc` (`siteId`),
  CONSTRAINT `fk_bfwdfthqcrlchriosmxtnxqxzoxfaikzkthf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bnchrhgfhxlsjnpgfriejnyxihkndsuqunii` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uwyqthualroxydarryrlkigjyfqudvovemwj` (`uid`),
  KEY `idx_dsjusqwncnrlzjwcxjzjrfiuexynjatvqlvk` (`token`),
  KEY `idx_xonchknzxffhpybkkkqrmbkcajnnytiyjfyu` (`dateUpdated`),
  KEY `idx_kpnwsmvolbxlvtxsckpeedghvqapvxcqryxl` (`userId`),
  CONSTRAINT `fk_jdiyebrklpwbtymltbbhnkqwaxvogyrumozc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_boyfcxptvogexgcdfuxweldbeycnmgiebbdk` (`userId`,`message`),
  CONSTRAINT `fk_vuxznqudznathdtiihieaptmjldwyydwyork` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iyvafcmhpilkemwgsgigzbadkcojeszplddg` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cjnoarehdmhfrukwoflihlbuasiryqlycawu` (`dateDeleted`),
  KEY `idx_jxvvqyiurxccrskmlrkhwtztnppxfyxbefhd` (`handle`),
  KEY `idx_rsommzhthcpxpqndzkglgxmmgqzdnqvzpcbw` (`sortOrder`),
  KEY `fk_pnovzgzwcshuykwitnrtppkvpwgglzvdbndv` (`groupId`),
  CONSTRAINT `fk_pnovzgzwcshuykwitnrtppkvpwgglzvdbndv` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ojhwpgzfvxohxdfylphrtcmlvzrrcfuyeykj` (`structureId`,`elementId`),
  KEY `idx_zmjccialpjweoshaiqvnnmbdsoztrpfkxxtg` (`root`),
  KEY `idx_xvnhhkdlsbptkfsdjondvgydhimwaljhjgkx` (`lft`),
  KEY `idx_sybrgipirwwesnjykpserpejhazgheqfmxkj` (`rgt`),
  KEY `idx_tcyeuoklxuzmsakrbjlehzjvvtfoxuitfikq` (`level`),
  KEY `idx_sfmyfqfclwyzkstcrmkbsirhsmquvwbhovui` (`elementId`),
  CONSTRAINT `fk_hnhynyilagtlagkaelrriexjzcxgkcmtvobf` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qodtkeswtthbfmountoxaiectbxkljqumvwz` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tjvatdybguzvigydkcrrgaffeksebisedcwb` (`key`,`language`),
  KEY `idx_pvgtmhwfmyyioeczinhkuvbgadrahndjfglg` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ptttbiruxvzrntonpyljfyteykzoegyszenr` (`name`),
  KEY `idx_fhthgyinnsfkcvhpquykgfjaonqjzyalfldk` (`handle`),
  KEY `idx_qnhogtqefdxkbytepvftxpvsjkvsfnnbjerf` (`dateDeleted`),
  KEY `fk_neosrthskadmobiccxinerhmigqptqojxsou` (`fieldLayoutId`),
  CONSTRAINT `fk_neosrthskadmobiccxinerhmigqptqojxsou` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tkbwjoleacdvndjeogztgybjsvswfybgttze` (`groupId`),
  CONSTRAINT `fk_leetqqfzkiqnqffozeointknsylmeziiwnse` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qpcbewbcbwuqyorrmdesflxbkswiaykpwmcf` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nzwqioqxjyxelibanxgvlpcdyofbemxudlwu` (`token`),
  KEY `idx_fnokqcxkyqwaasjjlobxmpbxzqvtoqenmrfy` (`expiryDate`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yintnvpxnslcpzfzbfqzggtlyzccewuqsysl` (`handle`),
  KEY `idx_nqggvejlkrwijlgjtuuhrssgxtzhukibgzdr` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hamdmmhmurjprufeqmfshjcthilsrlanfavk` (`groupId`,`userId`),
  KEY `idx_duojpipapvrhdcmtjhqmppbuqlgeageajhrd` (`userId`),
  CONSTRAINT `fk_apopprsrspdgozyyoquccxwcgvaxdzovedff` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lvbrcjfnzcivbmdtqjkcndxuartwfcfebiei` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nxfmxnlyubxjgcmxajvugweqhqfxadrpmdvm` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_miwmxbcqkwhkzvjpztsnhdnpqbqhjqeauzdj` (`permissionId`,`groupId`),
  KEY `idx_bjgofgsgybnrtianhqzmvrakivnxxnfhfvnq` (`groupId`),
  CONSTRAINT `fk_oqbxuwrellydsexkfhxqsekuqlboslcybqij` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tdhbzilbgdswoiragtgspwhsskxmenqfxtyf` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ciirslvlzubxfzswmaqaasmwwanrviqqxsbd` (`permissionId`,`userId`),
  KEY `idx_vfilrsfwqkecvikhunwjjrglrnnzfycbxyjv` (`userId`),
  CONSTRAINT `fk_gzlxgbddtpqjepcjsiphtkhzozpjkbjkurnt` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_shgdqflsqnqjeymjoaxesroddhdpgnwltvep` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_hfizytiadceakbdyoxwprfexhqeuslpufful` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ixmbejputslhxcdxsrrqjimlsurpkbqrtyxa` (`active`),
  KEY `idx_vnaqsoefglmmochjxguqyshwrritsebdlfln` (`locked`),
  KEY `idx_hizvhwkjnzfnkrpcfvmuowquenhfyfhwggxt` (`pending`),
  KEY `idx_lzjllewafgvyhcmzwtrfpxzjeqziqavqxdzb` (`suspended`),
  KEY `idx_uvqdwgzfssnpruvvmmadfzzjbszemxgntsty` (`verificationCode`),
  KEY `idx_pjkekkmgxcolqlutqqurxzxkjvyfwflmxzdq` (`email`),
  KEY `idx_hyxzkfizojabngravyshccpsjblrjsimynyb` (`username`),
  KEY `fk_juamcdgmtqlkhdxoqoroaeccmvpfvbnvqbdw` (`photoId`),
  CONSTRAINT `fk_duzlttbdzxscbwktivaqvieybsdgextejdwt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_juamcdgmtqlkhdxoqoroaeccmvpfvbnvqbdw` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mopuqowysutacngpigtatncbmvawlwkouvrf` (`name`,`parentId`,`volumeId`),
  KEY `idx_foxovwcahvxawbssrygruhlikisuygxhgjzf` (`parentId`),
  KEY `idx_fcszcynxwcdusmvzyegqkxhevfyrcggjscnd` (`volumeId`),
  CONSTRAINT `fk_hhdhwjxainqpaccqkyuomfrrrqjdrbavygdp` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uwcppvyhkeieipvgzvdlidpkqtliphvbsowt` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zauvasmcpethovyzqtajgftcewgtqwhrszys` (`name`),
  KEY `idx_kqmwnuoejfzsywarkgnjqukecutlszxkdrto` (`handle`),
  KEY `idx_igxbueypbvupabldivrsxlqfzoossxkqxiuk` (`fieldLayoutId`),
  KEY `idx_smdexddvoheumwzlzuejwroqkrwvclzfnzrq` (`dateDeleted`),
  CONSTRAINT `fk_lrieaprzxfkmzvgekrumxaefzgfbmtqjmzvq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yemamsblunjrtpdzkpsbpfsxjtpprkqnywyq` (`userId`),
  CONSTRAINT `fk_nzfmhaptomgcclgpemttzpwnrnkfmgqhyqnn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-27  4:07:58
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (7,1,1,1,'duckbath.jpg','image',NULL,3555,1920,445435,NULL,NULL,NULL,'2024-08-27 02:51:04','2024-08-27 02:51:04','2024-08-27 02:51:04'),(11,1,1,1,'sanaPeace.jpg','image',NULL,1200,801,142335,NULL,NULL,NULL,'2024-08-27 03:09:48','2024-08-27 03:09:48','2024-08-27 03:09:48'),(13,1,1,1,'db59509e2341749852721be2b1cd2707.jpg','image',NULL,878,1200,168018,NULL,NULL,NULL,'2024-08-27 03:09:53','2024-08-27 03:09:53','2024-08-27 03:09:53'),(14,1,1,1,'goat.jpg','image',NULL,2992,4000,191080,NULL,NULL,NULL,'2024-08-27 03:10:05','2024-08-27 03:10:05','2024-08-27 03:10:05'),(15,1,1,1,'snapback.png','image',NULL,2736,1824,167364,NULL,NULL,NULL,'2024-08-27 03:10:20','2024-08-27 03:10:20','2024-08-27 03:10:20'),(18,1,1,1,'IMG_20221214_005409.png','image',NULL,3925,2516,6501793,NULL,NULL,NULL,'2024-08-27 03:57:01','2024-08-27 03:57:02','2024-08-27 03:57:02'),(19,1,1,1,'COMET.png','image',NULL,4000,1600,407401,NULL,NULL,NULL,'2024-08-27 03:57:14','2024-08-27 03:57:14','2024-08-27 03:57:14'),(23,1,1,1,'IMG_20221214_005409_2024-08-27-035947_kkwa.png','image',NULL,3925,2516,6501793,NULL,NULL,NULL,'2024-08-27 03:59:51','2024-08-27 03:59:51','2024-08-27 03:59:51');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,1,'2024-08-27 02:55:36',0,1),(2,1,2,'2024-08-27 03:59:54',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2024-08-27 01:31:09','2024-08-27 01:31:09','f50f3006-928e-484b-8f3a-57f6f3e0bfc4'),(2,2,1,'Landing Page','2024-08-27 02:33:20','2024-08-27 04:04:06','97ee3ecd-b344-4bf2-9d54-f6c5504c82c7'),(3,3,1,'Landing Page','2024-08-27 02:33:20','2024-08-27 02:33:20','7c69fa63-194c-441e-8ffd-5ef5d7e4fe83'),(4,4,1,'Landing Page','2024-08-27 02:37:27','2024-08-27 02:37:27','54522762-2ba0-4751-acb0-c4e48a6d38bb'),(5,5,1,'Landing Page','2024-08-27 02:41:21','2024-08-27 02:41:21','9b3b3111-d84a-4abc-8fe7-657a04f2a0ef'),(6,6,1,'Landing Page','2024-08-27 02:41:43','2024-08-27 02:41:43','5dae0340-3808-417c-9eb0-8163568532fa'),(7,7,1,'Duckbath','2024-08-27 02:51:02','2024-08-27 02:51:02','b314e43b-43d8-4653-b34b-1fd3e74b46b3'),(9,9,1,'Landing Page','2024-08-27 02:55:36','2024-08-27 02:55:36','e8f8163a-4bef-4538-84ff-0527f2887221'),(10,10,1,'Landing Page','2024-08-27 02:57:58','2024-08-27 02:57:58','341d8c20-32af-4b8e-99e5-5511d37b44bc'),(11,11,1,'Sana Peace','2024-08-27 03:09:48','2024-08-27 03:09:48','6e380b27-2e0e-475b-92da-9598829bbae9'),(13,13,1,'Db59509e2341749852721be2b1cd2707','2024-08-27 03:09:53','2024-08-27 03:09:53','e62fdba4-518e-4de5-a98c-63d2174f5081'),(14,14,1,'Goat','2024-08-27 03:10:03','2024-08-27 03:10:03','313197ea-70eb-473b-ac9c-2414184ef4c5'),(15,15,1,'Snapback','2024-08-27 03:10:18','2024-08-27 03:10:18','d8d705fe-0513-4a94-b468-dedcd8936171'),(16,16,1,'Landing Page','2024-08-27 03:10:34','2024-08-27 03:10:34','39963d2a-a3f9-44a6-b7af-08a8d7cc0741'),(18,18,1,'IMG 20221214 005409','2024-08-27 03:56:58','2024-08-27 03:56:58','f6a8cc84-84d4-469b-a99f-21f8b8f64fbb'),(19,19,1,'COMET','2024-08-27 03:57:12','2024-08-27 03:57:12','ab99eea2-8d23-447a-84c7-608babd3a088'),(20,20,1,'Landing Page','2024-08-27 03:57:17','2024-08-27 03:57:17','c7709697-2234-48d4-ad8e-98ce0c37ae18'),(21,21,1,'Landing Page','2024-08-27 03:58:05','2024-08-27 03:58:05','10ee9e12-9706-4ed4-8cd4-09e20aca649c'),(23,23,1,'IMG 20221214 005409','2024-08-27 03:59:48','2024-08-27 03:59:48','ae3e478c-499c-44e7-a93b-404b7e3c2ed2'),(24,24,1,'Landing Page','2024-08-27 03:59:54','2024-08-27 03:59:54','3902b61c-9201-4823-806e-185c743503a2'),(25,25,1,'Landing Page','2024-08-27 04:04:06','2024-08-27 04:04:06','487323c0-bd46-44ca-8353-aca1df946d5c');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (2,1,1,NULL,'edit','2024-08-27 03:59:52'),(2,1,1,NULL,'save','2024-08-27 04:04:06');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2024-08-27 01:31:09','2024-08-27 01:31:09',NULL,NULL,'496b80bd-b270-45b4-9997-5bda582d9320'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-08-27 02:33:20','2024-08-27 04:04:06',NULL,NULL,'cbcd08c6-3ac2-401b-b733-beabc528ea50'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2024-08-27 02:33:20','2024-08-27 02:33:20',NULL,NULL,'e17c7105-5831-4add-abc1-4a5f14381e76'),(4,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2024-08-27 02:37:27','2024-08-27 02:37:27',NULL,NULL,'432617e8-62ff-48b9-ae78-f7af04f8bd92'),(5,2,NULL,3,1,'craft\\elements\\Entry',1,0,'2024-08-27 02:41:21','2024-08-27 02:41:21',NULL,NULL,'ca293551-0096-408d-98ff-c123c21dccd6'),(6,2,NULL,4,1,'craft\\elements\\Entry',1,0,'2024-08-27 02:41:43','2024-08-27 02:41:43',NULL,NULL,'758ca832-0d76-481c-9fcf-dc4ee4792c74'),(7,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-08-27 02:51:02','2024-08-27 02:51:02',NULL,NULL,'52a51641-3f43-491b-844d-474c2a8505da'),(9,2,NULL,5,1,'craft\\elements\\Entry',1,0,'2024-08-27 02:55:36','2024-08-27 02:55:36',NULL,NULL,'4c95b79b-efdb-4dd0-ac56-3bac65712d8e'),(10,2,NULL,6,1,'craft\\elements\\Entry',1,0,'2024-08-27 02:57:58','2024-08-27 02:57:58',NULL,NULL,'b2bbc1cb-7aae-4c94-b86f-b6649df772d2'),(11,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-08-27 03:09:48','2024-08-27 03:09:48',NULL,NULL,'2072c3d1-d59c-4cca-bfed-28699eb1a059'),(13,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-08-27 03:09:53','2024-08-27 03:09:53',NULL,NULL,'19593ec0-7c6b-44e6-85c1-8fc534a5fdec'),(14,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-08-27 03:10:03','2024-08-27 03:10:03',NULL,NULL,'9836dc1d-84e6-4e16-ba49-089a342d48e1'),(15,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-08-27 03:10:18','2024-08-27 03:10:18',NULL,NULL,'f4f4c1c1-37d3-4dee-9af0-261b576ad732'),(16,2,NULL,7,1,'craft\\elements\\Entry',1,0,'2024-08-27 03:10:34','2024-08-27 03:10:34',NULL,NULL,'b45e87cf-1da5-424d-9d0c-da741384fe07'),(18,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-08-27 03:56:58','2024-08-27 03:56:58',NULL,NULL,'79d4a949-c57a-444c-b6c1-20b67f23a0c6'),(19,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-08-27 03:57:12','2024-08-27 03:57:12',NULL,NULL,'55b1a862-9ff8-484c-babf-e71a42cb0b18'),(20,2,NULL,8,1,'craft\\elements\\Entry',1,0,'2024-08-27 03:57:16','2024-08-27 03:57:17',NULL,NULL,'72015169-d396-43d2-975c-7e220e82aa4e'),(21,2,NULL,9,1,'craft\\elements\\Entry',1,0,'2024-08-27 03:58:05','2024-08-27 03:58:05',NULL,NULL,'41afbff5-05ff-4d94-b6fb-8fe6c458df04'),(23,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2024-08-27 03:59:47','2024-08-27 03:59:47',NULL,NULL,'21b1b34a-49ff-40ec-b6e1-6e1c3b7349e3'),(24,2,NULL,10,1,'craft\\elements\\Entry',1,0,'2024-08-27 03:59:53','2024-08-27 03:59:54',NULL,NULL,'252d0921-fd78-4779-9c77-94b2fbd11889'),(25,2,NULL,11,1,'craft\\elements\\Entry',1,0,'2024-08-27 04:04:06','2024-08-27 04:04:06',NULL,NULL,'7b38e618-9dca-43d2-a62a-71fed82c1b2b');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2024-08-27 01:31:09','2024-08-27 01:31:09','2199de19-e37e-46b1-9549-540fb258ed90'),(2,2,1,'landing-page','__home__',1,'2024-08-27 02:33:20','2024-08-27 02:33:20','eb2facda-8825-416d-ae8f-d84cb248fb34'),(3,3,1,'landing-page','__home__',1,'2024-08-27 02:33:20','2024-08-27 02:33:20','a9838b2d-2adc-49b0-af36-74c79720610a'),(4,4,1,'landing-page','__home__',1,'2024-08-27 02:37:27','2024-08-27 02:37:27','94c716d5-0986-4280-a8bf-b5d2ba32fa39'),(5,5,1,'landing-page','__home__',1,'2024-08-27 02:41:21','2024-08-27 02:41:21','cb9c23e6-d50b-493b-8bb4-bb2e1228cffc'),(6,6,1,'landing-page','__home__',1,'2024-08-27 02:41:43','2024-08-27 02:41:43','1a8f2897-a615-4e96-897f-64a3d0a6444a'),(7,7,1,NULL,NULL,1,'2024-08-27 02:51:02','2024-08-27 02:51:02','fdefd4bc-7979-4851-95b8-a0ccacfeb54e'),(9,9,1,'landing-page','__home__',1,'2024-08-27 02:55:36','2024-08-27 02:55:36','7926d5c9-74fb-4384-8e7f-4bf2372abcee'),(10,10,1,'landing-page','__home__',1,'2024-08-27 02:57:58','2024-08-27 02:57:58','99b2c01c-b66a-40e2-88e2-315afe002b50'),(11,11,1,NULL,NULL,1,'2024-08-27 03:09:48','2024-08-27 03:09:48','269a729a-4eb1-49e0-81d4-c69c00ca3b60'),(13,13,1,NULL,NULL,1,'2024-08-27 03:09:53','2024-08-27 03:09:53','b208ca6e-0414-40f2-9537-930e35fdd6df'),(14,14,1,NULL,NULL,1,'2024-08-27 03:10:03','2024-08-27 03:10:03','875895d1-abd1-498a-b2d0-0b7541b229cf'),(15,15,1,NULL,NULL,1,'2024-08-27 03:10:18','2024-08-27 03:10:18','6d315fe9-a821-406a-8f2f-9e51a8765706'),(16,16,1,'landing-page','__home__',1,'2024-08-27 03:10:34','2024-08-27 03:10:34','dfcf5ab9-dcdf-48c1-a08d-3e516f460888'),(18,18,1,NULL,NULL,1,'2024-08-27 03:56:58','2024-08-27 03:56:58','2fe98bb2-c027-47e4-abcb-7743a059be83'),(19,19,1,NULL,NULL,1,'2024-08-27 03:57:12','2024-08-27 03:57:12','d6a65c81-8b68-463d-88b4-979b120b82b6'),(20,20,1,'landing-page','__home__',1,'2024-08-27 03:57:17','2024-08-27 03:57:17','b95b4bcc-8d64-4f09-b8d1-97412e120e37'),(21,21,1,'landing-page','__home__',1,'2024-08-27 03:58:05','2024-08-27 03:58:05','55b5c8cb-4d3e-4d06-839e-75f67f08faac'),(23,23,1,NULL,NULL,1,'2024-08-27 03:59:47','2024-08-27 03:59:47','2da6cf2b-c71c-4d24-aee6-8f2f66d49f1c'),(24,24,1,'landing-page','__home__',1,'2024-08-27 03:59:54','2024-08-27 03:59:54','5f2ff225-5314-41e8-9611-dfee88dbf4bc'),(25,25,1,'landing-page','__home__',1,'2024-08-27 04:04:06','2024-08-27 04:04:06','cb41c16b-c38f-4516-9a51-5b7dacec02c0');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,1,NULL,'2024-08-27 02:33:00',NULL,NULL,'2024-08-27 02:33:20','2024-08-27 02:33:20'),(3,1,NULL,1,NULL,'2024-08-27 02:33:00',NULL,NULL,'2024-08-27 02:33:20','2024-08-27 02:33:20'),(4,1,NULL,1,NULL,'2024-08-27 02:33:00',NULL,NULL,'2024-08-27 02:37:27','2024-08-27 02:37:27'),(5,1,NULL,1,NULL,'2024-08-27 02:33:00',NULL,NULL,'2024-08-27 02:41:21','2024-08-27 02:41:21'),(6,1,NULL,1,NULL,'2024-08-27 02:33:00',NULL,NULL,'2024-08-27 02:41:43','2024-08-27 02:41:43'),(9,1,NULL,1,NULL,'2024-08-27 02:33:00',NULL,NULL,'2024-08-27 02:55:36','2024-08-27 02:55:36'),(10,1,NULL,1,NULL,'2024-08-27 02:33:00',NULL,NULL,'2024-08-27 02:57:58','2024-08-27 02:57:58'),(16,1,NULL,1,NULL,'2024-08-27 02:33:00',NULL,NULL,'2024-08-27 03:10:34','2024-08-27 03:10:34'),(20,1,NULL,1,NULL,'2024-08-27 02:33:00',NULL,NULL,'2024-08-27 03:57:17','2024-08-27 03:57:17'),(21,1,NULL,1,NULL,'2024-08-27 02:33:00',NULL,NULL,'2024-08-27 03:58:05','2024-08-27 03:58:05'),(24,1,NULL,1,NULL,'2024-08-27 02:33:00',NULL,NULL,'2024-08-27 03:59:54','2024-08-27 03:59:54'),(25,1,NULL,1,NULL,'2024-08-27 02:33:00',NULL,NULL,'2024-08-27 04:04:06','2024-08-27 04:04:06');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,1,'Landing Page','landingPage',1,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2024-08-27 02:33:20','2024-08-27 02:37:27',NULL,'70c18853-dff4-4cd2-b6c6-f15229f724d4');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2024-08-27 01:31:09','2024-08-27 01:31:09',NULL,'99193ed8-2754-4f53-bb64-1f7fdbde7ae3');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (2,1,3,1,0,1,'2024-08-27 02:41:43','2024-08-27 02:41:43','9644ae73-37ed-4500-87c9-022a74ab0b4a'),(3,1,3,2,0,2,'2024-08-27 02:41:43','2024-08-27 02:41:43','cf8d697f-a033-4679-917d-7b728d5b11c1');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2024-08-27 02:33:20','2024-08-27 02:33:20',NULL,'622966fc-0f5c-4e39-9c86-4b920b93aa15'),(2,'craft\\elements\\Asset','2024-08-27 02:47:10','2024-08-27 02:47:10',NULL,'846f373e-a625-4557-93d9-ee5ffcab59a3');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (3,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"df283aac-f7b8-45cc-8bd2-b9dc2550befd\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"09786e71-00e5-4300-87c6-72b5c13ea09f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"de98037e-c095-4ccc-9b6c-446758bfbbe6\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"02527ef3-1994-42ba-aed0-90e183c65bd2\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"b9380879-706c-4285-8ef9-7ed1563f838c\"}]',1,'2024-08-27 02:41:43','2024-08-27 02:41:43','ea530f1f-f96d-4a4f-8d2c-defa55092fa6'),(4,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"0c6aca85-f362-4f39-bb4e-395748ddb935\",\"userCondition\":null,\"elementCondition\":null}]',1,'2024-08-27 02:47:10','2024-08-27 02:47:10','6bc056a0-a0b8-42c8-8cad-d7f0ac0f9ac5');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,1,'Hero Image','heroImage','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":true,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:797e2ef7-228f-467f-b8ca-7d2cb80caab2\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:797e2ef7-228f-467f-b8ca-7d2cb80caab2\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-08-27 02:31:55','2024-08-27 02:47:37','de98037e-c095-4ccc-9b6c-446758bfbbe6'),(2,1,'Slider Images','sliderImages','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":true,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:797e2ef7-228f-467f-b8ca-7d2cb80caab2\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":true,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:797e2ef7-228f-467f-b8ca-7d2cb80caab2\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-08-27 02:38:47','2024-08-27 02:47:43','b9380879-706c-4285-8ef9-7ed1563f838c');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `imagetransforms` VALUES (1,'sliderImageTransform','sliderImageTransform','fit','center-center',10,10,NULL,NULL,'none',NULL,0,'2024-08-27 03:55:36','2024-08-27 03:26:29','2024-08-27 03:55:36','97c89bb0-4a01-404d-9eb1-2266bcb0e556');
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.11.5','4.5.3.0',0,'iewknhpwlwfy','3@jxbixrhqvm','2024-08-27 01:31:09','2024-08-27 03:55:36','505ae953-4b66-43d5-be42-194bb5f2614a');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','9aed8e53-0594-4fa9-9914-52bd96f26ccb'),(2,'craft','m210121_145800_asset_indexing_changes','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','2bd7fbed-a590-4da7-a3bc-626f5b1f60d0'),(3,'craft','m210624_222934_drop_deprecated_tables','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','09cd233c-c766-4ab3-a20a-fc448c3aee96'),(4,'craft','m210724_180756_rename_source_cols','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','a6e5b863-9e1f-41c1-9828-cbaae67c5551'),(5,'craft','m210809_124211_remove_superfluous_uids','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','65d78051-1097-4bd1-8b5e-3593787f71cb'),(6,'craft','m210817_014201_universal_users','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','8ca2204c-437b-4a2c-9a82-e921a640f357'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','5e6bd296-df4c-4a85-abcf-cdc25d0c0b9b'),(8,'craft','m211115_135500_image_transformers','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','d8d81218-9bde-443f-856a-1ed24d8cb676'),(9,'craft','m211201_131000_filesystems','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','57e631cc-fda5-43eb-b27f-46dba5ddb093'),(10,'craft','m220103_043103_tab_conditions','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','a797e77e-f588-4571-b555-89587cdbdd22'),(11,'craft','m220104_003433_asset_alt_text','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','a3c60dce-bfdb-4a3d-bba8-85136a209f86'),(12,'craft','m220123_213619_update_permissions','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','fff13af1-b8c7-421e-ac57-09fd00363530'),(13,'craft','m220126_003432_addresses','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','fd1ae200-bdfa-423b-887c-8ee7fb928954'),(14,'craft','m220209_095604_add_indexes','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','1be00511-4703-4847-abb5-3fd20ed8e723'),(15,'craft','m220213_015220_matrixblocks_owners_table','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','b32bda93-186e-4bf6-b10b-674ed878a213'),(16,'craft','m220214_000000_truncate_sessions','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','88782631-2c90-48f3-97dd-cc452634a99d'),(17,'craft','m220222_122159_full_names','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','684d5a52-5b58-46ab-ad1c-18664d855a3e'),(18,'craft','m220223_180559_nullable_address_owner','2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 01:31:09','d26cd91e-503f-47ee-b764-5ed080365745'),(19,'craft','m220225_165000_transform_filesystems','2024-08-27 01:31:10','2024-08-27 01:31:10','2024-08-27 01:31:10','f928542c-fc50-427e-95a7-ef63b0f14b73'),(20,'craft','m220309_152006_rename_field_layout_elements','2024-08-27 01:31:10','2024-08-27 01:31:10','2024-08-27 01:31:10','f4cbc42a-3026-42a2-998e-112b8b4b9272'),(21,'craft','m220314_211928_field_layout_element_uids','2024-08-27 01:31:10','2024-08-27 01:31:10','2024-08-27 01:31:10','42004f08-0711-4992-adc0-7ad9ecb70fc8'),(22,'craft','m220316_123800_transform_fs_subpath','2024-08-27 01:31:10','2024-08-27 01:31:10','2024-08-27 01:31:10','6147cd15-468e-4928-b5fd-34334ce73c5a'),(23,'craft','m220317_174250_release_all_jobs','2024-08-27 01:31:10','2024-08-27 01:31:10','2024-08-27 01:31:10','4ec78354-f16b-4f4a-a754-06cf6210542c'),(24,'craft','m220330_150000_add_site_gql_schema_components','2024-08-27 01:31:10','2024-08-27 01:31:10','2024-08-27 01:31:10','7101ff3e-4db8-4bc2-9182-0203fac9badf'),(25,'craft','m220413_024536_site_enabled_string','2024-08-27 01:31:10','2024-08-27 01:31:10','2024-08-27 01:31:10','698020df-b766-4d4b-8ad2-e4eb8aad28d2'),(26,'craft','m221027_160703_add_image_transform_fill','2024-08-27 01:31:10','2024-08-27 01:31:10','2024-08-27 01:31:10','27792183-d2a3-40a8-95ed-358b14994ffc'),(27,'craft','m221028_130548_add_canonical_id_index','2024-08-27 01:31:10','2024-08-27 01:31:10','2024-08-27 01:31:10','c9c9b927-6235-462d-8d50-d766cb481ee2'),(28,'craft','m221118_003031_drop_element_fks','2024-08-27 01:31:10','2024-08-27 01:31:10','2024-08-27 01:31:10','7b7a584f-085d-4ec0-8c70-98133f5ba174'),(29,'craft','m230131_120713_asset_indexing_session_new_options','2024-08-27 01:31:10','2024-08-27 01:31:10','2024-08-27 01:31:10','530b6b65-b0e3-4515-b1db-3ec50903e622'),(30,'craft','m230226_013114_drop_plugin_license_columns','2024-08-27 01:31:10','2024-08-27 01:31:10','2024-08-27 01:31:10','4d9f3705-6179-4b60-a04d-fef613477272'),(31,'craft','m230531_123004_add_entry_type_show_status_field','2024-08-27 01:31:10','2024-08-27 01:31:10','2024-08-27 01:31:10','8ee96516-c5d4-4fb9-9d6a-24f5d65bf04b'),(32,'craft','m230607_102049_add_entrytype_slug_translation_columns','2024-08-27 01:31:10','2024-08-27 01:31:10','2024-08-27 01:31:10','47454864-5c32-4590-bdce-585ac94d738b'),(33,'craft','m230710_162700_element_activity','2024-08-27 01:31:10','2024-08-27 01:31:10','2024-08-27 01:31:10','fe115f8e-a036-4456-8a48-f4be4deaf327'),(34,'craft','m230820_162023_fix_cache_id_type','2024-08-27 01:31:10','2024-08-27 01:31:10','2024-08-27 01:31:10','c87bfb6a-f16f-42d4-9b8e-833f563e72ce'),(35,'craft','m230826_094050_fix_session_id_type','2024-08-27 01:31:10','2024-08-27 01:31:10','2024-08-27 01:31:10','eb4b8c45-7392-4595-9924-893980e5dff8');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1724730936'),('email.fromEmail','\"leo336570@gmail.com\"'),('email.fromName','\"Imagic Test\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elementCondition','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.autocapitalize','true'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.autocomplete','false'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.autocorrect','true'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.class','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.disabled','false'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.elementCondition','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.id','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.inputType','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.instructions','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.label','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.max','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.min','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.name','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.orientation','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.placeholder','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.readonly','false'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.requirable','false'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.size','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.step','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.tip','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.title','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.uid','\"df283aac-f7b8-45cc-8bd2-b9dc2550befd\"'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.userCondition','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.warning','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.0.width','100'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.1.elementCondition','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.1.fieldUid','\"de98037e-c095-4ccc-9b6c-446758bfbbe6\"'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.1.instructions','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.1.label','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.1.required','false'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.1.tip','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.1.uid','\"09786e71-00e5-4300-87c6-72b5c13ea09f\"'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.1.userCondition','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.1.warning','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.1.width','100'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.2.elementCondition','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.2.fieldUid','\"b9380879-706c-4285-8ef9-7ed1563f838c\"'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.2.instructions','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.2.label','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.2.required','false'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.2.tip','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.2.uid','\"02527ef3-1994-42ba-aed0-90e183c65bd2\"'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.2.userCondition','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.2.warning','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.elements.2.width','100'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.name','\"Content\"'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.uid','\"ea530f1f-f96d-4a4f-8d2c-defa55092fa6\"'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.fieldLayouts.622966fc-0f5c-4e39-9c86-4b920b93aa15.tabs.0.userCondition','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.handle','\"landingPage\"'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.hasTitleField','true'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.name','\"Landing Page\"'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.section','\"ff053adc-3a59-4ded-9464-2b820acd531e\"'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.showStatusField','true'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.slugTranslationKeyFormat','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.slugTranslationMethod','\"site\"'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.sortOrder','1'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.titleFormat','\"{section.name|raw}\"'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.titleTranslationKeyFormat','null'),('entryTypes.70c18853-dff4-4cd2-b6c6-f15229f724d4.titleTranslationMethod','\"site\"'),('fieldGroups.99193ed8-2754-4f53-bb64-1f7fdbde7ae3.name','\"Common\"'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.columnSuffix','null'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.contentColumnType','\"string\"'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.fieldGroup','\"99193ed8-2754-4f53-bb64-1f7fdbde7ae3\"'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.handle','\"sliderImages\"'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.instructions','null'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.name','\"Slider Images\"'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.searchable','false'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.allowedKinds.0','\"image\"'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.allowSelfRelations','false'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.allowSubfolders','true'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.allowUploads','true'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.branchLimit','null'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.defaultUploadLocationSource','\"volume:797e2ef7-228f-467f-b8ca-7d2cb80caab2\"'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.defaultUploadLocationSubpath','null'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.localizeRelations','false'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.maintainHierarchy','false'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.maxRelations','null'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.minRelations','null'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.previewMode','\"full\"'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.restrictedDefaultUploadSubpath','null'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.restrictedLocationSource','\"volume:797e2ef7-228f-467f-b8ca-7d2cb80caab2\"'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.restrictedLocationSubpath','null'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.restrictFiles','true'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.restrictLocation','true'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.selectionLabel','null'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.showSiteMenu','true'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.showUnpermittedFiles','false'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.showUnpermittedVolumes','false'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.sources','\"*\"'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.targetSiteId','null'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.validateRelatedElements','false'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.settings.viewMode','\"list\"'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.translationKeyFormat','null'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.translationMethod','\"site\"'),('fields.b9380879-706c-4285-8ef9-7ed1563f838c.type','\"craft\\\\fields\\\\Assets\"'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.columnSuffix','null'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.contentColumnType','\"string\"'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.fieldGroup','\"99193ed8-2754-4f53-bb64-1f7fdbde7ae3\"'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.handle','\"heroImage\"'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.instructions','null'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.name','\"Hero Image\"'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.searchable','false'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.allowedKinds.0','\"image\"'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.allowSelfRelations','false'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.allowSubfolders','true'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.allowUploads','true'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.branchLimit','null'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.defaultUploadLocationSource','\"volume:797e2ef7-228f-467f-b8ca-7d2cb80caab2\"'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.defaultUploadLocationSubpath','null'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.localizeRelations','false'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.maintainHierarchy','false'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.maxRelations','1'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.minRelations','null'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.previewMode','\"full\"'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.restrictedDefaultUploadSubpath','null'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.restrictedLocationSource','\"volume:797e2ef7-228f-467f-b8ca-7d2cb80caab2\"'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.restrictedLocationSubpath','null'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.restrictFiles','true'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.restrictLocation','true'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.selectionLabel','null'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.showSiteMenu','true'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.showUnpermittedFiles','false'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.showUnpermittedVolumes','false'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.sources','\"*\"'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.targetSiteId','null'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.validateRelatedElements','false'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.settings.viewMode','\"list\"'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.translationKeyFormat','null'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.translationMethod','\"site\"'),('fields.de98037e-c095-4ccc-9b6c-446758bfbbe6.type','\"craft\\\\fields\\\\Assets\"'),('fs.hardDisk.hasUrls','true'),('fs.hardDisk.name','\"Hard Disk\"'),('fs.hardDisk.settings.path','\"@webroot/uploads/images\"'),('fs.hardDisk.type','\"craft\\\\fs\\\\Local\"'),('fs.hardDisk.url','\"@web/uploads/images\"'),('imageTransforms.97c89bb0-4a01-404d-9eb1-2266bcb0e556.fill','null'),('imageTransforms.97c89bb0-4a01-404d-9eb1-2266bcb0e556.format','null'),('imageTransforms.97c89bb0-4a01-404d-9eb1-2266bcb0e556.handle','\"sliderImageTransform\"'),('imageTransforms.97c89bb0-4a01-404d-9eb1-2266bcb0e556.height','10'),('imageTransforms.97c89bb0-4a01-404d-9eb1-2266bcb0e556.interlace','\"none\"'),('imageTransforms.97c89bb0-4a01-404d-9eb1-2266bcb0e556.mode','\"fit\"'),('imageTransforms.97c89bb0-4a01-404d-9eb1-2266bcb0e556.name','\"sliderImageTransform\"'),('imageTransforms.97c89bb0-4a01-404d-9eb1-2266bcb0e556.position','\"center-center\"'),('imageTransforms.97c89bb0-4a01-404d-9eb1-2266bcb0e556.quality','null'),('imageTransforms.97c89bb0-4a01-404d-9eb1-2266bcb0e556.upscale','false'),('imageTransforms.97c89bb0-4a01-404d-9eb1-2266bcb0e556.width','10'),('meta.__names__.70c18853-dff4-4cd2-b6c6-f15229f724d4','\"Landing Page\"'),('meta.__names__.72afebc2-75ef-438d-8ce7-52d119a51c2e','\"Imagic Test\"'),('meta.__names__.797e2ef7-228f-467f-b8ca-7d2cb80caab2','\"Images\"'),('meta.__names__.97c89bb0-4a01-404d-9eb1-2266bcb0e556','\"sliderImageTransform\"'),('meta.__names__.99193ed8-2754-4f53-bb64-1f7fdbde7ae3','\"Common\"'),('meta.__names__.b9380879-706c-4285-8ef9-7ed1563f838c','\"Slider Images\"'),('meta.__names__.d5f07c1d-9d1a-4735-a040-5a0ad834b495','\"Imagic Test\"'),('meta.__names__.de98037e-c095-4ccc-9b6c-446758bfbbe6','\"Hero Image\"'),('meta.__names__.ff053adc-3a59-4ded-9464-2b820acd531e','\"Landing Page\"'),('sections.ff053adc-3a59-4ded-9464-2b820acd531e.defaultPlacement','\"end\"'),('sections.ff053adc-3a59-4ded-9464-2b820acd531e.enableVersioning','true'),('sections.ff053adc-3a59-4ded-9464-2b820acd531e.handle','\"landingPage\"'),('sections.ff053adc-3a59-4ded-9464-2b820acd531e.name','\"Landing Page\"'),('sections.ff053adc-3a59-4ded-9464-2b820acd531e.propagationMethod','\"all\"'),('sections.ff053adc-3a59-4ded-9464-2b820acd531e.siteSettings.d5f07c1d-9d1a-4735-a040-5a0ad834b495.enabledByDefault','true'),('sections.ff053adc-3a59-4ded-9464-2b820acd531e.siteSettings.d5f07c1d-9d1a-4735-a040-5a0ad834b495.hasUrls','true'),('sections.ff053adc-3a59-4ded-9464-2b820acd531e.siteSettings.d5f07c1d-9d1a-4735-a040-5a0ad834b495.template','\"index.twig\"'),('sections.ff053adc-3a59-4ded-9464-2b820acd531e.siteSettings.d5f07c1d-9d1a-4735-a040-5a0ad834b495.uriFormat','\"__home__\"'),('sections.ff053adc-3a59-4ded-9464-2b820acd531e.type','\"single\"'),('siteGroups.72afebc2-75ef-438d-8ce7-52d119a51c2e.name','\"Imagic Test\"'),('sites.d5f07c1d-9d1a-4735-a040-5a0ad834b495.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.d5f07c1d-9d1a-4735-a040-5a0ad834b495.handle','\"default\"'),('sites.d5f07c1d-9d1a-4735-a040-5a0ad834b495.hasUrls','true'),('sites.d5f07c1d-9d1a-4735-a040-5a0ad834b495.language','\"en-US\"'),('sites.d5f07c1d-9d1a-4735-a040-5a0ad834b495.name','\"Imagic Test\"'),('sites.d5f07c1d-9d1a-4735-a040-5a0ad834b495.primary','true'),('sites.d5f07c1d-9d1a-4735-a040-5a0ad834b495.siteGroup','\"72afebc2-75ef-438d-8ce7-52d119a51c2e\"'),('sites.d5f07c1d-9d1a-4735-a040-5a0ad834b495.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Imagic Test\"'),('system.schemaVersion','\"4.5.3.0\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elementCondition','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.autocapitalize','true'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.autocomplete','false'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.autocorrect','true'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.class','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.disabled','false'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.elementCondition','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.id','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.inputType','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.instructions','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.label','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.max','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.min','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.name','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.orientation','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.placeholder','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.readonly','false'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.requirable','false'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.size','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.step','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.tip','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.title','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.uid','\"0c6aca85-f362-4f39-bb4e-395748ddb935\"'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.userCondition','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.warning','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.elements.0.width','100'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.name','\"Content\"'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.uid','\"6bc056a0-a0b8-42c8-8cad-d7f0ac0f9ac5\"'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fieldLayouts.846f373e-a625-4557-93d9-ee5ffcab59a3.tabs.0.userCondition','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.fs','\"hardDisk\"'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.handle','\"images\"'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.name','\"Images\"'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.sortOrder','1'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.titleTranslationKeyFormat','null'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.titleTranslationMethod','\"site\"'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.transformFs','\"hardDisk\"'),('volumes.797e2ef7-228f-467f-b8ca-7d2cb80caab2.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (2,1,2,NULL,7,1,'2024-08-27 02:55:36','2024-08-27 02:55:36','39142d5b-0ef8-4751-80da-b79e2921a967'),(3,1,9,NULL,7,1,'2024-08-27 02:55:36','2024-08-27 02:55:36','4877f3da-2508-4f96-842a-efc1cda8d781'),(4,1,10,NULL,7,1,'2024-08-27 02:57:58','2024-08-27 02:57:58','cc62e182-6a67-497c-a553-d0890fbc8c38'),(10,2,2,NULL,11,1,'2024-08-27 03:10:34','2024-08-27 03:10:34','4b228937-5a77-411a-b986-5b97d35d88b8'),(13,2,2,NULL,15,2,'2024-08-27 03:10:34','2024-08-27 03:57:17','b6d950c2-795a-4205-87a3-499d8f97924f'),(14,1,16,NULL,7,1,'2024-08-27 03:10:34','2024-08-27 03:10:34','490a6057-cc66-4485-8a6f-6d1bf470009c'),(15,2,16,NULL,11,1,'2024-08-27 03:10:34','2024-08-27 03:10:34','7d8c1a45-3222-47b1-9aef-4502e013c68d'),(16,2,16,NULL,13,2,'2024-08-27 03:10:34','2024-08-27 03:10:34','7d559529-1cdf-4b78-b3f9-092229adc3fd'),(17,2,16,NULL,14,3,'2024-08-27 03:10:34','2024-08-27 03:10:34','24a31fdd-0e5d-416e-950a-e0b4046e6027'),(18,2,16,NULL,15,4,'2024-08-27 03:10:34','2024-08-27 03:10:34','a99b037c-436c-472e-84b8-ec71fe967a85'),(28,1,20,NULL,7,1,'2024-08-27 03:57:17','2024-08-27 03:57:17','3013f6c5-fdca-4dee-b1c7-6331924dffda'),(29,2,20,NULL,11,1,'2024-08-27 03:57:17','2024-08-27 03:57:17','20abc566-03e1-4d59-bcca-deac8fd673e3'),(30,2,20,NULL,15,2,'2024-08-27 03:57:17','2024-08-27 03:57:17','17fc6aa0-1fe7-4fc6-b717-7090bff2206c'),(31,2,20,NULL,18,3,'2024-08-27 03:57:17','2024-08-27 03:57:17','0504b08c-7952-4958-8db4-f4949e8215ee'),(32,2,20,NULL,19,4,'2024-08-27 03:57:17','2024-08-27 03:57:17','7c4bf671-cbac-493a-a25b-c7ea8aa8dc10'),(33,1,21,NULL,7,1,'2024-08-27 03:58:05','2024-08-27 03:58:05','1cdcd1fb-2f2c-4298-931d-d5bc47b8b180'),(34,2,21,NULL,11,1,'2024-08-27 03:58:05','2024-08-27 03:58:05','ec31e417-aaae-4c25-9145-fe7c4f5c2272'),(35,2,21,NULL,15,2,'2024-08-27 03:58:05','2024-08-27 03:58:05','3d3d5cef-74d2-4018-9c40-074c6da46f34'),(36,2,21,NULL,18,3,'2024-08-27 03:58:05','2024-08-27 03:58:05','d9d0a019-f74c-4bfe-8812-a10ceee6cdab'),(37,2,21,NULL,19,4,'2024-08-27 03:58:05','2024-08-27 03:58:05','34fd3fe8-d266-432b-a6a3-615e14a55b18'),(44,2,2,NULL,23,3,'2024-08-27 03:59:53','2024-08-27 03:59:53','1634691f-6b53-4fa3-ab6f-4ecf387a1e88'),(45,1,24,NULL,7,1,'2024-08-27 03:59:54','2024-08-27 03:59:54','fd47af20-3c7f-4211-835c-9d65c4de4010'),(46,2,24,NULL,11,1,'2024-08-27 03:59:54','2024-08-27 03:59:54','69f355c7-a613-48d0-97bb-4c670434ce9d'),(47,2,24,NULL,15,2,'2024-08-27 03:59:54','2024-08-27 03:59:54','98f2898a-6e0c-4e65-9354-ba968a0121f8'),(48,2,24,NULL,23,3,'2024-08-27 03:59:54','2024-08-27 03:59:54','cca87ee8-764d-48b2-aa9b-29922bca4782'),(49,1,25,NULL,7,1,'2024-08-27 04:04:06','2024-08-27 04:04:06','13c0ecb9-ee95-47f5-bb21-815ba9efb66b'),(50,2,25,NULL,11,1,'2024-08-27 04:04:06','2024-08-27 04:04:06','c14f6045-574e-41dd-b1b4-3d172281283f'),(51,2,25,NULL,15,2,'2024-08-27 04:04:06','2024-08-27 04:04:06','8efbfd4d-a6e4-41ee-86e6-29238a304bd6'),(52,2,25,NULL,23,3,'2024-08-27 04:04:06','2024-08-27 04:04:06','779f2c2f-462a-4722-b6c2-19517dfd03ca');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL),(3,2,1,3,NULL),(4,2,1,4,NULL),(5,2,1,5,'Applied “Draft 1”'),(6,2,1,6,''),(7,2,1,7,'Applied “Draft 1”'),(8,2,1,8,'Applied “Draft 1”'),(9,2,1,9,''),(10,2,1,10,'Applied “Draft 1”'),(11,2,1,11,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' leo336570 gmail com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' leo336570 '),(2,'slug',0,1,' landing page '),(2,'title',0,1,' landing page '),(7,'alt',0,1,''),(7,'extension',0,1,' jpg '),(7,'filename',0,1,' duckbath jpg '),(7,'kind',0,1,' image '),(7,'slug',0,1,''),(7,'title',0,1,' duckbath '),(11,'alt',0,1,''),(11,'extension',0,1,' jpg '),(11,'filename',0,1,' sanapeace jpg '),(11,'kind',0,1,' image '),(11,'slug',0,1,''),(11,'title',0,1,' sana peace '),(13,'alt',0,1,''),(13,'extension',0,1,' jpg '),(13,'filename',0,1,' db59509e2341749852721be2b1cd2707 jpg '),(13,'kind',0,1,' image '),(13,'slug',0,1,''),(13,'title',0,1,' db59509e2341749852721be2b1cd2707 '),(14,'alt',0,1,''),(14,'extension',0,1,' jpg '),(14,'filename',0,1,' goat jpg '),(14,'kind',0,1,' image '),(14,'slug',0,1,''),(14,'title',0,1,' goat '),(15,'alt',0,1,''),(15,'extension',0,1,' png '),(15,'filename',0,1,' snapback png '),(15,'kind',0,1,' image '),(15,'slug',0,1,''),(15,'title',0,1,' snapback '),(18,'alt',0,1,''),(18,'extension',0,1,' png '),(18,'filename',0,1,' img 20221214 005409 png '),(18,'kind',0,1,' image '),(18,'slug',0,1,''),(18,'title',0,1,' img 20221214 005409 '),(19,'alt',0,1,''),(19,'extension',0,1,' png '),(19,'filename',0,1,' comet png '),(19,'kind',0,1,' image '),(19,'slug',0,1,''),(19,'title',0,1,' comet '),(23,'alt',0,1,''),(23,'extension',0,1,' png '),(23,'filename',0,1,' img 20221214 005409 2024 08 27 035947 kkwa png '),(23,'kind',0,1,' image '),(23,'slug',0,1,''),(23,'title',0,1,' img 20221214 005409 ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Landing Page','landingPage','single',1,'all','end',NULL,'2024-08-27 02:33:20','2024-08-27 02:33:20',NULL,'ff053adc-3a59-4ded-9464-2b820acd531e');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','index.twig',1,'2024-08-27 02:33:20','2024-08-27 02:33:20','95c62d4f-3553-45e1-9ba4-90ef4e0f167d');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Imagic Test','2024-08-27 01:31:09','2024-08-27 01:31:09',NULL,'72afebc2-75ef-438d-8ce7-52d119a51c2e');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'true','Imagic Test','default','en-US',1,'$PRIMARY_SITE_URL',1,'2024-08-27 01:31:09','2024-08-27 01:31:09',NULL,'d5f07c1d-9d1a-4735-a040-5a0ad834b495');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tokens` VALUES (1,'wjNiqMENJB23RkLXDVbP9tJQK3kSE43A','[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":2,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]',NULL,NULL,'2024-08-28 02:51:06','2024-08-27 02:51:06','2024-08-27 02:51:06','9a004c80-b848-4b2f-945f-58139de27336'),(2,'_ZdSMGSwd-UL9jk0QGvhpYMaaAaa3KDo','[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":2,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]',NULL,NULL,'2024-08-28 03:10:21','2024-08-27 03:10:21','2024-08-27 03:10:21','8b94303d-2bd6-4c6f-8861-c71064c7b102');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'leo336570',NULL,NULL,NULL,'leo336570@gmail.com','$2y$13$KMVXW03VSouRKTHZTT.P8eP2FerUlvkyNBA5FBQIwfDlMpkUdLy0a','2024-08-27 02:29:48',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2024-08-27 01:31:09','2024-08-27 01:31:09','2024-08-27 02:29:48');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Images','','2024-08-27 02:47:10','2024-08-27 02:47:10','bf36708a-190b-481e-b689-f7d2142963a9'),(2,NULL,NULL,'Temporary filesystem',NULL,'2024-08-27 02:47:45','2024-08-27 02:47:45','20f73b31-aa14-4155-a700-34f21eeaab39'),(3,2,NULL,'user_1','user_1/','2024-08-27 02:47:45','2024-08-27 02:47:45','d118e1eb-d9e9-4147-87b7-d73462fa5423');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,2,'Images','images','hardDisk','hardDisk','','site',NULL,1,'2024-08-27 02:47:10','2024-08-27 02:47:10',NULL,'797e2ef7-228f-467f-b8ca-7d2cb80caab2');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2024-08-27 02:29:48','2024-08-27 02:29:48','1e339fe8-fb77-41a3-9ea5-17fcdff30905'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2024-08-27 02:29:48','2024-08-27 02:29:48','d669be08-18cb-41a3-8d4f-d4640d0587b1'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2024-08-27 02:29:48','2024-08-27 02:29:48','abc9824c-654b-4f21-a68f-fe28627592c4'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2024-08-27 02:29:48','2024-08-27 02:29:48','db2e68e9-0f54-43b2-a25e-da247f8909f4');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-27  4:07:59
