/*
Navicat MySQL Data Transfer

Source Server         : localMysql
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : integrityguard

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-03-16 20:58:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for appstrategytable
-- ----------------------------
DROP TABLE IF EXISTS `appstrategytable`;
CREATE TABLE `appstrategytable` (
  `AppNo` int(11) NOT NULL,
  `AppCreaterName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `AppCreateTime` datetime DEFAULT NULL,
  `AppModifyTime` datetime DEFAULT NULL,
  `AppStrategyName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `AppIpAddress` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `AppFilePath` longtext CHARACTER SET utf8,
  `AppStrategyExplain` longtext CHARACTER SET utf8,
  `id` varchar(254) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of appstrategytable
-- ----------------------------
INSERT INTO `appstrategytable` VALUES ('1', 'admin', '2014-01-14 16:48:49', '2014-01-14 17:24:25', 'File_Custom', '127.0.0.1', 'C:\\Windows\\System32', '文件自定义策略', '20140114172425525');

-- ----------------------------
-- Table structure for auditlog
-- ----------------------------
DROP TABLE IF EXISTS `auditlog`;
CREATE TABLE `auditlog` (
  `LogHostIp` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `LogTime` datetime DEFAULT NULL,
  `LogStyle` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `LogContent` longtext CHARACTER SET utf8,
  `LogDetail` longtext CHARACTER SET utf8,
  `StrategyVersion` int(11) DEFAULT NULL,
  `StrategyID` varchar(254) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auditlog
-- ----------------------------
INSERT INTO `auditlog` VALUES ('192.168.75.9', '2014-01-15 15:37:05', '文件审记', '策略：20140115152546011 ; 文件：PerfStringBackup - 副本.INI', '新增文件', '1', '20140115152546011');
INSERT INTO `auditlog` VALUES ('192.168.75.9', '2014-01-15 15:37:05', '文件审记', '策略：20140115152546011 ; 文件：PerfStringBackup.INI', '文件更改', '1', '20140115152546011');
INSERT INTO `auditlog` VALUES ('192.168.75.9', '2014-01-15 16:00:13', '文件审记', '策略：20140115152546011 ; 文件：PerfStringBackup - 副本.INI', '新增文件', '2', '20140115152546011');
INSERT INTO `auditlog` VALUES ('192.168.75.9', '2014-01-15 16:00:13', '文件审记', '策略：20140115152546011 ; 文件：PerfStringBackup.INI', '文件更改', '2', '20140115152546011');

-- ----------------------------
-- Table structure for change
-- ----------------------------
DROP TABLE IF EXISTS `change`;
CREATE TABLE `change` (
  `IP` varchar(16) CHARACTER SET utf8 NOT NULL,
  `Subject` longtext CHARACTER SET utf8 NOT NULL,
  `Operate` int(11) NOT NULL,
  `Object` longtext CHARACTER SET utf8 NOT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of change
-- ----------------------------

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IP` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `MAC` varchar(18) CHARACTER SET utf8 DEFAULT NULL,
  `Name` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `Stopped` smallint(6) DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  `NoteName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `LicenseKey` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', '192.168.1.11', '33-33-12-12-12-12', '192.168.1.11', '1', '0', '', '192.168.1.11333312121212', '0');
INSERT INTO `client` VALUES ('7', '192.168.1.8', '12-12-12-12-12-12', '192.168.1.8', '0', '0', null, '192.168.1.8121212121212', '0');
INSERT INTO `client` VALUES ('8', '192.168.1.85', '12-12-12-12-12-13', '192.168.1.85', '0', '1', '', '192.168.1.85121212121213', '0');

-- ----------------------------
-- Table structure for copy
-- ----------------------------
DROP TABLE IF EXISTS `copy`;
CREATE TABLE `copy` (
  `id` int(11) NOT NULL,
  `ClientIP` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `StrategyName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `CopyVolumn` int(11) DEFAULT NULL,
  `StrategyType` int(11) DEFAULT NULL,
  `RestoreStatus` smallint(6) DEFAULT NULL,
  `BaseLine` int(11) DEFAULT NULL,
  `CopyFilePath` longtext CHARACTER SET utf8,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of copy
-- ----------------------------
INSERT INTO `copy` VALUES ('0', '127.0.0.1', 'system_strategy', '2014-01-15 12:20:35', '12', '0', '0', '0', null);
INSERT INTO `copy` VALUES ('1', '127.0.0.1', 'system_strategy', '2014-01-14 12:20:35', '15', '0', '0', '0', null);

-- ----------------------------
-- Table structure for count
-- ----------------------------
DROP TABLE IF EXISTS `count`;
CREATE TABLE `count` (
  `ChangeCount` int(11) DEFAULT NULL,
  `AntiAttackCount` int(11) DEFAULT NULL,
  `AttackCount` int(11) DEFAULT NULL,
  `StrategyUsed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of count
-- ----------------------------

-- ----------------------------
-- Table structure for equipstrategytable
-- ----------------------------
DROP TABLE IF EXISTS `equipstrategytable`;
CREATE TABLE `equipstrategytable` (
  `EquipNo` int(11) NOT NULL,
  `EquipCreaterName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `EquipCreateTime` datetime DEFAULT NULL,
  `EquipModifyTime` datetime DEFAULT NULL,
  `EquipStrategyName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `EquipQueryOrder` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `EquipManageOrder` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `EquipStrategyExplain` longtext CHARACTER SET utf8,
  `id` varchar(254) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of equipstrategytable
-- ----------------------------
INSERT INTO `equipstrategytable` VALUES ('1', 'admin', '2014-01-14 17:22:25', '2014-01-14 17:22:25', 'NetWork', 'Enable', 'Show Configure', 'NetWork Test', '20140114172138827');

-- ----------------------------
-- Table structure for filter
-- ----------------------------
DROP TABLE IF EXISTS `filter`;
CREATE TABLE `filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ClientIP` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `FilterName` varchar(254) CHARACTER SET utf8 NOT NULL,
  `RegExp` longtext CHARACTER SET utf8,
  `TypeOfHipsRule` int(11) DEFAULT NULL,
  `MatchType` int(11) DEFAULT NULL,
  `OperatorType` int(11) DEFAULT NULL,
  `DefaultAction` int(11) DEFAULT NULL,
  `DefaultLogFilter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of filter
-- ----------------------------

-- ----------------------------
-- Table structure for hipslog
-- ----------------------------
DROP TABLE IF EXISTS `hipslog`;
CREATE TABLE `hipslog` (
  `LogHostIp` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `LogTime` datetime DEFAULT NULL,
  `LogStyle` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `LogContent` longtext CHARACTER SET utf8,
  `HIPSAction` varchar(254) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hipslog
-- ----------------------------
INSERT INTO `hipslog` VALUES ('192.168.75.9', '2014-01-15 15:29:17', '注册表审计', '进程regedit.exe  创建或修改\\registry\\machine\\system\\controlset001\\services\\新值 #2', '放行');
INSERT INTO `hipslog` VALUES ('192.168.75.9', '2014-01-15 15:29:28', '注册表审计', '进程regedit.exe  创建或修改\\registry\\machine\\system\\controlset001\\services\\test', '放行');
INSERT INTO `hipslog` VALUES ('192.168.75.9', '2014-01-15 15:29:28', '注册表审计', '进程regedit.exe  删除键值\\registry\\machine\\system\\controlset001\\services\\新值 #2', '放行');
INSERT INTO `hipslog` VALUES ('192.168.75.9', '2014-01-15 15:29:54', '注册表审计', '进程regedit.exe  创建或修改\\registry\\machine\\system\\controlset001\\services\\新值 #2', '放行');
INSERT INTO `hipslog` VALUES ('192.168.75.9', '2014-01-15 15:30:44', '注册表审计', '进程regedit.exe  创建或修改\\registry\\machine\\system\\controlset001\\services\\test2', '放行');
INSERT INTO `hipslog` VALUES ('192.168.75.9', '2014-01-15 15:30:44', '注册表审计', '进程regedit.exe  删除键值\\registry\\machine\\system\\controlset001\\services\\新值 #2', '放行');

-- ----------------------------
-- Table structure for ipaddresstable
-- ----------------------------
DROP TABLE IF EXISTS `ipaddresstable`;
CREATE TABLE `ipaddresstable` (
  `IpNo` int(11) NOT NULL,
  `IpCreaterName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `IpCreateTime` datetime DEFAULT NULL,
  `IpModifyTime` datetime DEFAULT NULL,
  `IpStrategyName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `IpStrategyContent` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `IpStrategyExplain` varchar(254) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ipaddresstable
-- ----------------------------
INSERT INTO `ipaddresstable` VALUES ('1', 'admin', '2014-02-20 16:11:59', null, 'asd', '192.168.1.11/21;192.168.1.111/32', 'asdasdfasdf');

-- ----------------------------
-- Table structure for macaddresstable
-- ----------------------------
DROP TABLE IF EXISTS `macaddresstable`;
CREATE TABLE `macaddresstable` (
  `MacNo` int(11) NOT NULL,
  `MacCreaterName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `MacCreateTime` datetime DEFAULT NULL,
  `MacModifyTime` datetime DEFAULT NULL,
  `MacStrategyName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `MacStrategyContent` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `MacStrategyExplain` varchar(254) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of macaddresstable
-- ----------------------------
INSERT INTO `macaddresstable` VALUES ('1', 'admin', '2014-01-14 16:29:18', '2014-01-14 16:29:51', 'dfsdf', '00-0A-AA-AA-AA-AA', 'fdgdfgsdgfd');

-- ----------------------------
-- Table structure for module
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameid` int(11) DEFAULT NULL,
  `licensekey` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `licensedpoint` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `deadtime` datetime DEFAULT NULL,
  `activetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('1', '0', '苏州冠辰计算机技术有限公司', '10', '1', '2014-01-08 21:41:24', '2014-01-08 21:41:24');
INSERT INTO `module` VALUES ('2', '1', '苏州冠辰计算机技术有限公司', '10', '1', '2014-01-08 21:41:24', '2014-01-08 21:41:24');
INSERT INTO `module` VALUES ('3', '2', '苏州冠辰计算机技术有限公司', '10', '1', '2014-01-08 21:41:24', '2014-01-08 21:41:24');
INSERT INTO `module` VALUES ('4', '3', '苏州冠辰计算机技术有限公司', '10', '1', '2014-01-08 21:41:24', '2014-01-08 21:41:24');
INSERT INTO `module` VALUES ('5', '4', '苏州冠辰计算机技术有限公司', '10', '1', '2014-01-08 21:41:24', '2014-01-08 21:41:24');
INSERT INTO `module` VALUES ('6', '5', '苏州冠辰计算机技术有限公司', '10', '1', '2014-01-08 21:41:24', '2014-01-08 21:41:24');
INSERT INTO `module` VALUES ('7', '6', '苏州冠辰计算机技术有限公司', '10', '1', '2014-01-08 21:41:24', '2014-01-08 21:41:24');
INSERT INTO `module` VALUES ('8', '7', '苏州冠辰计算机技术有限公司', '10', '1', '2014-01-08 21:41:24', '2014-01-08 21:41:24');
INSERT INTO `module` VALUES ('9', '8', '苏州冠辰计算机技术有限公司', '10', '1', '2014-01-08 21:41:24', '2014-01-08 21:41:24');
INSERT INTO `module` VALUES ('10', '9', '苏州冠辰计算机技术有限公司', '10', '1', '2014-01-08 21:41:24', '2014-01-08 21:41:24');

-- ----------------------------
-- Table structure for netsecurity
-- ----------------------------
DROP TABLE IF EXISTS `netsecurity`;
CREATE TABLE `netsecurity` (
  `id` int(11) NOT NULL,
  `policyName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `interactiveAddress` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `localPort` int(11) DEFAULT NULL,
  `terminalPort` int(11) DEFAULT NULL,
  `direction` int(11) DEFAULT NULL,
  `listType` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of netsecurity
-- ----------------------------

-- ----------------------------
-- Table structure for peripheral
-- ----------------------------
DROP TABLE IF EXISTS `peripheral`;
CREATE TABLE `peripheral` (
  `id` int(11) NOT NULL,
  `peripheralType` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `displayName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `driverPath` longtext CHARACTER SET utf8,
  `enabled` int(11) DEFAULT '0',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of peripheral
-- ----------------------------

-- ----------------------------
-- Table structure for peripheralnew
-- ----------------------------
DROP TABLE IF EXISTS `peripheralnew`;
CREATE TABLE `peripheralnew` (
  `id` int(11) NOT NULL,
  `peripheralType` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `displayName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `driverPath` longtext CHARACTER SET utf8,
  `enabled` int(11) DEFAULT '0',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of peripheralnew
-- ----------------------------

-- ----------------------------
-- Table structure for regstrategytable
-- ----------------------------
DROP TABLE IF EXISTS `regstrategytable`;
CREATE TABLE `regstrategytable` (
  `RegNo` int(11) NOT NULL,
  `RegCreaterName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `RegCreateTime` datetime DEFAULT NULL,
  `RegModifyTime` datetime DEFAULT NULL,
  `RegStrategyName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `RegIpAddress` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `RegFilePath` longtext CHARACTER SET utf8,
  `RegStrategyExplain` longtext CHARACTER SET utf8,
  `id` varchar(254) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of regstrategytable
-- ----------------------------
INSERT INTO `regstrategytable` VALUES ('1', 'admin', '2014-01-14 17:18:36', '2014-01-14 17:18:36', 'reg_test', '127.0.0.1', '\\\\Registry\\\\MACHINE\\\\SOFTWARE\\\\Wow6432Node\\\\Microsoft\\\\Windows\\\\CurrentVersion\\\\Run', '自定义注册表策略', '20140114171743204');

-- ----------------------------
-- Table structure for reinforcingpolicy
-- ----------------------------
DROP TABLE IF EXISTS `reinforcingpolicy`;
CREATE TABLE `reinforcingpolicy` (
  `id` int(11) NOT NULL,
  `policyName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `policyDoc` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `policyObjective` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `currentState` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `policyTemplate` int(11) DEFAULT '0',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ__reinforcingPolic__00551192` (`policyObjective`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of reinforcingpolicy
-- ----------------------------

-- ----------------------------
-- Table structure for reportcentertable
-- ----------------------------
DROP TABLE IF EXISTS `reportcentertable`;
CREATE TABLE `reportcentertable` (
  `ReportName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `StrategyName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `ProduceTime` datetime DEFAULT NULL,
  `DetailContent` longtext CHARACTER SET utf8,
  `StrategyVersion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of reportcentertable
-- ----------------------------
INSERT INTO `reportcentertable` VALUES ('127.0.0.1_0', '127.0.0.1', '2014-01-08 21:42:29', '', '0');
INSERT INTO `reportcentertable` VALUES ('127.0.0.1_1', '127.0.0.1', '2014-01-09 17:06:44', '', '1');
INSERT INTO `reportcentertable` VALUES ('FileServ_0', 'FileServ', '2014-01-15 15:27:22', '', '0');
INSERT INTO `reportcentertable` VALUES ('192.168.75.9_0', '192.168.75.9', '2014-01-15 15:36:10', '', '0');
INSERT INTO `reportcentertable` VALUES ('192.168.75.9_1', '192.168.75.9', '2014-01-15 15:37:06', '', '1');
INSERT INTO `reportcentertable` VALUES ('192.168.75.9_2', '192.168.75.9', '2014-01-15 16:00:14', '', '2');

-- ----------------------------
-- Table structure for rules
-- ----------------------------
DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FilterName` longtext CHARACTER SET utf8,
  `FilterID` int(11) NOT NULL,
  `OperatorType` int(11) NOT NULL,
  `CompareType` int(11) NOT NULL,
  `MatchActionType` int(11) NOT NULL,
  `UnicodeIndex` int(11) NOT NULL,
  `UnicodeName` longtext CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rules
-- ----------------------------

-- ----------------------------
-- Table structure for service
-- ----------------------------
DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `serviceName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `serviceDoc` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `enabled` int(11) DEFAULT '0',
  `servicePath` longtext CHARACTER SET utf8,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of service
-- ----------------------------

-- ----------------------------
-- Table structure for severstrategytable
-- ----------------------------
DROP TABLE IF EXISTS `severstrategytable`;
CREATE TABLE `severstrategytable` (
  `SeverNo` int(11) NOT NULL,
  `SeverCreaterName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `SeverCreateTime` datetime DEFAULT NULL,
  `SeverModifyTime` datetime DEFAULT NULL,
  `SeverStrategyName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `SeverStrategyICMP` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `SeverStrategyTCP` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `SeverStrategyUDP` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `SeverStrategyExplain` varchar(254) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of severstrategytable
-- ----------------------------

-- ----------------------------
-- Table structure for startup
-- ----------------------------
DROP TABLE IF EXISTS `startup`;
CREATE TABLE `startup` (
  `id` int(11) NOT NULL,
  `startupProject` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `startupProgram` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `startupPath` longtext CHARACTER SET utf8,
  `enabled` int(11) DEFAULT '0',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of startup
-- ----------------------------

-- ----------------------------
-- Table structure for strategybaselinetable
-- ----------------------------
DROP TABLE IF EXISTS `strategybaselinetable`;
CREATE TABLE `strategybaselinetable` (
  `StrategyName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `CurrVersionNumber` int(11) DEFAULT NULL,
  `UseCurrBaseline` int(11) DEFAULT NULL,
  `updatatime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of strategybaselinetable
-- ----------------------------
INSERT INTO `strategybaselinetable` VALUES ('127.0.0.1', '1', '0', '2014-01-08 21:42:07');
INSERT INTO `strategybaselinetable` VALUES ('192.168.75.9', '3', '0', '2014-01-15 15:25:46');
INSERT INTO `strategybaselinetable` VALUES ('FileServer_test', '0', '0', '2014-01-15 15:27:16');

-- ----------------------------
-- Table structure for strategyhashval
-- ----------------------------
DROP TABLE IF EXISTS `strategyhashval`;
CREATE TABLE `strategyhashval` (
  `StrategyID` varchar(35) CHARACTER SET utf8 NOT NULL,
  `FileBasePath` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `FileHashVal` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of strategyhashval
-- ----------------------------
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\brmfcmf.inf_amd64_neutral_67b5984f8e8ff717\\BrmfBidi.ini', 'C0D5E78CC874643A461D6D0C01B776892', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\faxca003.inf_amd64_neutral_5b8c7c1dda79bef4\\CNHF1.INI', '687D5036FAE8598F7DA7B56C917F546D2', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnbr002.inf_amd64_neutral_db1d8c9efda9b3c0\\Amd64\\BRCI06A.INI', '7CC565D49D03D095BE9B6D91C4EACA0A2', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnbr003.inf_amd64_neutral_dff45d1d0df04caf\\Amd64\\BRMW2.INI', 'B3F9915ED0E89B3026A11D2EC9D3A5EA2', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\edgcc2wa.inf_amd64_neutral_33a00bf118273961\\Mixer.ini', '40F24A4A58D758D10E0BCE72F050988A2', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnbr003.inf_amd64_neutral_dff45d1d0df04caf\\Amd64\\BRPT2.INI', '4C9AF9FBD8A89FD54C1C6011A032F3B52', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnbr004.inf_amd64_neutral_a78e168d6944619a\\Amd64\\brci08a.ini', '70F3C4A5587BC07924298877255839F32', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnbr006.inf_amd64_neutral_f156853def526447\\Amd64\\BRUNI23A.INI', 'C7FE09DC283626180A2FA5E14F1F4F362', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnbr008.inf_amd64_neutral_0540370b0b1e348e\\Amd64\\BRCL05.INI', '8CD66C5FD8A151C45160E77A973BC9EF2', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnbr00a.inf_amd64_neutral_e7f3f91e6832ef5c\\Amd64\\BRMZ13.INI', '5EAA5CB6F77B9E7B8B4A5A0D6C3C115D2', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnca003.inf_amd64_neutral_8e91d4aa9330d2f8\\Amd64\\CNN0B007.INI', 'B56A6654941359DAE35F483983C072E02', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnca00g.inf_amd64_neutral_6f76b14b2912fa55\\Amd64\\CNBX4.INI', '3A8C15BA48EC1AEE30967CCEC907EA8F2', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnca00z.inf_amd64_neutral_27f402ce616c3ebc\\Amd64\\CNBJ4.INI', '9B925C0C4F83EDE8329B768B9EB2491B2', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0LB020.INI', '1C9BDC0832ADFDEC34F7699667FDF70B2', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0LB030.INI', 'AED94A148035337F715F809FFCFA1A282', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0LB040.INI', 'F2E568CB6BE6CF7C13819CD4BEF47E8C2', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0NB030.INI', '078643F5FD3DD2088CCAA555C3E5D82A2', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0NB050.INI', '83EB112CC2CDA96B03E9B60BAE3593302', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnep004.inf_amd64_neutral_63b22bfb6b93eaba\\Amd64\\EP7PII00.INI', 'D8242E3EA3FCE22BEFE549C4B5C5FB922', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnep00a.inf_amd64_neutral_92a4c727cdf4c2f7\\Amd64\\EP0NDC67.INI', 'EC09CAE1CBC23C8D0F9AD0E92E2F00292', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnbr005.inf_amd64_neutral_9e4cc05e0d4bcb33\\Amd64\\brci08b.ini', '14D3830C74AE4FF0C8C1C74CD1A143512', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnbr007.inf_amd64_neutral_add2acf1d573aef0\\Amd64\\BRCL06.INI', '5BBDB0415721A1DD308EC7D4155F3A302', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnbr009.inf_amd64_neutral_fd2ac5b9c40bd465\\Amd64\\brci14a.ini', '75EC105641A925E44A377618BC4B0F3C2', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnca00x.inf_amd64_neutral_eb0842aa932d01ee\\Amd64\\CNBJ3.INI', '4A93F2E35B32904ECFD19A28BC537C822', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0LB010.INI', '59983A017E45FC7BC85CD72A9E18ADB92', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0NB010.INI', '90ED0CA9FB7CC4CFE7DA42F0F33AB7732', '2014-01-09 16:50:58');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0NB040.INI', '3A4A125D6E646B89D4538DF46E56CE912', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0NB070.INI', '642A2A06890C289E25370D891BCD4A462', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnep00a.inf_amd64_neutral_92a4c727cdf4c2f7\\Amd64\\EP0NDC66.INI', 'EC09CAE1CBC23C8D0F9AD0E92E2F00292', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnep00l.inf_amd64_neutral_f1fa021d2221e2c7\\Amd64\\EP0LVPZ0.INI', 'D99D91B7881C3CDD17FE37ED6001076F2', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnep00l.inf_amd64_neutral_f1fa021d2221e2c7\\Amd64\\EP0LVPZ1.INI', 'EBD182850D337375F5D1E9BF4D5885522', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnep00l.inf_amd64_neutral_f1fa021d2221e2c7\\Amd64\\EP0LVPZA.INI', 'F85E934C6B1ABDC05C45D9BC20BF8DDE2', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnep654.inf_amd64_zh-cn_bba314accadaeff0\\Amd64\\EP7PII03.INI', 'CA5994D3505F4FF5CA3FBF404229344C2', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnfx002.inf_amd64_neutral_b6dd354531184f64\\Amd64\\FXUCCM01.INI', '19F59F37B2DC64A84E882E94605DF7582', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp002.inf_amd64_neutral_04d05d1f6a90ea24\\Amd64\\HPZ3Cwn7.INI', 'EA6F50EC87B359398DD54ECEA6C97CB32', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp002.inf_amd64_neutral_04d05d1f6a90ea24\\Amd64\\HPZ6CWN7.INI', '01DF8AF71858B163CABB0FCF12447F412', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp002.inf_amd64_neutral_04d05d1f6a90ea24\\Amd64\\HPZSCWN7.INI', '1895C3A1D5CC172D48237BCD3D6C3AB82', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp003.inf_amd64_neutral_4480210763997eb4\\Amd64\\hpQ307w7.ini', '726078BD996E53406502CB0953CA678F2', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp004.inf_amd64_neutral_53f688945cfc24cc\\Amd64\\hpb8500t.ini', 'B917DCA165219B83395A3368C4FE19A42', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp004.inf_amd64_neutral_53f688945cfc24cc\\Amd64\\hpc4500t.ini', '344CF78CE3F0399851B4B1F56338C77D2', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnge001.inf_amd64_neutral_cfffa4143b3c4592\\Amd64\\TTY.INI', '545EC462937935AB753418D8CA6D9E102', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp002.inf_amd64_neutral_04d05d1f6a90ea24\\Amd64\\HPZ5CWN7.INI', '2413ABC9E443A3B2CC03A867500EC4C62', '2014-01-09 16:50:59');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp004.inf_amd64_neutral_53f688945cfc24cc\\Amd64\\hpc5300t.ini', '3297FBC8265A8F98F9174E47696EC5A22', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp004.inf_amd64_neutral_53f688945cfc24cc\\Amd64\\hpc6300t.ini', '9EE8EDC157D603329969116DAB8C67B52', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hp6000na.ini', 'C4240CFF3120673824AD786A4B31037F2', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hp6500na.ini', 'EAAF9ED84BC9979E920A539F44A7CB952', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hp8500aa.ini', '334CB8A81FC3B3124D78FD2BF0A31E972', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hp8500na.ini', '1428EA3DCBB29B26AA02CBEAE03300D02', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hpc4600a.ini', 'DE81A190B45D1E1215058A6B342529CC2', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hpf4400a.ini', '251CB942B36782B473E023EB03BE06FC2', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnkm003.inf_amd64_neutral_48652cda3bb15180\\Amd64\\KOC451X.INI', 'EBFA3B9DDD913B97FBE5EF5823E5C1A12', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnkm003.inf_amd64_neutral_48652cda3bb15180\\Amd64\\KOM4650X.INI', 'EBFA3B9DDD913B97FBE5EF5823E5C1A12', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnkm003.inf_amd64_neutral_48652cda3bb15180\\Amd64\\KOP5650X.INI', 'EBFA3B9DDD913B97FBE5EF5823E5C1A12', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnky002.inf_amd64_neutral_525d9740c77e325f\\Amd64\\KYW7AUTO.INI', 'BEC0B210C44040FD79AF0D88FF11B2552', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnky004.inf_amd64_neutral_5db759db19acd3ae\\Amd64\\KYW7AUT4.INI', '4CA85E18F064E17D8FBDBC36FB4F8DE32', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnky009.inf_amd64_neutral_8e54c9ff272b72f1\\Amd64\\kyw7aut8.ini', 'F0CE980BCEB9C3F27133FEC60C3A46432', '2014-01-09 16:51:01');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnlx00v.inf_amd64_neutral_86ff307c66080d00\\Amd64\\lxkpcl.ini', '6DC358EFA0B9A0EC174B7E8B2F0203E82', '2014-01-09 16:51:01');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnms001.inf_amd64_neutral_9b214cd9b78760aa\\mxdwdui.ini', '99FCE82E3850D89B7F17A68C02C8F9FA2', '2014-01-09 16:51:01');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnrc00c.inf_amd64_neutral_53a58f4fd7d88575\\Amd64\\RICOHPS7.INI', '1EAA5BA7CD7E98C8416CC8687FFAE5D22', '2014-01-09 16:51:01');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnsa002.inf_amd64_neutral_d9df1d04d8cbe336\\Amd64\\smpicfg3.ini', '17742AA950C3B1624EE19847AFAF0ECA2', '2014-01-09 16:51:01');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp004.inf_amd64_neutral_53f688945cfc24cc\\Amd64\\hpc5500t.ini', 'D90596D51E1D1939404BF41DA48A1B1B2', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp004.inf_amd64_neutral_53f688945cfc24cc\\Amd64\\hpD5400t.ini', 'F1F2EEEC1DE8E69086A403D1FB9E743F2', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp004.inf_amd64_neutral_53f688945cfc24cc\\Amd64\\hpd7500t.ini', '605EA6C03640149CE2D80CED69D0E8CD2', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hp6000aa.ini', '2B2C217E074E042E87F7CDA4F33E07C62', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hp6500aa.ini', '3B6A97FB35BE67797152B0207C30DFE32', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hp8000aa.ini', 'E2E60C817142232EEAB3408933ECD7192', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hp8500ga.ini', '83143DC9BB6D8E4B4FDA68D0F14F040F2', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hpc309aa.ini', '28D542EE3FF405F040FC8A801A15224E2', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hpd2600a.ini', '41DBFE4D14B09CC468FD9E8540FAFBB62', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnkm003.inf_amd64_neutral_48652cda3bb15180\\Amd64\\KOC353X.INI', 'EBFA3B9DDD913B97FBE5EF5823E5C1A12', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnkm003.inf_amd64_neutral_48652cda3bb15180\\Amd64\\KOC650X.INI', 'EBFA3B9DDD913B97FBE5EF5823E5C1A12', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnkm003.inf_amd64_neutral_48652cda3bb15180\\Amd64\\KOP4650X.INI', 'EBFA3B9DDD913B97FBE5EF5823E5C1A12', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnky005.inf_amd64_neutral_8836be987024e6a9\\Amd64\\KYW7AUT3.INI', '0CF624FDF74C911EA648AA6CFB33ABAC2', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnky006.inf_amd64_neutral_522043c34551b0c0\\Amd64\\KYW7AUT5.INI', '94CC65B05CEC2CC50A20E3738D10FE0C2', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnky007.inf_amd64_neutral_e637699044f367f3\\Amd64\\KYW7AUT6.INI', 'F8B4478CA2B56DA751C957067A664D9D2', '2014-01-09 16:51:01');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnlx00x.inf_amd64_neutral_808baf4e08594a59\\Amd64\\lxkps.INI', '12DA90DC128674CC030C01C2BB8A35A02', '2014-01-09 16:51:01');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnlx00y.inf_amd64_neutral_977318f2317f5ddd\\Amd64\\LXKXL.INI', '771C12E2456AB7DA3C3325B67195882F2', '2014-01-09 16:51:01');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnms001.inf_amd64_neutral_9fe8503f82ce60fa\\mxdwdui.ini', '99FCE82E3850D89B7F17A68C02C8F9FA2', '2014-01-09 16:51:01');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnrc00a.inf_amd64_neutral_565c5d04cc520c48\\Amd64\\RIARES17.INI', '0C040DC734EA6AF41C762FC5322598E92', '2014-01-09 16:51:01');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnrc00a.inf_amd64_neutral_565c5d04cc520c48\\Amd64\\RIARES27.INI', '055EE1F5981A110C348FEAA88E818A642', '2014-01-09 16:51:01');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnky003.inf_amd64_neutral_fe7ea176f20ab839\\Amd64\\kyw7aut2.ini', '6B5BAAA5D35A4ABE5C7DC041DA1824522', '2014-01-09 16:51:00');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnky008.inf_amd64_neutral_9f6abc54cbf095f2\\Amd64\\KYW7AUT7.INI', 'E773E76D6C9D6DDE742B9205DBD7EDA22', '2014-01-09 16:51:01');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnso002.inf_amd64_neutral_c3b7ce4e6f71641f\\Amd64\\SODPP2.INI', 'C2770280476EE0473C23ED10997DD01E2', '2014-01-09 16:51:01');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnts002.inf_amd64_neutral_ad2aa922aa11af2c\\Amd64\\tsmpu002.ini', '5AA9DF59BAF3554065F39A9DCF1163482', '2014-01-09 16:51:01');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnts003.inf_amd64_neutral_33a68664c7e7ae4b\\Amd64\\tsmxu003.ini', 'C73A087BDFBD67937E0FD922D700F2CE2', '2014-01-09 16:51:01');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\smbdrv.inf_amd64_neutral_1fd6eb354a9132ca\\SmbDrv.ini', '205CA74CCC134A4E54D92E082C80937A2', '2014-01-09 16:51:01');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\synpd.inf_amd64_neutral_733e15876a222a98\\SynUnst.ini', '9D78273905E5DEC2A9A3600BB6F029AA2', '2014-01-09 16:51:02');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\inetsrv\\browscap.ini', '178DFAFFB62F529849852F80211571202', '2014-01-09 16:51:02');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\PerfStringBackup.INI', 'BC234D3E9A7289849AEEB391B7325E9F2', '2014-01-09 16:51:04');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\slmgr\\0804\\slmgr.ini', '58D0F76973E2E8B4A3315EBBA766CF072', '2014-01-09 16:51:04');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\winrm\\0409\\winrm.ini', 'B7205FB302A902162D33F95C8453F4042', '2014-01-09 16:51:04');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\winrm\\0804\\winrm.ini', '33B53E826DBCD2C6DC4584B24CEB8CAA2', '2014-01-09 16:51:05');
INSERT INTO `strategyhashval` VALUES ('20140115152716824', 'D:\\StrBackup\\20140115152716824\\192.168.75.9\\base\\TestFile001.txt', 'B4F6744AE64A1F00EF27ED085F288AB82', '2014-01-15 15:27:20');
INSERT INTO `strategyhashval` VALUES ('20140115152716824', 'D:\\StrBackup\\20140115152716824\\192.168.75.9\\base\\TestFile002.txt', 'BABB6000FDC36D26A7720D787CE08B5E2', '2014-01-15 15:27:20');
INSERT INTO `strategyhashval` VALUES ('20140115152716824', 'D:\\StrBackup\\20140115152716824\\192.168.75.9\\base\\TestSubFolder01\\TestSubFile011.txt', '0847AA307FF5880D7E0DD026684414E52', '2014-01-15 15:27:21');
INSERT INTO `strategyhashval` VALUES ('20140115152716824', 'D:\\StrBackup\\20140115152716824\\192.168.75.9\\base\\TestSubFolder01\\TestSubFile012.txt', 'AA09E118B9EB43FBC6E7E51C186690812', '2014-01-15 15:27:21');
INSERT INTO `strategyhashval` VALUES ('20140115152716824', 'D:\\StrBackup\\20140115152716824\\192.168.75.9\\base\\TestSubFolder02\\TestSubFile021.txt', '183AFBBFBDDA3785B8F90245CF35548F2', '2014-01-15 15:27:21');
INSERT INTO `strategyhashval` VALUES ('20140115152716824', 'D:\\StrBackup\\20140115152716824\\192.168.75.9\\base\\TestSubFolder02\\TestSubFile022.txt', '7D50C480BD128F264795A1DD85364DDE2', '2014-01-15 15:27:22');
INSERT INTO `strategyhashval` VALUES ('20140115152716824', 'D:\\StrBackup\\20140115152716824\\192.168.75.9\\base\\TestFile003.txt', 'FA70D6399E7FC1B293B4E692D45B1D982', '2014-01-15 15:31:38');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\config\\systemprofile\\AppData\\Local\\Microsoft\\Windows\\Temporary Internet Files\\Content.IE5\\desktop.ini', '4A3DEB274BB5F0212C2419D3D8D086122', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\config\\systemprofile\\AppData\\Local\\Microsoft\\Windows\\Temporary Internet Files\\Content.IE5\\L2V9DYRC\\desktop.ini', '4A3DEB274BB5F0212C2419D3D8D086122', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\config\\systemprofile\\AppData\\Local\\Microsoft\\Windows\\History\\History.IE5\\desktop.ini', 'BA96961F5E22882527919E19DAEA510F2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnbr004.inf_amd64_neutral_a78e168d6944619a\\Amd64\\brci08a.ini', '70F3C4A5587BC07924298877255839F32', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\brmfcmf.inf_amd64_neutral_67b5984f8e8ff717\\BrmfBidi.ini', 'C0D5E78CC874643A461D6D0C01B776892', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\DriverStore\\FileRepository\\prnsa002.inf_amd64_neutral_d9df1d04d8cbe336\\Amd64\\smpicfg2.ini', 'CFE832D6A226CD872EC189C78853884A2', '2014-01-09 16:51:01');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\GroupPolicy\\gpt.ini', 'EC3584F3DB838942EC3669DB02DC908E2', '2014-01-09 16:51:02');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\slmgr\\0409\\slmgr.ini', 'DC5D4560164097A635500268530B2D402', '2014-01-09 16:51:04');
INSERT INTO `strategyhashval` VALUES ('20140108214207512', 'D:\\StrBackup\\20140108214207512\\127.0.0.1\\base\\YingInstall\\804.ini', '2AAC7D75DD2205F9EEB6FA9D6B9F9AAB2', '2014-01-09 16:51:05');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\config\\systemprofile\\AppData\\Local\\Microsoft\\Windows\\Temporary Internet Files\\Content.IE5\\BPWYG2P6\\desktop.ini', '4A3DEB274BB5F0212C2419D3D8D086122', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnbr003.inf_amd64_neutral_dff45d1d0df04caf\\Amd64\\BRMW2.INI', 'B3F9915ED0E89B3026A11D2EC9D3A5EA2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnbr008.inf_amd64_neutral_0540370b0b1e348e\\Amd64\\BRCL05.INI', '8CD66C5FD8A151C45160E77A973BC9EF2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\oemprint.inf_amd64_neutral_21bdb09e1f4f998e\\amd64\\TPPS.INI', 'F7FAB0B313442B65E402C840782750CC2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnbr006.inf_amd64_neutral_f156853def526447\\Amd64\\BRUNI23A.INI', 'C7FE09DC283626180A2FA5E14F1F4F362', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnbr005.inf_amd64_neutral_9e4cc05e0d4bcb33\\Amd64\\brci08b.ini', '14D3830C74AE4FF0C8C1C74CD1A143512', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnca003.inf_amd64_neutral_8e91d4aa9330d2f8\\Amd64\\CNN0B007.INI', 'B56A6654941359DAE35F483983C072E02', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0LB010.INI', '59983A017E45FC7BC85CD72A9E18ADB92', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnbr003.inf_amd64_neutral_dff45d1d0df04caf\\Amd64\\BRPT2.INI', '4C9AF9FBD8A89FD54C1C6011A032F3B52', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnbr007.inf_amd64_neutral_add2acf1d573aef0\\Amd64\\BRCL06.INI', '5BBDB0415721A1DD308EC7D4155F3A302', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnca00g.inf_amd64_neutral_6f76b14b2912fa55\\Amd64\\CNBX4.INI', '3A8C15BA48EC1AEE30967CCEC907EA8F2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0NB030.INI', '078643F5FD3DD2088CCAA555C3E5D82A2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnbr00a.inf_amd64_neutral_e7f3f91e6832ef5c\\Amd64\\BRMZ13.INI', '5EAA5CB6F77B9E7B8B4A5A0D6C3C115D2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0NB010.INI', '90ED0CA9FB7CC4CFE7DA42F0F33AB7732', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnge001.inf_amd64_neutral_cfffa4143b3c4592\\Amd64\\TTY.INI', '545EC462937935AB753418D8CA6D9E102', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnep654.inf_amd64_zh-cn_77da7e02c000187c\\Amd64\\EP7PII03.INI', 'CA5994D3505F4FF5CA3FBF404229344C2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnep00a.inf_amd64_neutral_92a4c727cdf4c2f7\\Amd64\\EP0NDC67.INI', 'EC09CAE1CBC23C8D0F9AD0E92E2F00292', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\config\\systemprofile\\AppData\\Local\\Microsoft\\Windows\\History\\desktop.ini', 'BA96961F5E22882527919E19DAEA510F2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\config\\systemprofile\\AppData\\Local\\Microsoft\\Windows\\Temporary Internet Files\\desktop.ini', '4A3DEB274BB5F0212C2419D3D8D086122', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\faxca003.inf_amd64_neutral_5b8c7c1dda79bef4\\CNHF1.INI', '687D5036FAE8598F7DA7B56C917F546D2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnca00z.inf_amd64_neutral_27f402ce616c3ebc\\Amd64\\CNBJ4.INI', '9A931ED5E97CA0B04E13C5B391F0512C2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnbr002.inf_amd64_neutral_db1d8c9efda9b3c0\\Amd64\\BRCI06A.INI', '7CC565D49D03D095BE9B6D91C4EACA0A2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnbr009.inf_amd64_neutral_fd2ac5b9c40bd465\\Amd64\\brci14a.ini', '75EC105641A925E44A377618BC4B0F3C2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnca00x.inf_amd64_neutral_eb0842aa932d01ee\\Amd64\\CNBJ3.INI', '4A93F2E35B32904ECFD19A28BC537C822', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0LB030.INI', 'AED94A148035337F715F809FFCFA1A282', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnep00l.inf_amd64_neutral_f1fa021d2221e2c7\\Amd64\\EP0LVPZ0.INI', 'D99D91B7881C3CDD17FE37ED6001076F2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp004.inf_amd64_neutral_53f688945cfc24cc\\Amd64\\hpc4500t.ini', '344CF78CE3F0399851B4B1F56338C77D2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0NB070.INI', '642A2A06890C289E25370D891BCD4A462', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hpd2600a.ini', '41DBFE4D14B09CC468FD9E8540FAFBB62', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0NB040.INI', '3A4A125D6E646B89D4538DF46E56CE912', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hp8000aa.ini', 'E2E60C817142232EEAB3408933ECD7192', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp004.inf_amd64_neutral_53f688945cfc24cc\\Amd64\\hpb8500t.ini', 'B917DCA165219B83395A3368C4FE19A42', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp004.inf_amd64_neutral_53f688945cfc24cc\\Amd64\\hpc5300t.ini', '3297FBC8265A8F98F9174E47696EC5A22', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp002.inf_amd64_neutral_04d05d1f6a90ea24\\Amd64\\HPZ5CWN7.INI', '2413ABC9E443A3B2CC03A867500EC4C62', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp004.inf_amd64_neutral_53f688945cfc24cc\\Amd64\\hpD5400t.ini', 'F1F2EEEC1DE8E69086A403D1FB9E743F2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hpc4600a.ini', 'DE81A190B45D1E1215058A6B342529CC2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnts003.inf_amd64_neutral_33a68664c7e7ae4b\\Amd64\\tsmxu003.ini', 'C73A087BDFBD67937E0FD922D700F2CE2', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\config\\systemprofile\\AppData\\Local\\Microsoft\\Windows\\Temporary Internet Files\\Content.IE5\\L8FP09T3\\desktop.ini', '4A3DEB274BB5F0212C2419D3D8D086122', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\config\\systemprofile\\AppData\\Local\\Microsoft\\Windows\\Temporary Internet Files\\Content.IE5\\MR7X7S76\\desktop.ini', '4A3DEB274BB5F0212C2419D3D8D086122', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0LB040.INI', 'F2E568CB6BE6CF7C13819CD4BEF47E8C2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0LB020.INI', '1C9BDC0832ADFDEC34F7699667FDF70B2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnep003.inf_amd64_neutral_92ed2d842e0dd4ea\\Amd64\\EP0NB050.INI', '83EB112CC2CDA96B03E9B60BAE3593302', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnep00a.inf_amd64_neutral_92a4c727cdf4c2f7\\Amd64\\EP0NDC66.INI', 'EC09CAE1CBC23C8D0F9AD0E92E2F00292', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp002.inf_amd64_neutral_04d05d1f6a90ea24\\Amd64\\HPZ6CWN7.INI', '01DF8AF71858B163CABB0FCF12447F412', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnkm003.inf_amd64_neutral_48652cda3bb15180\\Amd64\\KOM4650X.INI', 'EBFA3B9DDD913B97FBE5EF5823E5C1A12', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp004.inf_amd64_neutral_53f688945cfc24cc\\Amd64\\hpd7500t.ini', '605EA6C03640149CE2D80CED69D0E8CD2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp003.inf_amd64_neutral_4480210763997eb4\\Amd64\\hpQ307w7.ini', '726078BD996E53406502CB0953CA678F2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnlx00y.inf_amd64_neutral_977318f2317f5ddd\\Amd64\\LXKXL.INI', '771C12E2456AB7DA3C3325B67195882F2', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnsa002.inf_amd64_neutral_d9df1d04d8cbe336\\Amd64\\smpicfg2.ini', 'CFE832D6A226CD872EC189C78853884A2', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hp6000na.ini', 'C4240CFF3120673824AD786A4B31037F2', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnsa002.inf_amd64_neutral_d9df1d04d8cbe336\\Amd64\\smpicfg3.ini', '17742AA950C3B1624EE19847AFAF0ECA2', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hp6500na.ini', 'EAAF9ED84BC9979E920A539F44A7CB952', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnky002.inf_amd64_neutral_525d9740c77e325f\\Amd64\\KYW7AUTO.INI', 'BEC0B210C44040FD79AF0D88FF11B2552', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnky007.inf_amd64_neutral_e637699044f367f3\\Amd64\\KYW7AUT6.INI', 'F8B4478CA2B56DA751C957067A664D9D2', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnms001.inf_amd64_neutral_9b214cd9b78760aa\\mxdwdui.ini', '99FCE82E3850D89B7F17A68C02C8F9FA2', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnts002.inf_amd64_neutral_ad2aa922aa11af2c\\Amd64\\tsmpu002.ini', '5AA9DF59BAF3554065F39A9DCF1163482', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnkm003.inf_amd64_neutral_48652cda3bb15180\\Amd64\\KOP5650X.INI', 'EBFA3B9DDD913B97FBE5EF5823E5C1A12', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp002.inf_amd64_neutral_04d05d1f6a90ea24\\Amd64\\HPZ3Cwn7.INI', 'EA6F50EC87B359398DD54ECEA6C97CB32', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnep00l.inf_amd64_neutral_f1fa021d2221e2c7\\Amd64\\EP0LVPZ1.INI', 'EBD182850D337375F5D1E9BF4D5885522', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnlx00x.inf_amd64_neutral_808baf4e08594a59\\Amd64\\lxkps.INI', '12DA90DC128674CC030C01C2BB8A35A02', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnfx002.inf_amd64_neutral_b6dd354531184f64\\Amd64\\FXUCCM01.INI', '19F59F37B2DC64A84E882E94605DF7582', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnky006.inf_amd64_neutral_522043c34551b0c0\\Amd64\\KYW7AUT5.INI', '94CC65B05CEC2CC50A20E3738D10FE0C2', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hp6000aa.ini', '2B2C217E074E042E87F7CDA4F33E07C62', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp004.inf_amd64_neutral_53f688945cfc24cc\\Amd64\\hpc6300t.ini', '9EE8EDC157D603329969116DAB8C67B52', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hp8500aa.ini', '334CB8A81FC3B3124D78FD2BF0A31E972', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnky004.inf_amd64_neutral_5db759db19acd3ae\\Amd64\\KYW7AUT4.INI', '4CA85E18F064E17D8FBDBC36FB4F8DE32', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnlx00v.inf_amd64_neutral_86ff307c66080d00\\Amd64\\lxkpcl.ini', '6DC358EFA0B9A0EC174B7E8B2F0203E82', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnrc00a.inf_amd64_neutral_565c5d04cc520c48\\Amd64\\RIARES27.INI', '055EE1F5981A110C348FEAA88E818A642', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\pooltag.ini', 'D3EBC111669469D57339D949EED7D08A2', '2014-01-15 15:36:10');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\spool\\drivers\\x64\\3\\TPPS.INI', 'F7FAB0B313442B65E402C840782750CC2', '2014-01-15 15:36:10');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnep004.inf_amd64_neutral_63b22bfb6b93eaba\\Amd64\\EP7PII00.INI', 'D8242E3EA3FCE22BEFE549C4B5C5FB922', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnky005.inf_amd64_neutral_8836be987024e6a9\\Amd64\\KYW7AUT3.INI', '0CF624FDF74C911EA648AA6CFB33ABAC2', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp004.inf_amd64_neutral_53f688945cfc24cc\\Amd64\\hpc5500t.ini', 'D90596D51E1D1939404BF41DA48A1B1B2', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnkm003.inf_amd64_neutral_48652cda3bb15180\\Amd64\\KOP4650X.INI', 'EBFA3B9DDD913B97FBE5EF5823E5C1A12', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnkm003.inf_amd64_neutral_48652cda3bb15180\\Amd64\\KOC353X.INI', 'EBFA3B9DDD913B97FBE5EF5823E5C1A12', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hpf4400a.ini', '251CB942B36782B473E023EB03BE06FC2', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnky008.inf_amd64_neutral_9f6abc54cbf095f2\\Amd64\\KYW7AUT7.INI', 'E773E76D6C9D6DDE742B9205DBD7EDA22', '2014-01-15 15:36:02');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnep00l.inf_amd64_neutral_f1fa021d2221e2c7\\Amd64\\EP0LVPZA.INI', 'F85E934C6B1ABDC05C45D9BC20BF8DDE2', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnky009.inf_amd64_neutral_8e54c9ff272b72f1\\Amd64\\kyw7aut8.ini', 'F0CE980BCEB9C3F27133FEC60C3A46432', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnrc00a.inf_amd64_neutral_565c5d04cc520c48\\Amd64\\RIARES17.INI', '0C040DC734EA6AF41C762FC5322598E92', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp002.inf_amd64_neutral_04d05d1f6a90ea24\\Amd64\\HPZSCWN7.INI', '1895C3A1D5CC172D48237BCD3D6C3AB82', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hpc309aa.ini', '28D542EE3FF405F040FC8A801A15224E2', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\tcpmon.ini', 'C3A4729C58B41493ACF92E822BD73F5B2', '2014-01-15 15:36:10');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\spool\\drivers\\x64\\3\\mxdwdui.ini', '99FCE82E3850D89B7F17A68C02C8F9FA2', '2014-01-15 15:36:10');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hp8500ga.ini', '83143DC9BB6D8E4B4FDA68D0F14F040F2', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnso002.inf_amd64_neutral_c3b7ce4e6f71641f\\Amd64\\SODPP2.INI', 'C2770280476EE0473C23ED10997DD01E2', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnky003.inf_amd64_neutral_fe7ea176f20ab839\\Amd64\\kyw7aut2.ini', '6B5BAAA5D35A4ABE5C7DC041DA1824522', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnrc00c.inf_amd64_neutral_53a58f4fd7d88575\\Amd64\\RICOHPS7.INI', '1EAA5BA7CD7E98C8416CC8687FFAE5D22', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hp8500na.ini', '1428EA3DCBB29B26AA02CBEAE03300D02', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\PerfStringBackup.INI', '74AB18DB91F4329E8B02D594F5DB4D732', '2014-01-15 15:36:06');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\slmgr\\0804\\slmgr.ini', '58D0F76973E2E8B4A3315EBBA766CF072', '2014-01-15 15:36:10');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\wbem\\Performance\\WmiApRpl.ini', '5A301F51BC9C1C86BA4031B8711DC0342', '2014-01-15 15:36:10');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\winrm\\0804\\winrm.ini', '33B53E826DBCD2C6DC4584B24CEB8CAA2', '2014-01-15 15:36:10');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\spool\\tools\\Microsoft XPS Document Writer\\mxdwdui.ini', '99FCE82E3850D89B7F17A68C02C8F9FA2', '2014-01-15 15:36:10');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\1\\PerfStringBackup - 副本.INI', 'C9AC5977B5D9BC05A7BE717A6E358FB32', '2014-01-15 15:37:05');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\1\\PerfStringBackup.INI', 'C9AC5977B5D9BC05A7BE717A6E358FB32', '2014-01-15 15:37:06');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnkm003.inf_amd64_neutral_48652cda3bb15180\\Amd64\\KOC451X.INI', 'EBFA3B9DDD913B97FBE5EF5823E5C1A12', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnkm003.inf_amd64_neutral_48652cda3bb15180\\Amd64\\KOC650X.INI', 'EBFA3B9DDD913B97FBE5EF5823E5C1A12', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\base\\DriverStore\\FileRepository\\prnhp005.inf_amd64_neutral_914d6c300207814f\\Amd64\\hp6500aa.ini', '3B6A97FB35BE67797152B0207C30DFE32', '2014-01-15 15:36:03');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\2\\PerfStringBackup - 副本.INI', 'C9AC5977B5D9BC05A7BE717A6E358FB32', '2014-01-15 16:00:14');
INSERT INTO `strategyhashval` VALUES ('20140115152546011', 'D:\\StrBackup\\20140115152546011\\192.168.75.9\\2\\PerfStringBackup.INI', 'B3ECFC3243D23F17B84A47258E4059062', '2014-01-15 16:00:14');

-- ----------------------------
-- Table structure for strategytable
-- ----------------------------
DROP TABLE IF EXISTS `strategytable`;
CREATE TABLE `strategytable` (
  `StrategyName` varchar(254) CHARACTER SET utf8 NOT NULL,
  `StrategyDescriptor` longtext CHARACTER SET utf8,
  `StrategyType` int(11) NOT NULL,
  `SelectedItem` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `ItemAttribute` int(11) DEFAULT '0',
  `DeviceType` int(11) DEFAULT '0',
  `LoginType` int(11) DEFAULT '0',
  `UserId` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `LoginId` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `ManageId` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `SelectedFolder` longtext CHARACTER SET utf8,
  `FilterType` int(11) DEFAULT '0',
  `SelectedFileType` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `TaskMode` int(11) DEFAULT '0',
  `StartTime` int(11) DEFAULT '0',
  `NumOfDay` int(11) DEFAULT '0',
  `NumOfWeek` int(11) DEFAULT '0',
  `WhichWeek` int(11) DEFAULT '0',
  `WhichMonth` int(11) DEFAULT '0',
  `mode` int(11) DEFAULT '0',
  `DayOfMonth` int(11) DEFAULT '0',
  `WeekOfMonth` int(11) DEFAULT '0',
  `DayOfWeek` int(11) DEFAULT '0',
  `OverTime` int(11) DEFAULT '0',
  `IsAutoDelete` int(11) DEFAULT '0',
  `IsStopTask` int(11) DEFAULT '0',
  `NumOfHours` int(11) DEFAULT '0',
  `NumOfMunites` int(11) DEFAULT '0',
  `IsStartHips` int(11) DEFAULT '0',
  `IsHistoryCopy` int(11) DEFAULT '0',
  `IsSavePlace` int(11) DEFAULT '0',
  `IsReport` int(11) DEFAULT '0',
  `IsJiXianData` int(11) DEFAULT '0',
  `FilterBehavior` int(11) DEFAULT '0',
  `DefaultRule` int(11) DEFAULT '0',
  `NumOfHistoryCopy` int(11) DEFAULT '0',
  `SavePlace` longtext CHARACTER SET utf8,
  `ReportPlace` longtext CHARACTER SET utf8,
  `IP` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `Status` int(11) DEFAULT '0',
  `id` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `IgnoreFolder` longtext CHARACTER SET utf8,
  `RunStatus` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of strategytable
-- ----------------------------
INSERT INTO `strategytable` VALUES ('system_strategy', '系统默认策略', '0', 'Windows 2008 Server完整性监测(64)', '5', '0', '0', '  ', '  ', '  ', '  ', '0', '  ', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', 'D:\\StrBackup', 'natogo@gcexe.com', '127.0.0.1', '1', '20140108214207512', '  ', '0');
INSERT INTO `strategytable` VALUES ('192.168.1.22', '系统默认策略', '0', 'Windows 2008 Server完整性监测', '5', '0', '0', '  ', '  ', '  ', '  ', '0', '  ', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '1', '31', '0', 'D:\\StrBackup', 'natogo@gcexe.com', '192.168.1.22', '1', '20140115150107595', '  ', '0');
INSERT INTO `strategytable` VALUES ('192.168.1.8', '系统默认策略', '0', 'Windows 2008 Server完整性监测', '5', '0', '0', '  ', '  ', '  ', '  ', '0', '  ', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '1', '31', '0', 'D:\\StrBackup', 'natogo@gcexe.com', '192.168.1.8', '1', '20140115150125598', '  ', '0');
INSERT INTO `strategytable` VALUES ('NetWork_test', '自定义网络设备测试', '8', 'NetWork', '0', '0', '0', 'ff', 'sf', 'sfs', '  ', '0', '  ', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'D:\\StrBackup', '@', '192.168.1.11', '1', '20140115150259307', '  ', '0');
INSERT INTO `strategytable` VALUES ('FileStrategy', '文件策略', '6', 'File_Custom', '0', '0', '0', '  ', '  ', '  ', 'C:\\Windows\\System32', '0', '  ', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'D:\\StrBackup', '@', '  ', '1', '20140115150437462', '  ', '0');
INSERT INTO `strategytable` VALUES ('192.168.75.9', '系统默认策略', '0', 'Windows 2008 Server完整性监测', '5', '0', '0', '  ', '  ', '  ', '  ', '0', '  ', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '1', '31', '0', 'D:\\StrBackup', 'natogo@gcexe.com', '192.168.75.9', '1', '20140115152546011', '  ', '0');
INSERT INTO `strategytable` VALUES ('dsf', 'asdfasdf', '6', 'File_Custom', '0', '0', '0', '  ', '  ', '  ', 'C:\\Windows\\System32', '0', '  ', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '31', '1', '0', 'D:\\', '@', '  ', '1', '20140220161109390', '  ', '0');
INSERT INTO `strategytable` VALUES ('FileServer_test', '文件服务器测试', '7', '自定义文件系统完整性监测策略', '0', '0', '0', '  ', '  ', '  ', 'C:\\Test Folder', '0', '  ', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'D:\\StrBackup', '59588468@qq.com', '192.168.75.9', '1', '20140115152716824', '  ', '0');

-- ----------------------------
-- Table structure for systemlog
-- ----------------------------
DROP TABLE IF EXISTS `systemlog`;
CREATE TABLE `systemlog` (
  `LogHostIp` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `LogTime` datetime DEFAULT NULL,
  `LogStyle` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `LogContent` longtext CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of systemlog
-- ----------------------------

-- ----------------------------
-- Table structure for trust
-- ----------------------------
DROP TABLE IF EXISTS `trust`;
CREATE TABLE `trust` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `ClientIP` varchar(16) CHARACTER SET utf8 NOT NULL,
  `Content` longtext CHARACTER SET utf8,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of trust
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `comment` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `permission` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', 'admin', '内置管理员', '1', '31');
INSERT INTO `users` VALUES ('2', 'admin1', 'admin', '内置管理员1', '1', '31');
INSERT INTO `users` VALUES ('4', 'cxc1', 'cxc', 'xc', '0', '0');

-- ----------------------------
-- Table structure for vulnerabilityfix
-- ----------------------------
DROP TABLE IF EXISTS `vulnerabilityfix`;
CREATE TABLE `vulnerabilityfix` (
  `id` int(11) NOT NULL,
  `vulnerabilityDoc` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `patchNumber` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `patchSize` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `releaseDate` datetime DEFAULT NULL,
  `ip` varchar(16) CHARACTER SET utf8 DEFAULT NULL,
  `vulnerabilityType` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vulnerabilityfix
-- ----------------------------

-- ----------------------------
-- Table structure for winshare
-- ----------------------------
DROP TABLE IF EXISTS `winshare`;
CREATE TABLE `winshare` (
  `id` int(11) NOT NULL,
  `shareName` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `shareType` varchar(254) CHARACTER SET utf8 DEFAULT NULL,
  `sharePath` longtext CHARACTER SET utf8,
  `enabled` int(11) DEFAULT '0',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of winshare
-- ----------------------------
