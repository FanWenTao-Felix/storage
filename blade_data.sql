/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : blade_data

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 22/07/2019 15:25:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ACT_APP_APPDEF
-- ----------------------------
DROP TABLE IF EXISTS `ACT_APP_APPDEF`;
CREATE TABLE `ACT_APP_APPDEF` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_APP_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`),
  KEY `ACT_IDX_APP_DEF_DPLY` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_APP_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_APP_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_APP_DATABASECHANGELOG
-- ----------------------------
DROP TABLE IF EXISTS `ACT_APP_DATABASECHANGELOG`;
CREATE TABLE `ACT_APP_DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of ACT_APP_DATABASECHANGELOG
-- ----------------------------
BEGIN;
INSERT INTO `ACT_APP_DATABASECHANGELOG` VALUES ('1', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2019-07-22 14:34:45', 1, 'EXECUTED', '8:496fc778bdf2ab13f2e1926d0e63e0a2', 'createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...', '', NULL, '3.6.3', NULL, NULL, '3777284884');
INSERT INTO `ACT_APP_DATABASECHANGELOG` VALUES ('2', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2019-07-22 14:34:45', 2, 'EXECUTED', '8:ccea9ebfb6c1f8367ca4dd473fcbb7db', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_APP_DEPLOYMENT', '', NULL, '3.6.3', NULL, NULL, '3777284884');
INSERT INTO `ACT_APP_DATABASECHANGELOG` VALUES ('3', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2019-07-22 14:34:45', 3, 'EXECUTED', '8:f1f8aff320aade831944ebad24355f3d', 'createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF', '', NULL, '3.6.3', NULL, NULL, '3777284884');
COMMIT;

-- ----------------------------
-- Table structure for ACT_APP_DATABASECHANGELOGLOCK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_APP_DATABASECHANGELOGLOCK`;
CREATE TABLE `ACT_APP_DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of ACT_APP_DATABASECHANGELOGLOCK
-- ----------------------------
BEGIN;
INSERT INTO `ACT_APP_DATABASECHANGELOGLOCK` VALUES (1, b'0', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ACT_APP_DEPLOYMENT
-- ----------------------------
DROP TABLE IF EXISTS `ACT_APP_DEPLOYMENT`;
CREATE TABLE `ACT_APP_DEPLOYMENT` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_APP_DEPLOYMENT_RESOURCE
-- ----------------------------
DROP TABLE IF EXISTS `ACT_APP_DEPLOYMENT_RESOURCE`;
CREATE TABLE `ACT_APP_DEPLOYMENT_RESOURCE` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_APP_RSRC_DPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_APP_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_APP_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_CMMN_CASEDEF
-- ----------------------------
DROP TABLE IF EXISTS `ACT_CMMN_CASEDEF`;
CREATE TABLE `ACT_CMMN_CASEDEF` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` bit(1) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8mb4_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_CASE_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`),
  KEY `ACT_IDX_CASE_DEF_DPLY` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_CASE_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_CMMN_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_CMMN_DATABASECHANGELOG
-- ----------------------------
DROP TABLE IF EXISTS `ACT_CMMN_DATABASECHANGELOG`;
CREATE TABLE `ACT_CMMN_DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of ACT_CMMN_DATABASECHANGELOG
-- ----------------------------
BEGIN;
INSERT INTO `ACT_CMMN_DATABASECHANGELOG` VALUES ('1', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-07-22 14:34:42', 1, 'EXECUTED', '8:8b4b922d90b05ff27483abefc9597aa6', 'createTable tableName=ACT_CMMN_DEPLOYMENT; createTable tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_CMMN_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_CMMN_RSRC_DPL, referencedTableName=ACT_CMMN_DEPLOYMENT; create...', '', NULL, '3.6.3', NULL, NULL, '3777282216');
INSERT INTO `ACT_CMMN_DATABASECHANGELOG` VALUES ('2', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-07-22 14:34:42', 2, 'EXECUTED', '8:65e39b3d385706bb261cbeffe7533cbe', 'addColumn tableName=ACT_CMMN_CASEDEF; addColumn tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST', '', NULL, '3.6.3', NULL, NULL, '3777282216');
INSERT INTO `ACT_CMMN_DATABASECHANGELOG` VALUES ('3', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-07-22 14:34:42', 3, 'EXECUTED', '8:c01f6e802b49436b4489040da3012359', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...', '', NULL, '3.6.3', NULL, NULL, '3777282216');
INSERT INTO `ACT_CMMN_DATABASECHANGELOG` VALUES ('4', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-07-22 14:34:43', 4, 'EXECUTED', '8:e40d29cb79345b7fb5afd38a7f0ba8fc', 'createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST', '', NULL, '3.6.3', NULL, NULL, '3777282216');
INSERT INTO `ACT_CMMN_DATABASECHANGELOG` VALUES ('5', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-07-22 14:34:44', 5, 'EXECUTED', '8:70349de472f87368dcdec971a10311a0', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_CMMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_CASE_INST; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; modifyDataType columnName=T...', '', NULL, '3.6.3', NULL, NULL, '3777282216');
INSERT INTO `ACT_CMMN_DATABASECHANGELOG` VALUES ('6', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-07-22 14:34:44', 6, 'EXECUTED', '8:10e82e26a7fee94c32a92099c059c18c', 'createIndex indexName=ACT_IDX_CASE_DEF_UNIQ, tableName=ACT_CMMN_CASEDEF', '', NULL, '3.6.3', NULL, NULL, '3777282216');
INSERT INTO `ACT_CMMN_DATABASECHANGELOG` VALUES ('7', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2019-07-22 14:34:44', 7, 'EXECUTED', '8:530bc81a1e30618ccf4a2da1f7c6c043', 'renameColumn newColumnName=CREATE_TIME_, oldColumnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; renameColumn newColumnName=CREATE_TIME_, oldColumnName=CREATED_TIME_, tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_P...', '', NULL, '3.6.3', NULL, NULL, '3777282216');
COMMIT;

-- ----------------------------
-- Table structure for ACT_CMMN_DATABASECHANGELOGLOCK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_CMMN_DATABASECHANGELOGLOCK`;
CREATE TABLE `ACT_CMMN_DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of ACT_CMMN_DATABASECHANGELOGLOCK
-- ----------------------------
BEGIN;
INSERT INTO `ACT_CMMN_DATABASECHANGELOGLOCK` VALUES (1, b'0', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ACT_CMMN_DEPLOYMENT
-- ----------------------------
DROP TABLE IF EXISTS `ACT_CMMN_DEPLOYMENT`;
CREATE TABLE `ACT_CMMN_DEPLOYMENT` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_CMMN_DEPLOYMENT_RESOURCE
-- ----------------------------
DROP TABLE IF EXISTS `ACT_CMMN_DEPLOYMENT_RESOURCE`;
CREATE TABLE `ACT_CMMN_DEPLOYMENT_RESOURCE` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  `GENERATED_` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_CMMN_RSRC_DPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_CMMN_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_CMMN_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_CMMN_HI_CASE_INST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_CMMN_HI_CASE_INST`;
CREATE TABLE `ACT_CMMN_HI_CASE_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `REV_` int(11) NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `PARENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_CMMN_HI_MIL_INST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_CMMN_HI_MIL_INST`;
CREATE TABLE `ACT_CMMN_HI_MIL_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_CMMN_HI_PLAN_ITEM_INST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_CMMN_HI_PLAN_ITEM_INST`;
CREATE TABLE `ACT_CMMN_HI_PLAN_ITEM_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `IS_STAGE_` bit(1) DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ITEM_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) DEFAULT NULL,
  `EXIT_TIME_` datetime(3) DEFAULT NULL,
  `ENDED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `ENTRY_CRITERION_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_CMMN_RU_CASE_INST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_CMMN_RU_CASE_INST`;
CREATE TABLE `ACT_CMMN_RU_CASE_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `REV_` int(11) NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `PARENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `LOCK_TIME_` datetime(3) DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_CASE_INST_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_CASE_INST_PARENT` (`PARENT_ID_`),
  CONSTRAINT `ACT_FK_CASE_INST_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_CMMN_CASEDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_CMMN_RU_MIL_INST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_CMMN_RU_MIL_INST`;
CREATE TABLE `ACT_CMMN_RU_MIL_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_MIL_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_MIL_CASE_INST` (`CASE_INST_ID_`),
  CONSTRAINT `ACT_FK_MIL_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_CMMN_CASEDEF` (`ID_`),
  CONSTRAINT `ACT_FK_MIL_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_CMMN_RU_CASE_INST` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_CMMN_RU_PLAN_ITEM_INST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_CMMN_RU_PLAN_ITEM_INST`;
CREATE TABLE `ACT_CMMN_RU_PLAN_ITEM_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `REV_` int(11) NOT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `IS_STAGE_` bit(1) DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `ITEM_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) DEFAULT NULL,
  `IS_COUNT_ENABLED_` bit(1) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `SENTRY_PART_INST_COUNT_` int(11) DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) DEFAULT NULL,
  `EXIT_TIME_` datetime(3) DEFAULT NULL,
  `ENDED_TIME_` datetime(3) DEFAULT NULL,
  `ENTRY_CRITERION_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_PLAN_ITEM_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_PLAN_ITEM_CASE_INST` (`CASE_INST_ID_`),
  KEY `ACT_IDX_PLAN_ITEM_STAGE_INST` (`STAGE_INST_ID_`),
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_CMMN_CASEDEF` (`ID_`),
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_CMMN_RU_CASE_INST` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_CMMN_RU_SENTRY_PART_INST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_CMMN_RU_SENTRY_PART_INST`;
CREATE TABLE `ACT_CMMN_RU_SENTRY_PART_INST` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `REV_` int(11) NOT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `PLAN_ITEM_INST_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ON_PART_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `IF_PART_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_SENTRY_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_SENTRY_CASE_INST` (`CASE_INST_ID_`),
  KEY `ACT_IDX_SENTRY_PLAN_ITEM` (`PLAN_ITEM_INST_ID_`),
  CONSTRAINT `ACT_FK_SENTRY_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `ACT_CMMN_CASEDEF` (`ID_`),
  CONSTRAINT `ACT_FK_SENTRY_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `ACT_CMMN_RU_CASE_INST` (`ID_`),
  CONSTRAINT `ACT_FK_SENTRY_PLAN_ITEM` FOREIGN KEY (`PLAN_ITEM_INST_ID_`) REFERENCES `ACT_CMMN_RU_PLAN_ITEM_INST` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_CO_CONTENT_ITEM
-- ----------------------------
DROP TABLE IF EXISTS `ACT_CO_CONTENT_ITEM`;
CREATE TABLE `ACT_CO_CONTENT_ITEM` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `MIME_TYPE_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TASK_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTENT_STORE_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTENT_STORE_NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `FIELD_` varchar(400) COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTENT_AVAILABLE_` bit(1) DEFAULT b'0',
  `CREATED_` timestamp(6) NULL DEFAULT NULL,
  `CREATED_BY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `LAST_MODIFIED_` timestamp(6) NULL DEFAULT NULL,
  `LAST_MODIFIED_BY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTENT_SIZE_` bigint(20) DEFAULT '0',
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `idx_contitem_taskid` (`TASK_ID_`),
  KEY `idx_contitem_procid` (`PROC_INST_ID_`),
  KEY `idx_contitem_scope` (`SCOPE_ID_`,`SCOPE_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_CO_DATABASECHANGELOG
-- ----------------------------
DROP TABLE IF EXISTS `ACT_CO_DATABASECHANGELOG`;
CREATE TABLE `ACT_CO_DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of ACT_CO_DATABASECHANGELOG
-- ----------------------------
BEGIN;
INSERT INTO `ACT_CO_DATABASECHANGELOG` VALUES ('1', 'activiti', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', '2019-07-22 14:34:41', 1, 'EXECUTED', '8:7644d7165cfe799200a2abdd3419e8b6', 'createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM', '', NULL, '3.6.3', NULL, NULL, '3777281851');
INSERT INTO `ACT_CO_DATABASECHANGELOG` VALUES ('2', 'flowable', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', '2019-07-22 14:34:41', 2, 'EXECUTED', '8:fe7b11ac7dbbf9c43006b23bbab60bab', 'addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM', '', NULL, '3.6.3', NULL, NULL, '3777281851');
COMMIT;

-- ----------------------------
-- Table structure for ACT_CO_DATABASECHANGELOGLOCK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_CO_DATABASECHANGELOGLOCK`;
CREATE TABLE `ACT_CO_DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of ACT_CO_DATABASECHANGELOGLOCK
-- ----------------------------
BEGIN;
INSERT INTO `ACT_CO_DATABASECHANGELOGLOCK` VALUES (1, b'0', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ACT_DMN_DATABASECHANGELOG
-- ----------------------------
DROP TABLE IF EXISTS `ACT_DMN_DATABASECHANGELOG`;
CREATE TABLE `ACT_DMN_DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of ACT_DMN_DATABASECHANGELOG
-- ----------------------------
BEGIN;
INSERT INTO `ACT_DMN_DATABASECHANGELOG` VALUES ('1', 'activiti', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-07-22 14:34:41', 1, 'EXECUTED', '8:c8701f1c71018b55029f450b2e9a10a1', 'createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE', '', NULL, '3.6.3', NULL, NULL, '3777281240');
INSERT INTO `ACT_DMN_DATABASECHANGELOG` VALUES ('2', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-07-22 14:34:41', 2, 'EXECUTED', '8:47f94b27feb7df8a30d4e338c7bd5fb8', 'createTable tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '3.6.3', NULL, NULL, '3777281240');
INSERT INTO `ACT_DMN_DATABASECHANGELOG` VALUES ('3', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-07-22 14:34:41', 3, 'EXECUTED', '8:ac17eae89fbdccb6e08daf3c7797b579', 'addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '3.6.3', NULL, NULL, '3777281240');
INSERT INTO `ACT_DMN_DATABASECHANGELOG` VALUES ('4', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-07-22 14:34:41', 4, 'EXECUTED', '8:f73aabc4529e7292c2942073d1cff6f9', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE', '', NULL, '3.6.3', NULL, NULL, '3777281240');
INSERT INTO `ACT_DMN_DATABASECHANGELOG` VALUES ('5', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-07-22 14:34:41', 5, 'EXECUTED', '8:3e03528582dd4eeb4eb41f9b9539140d', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_DMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION; modifyDataType columnName=END_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '3.6.3', NULL, NULL, '3777281240');
INSERT INTO `ACT_DMN_DATABASECHANGELOG` VALUES ('6', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2019-07-22 14:34:41', 6, 'EXECUTED', '8:646c6a061e0b6e8a62e69844ff96abb0', 'createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE', '', NULL, '3.6.3', NULL, NULL, '3777281240');
COMMIT;

-- ----------------------------
-- Table structure for ACT_DMN_DATABASECHANGELOGLOCK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_DMN_DATABASECHANGELOGLOCK`;
CREATE TABLE `ACT_DMN_DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of ACT_DMN_DATABASECHANGELOGLOCK
-- ----------------------------
BEGIN;
INSERT INTO `ACT_DMN_DATABASECHANGELOGLOCK` VALUES (1, b'0', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ACT_DMN_DECISION_TABLE
-- ----------------------------
DROP TABLE IF EXISTS `ACT_DMN_DECISION_TABLE`;
CREATE TABLE `ACT_DMN_DECISION_TABLE` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_DEC_TBL_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_DMN_DEPLOYMENT
-- ----------------------------
DROP TABLE IF EXISTS `ACT_DMN_DEPLOYMENT`;
CREATE TABLE `ACT_DMN_DEPLOYMENT` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_DMN_DEPLOYMENT_RESOURCE
-- ----------------------------
DROP TABLE IF EXISTS `ACT_DMN_DEPLOYMENT_RESOURCE`;
CREATE TABLE `ACT_DMN_DEPLOYMENT_RESOURCE` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_DMN_HI_DECISION_EXECUTION
-- ----------------------------
DROP TABLE IF EXISTS `ACT_DMN_HI_DECISION_EXECUTION`;
CREATE TABLE `ACT_DMN_HI_DECISION_EXECUTION` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `DECISION_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `INSTANCE_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `FAILED_` bit(1) DEFAULT b'0',
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `EXECUTION_JSON_` longtext COLLATE utf8mb4_bin,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_EVT_LOG
-- ----------------------------
DROP TABLE IF EXISTS `ACT_EVT_LOG`;
CREATE TABLE `ACT_EVT_LOG` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_FO_DATABASECHANGELOG
-- ----------------------------
DROP TABLE IF EXISTS `ACT_FO_DATABASECHANGELOG`;
CREATE TABLE `ACT_FO_DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of ACT_FO_DATABASECHANGELOG
-- ----------------------------
BEGIN;
INSERT INTO `ACT_FO_DATABASECHANGELOG` VALUES ('1', 'activiti', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2019-07-22 14:34:41', 1, 'EXECUTED', '8:033ebf9380889aed7c453927ecc3250d', 'createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE', '', NULL, '3.6.3', NULL, NULL, '3777281600');
INSERT INTO `ACT_FO_DATABASECHANGELOG` VALUES ('2', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2019-07-22 14:34:41', 2, 'EXECUTED', '8:986365ceb40445ce3b27a8e6b40f159b', 'addColumn tableName=ACT_FO_FORM_INSTANCE', '', NULL, '3.6.3', NULL, NULL, '3777281600');
INSERT INTO `ACT_FO_DATABASECHANGELOG` VALUES ('3', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2019-07-22 14:34:41', 3, 'EXECUTED', '8:abf482518ceb09830ef674e52c06bf15', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION', '', NULL, '3.6.3', NULL, NULL, '3777281600');
INSERT INTO `ACT_FO_DATABASECHANGELOG` VALUES ('4', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2019-07-22 14:34:41', 4, 'EXECUTED', '8:2087829f22a4b2298dbf530681c74854', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_FO_FORM_DEPLOYMENT; modifyDataType columnName=SUBMITTED_DATE_, tableName=ACT_FO_FORM_INSTANCE', '', NULL, '3.6.3', NULL, NULL, '3777281600');
INSERT INTO `ACT_FO_DATABASECHANGELOG` VALUES ('5', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2019-07-22 14:34:41', 5, 'EXECUTED', '8:b4be732b89e5ca028bdd520c6ad4d446', 'createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION', '', NULL, '3.6.3', NULL, NULL, '3777281600');
COMMIT;

-- ----------------------------
-- Table structure for ACT_FO_DATABASECHANGELOGLOCK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_FO_DATABASECHANGELOGLOCK`;
CREATE TABLE `ACT_FO_DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of ACT_FO_DATABASECHANGELOGLOCK
-- ----------------------------
BEGIN;
INSERT INTO `ACT_FO_DATABASECHANGELOGLOCK` VALUES (1, b'0', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ACT_FO_FORM_DEFINITION
-- ----------------------------
DROP TABLE IF EXISTS `ACT_FO_FORM_DEFINITION`;
CREATE TABLE `ACT_FO_FORM_DEFINITION` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_FORM_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_FO_FORM_DEPLOYMENT
-- ----------------------------
DROP TABLE IF EXISTS `ACT_FO_FORM_DEPLOYMENT`;
CREATE TABLE `ACT_FO_FORM_DEPLOYMENT` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_FO_FORM_INSTANCE
-- ----------------------------
DROP TABLE IF EXISTS `ACT_FO_FORM_INSTANCE`;
CREATE TABLE `ACT_FO_FORM_INSTANCE` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `FORM_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `TASK_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `SUBMITTED_DATE_` datetime(3) DEFAULT NULL,
  `SUBMITTED_BY_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `FORM_VALUES_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_FO_FORM_RESOURCE
-- ----------------------------
DROP TABLE IF EXISTS `ACT_FO_FORM_RESOURCE`;
CREATE TABLE `ACT_FO_FORM_RESOURCE` (
  `ID_` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Table structure for ACT_GE_BYTEARRAY
-- ----------------------------
DROP TABLE IF EXISTS `ACT_GE_BYTEARRAY`;
CREATE TABLE `ACT_GE_BYTEARRAY` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_GE_BYTEARRAY
-- ----------------------------
BEGIN;
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('d4738715-ac51-11e9-a42b-7e32093327fc', 1, '/Users/duyudong/Desktop/服务器项目/bladex-boot/target/classes/processes/LeaveProcess.bpmn20.xml', 'd4738714-ac51-11e9-a42b-7e32093327fc', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0A3C646566696E6974696F6E7320786D6C6E733D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F4D4F44454C2220786D6C6E733A7873693D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612D696E7374616E63652220786D6C6E733A7873643D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D612220786D6C6E733A666C6F7761626C653D22687474703A2F2F666C6F7761626C652E6F72672F62706D6E2220786D6C6E733A62706D6E64693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F42504D4E2F32303130303532342F44492220786D6C6E733A6F6D6764633D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44432220786D6C6E733A6F6D6764693D22687474703A2F2F7777772E6F6D672E6F72672F737065632F44442F32303130303532342F44492220747970654C616E67756167653D22687474703A2F2F7777772E77332E6F72672F323030312F584D4C536368656D61222065787072657373696F6E4C616E67756167653D22687474703A2F2F7777772E77332E6F72672F313939392F585061746822207461726765744E616D6573706163653D22687474703A2F2F7777772E666C6F7761626C652E6F72672F70726F63657373646566223E0A202020203C70726F636573732069643D224C6561766522206E616D653D22E8AFB7E58187E6B581E7A88B2220697345786563757461626C653D2274727565223E0A20202020202020203C646F63756D656E746174696F6E3EE8AFB7E58187E6B581E7A88B3C2F646F63756D656E746174696F6E3E0A20202020202020203C73746172744576656E742069643D22737461727422206E616D653D22E5BC80E5A78B2220666C6F7761626C653A696E69746961746F723D226170706C7955736572223E3C2F73746172744576656E743E0A20202020202020203C757365725461736B2069643D2268725461736B22206E616D653D22E4BABAE4BA8BE5AEA1E689B92220666C6F7761626C653A61737369676E65653D22247B7461736B557365727D223E0A2020202020202020202020203C657874656E73696F6E456C656D656E74733E0A202020202020202020202020202020203C6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C65746520786D6C6E733A6D6F64656C65723D22687474703A2F2F666C6F7761626C652E6F72672F6D6F64656C6572223E3C215B43444154415B66616C73655D5D3E3C2F6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C6574653E0A2020202020202020202020203C2F657874656E73696F6E456C656D656E74733E0A20202020202020203C2F757365725461736B3E0A20202020202020203C6578636C7573697665476174657761792069643D226A756467655461736B223E3C2F6578636C7573697665476174657761793E0A20202020202020203C757365725461736B2069643D226D616E6167657254616B22206E616D653D22E7BB8FE79086E5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D226D616E61676572223E3C2F757365725461736B3E0A20202020202020203C757365725461736B2069643D22626F73735461736B22206E616D653D22E88081E69DBFE5AEA1E689B92220666C6F7761626C653A63616E64696461746547726F7570733D22626F7373223E3C2F757365725461736B3E0A20202020202020203C656E644576656E742069643D22656E6422206E616D653D22E7BB93E69D9F223E3C2F656E644576656E743E0A20202020202020203C73657175656E6365466C6F772069643D22666C6F77312220736F757263655265663D22737461727422207461726765745265663D2268725461736B223E3C2F73657175656E6365466C6F773E0A20202020202020203C73657175656E6365466C6F772069643D226D616E6167657250617373466C6F7722206E616D653D22E9809AE8BF872220736F757263655265663D226D616E6167657254616B22207461726765745265663D22656E64223E0A2020202020202020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A20202020202020203C2F73657175656E6365466C6F773E0A20202020202020203C757365725461736B2069643D22757365725461736B22206E616D653D22E8B083E695B4E794B3E8AFB72220666C6F7761626C653A61737369676E65653D22247B6170706C79557365727D223E0A2020202020202020202020203C657874656E73696F6E456C656D656E74733E0A202020202020202020202020202020203C6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C65746520786D6C6E733A6D6F64656C65723D22687474703A2F2F666C6F7761626C652E6F72672F6D6F64656C6572223E3C215B43444154415B66616C73655D5D3E3C2F6D6F64656C65723A696E69746961746F722D63616E2D636F6D706C6574653E0A2020202020202020202020203C2F657874656E73696F6E456C656D656E74733E0A20202020202020203C2F757365725461736B3E0A20202020202020203C73657175656E6365466C6F772069643D22626F737350617373466C6F7722206E616D653D22E9809AE8BF872220736F757263655265663D22626F73735461736B22207461726765745265663D22656E64223E0A2020202020202020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A20202020202020203C2F73657175656E6365466C6F773E0A20202020202020203C73657175656E6365466C6F772069643D226A756467654D6F726522206E616D653D22E5A4A7E4BA8E33E5A4A92220736F757263655265663D226A756467655461736B22207461726765745265663D22626F73735461736B223E0A2020202020202020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B64617973203E20337D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A20202020202020203C2F73657175656E6365466C6F773E0A20202020202020203C73657175656E6365466C6F772069643D226D616E616765724E6F7450617373466C6F7722206E616D653D22E9A9B3E59B9E2220736F757263655265663D226D616E6167657254616B22207461726765745265663D22757365725461736B223E0A2020202020202020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B21706173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A20202020202020203C2F73657175656E6365466C6F773E0A20202020202020203C73657175656E6365466C6F772069643D22626F73734E6F7450617373466C6F7722206E616D653D22E9A9B3E59B9E2220736F757263655265663D22626F73735461736B22207461726765745265663D22757365725461736B223E0A2020202020202020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B21706173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A20202020202020203C2F73657175656E6365466C6F773E0A20202020202020203C73657175656E6365466C6F772069643D22687250617373466C6F7722206E616D653D22E5908CE6848F2220736F757263655265663D2268725461736B22207461726765745265663D226A756467655461736B223E0A2020202020202020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A20202020202020203C2F73657175656E6365466C6F773E0A20202020202020203C73657175656E6365466C6F772069643D2268724E6F7450617373466C6F7722206E616D653D22E9A9B3E59B9E2220736F757263655265663D2268725461736B22207461726765745265663D22757365725461736B223E0A2020202020202020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B21706173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A20202020202020203C2F73657175656E6365466C6F773E0A20202020202020203C73657175656E6365466C6F772069643D226A756467654C65737322206E616D653D22E5B08FE4BA8E33E5A4A92220736F757263655265663D226A756467655461736B22207461726765745265663D226D616E6167657254616B223E0A2020202020202020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B64617973203C3D20337D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A20202020202020203C2F73657175656E6365466C6F773E0A20202020202020203C73657175656E6365466C6F772069643D227573657250617373466C6F7722206E616D653D22E9878DE696B0E794B3E8AFB72220736F757263655265663D22757365725461736B22207461726765745265663D2268725461736B223E0A2020202020202020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B706173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A20202020202020203C2F73657175656E6365466C6F773E0A20202020202020203C73657175656E6365466C6F772069643D22757365724E6F7450617373466C6F7722206E616D653D22E585B3E997ADE794B3E8AFB72220736F757263655265663D22757365725461736B22207461726765745265663D22656E64223E0A2020202020202020202020203C636F6E646974696F6E45787072657373696F6E207873693A747970653D2274466F726D616C45787072657373696F6E223E3C215B43444154415B247B21706173737D5D5D3E3C2F636F6E646974696F6E45787072657373696F6E3E0A20202020202020203C2F73657175656E6365466C6F773E0A202020203C2F70726F636573733E0A202020203C62706D6E64693A42504D4E4469616772616D2069643D2242504D4E4469616772616D5F4C65617665223E0A20202020202020203C62706D6E64693A42504D4E506C616E652062706D6E456C656D656E743D224C65617665222069643D2242504D4E506C616E655F4C65617665223E0A2020202020202020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D227374617274222069643D2242504D4E53686170655F7374617274223E0A202020202020202020202020202020203C6F6D6764633A426F756E6473206865696768743D2233302E30222077696474683D2233302E302220783D223330302E302220793D223133352E30223E3C2F6F6D6764633A426F756E64733E0A2020202020202020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020202020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D2268725461736B222069643D2242504D4E53686170655F68725461736B223E0A202020202020202020202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223336302E302220793D223136352E30223E3C2F6F6D6764633A426F756E64733E0A2020202020202020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020202020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226A756467655461736B222069643D2242504D4E53686170655F6A756467655461736B223E0A202020202020202020202020202020203C6F6D6764633A426F756E6473206865696768743D2234302E30222077696474683D2234302E302220783D223235352E302220793D223330302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020202020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020202020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D226D616E6167657254616B222069643D2242504D4E53686170655F6D616E6167657254616B223E0A202020202020202020202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223535352E302220793D2237352E30223E3C2F6F6D6764633A426F756E64733E0A2020202020202020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020202020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22626F73735461736B222069643D2242504D4E53686170655F626F73735461736B223E0A202020202020202020202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223435302E302220793D223432302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020202020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020202020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22656E64222069643D2242504D4E53686170655F656E64223E0A202020202020202020202020202020203C6F6D6764633A426F756E6473206865696768743D2232382E30222077696474683D2232382E302220783D223730352E302220793D223339302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020202020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020202020202020203C62706D6E64693A42504D4E53686170652062706D6E456C656D656E743D22757365725461736B222069643D2242504D4E53686170655F757365725461736B223E0A202020202020202020202020202020203C6F6D6764633A426F756E6473206865696768743D2238302E30222077696474683D223130302E302220783D223531302E302220793D223237302E30223E3C2F6F6D6764633A426F756E64733E0A2020202020202020202020203C2F62706D6E64693A42504D4E53686170653E0A2020202020202020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22666C6F7731222069643D2242504D4E456467655F666C6F7731223E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223332372E393339303138333134343637372220793D223135372E34393137333133323735363638223E3C2F6F6D6764693A776179706F696E743E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223336302E302220793D223137362E3035323633313537383934373337223E3C2F6F6D6764693A776179706F696E743E0A2020202020202020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020202020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22687250617373466C6F77222069643D2242504D4E456467655F687250617373466C6F77223E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223336332E30343334373832363038363935362220793D223234342E3935303030303030303030303032223E3C2F6F6D6764693A776179706F696E743E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223238352E37373239393939393939393939372220793D223331302E3739393939393939393939393935223E3C2F6F6D6764693A776179706F696E743E0A2020202020202020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020202020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D2268724E6F7450617373466C6F77222069643D2242504D4E456467655F68724E6F7450617373466C6F77223E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223435392E39352220793D223233362E3231383735303030303030303036223E3C2F6F6D6764693A776179706F696E743E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223531332E393739343834343831383531362220793D223237302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020202020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020202020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226A756467654C657373222069643D2242504D4E456467655F6A756467654C657373223E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223237342E333335393337352220793D223330302E3636333937323134353634323834223E3C2F6F6D6764693A776179706F696E743E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223237342E333335393337352220793D223131352E30223E3C2F6F6D6764693A776179706F696E743E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223535342E393939393939393939393938322220793D223131352E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020202020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020202020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D227573657250617373466C6F77222069643D2242504D4E456467655F7573657250617373466C6F77223E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223531302E302220793D223331302E30223E3C2F6F6D6764693A776179706F696E743E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223431312E302220793D223331302E30223E3C2F6F6D6764693A776179706F696E743E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223431312E302220793D223234342E3935303030303030303030303032223E3C2F6F6D6764693A776179706F696E743E0A2020202020202020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020202020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22626F737350617373466C6F77222069643D2242504D4E456467655F626F737350617373466C6F77223E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223534392E393439393939393939393939382220793D223434372E32313436313138373231343631223E3C2F6F6D6764693A776179706F696E743E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223730352E343333313537373636363431392220793D223430372E34353637353730363232353938223E3C2F6F6D6764693A776179706F696E743E0A2020202020202020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020202020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226A756467654D6F7265222069643D2242504D4E456467655F6A756467654D6F7265223E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223238372E32393733303839353634353032352220793D223332372E3635323035343739343532303535223E3C2F6F6D6764693A776179706F696E743E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223435302E302220793D223432382E38383838383838383838383839223E3C2F6F6D6764693A776179706F696E743E0A2020202020202020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020202020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226D616E6167657250617373466C6F77222069643D2242504D4E456467655F6D616E6167657250617373466C6F77223E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223632302E373538383233353239343131382220793D223135342E3935223E3C2F6F6D6764693A776179706F696E743E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223731332E383631333730343437373135312220793D223339302E3936333238303530323739343736223E3C2F6F6D6764693A776179706F696E743E0A2020202020202020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020202020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22757365724E6F7450617373466C6F77222069643D2242504D4E456467655F757365724E6F7450617373466C6F77223E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223630392E39352220793D223333392E35333031383836373932343533223E3C2F6F6D6764693A776179706F696E743E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223730362E393338333639393335393739372220793D223339362E3837343131393632363836393937223E3C2F6F6D6764693A776179706F696E743E0A2020202020202020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020202020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D22626F73734E6F7450617373466C6F77222069643D2242504D4E456467655F626F73734E6F7450617373466C6F77223E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223531352E39382220793D223432302E30223E3C2F6F6D6764693A776179706F696E743E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223534342E302220793D223334392E3935303030303030303030303035223E3C2F6F6D6764693A776179706F696E743E0A2020202020202020202020203C2F62706D6E64693A42504D4E456467653E0A2020202020202020202020203C62706D6E64693A42504D4E456467652062706D6E456C656D656E743D226D616E616765724E6F7450617373466C6F77222069643D2242504D4E456467655F6D616E616765724E6F7450617373466C6F77223E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223539352E3433383334343732313337332220793D223135342E3935223E3C2F6F6D6764693A776179706F696E743E0A202020202020202020202020202020203C6F6D6764693A776179706F696E7420783D223536372E393336363333373236323232332220793D223237302E30223E3C2F6F6D6764693A776179706F696E743E0A2020202020202020202020203C2F62706D6E64693A42504D4E456467653E0A20202020202020203C2F62706D6E64693A42504D4E506C616E653E0A202020203C2F62706D6E64693A42504D4E4469616772616D3E0A3C2F646566696E6974696F6E733E0A, 0);
INSERT INTO `ACT_GE_BYTEARRAY` VALUES ('d5e873d6-ac51-11e9-a42b-7e32093327fc', 1, '/Users/duyudong/Desktop/服务器项目/bladex-boot/target/classes/processes/LeaveProcess.Leave.png', 'd4738714-ac51-11e9-a42b-7e32093327fc', 0x89504E470D0A1A0A0000000D49484452000002E7000001FE08060000003F36A0060000591A4944415478DAECDD097C5355FAFF71514445544671DF071546745C067767C475A8505C9390A42D1198B209B23ACA221D1041180444411450104546161591A5947D47507605D9294B0B1605296BCFFF79EE2FE93F94EE246996CFFBF53A2FDA2434C9736FCFFDE6F4DC73CF38030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000207A1963CA6FDAB4E9CB458B169D484B4B33A9A9A9B410B7E9D3A79B3973E6EC9596C01E09000010C33498CF9D3BD76464649823478ED0CAA86566669AD9B367FF2641FD45F64A00008018A523E604F3B009E847525353D7B157020000C4289DCA42300E9F26E1FC187B250000408CD239CF84E2B00AE786BD12000080705E683BB87F97D9B4F463B3667A37ABE9D77A1B819A700E0000801086F30359E966F5D42E66C5A40E2735BD4DEF235413CE01000010A270BE7DCD37A704735FDBB16622A19A700E0000805085F37533DF2E309CEB7D846AC2390000004214CE57A7A61418CEF53E4235E11C0000008473C239000000622B9CEBEA2C058573BD8F504D380700004088C2F986F9EF1518CEF53E4235E11C000000210AE7FBD2579AD5D3BA9E3AA5456ED3FB08D5847300000084289C6BDBFCFDC853C2B9DE46A0269C0300002094E1FCF061B361C1E053A7B4C86D7A1FA19A700E000080108473BD02E8FAF9030B9C73AEF7719550C2390000008219CE0F1F36BB36CC30ABA6742C3098FB9A3E461FCB283AE11C000000010EE7458D96338A4E380700004088C2797146CB0B1B45276413CE01000010A0705EDA60EE6B846CC2390000000214CE69847300000010CE09E78473000000C2398D700E000000C2398D700E000000C239E11C00000084731AE11C0000008473C23900000008E734C23900000008E7847300000010CE69847300000010CE09E7000000209CD308E7000000209C13CE0100004038A711CE0100005010A7D3992AED61C239E11C00000065AC7EFDFA469B867487C3713FE19C700E000080320EE77E6D727E23E98473C239000000421FCE7347D2FD433AE19C700E000080320AE7FE23E93ADDA5ACC2F9F2E5CBCDE1C38783F6F3E7CF9F6F060C1850E0FDEBD6AD3313264CC87D2D3B76ECB05ECFE2C58BCD9E3D7B08E70080521F6069341AADD4AD2CC2F9DEBD7BCD79E79D67BA76ED6A7DFFC8238F98FBEFBFDF6A77DF7DB7494949B16E6FDFBEBDA95EBDBAB9F5D65BCD8D37DE68FEF297BF980B2FBCD05C74D145B9EDFCF3CF370B162C300B172E342FBFFCB279E59557ACA6FF4FBA50D3B469D3DCDBF47E7DACFEECC183079BCA952B5B5F5F7FFDF5E6ADB7DEB2BEAE50A182F9FCF3CF09E7008002C3798EFC538E4A0008D007FBA50E87A36EAD5AB5CAEBE3CA229CF7EFDFDF54AC58D16CDBB6CDFABE5BB76E56504F4E4EB602B5C7E3B16E9F31638669D4A89115C8870C1962EEBCF34EEB318D1B3736356AD43063C68CB11EBF64C992DCAF9D4EA7D5E2E3E3CDEDB7DF6E5E78E185DCDBCA952B67056F1D1D6FDEBCB9B9E0820BCCE4C9934DB56AD54C9F3E7DACE7D4D7357EFC78B376ED5AB36BD72EC23900E09403EC8994949433A90480D30CE72785729F5087730DE4575D7595E9D0A18379F0C1074DDFBE7DADDB77EFDE6D6EBBED3673E9A5975A23EBBEC77FF2C927D66DFAF5BDF7DE6B8D725F77DD75A652A54AA666CD9A56205FBA74A915D09F7CF2492BDC4E9F3EDD9AD2A2F78D1C39D2FA5E6F8F8B8BB346CE5BB4686185700DEBFA9C1ACE5F7BED35B366CD1AEBF6E1C3875BE15F47DD09E70080BC07D8E3369BED2C2A01A094E17CA1D3E97C366F282FAB70AE53563434EBF4119DDA3275EA542BA8EB1493CB2FBFDC9C7DF6D95630D6D16B6D0F3FFCB039F7DC734DAB56ADCC3DF7DC638DA4EBC8BA4E7519356A546E38D79FAD23EAFA73AFBCF24A53A54A15EB3E0DF6FAFD39E79C63DDEF7B1D1F7EF8A1B9E4924BACAF359CEB636FBEF9662B9CEB54995B6EB9C5A4A7A713CE0100A71C608F2627279F4D250094B0EFC877A4BCACC3F9860D1B4CC78E1DAD30AC23D4FAFDB5D75E6B05F4ACAC2CEB444D9D92D2A3470FF3DD77DF99DAB56B5B81F9CD37DF347FFBDBDFCC4D37DD64AA56AD6A4D75D1E0AE3F47A7A9E8CFD691EEBBEEBACB8C1B37CE9A43AEF76908D7EFEFB8E38EDC91703DF153EF2F5FBEBC79EEB9E7AC70DEB97367B375EB56EBB974FA8C7ECD9C7300407E07D823369BAD029500100CA10EE773E6CC31175F7CB1356AADF3C075FA89CE0DD750ED6BFABD6F3EBAFFB416FDBA5FBF7EA66EDDBAD609A23A77FD9D77DE31DBB76FCF0DE77A92A89E58AAA3EF1ACEF5E7E9F77ABB2F9CBFF4D24BB9A3F7EFBFFF7EBE73CE39211400505038CFF6783CE7520900D110CEA74C99628D7C3FF6D863D634137D7E0DC89D3A75B202B386ED810307E6CE3BD740AED35A7445170DE51AB675CEBA4E89D1955D7444FC9B6FBEC90DE73A877CE8D0A1E6F5D75FB77E9ECE69D7EFFDE790EB328BEDDAB53B695A4BDE703E68D020EB7510CE010079C3F9219BCD761E9500100DE13C3B3BDB6CDCB8D10AA11A9C478C1861DDAE4B216A98F65F214503B38E9AEB3CF4060D1A98B163C75A2778DAED766B4EB87EFDF1C71F9BF5EBD7E7CE39D7C0FDC4134F58278FEACFD3A92FFABDDE5ED89C739DCBAECFE70BE76DDBB635D2F712CE0100A784F33FE2E3E32B520900D110CE5F7DF5552B346BBBECB2CBAC39E52FBEF8A23592AEB73DF3CC33D6F2873A9AAEED8D37DEB0E67FEBFC7487C3619DE4AAA3E51AAC7D27BD76EFDEDDFAD9F3E6CDB3965FD4AFE7CE9D6BFDBCCD9B37E7865EDF1AE7FA6F6262A275D2A8AE7FAEA3F0BA728B4EB3D1556034CCEBAA303A379E700E00C81BCE0FD86CB64A5402403484F3152B565823D35BB66CB1BE9F356B9669D9B2A569DDBA756ED3C0FCE9A79F9EF4FF741D735DB1C5FF71BEC76A88CFFB3CFA7335C0EB7AE579EF1B366C983567BD59B366D689A0BD7AF532BFFCF28B755FEFDEBD4D9D3A754CC3860D73E7B213CE0100B99C4EE7EFF5EAD5BB804A008886704E239C034044AB5FBFFE6F6EB7FB422A0180704E380700943187C391E5F1782A5309008473C23900A08CD5AF5FFF5797CBF5272A0180704E380700947D38DF9B9494740995004038279C0300CA3E9C673A9DCE2A540200E19C700E0028FB709E61B3D92EA5120008E784730040D987F3DD4EA7F3722A0180704E380700947D38DF65B3D9AEA0120008E784730040D987F37469575109008473C23900A0ECC3F90E9BCD767538BC1663CCB92B57AE6C3262C488D9BD7AF5FAAD55AB56C73C1E8F91D768121212729A356B76A453A74E9BDE7EFBED51D2AAB1F500C2398D700E00D116CEB7BBDDEE6BCA3A948F1B376E64F7EEDD8FB56EDDDA0C1932C42C5AB4C8A4A7A79BECEC6CA3F4DF8C8C0CB36CD93223E1DDBCF2CA2B396DDAB4D9929C9CDC98AD0810CE69847300889670BED566B35D5756CF2F21BCE19B6FBE79B843870E56F03E7EFCB829AE1F7FFCD1BCF6DA6BC79B3469B24EDEC34D6C4D80704E239C0340A487F32D2E97EBFA503FAF64EBF25F7FFDF58CA64D9B9A891327962894E73565CA14D3B061C3438CA20384731AE11C00223D9C6F967643A883F9AC59B396B46CD9D2AC5FBFDE04C2962D5B8C04FD438D1B376EC1560508E734C23900446A38DFE872B9FE1CCAE7D411730DE63A873C90F4E72527271F703A9D096C5980704E239C03402486F35F1C0E47D5503D9FCE31D7A92C811A31CF6F043D2929294B027A75B62E4038A711CE0120D2C2F97A97CB7573289E4B5765E9D6ADDB119D631E4C93264D3AE476BB17B27501C2398D700E009116CE7F76381CB784E2B9264C98F099AECA72F4E851136CCD9B37DFCDF41680704E239C0340449100FB93CD660BFA057D74D45CD731D7E5124361C58A1547183D0708E734C239004494FAF5EBAF75381C7F09F6F3E8953FF524D0D35932B1A41A366CB83BD42BD100209C13CE0100A5E6743AD7D86CB65B83FD3C23468C983D74E850134AFDFAF5FB51C2797BB6324038A711CE01202248785DE570386E0BF6F3F4EAD5EBB7458B1685349C2F58B0608BBCBF896C6580704E239C0340449060BED2ED76DF1EECE769D5AAD5B15DBB7685349CEFDEBD3B43C2F976B6324038A711CE01202248785DE1743AFF1AECE7F1783C263B3B3BA4E15C9F4FDE5F365B19209CD308E70010111C0EC70F2E97EBCE107C083065419F97AD0C10CE698473008808125E974BBB2BD8CFD3A041839C508F9C1F3A74683723E700E19C46380780480AE7CB1C0EC7DDC17E9E962D5B1E09F59CF39D3B77FECC9C73A06CA5A5A5118AC3A7654B383FC65E0900E11DCE974AAB19ECE7E9D2A5CB8650AFD63275EAD4EF58AD05285B73E6CCD995919141300E83969E9EFE8584F375EC950010DEE17C89C3E1B827D8CFD3A74F9FA1A15EE7BC6BD7AE9358E71C285B3366CC7866D6AC59FBF7ECD973288C436B543C476123E61ACCA74F9FBE55DA8BEC950010DEE17C91B4FB82FD3C9D3B77AEFAF2CB2F9F08E11542B35D2ED746AE100A943D09847553535397EA940A9DF31C4E6DC99225A64B972E66C28409417B0E79FF463EA0980F3FFCB0ACDEA7D67D1DC11C0022239C2F74381CF787E2B9DAB66DFBCBB265CB4235A56594BCB7B96C61000559BC78F114ED2F264D9A744CFAC1D782F53CF3E7CF7F559F273333F3E8DB6FBF3DD1E3F154A6FA008082C2F902A7D3F940289EAB51A346B676EDDA1D0BC1E87996BCA71FA525B08501E455AB56ADF2B367CF5EEAEB30F6EFDF7FD0ED76AFD6DB83F17CF25CE37CCF95939373E2B3CF3ECB90FEE961B6040020BF703ECF6EB73F14AAE76BD2A4C9CA891327063599F7EAD5EB63795F87E5E0F7A6CD66ABC45606E0A37DC2D4A95337E4ED37BA77EFBE2B587F45FCE1871F36E77DBE55AB561D68DDBAF55BC1FA40000088DC703E379423383A07BC61C38687D6AF5F1F9460BE72E5CAAFE53976252424D4927F474A4B97D6302525E54CB63610F3FDDD0D6969697BF3EB3B962F5F3E5FEE1F1C8CE74D4F4F3F96DF731E143D7BF65CC1B93100805C12CC67DBEDF67F84F2392538BB9B3469F2872EAF16483B76EC98E772B9B6FA4F67D16522A5CD91F6A3B4C7D9E2406CD251F169D3A61D2CA8FF387EFCF82EB7DBBD2BD07F6DEBDFBFFF5F0B9BCA979393737CC890215C180800901B5E6749987D24D4CF2B07C186C9C9C907023582AE23E61ACC0B3AA94B6E7F5EDEEB2FF2EF3772F0ADC6960762874E1D193F7E7C71A6C42D973EA27E209F7BF4E8D15D8B7ADEB163C7EE622B01007CE17CA6B45A65F1DC7A104C4848F8EDABAFBE3A781A278966F5EDDB57E798EF92E629ECF924945790E76C2B8FCB907FDF4D4A4ABA843D00880D13264CF8A1A8CE64FDFAF5D3A57F981CC8E71D376EDCA4A29E77F0E0C15C2C0D00901BCED39C4EE76365F8FC37B85CAEB4264D9AEC5EBE7CF9A192AC633E6DDAB4D112EE977AE7CD572FEE736A28D770EE0DE96D35B4B32700D12D2525A5F1891327720AEB548E1E3D9A25FD82F1783CE706EA7967CD9AB5B3A8CEAC77EFDEAFB2850000BE703C3D1CE662CB6B785143BA1C14337AF5EAB566DEBC795BD3D3D3776567675B07AF43870EEDDEB973E7CFD3A74FFF560EB293DD6EF7260DE53A5A5EDAD50E747A8B4E73F14E77799EBD01885E3A97FCE79F7F3E5158481E3E7CF821F9A05F3B90CF3B78F060231F0A8E16F49C070E1C38D1A2458B1A6C210080450E44A976BBFD8970793D12BAAF91D7D45A02F397D2364BCBD6912CEFBFDBA54D94D63E90AB1BE85F0EBC278CEA89A33503F133E5985B7ED3A64D5F2E5AB4E8445A5A9A09B7AB22C642D3AB32CE993367AF34D6BB8765DCB871055E05EDCB2FBFCC960FE97583D1A775EDDA75E9AFBFFEBABF80F3658EB29C2200209784D1A972407A2AD6EBA04B2DEA928BDEA51747EA01B5A8FF53D8AA0E1ACCE7CE9D6B74459A23478ED0CAA86566669AD9B367FFC665CBA15AB66CE9C96F6ACBA851A3023E629E5793264DDE900FEBBFE77335E30D6C1900402E09E6535C2ED73FA9C4FF494C4C3C5FC27937697BF5DFC202B8DCFF694127D3EA8839C13C6C02FA91D4D4D475ECDDD0DFE7E5CB971FF10FC7E3C78F0FCA8879017D46CD61C386ED3C76EC58EE6BF8EAABAFC6B3650000FE078BEFE4C01447254EA623E7855DC4C8BB7EFA319D7AE3F1782AE7FDFF3A9585601C3E4DC2F931F66AA84F3FFDF47B5F30FEFAEBAFB3833D629EDF078437DE7863FCEEDDBBFFD0D73064C8906E6C1500402E09E6935C2ED7D354A2C00F2FF95EC4C8BB04A5CE853772701F9DF7FFE99C6742715885732EF2024BDBB66D1B1E3D7A54D7163F11AA11F3FC346CD8F0858913279A060D1A0C62AB0000FCC3E7B7D2EA5089223FC4E45EC448FE6DE50BE67EEDC5D284F383FB77994D4B3F366BA677B39A7EADB711A809E7080E1DB9EEDDBBB7FECE8E0C83FEF73E5DD295E55C0100FEA1F31BA7D3194F258A7550AF60B7DB75A598E3F984F34CFFF9E9C509E707B2D2CDEAA95DCC8A491D4E6A7A9BDE47A8269C2368A178A9FC2E3F1A0EAF4557CC92D7E360AB00007C07A9AFA5D5A312C5FE30F3723EC1DC6A72DF472509E7DBD77C734A30F7B51D6B2612AA09E70802BDC090FCBE1E8C8F8FAF1826E1DCAED79B60CB00007C6173821C1C9EA512C53AA857F6AEB56E0A6ABE5A16279CAF9BF97681E15CEF235413CE11940189BF4B5B1C2EAF47FF2227AF678FCBE5FA335B0700A007AAF1D29EA312C5FA20D3AFB060EE6D7FC8C1F68AE284F3D5A929058673BD8F504D3847E0C907E8D7A5F50DB3BEE5BFD277BCC5D6010068381FC7A5EB8BA657F0935A75D6A92BF2EFC7BA428B77C5969972DB0FDEAB9966CAD73972DF76C239E11C61FB217B52B80D48489F515D5ED34EAE140A00D070FE65DE9546507ABE8B1815279CEBEA2C058573BD8F504D384760E9F50A249C67D96CB64BC3B02F9E2BAFED19B61200C438A7D3F93F3920D8A8446015279C6F98FF5E81E15CEF235413CE11F0FEEEAFD27E0AC7D726FD70922E6DCB5602801827078331BA5A0095087D38DF97BED2AC9ED6F5D4292D729BDE47A8269C23E0E1BCB9F47943C3F1B5D96CB6F3E4B5EDD5AB13B3A50020B60F56A31D0E477D2A11FA70AE6DF3F7234F09E77A1B819A708EA00C467C2ECD13C6AFEF3DE98FDF604B01408C1FAC24A03BA9441984F3C387CD8605834F9DD222B7E97D846AC23902DEDF6DB3D96C3785EBEB93607E87BCC6AD3A379EAD0500314A72F9283920B8A94468C3B95E0174FDFC8105CE39D7FBB84A28E11C8123A1FC3A09BEBB23E003C412E9976BB3C5002046C981E05339102450891085F3C387CDAE0D33CCAA291D0B0CE6BEA68FD1C7328A4E384740FA3A97C3E1181B01AFF35FBAC42D5B0C0062F78035525A2295087E382F6AB49C5174C23982DAD70D723A9DADC3FD75D6AB57EF0279ADBFCA6BBD9CAD0600B179C0FA440E020DA844F0C3797146CB0B1B45276413CE517A0E8763A5F4773523A45F1E2AFDF2AB6C350088CD70FE7138AF5E104DE1BCB4C1DCD708D98473948EC7E3A92C61F7F748B902A7F4C9F7495B2F5F9663EB01408C9103D67087C3F11295087E38A711CE516661B78EF475A991F49ABD23FDB5D87A00107B07ADA1D21A5109C239E11C513C08D153FAB9AE11F69A5BCA6BFE8CAD070031C6E1707C240781C65482704E3847140F42CC95F67824BD6697CBF527E99FB36C36DBC56C410088AD83D61069C95482704E3847348A8B8B3B47FAB803898989E74760FFFCA904F457D88A001043A4E3FFC0E97436A1128473C239A291DD6E7F4842EED2087DEDFF90D7BE9AAD080031443AFEC1D29A5209C239E11C51DAC7FDDBE170F48BE0D7FFB3D3E97C802D090031420E5AEF4BC7DF9C4A10CE09E788D2703E51FAB81722B88FEEA0AB6AB1250120760E5CEF496B412508E7847344A172D2BFED8BE4AB6D2626265EA62786BADDEE0BD99C001003A4D37F5797ECA2128473C239A28DF46D35249C6F888241942F39370800628474FA03A4B5A2128473C239A2309C37898629210E87E329E9A7BF678B02406C1CBCFAB35417E19C708E28EDDF4649A86D18056F45A7E76C9676175B1500A29C74F6EF486B432508E784734461FFB6C5E170DC1225EFA5B3B4416C550088724EA7B3AF1CBCDA5209C239E11CD1C4ED765F236136235ADE8FCD66BB5A4F6E8D8F8FAFC8D605802826C1FCBF12D0DB5109C239E11C51D6B74996AD3F3ECADED337F29E3C6C5D00886212CC7BEB3ABA5482704E384734D16562A3EDAF82F29EEA499BCFD60580282607AFB725A0BF4A2508E78473445990FDD1E572DD1B4DEFC966B39D25EF2B5DFEBD952D0C00514A82794F09E8AF5109C239E11C5114622F92BEEDF75AB56A958FC23EFB4D3D919FAD0C00514A3AF9B7A4B37F9D4A10CE09E788A2005B5BDA8C28FDE071A39EE81A1717770E5B1A00A2339CF790D6914A445738DFB3678F993D7BB6D9BB776F918F5DBF7EBDE9DFBFBFF9F5D75F8B7CECFCF9F3CD8001030ABC7FDDBA7566C28409D6D7CB972F373B76EC30870F1F368B172FB65E13E11C210AE73ABADC2D8AFBED697AC22B5B1A00A2B393EFAEEBE75289E80AE7DF7EFBAD86512B14E7BDEFFDF7DF3775EAD431CF3DF79CD51E78E001EBB14F3FFD74EE6DF5EAD533C3870F370B172E342FBFFCB279E59557AC56BD7A75EBB14D9B36CDBD4DEF5FB06081F5B3070F1E6C2A57AE6C7D7DFDF5D79BB7DE7ACBFABA42850AE6F3CF3F279C2354E17CB6B427A3F5FD4930B749BF9DC6960680E80CE7DDA475A112D115CE870D1B6685E8993367E61B54355CFFF39FFF34B56BD736F7DC738FF5D8471F7DD4FAFEA9A79EB2EE4F4B4B3363C68CB1EE93A063B5F8F87873FBEDB79B175E7821F7B672E5CA59C15B3F08346FDEDC5C70C10566F2E4C9A65AB56AA64F9F3ED67356AC58D18C1F3FDEAC5DBBD6ECDAB58B708EA0B1D96C15A44F3B201F302F88F2F7B847427A55B63800445F384F91D6954A445738EFD4A99315AA0B1AADEEDEBDBBB9F0C20BAD11F2871E7AC87AAC8675FDBE52A54AA657AF5ED6E3962C59629E7CF2492BDC4E9F3EDD9AD2A28F1D3972A4F5BDDE1E1717678D9CB768D1C20AE11AD66FBBED362B9CBFF6DA6B66CD9A35D6ED3A125FA3460D2BF813CE112CF281F101E9D396C540DFDD474FE8678B0340F475F05D35A05389E80AE7B24DAD10DDAE5DBB7CEFEFD6AD9B15A2CF3AEB2CEB71DAFCBFEFD9B367EE631B376E6C4D4BB9F2CA2B4D952A55ACFB2FBDF452EBFB73CE39C7BADFF7D80F3FFCD05C72C925D6D71ACEF5B137DF7CB315CECF3FFF7C73CB2DB798F4F474C2398246AFDB20FBFF80687F9F369BAD9ABCCF9DD1B8220D00C4FA81EC0DA7D3F91F2A113DE15C4F02BDFCF2CBAD00ADEDC08103A73CC66EB75B23E23A5AFEB7BFFD2D775A8B7EAFB777ECD831F7B13AD27DD75D779971E3C65973C8F5B11AC2F5FB3BEEB82377245C4FFCD4FBCB972F6FCD5BD770DEB97367B375EB562B9CDF79E79DD6D7CC394790071CBED639D931F25EE7487B8EAD0E00D1D5B977D69342A944F484F3F6EDDB5B015A4F0AD591F077DE79E7A4FB753A4A6262A235BAAE73C66BD5AA653DFEF9E79FB7BEBFEEBAEBCCDD77DF6DA64D9B961BCE2FBAE82273FFFDF75BD352F4B11AD6F57BBDDD17CE5F7AE925EB3E1D65D7934EF39B73CE09A108B272B25FEF4D4848B83246FAEF44F9203289CD0E0051443AF64EBAEC1895888E70BE7AF56A2B1CEB899BFABD6F1EF8BC79F3721FA38159E789EBEA2CDA34646BA87EE28927ACEFAFBEFA6A6BC4DD37B545C3B7CE211F3A74A879FDF5D7ADC7F6EDDBD7FADE7F0EB92EB3A8D368FCA7B5E40DE783060D3203070E249C2358FDD95F24B06E8C95F76BB3D9CED30F23D2AE65EB0340F48CBC74D4B5CEA944E487F3152B56986BAEB9C60AD69B366DCA9DE2A2015A47B8750515DF6375BEB8CE01D7A6615E03B76F5EB84E4B79E699674E9A73AE815BC3FBBDF7DE6B3DF6E1871FB6BED7DB0B9B73DEA851232BA0FBC279DBB66D8D040AC23982D59FFDCBE9748E88B1F73C9093FA01208A381C8ED738E33FF2C3B98E62EBC9991ACC758515FFFB34A857AD5AD59C79E699A65FBF7ED66D1B376EB46E7FF7DD77ADD1750DDCAB56ADB2E6847FF2C92756C8F6FD7F1D759F316386F5F5DCB973ADC76EDEBC3937F4FAD638D77F75BA8C9E34AAEB9F9F77DE79D649A63A55465780D130AF6B9FFBCF67279C239034986B408FB1F7FC5779CF5B535252CE640F0080E81875F9B7B45E5422B2C3B92E5758B76E5DB361C38602AF18AA2781EA153CFD6FD76514AFB8E20AEBFF16E77966CD9A658D8CEB7AE5F9ADAD7EE38D379A66CD9A592782EA728CBFFCF28B755FEFDEBDAD0B1F356CD8D06CDFBE9D708E60F5671B756A4B0CBEEFC5F2BEE3D80300200AE8B2634EA7B3379588EC704E239C13CCEB5F252D3316DFBBF4E18DE5BD8F672F0080E838A0B5D78B595009C239E11C111E50EDD2977D158BEFDD66B35592F7FEABFC7B057B020044FE01AD9DC3E1F82F95209C13CE11C9A41F7B57071B62F8FD7FA4E710B1270040849383591B69EF5009C239E11C11DE972D97707A7FACBE7F97CB75AFD460837C598EBD01002298D3E96C2D07B47E5482704E3847A4AA57AFDE05124C0F2427279F1DE31F5056D8EDF647D9230020B23BF356D2065009C239E11C91CAE1703C25FDD82CEAE07859EAF0397B04004430A7D3D952E76A5209C239E11C113CC8D08D2B1D9F7186C7E3A92CFD79565252D225EC150010D9232D03A904E19C708E081E649821AD3695B03EA88CD4E98A54020022F7A0D65C02FAFB5482704E384724D279E63ADFDCED765F4835AC70FE77E9D7D7500900885012CC9B49673E884A10CE09E78844BA4A89F4633F508993065D7E927EFD412A01009139CAD254DA602A4138279C234283683BA6E69DD2AFEBC5E53EA6120010999D78B2B4215482704E38472472381C13A40F735089FFCF66B35DAA278632D5070022339CFF4BDA875482704E384784F661191246AFA61227733A9DFFD3BF8C52090088BC035B236943A904E19C708E4823A1BC9AF45F9BA944BEE1FC49A9CD322A01009117CE1B4A1B462508E7847344E8E0C2A754225FE5A4369B1C0EC7DD940200228874DC2F399DCEE15482704E38470486F38FA5FF6A42250AECDF3B71C23F00441839B03590CEFB132A4138279C2302C3F906E9C36A508902EB7395B47DF1F1F115A9060044CEC84A921CDC465009C239E11C91C466B35DA1C153BE2C47350A0DE85FEB5F48A90400440809E609CCD9249C13CE11817DD70BD2774DA412450EC0D4953A2DA0120010391DB75B0E72A3A804E19C708E080BE7FDA5BD4A250A67B3D9CE9270BE83E93F001021A4D37649FB8C4A10CE09E788B0BEEB7B2E515FEC5A7577381CFDA804004400E9B0EB3B9DCED15482704E3847A4B0D96C9524701E907F2B508D6285F31BA465C6C5C59D43350020FC3B6D87B42FA804E19C708E4861B7DB9F907E6B0E9528515F3FD529A804008439E9ABEDD2698FA1128473C239222868A6487B8B4A94A8662F4A7F3F834A00400474D8D2BEA41284F3686E93274F269C4757BF35DDE5723D4D258A2F3939F96CA9DB6E9BCD7613D5008030A6CB91391C8EB15482701EAD6DE7CE9D66E5CA9566DFBE7D262323C3AC5FBFDEAC59B3C62C5BB6CCCC9A35CB6AE3C78F37DDBA75333A3797BD37BCD5AA55ABBCF45BBF7B3C9ECA54A3C4FD7D6FD9C77B5109000863D2513F276D3C95209C4773FBF2CB2F4D51323333F7272424F465EF0DFB3EABA6C3E15849254A4EEA768BD46F977EC0A11A0010BE2329CF4A873D814A04565A5A1AA1387C5AF6679F7D76FCE0C183C78B0AE87DFAF439C8886CD8F759AD25600EA212A5AEDF6CE9F39FA7120010BE2329CFC881EE2B2A115873E6CCD9A5532808C665DFD2D3D3BF484D4D5DF7F5D75F671515CEBFFFFEFB4C0D7FECC161DD678D65D591D30AE77A55E8EFA80400846F471D2F07BB6FA84460CD9831E39959B366EDDFB367CFA1ACAC2C73E8D0218272198C986B309F3E7DFA56692F76E8D0E1BF393939270A0BE772FFF1575E79653B7FF60F5F7A52A3B46BA944E9783C9E73A57E7B6D36DB75540300C29004F3BAD2514FA412A53ED055960F38D51B356AF4F8A041833A8C1933669804F379CB972FFF65CB962D07376FDE9C23F5355F7DF595B59C5F24B5D1A347EB099211F7BAFDDA311D31D760AEDB4A57A958BA74697651A3E7696969BFE9C5B9D8BBC38FCBE5BA59F6C9AD54E2B4FBFD7775394A2A0100E179B07B5A3AEA4954A2C4A1FCDC1E3D7AE82A2047F7EDDB77B4A0A03765CA94237210FC3912DFA37E689396134D5715ECD5ABD7F2A2C2F9F1E3C78F356BD66C117B795886CA97649FFC8C4A9C1EB7DB7DBBD4715B4A4ACA99540300C2EF6017C7FCC35205D717D7AE5DBBAFA8A0276170A6D4F8E508DC2FEE97F7784C47CEED767B7C146D374F6666E6C1A2B6DBF0E1C30F690DD8D3C36EFB0D93EDD28C4A04A4968B582B1E00C290D3E9AC2D9DF4642A5132090909A38E1E3D7AA8B08077E2C4896D6EB73B53DA351118CE276830F7B665D1B2DD6C365BA57EFDFAE91AE707376EDCB87FCB962D19FBC5C18307B38E1F3F7ED8B7ED76ECD8713431319113A5C32F50FEACA3BE542220B56CC44A5D00109E21EC29E9A4A752899205BCBE7DFBFE56D4E8EBD6AD5BA74B6DE746E007B6EABE51735F8BA639D87AB2A75E6C48DEE7C3FA1710FDCB86FCDB5DDAC7725B6A83060DD6B46CD9D24808D4F7EE618F0F0FF261E932D91EBFCA97E5A84660FA31ADA7FC7B05D50080F00A624F4A073D8D4A149F06BA65CB96ED292A9C7FF4D147B32371593E09ABFDFC83B9B76D8EB5154C34BC4BDB28EF7DA80619F6FC32FFBD7B8EF363025ED30F651F7F9D4A004018B1DBED4FE868219528BEC4C4C42F0E1D3A9455C4927CFB5D2ED781481B95D2293872C0CECE279C9B489C3B7FBABCA38B43A5FD22BF270FB0F797E987A5BE04C9807F10BF47F7ED33F86B040084D501EF31E99CD3A844F1E82A2D6FBCF1C6A1A246CD77ECD8312D12A7B4C86B1E985F30F7B65DFAFE6334C4E8C5BA7649EBC61AE865B66F2E96F6772A11F0BAFEA8C7012A010061C26EB73F2A1DF30C2A51EC0F33CF7EF7DD775B8B0AE783070F9E156923CD858D9AC7F2E8B9DFB6BF5CA755481D96C8BFB7F0DB103AF1F1F115A5EE07A36959CF300AE72D64DF1E4D2500207C02C723D239CFA212C5AED7E8FDFBF7EFF585F03FFEF863CFEEDDBBD72F5DBA74F984091396F6E9D3E787962D5B6ED09309236D9516D90F061716CCBD23C773637DE4586AD0545A064BFA85F4F74EFFC2378F4A049E5E484DF6E5ACA4A4A44BA806008401BBDDFE0F39F0CDA612C53B8869E8EEDDBBB7F9F7BFFFFD5B83060DE6685897D0D0474FFCD4154D442D5DED24124F20D4F9F1BA8A8936DFF415792F3FC9EDD5D8FA27D39173EF08FA241D51A72241AFF71B52EF5E5422681F7E46487DDB50090008033A8753DA1C2A513497CB75AFD42A3D960E62F25E57CB81BB065BFF54DE2519BBE95F14744E3A1509EA7E384D6A5C974A042D9CEBB2A26BA904008401BBDDFE107F2E2E9AF784C08C580B61F29E57C87BBE833DA0D060F380AE78C1928BC121353D4B6AFB9BFC7B31D508EAEFFA3A3D1E50090028FB0EF94169F3A944A1C1BCADD468BBCBE5FA5B0CEE1FCBE4FDDFCD5E50648064C9C5E0FDFEDDAD7FC1A11221E9E73EA1120050F61DF2FDD2212FA412F9062E1DB11BA4A3C7D2AE8DD10F6F8B753A0F7B43B17F9F5872F1F4EAA7576BFDD27BD2ED0DDE7DB095DCFE01D5092EF95059454F0C957EEF22AA0100651BBEEE93B6884A9CAC5EBD7A17485D264BFB4EBF8EE1FD63BEFE75853DA244218725174BBFBFD5CAB34250A6F7C3CE573A2F9A0F3C41AFFF185621028032E63DC971319538E90075AD1CA0564A7B5F47CF633C68CED6157DD82B4AB51FB1E46209E98A4852B363852CE77940574822A407875E315A6ABC9C4A0040D906889AD2965289DC0F2B7F937AEC6059B1DCFD238DAB07961E4B2E966A9F9B5B4838CFD61174AA1434E5A4C61B63F1FC1A0008B730FA3D9588DD15598A084A53A51E4F5189D263C9C512EF737D0A09E71E2A14F4FA77648E3F00946D20D59510965187D85D91A588BA4C929A3C4D254E1F4B2E167B9FAB5B40301F4C75822F2121E14AA9F5AF898989E7530D00280312BCEE9483E10FB1FAFE5991A5705293AFA5D5A31201DBDF8AB5E4A2DCDF3956E7551730EF7C2EF3CC43FA7BFF95B486540200CA805E60463AE11F63F1BDB3224BB10ED2E3641F799E4A04FCF7AEC025177D23C712DE136278BFDBEC17CC57E9327FEC3521AD7F1D96D8058032E276BB6FD7954962F0E0C38A2CC5ABD3180946762A1178F92DB9E81D595FE70DA5DB3D1ECFB931BADF0DF4D6E0A8D4E426F696D0F2FE4571BBEC97B7510D000831ED7C75642A96DE332BB29428247D26CD4525825AE3DC2517BD17E0C99DCE2101BE758CD6C423EFFD0457AC2CD36DA027310FA0120010627200AC114B97C666459612EF1F23A456495422E8FBA52EB9B821EF49907AC5C6589CD261B3D9AE90F7BF45DEFB23EC1D65C3E5725DAF17818AD5BFDE0040598682BF4807BC3646DE2B2BB29490D46B182786059FDBEDBEC67B35CCFC562919E87B9C31A6FCA64D9BBE5CB468D189B4B434939A9A4A0B719B3E7DBA993367CE5E690931D0674EE12F670010624EA7B3BACE718DE6F7C88A2CA715CE87484BA61241AFF3E442D6F63EA6AB2AE9E33498CF9D3BD76464649823478ED0CAA86566669AD9B367FF2641FDC5283F3EBC20FBDF4C7E430120B4C1B59A74BE3F47EBFB634596D3A327CCCA01BA3995086A8DEB1712CC7D73CF47EB6375C49C601E3601FD486A6A6A540F6C2427279F2DFBDF6EF9707833BFA9001022DAE94AE7BB3E1ADF1B2BB204A48603A4B5A212C123C1BBB1ECA31F499B906709C1BC01FD119DCA42300E9F26E1FC580C7C787C5B1BBFA9001022BA4C999E8816851F3A58912530E1FC1D6A185A7A111E0943F7EB7AE7D25E9350AEA17DAFCE49D739CF84E2B00AE72646067076EB283ABF9D00109A8EF7CFD2F16E8CB2911E566409100986BDA58E1DA844587C506A5ADC707E70FF2EB369E9C766CDF46E56D3AFF5360235E1BC94FBDE4C9D7FCE6F21008480CD66BB513ADE4D5114CC599125B007E5B7E4A0FC3A95080FC509E707B2D2CDEAA95DCC8A491D4E6A7A9BDE47A8269C97A25F75EBCA2DFC06024068C2D70D3ACF350A3E64B0224B70F60FBD1049172A1139E17CFB9A6F4E09E6BEB663CD444235E1BCC474AD739D56A56B9FF35B0800C10FB5D749A7BB3592DF032BB2048FC3E178C3E974FE874A444E385F37F3ED02C3B9DE47A8269C97F283FA00FA0200084D877BADB46D91FCFA599125A8F5ED28AD0795889C70BE3A35A5C070AEF711AA09E7A5FCA07E9B4E19A49F058020938EF66A5DD524125F3B2BB2049FD3E97C9565D408E734C2B9F7C3FA426975F84D0480E076B657494B8FC0511C5664094D9DDB4A40EF4B2522279CEBEA2C058573BD8F504D383F8DE34543695FF19B08004194909070A574B63B232D30B2224BC80EC6AD74AE2995889C70BE61FE7B058673BD8F504D382FADC4C4C4F3A53FF8558F1BFC36024090389DCECBF5021391F05A5991A54CF68FE63A9F9F4A444E38DF97BED2AC9ED6F5D4292D729BDE47A8269C9FE6E0C8077A2E0ABF8D0010BC9190CBA4A3DD13EEAF931559CA86D43B59DA102A1139E15CDBE6EF479E12CEF5360235E13C007D424DEF85EBCAF11B09004160B3D92ED5B9DB617E30604596B2ABBDCE311D462522289C1F3E6C362C187CEA9416B94DEF235413CE4F97F4C53FD8EDF627F88D048020484A4ABA44C2D7DE707D7DACC852E607E124A7D339824A444638D72B80AE9F3FB0C039E77A1F5709259C9F2E9DEE267DF217FC46024010D86CB68BA593DD17A6C1901559CA98D4DF25ED332A11E6E1FCF061B36BC30CB36A4AC70283B9AFE963F4B18CA213CE4FE3B87191F4CB5912D2ABF05B090001E6F1782A6B271B86C19C1559C2801C7CEDB21DC65089F00DE7458D96338A4E380FD207F74FB49FE6B71200823002229DECFE307A3DACC8125E1F929E97ED308E4A846F382FCE687961A3E8846CC27969D8EDF687A46F58C76F25000498DBEDBE503AD8DFC2E1B5B0224B5886F367B8E8487887F3D206735F236413CE4B4BFA86B54EA7F3617E330120806C365B25E9600F844127CF8A2CE179F0AD23ED5B2A11BEE19C46382FC3FEA10D278C03408079AFF876B02C5F032BB2842FD936FF940F4C53A804E19C4638CF4B57FBD27396747A24BF9D001020D2A99E27A1F850593D3F2BB28437D9368F4B9B4E2508E734C279017DC417D25AF0DB090001E2F178CE958E35BB8C82392BB28439A7D3F9886CA3595482704E239C17F4015E2F4AC46F270004485C5CDC39D2B91E0EE573B2224BE4F0AEC8308F4A10CE6984F30294933EE217693529050004407272F2D9D2A91E0DD5F3B1224B6491ED749FB4455482704E239C17C4E974BE2EFDC4102A01000150AB56ADF2D2A91E0B51D063459608E33D59F77B2A4138A711CE0B92909070A5F413BFEA02035403004E93778AC9F110853C56648930F241EA0ED9663F5209C2398D705E445F3141FA8A465402004E9FCE17CC0972A7CD8A2C11CAE974D6906DB79A4A10CE6984F32206609E660A1C0004466DE950F50053BB34FF59577B292298B3224B04B3D96CD524A0FF442508E734C27961525252CE94BE7E9BDBEDBE9D6A0040E93D212D4B5A3FEFBF754BF29FBDF3D5174ABB219F50C78A2C51403E5C55D59518A804E19C46382F8A7C90FF8FF419EF52090038BD60EE0BE43A729E5992802E1D71631D7597B6C1E3F154F6DDCE8A2CD1C3E5725D2FDB710B95209CD308E745B1D96CD7497FB1B7A8BFA802008A0EE645DD9E2FE984977AC3B991A09EEABDA0112BB244D7C1F66A3D91974A10CE6984F3621E17264BFFEFA61200507CB58B08E0BEFB0B9D83EE72B9EEF40573BF80FE0D2BB24417D9A697CBF6DC4D254243A78A11CE09E7914C82F9F35C5518004A1ECC8B3AF9B3C81174E97C07E70DE7DE368632478FA4A4A44BF4CFD45422B88C3157ECD8B163E1FCF9F34DE7CE9DDB1514D209E784F370E7BDB0DD2E09E9B7500D00285EE0AE7DBA8F77BBDDD748E79B5D4038D711F404CA1D1DF45C02D9A6FBA944F06CDBB6AD4B7676F631E375F8F0E1A35F7CF1C586162D5AD4209C13CE2391F419BDE438D09B4A0040D141BB6E29FEDF81BC015D3ADE948282B9B7653B1C8EBA943DF2D96CB64AB23D0F5089C03B78F0E01D7BF6ECD9620AB079F3E6EC5EBD7A7DE07F721DE19C701E21FDC64D3A1D4E47D1A90600042E9817F8FF7575964282F966699F3A9DCE67297DE4F39EE49B4D25024772F7B9DBB76FFFF4C4891339A60839393927A64C99B2B74D9B36F18473C279249163C00CE93B5EA4120070B2A24EFE2CF1CFD1D09D278C6B50FF549A47474B8A3AA10D91C5BB96FD312A11187BF6EC7961FFFEFDBF9912CACACA3A3C78F0E0B4891327863C80EEDEBD5B9F5FA7DB98DF7FFFDDFCF1C71F27B583070F5AFFFA1EBF66CD1A3361C284DCEF376FDE6C3EFFFCF3931E93B76DDCB8D17CF4D14726333333DFFBB3B3B3CD2FBFFC72D26D5F7FFDB5F9E69B6F08E7614AFA0D97B4A95402004E0DD4B503F4F3AC11F4071E7860B574B87F381C8E7184F19839C81A5A60DABBEFBE6B05DD528473EBFFEACF484F4F0F690095DF7973D75D7799B4B4340DA2F9B6F7DE7BCFF4EDDBD7DC79E79DE6BAEBAE33E79E7BAEF9DBDFFE66EEB9E71EF3EF7FFFDB5C78E185E6934F3E31C3860D3373E7CE3DE539A64D9B66FD9C9F7FFE39DFD7D0BA756B73C1051718F980621213134DC3860DCDF5D75F6F6EBCF146EB6B8FC763264F9E4C380F23717171E7C8FE9A99DF45EA002016E53D99B39CB406DE7F4BE2A4FF77CE39E7D439FBECB34FDC72CB2DFFA1C440C9E9C9D4C9C9C9DF2E58B060574E4ECEF1E204F3FDFBF77FDEA4499399F2817882FF8874A8DACA952BCDE5975FAEABC858015AC3F59B6FBE695E78E105B37CF97273F3CD379B2143869819336658415EFA072B48FFFDEF7F37FFFCE73FCDF9E79F6F6EBDF55673D96597998B2EBAC8F4EFDFDFFAB955AB56357FFEF39FADA63F5F7FB6067BDF6DD5AB57CF7D0D7BF6ECB182FE638F3D66929292ACE7BEF6DA6BCDD5575F6D7DFDCC33CF981F7FFC91701E669C4E677F09E7DDA8040082F9C9535934580FF38E700D2B4140CFF7FF69403F23B023F2402C869667FFF39FFF6CCFCACACA2864BEF96A09BD1FE9D431DF391CA19E73BE6FDF3EF3EBAFBF9A0D1B3658D353B43FD0A0EDED17ACB07DDB6DB7990F3FFCD0AC5DBBD60AE275EBD6B542F3C30F3F6C3D4647CD9F7DF6592B6CCB7BCEFDD97ABBBC2F337CF8706B745D1FFBCE3BEF58DF6BE0BEE4924BACC765646458536B74545DA7D5E8287AEDDAB5CD95575E6935FDFA89279EB0A6D710CEC36E3FAFA1D7BEE082740008E627CF316F70C6C97F822E4E40F70FE6BE96E4777FA0E6B203314B57C271BBDD03C68D1B9771E2C489437EB93CFB975F7EF940EE5BED7038FAE97296BEFF13EA70AE41587FFFCB972F9F1BCE870E1D6A8D5EDF7DF7DD5628D7B0AEFFEA9CF06BAEB926B7CF900FF2A663C78EE6871F7E30679E79A6F53334C0FB87731D09EFD0A183355D47FF4FD3A64DADEFFFF18F7F982A55AA9CF41AB46998AF50A182356D467FA6DEA65FEB733DFFFCF384F33024DB7601AB770188550505E6FC827661013DBFC70FCDE7F1A7BB0A0C80FF0B2F35DBB469B372D3A64DE9870E1D9A2D81768CDCB6506FCFFBD85087F3152B56986EDDBA59E1574FDAD4FE40829679F2C927ADA6E1FA2F7FF98B15CE753E78C58A15CD1D77DC614D39A956AD9AB9F7DE7BAD11709DB3FED7BFFED50AD603060CC80DE7356AD430F1F1F1E6A1871EB27EB6FE4CFD5EFFAF2F9CAF5EBDDA9A36A3F76BD0D729353A52EE7B0DDA9E7EFA69B363C70EC2791892FDE525D997BFA61200623598D72E41E0CE2FA0173798E70DE84C71014E839E58ED743A5B7B2FE2D53A9CAE10AA2BC468A85EB76E9DD527E8C9973A5F5C5B727272EEB4163D61544F02B5D96CD6687AFBF6EDADF0AE01BC6BD7AE56D3F9E83A87DD17CE75945CE7ADFBC2F7D4A953ADEF5BB56A951BCEB57DFFFDF7D6FD5BB76E352D5AB4B0A6B3D8ED76AB3DF8E083B9536008E7E1273131F17CD9AFF749BB8A6A008815C50DC84505F4920673FFE7CF3C831174202021BDB0FBCB2A9CEB1492060D1A58FF6A20D6E927CD9B37B7E686FBC2B92EB598909060CD2FD7DB7D5355F464CD468D1A59CDE572E5CE0DAF54A95281ABBF68BBF8E28B4F09E7AB56ADB2566BF9D39FFE64EEBBEF3EABE909A9FE419E701E7E645F18EC70383A510900B114CC8B1B8C0B0AE867963298FB30071D0881B208E7BE516D0DE63A62ADD35A3458EB8A2CCF3DF75C6E38F73D5EC3B90673DF3418FFA6A3E7BEC7E91CF1FFFDEF7F66EFDEBDD67AE5BEF0ADDF8F1A35CAFA19BEC72E58B0C0BA5F4F34D5F9E83ACDE68A2BAEB05AE5CA9509E7614EF699BB657B6E3AA3E42B8601405407F3C202FACFA711CC4FF7F50008E370AED35874845AE776D7A953C7B8DD6EF3D65B6F592786EA08FAA5975E6A5D40E8DB6FBF355DBA74B1A6B4E87AE76DDAB4B1FA131D4DD7AF75AA8AFEAB81BC80906B9D749ADF6BD0FFABF76BF0D775CD1F7FFC71EB04549DE7AE23F3BA4C23E13CBC49385FEE743A9FA41200A2D5E98E54E717D04F2798E70DE8CC4107A2249C6FDBB6CD5AC2B05FBF7EE6D34F3FCDBD7DE9D2A5D6728971717156A81E316284B58A8B6F0A4B7E4DA7C6F88FB2FB9A5E404843FEFAF5EBF37D0DF3E6CDCB9D3AA373D97DA3EAFFFDEF7F4DCD9A354D4A4A0AE13CCC391C8E66B2DDC6500900D1A8B23744F73BCD9FA35359F28E98FFECBDFD74F4F3FEACCA6C2A20F2C3398D701E086EB7FB4209E859369BED52AA01201A15B53A4B510A1B392FC9858AF262E41C209C13CE91AFFAF5EB7FEC743ADB510900D14A83F081338233E7BC34019D39E700E19C708EC2C2F98312CE7FA21200A23DA09764A4BAA0E512F35BADA524019DD55A00C239E11C459270BE4642FADFA904805808E84505E3A2D6312FE995447DF42A86AC730E10CE09E7284E38D78B6D8DA41200A25D5123D7C5BDC0504903BA6F6ACDB36C0280704E3847519292922ED113433D1E0F8B0600887A058DA097F4CA9FC50DE8BEE72398038473C2398ACDE9748E9680FE329500100B74043DEF14930667947C1DF3FC027A92EFCE8A152B3E730673CC01C239E19C705EBA70FE58FDFAF57FA412006229A0FB9F24EA1FB44B7281A17CFF9F04F33ACF3CF3CC89C71E7B6C787272F2D9941B209C13CE5142E5249CFFE27038EEA114006245DE292E1AAC93CE28F9F28879FF9F15FCAFBBEEBA06D2A94E92CE75B5D3E97C9872038473C2394A428E21AFC931E4432A01209603FAE93A65CA8C04F317A473DD2E6DA8CD66BB9892038473C2398A438E1957C8B1E357F9B712D50040400FE0CFA957AFDE0512D2FB4B27BBCBE17024517280704E384771C87163BC1C3F1A530900B126EF1CF4A0FC7F09E6774B47BB54DA4CE96CAB537680704E384711C78D3839662CA612006239A0977404BD4457204D4949395397C792CE36435A778FC7732EA50708E784731474CC9063C536A7D3F957AA01201695748A4BA9A7C42424245C299DEDFFA4D3DD2061FD294A0F10CE09E7C88F1C27BA4A1B48250010D00B57F38C005CF953027A6DE97437EA0527F4E41FCA0F10CE09E7C813CEAF95B697BFB4028865B5BDC1BB7621F7679E11A02B7F4A283F4F3ADE1E3AD5C5E17034D33F63B20900C239E11C7E01FD3BA7D399402500C4B28246D003BDFCA27F48BF553AE0397AF28FCBE5BA934D0010CE09E7F086F3E7249CCFA6120008E82707F1A005733FE51C0EC74BD211EF96F60EEBDB028473C2396AD5AA555E97E395634235AA018080FE7F81BC5F0882792EA7D359453AE28FBD67E93FCB660008E791D8264F9E6CB43FEBD4A9D383FDFAF56BD8BD7BF74E5DBA7419F8EAABAF7EF1E69B6F2EEED5ABD7D6E6CD9B1BE9EB6E60EF2DF2B8D053EAD4874A00C0FFCD313767947E1DF452B3DBEDFF90CE78ADC3E1F8C666B35DC7A60008E791D276EEDC69D6AC59638AB26DDBB6BD84CEA2C971A0AAD4698F1C0B2A500D0038E38CCA65F5C4DA114B87DC515AA6B4F6FAE74D360740388F84F6DE7BEF9913274EE41415D0070C1870D0E3F154660F2E9C1C03D224A4DBA80400840197CBF567E994A748E7BCC2E9743E404500C279B8B771E3C699C58B171F2F2A9CEFDCB9F3605252525BF6E0C2C931400E01F5A7510900082312CCEDD239EF90364402FB9FA80840380FE71342BB75EBF695298641830665F097C1C2C5C5C59DE3BDC2F40D540300C288DBEDBE503AE7F7A4ED74381C6E2A0210CEC3359CDB6CB69B66CF9E5DE4E8796666E6D1060D1AD09F1541FAFC7E4EA7F34D2A0100E1D949DF23017DB9B4E9F2F52D54048473C279382EA5D8B163C771393939278A0AE823468C58CF5E5C38EF353176C8BF67510D0008CF8EFA2CA7D3D9DA7BC26857FDB3275501E19C164EE15C47CF67CC98519CD1F3138D1A357A883DB970D2D7CF977E3F9E4A00407887F4ABA5C31E27ED67698F5311C4A2B4B4344271F8B46C09E7C77CDBA675EBD65F1C154505F471E3C6ED60EE7991E1DCA34BEC520900888C4EBB8EB4CD4EA773546262E2655404B164CE9C39BB32323208C661D0D2D3D3BF9070BECE6F00E1A61E3D7A98C183075B4DBFEED6AD5B6EEBD2A58B69D9B2A569DAB4A95E94E867BBDDFE047B74FEE2E3E32B4A8DF6E9A00CD5008008E9B81D0EC7DB7AC10A69C9725339AA82583063C68C6766CD9AB57FCF9E3D8708C8653762AEC17CFAF4E95BA5BD58CA41867AD2367AFF1A78037B76BE351A24AD33950080082201FD36E9BCE7495BE0743AFF4A45100B2410D64D4D4D5DAA532A74CE332DE44DEBBEAEB4C1DC47CF9F913EAC93F45F7A05D1149BCD761E7BF749E1FC2EFD2B29832F001079CA4907FE2F1D459780DE3B3131F17C4A02049ECE93963039417ED78CFE4B4502C3ED765F2335FD42DA16E9C35EA0222705F4EF655F7B8A4A004004B2D96C974A473ED27B80E32C7F2080F4D2F3F2BBB55083B936F91D6B4C55024B6AFA885E21592F612F5FD7A02256386F2AED4B2A010011CC6EB73F2A07B69F74644F47A4A80870DAA1B18A04A4A5BE60EE0DE7B5A94C500619CE92FAB6F0FE25B0BF7E288AE57AE805E9A42FCFD2C117F60E0088EC035C05E9D0DFF0AE8DDE868B5900A5E372B9EEF4FE1E993CE19C91F3204A4A4ABA44FAB00FA4D6BBA4353A2386E75DCBBE365C6AD09EBD0200A223A4DF241D7BAA1CE47E9090712F15018A4F97FACB2F987BE79CBF468582CF7B52A49EF4BE546A7E7F8C86F307F4AFA1EC0D00105D073897B49D72707B5F02FB4554042832103596DF99ECFC82B9B7A550A5D091BECBAD97B497F689F46157C4601FBE5A3E2CFE833D0100A288F784B6C1D2D2E540579F8A000506F32AFA17A74282B9B6C1542AB424945792BAF7D2BF66C8F669979C9C7C760C7D387945DEF7A7EC05001085A483BF4FDA8FD2A64A875F958A00050622BD8E4077EFBCE7BCE19C1534CA88CBE5BA59B6CD24D906EB62659941F96072B19E182AEFFD4FEC0100108574BD661D79F2CEA7EDAC27905215A0E0DF17F93D99AB1784F10BE773A94C990F34D491B641DA57D287DD1803EFF733E9B75BB2E50120BA3BFB6BF5C0A62350D26A5111E054FEA396DED55B74347D2995098B6DA32B53BDE61D68E81E1F1F5F315ADFAB2E932BEF75255B1D00628074F8CFC8816DAB9E6CA5F36DA908F0FFC9EF44EBBCF37D75349DCA845548BF5A4796B51F93ED658FD2B7A95783DEC0CA5B001023121313CF9790FE5FBDF847ACAF2B0CF893DF87B512F81EA61211F141EA615D3A56B6D94CB7DB7D7B14EE8BFF96F7F7115B1A00628874FC77782F533E974B6883605EFFEFF27BB0864A448E94949433BD97BDD7818681D17412A5EC8B97CB7BFA5557AE614B03406C29E73DB865C8C1A06734CFE3048A08E79FEA32765422F278CF15785FB6E16E69C91ADAA3649F1C27ED5F6C61008841DE511A9DC7B9C9E5723D4D451083E18EE5EB229CFE3550FAB2D9D28F2D93F66014F4CBB5E57D2C61CB02400CF35EC67CBDAEEDAC275E5111C4C887D3D65CF825AA42BA6CCEFADB749B2624245C19A9EFC33B6D67AB7EE860AB02400C8B8B8B3B47C2CA7FBC4B96B592907E16554134E344D0E8A327BECB76EDE1BDCAE8AB917A8D0709E66FC87B788F2D0A00D083C22D72504893F6BDB49A5404511ACC391134BAFBB1AAD2BE91EDFCB3FC1B1769AFDFED765F23AF7DAF7CB8388FAD0900F0859744BDACB91CD8DE9503C585540451B67F7322686C84F4386F40FF46037B84BDF649D292D88A00805C7AA29C1CD83E94B6430E12362A8268C089A031B7BD2BE81417EF94BDB774EA4B24BC6E79CDCFCAEB9DC31604009C425740D0CB4ACBBFDFC981EE462A8248C689A0B1494F1295ED3E52DA76D9079CE1FE7AF52AB5F25A77CA4BADCED60300E47BA0F08D3EC9BFAF2727279F4D5510A11F36391134B6B7FF83DE6517E784FB8A283AD2AF577666AB01000AE472B9AE9703C6443D994E4FAAA32288B060C689A0F02D5798AC1730D20B19E954A7707C9D3A4F5EAF841AA9ABCE0000427BD078DEBBA6F0B0A4A4A44BA80822249C7322287279CFAB19A80158F68B66E1789551796DD3E503A59DAD05002892CD66AB2407B47EDECB677BA808C27C7FE54450E4CBED76DF2E7DD84CD93F7E08B7294FF2BA1CF29A52D94A0080921C3CEED2CB4D4B9B2507B7BF501184234E044531F611BB5E9D53DA67E172B5649DD222AF278393F1010025E29DC3D9420F2272807BD3E3F19C4B5510661F22391114458A8F8FAF28FB4A773DF9DDE170BC160EF3BDE5B5BCA3573E65EB00004ACCBB5CD917D27E71B95CFFA422089360CE89A028111DA996FDE62B691BA4D529CBD7A27F9194D7902EAFE92CB60C00A05434986B40D7A0AE819D8AA08CC3392782A2B4C1F829D97FD6E9153BA55FBBB90CF7E179D2EAF9DFA64BDCB2850000C5A6535B748A8B4E75D1292FE1B81202A21F2782E274E9751DA42F6BE7BDCA682F3D193ED4AF419EBF812E63EBFDC0709B77EACD66B60E00A0C4BC7F929DE53D69F42E2A8210871A4E0445A03EE85D21FBD227D27648BFE60EE5733FF7DC7397C9F31ED08B27493B26CDE8D54ED92A008052D3E516BD17FDE857AF5EBD0BA80842B4DF712228024AFAB0FB65BF5AEA9D6A7257909FEB36691F7947ED4D9EB694AD0100382D7AC122BD70915EC0482F64444510E460CE89A0089672B27F3592B64BFAB20F027D3136D96FABC8CF5E954F20F76F93D90C00808086269D43E972B9AEA72208D27EC689A0082A9BCD7691F465FDF52AA37A6E4D205754917DB7BE9E2F514838FF982D00000818EF4956AFEB9F6BE5DF57597900010E4D9C088A90913EAC86F46569D256C8D78F04EAE7CAFE7B6701535A8C3C4F4F2A0F00084688D2F584BFF3FE09F7412A820085254E044559EC772FC87EB745979175BBDDD704E2677A5767D9904F386F4DC50100412307209BAE8220ED43463B71BA38111465C566B39D27FB5F8AB4BDD2AF758A8B8B3BA788405FA5A89FE9F1782A7B4F42F50FE709541B0010546EB7FB423998BDAB2759494BA422286530E7445084C37E7883B471D236E6BD80509EC70D94D6BE98017DB22F9CDBEDF627A83200205407B59AD2BE978035C366B355A32228E1FEC389A0081B1AA2F5C3A2EC9353F2F667DE39E5BA6E79B686F9A27E969E9B233F678237A0B791AF5F967FBFF44E7B39E0BD5D7FD666EFE3DA076A7A0D0020C6E9AA07726069E53D61F43F45FD6918F0EE379C088AB0A3A1DA7B1E845E31B98FEF5A0F725BAADF3495D4E2FC2C79DCB3F2F87DF2EF8922965AF46F3399060300080839A85CE51D195ACF9F71518CE0C289A0085B8989899779AFF5902E6D403E21DA53485F7883ECDF534A10C8F36B73E503EC4D6C0900C06973B95C4FCB816593B4CFE40075391541010186134111F6EC76FB43B29F66E7139E0FC8EDD5F33E5ED73C973EF057FFC7BADD6ED3B3674F3363C60CB36DDB36F3FBEFBF1BF5C71F7F98F4F474337FFE7CD3AF5F3F231F08F27B0E46D10100A74F5741D0B57DBD7F1A6E2A3795A32AF00BE69C088A48D957530A1BDDCE13CCEBCA7E7DDC3F948F1A35CA64646498E2C8CACAB21EAFFF2FCF6A2F8DD912008080F05EF063AEB48572E0BA838AC01B78381114614F4FD0F43B79B3A0D6D41BCCEBFB07F3B66DDB5AA3E4A5A1FFAF43870E86E5180100C1524E0E2E8DF4B2D97200FB6F6262E2F994247671222822E9436431E6861F92FDF91EFFA92C5DBB76CD9DBA525A3AE5A5478F1E454EA30100A0D4F4021E7280F944DA5639983D434562763FE0445044CABEFAB08E58EB3287DEE92DBACEF9C7DEA50FF52F827B747945F9FEB0FF88F9E90673FF809E67047D2E5B050010707280A9256D9DB4AFA45D4B45626EFB732228A286CBE5B2F9CF312FED5496C2A6B8F8CF41677A0B0020286C365B0539D074F6AE8DDE4ED716A62A3111CC39111451C57FFD733D993318468F1ECDE8390020341C0E475539D84C95F6A37C7D3F1589FA70CE89A0881A7AC2A8EF24501DDDDEB76F5F50C2B9AEE2926799C51BA83E0020D821BDBEF7621F833D1E4F652A127D38111451D86FBDEC0BCCBD7BF736C1A4EBA0FB85F3F6541F00108AF076911CECDE9703CF4E692E2A125D381114D1C67B45642B30CF9A352BA8E15C2F54E417CE27527D0040C8B85CAE7B25A4FFA07339B97C755405194E0445B4EDD31B7C8139D02782E6A55712F50BE7DBA93E0020A424949F2507A0367AC2A804F537F40452AA12D121861341118DFB75EE058A02B57C6261CB2AFA85F36CAA0F002813DE2BF48D9760F793DD6E7F948A44E407AD2B3811141116BA6B69DF538CC7E506E650F07F3EB61200A04C49388F9703D216692325EC5D4A452266BB3D3B76EC58D3B469D3DF3811141114CE3FD600ACD3EBBC57096D2FFBEF9D79977C65E41C0010D3121313CF97B0D7DB7B55BE7FC94DE5A84A78920F50955AB76E3D6AD3A64D591A2CFAF7EFFF3D5541047DA84CF01FA5F66B1AC617EAAA52D25E94B69939E7008098E776BB6F9783D30269F31D0EC76D5424BCC876A9F9F6DB6F6FCACECE3EE00B16E3C78F9F456510411F2E6F92FDF8580101DDBF1D64B5160000FE4F39394025EB28BA04F4B7E3E3E32B5292B2979090D071DAB469FB7272728EFB078B65CB966DA33A88B00F994B0B09E539D2C6497B8F75CE0100F09398987899774EE86609E975A948D9D093E7DAB76F3F2F3D3D3D33BF60B163C78EE379E7EB02E1FAC15FFF3A27FDC9C2FC82B9DCBEDF773563EF09EBC742718550F9E09BC31542010011C3E9743E2607AC9F7534CB66B35D4D4542AB67CF9EE6E8D1A3870A0A17070E1C38D1AC59B36A540AE1C8E572DD2C7D4813E93FC648CB90B65E02F8F47CC279A64EDBCAD3F7A4FAEE1F356A5450C2F9E8D1A3FD5FC35CB618002022C4C5C59D2307AEAE7A00D5AB51EA5AE9542534C68D1BB7BDA880D1BB77EF57A914C281F411D74A1FD140DA083DB952DA36699F48204FF22DA128F755C93362AE1746AB92CFC0C0B3BEC7E8E879A04F0CD59F271F1E7247CDF56455B6200020A2E828981CC474D46BB91C50EFA122C1F7D9679FCD282A648C1A356A2A954259F04E7F73481BE2BDAAE71EEF28797261572196FBD77903716A7EC1DCEF71337DE1B96DDBB6015B5651974F6CD7AEDD71FF5173A687010022960473B71CCC76EA495B7200BE888A044F9F3E7D528A0A1A63C78EDD45A5100AFAFB2EBFF7F52450F7977E60A5B42CF9FE6BBD1096CE273FA398CBB0CAFFEF29FFE7238FC7736E618FD339E0DE292F5688EEDAB5EB6907740DE63D7AF4F09F677E405E4F75B62E0020A2E9856FE4E0FA811CD876E8C81915090E9D877BF0E0C1E305058D9C9C9C1343860CE1AA86080A5DAD497ECF9F92FDB097B42512627F977FA74AFBB7FEF5ACB453DC0A1B2DCF6730A0BEFFF28B3A825EDA292EFAFFF28C98339D0500105DE4C0F6801CE056C801748A04F63F5391C0D291C5B56BD7E6143002B8BF5BB76EFB641B3C4CA5100812B62BD8EDF67FC8EF748AB439DE51E5D9DE734EFEAEF797D187548F7F40D739E87A92A8AEB652DC5559F4E44FFF39E6DEF9EEAFB1D501005147E76AEAFAC0FAE76739D8752AAB0378B45ABC78F129CB286EDAB4694B93264DD6F3E7789C66183F4B02EBBD1A52E5F7779A77647C898E94CBD74F86D3750E7404DD3B8DC6F887745D075D2F54A4A3E2BE292F3A7545AFFCA917187AF7DD774D83060D4EE47345520F7B000020DA0FF4D7E9FC53696B75F48D8A04C6575F7D35CF6F1ACBF16FBFFDF6670925F34A323500F0F2AD35FE8A77AE7896CE1DD739E43A973CDCCF21D139E8FE4B2C96B2CDE5432D0020A6789740DB2AED6302E4E9FBE4934FFEABC13C3333F3684A4ACA2F7A71A8A24EA4037C0A586BFC03B9CD2E61FCD2487C4FF21E5EF486F4632509E53A5ACEAA2C0080982407FD4A72F0EC2B07C3DDD21A9E51C82A0E1A34B9325FC1FAF7EFFF4FFDB3BDD449A71C74275CA088E05AE45AE3D142DF8F5E7B41DEDF977A356369D9DE209EED7DEF13BD53EEE85F0000502E97EB4E39302ED293CB24B0DF9ADF63BCF35D67E6779F31A6FCA64D9BBE5CB468D189B4B434939A9A1A736DD2A449D6C89FCE9D2D8BE79F3E7DBA993367CE5E69AC6A11864ABBD63800008851292929674A006FE6FD93FA5B1218CEF3DDA7235FDE93B374E58497F3FE5F0DE673E7CE35191919E6C8912331DBB66FDF5EA6CF9F99996966CF9EFD9B04F517D9A3CB56A0D61A070000848A2B24447C2E6DA3048938BDCDFB6767DFB2665979E7A8EB8879AC07F3706912D08FA4A6A6AE634F0EAD60AD350E000060D125DAF4CFEFF2EFFCBC276DC96DA3FD1FAB535908C6E1D3249C1F630F0EFA87D8B05C6B1C000044318FC753D9379D259F809E7B511D9DF34C280EAB70CED548031FC62366AD71000010A52474F42C64C9B385BE15498A1BCE0FEEDF65362DFDD8AC99DECD6AFAB5DE46A0269C87A1885E6B1C00004419EF0A2ED985AD49ACCBA315379C1FC84A37ABA776312B267538A9E96D7A1FA19A701E06FB7CD4AD350E0000A2842E9B588C0B8664EB09A4C509E7DBD77C734A30F7B51D6B2612AA09E765B18FC7CC5AE3000020C269E89690729B84955A125E12BC1709E9AE5714953659DA3A6947E531BB8B13CED7CD7CBBC070AEF711AA09E7C1C65AE3000020AA2527279FAD4BC515279CAF4E4D29309CEB7D846AC279103E60B2D6380000883D8473C2793860AD710000806286735D9DA5A070AEF711AA09E725C55AE3000000A50CE71BE6BF576038D7FB08D584F3628471D61A070000084438DF97BED2AC9ED6F5D4292D729BDE47A8269CE783B5C60100008211CEB56DFE7EE429E15C6F235013CE7D586B1C00002014E1FCF061B361C1E053A7B4C86D7A1FA13A36C3396B8D03000084389CEB1540D7CF1F58E09C73BD8FAB84C6463867AD71000080B20AE7870F9B5D1B669855533A1618CC7D4D1FA38F65143DBAC2396B8D0300008441382F6AB49C51F4E80CE7AC350E00001086E1BC38A3E5858DA213B2031FCE6BD5AA553ED0DB9EB5C601000022209C973698FB1A213BB0E1BC458B16FF58B66C9959B468D196B163C7F64C4949A95CCA30CE5AE30000009116CE69E113CE5BB66C5975D5AA55878D9FFDFBF7E72C5EBC78D3F8F1E3FB7EF1C517550BD9BCAC350E00004038A705229C4B78AEB464C9922C5388C3870FE7AC58B1227DEAD4A9EF0E1932A40A6B8D03000010CE69010EE73AC75C82F976534C7FFCF18769DBB6AD9130BE8BB5C601000008E7B40086F31F7FFCF1A7E206F3C3870F9FE8D4A9D34109E4F5D9A301000008E7B40086F355AB562D286E303F2EFAF4E9B3CDE97456676F060000209CD302D8962C5952DC5C6E8E1D3B76A27FFFFEAB259857614F060000209CD302D876EEDC699A376F6E468C1861B66EDDFA7B4E4ECE898282F9D1A34773060F1E9CE6F178CE652F060000209CD382D0BEFDF65B63B7DB9FA85FBF7EF7B66DDB2E1D3D7AF4E19F7EFA697FDEA03E66CC98B1C1B8301100000008E7B402D639D7E51435AC376FDEBCCFA851A336AC5CB9D2CC993367387B2E000000E19C5606570805000000E19C463807000000E19C700E000000C2398D700E000000C2398D700E00004038271413CE0100004038A711CE0100004038279C03000080704E239C030000202CC3F9D4A953AD56D0FDFBF6ED331F7CF081494F4F2FD1CF9D3F7FBE1930604081F7AF5BB7CE4C9830C1FA7AF9F2E566C78E1DE6F0E1C366F1E2C566CF9E3D8473000000C44638DFB973A7158677EFDE6DE2E2E2CC134F3C61DDB675EB56F3D1471F998E1D3B9A03070E588FD5C7C9CB348B162D32C3870F37575D7595B9FEFAEB73DBD5575F6D5E7BED35B370E142F3F2CB2F9B575E79C56AD5AB57B7FE5FD3A64D736FD3FB172C5860FDDCC183079BCA952B5B5FEBCF79EBADB7ACAF2B54A8603EFFFC73C23900000062239C376EDCD80ACE79DB05175C602A56AC689E7DF6596B147BD9B265D6A8B9DED7B3674FD3B9736753A952252BC0FB9A86EC59B366993163C6588F733A9D568B8F8F37B7DF7EBB79E18517726F2B57AE9C15BC7574BC79F3E6D6F34D9E3CD954AB56CDF4E9D3C77A6DFAFCE3C78F376BD7AE35BB76ED229C03000020BAC3F9A64D9BCC0F3FFC6056AE5C699E7AEA29F3E8A38F9ACF3EFBCC9C73CE39E6E1871F36FBF7EFB71EA7D352AEBCF24A2B745F76D965A64E9D3AD668F7D8B163ADF6E5975F9AEFBEFBCE7AEC92254BCC934F3E6985DBE9D3A75BFF57FFDFC89123ADEFF5761DA5D791F3162D5A58215CC3FA6DB7DD6685731D7D5FB3668D75BB8ED0D7A851C31A75279C030000206AC3B986E61B6EB8C154AD5AD56A3A12AE81589B86E92BAEB8C25C7BEDB5E6EDB7DFB61EDFBB776FEB768FC763FAF7EF9F3BCA5EA54A15EBFF6AC0CECCCCCC1D91D769291AE8F57E7DDCA5975E6A7DAFC15FEFF7BD8E0F3FFCD05C72C925D6D71ACEF5B137DF7CB3F53ACE3FFF7C73CB2DB794789E3BE11C0000001115CE756EB84E4519366C98E9D6AD9B35B5E4CC33CFB446B3F5B641830659F7EBE3746A8B8E6CFB02B98EB26B70D7AF67CF9E6D85EDFBEEBB2FF767EB48F75D77DD65C68D1B67CD21D7C76908D7EFEFB8E38EDC9170FDB97A7FF9F2E5CD73CF3D6785739D32A373DE359CDF79E79DD6D7CC39070000405487736DEBD7AF37EDDBB737E79D779E7532E6A44993AC292A3AED44C3F7E6CD9B7347B775E45B43F64B2FBD64CD237FFEF9E7CD030F3C60EAD5AB672EBCF042F3CE3BEF9C14CE2FBAE82273FFFDF75BD352F4FF6958D7EFF5765F38D79FA5F7E928FBFBEFBF9FEF9C734E0805000040D487F31E3D7A5823E57FFAD39FAC916B5D6D4543BA7EAD73C6F5C44F5D3ED117B6DBB4696305693D39F4C1071FB442BD8667BDEDF2CB2F375959592785731D691F3A74A879FDF5D7ADC7F4EDDBD7FADE7F0EB92EB3D8AE5DBB93A6B5E40DE73A823F70E040C239000000A2379C6FD9B2C59A3BAE015C47C575AA8A4E3BF1CD1B6FD5AA9579FCF1C7734F1CD5C76BC8D6133F35D4EBAA2C1D3A74B06ED39343D3D2D24E5A054603B72ECD78EFBDF75A8FD1134CF57BBDBDB039E78D1A35B202BA2F9CB76DDBD6D86C36C239000000A2379CFB371DF9BEF5D65BADD1710DDCBABCA10676FF50AC6BA16BC8AE59B3A675A2A64E69D1EFBB74E962CD37D7C0AEA3F1FAD879F3E699193366585FCF9D3BD77A9C6F8A8CBE4FDF1AE7FA6F6262A275D2A8AE7FAE23F77A62A92EB7A827996A98D7E936BADE3AE11C0000003111CE75EA48DDBA75ADA5141F79E4112B14EBAA2CBAC4A2EF311AAE35946B70EED7AF9F15DC75F45CEFD3292DFFFAD7BFCCCC99334FF9D9BAF6B98E8CEB7AE579EFD3134F6FBCF146D3ECFFB573F73608020118861734B171023A36611477E02784D60168680C21062A2B2D2CF0CEC2111472CF937C0B902BDE10B83CFFFC085A14C53A0CC3F776987865639665EB388EE21C008034E2DCC4390000E25C9C030020CE4D9C030020CEC5390000E2DCC4390000E25C9C030020CE4D9C030020CEC5390000E2DCC4390000E25C9C030020CE4D9C030020CEC5390000E2DCC4390000E25C9C030020CE4D9C030020CEC5390000E2DCC4390000E25C9C030020CE4D9C030020CE4D9C03008873512CCE010010E726CE010010E7E21C0000716EE21C0000712ECE010010E726CE010010E7E21C00809DA8EB5A146F67CF10E72FA7120020515DD7DD966511C61BD8344DE710E7BD53090090A8A6698E6DDBDEE7797E08E4FFBD318F615E55D535ECE4540200242C04E1A12CCB4BFCA4227EF36C3F5F7CEEBD30070000000000000000000000000000000000000000000000000060B7DEFE7C9E8F649A87C90000000049454E44AE426082, 1);
COMMIT;

-- ----------------------------
-- Table structure for ACT_GE_PROPERTY
-- ----------------------------
DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;
CREATE TABLE `ACT_GE_PROPERTY` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_GE_PROPERTY
-- ----------------------------
BEGIN;
INSERT INTO `ACT_GE_PROPERTY` VALUES ('cfg.execution-related-entities-count', 'true', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('cfg.task-related-entities-count', 'true', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('common.schema.version', '6.4.1.3', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('entitylink.schema.version', '6.4.1.3', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('identitylink.schema.version', '6.4.1.3', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('job.schema.version', '6.4.1.3', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('next.dbid', '1', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('schema.history', 'create(6.4.1.3)', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('schema.version', '6.4.1.3', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('task.schema.version', '6.4.1.3', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('variable.schema.version', '6.4.1.3', 1);
COMMIT;

-- ----------------------------
-- Table structure for ACT_HI_ACTINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_ACTINST`;
CREATE TABLE `ACT_HI_ACTINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_HI_ATTACHMENT
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_ATTACHMENT`;
CREATE TABLE `ACT_HI_ATTACHMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_HI_COMMENT
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_COMMENT`;
CREATE TABLE `ACT_HI_COMMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_HI_DETAIL
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_DETAIL`;
CREATE TABLE `ACT_HI_DETAIL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_HI_ENTITYLINK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_ENTITYLINK`;
CREATE TABLE `ACT_HI_ENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_HI_IDENTITYLINK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_IDENTITYLINK`;
CREATE TABLE `ACT_HI_IDENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_HI_PROCINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_PROCINST`;
CREATE TABLE `ACT_HI_PROCINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_HI_TASKINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_TASKINST`;
CREATE TABLE `ACT_HI_TASKINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_HI_TSK_LOG
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_TSK_LOG`;
CREATE TABLE `ACT_HI_TSK_LOG` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_HI_VARINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_VARINST`;
CREATE TABLE `ACT_HI_VARINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_EXE` (`EXECUTION_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_ID_BYTEARRAY
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_BYTEARRAY`;
CREATE TABLE `ACT_ID_BYTEARRAY` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_ID_GROUP
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_GROUP`;
CREATE TABLE `ACT_ID_GROUP` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_ID_INFO
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_INFO`;
CREATE TABLE `ACT_ID_INFO` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_ID_MEMBERSHIP
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_MEMBERSHIP`;
CREATE TABLE `ACT_ID_MEMBERSHIP` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `ACT_ID_GROUP` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `ACT_ID_USER` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_ID_PRIV
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_PRIV`;
CREATE TABLE `ACT_ID_PRIV` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PRIV_NAME` (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_ID_PRIV_MAPPING
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_PRIV_MAPPING`;
CREATE TABLE `ACT_ID_PRIV_MAPPING` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_PRIV_MAPPING` (`PRIV_ID_`),
  KEY `ACT_IDX_PRIV_USER` (`USER_ID_`),
  KEY `ACT_IDX_PRIV_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `ACT_ID_PRIV` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_ID_PROPERTY
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_PROPERTY`;
CREATE TABLE `ACT_ID_PROPERTY` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_ID_PROPERTY
-- ----------------------------
BEGIN;
INSERT INTO `ACT_ID_PROPERTY` VALUES ('schema.version', '6.4.1.3', 1);
COMMIT;

-- ----------------------------
-- Table structure for ACT_ID_TOKEN
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_TOKEN`;
CREATE TABLE `ACT_ID_TOKEN` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `IP_ADDRESS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_AGENT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_ID_USER
-- ----------------------------
DROP TABLE IF EXISTS `ACT_ID_USER`;
CREATE TABLE `ACT_ID_USER` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_PROCDEF_INFO
-- ----------------------------
DROP TABLE IF EXISTS `ACT_PROCDEF_INFO`;
CREATE TABLE `ACT_PROCDEF_INFO` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RE_DEPLOYMENT
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RE_DEPLOYMENT`;
CREATE TABLE `ACT_RE_DEPLOYMENT` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RE_DEPLOYMENT
-- ----------------------------
BEGIN;
INSERT INTO `ACT_RE_DEPLOYMENT` VALUES ('d4738714-ac51-11e9-a42b-7e32093327fc', 'SpringBootAutoDeployment', NULL, NULL, '', '2019-07-22 15:25:06.813', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for ACT_RE_MODEL
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RE_MODEL`;
CREATE TABLE `ACT_RE_MODEL` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RE_PROCDEF
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RE_PROCDEF`;
CREATE TABLE `ACT_RE_PROCDEF` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DERIVED_VERSION_` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`DERIVED_VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RE_PROCDEF
-- ----------------------------
BEGIN;
INSERT INTO `ACT_RE_PROCDEF` VALUES ('Leave:1:d5ea2187-ac51-11e9-a42b-7e32093327fc', 1, 'http://www.flowable.org/processdef', '请假流程', 'Leave', 1, 'd4738714-ac51-11e9-a42b-7e32093327fc', '/Users/duyudong/Desktop/服务器项目/bladex-boot/target/classes/processes/LeaveProcess.bpmn20.xml', '/Users/duyudong/Desktop/服务器项目/bladex-boot/target/classes/processes/LeaveProcess.Leave.png', '请假流程', 0, 1, 1, '', NULL, NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for ACT_RU_ACTINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_ACTINST`;
CREATE TABLE `ACT_RU_ACTINST` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_ACTI_START` (`START_TIME_`),
  KEY `ACT_IDX_RU_ACTI_END` (`END_TIME_`),
  KEY `ACT_IDX_RU_ACTI_PROC` (`PROC_INST_ID_`),
  KEY `ACT_IDX_RU_ACTI_PROC_ACT` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC` (`EXECUTION_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC_ACT` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RU_DEADLETTER_JOB
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_DEADLETTER_JOB`;
CREATE TABLE `ACT_RU_DEADLETTER_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_DJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RU_ENTITYLINK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_ENTITYLINK`;
CREATE TABLE `ACT_RU_ENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RU_EVENT_SUBSCR
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_EVENT_SUBSCR`;
CREATE TABLE `ACT_RU_EVENT_SUBSCR` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RU_EXECUTION
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_EXECUTION`;
CREATE TABLE `ACT_RU_EXECUTION` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RU_HISTORY_JOB
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_HISTORY_JOB`;
CREATE TABLE `ACT_RU_HISTORY_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RU_IDENTITYLINK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_IDENTITYLINK`;
CREATE TABLE `ACT_RU_IDENTITYLINK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `ACT_RU_TASK` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RU_JOB
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_JOB`;
CREATE TABLE `ACT_RU_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_JOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RU_SUSPENDED_JOB
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_SUSPENDED_JOB`;
CREATE TABLE `ACT_RU_SUSPENDED_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_SJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RU_TASK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_TASK`;
CREATE TABLE `ACT_RU_TASK` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  `SUB_TASK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_IDX_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RU_TIMER_JOB
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_TIMER_JOB`;
CREATE TABLE `ACT_RU_TIMER_JOB` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_TJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for ACT_RU_VARIABLE
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_VARIABLE`;
CREATE TABLE `ACT_RU_VARIABLE` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_RU_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for blade_client
-- ----------------------------
DROP TABLE IF EXISTS `blade_client`;
CREATE TABLE `blade_client` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `client_id` varchar(48) NOT NULL COMMENT '客户端id',
  `client_secret` varchar(256) NOT NULL COMMENT '客户端密钥',
  `resource_ids` varchar(256) DEFAULT NULL COMMENT '资源集合',
  `scope` varchar(256) NOT NULL COMMENT '授权范围',
  `authorized_grant_types` varchar(256) NOT NULL COMMENT '授权类型',
  `web_server_redirect_uri` varchar(256) DEFAULT NULL COMMENT '回调地址',
  `authorities` varchar(256) DEFAULT NULL COMMENT '权限',
  `access_token_validity` int(11) NOT NULL COMMENT '令牌过期秒数',
  `refresh_token_validity` int(11) NOT NULL COMMENT '刷新令牌过期秒数',
  `additional_information` varchar(4096) DEFAULT NULL COMMENT '附加说明',
  `autoapprove` varchar(256) DEFAULT NULL COMMENT '自动授权',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) NOT NULL COMMENT '状态',
  `is_deleted` int(2) NOT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blade_client
-- ----------------------------
BEGIN;
INSERT INTO `blade_client` VALUES (1123598811738675201, 'sword', 'sword_secret', NULL, 'all', 'refresh_token,password,authorization_code', 'http://localhost:8888', NULL, 3600, 604800, NULL, NULL, 1, '2019-03-24 10:40:55', 1, '2019-03-24 10:40:59', 1, 0);
INSERT INTO `blade_client` VALUES (1123598811738675202, 'saber', 'saber_secret', NULL, 'all', 'refresh_token,password,authorization_code', 'http://localhost:8080', NULL, 3600, 604800, NULL, NULL, 1, '2019-03-24 10:42:29', 1, '2019-03-24 10:42:32', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_code
-- ----------------------------
DROP TABLE IF EXISTS `blade_code`;
CREATE TABLE `blade_code` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `service_name` varchar(64) DEFAULT NULL COMMENT '服务名称',
  `code_name` varchar(64) DEFAULT NULL COMMENT '模块名称',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名',
  `table_prefix` varchar(64) DEFAULT NULL COMMENT '表前缀',
  `pk_name` varchar(32) DEFAULT NULL COMMENT '主键名',
  `package_name` varchar(500) DEFAULT NULL COMMENT '后端包名',
  `api_path` varchar(2000) DEFAULT NULL COMMENT '后端路径',
  `web_path` varchar(2000) DEFAULT NULL COMMENT '前端路径',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blade_code
-- ----------------------------
BEGIN;
INSERT INTO `blade_code` VALUES (1123598812738675201, 'blade-demo', '通知公告', 'blade_notice', 'blade_', 'id', 'org.springblade.desktop', 'D:\\Develop\\WorkSpace\\Git\\SpringBlade\\blade-ops\\blade-develop', 'D:\\Develop\\WorkSpace\\Git\\Sword', 0);
INSERT INTO `blade_code` VALUES (1153194615879266306, 'oa_server', 'oa管理', 'oa_server', 'oa_', 'id', 'org.springblade.modules.oa', '/Users/duyudong/Desktop/123', '/Users/duyudong/Desktop/123', 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_dept
-- ----------------------------
DROP TABLE IF EXISTS `blade_dept`;
CREATE TABLE `blade_dept` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父主键',
  `dept_name` varchar(45) DEFAULT NULL COMMENT '部门名',
  `full_name` varchar(45) DEFAULT NULL COMMENT '部门全称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blade_dept
-- ----------------------------
BEGIN;
INSERT INTO `blade_dept` VALUES (1123598813738675201, '000000', 0, '刀锋科技', '江苏刀锋科技有限公司', 1, NULL, 0);
INSERT INTO `blade_dept` VALUES (1123598813738675202, '000000', 1123598813738675201, '常州刀锋', '常州刀锋科技有限公司', 1, NULL, 0);
INSERT INTO `blade_dept` VALUES (1123598813738675203, '000000', 1123598813738675201, '苏州刀锋', '苏州刀锋科技有限公司', 1, NULL, 0);
INSERT INTO `blade_dept` VALUES (1153199718656962561, '497087', 0, '用户组', '用户组', 2, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_dict
-- ----------------------------
DROP TABLE IF EXISTS `blade_dict`;
CREATE TABLE `blade_dict` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父主键',
  `code` varchar(255) DEFAULT NULL COMMENT '字典码',
  `dict_key` int(2) DEFAULT NULL COMMENT '字典值',
  `dict_value` varchar(255) DEFAULT NULL COMMENT '字典名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '字典备注',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blade_dict
-- ----------------------------
BEGIN;
INSERT INTO `blade_dict` VALUES (1123598814738675201, 0, 'sex', -1, '性别', 1, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675202, 1123598814738675201, 'sex', 1, '男', 1, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675203, 1123598814738675201, 'sex', 2, '女', 2, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675204, 0, 'notice', -1, '通知类型', 2, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675205, 1123598814738675204, 'notice', 1, '发布通知', 1, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675206, 1123598814738675204, 'notice', 2, '批转通知', 2, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675207, 1123598814738675204, 'notice', 3, '转发通知', 3, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675208, 1123598814738675204, 'notice', 4, '指示通知', 4, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675209, 1123598814738675204, 'notice', 5, '任免通知', 5, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675210, 1123598814738675204, 'notice', 6, '事务通知', 6, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675211, 0, 'menu_category', -1, '菜单类型', 3, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675212, 1123598814738675211, 'menu_category', 1, '菜单', 1, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675213, 1123598814738675211, 'menu_category', 2, '按钮', 2, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675214, 0, 'button_func', -1, '按钮功能', 4, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675215, 1123598814738675214, 'button_func', 1, '工具栏', 1, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675216, 1123598814738675214, 'button_func', 2, '操作栏', 2, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675217, 1123598814738675214, 'button_func', 3, '工具操作栏', 3, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675218, 0, 'yes_no', -1, '是否', 5, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675219, 1123598814738675218, 'yes_no', 1, '否', 1, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675220, 1123598814738675218, 'yes_no', 2, '是', 2, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675221, 0, 'flow', -1, '流程类型', 5, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675222, 1123598814738675221, 'flow', 1, '请假流程', 1, 'leave', 0);
INSERT INTO `blade_dict` VALUES (1123598814738675223, 1123598814738675221, 'flow', 2, '报销流程', 2, 'expense', 0);
INSERT INTO `blade_dict` VALUES (1123598814738675224, 0, 'oss', -1, '对象存储类型', 6, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675225, 1123598814738675224, 'oss', 1, 'minio', 1, NULL, 0);
INSERT INTO `blade_dict` VALUES (1123598814738675226, 1123598814738675224, 'oss', 2, 'qiniu', 2, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_log_api
-- ----------------------------
DROP TABLE IF EXISTS `blade_log_api`;
CREATE TABLE `blade_log_api` (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `server_host` varchar(255) DEFAULT NULL COMMENT '服务器名',
  `server_ip` varchar(255) DEFAULT NULL COMMENT '服务器IP地址',
  `env` varchar(255) DEFAULT NULL COMMENT '服务器环境',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `method_class` varchar(255) DEFAULT NULL COMMENT '方法类',
  `method_name` varchar(255) DEFAULT NULL COMMENT '方法名',
  `params` text COMMENT '操作提交的数据',
  `time` varchar(64) DEFAULT NULL COMMENT '执行时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blade_log_api
-- ----------------------------
BEGIN;
INSERT INTO `blade_log_api` VALUES (1125388216836780034, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantCode=000000&username=admin&password=admin&grant_type=password&scope=all&type=account', '128', '', '2019-05-06 21:13:54');
INSERT INTO `blade_log_api` VALUES (1125388649185636354, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantCode=000000&username=admin&password=admin&grant_type=password&scope=all&type=account', '16', '', '2019-05-06 21:15:37');
INSERT INTO `blade_log_api` VALUES (1125388961841639426, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantCode=000000&username=admin&password=admin&grant_type=password&scope=all&type=account', '10', '', '2019-05-06 21:16:52');
INSERT INTO `blade_log_api` VALUES (1125389261314945025, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'password=admin&grant_type=password&scope=all&tenantCode=000000&type=account&username=admin', '11', '', '2019-05-06 21:18:03');
INSERT INTO `blade_log_api` VALUES (1125583685718310913, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.129:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantCode=000000&username=admin&password=admin&grant_type=password&scope=all&type=account', '70', '', '2019-05-07 10:10:38');
INSERT INTO `blade_log_api` VALUES (1125642132849651714, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.129:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantCode=000000&username=admin&password=admin&grant_type=password&scope=all&type=account', '353', '', '2019-05-07 14:02:53');
INSERT INTO `blade_log_api` VALUES (1132819868877754369, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.133:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'refresh_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJhZG1pbiIsImF2YXRhciI6Imh0dHBzOi8vZ3cuYWxpcGF5b2JqZWN0cy5jb20vem9zL3Jtc3BvcnRhbC9CaWF6ZmFueG1hbU5Sb3h4VnhrYS5wbmciLCJhdXRob3JpdGllcyI6WyJhZG1pbmlzdHJhdG9yIl0sImNsaWVudF9pZCI6InNhYmVyIiwicm9sZV9uYW1lIjoiYWRtaW5pc3RyYXRvciIsImxpY2Vuc2UiOiJwb3dlcmVkIGJ5IGJsYWRleCIsInVzZXJfaWQiOjExMjM1OTg4MjE3Mzg2NzUyMDEsInJvbGVfaWQiOiIxMTIzNTk4ODE2NzM4Njc1MjAxIiwic2NvcGUiOlsiYWxsIl0sIm5pY2tfbmFtZSI6IueuoeeQhuWRmCIsImF0aSI6IjY2YWEzMGViLTE2MjgtNDhkMS05Nzk4LTcyODcyNmRlNGU0MyIsImV4cCI6MTU1OTUyMjA3MiwianRpIjoiNzRkZmQ0MzctMWY3Ni00NmYxLWE1NDItNTZiZjQyMzVjYmU3IiwiYWNjb3VudCI6ImFkbWluIiwidGVuYW50X2NvZGUiOiIwMDAwMDAifQ.pGYtAWRfg_S-ygvsh0sBApdZ3Dl5SZxbRdgXZuScrNE&grant_type=refresh_token&scope=all', '34', 'admin', '2019-05-27 09:24:38');
INSERT INTO `blade_log_api` VALUES (1132820719541325825, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.133:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantCode=000000&username=admin&password=admin&grant_type=password&scope=all&type=account', '83', '', '2019-05-27 09:28:01');
INSERT INTO `blade_log_api` VALUES (1132833327375843329, '000000', 'blade-api', 'smallchill-3.local', '172.20.10.9:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'refresh_token=eyJ0eXAiOiJKc29uV2ViVG9rZW4iLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ1c2VyX2lkIjoiMTEyMzU5ODgyMTczODY3NTIwMSIsInRva2VuX3R5cGUiOiJyZWZyZXNoX3Rva2VuIiwiY2xpZW50X2lkIjoic2FiZXIiLCJleHAiOjE1NTk1MjUyODAsIm5iZiI6MTU1ODkyMDQ4MH0.FR0PxUxen-OP8w-dTzQuaScD1yE0gk1nRUhCFBWfTgI&grant_type=refresh_token&scope=all', '121', 'admin', '2019-05-27 10:18:07');
INSERT INTO `blade_log_api` VALUES (1132892111276257282, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.104:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantCode=000000&username=admin&password=admin&grant_type=password&scope=all&type=account', '550', '', '2019-05-27 14:11:42');
INSERT INTO `blade_log_api` VALUES (1132900479285993474, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.104:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '0:0:0:0:0:0:0:1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantCode=000000', '4', '', '2019-05-27 14:44:57');
INSERT INTO `blade_log_api` VALUES (1132900609296834562, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.104:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '0:0:0:0:0:0:0:1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantCode=000000', '0', '', '2019-05-27 14:45:28');
INSERT INTO `blade_log_api` VALUES (1132900629660180482, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.104:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '0:0:0:0:0:0:0:1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantCode=000000', '0', '', '2019-05-27 14:45:33');
INSERT INTO `blade_log_api` VALUES (1132901050319560705, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.104:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '0:0:0:0:0:0:0:1', 'org.springblade.modules.auth.AuthController', 'token', 'password=admin&tenantCode=000000&username=admin', '570', '', '2019-05-27 14:47:13');
INSERT INTO `blade_log_api` VALUES (1132926013730668545, '000000', 'blade-api', 'smallchill-3.local', '172.20.10.9:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantCode=000000&username=admin&password=admin&grant_type=password&scope=all&type=account', '571', '', '2019-05-27 16:26:25');
INSERT INTO `blade_log_api` VALUES (1132940401531314178, '000000', 'blade-api', 'smallchill-3.local', '172.20.10.9:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantCode=000000&username=admin&password=admin&grant_type=password&scope=all&type=account', '791', '', '2019-05-27 17:23:35');
INSERT INTO `blade_log_api` VALUES (1133000318514520065, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'refresh_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJhZG1pbiIsImF2YXRhciI6Imh0dHBzOi8vZ3cuYWxpcGF5b2JqZWN0cy5jb20vem9zL3Jtc3BvcnRhbC9CaWF6ZmFueG1hbU5Sb3h4VnhrYS5wbmciLCJhdXRob3JpdGllcyI6WyJhZG1pbmlzdHJhdG9yIl0sImNsaWVudF9pZCI6InNhYmVyIiwicm9sZV9uYW1lIjoiYWRtaW5pc3RyYXRvciIsImxpY2Vuc2UiOiJwb3dlcmVkIGJ5IGJsYWRleCIsInVzZXJfaWQiOjExMjM1OTg4MjE3Mzg2NzUyMDEsInJvbGVfaWQiOiIxMTIzNTk4ODE2NzM4Njc1MjAxIiwic2NvcGUiOlsiYWxsIl0sIm5pY2tfbmFtZSI6IueuoeeQhuWRmCIsImF0aSI6Ijg3NDEwZjU2LWYxNWQtNDkwOC1iMmQyLWI4NWFmZTA0YjkzMCIsImV4cCI6MTU1OTU2NTA5MiwianRpIjoiN2Q1ZDUzYWItNTA4ZC00OTkwLWE1YTUtNmNkMGJhMjkwNDdhIiwiYWNjb3VudCI6ImFkbWluIiwidGVuYW50X2NvZGUiOiIwMDAwMDAifQ.qajWMJsROs8tePnt7nAgJQWYt3p33G-ENchzNBrT8O8&grant_type=refresh_token&scope=all', '10', 'admin', '2019-05-27 21:21:41');
INSERT INTO `blade_log_api` VALUES (1133005264995639298, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'PostmanRuntime/7.11.0', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'refresh_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJhZG1pbiIsImF2YXRhciI6Imh0dHBzOi8vZ3cuYWxpcGF5b2JqZWN0cy5jb20vem9zL3Jtc3BvcnRhbC9CaWF6ZmFueG1hbU5Sb3h4VnhrYS5wbmciLCJhdXRob3JpdGllcyI6WyJhZG1pbmlzdHJhdG9yIl0sImNsaWVudF9pZCI6InNhYmVyIiwicm9sZV9uYW1lIjoiYWRtaW5pc3RyYXRvciIsImxpY2Vuc2UiOiJwb3dlcmVkIGJ5IGJsYWRleCIsInVzZXJfaWQiOjExMjM1OTg4MjE3Mzg2NzUyMDEsInJvbGVfaWQiOiIxMTIzNTk4ODE2NzM4Njc1MjAxIiwic2NvcGUiOlsiYWxsIl0sIm5pY2tfbmFtZSI6IueuoeeQhuWRmCIsImF0aSI6Ijg3NDEwZjU2LWYxNWQtNDkwOC1iMmQyLWI4NWFmZTA0YjkzMCIsImV4cCI6MTU1OTU2NTA5MiwianRpIjoiN2Q1ZDUzYWItNTA4ZC00OTkwLWE1YTUtNmNkMGJhMjkwNDdhIiwiYWNjb3VudCI6ImFkbWluIiwidGVuYW50X2NvZGUiOiIwMDAwMDAifQ.qajWMJsROs8tePnt7nAgJQWYt3p33G-ENchzNBrT8O8&grant_type=refresh_token&scope=all', '27132', '', '2019-05-27 21:41:20');
INSERT INTO `blade_log_api` VALUES (1133008462569488386, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantCode=000000&username=admin&password=admin&grant_type=password&scope=all&type=account', '517', '', '2019-05-27 21:54:02');
INSERT INTO `blade_log_api` VALUES (1133008992356220930, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'PostmanRuntime/7.11.0', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'refresh_token=eyJ0eXAiOiJKc29uV2ViVG9rZW4iLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ1c2VyX2lkIjoiMTEyMzU5ODgyMTczODY3NTIwMSIsInRva2VuX3R5cGUiOiJyZWZyZXNoX3Rva2VuIiwiY2xpZW50X2lkIjoic2FiZXIiLCJleHAiOjE1NTk1NzAwNDIsIm5iZiI6MTU1ODk2NTI0Mn0.cJVe6V7vvFfd0mh5RALz5wJkzVwTFaTmuuz5_EgqnYY&grant_type=refresh_token&scope=all', '46', '', '2019-05-27 21:56:09');
INSERT INTO `blade_log_api` VALUES (1133009172765818881, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'PostmanRuntime/7.11.0', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'refresh_token=eyJ0eXAiOiJKc29uV2ViVG9rZW4iLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ1c2VyX2lkIjoiMTEyMzU5ODgyMTczODY3NTIwMSIsInRva2VuX3R5cGUiOiJyZWZyZXNoX3Rva2VuIiwiY2xpZW50X2lkIjoic2FiZXIiLCJleHAiOjE1NTk1NzAwNDIsIm5iZiI6MTU1ODk2NTI0Mn0.cJVe6V7vvFfd0mh5RALz5wJkzVwTFaTmuuz5_EgqnYY&grant_type=refresh_token&scope=all', '17', '', '2019-05-27 21:56:52');
INSERT INTO `blade_log_api` VALUES (1133011599900491778, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'refresh_token=eyJ0eXAiOiJKc29uV2ViVG9rZW4iLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ1c2VyX2lkIjoiMTEyMzU5ODgyMTczODY3NTIwMSIsInRva2VuX3R5cGUiOiJyZWZyZXNoX3Rva2VuIiwiY2xpZW50X2lkIjoic2FiZXIiLCJleHAiOjE1NTk1NzAwNDIsIm5iZiI6MTU1ODk2NTI0Mn0.cJVe6V7vvFfd0mh5RALz5wJkzVwTFaTmuuz5_EgqnYY&grant_type=refresh_token&scope=all', '45', 'admin', '2019-05-27 22:06:30');
INSERT INTO `blade_log_api` VALUES (1133011641692536834, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'refresh_token=eyJ0eXAiOiJKc29uV2ViVG9rZW4iLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ1c2VyX2lkIjoiMTEyMzU5ODgyMTczODY3NTIwMSIsInRva2VuX3R5cGUiOiJyZWZyZXNoX3Rva2VuIiwiY2xpZW50X2lkIjoic2FiZXIiLCJleHAiOjE1NTk1NzA3OTAsIm5iZiI6MTU1ODk2NTk5MH0.NC3Bj0tJ4conrz_JRDQks_QQAX7Y2joi6Hh5gWfb0co&grant_type=refresh_token&scope=all', '11', 'admin', '2019-05-27 22:06:40');
INSERT INTO `blade_log_api` VALUES (1133011683643965441, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'refresh_token=eyJ0eXAiOiJKc29uV2ViVG9rZW4iLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ1c2VyX2lkIjoiMTEyMzU5ODgyMTczODY3NTIwMSIsInRva2VuX3R5cGUiOiJyZWZyZXNoX3Rva2VuIiwiY2xpZW50X2lkIjoic2FiZXIiLCJleHAiOjE1NTk1NzA4MDAsIm5iZiI6MTU1ODk2NjAwMH0.2eTyuSgJ63ilTcPKODUR9GOaD8cuJ3gnO8bxj7jO65w&grant_type=refresh_token&scope=all', '12', 'admin', '2019-05-27 22:06:50');
INSERT INTO `blade_log_api` VALUES (1133011725561839618, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'refresh_token=eyJ0eXAiOiJKc29uV2ViVG9rZW4iLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ1c2VyX2lkIjoiMTEyMzU5ODgyMTczODY3NTIwMSIsInRva2VuX3R5cGUiOiJyZWZyZXNoX3Rva2VuIiwiY2xpZW50X2lkIjoic2FiZXIiLCJleHAiOjE1NTk1NzA4MTAsIm5iZiI6MTU1ODk2NjAxMH0.GIGwSeYPVT6rWQigiXCYw_GJuEaCLtMyB5Mgyf1Po7c&grant_type=refresh_token&scope=all', '12', 'admin', '2019-05-27 22:07:00');
INSERT INTO `blade_log_api` VALUES (1133011767500685314, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'refresh_token=eyJ0eXAiOiJKc29uV2ViVG9rZW4iLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ1c2VyX2lkIjoiMTEyMzU5ODgyMTczODY3NTIwMSIsInRva2VuX3R5cGUiOiJyZWZyZXNoX3Rva2VuIiwiY2xpZW50X2lkIjoic2FiZXIiLCJleHAiOjE1NTk1NzA4MjAsIm5iZiI6MTU1ODk2NjAyMH0.T374krTQL0CvQMvJ0Ff5ITGEzoBXE2YmY_jFQc-cM3k&grant_type=refresh_token&scope=all', '10', 'admin', '2019-05-27 22:07:10');
INSERT INTO `blade_log_api` VALUES (1133011809452113921, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'refresh_token=eyJ0eXAiOiJKc29uV2ViVG9rZW4iLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ1c2VyX2lkIjoiMTEyMzU5ODgyMTczODY3NTIwMSIsInRva2VuX3R5cGUiOiJyZWZyZXNoX3Rva2VuIiwiY2xpZW50X2lkIjoic2FiZXIiLCJleHAiOjE1NTk1NzA4MzAsIm5iZiI6MTU1ODk2NjAzMH0.2YDrUuV_kYtbo64tp7K1f8AWUS4Q7M_eJ8dHn9YdJBM&grant_type=refresh_token&scope=all', '11', 'admin', '2019-05-27 22:07:20');
INSERT INTO `blade_log_api` VALUES (1133011854775762946, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'refresh_token=eyJ0eXAiOiJKc29uV2ViVG9rZW4iLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ1c2VyX2lkIjoiMTEyMzU5ODgyMTczODY3NTIwMSIsInRva2VuX3R5cGUiOiJyZWZyZXNoX3Rva2VuIiwiY2xpZW50X2lkIjoic2FiZXIiLCJleHAiOjE1NTk1NzA4NDAsIm5iZiI6MTU1ODk2NjA0MH0.25XM-F-3j8x7iNIQRbq010PFYDnocKyYnTdc_im4WcI&grant_type=refresh_token&scope=all', '12', 'admin', '2019-05-27 22:07:31');
INSERT INTO `blade_log_api` VALUES (1133011893535326210, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'refresh_token=eyJ0eXAiOiJKc29uV2ViVG9rZW4iLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ1c2VyX2lkIjoiMTEyMzU5ODgyMTczODY3NTIwMSIsInRva2VuX3R5cGUiOiJyZWZyZXNoX3Rva2VuIiwiY2xpZW50X2lkIjoic2FiZXIiLCJleHAiOjE1NTk1NzA4NTEsIm5iZiI6MTU1ODk2NjA1MX0.alREdRzJ9gSp1NaFaJvRg86n5A09OrcV_rT41Y8mAfA&grant_type=refresh_token&scope=all', '22', 'admin', '2019-05-27 22:07:40');
INSERT INTO `blade_log_api` VALUES (1133024480889094145, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'refresh_token=eyJ0eXAiOiJKc29uV2ViVG9rZW4iLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJpc3N1c2VyIiwiYXVkIjoiYXVkaWVuY2UiLCJ1c2VyX2lkIjoiMTEyMzU5ODgyMTczODY3NTIwMSIsInRva2VuX3R5cGUiOiJyZWZyZXNoX3Rva2VuIiwiY2xpZW50X2lkIjoic2FiZXIiLCJleHAiOjE1NTk1NzA4NjAsIm5iZiI6MTU1ODk2NjA2MH0.6pgJyccPJCxQWhCdTwUpQvtNCIzzbe9bb3_mNVEwnoY&grant_type=refresh_token&scope=all', '35', 'admin', '2019-05-27 22:57:41');
INSERT INTO `blade_log_api` VALUES (1133563688078794753, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.135:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantCode=000000&username=admin&password=admin&grant_type=password&scope=all&type=account', '537', '', '2019-05-29 10:40:18');
INSERT INTO `blade_log_api` VALUES (1134633534702931970, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantId=000000&username=admin&password=admin&grant_type=password&scope=all&type=account', '552', '', '2019-06-01 09:31:30');
INSERT INTO `blade_log_api` VALUES (1134633788810645505, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantId=000000&username=hr&password=hr&grant_type=password&scope=all&type=account', '21', '', '2019-06-01 09:32:30');
INSERT INTO `blade_log_api` VALUES (1134634028762583042, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.122:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantId=000000&username=admin&password=admin&grant_type=password&scope=all&type=account', '9', '', '2019-06-01 09:33:28');
INSERT INTO `blade_log_api` VALUES (1153191798766596098, '000000', 'blade-api', 'duyudongdeMacBook-Pro.local', '192.168.0.102:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '192.168.0.102', 'org.springblade.modules.auth.AuthController', 'token', 'tenantId=000000&username=admin&password=admin&grant_type=password&scope=all&type=account', '9021', '', '2019-07-22 14:35:15');
INSERT INTO `blade_log_api` VALUES (1153196859458646017, '000000', 'blade-api', 'duyudongdeMacBook-Pro.local', '192.168.0.102:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantId=000000&username=admin&password=admin&grant_type=password&scope=all&type=account', '8144', '', '2019-07-22 14:55:21');
INSERT INTO `blade_log_api` VALUES (1153202681660108801, '000000', 'blade-api', 'duyudongdeMacBook-Pro.local', '192.168.0.102:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantId=000000&username=123456&password=123456&grant_type=password&scope=all&type=account', '46', '', '2019-07-22 15:18:39');
INSERT INTO `blade_log_api` VALUES (1153202854666760194, '000000', 'blade-api', 'duyudongdeMacBook-Pro.local', '192.168.0.102:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantId=000000&username=admin&password=admin&grant_type=password&scope=all&type=account', '38', '', '2019-07-22 15:19:21');
INSERT INTO `blade_log_api` VALUES (1153203008723546113, '000000', 'blade-api', 'duyudongdeMacBook-Pro.local', '192.168.0.102:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantId=000000&username=123456&password=123456&grant_type=password&scope=all&type=account', '21', '', '2019-07-22 15:19:57');
INSERT INTO `blade_log_api` VALUES (1153203196078911489, '000000', 'blade-api', 'duyudongdeMacBook-Pro.local', '192.168.0.102:80', 'dev', '1', '登录用户验证', 'POST', '/blade-auth/oauth/token', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'org.springblade.modules.auth.AuthController', 'token', 'tenantId=000000&username=admin&password=admin&grant_type=password&scope=all&type=account', '32', '', '2019-07-22 15:20:42');
COMMIT;

-- ----------------------------
-- Table structure for blade_log_error
-- ----------------------------
DROP TABLE IF EXISTS `blade_log_error`;
CREATE TABLE `blade_log_error` (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `server_host` varchar(255) DEFAULT NULL COMMENT '服务器名',
  `server_ip` varchar(255) DEFAULT NULL COMMENT '服务器IP地址',
  `env` varchar(255) DEFAULT NULL COMMENT '系统环境',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `stack_trace` text COMMENT '堆栈',
  `exception_name` varchar(255) DEFAULT NULL COMMENT '异常名',
  `message` text COMMENT '异常信息',
  `line_number` int(11) DEFAULT NULL COMMENT '错误行数',
  `method_class` varchar(255) DEFAULT NULL COMMENT '方法类',
  `file_name` varchar(1000) DEFAULT NULL COMMENT '文件名',
  `method_name` varchar(255) DEFAULT NULL COMMENT '方法名',
  `params` text COMMENT '操作提交的数据',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blade_log_error
-- ----------------------------
BEGIN;
INSERT INTO `blade_log_error` VALUES (1132812039722799105, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.133:80', 'dev', 'GET', '/blade-resource/oss/list', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'current=1&size=10', 'admin', '2019-05-27 08:53:32');
INSERT INTO `blade_log_error` VALUES (1132820817784508418, '000000', 'blade-api', 'smallchill-3.local', '192.168.0.133:80', 'dev', 'GET', '/blade-resource/oss/list', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'current=1&size=10', 'admin', '2019-05-27 09:28:24');
COMMIT;

-- ----------------------------
-- Table structure for blade_log_usual
-- ----------------------------
DROP TABLE IF EXISTS `blade_log_usual`;
CREATE TABLE `blade_log_usual` (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `server_host` varchar(255) DEFAULT NULL COMMENT '服务器名',
  `server_ip` varchar(255) DEFAULT NULL COMMENT '服务器IP地址',
  `env` varchar(255) DEFAULT NULL COMMENT '系统环境',
  `log_level` varchar(10) DEFAULT NULL COMMENT '日志级别',
  `log_id` varchar(100) DEFAULT NULL COMMENT '日志业务id',
  `log_data` text COMMENT '日志数据',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `params` text COMMENT '操作提交的数据',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for blade_menu
-- ----------------------------
DROP TABLE IF EXISTS `blade_menu`;
CREATE TABLE `blade_menu` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父级菜单',
  `code` varchar(255) DEFAULT NULL COMMENT '菜单编号',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `alias` varchar(255) DEFAULT NULL COMMENT '菜单别名',
  `path` varchar(255) DEFAULT NULL COMMENT '请求地址',
  `source` varchar(255) DEFAULT NULL COMMENT '菜单资源',
  `sort` int(2) DEFAULT NULL COMMENT '排序',
  `category` int(2) DEFAULT NULL COMMENT '菜单类型',
  `action` int(2) DEFAULT '0' COMMENT '操作按钮类型',
  `is_open` int(2) DEFAULT '1' COMMENT '是否打开新页面',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1153197435508551683 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blade_menu
-- ----------------------------
BEGIN;
INSERT INTO `blade_menu` VALUES (1123598815738675201, 0, 'desk', '工作台', 'menu', '/desk', 'iconfont iconicon_airplay', 1, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675202, 1123598815738675201, 'notice', '通知公告', 'menu', '/desk/notice', 'iconfont iconicon_sms', 1, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675203, 0, 'system', '系统管理', 'menu', '/system', 'iconfont iconicon_setting', 99, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675204, 1123598815738675203, 'user', '用户管理', 'menu', '/system/user', 'iconfont iconicon_principal', 1, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675205, 1123598815738675203, 'dept', '部门管理', 'menu', '/system/dept', 'iconfont iconicon_group', 2, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675206, 1123598815738675203, 'dict', '字典管理', 'menu', '/system/dict', 'iconfont iconicon_addresslist', 3, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675207, 1123598815738675203, 'menu', '菜单管理', 'menu', '/system/menu', 'iconfont iconicon_subordinate', 4, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675208, 1123598815738675203, 'role', '角色管理', 'menu', '/system/role', 'iconfont iconicon_boss', 5, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675209, 1123598815738675203, 'param', '参数管理', 'menu', '/system/param', 'iconfont iconicon_community_line', 6, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675210, 0, 'monitor', '系统监控', 'menu', '/monitor', 'iconfont icon-yanzhengma', 3, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675211, 1123598815738675210, 'doc', '接口文档', 'menu', 'http://localhost/doc.html', 'iconfont iconicon_study', 1, 1, 0, 2, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675212, 1123598815738675210, 'admin', '服务治理', 'menu', 'http://localhost:7002', 'iconfont icon-canshu', 2, 1, 0, 2, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675213, 1123598815738675210, 'log', '日志管理', 'menu', '/monitor/log', 'iconfont iconicon_doc', 3, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675214, 1123598815738675213, 'log_usual', '通用日志', 'menu', '/monitor/log/usual', NULL, 1, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675215, 1123598815738675213, 'log_api', '接口日志', 'menu', '/monitor/log/api', NULL, 2, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675216, 1123598815738675213, 'log_error', '错误日志', 'menu', '/monitor/log/error', NULL, 3, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675217, 0, 'tool', '研发工具', 'menu', '/tool', 'iconfont icon-wxbgongju', 4, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675218, 1123598815738675217, 'code', '代码生成', 'menu', '/tool/code', 'iconfont iconicon_savememo', 1, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675219, 1123598815738675202, 'notice_add', '新增', 'add', '/desk/notice/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675220, 1123598815738675202, 'notice_edit', '修改', 'edit', '/desk/notice/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675221, 1123598815738675202, 'notice_delete', '删除', 'delete', '/api/blade-desk/notice/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675222, 1123598815738675202, 'notice_view', '查看', 'view', '/desk/notice/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675223, 1123598815738675204, 'user_add', '新增', 'add', '/system/user/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675224, 1123598815738675204, 'user_edit', '修改', 'edit', '/system/user/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675225, 1123598815738675204, 'user_delete', '删除', 'delete', '/api/blade-user/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675226, 1123598815738675204, 'user_role', '角色配置', 'role', NULL, 'user-add', 4, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675227, 1123598815738675204, 'user_reset', '密码重置', 'reset-password', '/api/blade-user/reset-password', 'retweet', 5, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675228, 1123598815738675204, 'user_view', '查看', 'view', '/system/user/view', 'file-text', 6, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675229, 1123598815738675205, 'dept_add', '新增', 'add', '/system/dept/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675230, 1123598815738675205, 'dept_edit', '修改', 'edit', '/system/dept/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675231, 1123598815738675205, 'dept_delete', '删除', 'delete', '/api/blade-system/dept/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675232, 1123598815738675205, 'dept_view', '查看', 'view', '/system/dept/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675233, 1123598815738675206, 'dict_add', '新增', 'add', '/system/dict/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675234, 1123598815738675206, 'dict_edit', '修改', 'edit', '/system/dict/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675235, 1123598815738675206, 'dict_delete', '删除', 'delete', '/api/blade-system/dict/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675236, 1123598815738675206, 'dict_view', '查看', 'view', '/system/dict/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675237, 1123598815738675207, 'menu_add', '新增', 'add', '/system/menu/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675238, 1123598815738675207, 'menu_edit', '修改', 'edit', '/system/menu/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675239, 1123598815738675207, 'menu_delete', '删除', 'delete', '/api/blade-system/menu/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675240, 1123598815738675207, 'menu_view', '查看', 'view', '/system/menu/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675241, 1123598815738675208, 'role_add', '新增', 'add', '/system/role/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675242, 1123598815738675208, 'role_edit', '修改', 'edit', '/system/role/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675243, 1123598815738675208, 'role_delete', '删除', 'delete', '/api/blade-system/role/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675244, 1123598815738675208, 'role_view', '查看', 'view', '/system/role/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675245, 1123598815738675209, 'param_add', '新增', 'add', '/system/param/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675246, 1123598815738675209, 'param_edit', '修改', 'edit', '/system/param/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675247, 1123598815738675209, 'param_delete', '删除', 'delete', '/api/blade-system/param/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675248, 1123598815738675209, 'param_view', '查看', 'view', '/system/param/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675249, 1123598815738675214, 'log_usual_view', '查看', 'view', '/monitor/log/usual/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675250, 1123598815738675215, 'log_api_view', '查看', 'view', '/monitor/log/api/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675251, 1123598815738675216, 'log_error_view', '查看', 'view', '/monitor/log/error/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675252, 1123598815738675218, 'code_add', '新增', 'add', '/tool/code/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675253, 1123598815738675218, 'code_edit', '修改', 'edit', '/tool/code/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675254, 1123598815738675218, 'code_delete', '删除', 'delete', '/api/blade-system/code/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675255, 1123598815738675218, 'code_view', '查看', 'view', '/tool/code/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675256, 1123598815738675203, 'tenant', '租户管理', 'menu', '/system/tenant', 'iconfont icon-quanxian', 7, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675257, 1123598815738675256, 'tenant_add', '新增', 'add', '/system/tenant/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675258, 1123598815738675256, 'tenant_edit', '修改', 'edit', '/system/tenant/edit', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675259, 1123598815738675256, 'tenant_delete', '删除', 'delete', '/api/blade-system/tenant/remove', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675260, 1123598815738675256, 'tenant_view', '查看', 'view', '/system/tenant/view', 'file-text', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675261, 1123598815738675203, 'client', '应用管理', 'menu', '/system/client', 'iconfont iconicon_mobilephone', 8, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675262, 1123598815738675261, 'client_add', '新增', 'add', '/system/client/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675263, 1123598815738675261, 'client_edit', '修改', 'edit', '/system/client/edit', 'form', 2, 2, 2, 2, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675264, 1123598815738675261, 'client_delete', '删除', 'delete', '/api/blade-system/client/remove', 'delete', 3, 2, 3, 3, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675265, 1123598815738675261, 'client_view', '查看', 'view', '/system/client/view', 'file-text', 4, 2, 2, 2, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675266, 0, 'flow', '流程管理', 'menu', '/flow', 'iconfont iconicon_send', 5, 1, 0, 1, '', 0);
INSERT INTO `blade_menu` VALUES (1123598815738675267, 1123598815738675266, 'flow_model', '模型管理', 'menu', '/flow/model', 'iconfont iconicon_discovery', 1, 1, 0, 1, '', 0);
INSERT INTO `blade_menu` VALUES (1123598815738675268, 1123598815738675267, 'flow_model_create', '创建', 'create', '', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675269, 1123598815738675267, 'flow_model_update', '编辑', 'update', '', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675270, 1123598815738675267, 'flow_model_deploy', '部署', 'deploy', '', 'cloud-upload', 3, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675271, 1123598815738675267, 'flow_model_download', '下载', 'download', '', 'download', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675272, 1123598815738675267, 'flow_model_delete', '删除', 'delete', '/api/blade-flow/model/remove', 'delete', 5, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675273, 1123598815738675266, 'flow_deploy', '流程部署', 'menu', '/flow/deploy', 'iconfont iconicon_cspace', 2, 1, 0, 1, '', 0);
INSERT INTO `blade_menu` VALUES (1123598815738675274, 1123598815738675266, 'flow_manager', '流程管理', 'menu', '/flow/manager', 'iconfont iconicon_cloud_history', 3, 1, 0, 1, '', 0);
INSERT INTO `blade_menu` VALUES (1123598815738675275, 1123598815738675274, 'flow_manager_state', '变更状态', 'state', '', 'plus', 1, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675276, 1123598815738675274, 'flow_manager_image', '流程图', 'image', '', 'image', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675277, 1123598815738675274, 'flow_manager_remove', '删除', 'remove', '', 'delete', 3, 2, 3, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675278, 1123598815738675266, 'flow_follow', '流程跟踪', 'menu', '/flow/follow', 'iconfont iconicon_GPS', 4, 1, 0, 1, '', 0);
INSERT INTO `blade_menu` VALUES (1123598815738675279, 1123598815738675278, 'flow_follow_delete', '删除', 'remove', '', 'remove', 1, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675280, 0, 'work', '我的事务', 'work', '/work', 'iconfont iconicon_notice', 2, 1, 0, 1, '', 0);
INSERT INTO `blade_menu` VALUES (1123598815738675281, 1123598815738675280, 'work_start', '发起事务', 'menu', '/work/start', 'iconfont iconicon_compile', 1, 1, 0, 1, '', 0);
INSERT INTO `blade_menu` VALUES (1123598815738675282, 1123598815738675281, 'work_start_flow', '发起', 'flow', '', 'flow', 1, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675283, 1123598815738675281, 'work_start_image', '流程图', 'image', '', 'image', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675284, 1123598815738675280, 'work_claim', '待签事务', 'menu', '/work/claim', 'iconfont iconicon_ding', 2, 1, 0, 1, '', 0);
INSERT INTO `blade_menu` VALUES (1123598815738675285, 1123598815738675284, 'work_claim_sign', '签收', 'sign', '', 'sign', 1, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675286, 1123598815738675284, 'work_claim_detail', '详情', 'detail', '', 'detail', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675287, 1123598815738675284, 'work_claim_follow', '跟踪', 'follow', '', 'follow', 3, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675288, 1123598815738675280, 'work_todo', '待办事务', 'menu', '/work/todo', 'iconfont iconicon_savememo', 2, 1, 0, 1, '', 0);
INSERT INTO `blade_menu` VALUES (1123598815738675289, 1123598815738675288, 'work_todo_handle', '办理', 'handle', '', 'handle', 1, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675290, 1123598815738675288, 'work_todo_detail', '详情', 'detail', '', 'detail', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675291, 1123598815738675288, 'work_todo_follow', '跟踪', 'follow', '', 'follow', 3, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675292, 1123598815738675280, 'work_send', '已发事务', 'menu', '/work/send', 'iconfont iconicon_doc', 3, 1, 0, 1, '', 0);
INSERT INTO `blade_menu` VALUES (1123598815738675293, 1123598815738675292, 'work_send_detail', '详情', 'detail', '', 'detail', 1, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675294, 1123598815738675292, 'work_send_follow', '跟踪', 'follow', '', 'follow', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675295, 1123598815738675280, 'work_done', '办结事务', 'menu', '/work/done', 'iconfont iconicon_dispose', 4, 1, 0, 1, '', 0);
INSERT INTO `blade_menu` VALUES (1123598815738675296, 1123598815738675295, 'work_done_detail', '详情', 'detail', '', 'detail', 1, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675297, 1123598815738675295, 'work_done_follow', '跟踪', 'follow', '', 'follow', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675298, 0, 'resource', '资源管理', 'menu', '/resource', 'iconfont iconicon_coinpurse_line', 6, 1, 0, 1, '', 0);
INSERT INTO `blade_menu` VALUES (1123598815738675299, 1123598815738675298, 'oss', '对象存储', 'menu', '/resource/oss', 'iconfont iconicon_subordinate', 1, 1, 0, 1, '', 0);
INSERT INTO `blade_menu` VALUES (1123598815738675301, 1123598815738675299, 'oss_add', '新增', 'add', '/resource/oss/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675302, 1123598815738675299, 'oss_edit', '修改', 'edit', '/resource/oss/edit', 'form', 2, 2, 2, 2, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675303, 1123598815738675299, 'oss_delete', '删除', 'delete', '/api/blade-resource/oss/remove', 'delete', 3, 2, 3, 3, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675304, 1123598815738675299, 'oss_view', '查看', 'view', '/resource/oss/view', 'file-text', 4, 2, 2, 2, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675305, 1123598815738675299, 'oss_enable', '启用', 'enable', '/api/blade-resource/oss/enable', 'key', 5, 2, 2, 2, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675306, 1153197435508551682, 'server', '信息管理', 'menu', '/oa_server/server', 'iconfont iconicon_work', 1, 1, 0, 1, '', 0);
INSERT INTO `blade_menu` VALUES (1123598815738675307, 1123598815738675306, 'server_add', '新增', 'add', '/oa_server/server/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675308, 1123598815738675306, 'server_edit', '修改', 'edit', '/oa_server/server/edit', 'form', 2, 2, 2, 2, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675309, 1123598815738675306, 'server_delete', '删除', 'delete', '/api/oa_server/server/remove', 'delete', 3, 2, 3, 3, NULL, 0);
INSERT INTO `blade_menu` VALUES (1123598815738675310, 1123598815738675306, 'server_view', '查看', 'view', '/oa_server/server/view', 'file-text', 4, 2, 2, 2, NULL, 0);
INSERT INTO `blade_menu` VALUES (1153197435508551682, 0, 'server', 'oa', 'menu', '/oa_server', 'iconfont iconicon_secret', 100, 1, 0, 1, '', 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_notice
-- ----------------------------
DROP TABLE IF EXISTS `blade_notice`;
CREATE TABLE `blade_notice` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `category` int(11) DEFAULT NULL COMMENT '类型',
  `release_time` datetime DEFAULT NULL COMMENT '发布时间',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blade_notice
-- ----------------------------
BEGIN;
INSERT INTO `blade_notice` VALUES (1123598818738675223, '000000', '测试公告', 3, '2018-12-31 20:03:31', '222', 1123598821738675201, '2018-12-05 20:03:31', 1153202583798607873, '2019-07-22 15:20:07', 1, 1);
INSERT INTO `blade_notice` VALUES (1123598818738675224, '000000', '测试公告2', 1, '2018-12-05 20:03:31', '333', 1123598821738675201, '2018-12-28 10:32:26', 1153202583798607873, '2019-07-22 15:20:11', 1, 1);
INSERT INTO `blade_notice` VALUES (1123598818738675225, '000000', '测试公告3', 6, '2018-12-29 00:00:00', '11111', 1123598821738675201, '2018-12-28 11:03:44', 1123598821738675201, '2018-12-28 11:10:28', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_oss
-- ----------------------------
DROP TABLE IF EXISTS `blade_oss`;
CREATE TABLE `blade_oss` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `category` int(2) DEFAULT NULL COMMENT '分类',
  `endpoint` varchar(255) DEFAULT NULL COMMENT '资源地址',
  `access_key` varchar(255) DEFAULT NULL COMMENT 'accessKey',
  `secret_key` varchar(255) DEFAULT NULL COMMENT 'secretKey',
  `bucket_name` varchar(255) DEFAULT NULL COMMENT '空间名',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blade_oss
-- ----------------------------
BEGIN;
INSERT INTO `blade_oss` VALUES (1132821403644923906, '000000', 1, 'http://127.0.0.1:9000', 'D99KGE6ZTQXSATTJWU24', 'QyVqGnhIQQE734UYSUFlGOZViE6+ZlDEfUG3NjhJ', 'bladex', '', 1123598821738675201, '2019-05-27 09:30:44', 1123598821738675201, '2019-05-27 17:25:21', 1, 0);
INSERT INTO `blade_oss` VALUES (1132821707580968961, '000000', 2, 'ps458elcs.bkt.clouddn.com', 'N_Loh1ngBqcJovwiAJqR91Ifj2vgOWHOf8AwBA_h', 'AuzuA1KHAbkIndCU0dB3Zfii2O3crHNODDmpxHRS', 'bladex', '', 1123598821738675201, '2019-05-27 09:31:57', 1123598821738675201, '2019-05-27 20:35:11', 2, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_param
-- ----------------------------
DROP TABLE IF EXISTS `blade_param`;
CREATE TABLE `blade_param` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `param_name` varchar(255) DEFAULT NULL COMMENT '参数名',
  `param_key` varchar(255) DEFAULT NULL COMMENT '参数键',
  `param_value` varchar(255) DEFAULT NULL COMMENT '参数值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blade_param
-- ----------------------------
BEGIN;
INSERT INTO `blade_param` VALUES (1123598819738675201, '是否开启注册功能', 'account.registerUser', 'true', '开启注册', 1123598821738675201, '2018-12-28 12:19:01', 1123598821738675201, '2018-12-28 12:19:01', 1, 0);
INSERT INTO `blade_param` VALUES (1123598819738675202, '账号初始密码', 'account.initPassword', '123456', '初始密码', 1123598821738675201, '2018-12-28 12:19:01', 1123598821738675201, '2018-12-28 12:19:01', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_process_leave
-- ----------------------------
DROP TABLE IF EXISTS `blade_process_leave`;
CREATE TABLE `blade_process_leave` (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `process_definition_id` varchar(64) DEFAULT NULL COMMENT '流程定义主键',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT '流程实例主键',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `reason` varchar(255) DEFAULT NULL COMMENT '请假理由',
  `task_user` varchar(255) DEFAULT NULL COMMENT '第一级审批人',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for blade_role
-- ----------------------------
DROP TABLE IF EXISTS `blade_role`;
CREATE TABLE `blade_role` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父主键',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `role_alias` varchar(255) DEFAULT NULL COMMENT '角色别名',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blade_role
-- ----------------------------
BEGIN;
INSERT INTO `blade_role` VALUES (1123598816738675201, '000000', 0, '超级管理员', 1, 'administrator', 0);
INSERT INTO `blade_role` VALUES (1123598816738675202, '000000', 0, '用户', 2, 'user', 0);
INSERT INTO `blade_role` VALUES (1123598816738675203, '000000', 1123598816738675202, '人事', 1, 'hr', 0);
INSERT INTO `blade_role` VALUES (1123598816738675204, '000000', 1123598816738675202, '经理', 2, 'manager', 0);
INSERT INTO `blade_role` VALUES (1123598816738675205, '000000', 1123598816738675202, '老板', 3, 'boss', 0);
INSERT INTO `blade_role` VALUES (1153198380145504257, '000000', 1123598816738675202, '一般用户', 4, 'users', 1);
INSERT INTO `blade_role` VALUES (1153199718598242305, '497087', 0, '管理员', 2, 'admin', 1);
INSERT INTO `blade_role` VALUES (1153200500655583233, '000000', 1153200500655583233, '普通用户', 3, 'user', 0);
INSERT INTO `blade_role` VALUES (1153201953042395138, '000000', 1123598816738675202, '普用', 4, '普用', 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `blade_role_menu`;
CREATE TABLE `blade_role_menu` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `menu_id` bigint(64) DEFAULT NULL COMMENT '菜单id',
  `role_id` bigint(64) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blade_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `blade_role_menu` VALUES (1125407393693099009, 1123598815738675201, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393701487617, 1123598815738675202, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393709876225, 1123598815738675219, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393714070530, 1123598815738675220, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393722459138, 1123598815738675221, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393726653442, 1123598815738675222, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393730847746, 1123598815738675280, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393739236354, 1123598815738675281, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393743430658, 1123598815738675282, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393747624962, 1123598815738675283, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393756013569, 1123598815738675284, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393760207873, 1123598815738675285, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393768596481, 1123598815738675286, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393772790786, 1123598815738675287, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393781179393, 1123598815738675288, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393785373698, 1123598815738675289, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393789568002, 1123598815738675290, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393797956610, 1123598815738675291, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393802150914, 1123598815738675292, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393806345218, 1123598815738675293, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393810539521, 1123598815738675294, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393818928129, 1123598815738675295, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393823122433, 1123598815738675296, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407393831511041, 1123598815738675297, 1123598816738675202);
INSERT INTO `blade_role_menu` VALUES (1125407468674671618, 1123598815738675201, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468683060225, 1123598815738675202, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468691448833, 1123598815738675219, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468699837442, 1123598815738675220, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468704031746, 1123598815738675221, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468712420353, 1123598815738675222, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468716614657, 1123598815738675280, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468720808962, 1123598815738675281, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468729197569, 1123598815738675282, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468733391873, 1123598815738675283, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468741780481, 1123598815738675284, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468745974785, 1123598815738675285, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468754363394, 1123598815738675286, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468758557698, 1123598815738675287, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468762752001, 1123598815738675288, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468771140609, 1123598815738675289, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468775334914, 1123598815738675290, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468783723522, 1123598815738675291, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468787917825, 1123598815738675292, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468792112130, 1123598815738675293, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468800500737, 1123598815738675294, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468804695042, 1123598815738675295, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468813083649, 1123598815738675296, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407468817277953, 1123598815738675297, 1123598816738675203);
INSERT INTO `blade_role_menu` VALUES (1125407501218276353, 1123598815738675201, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501226664961, 1123598815738675202, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501235053570, 1123598815738675219, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501268608002, 1123598815738675220, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501272802306, 1123598815738675221, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501281190913, 1123598815738675222, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501285385218, 1123598815738675280, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501289579522, 1123598815738675281, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501297968130, 1123598815738675282, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501302162433, 1123598815738675283, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501310551041, 1123598815738675284, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501314745346, 1123598815738675285, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501318939649, 1123598815738675286, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501327328257, 1123598815738675287, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501331522562, 1123598815738675288, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501339911169, 1123598815738675289, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501344105474, 1123598815738675290, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501348299778, 1123598815738675291, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501352494081, 1123598815738675292, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501360882689, 1123598815738675293, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501365076994, 1123598815738675294, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501369271297, 1123598815738675295, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501377659905, 1123598815738675296, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407501381854210, 1123598815738675297, 1123598816738675204);
INSERT INTO `blade_role_menu` VALUES (1125407624845386753, 1123598815738675201, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624862163970, 1123598815738675202, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624862163971, 1123598815738675219, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624870552577, 1123598815738675220, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624878941186, 1123598815738675221, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624887329794, 1123598815738675222, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624891524098, 1123598815738675280, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624899912706, 1123598815738675281, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624904107009, 1123598815738675282, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624908301314, 1123598815738675283, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624912495618, 1123598815738675284, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624920884225, 1123598815738675285, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624925078530, 1123598815738675286, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624933467138, 1123598815738675287, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624937661442, 1123598815738675288, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624941855745, 1123598815738675289, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624950244353, 1123598815738675290, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624958632962, 1123598815738675291, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624962827266, 1123598815738675292, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624967021570, 1123598815738675293, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624975410178, 1123598815738675294, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624979604482, 1123598815738675295, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624983798786, 1123598815738675296, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1125407624992187393, 1123598815738675297, 1123598816738675205);
INSERT INTO `blade_role_menu` VALUES (1153197824043708417, 1153197435508551682, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824056291329, 1123598815738675306, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824068874242, 1123598815738675307, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824081457154, 1123598815738675308, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824115011586, 1123598815738675309, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824131788802, 1123598815738675310, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824144371713, 1123598815738675201, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824161148929, 1123598815738675202, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824173731841, 1123598815738675219, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824182120449, 1123598815738675220, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824194703361, 1123598815738675221, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824207286273, 1123598815738675222, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824219869186, 1123598815738675280, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824232452098, 1123598815738675281, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824245035010, 1123598815738675282, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824257617921, 1123598815738675283, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824270200834, 1123598815738675284, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824282783745, 1123598815738675285, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824299560961, 1123598815738675286, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824312143874, 1123598815738675287, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824324726786, 1123598815738675288, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824337309697, 1123598815738675289, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824349892609, 1123598815738675290, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824366669826, 1123598815738675291, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824379252738, 1123598815738675292, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824387641345, 1123598815738675293, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824400224258, 1123598815738675294, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824408612865, 1123598815738675295, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824421195777, 1123598815738675296, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824437972993, 1123598815738675297, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824446361602, 1123598815738675210, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824458944514, 1123598815738675211, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824471527426, 1123598815738675212, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824479916033, 1123598815738675213, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824488304641, 1123598815738675214, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824500887553, 1123598815738675249, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824513470466, 1123598815738675215, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824526053377, 1123598815738675250, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824534441986, 1123598815738675216, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824547024898, 1123598815738675251, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824559607809, 1123598815738675217, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824580579330, 1123598815738675218, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824588967938, 1123598815738675252, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824597356545, 1123598815738675253, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824609939457, 1123598815738675254, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824622522370, 1123598815738675255, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824635105281, 1123598815738675266, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824651882498, 1123598815738675267, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824660271106, 1123598815738675268, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824672854017, 1123598815738675269, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824681242626, 1123598815738675270, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824693825538, 1123598815738675271, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824706408450, 1123598815738675272, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824723185665, 1123598815738675273, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824735768578, 1123598815738675274, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824748351489, 1123598815738675275, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824760934402, 1123598815738675276, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824769323010, 1123598815738675277, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824786100226, 1123598815738675278, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824802877441, 1123598815738675279, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824811266050, 1123598815738675298, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824819654658, 1123598815738675299, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824832237570, 1123598815738675301, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824840626178, 1123598815738675302, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824874180609, 1123598815738675303, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824907735041, 1123598815738675304, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824920317953, 1123598815738675305, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824937095170, 1123598815738675203, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824949678082, 1123598815738675204, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824962260994, 1123598815738675223, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824970649601, 1123598815738675224, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824979038209, 1123598815738675225, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197824995815425, 1123598815738675226, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825004204033, 1123598815738675227, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825016786946, 1123598815738675228, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825029369857, 1123598815738675205, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825041952770, 1123598815738675229, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825050341378, 1123598815738675230, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825062924289, 1123598815738675231, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825075507201, 1123598815738675232, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825088090114, 1123598815738675206, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825096478721, 1123598815738675233, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825109061633, 1123598815738675234, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825113255937, 1123598815738675235, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825130033153, 1123598815738675236, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825142616065, 1123598815738675207, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825151004674, 1123598815738675237, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825163587585, 1123598815738675238, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825176170497, 1123598815738675239, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825188753409, 1123598815738675240, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825201336321, 1123598815738675208, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825213919233, 1123598815738675241, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825222307842, 1123598815738675242, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825239085058, 1123598815738675243, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825251667970, 1123598815738675244, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825264250881, 1123598815738675209, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825276833793, 1123598815738675245, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825289416705, 1123598815738675246, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825301999617, 1123598815738675247, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825314582530, 1123598815738675248, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825322971137, 1123598815738675256, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825335554050, 1123598815738675257, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825348136962, 1123598815738675258, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825360719874, 1123598815738675259, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825377497090, 1123598815738675260, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825390080001, 1123598815738675261, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825402662913, 1123598815738675262, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825415245826, 1123598815738675263, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825427828737, 1123598815738675264, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153197825440411649, 1123598815738675265, 1123598816738675201);
INSERT INTO `blade_role_menu` VALUES (1153199301818642434, 1123598815738675201, 1153198380145504257);
INSERT INTO `blade_role_menu` VALUES (1153199301831225345, 1123598815738675202, 1153198380145504257);
INSERT INTO `blade_role_menu` VALUES (1153199301839613954, 1123598815738675219, 1153198380145504257);
INSERT INTO `blade_role_menu` VALUES (1153199301843808258, 1123598815738675220, 1153198380145504257);
INSERT INTO `blade_role_menu` VALUES (1153199301894139905, 1123598815738675221, 1153198380145504257);
INSERT INTO `blade_role_menu` VALUES (1153199301910917121, 1123598815738675222, 1153198380145504257);
INSERT INTO `blade_role_menu` VALUES (1153199301915111425, 1153197435508551682, 1153198380145504257);
INSERT INTO `blade_role_menu` VALUES (1153199301940277249, 1123598815738675306, 1153198380145504257);
INSERT INTO `blade_role_menu` VALUES (1153199301944471554, 1123598815738675307, 1153198380145504257);
INSERT INTO `blade_role_menu` VALUES (1153199301952860162, 1123598815738675308, 1153198380145504257);
INSERT INTO `blade_role_menu` VALUES (1153199301957054465, 1123598815738675309, 1153198380145504257);
INSERT INTO `blade_role_menu` VALUES (1153199301965443073, 1123598815738675310, 1153198380145504257);
INSERT INTO `blade_role_menu` VALUES (1153201210000470017, 1123598815738675201, 1153200500655583233);
INSERT INTO `blade_role_menu` VALUES (1153201210013052930, 1123598815738675202, 1153200500655583233);
INSERT INTO `blade_role_menu` VALUES (1153201210017247234, 1123598815738675219, 1153200500655583233);
INSERT INTO `blade_role_menu` VALUES (1153201210021441537, 1123598815738675220, 1153200500655583233);
INSERT INTO `blade_role_menu` VALUES (1153201210029830145, 1123598815738675221, 1153200500655583233);
INSERT INTO `blade_role_menu` VALUES (1153201210038218753, 1123598815738675222, 1153200500655583233);
INSERT INTO `blade_role_menu` VALUES (1153201210054995970, 1153197435508551682, 1153200500655583233);
INSERT INTO `blade_role_menu` VALUES (1153201210063384577, 1123598815738675306, 1153200500655583233);
INSERT INTO `blade_role_menu` VALUES (1153201210071773186, 1123598815738675307, 1153200500655583233);
INSERT INTO `blade_role_menu` VALUES (1153201210075967489, 1123598815738675308, 1153200500655583233);
INSERT INTO `blade_role_menu` VALUES (1153201210080161793, 1123598815738675309, 1153200500655583233);
INSERT INTO `blade_role_menu` VALUES (1153201210088550401, 1123598815738675310, 1153200500655583233);
INSERT INTO `blade_role_menu` VALUES (1153202954587664385, 1123598815738675201, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954621218817, 1123598815738675202, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954629607425, 1123598815738675219, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954633801729, 1123598815738675220, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954646384641, 1123598815738675221, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954658967554, 1123598815738675222, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954679939074, 1123598815738675280, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954705104897, 1123598815738675281, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954717687810, 1123598815738675282, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954730270722, 1123598815738675283, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954755436545, 1123598815738675284, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954763825153, 1123598815738675285, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954776408066, 1123598815738675286, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954788990978, 1123598815738675287, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954809962497, 1123598815738675288, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954826739714, 1123598815738675289, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954835128321, 1123598815738675290, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954847711234, 1123598815738675291, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954860294146, 1123598815738675292, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954868682754, 1123598815738675293, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954889654273, 1123598815738675294, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954898042882, 1123598815738675295, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954906431490, 1123598815738675296, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954914820098, 1123598815738675297, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954923208706, 1153197435508551682, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954935791618, 1123598815738675306, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954952568834, 1123598815738675307, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954960957442, 1123598815738675308, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954973540354, 1123598815738675309, 1153201953042395138);
INSERT INTO `blade_role_menu` VALUES (1153202954986123266, 1123598815738675310, 1153201953042395138);
COMMIT;

-- ----------------------------
-- Table structure for blade_tenant
-- ----------------------------
DROP TABLE IF EXISTS `blade_tenant`;
CREATE TABLE `blade_tenant` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `tenant_name` varchar(50) NOT NULL COMMENT '租户名称',
  `linkman` varchar(20) DEFAULT NULL COMMENT '联系人',
  `contact_number` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blade_tenant
-- ----------------------------
BEGIN;
INSERT INTO `blade_tenant` VALUES (1123598820738675201, '000000', '管理组', 'admin', '666666', '管理组', 1123598821738675201, '2019-01-01 00:00:39', 1123598821738675201, '2019-01-01 00:00:39', 1, 0);
INSERT INTO `blade_tenant` VALUES (1153199718694711297, '497087', '用户组', 'user', '6666666', '用户组', 1123598821738675201, '2019-07-22 15:06:53', 1123598821738675201, '2019-07-22 15:11:01', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for blade_user
-- ----------------------------
DROP TABLE IF EXISTS `blade_user`;
CREATE TABLE `blade_user` (
  `id` bigint(64) NOT NULL COMMENT '主键',
  `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
  `account` varchar(45) DEFAULT NULL COMMENT '账号',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `name` varchar(20) DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(10) DEFAULT NULL COMMENT '真名',
  `email` varchar(45) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(45) DEFAULT NULL COMMENT '手机',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` smallint(6) DEFAULT NULL COMMENT '性别',
  `role_id` varchar(1000) DEFAULT NULL COMMENT '角色id',
  `dept_id` varchar(1000) DEFAULT NULL COMMENT '部门id',
  `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blade_user
-- ----------------------------
BEGIN;
INSERT INTO `blade_user` VALUES (1123598821738675201, '000000', 'admin', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', '管理员', '管理员', 'admin@bladex.vip', '22233322', '2018-08-08 00:00:00', 1, '1123598816738675201', '1123598813738675201', 1123598821738675200, '2018-08-08 00:00:00', 1123598821738675201, '2019-05-07 14:03:24', 1, 0);
INSERT INTO `blade_user` VALUES (1123598821738675202, '000000', 'hr', '5e79b90f7bba52d54115f086e48f539016a27ec6', '人事', '人事', 'hr@bladex.vip', '123333333333', '2018-08-08 00:00:00', 1, '1123598816738675203', '1123598813738675201', 1123598821738675201, '2019-04-27 17:03:10', 1123598821738675201, '2019-04-27 17:03:10', 1, 0);
INSERT INTO `blade_user` VALUES (1123598821738675203, '000000', 'manager', 'dfbaa3b61caa3a319f463cc165085aa8c822d2ce', '经理', '经理', 'manager@bladex.vip', '123333333333', '2018-08-08 00:00:00', 1, '1123598816738675204', '1123598813738675201', 1123598821738675201, '2019-04-27 17:03:38', 1123598821738675201, '2019-04-27 17:03:38', 1, 0);
INSERT INTO `blade_user` VALUES (1123598821738675204, '000000', 'boss', 'abe57d23e18f7ad8ea99c86e430c90a05119a9d3', '老板', '老板', 'boss@bladex.vip', '123333333333', '2018-08-08 00:00:00', 1, '1123598816738675205', '1123598813738675201', 1123598821738675201, '2019-04-27 17:03:55', 1123598821738675201, '2019-04-27 17:03:55', 1, 0);
INSERT INTO `blade_user` VALUES (1153202583798607873, '000000', '123456', '10470c3b4b1fed12c3baac014be15fac67c6e815', '123456', '123456', '12345678987@163.com', '12345678987', '2019-07-10 12:00:00', 3, '1153201953042395138', '1123598813738675203', 1123598821738675201, '2019-07-22 15:18:16', 1123598821738675201, '2019-07-22 15:18:16', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for oa_server
-- ----------------------------
DROP TABLE IF EXISTS `oa_server`;
CREATE TABLE `oa_server` (
  `id` bigint(2) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `info` varchar(64) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '内容1',
  `img` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图片',
  `creat_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_deleted` int(2) DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of oa_server
-- ----------------------------
BEGIN;
INSERT INTO `oa_server` VALUES (1, 'test', 'test', '2019-07-22 14:46:13', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
