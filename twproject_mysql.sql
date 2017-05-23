/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : twproject

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2017-05-23 13:29:51
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `flow_action`
-- ----------------------------
DROP TABLE IF EXISTS `flow_action`;
CREATE TABLE `flow_action` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `class` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ISPROPAGATIONALLOWED_` bit(1) DEFAULT NULL,
  `ACTIONEXPRESSION_` varchar(255) DEFAULT NULL,
  `ISASYNC_` bit(1) DEFAULT NULL,
  `REFERENCEDACTION_` bigint(20) DEFAULT NULL,
  `ACTIONDELEGATION_` bigint(20) DEFAULT NULL,
  `EVENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `EXPRESSION_` varchar(4000) DEFAULT NULL,
  `TIMERNAME_` varchar(255) DEFAULT NULL,
  `DUEDATE_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `TIMERACTION_` bigint(20) DEFAULT NULL,
  `EVENTINDEX_` int(11) DEFAULT NULL,
  `EXCEPTIONHANDLER_` bigint(20) DEFAULT NULL,
  `EXCEPTIONHANDLERINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_ACTION_ACTNDL` (`ACTIONDELEGATION_`),
  KEY `IDX_ACTION_EVENT` (`EVENT_`),
  KEY `IDX_ACTION_PROCDF` (`PROCESSDEFINITION_`),
  KEY `FK_ACTION_REFACT` (`REFERENCEDACTION_`),
  KEY `FK_CRTETIMERACT_TA` (`TIMERACTION_`),
  KEY `FK_ACTION_EXPTHDL` (`EXCEPTIONHANDLER_`),
  CONSTRAINT `FK_ACTION_ACTNDEL` FOREIGN KEY (`ACTIONDELEGATION_`) REFERENCES `flow_delegation` (`ID_`),
  CONSTRAINT `FK_ACTION_EVENT` FOREIGN KEY (`EVENT_`) REFERENCES `flow_event` (`ID_`),
  CONSTRAINT `FK_ACTION_EXPTHDL` FOREIGN KEY (`EXCEPTIONHANDLER_`) REFERENCES `flow_exceptionhandler` (`ID_`),
  CONSTRAINT `FK_ACTION_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `flow_processdefinition` (`ID_`),
  CONSTRAINT `FK_ACTION_REFACT` FOREIGN KEY (`REFERENCEDACTION_`) REFERENCES `flow_action` (`ID_`),
  CONSTRAINT `FK_CRTETIMERACT_TA` FOREIGN KEY (`TIMERACTION_`) REFERENCES `flow_action` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_action
-- ----------------------------
INSERT INTO `flow_action` VALUES ('1', 'A', null, '', null, '\0', null, '1', '1', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('2', 'A', null, '', null, '\0', null, '2', '2', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('3', 'A', null, '', null, '\0', null, '3', '3', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('4', 'A', null, '', null, '\0', null, '4', '3', null, null, null, null, null, null, null, '1', null, null);
INSERT INTO `flow_action` VALUES ('5', 'A', null, '', null, '\0', null, '5', '4', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('6', 'A', null, '', null, '\0', null, '6', '5', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('7', 'A', null, '', null, '\0', null, '7', '5', null, null, null, null, null, null, null, '1', null, null);
INSERT INTO `flow_action` VALUES ('8', 'A', null, '', null, '\0', null, '8', '6', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('9', 'A', null, '', null, '\0', null, '9', '7', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('10', 'A', null, '', null, '\0', null, '10', '7', null, null, null, null, null, null, null, '1', null, null);
INSERT INTO `flow_action` VALUES ('11', 'A', null, '', null, '\0', null, '11', '8', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('12', 'A', null, '', null, '\0', null, '12', '9', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('13', 'A', null, '', null, '\0', null, '13', '9', null, null, null, null, null, null, null, '1', null, null);
INSERT INTO `flow_action` VALUES ('14', 'A', null, '', null, '\0', null, '14', '10', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('15', 'A', null, '', null, '\0', null, '15', '11', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('16', 'A', null, '', null, '\0', null, '16', '11', null, null, null, null, null, null, null, '1', null, null);
INSERT INTO `flow_action` VALUES ('17', 'A', null, '', null, '\0', null, '17', '12', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('18', 'A', null, '', null, '\0', null, '18', '13', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('19', 'A', null, '', null, '\0', null, '19', '13', null, null, null, null, null, null, null, '1', null, null);
INSERT INTO `flow_action` VALUES ('20', 'A', null, '', null, '\0', null, '20', '14', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('21', 'A', null, '', null, '\0', null, '21', '15', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('22', 'A', null, '', null, '\0', null, '22', '15', null, null, null, null, null, null, null, '1', null, null);
INSERT INTO `flow_action` VALUES ('23', 'A', null, '', null, '\0', null, '23', '16', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('24', 'A', null, '', null, '\0', null, '24', '16', null, null, null, null, null, null, null, '1', null, null);
INSERT INTO `flow_action` VALUES ('25', 'A', null, '', null, '\0', null, '25', '17', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('26', 'A', null, '', null, '\0', null, '26', '17', null, null, null, null, null, null, null, '1', null, null);
INSERT INTO `flow_action` VALUES ('27', 'A', null, '', null, '\0', null, '27', '18', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('28', 'A', null, '', null, '\0', null, '28', '19', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('29', 'A', null, '', null, '\0', null, '29', '19', null, null, null, null, null, null, null, '1', null, null);
INSERT INTO `flow_action` VALUES ('30', 'A', null, '', null, '\0', null, '30', '20', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('31', 'A', null, '', null, '\0', null, '31', '21', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('32', 'A', null, '', null, '\0', null, '32', '21', null, null, null, null, null, null, null, '1', null, null);
INSERT INTO `flow_action` VALUES ('33', 'A', null, '', null, '\0', null, '37', '22', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('34', 'A', null, '', null, '\0', null, '38', '23', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('35', 'A', null, '', null, '\0', null, '39', '24', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('36', 'A', null, '', null, '\0', null, '40', '25', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('37', 'A', null, '', null, '\0', null, '41', '26', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('38', 'A', null, '', null, '\0', null, '42', '26', null, null, null, null, null, null, null, '1', null, null);
INSERT INTO `flow_action` VALUES ('39', 'A', null, '', null, '\0', null, '43', '27', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('40', 'A', null, '', null, '\0', null, '44', '28', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('41', 'A', null, '', null, '\0', null, '45', '29', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('42', 'A', null, '', null, '\0', null, '46', '30', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('43', 'A', null, '', null, '\0', null, '47', '31', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('44', 'A', null, '', null, '\0', null, '48', '32', null, null, null, null, null, null, null, '0', null, null);
INSERT INTO `flow_action` VALUES ('45', 'A', null, '', null, '\0', null, '49', '32', null, null, null, null, null, null, null, '1', null, null);

-- ----------------------------
-- Table structure for `flow_bytearray`
-- ----------------------------
DROP TABLE IF EXISTS `flow_bytearray`;
CREATE TABLE `flow_bytearray` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `FILEDEFINITION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_BYTEARR_FILDEF` (`FILEDEFINITION_`),
  CONSTRAINT `FK_BYTEARR_FILDEF` FOREIGN KEY (`FILEDEFINITION_`) REFERENCES `flow_moduledefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_byteblock`
-- ----------------------------
DROP TABLE IF EXISTS `flow_byteblock`;
CREATE TABLE `flow_byteblock` (
  `PROCESSFILE_` bigint(20) NOT NULL,
  `BYTES_` blob,
  `INDEX_` int(11) NOT NULL,
  PRIMARY KEY (`PROCESSFILE_`,`INDEX_`),
  CONSTRAINT `FK_BYTEBLOCK_FILE` FOREIGN KEY (`PROCESSFILE_`) REFERENCES `flow_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_byteblock
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_comment`
-- ----------------------------
DROP TABLE IF EXISTS `flow_comment`;
CREATE TABLE `flow_comment` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  `MESSAGE_` varchar(4000) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `TOKENINDEX_` int(11) DEFAULT NULL,
  `TASKINSTANCEINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_COMMENT_TOKEN` (`TOKEN_`),
  KEY `IDX_COMMENT_TSK` (`TASKINSTANCE_`),
  CONSTRAINT `FK_COMMENT_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `flow_token` (`ID_`),
  CONSTRAINT `FK_COMMENT_TSK` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `flow_taskinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_decisionconditions`
-- ----------------------------
DROP TABLE IF EXISTS `flow_decisionconditions`;
CREATE TABLE `flow_decisionconditions` (
  `DECISION_` bigint(20) NOT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `EXPRESSION_` varchar(255) DEFAULT NULL,
  `INDEX_` int(11) NOT NULL,
  PRIMARY KEY (`DECISION_`,`INDEX_`),
  CONSTRAINT `FK_DECCOND_DEC` FOREIGN KEY (`DECISION_`) REFERENCES `flow_node` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_decisionconditions
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_delegation`
-- ----------------------------
DROP TABLE IF EXISTS `flow_delegation`;
CREATE TABLE `flow_delegation` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASSNAME_` varchar(4000) DEFAULT NULL,
  `CONFIGURATION_` varchar(4000) DEFAULT NULL,
  `CONFIGTYPE_` varchar(255) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_DELEG_PRCD` (`PROCESSDEFINITION_`),
  CONSTRAINT `FK_DELEGATION_PRCD` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `flow_processdefinition` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_delegation
-- ----------------------------
INSERT INTO `flow_delegation` VALUES ('1', 'com.twproject.task.process.TaskProcessFluxEndHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('2', 'com.twproject.task.process.TaskProcessTaskNodeEnterHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('3', 'com.twproject.task.process.TaskProcessTaskNodeLeaveHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('4', 'com.twproject.task.process.SetProgressToRoot', '\n                <progress>15</progress>\n            ', null, '1');
INSERT INTO `flow_delegation` VALUES ('5', 'com.twproject.task.process.TaskProcessTaskNodeEnterHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('6', 'com.twproject.task.process.TaskProcessTaskNodeLeaveHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('7', 'com.twproject.task.process.SetProgressToRoot', '\n                <progress>20</progress>\n            ', null, '1');
INSERT INTO `flow_delegation` VALUES ('8', 'com.twproject.task.process.TaskProcessTaskNodeEnterHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('9', 'com.twproject.task.process.TaskProcessTaskNodeLeaveHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('10', 'com.twproject.task.process.SetProgressToRoot', '\n                <progress>25</progress>\n            ', null, '1');
INSERT INTO `flow_delegation` VALUES ('11', 'com.twproject.task.process.TaskProcessTaskNodeEnterHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('12', 'com.twproject.task.process.TaskProcessTaskNodeLeaveHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('13', 'com.twproject.task.process.SetProgressToRoot', '\n                <progress>35</progress>\n            ', null, '1');
INSERT INTO `flow_delegation` VALUES ('14', 'com.twproject.task.process.TaskProcessTaskNodeEnterHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('15', 'com.twproject.task.process.TaskProcessTaskNodeLeaveHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('16', 'com.twproject.task.process.SetProgressToRoot', '\n                <progress>50</progress>\n            ', null, '1');
INSERT INTO `flow_delegation` VALUES ('17', 'com.twproject.task.process.TaskProcessTaskNodeEnterHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('18', 'com.twproject.task.process.TaskProcessTaskNodeLeaveHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('19', 'com.twproject.task.process.SetProgressToRoot', '\n                <progress>60</progress>\n            ', null, '1');
INSERT INTO `flow_delegation` VALUES ('20', 'com.twproject.task.process.TaskProcessTaskNodeEnterHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('21', 'com.twproject.task.process.TaskProcessTaskNodeLeaveHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('22', 'com.twproject.task.process.SetProgressToRoot', '\n                <progress>60</progress>\n            ', null, '1');
INSERT INTO `flow_delegation` VALUES ('23', 'com.twproject.task.process.TaskProcessTaskNodeEnterHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('24', 'com.twproject.task.process.SetProgressToRoot', '\n                <progress>70</progress>\n            ', null, '1');
INSERT INTO `flow_delegation` VALUES ('25', 'com.twproject.task.process.TaskProcessTaskNodeLeaveHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('26', 'com.twproject.task.process.SetProgressToRoot', '\n                <progress>80</progress>\n            ', null, '1');
INSERT INTO `flow_delegation` VALUES ('27', 'com.twproject.task.process.TaskProcessTaskNodeEnterHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('28', 'com.twproject.task.process.TaskProcessTaskNodeLeaveHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('29', 'com.twproject.task.process.SetProgressToRoot', '\n                <progress>95</progress>\n            ', null, '1');
INSERT INTO `flow_delegation` VALUES ('30', 'com.twproject.task.process.TaskProcessTaskNodeEnterHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('31', 'com.twproject.task.process.TaskProcessTaskNodeLeaveHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('32', 'com.twproject.task.process.SetProgressToRoot', '\n                <progress>100</progress>\n            ', null, '1');
INSERT INTO `flow_delegation` VALUES ('33', 'org.jblooming.flowork.defaultHandler.ActorAssignmentHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('34', 'org.jblooming.flowork.defaultHandler.ActorAssignmentHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('35', 'org.jblooming.flowork.defaultHandler.ActorAssignmentHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('36', 'org.jblooming.flowork.defaultHandler.ActorAssignmentHandler', null, null, '1');
INSERT INTO `flow_delegation` VALUES ('37', 'com.twproject.task.process.TaskProcessFluxEndHandler', null, null, '2');
INSERT INTO `flow_delegation` VALUES ('38', 'com.twproject.task.process.TaskProcessTaskNodeEnterHandler', null, null, '2');
INSERT INTO `flow_delegation` VALUES ('39', 'com.twproject.task.process.TaskProcessTaskNodeLeaveHandler', null, null, '2');
INSERT INTO `flow_delegation` VALUES ('40', 'com.twproject.task.process.TaskProcessTaskNodeEnterHandler', null, null, '2');
INSERT INTO `flow_delegation` VALUES ('41', 'com.twproject.task.process.TaskProcessTaskNodeLeaveHandler', null, null, '2');
INSERT INTO `flow_delegation` VALUES ('42', 'com.twproject.task.process.SetProgressToRoot', '\n                <progress>50</progress>\n            ', null, '2');
INSERT INTO `flow_delegation` VALUES ('43', 'com.twproject.task.process.TaskProcessTaskNodeEnterHandler', null, null, '2');
INSERT INTO `flow_delegation` VALUES ('44', 'com.twproject.task.process.TaskProcessTaskNodeLeaveHandler', null, null, '2');
INSERT INTO `flow_delegation` VALUES ('45', 'com.twproject.task.process.TaskProcessTaskNodeEnterHandler', null, null, '2');
INSERT INTO `flow_delegation` VALUES ('46', 'com.twproject.task.process.TaskProcessTaskNodeLeaveHandler', null, null, '2');
INSERT INTO `flow_delegation` VALUES ('47', 'com.twproject.task.process.TaskProcessTaskNodeEnterHandler', null, null, '2');
INSERT INTO `flow_delegation` VALUES ('48', 'com.twproject.task.process.TaskProcessTaskNodeLeaveHandler', null, null, '2');
INSERT INTO `flow_delegation` VALUES ('49', 'com.twproject.task.process.SetProgressToRoot', '\n                <progress>100</progress>\n            ', null, '2');
INSERT INTO `flow_delegation` VALUES ('50', 'com.twproject.task.process.SwimlaneAssignmentHandler', null, null, '2');
INSERT INTO `flow_delegation` VALUES ('51', 'com.twproject.task.process.SwimlaneAssignmentHandler', null, null, '2');
INSERT INTO `flow_delegation` VALUES ('52', 'com.twproject.task.process.SwimlaneAssignmentHandler', null, null, '2');

-- ----------------------------
-- Table structure for `flow_event`
-- ----------------------------
DROP TABLE IF EXISTS `flow_event`;
CREATE TABLE `flow_event` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `EVENTTYPE_` varchar(255) DEFAULT NULL,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_EVENT_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `FK_EVENT_NODE` (`NODE_`),
  KEY `FK_EVENT_TRANS` (`TRANSITION_`),
  KEY `FK_EVENT_TASK` (`TASK_`),
  CONSTRAINT `FK_EVENT_NODE` FOREIGN KEY (`NODE_`) REFERENCES `flow_node` (`ID_`),
  CONSTRAINT `FK_EVENT_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `flow_processdefinition` (`ID_`),
  CONSTRAINT `FK_EVENT_TASK` FOREIGN KEY (`TASK_`) REFERENCES `flow_task` (`ID_`),
  CONSTRAINT `FK_EVENT_TRANS` FOREIGN KEY (`TRANSITION_`) REFERENCES `flow_transition` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_event
-- ----------------------------
INSERT INTO `flow_event` VALUES ('1', 'process-end', 'P', '1', '1', null, null, null);
INSERT INTO `flow_event` VALUES ('2', 'node-enter', 'K', '2', null, '2', null, null);
INSERT INTO `flow_event` VALUES ('3', 'node-leave', 'K', '2', null, '2', null, null);
INSERT INTO `flow_event` VALUES ('4', 'node-enter', 'K', '3', null, '3', null, null);
INSERT INTO `flow_event` VALUES ('5', 'node-leave', 'K', '3', null, '3', null, null);
INSERT INTO `flow_event` VALUES ('6', 'node-enter', 'K', '4', null, '4', null, null);
INSERT INTO `flow_event` VALUES ('7', 'node-leave', 'K', '4', null, '4', null, null);
INSERT INTO `flow_event` VALUES ('8', 'node-enter', 'K', '5', null, '5', null, null);
INSERT INTO `flow_event` VALUES ('9', 'node-leave', 'K', '5', null, '5', null, null);
INSERT INTO `flow_event` VALUES ('10', 'node-enter', 'K', '6', null, '6', null, null);
INSERT INTO `flow_event` VALUES ('11', 'node-leave', 'K', '6', null, '6', null, null);
INSERT INTO `flow_event` VALUES ('12', 'node-enter', 'K', '8', null, '8', null, null);
INSERT INTO `flow_event` VALUES ('13', 'node-leave', 'K', '8', null, '8', null, null);
INSERT INTO `flow_event` VALUES ('14', 'node-enter', 'K', '9', null, '9', null, null);
INSERT INTO `flow_event` VALUES ('15', 'node-leave', 'K', '9', null, '9', null, null);
INSERT INTO `flow_event` VALUES ('16', 'node-enter', 'K', '11', null, '11', null, null);
INSERT INTO `flow_event` VALUES ('17', 'node-leave', 'K', '11', null, '11', null, null);
INSERT INTO `flow_event` VALUES ('18', 'node-enter', 'K', '12', null, '12', null, null);
INSERT INTO `flow_event` VALUES ('19', 'node-leave', 'K', '12', null, '12', null, null);
INSERT INTO `flow_event` VALUES ('20', 'node-enter', 'K', '13', null, '13', null, null);
INSERT INTO `flow_event` VALUES ('21', 'node-leave', 'K', '13', null, '13', null, null);
INSERT INTO `flow_event` VALUES ('22', 'process-end', 'P', '2', '2', null, null, null);
INSERT INTO `flow_event` VALUES ('23', 'node-enter', 'K', '16', null, '16', null, null);
INSERT INTO `flow_event` VALUES ('24', 'node-leave', 'K', '16', null, '16', null, null);
INSERT INTO `flow_event` VALUES ('25', 'node-enter', 'K', '17', null, '17', null, null);
INSERT INTO `flow_event` VALUES ('26', 'node-leave', 'K', '17', null, '17', null, null);
INSERT INTO `flow_event` VALUES ('27', 'node-enter', 'K', '18', null, '18', null, null);
INSERT INTO `flow_event` VALUES ('28', 'node-leave', 'K', '18', null, '18', null, null);
INSERT INTO `flow_event` VALUES ('29', 'node-enter', 'K', '19', null, '19', null, null);
INSERT INTO `flow_event` VALUES ('30', 'node-leave', 'K', '19', null, '19', null, null);
INSERT INTO `flow_event` VALUES ('31', 'node-enter', 'K', '20', null, '20', null, null);
INSERT INTO `flow_event` VALUES ('32', 'node-leave', 'K', '20', null, '20', null, null);

-- ----------------------------
-- Table structure for `flow_exceptionhandler`
-- ----------------------------
DROP TABLE IF EXISTS `flow_exceptionhandler`;
CREATE TABLE `flow_exceptionhandler` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `EXCEPTIONCLASSNAME_` varchar(4000) DEFAULT NULL,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `GRAPHELEMENTINDEX_` int(11) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_exceptionhandler
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_job`
-- ----------------------------
DROP TABLE IF EXISTS `flow_job`;
CREATE TABLE `flow_job` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `ISEXCLUSIVE_` bit(1) DEFAULT NULL,
  `LOCKOWNER_` varchar(255) DEFAULT NULL,
  `LOCKTIME_` datetime DEFAULT NULL,
  `EXCEPTION_` varchar(4000) DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  `TRANSITIONNAME_` varchar(255) DEFAULT NULL,
  `GRAPHELEMENTTYPE_` varchar(255) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_JOB_PRINST` (`PROCESSINSTANCE_`),
  KEY `IDX_JOB_TOKEN` (`TOKEN_`),
  KEY `IDX_JOB_TSKINST` (`TASKINSTANCE_`),
  KEY `FK_JOB_NODE` (`NODE_`),
  KEY `FK_JOB_ACTION` (`ACTION_`),
  CONSTRAINT `FK_JOB_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `flow_action` (`ID_`),
  CONSTRAINT `FK_JOB_NODE` FOREIGN KEY (`NODE_`) REFERENCES `flow_node` (`ID_`),
  CONSTRAINT `FK_JOB_PRINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `flow_processinstance` (`ID_`),
  CONSTRAINT `FK_JOB_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `flow_token` (`ID_`),
  CONSTRAINT `FK_JOB_TSKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `flow_taskinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_job
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_log`
-- ----------------------------
DROP TABLE IF EXISTS `flow_log`;
CREATE TABLE `flow_log` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `INDEX_` int(11) DEFAULT NULL,
  `DATE_` datetime DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `EXCEPTION_` varchar(4000) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `ENTER_` datetime DEFAULT NULL,
  `LEAVE_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TRANSITION_` bigint(20) DEFAULT NULL,
  `CHILD_` bigint(20) DEFAULT NULL,
  `SOURCENODE_` bigint(20) DEFAULT NULL,
  `DESTINATIONNODE_` bigint(20) DEFAULT NULL,
  `VARIABLEINSTANCE_` bigint(20) DEFAULT NULL,
  `OLDBYTEARRAY_` bigint(20) DEFAULT NULL,
  `NEWBYTEARRAY_` bigint(20) DEFAULT NULL,
  `OLDDATEVALUE_` datetime DEFAULT NULL,
  `NEWDATEVALUE_` datetime DEFAULT NULL,
  `OLDDOUBLEVALUE_` double DEFAULT NULL,
  `NEWDOUBLEVALUE_` double DEFAULT NULL,
  `OLDLONGIDCLASS_` varchar(255) DEFAULT NULL,
  `OLDLONGIDVALUE_` bigint(20) DEFAULT NULL,
  `NEWLONGIDCLASS_` varchar(255) DEFAULT NULL,
  `NEWLONGIDVALUE_` bigint(20) DEFAULT NULL,
  `OLDSTRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `OLDSTRINGIDVALUE_` varchar(255) DEFAULT NULL,
  `NEWSTRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `NEWSTRINGIDVALUE_` varchar(255) DEFAULT NULL,
  `OLDLONGVALUE_` bigint(20) DEFAULT NULL,
  `NEWLONGVALUE_` bigint(20) DEFAULT NULL,
  `OLDSTRINGVALUE_` varchar(4000) DEFAULT NULL,
  `NEWSTRINGVALUE_` varchar(4000) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKACTORID_` varchar(255) DEFAULT NULL,
  `TASKOLDACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANEINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_LOG_TOKEN` (`TOKEN_`),
  KEY `FK_LOG_PARENT` (`PARENT_`),
  KEY `FK_LOG_ACTION` (`ACTION_`),
  KEY `FK_LOG_NODE` (`NODE_`),
  KEY `FK_LOG_TRANSITION` (`TRANSITION_`),
  KEY `FK_LOG_CHILDTOKEN` (`CHILD_`),
  KEY `FK_LOG_SOURCENODE` (`SOURCENODE_`),
  KEY `FK_LOG_DESTNODE` (`DESTINATIONNODE_`),
  KEY `FK_LOG_VARINST` (`VARIABLEINSTANCE_`),
  KEY `FK_LOG_OLDBYTES` (`OLDBYTEARRAY_`),
  KEY `FK_LOG_NEWBYTES` (`NEWBYTEARRAY_`),
  KEY `FK_LOG_TASKINST` (`TASKINSTANCE_`),
  KEY `FK_LOG_SWIMINST` (`SWIMLANEINSTANCE_`),
  CONSTRAINT `FK_LOG_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `flow_action` (`ID_`),
  CONSTRAINT `FK_LOG_CHILDTOKEN` FOREIGN KEY (`CHILD_`) REFERENCES `flow_token` (`ID_`),
  CONSTRAINT `FK_LOG_DESTNODE` FOREIGN KEY (`DESTINATIONNODE_`) REFERENCES `flow_node` (`ID_`),
  CONSTRAINT `FK_LOG_NEWBYTES` FOREIGN KEY (`NEWBYTEARRAY_`) REFERENCES `flow_bytearray` (`ID_`),
  CONSTRAINT `FK_LOG_NODE` FOREIGN KEY (`NODE_`) REFERENCES `flow_node` (`ID_`),
  CONSTRAINT `FK_LOG_OLDBYTES` FOREIGN KEY (`OLDBYTEARRAY_`) REFERENCES `flow_bytearray` (`ID_`),
  CONSTRAINT `FK_LOG_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `flow_log` (`ID_`),
  CONSTRAINT `FK_LOG_SOURCENODE` FOREIGN KEY (`SOURCENODE_`) REFERENCES `flow_node` (`ID_`),
  CONSTRAINT `FK_LOG_SWIMINST` FOREIGN KEY (`SWIMLANEINSTANCE_`) REFERENCES `flow_swimlaneinstance` (`ID_`),
  CONSTRAINT `FK_LOG_TASKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `flow_taskinstance` (`ID_`),
  CONSTRAINT `FK_LOG_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `flow_token` (`ID_`),
  CONSTRAINT `FK_LOG_TRANSITION` FOREIGN KEY (`TRANSITION_`) REFERENCES `flow_transition` (`ID_`),
  CONSTRAINT `FK_LOG_VARINST` FOREIGN KEY (`VARIABLEINSTANCE_`) REFERENCES `flow_variableinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_log
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_mi_list`
-- ----------------------------
DROP TABLE IF EXISTS `flow_mi_list`;
CREATE TABLE `flow_mi_list` (
  `MILES_` bigint(20) NOT NULL,
  `elt` bigint(20) NOT NULL,
  PRIMARY KEY (`MILES_`,`elt`),
  KEY `FK_MILES_TK` (`elt`),
  CONSTRAINT `FK_MILES_MI` FOREIGN KEY (`MILES_`) REFERENCES `flow_milesinst` (`ID_`),
  CONSTRAINT `FK_MILES_TK` FOREIGN KEY (`elt`) REFERENCES `flow_token` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_mi_list
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_milesinst`
-- ----------------------------
DROP TABLE IF EXISTS `flow_milesinst`;
CREATE TABLE `flow_milesinst` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `reached` bit(1) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_MI_TOKEN` (`TOKEN_`),
  CONSTRAINT `FK_MI_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `flow_token` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_milesinst
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_moduledefinition`
-- ----------------------------
DROP TABLE IF EXISTS `flow_moduledefinition`;
CREATE TABLE `flow_moduledefinition` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(4000) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `STARTTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_MODDEF_PROCDF` (`PROCESSDEFINITION_`),
  KEY `FK_TSKDEF_START` (`STARTTASK_`),
  CONSTRAINT `FK_MODDEF_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `flow_processdefinition` (`ID_`),
  CONSTRAINT `FK_TSKDEF_START` FOREIGN KEY (`STARTTASK_`) REFERENCES `flow_task` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_moduledefinition
-- ----------------------------
INSERT INTO `flow_moduledefinition` VALUES ('1', 'C', 'org.jbpm.context.def.ContextDefinition', '1', null);
INSERT INTO `flow_moduledefinition` VALUES ('2', 'T', 'org.jbpm.taskmgmt.def.TaskMgmtDefinition', '1', null);
INSERT INTO `flow_moduledefinition` VALUES ('3', 'C', 'org.jbpm.context.def.ContextDefinition', '2', null);
INSERT INTO `flow_moduledefinition` VALUES ('4', 'T', 'org.jbpm.taskmgmt.def.TaskMgmtDefinition', '2', null);

-- ----------------------------
-- Table structure for `flow_moduleinstance`
-- ----------------------------
DROP TABLE IF EXISTS `flow_moduleinstance`;
CREATE TABLE `flow_moduleinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_MODINST_PRINST` (`PROCESSINSTANCE_`),
  KEY `FK_TASKMGTINST_TMD` (`TASKMGMTDEFINITION_`),
  CONSTRAINT `FK_MODINST_PRCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `flow_processinstance` (`ID_`),
  CONSTRAINT `FK_TASKMGTINST_TMD` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `flow_moduledefinition` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_moduleinstance
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_node`
-- ----------------------------
DROP TABLE IF EXISTS `flow_node`;
CREATE TABLE `flow_node` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `ISASYNC_` bit(1) DEFAULT NULL,
  `ISASYNCEXCL_` bit(1) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `SUPERSTATE_` bigint(20) DEFAULT NULL,
  `SUBPROCNAME_` varchar(255) DEFAULT NULL,
  `SUBPROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `DECISIONEXPRESSION_` varchar(255) DEFAULT NULL,
  `DECISIONDELEGATION` bigint(20) DEFAULT NULL,
  `SCRIPT_` bigint(20) DEFAULT NULL,
  `SIGNAL_` int(11) DEFAULT NULL,
  `CREATETASKS_` bit(1) DEFAULT NULL,
  `ENDTASKS_` bit(1) DEFAULT NULL,
  `NODECOLLECTIONINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_NODE_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `IDX_NODE_ACTION` (`ACTION_`),
  KEY `IDX_NODE_SUPRSTATE` (`SUPERSTATE_`),
  KEY `IDX_PSTATE_SBPRCDEF` (`SUBPROCESSDEFINITION_`),
  KEY `FK_DECISION_DELEG` (`DECISIONDELEGATION`),
  KEY `FK_NODE_SCRIPT` (`SCRIPT_`),
  CONSTRAINT `FK_DECISION_DELEG` FOREIGN KEY (`DECISIONDELEGATION`) REFERENCES `flow_delegation` (`ID_`),
  CONSTRAINT `FK_NODE_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `flow_action` (`ID_`),
  CONSTRAINT `FK_NODE_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `flow_processdefinition` (`ID_`),
  CONSTRAINT `FK_NODE_SCRIPT` FOREIGN KEY (`SCRIPT_`) REFERENCES `flow_action` (`ID_`),
  CONSTRAINT `FK_NODE_SUPERSTATE` FOREIGN KEY (`SUPERSTATE_`) REFERENCES `flow_node` (`ID_`),
  CONSTRAINT `FK_PROCST_SBPRCDEF` FOREIGN KEY (`SUBPROCESSDEFINITION_`) REFERENCES `flow_processdefinition` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_node
-- ----------------------------
INSERT INTO `flow_node` VALUES ('1', 'R', 'Start', null, '1', '\0', '\0', null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `flow_node` VALUES ('2', 'K', 'Collect user requirements', 'duration:45d', '1', '\0', '\0', null, null, null, null, null, null, null, '4', '', '\0', '1');
INSERT INTO `flow_node` VALUES ('3', 'K', 'Design', null, '1', '\0', '\0', null, null, null, null, null, null, null, '4', '', '\0', '2');
INSERT INTO `flow_node` VALUES ('4', 'K', 'Customer approval', 'This is an example of description usage in a task node with a duration set in weeks duration:2w', '1', '\0', '\0', null, null, null, null, null, null, null, '4', '', '\0', '3');
INSERT INTO `flow_node` VALUES ('5', 'K', 'Prototyping', null, '1', '\0', '\0', null, null, null, null, null, null, null, '4', '', '\0', '4');
INSERT INTO `flow_node` VALUES ('6', 'K', 'Testing', null, '1', '\0', '\0', null, null, null, null, null, null, null, '4', '', '\0', '5');
INSERT INTO `flow_node` VALUES ('7', 'F', 'Production (fork)', null, '1', '\0', '\0', null, null, null, null, null, null, null, null, null, null, '6');
INSERT INTO `flow_node` VALUES ('8', 'K', 'Final version', null, '1', '\0', '\0', null, null, null, null, null, null, null, '4', '', '\0', '7');
INSERT INTO `flow_node` VALUES ('9', 'K', 'Documentation', null, '1', '\0', '\0', null, null, null, null, null, null, null, '4', '', '\0', '8');
INSERT INTO `flow_node` VALUES ('10', 'J', 'Production (join)', null, '1', '\0', '\0', null, null, null, null, null, null, null, null, null, null, '9');
INSERT INTO `flow_node` VALUES ('11', 'K', 'Quality control', null, '1', '\0', '\0', null, null, null, null, null, null, null, '4', '', '\0', '10');
INSERT INTO `flow_node` VALUES ('12', 'K', 'Release', null, '1', '\0', '\0', null, null, null, null, null, null, null, '4', '', '\0', '11');
INSERT INTO `flow_node` VALUES ('13', 'K', 'Baby sitting', null, '1', '\0', '\0', null, null, null, null, null, null, null, '4', '', '\0', '12');
INSERT INTO `flow_node` VALUES ('14', 'E', 'Done', null, '1', '\0', '\0', null, null, null, null, null, null, null, null, null, null, '13');
INSERT INTO `flow_node` VALUES ('15', 'R', 'Start', null, '2', '\0', '\0', null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `flow_node` VALUES ('16', 'K', 'Collect user requirements', null, '2', '\0', '\0', null, null, null, null, null, null, null, '4', '', '\0', '1');
INSERT INTO `flow_node` VALUES ('17', 'K', 'Design', null, '2', '\0', '\0', null, null, null, null, null, null, null, '4', '', '\0', '2');
INSERT INTO `flow_node` VALUES ('18', 'K', 'Customer approval', null, '2', '\0', '\0', null, null, null, null, null, null, null, '4', '', '\0', '3');
INSERT INTO `flow_node` VALUES ('19', 'K', 'Final version', null, '2', '\0', '\0', null, null, null, null, null, null, null, '4', '', '\0', '4');
INSERT INTO `flow_node` VALUES ('20', 'K', 'Release', null, '2', '\0', '\0', null, null, null, null, null, null, null, '4', '', '\0', '5');
INSERT INTO `flow_node` VALUES ('21', 'E', 'Done', null, '2', '\0', '\0', null, null, null, null, null, null, null, null, null, null, '6');

-- ----------------------------
-- Table structure for `flow_pooledactor`
-- ----------------------------
DROP TABLE IF EXISTS `flow_pooledactor`;
CREATE TABLE `flow_pooledactor` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANEINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_PLDACTR_ACTID` (`ACTORID_`),
  KEY `IDX_TSKINST_SWLANE` (`SWIMLANEINSTANCE_`),
  CONSTRAINT `FK_POOLEDACTOR_SLI` FOREIGN KEY (`SWIMLANEINSTANCE_`) REFERENCES `flow_swimlaneinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_pooledactor
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_processdefinition`
-- ----------------------------
DROP TABLE IF EXISTS `flow_processdefinition`;
CREATE TABLE `flow_processdefinition` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `ISTERMINATIONIMPLICIT_` bit(1) DEFAULT NULL,
  `STARTSTATE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_PROCDEF_STRTST` (`STARTSTATE_`),
  CONSTRAINT `FK_PROCDEF_STRTSTA` FOREIGN KEY (`STARTSTATE_`) REFERENCES `flow_node` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_processdefinition
-- ----------------------------
INSERT INTO `flow_processdefinition` VALUES ('1', 'P', 'Sample production process', null, '1', '\0', '1');
INSERT INTO `flow_processdefinition` VALUES ('2', 'P', 'Sample simple production process', null, '1', '\0', '15');

-- ----------------------------
-- Table structure for `flow_processinstance`
-- ----------------------------
DROP TABLE IF EXISTS `flow_processinstance`;
CREATE TABLE `flow_processinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `ROOTTOKEN_` bigint(20) DEFAULT NULL,
  `SUPERPROCESSTOKEN_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_PROCIN_KEY` (`KEY_`),
  KEY `IDX_PROCIN_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `IDX_PROCIN_ROOTTK` (`ROOTTOKEN_`),
  KEY `IDX_PROCIN_SPROCTK` (`SUPERPROCESSTOKEN_`),
  CONSTRAINT `FK_PROCIN_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `flow_processdefinition` (`ID_`),
  CONSTRAINT `FK_PROCIN_ROOTTKN` FOREIGN KEY (`ROOTTOKEN_`) REFERENCES `flow_token` (`ID_`),
  CONSTRAINT `FK_PROCIN_SPROCTKN` FOREIGN KEY (`SUPERPROCESSTOKEN_`) REFERENCES `flow_token` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_processinstance
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_runtimeaction`
-- ----------------------------
DROP TABLE IF EXISTS `flow_runtimeaction`;
CREATE TABLE `flow_runtimeaction` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `EVENTTYPE_` varchar(255) DEFAULT NULL,
  `TYPE_` char(1) DEFAULT NULL,
  `GRAPHELEMENT_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `ACTION_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCEINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_RTACTN_PRCINST` (`PROCESSINSTANCE_`),
  KEY `IDX_RTACTN_ACTION` (`ACTION_`),
  CONSTRAINT `FK_RTACTN_ACTION` FOREIGN KEY (`ACTION_`) REFERENCES `flow_action` (`ID_`),
  CONSTRAINT `FK_RTACTN_PROCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `flow_processinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_runtimeaction
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_swimlane`
-- ----------------------------
DROP TABLE IF EXISTS `flow_swimlane`;
CREATE TABLE `flow_swimlane` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `ACTORIDEXPRESSION_` varchar(255) DEFAULT NULL,
  `POOLEDACTORSEXPRESSION_` varchar(255) DEFAULT NULL,
  `ASSIGNMENTDELEGATION_` bigint(20) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_SWL_ASSDEL` (`ASSIGNMENTDELEGATION_`),
  KEY `FK_SWL_TSKMGMTDEF` (`TASKMGMTDEFINITION_`),
  CONSTRAINT `FK_SWL_ASSDEL` FOREIGN KEY (`ASSIGNMENTDELEGATION_`) REFERENCES `flow_delegation` (`ID_`),
  CONSTRAINT `FK_SWL_TSKMGMTDEF` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `flow_moduledefinition` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_swimlane
-- ----------------------------
INSERT INTO `flow_swimlane` VALUES ('1', 'Customer', null, null, '33', '2');
INSERT INTO `flow_swimlane` VALUES ('2', 'Worker', null, null, '34', '2');
INSERT INTO `flow_swimlane` VALUES ('3', 'Quality control', null, null, '35', '2');
INSERT INTO `flow_swimlane` VALUES ('4', 'Project manager', null, null, '36', '2');
INSERT INTO `flow_swimlane` VALUES ('5', 'Customer', null, null, '50', '4');
INSERT INTO `flow_swimlane` VALUES ('6', 'Worker', null, null, '51', '4');
INSERT INTO `flow_swimlane` VALUES ('7', 'Project manager', null, null, '52', '4');

-- ----------------------------
-- Table structure for `flow_swimlaneinstance`
-- ----------------------------
DROP TABLE IF EXISTS `flow_swimlaneinstance`;
CREATE TABLE `flow_swimlaneinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKMGMTINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_SWIMLINST_SL` (`SWIMLANE_`),
  KEY `FK_SWIMLANEINST_TM` (`TASKMGMTINSTANCE_`),
  CONSTRAINT `FK_SWIMLANEINST_SL` FOREIGN KEY (`SWIMLANE_`) REFERENCES `flow_swimlane` (`ID_`),
  CONSTRAINT `FK_SWIMLANEINST_TM` FOREIGN KEY (`TASKMGMTINSTANCE_`) REFERENCES `flow_moduleinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_swimlaneinstance
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_task`
-- ----------------------------
DROP TABLE IF EXISTS `flow_task`;
CREATE TABLE `flow_task` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `ISBLOCKING_` bit(1) DEFAULT NULL,
  `ISSIGNALLING_` bit(1) DEFAULT NULL,
  `CONDITION_` varchar(255) DEFAULT NULL,
  `DUEDATE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `ACTORIDEXPRESSION_` varchar(255) DEFAULT NULL,
  `POOLEDACTORSEXPRESSION_` varchar(255) DEFAULT NULL,
  `TASKMGMTDEFINITION_` bigint(20) DEFAULT NULL,
  `TASKNODE_` bigint(20) DEFAULT NULL,
  `STARTSTATE_` bigint(20) DEFAULT NULL,
  `ASSIGNMENTDELEGATION_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKCONTROLLER_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_TASK_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `IDX_TASK_TASKMGTDF` (`TASKMGMTDEFINITION_`),
  KEY `IDX_TASK_TSKNODE` (`TASKNODE_`),
  KEY `FK_TASK_STARTST` (`STARTSTATE_`),
  KEY `FK_TASK_ASSDEL` (`ASSIGNMENTDELEGATION_`),
  KEY `FK_TASK_SWIMLANE` (`SWIMLANE_`),
  KEY `FK_TSK_TSKCTRL` (`TASKCONTROLLER_`),
  CONSTRAINT `FK_TASK_ASSDEL` FOREIGN KEY (`ASSIGNMENTDELEGATION_`) REFERENCES `flow_delegation` (`ID_`),
  CONSTRAINT `FK_TASK_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `flow_processdefinition` (`ID_`),
  CONSTRAINT `FK_TASK_STARTST` FOREIGN KEY (`STARTSTATE_`) REFERENCES `flow_node` (`ID_`),
  CONSTRAINT `FK_TASK_SWIMLANE` FOREIGN KEY (`SWIMLANE_`) REFERENCES `flow_swimlane` (`ID_`),
  CONSTRAINT `FK_TASK_TASKMGTDEF` FOREIGN KEY (`TASKMGMTDEFINITION_`) REFERENCES `flow_moduledefinition` (`ID_`),
  CONSTRAINT `FK_TASK_TASKNODE` FOREIGN KEY (`TASKNODE_`) REFERENCES `flow_node` (`ID_`),
  CONSTRAINT `FK_TSK_TSKCTRL` FOREIGN KEY (`TASKCONTROLLER_`) REFERENCES `flow_taskcontroller` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_task
-- ----------------------------
INSERT INTO `flow_task` VALUES ('1', 'Collect user requirements', null, '1', '\0', '', null, null, '3', null, null, '2', '2', null, null, '1', null);
INSERT INTO `flow_task` VALUES ('2', 'Collect user requirements', 'estimated:200m', '1', '\0', '', null, null, '3', null, null, '2', '2', null, null, '4', null);
INSERT INTO `flow_task` VALUES ('3', 'Design', null, '1', '\0', '', null, null, '3', null, null, '2', '3', null, null, '2', null);
INSERT INTO `flow_task` VALUES ('4', 'Approve design', 'worker approval with an estimated worklog set in hours and minutes estimated:3:30', '1', '\0', '', null, null, '3', null, null, '2', '4', null, null, '1', null);
INSERT INTO `flow_task` VALUES ('5', 'Prototyping', null, '1', '\0', '', null, null, '3', null, null, '2', '5', null, null, '2', null);
INSERT INTO `flow_task` VALUES ('6', 'Testing', null, '1', '\0', '', null, null, '3', null, null, '2', '6', null, null, '2', null);
INSERT INTO `flow_task` VALUES ('7', 'Final version', null, '1', '\0', '', null, null, '3', null, null, '2', '8', null, null, '2', null);
INSERT INTO `flow_task` VALUES ('8', 'Documentation', null, '1', '\0', '', null, null, '3', null, null, '2', '9', null, null, '2', null);
INSERT INTO `flow_task` VALUES ('9', 'Quality manager approval', null, '1', '\0', '', null, null, '3', null, null, '2', '11', null, null, '3', null);
INSERT INTO `flow_task` VALUES ('10', 'Release', null, '1', '\0', '', null, null, '3', null, null, '2', '12', null, null, '2', null);
INSERT INTO `flow_task` VALUES ('11', 'Baby sitting', null, '1', '\0', '', null, null, '3', null, null, '2', '13', null, null, '1', null);
INSERT INTO `flow_task` VALUES ('12', 'Baby sitting', null, '1', '\0', '', null, null, '3', null, null, '2', '13', null, null, '2', null);
INSERT INTO `flow_task` VALUES ('13', 'Collect user requirements', null, '2', '\0', '', null, null, '3', null, null, '4', '16', null, null, '5', null);
INSERT INTO `flow_task` VALUES ('14', 'Design', null, '2', '\0', '', null, null, '3', null, null, '4', '17', null, null, '6', null);
INSERT INTO `flow_task` VALUES ('15', 'Customer approval', null, '2', '\0', '', null, null, '3', null, null, '4', '18', null, null, '5', null);
INSERT INTO `flow_task` VALUES ('16', 'Final version', null, '2', '\0', '', null, null, '3', null, null, '4', '19', null, null, '6', null);
INSERT INTO `flow_task` VALUES ('17', 'Release', null, '2', '\0', '', null, null, '3', null, null, '4', '20', null, null, '6', null);

-- ----------------------------
-- Table structure for `flow_taskactorpool`
-- ----------------------------
DROP TABLE IF EXISTS `flow_taskactorpool`;
CREATE TABLE `flow_taskactorpool` (
  `TASKINSTANCE_` bigint(20) NOT NULL,
  `POOLEDACTOR_` bigint(20) NOT NULL,
  PRIMARY KEY (`TASKINSTANCE_`,`POOLEDACTOR_`),
  KEY `FK_TSKACTPOL_PLACT` (`POOLEDACTOR_`),
  CONSTRAINT `FK_TASKACTPL_TSKI` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `flow_taskinstance` (`ID_`),
  CONSTRAINT `FK_TSKACTPOL_PLACT` FOREIGN KEY (`POOLEDACTOR_`) REFERENCES `flow_pooledactor` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_taskactorpool
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_taskcontroller`
-- ----------------------------
DROP TABLE IF EXISTS `flow_taskcontroller`;
CREATE TABLE `flow_taskcontroller` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TASKCONTROLLERDELEGATION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_TSKCTRL_DELEG` (`TASKCONTROLLERDELEGATION_`),
  CONSTRAINT `FK_TSKCTRL_DELEG` FOREIGN KEY (`TASKCONTROLLERDELEGATION_`) REFERENCES `flow_delegation` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_taskcontroller
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_taskinstance`
-- ----------------------------
DROP TABLE IF EXISTS `flow_taskinstance`;
CREATE TABLE `flow_taskinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `ACTORID_` varchar(255) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `ISCANCELLED_` bit(1) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `ISOPEN_` bit(1) DEFAULT NULL,
  `ISSIGNALLING_` bit(1) DEFAULT NULL,
  `ISBLOCKING_` bit(1) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `PROCINST_` bigint(20) DEFAULT NULL,
  `SWIMLANINSTANCE_` bigint(20) DEFAULT NULL,
  `TASKMGMTINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_TASK_ACTORID` (`ACTORID_`),
  KEY `IDX_TASKINST_TOKN` (`TOKEN_`),
  KEY `IDX_TASKINST_TSK` (`PROCINST_`),
  KEY `IDX_TSKINST_SLINST` (`SWIMLANINSTANCE_`),
  KEY `IDX_TSKINST_TMINST` (`TASKMGMTINSTANCE_`),
  KEY `FK_TASKINST_TASK` (`TASK_`),
  CONSTRAINT `FK_TASKINST_SLINST` FOREIGN KEY (`SWIMLANINSTANCE_`) REFERENCES `flow_swimlaneinstance` (`ID_`),
  CONSTRAINT `FK_TASKINST_TASK` FOREIGN KEY (`TASK_`) REFERENCES `flow_task` (`ID_`),
  CONSTRAINT `FK_TASKINST_TMINST` FOREIGN KEY (`TASKMGMTINSTANCE_`) REFERENCES `flow_moduleinstance` (`ID_`),
  CONSTRAINT `FK_TASKINST_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `flow_token` (`ID_`),
  CONSTRAINT `FK_TSKINS_PRCINS` FOREIGN KEY (`PROCINST_`) REFERENCES `flow_processinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_taskinstance
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_token`
-- ----------------------------
DROP TABLE IF EXISTS `flow_token`;
CREATE TABLE `flow_token` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `NODEENTER_` datetime DEFAULT NULL,
  `NEXTLOGINDEX_` int(11) DEFAULT NULL,
  `ISABLETOREACTIVATEPARENT_` bit(1) DEFAULT NULL,
  `ISTERMINATIONIMPLICIT_` bit(1) DEFAULT NULL,
  `ISSUSPENDED_` bit(1) DEFAULT NULL,
  `LOCK_` varchar(255) DEFAULT NULL,
  `NODE_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `SUBPROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_TOKEN_NODE` (`NODE_`),
  KEY `IDX_TOKEN_PROCIN` (`PROCESSINSTANCE_`),
  KEY `IDX_TOKEN_PARENT` (`PARENT_`),
  KEY `IDX_TOKEN_SUBPI` (`SUBPROCESSINSTANCE_`),
  CONSTRAINT `FK_TOKEN_NODE` FOREIGN KEY (`NODE_`) REFERENCES `flow_node` (`ID_`),
  CONSTRAINT `FK_TOKEN_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `flow_token` (`ID_`),
  CONSTRAINT `FK_TOKEN_PROCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `flow_processinstance` (`ID_`),
  CONSTRAINT `FK_TOKEN_SUBPI` FOREIGN KEY (`SUBPROCESSINSTANCE_`) REFERENCES `flow_processinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_token
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_tokenvariablemap`
-- ----------------------------
DROP TABLE IF EXISTS `flow_tokenvariablemap`;
CREATE TABLE `flow_tokenvariablemap` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VERSION_` int(11) NOT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `CONTEXTINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_TKVVARMP_TOKEN` (`TOKEN_`),
  KEY `IDX_TKVARMAP_CTXT` (`CONTEXTINSTANCE_`),
  CONSTRAINT `FK_TKVARMAP_CTXT` FOREIGN KEY (`CONTEXTINSTANCE_`) REFERENCES `flow_moduleinstance` (`ID_`),
  CONSTRAINT `FK_TKVARMAP_TOKEN` FOREIGN KEY (`TOKEN_`) REFERENCES `flow_token` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_tokenvariablemap
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_transition`
-- ----------------------------
DROP TABLE IF EXISTS `flow_transition`;
CREATE TABLE `flow_transition` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) DEFAULT NULL,
  `PROCESSDEFINITION_` bigint(20) DEFAULT NULL,
  `FROM_` bigint(20) DEFAULT NULL,
  `TO_` bigint(20) DEFAULT NULL,
  `CONDITION_` varchar(255) DEFAULT NULL,
  `FROMINDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_TRANS_PROCDEF` (`PROCESSDEFINITION_`),
  KEY `IDX_TRANSIT_FROM` (`FROM_`),
  KEY `IDX_TRANSIT_TO` (`TO_`),
  CONSTRAINT `FK_TRANSITION_FROM` FOREIGN KEY (`FROM_`) REFERENCES `flow_node` (`ID_`),
  CONSTRAINT `FK_TRANSITION_TO` FOREIGN KEY (`TO_`) REFERENCES `flow_node` (`ID_`),
  CONSTRAINT `FK_TRANS_PROCDEF` FOREIGN KEY (`PROCESSDEFINITION_`) REFERENCES `flow_processdefinition` (`ID_`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_transition
-- ----------------------------
INSERT INTO `flow_transition` VALUES ('1', null, null, '1', '1', '2', null, '0');
INSERT INTO `flow_transition` VALUES ('2', null, null, '1', '2', '3', null, '0');
INSERT INTO `flow_transition` VALUES ('3', null, null, '1', '3', '4', null, '0');
INSERT INTO `flow_transition` VALUES ('4', 'Failed', null, '1', '4', '3', null, '0');
INSERT INTO `flow_transition` VALUES ('5', 'Passed', null, '1', '4', '5', null, '1');
INSERT INTO `flow_transition` VALUES ('6', null, null, '1', '5', '6', null, '0');
INSERT INTO `flow_transition` VALUES ('7', 'Failed', null, '1', '6', '5', null, '0');
INSERT INTO `flow_transition` VALUES ('8', 'Passed', null, '1', '6', '7', null, '1');
INSERT INTO `flow_transition` VALUES ('9', 'a', null, '1', '7', '8', null, '0');
INSERT INTO `flow_transition` VALUES ('10', 'b', null, '1', '7', '9', null, '1');
INSERT INTO `flow_transition` VALUES ('11', null, null, '1', '8', '10', null, '0');
INSERT INTO `flow_transition` VALUES ('12', null, null, '1', '9', '10', null, '0');
INSERT INTO `flow_transition` VALUES ('13', null, null, '1', '10', '11', null, '0');
INSERT INTO `flow_transition` VALUES ('14', 'Failed', null, '1', '11', '7', null, '0');
INSERT INTO `flow_transition` VALUES ('15', 'Passed', null, '1', '11', '12', null, '1');
INSERT INTO `flow_transition` VALUES ('16', null, null, '1', '12', '13', null, '0');
INSERT INTO `flow_transition` VALUES ('17', null, null, '1', '13', '14', null, '0');
INSERT INTO `flow_transition` VALUES ('18', null, null, '2', '15', '16', null, '0');
INSERT INTO `flow_transition` VALUES ('19', null, null, '2', '16', '17', null, '0');
INSERT INTO `flow_transition` VALUES ('20', null, null, '2', '17', '18', null, '0');
INSERT INTO `flow_transition` VALUES ('21', 'Failed', null, '2', '18', '17', null, '0');
INSERT INTO `flow_transition` VALUES ('22', 'Passed', null, '2', '18', '19', null, '1');
INSERT INTO `flow_transition` VALUES ('23', null, null, '2', '19', '20', null, '0');
INSERT INTO `flow_transition` VALUES ('24', null, null, '2', '20', '21', null, '0');

-- ----------------------------
-- Table structure for `flow_variableaccess`
-- ----------------------------
DROP TABLE IF EXISTS `flow_variableaccess`;
CREATE TABLE `flow_variableaccess` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `VARIABLENAME_` varchar(255) DEFAULT NULL,
  `ACCESS_` varchar(255) DEFAULT NULL,
  `MAPPEDNAME_` varchar(255) DEFAULT NULL,
  `PROCESSSTATE_` bigint(20) DEFAULT NULL,
  `SCRIPT_` bigint(20) DEFAULT NULL,
  `TASKCONTROLLER_` bigint(20) DEFAULT NULL,
  `INDEX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `FK_VARACC_PROCST` (`PROCESSSTATE_`),
  KEY `FK_VARACC_SCRIPT` (`SCRIPT_`),
  KEY `FK_VARACC_TSKCTRL` (`TASKCONTROLLER_`),
  CONSTRAINT `FK_VARACC_PROCST` FOREIGN KEY (`PROCESSSTATE_`) REFERENCES `flow_node` (`ID_`),
  CONSTRAINT `FK_VARACC_SCRIPT` FOREIGN KEY (`SCRIPT_`) REFERENCES `flow_action` (`ID_`),
  CONSTRAINT `FK_VARACC_TSKCTRL` FOREIGN KEY (`TASKCONTROLLER_`) REFERENCES `flow_taskcontroller` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_variableaccess
-- ----------------------------

-- ----------------------------
-- Table structure for `flow_variableinstance`
-- ----------------------------
DROP TABLE IF EXISTS `flow_variableinstance`;
CREATE TABLE `flow_variableinstance` (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CONVERTER_` char(1) DEFAULT NULL,
  `TOKEN_` bigint(20) DEFAULT NULL,
  `TOKENVARIABLEMAP_` bigint(20) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `BYTEARRAYVALUE_` bigint(20) DEFAULT NULL,
  `DATEVALUE_` datetime DEFAULT NULL,
  `DOUBLEVALUE_` double DEFAULT NULL,
  `LONGIDCLASS_` varchar(255) DEFAULT NULL,
  `LONGVALUE_` bigint(20) DEFAULT NULL,
  `STRINGIDCLASS_` varchar(255) DEFAULT NULL,
  `STRINGVALUE_` varchar(255) DEFAULT NULL,
  `TASKINSTANCE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `IDX_VARINST_TK` (`TOKEN_`),
  KEY `IDX_VARINST_TKVARMP` (`TOKENVARIABLEMAP_`),
  KEY `IDX_VARINST_PRCINS` (`PROCESSINSTANCE_`),
  KEY `FK_BYTEINST_ARRAY` (`BYTEARRAYVALUE_`),
  KEY `FK_VAR_TSKINST` (`TASKINSTANCE_`),
  CONSTRAINT `FK_BYTEINST_ARRAY` FOREIGN KEY (`BYTEARRAYVALUE_`) REFERENCES `flow_bytearray` (`ID_`),
  CONSTRAINT `FK_VARINST_PRCINST` FOREIGN KEY (`PROCESSINSTANCE_`) REFERENCES `flow_processinstance` (`ID_`),
  CONSTRAINT `FK_VARINST_TK` FOREIGN KEY (`TOKEN_`) REFERENCES `flow_token` (`ID_`),
  CONSTRAINT `FK_VARINST_TKVARMP` FOREIGN KEY (`TOKENVARIABLEMAP_`) REFERENCES `flow_tokenvariablemap` (`ID_`),
  CONSTRAINT `FK_VAR_TSKINST` FOREIGN KEY (`TASKINSTANCE_`) REFERENCES `flow_taskinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flow_variableinstance
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_anagraphicaldata`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_anagraphicaldata`;
CREATE TABLE `olpl_anagraphicaldata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creationDate` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `hidden` bit(1) NOT NULL,
  `hiddenOn` datetime DEFAULT NULL,
  `hiddenBy` varchar(255) DEFAULT NULL,
  `locationDescription` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `googleMapsUrl` varchar(1000) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `orderFactor` int(11) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `building` varchar(255) DEFAULT NULL,
  `floor` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `otherTelephone` varchar(255) DEFAULT NULL,
  `otherTelDescription` varchar(255) DEFAULT NULL,
  `hideAnagraficalData` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_anagraphicaldata
-- ----------------------------
INSERT INTO `olpl_anagraphicaldata` VALUES ('1', '2017-05-16 15:43:41', null, null, '2017-05-16 15:43:41', '\0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, '\0');
INSERT INTO `olpl_anagraphicaldata` VALUES ('2', '2017-05-16 10:02:00', 'System Manager', 'System Manager', '2017-05-16 10:02:00', '\0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, '\0');

-- ----------------------------
-- Table structure for `olpl_area`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_area`;
CREATE TABLE `olpl_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discriminator` varchar(3) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `enabledOperators` int(11) DEFAULT NULL,
  `freeAccount` varchar(255) DEFAULT NULL,
  `expiry` datetime DEFAULT NULL,
  `lastLoginOnArea` datetime DEFAULT NULL,
  `beyondFreeVersion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_area_name` (`name`),
  KEY `idx_area_operator` (`owner`),
  CONSTRAINT `fk_area_operator` FOREIGN KEY (`owner`) REFERENCES `olpl_operator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_area
-- ----------------------------
INSERT INTO `olpl_area` VALUES ('1', 'TWA', 'TC', '1', '2017-05-16 10:02:00', 'System Manager', null, '2017-05-16 03:43:49', '0', null, null, null, null);

-- ----------------------------
-- Table structure for `olpl_auditlog`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_auditlog`;
CREATE TABLE `olpl_auditlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `data` longtext,
  `entityClass` varchar(255) DEFAULT NULL,
  `entityId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_auditlog_created` (`created`),
  KEY `idx_auditlog_entclass` (`entityClass`),
  KEY `idx_auditlog_entid` (`entityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_auditlog
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_blob`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_blob`;
CREATE TABLE `olpl_blob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creationDate` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `hidden` bit(1) NOT NULL,
  `hiddenOn` datetime DEFAULT NULL,
  `hiddenBy` varchar(255) DEFAULT NULL,
  `blobx` longblob,
  `originalFileName` varchar(255) DEFAULT NULL,
  `referralId` int(11) DEFAULT NULL,
  `referralClass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_blob
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_counter`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_counter`;
CREATE TABLE `olpl_counter` (
  `id` varchar(255) NOT NULL,
  `valuex` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_counter
-- ----------------------------
INSERT INTO `olpl_counter` VALUES ('olpl_counter', '42');
INSERT INTO `olpl_counter` VALUES ('olpl_role', '8');
INSERT INTO `olpl_counter` VALUES ('olpl_ws_content', '49');
INSERT INTO `olpl_counter` VALUES ('olpl_ws_news', '1');
INSERT INTO `olpl_counter` VALUES ('olpl_ws_page', '4');
INSERT INTO `olpl_counter` VALUES ('olpl_ws_portlet', '28');
INSERT INTO `olpl_counter` VALUES ('olpl_ws_template', '2');
INSERT INTO `olpl_counter` VALUES ('SCHEMA_BUILD_NUMBER', '62001');
INSERT INTO `olpl_counter` VALUES ('twk_assignment', '1');
INSERT INTO `olpl_counter` VALUES ('twk_assig_pr', '1');
INSERT INTO `olpl_counter` VALUES ('twk_board', '1');
INSERT INTO `olpl_counter` VALUES ('twk_cost_aggregator', '1');
INSERT INTO `olpl_counter` VALUES ('twk_issue', '9');
INSERT INTO `olpl_counter` VALUES ('twk_meeting_room', '5');
INSERT INTO `olpl_counter` VALUES ('twk_resource', '2');
INSERT INTO `olpl_counter` VALUES ('twk_stickynote', '1');
INSERT INTO `olpl_counter` VALUES ('twk_task', '1');

-- ----------------------------
-- Table structure for `olpl_departmenttype`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_departmenttype`;
CREATE TABLE `olpl_departmenttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stringValue` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_departmenttype
-- ----------------------------
INSERT INTO `olpl_departmenttype` VALUES ('1', 'COMPANY', 'Company');
INSERT INTO `olpl_departmenttype` VALUES ('2', 'DEPARTMENT', 'Department');
INSERT INTO `olpl_departmenttype` VALUES ('3', 'BRANCH', 'Branch');
INSERT INTO `olpl_departmenttype` VALUES ('4', 'OFFICE', 'Office');

-- ----------------------------
-- Table structure for `olpl_des_data`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_des_data`;
CREATE TABLE `olpl_des_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referenceId` varchar(25) NOT NULL,
  `referenceClassName` varchar(50) NOT NULL,
  `designerName` varchar(80) NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_des_data
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_des_data_value`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_des_data_value`;
CREATE TABLE `olpl_des_data_value` (
  `dataId` int(11) NOT NULL,
  `propertyValue` varchar(2000) DEFAULT NULL,
  `propertyName` varchar(255) NOT NULL,
  PRIMARY KEY (`dataId`,`propertyName`),
  CONSTRAINT `des_data_id` FOREIGN KEY (`dataId`) REFERENCES `olpl_des_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_des_data_value
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_flowfields`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_flowfields`;
CREATE TABLE `olpl_flowfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flowName` varchar(255) DEFAULT NULL,
  `flowVersion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_flowfields
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_flowfields_avail`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_flowfields_avail`;
CREATE TABLE `olpl_flowfields_avail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kind` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `initialValue` varchar(255) DEFAULT NULL,
  `cardinality` int(11) DEFAULT NULL,
  `columnLength` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_flowfields_avail
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_flowfields_ds`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_flowfields_ds`;
CREATE TABLE `olpl_flowfields_ds` (
  `form_id` int(11) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `step` varchar(255) NOT NULL,
  PRIMARY KEY (`form_id`,`step`),
  CONSTRAINT `fk_ff_form_idds` FOREIGN KEY (`form_id`) REFERENCES `olpl_flowfields` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_flowfields_ds
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_flowfields_tf`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_flowfields_tf`;
CREATE TABLE `olpl_flowfields_tf` (
  `form_id` int(11) NOT NULL,
  `fields_ser` varchar(4000) DEFAULT NULL,
  `step` varchar(255) NOT NULL,
  PRIMARY KEY (`form_id`,`step`),
  CONSTRAINT `fk_ff_form_id` FOREIGN KEY (`form_id`) REFERENCES `olpl_flowfields` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_flowfields_tf
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_flowmailattacher`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_flowmailattacher`;
CREATE TABLE `olpl_flowmailattacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailText` varchar(255) DEFAULT NULL,
  `taskInstance` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_flowMail_taskI` (`taskInstance`),
  CONSTRAINT `fk_flowMail_taskI` FOREIGN KEY (`taskInstance`) REFERENCES `flow_taskinstance` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_flowmailattacher
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_flowstarter`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_flowstarter`;
CREATE TABLE `olpl_flowstarter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `definitionName` varchar(255) DEFAULT NULL,
  `swimlaneNames` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_flowstarter
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_group`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_group`;
CREATE TABLE `olpl_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `administrator` bit(1) DEFAULT NULL,
  `enabledOnlyOn` int(11) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ldapName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_group_schedule` (`enabledOnlyOn`),
  CONSTRAINT `fk_group_schedule` FOREIGN KEY (`enabledOnlyOn`) REFERENCES `olpl_schedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_group
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_group_roles`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_group_roles`;
CREATE TABLE `olpl_group_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupx` int(11) DEFAULT NULL,
  `rolex` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_group_roles_op` (`groupx`),
  KEY `idx_group_roles_rolex` (`rolex`),
  CONSTRAINT `fk_group_roles_op` FOREIGN KEY (`groupx`) REFERENCES `olpl_group` (`id`),
  CONSTRAINT `fk_group_roles_rolex` FOREIGN KEY (`rolex`) REFERENCES `olpl_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_group_roles
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_groupcontgroup`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_groupcontgroup`;
CREATE TABLE `olpl_groupcontgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `master` int(11) DEFAULT NULL,
  `slave` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_groupgroup_master` (`master`),
  KEY `idx_groupgroup_slave` (`slave`),
  CONSTRAINT `fk_groupgroup_master` FOREIGN KEY (`master`) REFERENCES `olpl_group` (`id`),
  CONSTRAINT `fk_groupgroup_slave` FOREIGN KEY (`slave`) REFERENCES `olpl_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_groupcontgroup
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_i18nentry`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_i18nentry`;
CREATE TABLE `olpl_i18nentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `value` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_i18nentry
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_job`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_job`;
CREATE TABLE `olpl_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `estimatedDuration` int(11) DEFAULT NULL,
  `executable` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `onErrorRetryNow` bit(1) DEFAULT NULL,
  `onErrorSuspendScheduling` bit(1) DEFAULT NULL,
  `timeoutTime` bigint(20) DEFAULT NULL,
  `lastExecutionTime` bigint(20) DEFAULT NULL,
  `schedule` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mo_job_schedule` (`schedule`),
  CONSTRAINT `fk_mo_job_schedule` FOREIGN KEY (`schedule`) REFERENCES `olpl_schedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_job
-- ----------------------------
INSERT INTO `olpl_job` VALUES ('1', 'ExecuteTimeCounterChecks', 'Execute  time  counter  checks', '2000', 'com.twproject.worklog.ExecuteTimeCounterChecks', '', '\0', '\0', '0', '1495430628875', '1');
INSERT INTO `olpl_job` VALUES ('2', 'EventListenerMatcher', 'Event  listener  matcher', '5000', 'org.jblooming.messaging.EventListenerMatcher', '', '\0', '\0', '0', '1495430688863', '2');
INSERT INTO `olpl_job` VALUES ('3', 'EmailMessageDispatcher', 'Email  message  dispatcher', '5000', 'org.jblooming.messaging.EmailMessageDispatcher', '', '\0', '\0', '0', '1495430688845', '3');
INSERT INTO `olpl_job` VALUES ('4', 'StickyMessageDispatcher', 'Sticky  message  dispatcher', '5000', 'com.twproject.messaging.stickyNote.StickyMessageDispatcher', '', '\0', '\0', '0', '1495430688829', '4');
INSERT INTO `olpl_job` VALUES ('5', 'MilestoneEventFinder', 'Milestone  event  finder', '50000', 'com.twproject.messaging.MilestoneEventFinder', '', '\0', '\0', '0', '0', '5');
INSERT INTO `olpl_job` VALUES ('6', 'ExpiredTaskFinder', 'Expired  task  finder', '50000', 'com.twproject.messaging.ExpiredTaskFinder', '', '\0', '\0', '0', '0', '6');
INSERT INTO `olpl_job` VALUES ('7', 'EmailDownloader', 'Email  downloader', '60000', 'com.twproject.messaging.EmailDownloader', '', '\0', '\0', '0', '1495430628910', '7');
INSERT INTO `olpl_job` VALUES ('8', 'AgendaEventFinder', 'Agenda  event  finder', '5000', 'com.twproject.messaging.AgendaEventFinder', '', '\0', '\0', '0', '1495430688719', '8');
INSERT INTO `olpl_job` VALUES ('9', 'OrphanKiller', 'Orphan  killer', '50000', 'com.twproject.messaging.OrphanKiller', '', '', '\0', '0', '0', '9');
INSERT INTO `olpl_job` VALUES ('10', 'BudgetOverflowChecker', 'Budget  overflow  checker', '300000', 'com.twproject.messaging.BudgetOverflowChecker', '', '', '\0', '0', '0', '10');
INSERT INTO `olpl_job` VALUES ('11', 'LicenseUpdater', 'License  updater', '300000', 'com.twproject.security.LicenseUpdater', '', '', '\0', '0', '0', '11');
INSERT INTO `olpl_job` VALUES ('12', 'DigestMessageDispatcher', 'Digest  message  dispatcher', '3600000', 'org.jblooming.messaging.DigestMessageDispatcher', '', '\0', '\0', '0', '0', '12');
INSERT INTO `olpl_job` VALUES ('14', 'CheckForTwprojectUpdates', 'Check  for  twproject  updates', '3600000', 'com.twproject.messaging.CheckForTwprojectUpdates', '', '\0', '\0', '0', '1495090808962', '14');
INSERT INTO `olpl_job` VALUES ('15', 'DataHistoryBuilder', 'Data  history  builder', '50000', 'com.twproject.task.DataHistoryBuilder', '', '', '\0', '0', '0', '15');
INSERT INTO `olpl_job` VALUES ('16', 'IssuesEmailDownloader', 'Issues  email  downloader', '60000', 'com.twproject.task.IssuesEmailDownloader', '', '\0', '\0', '0', '1495430598711', '16');
INSERT INTO `olpl_job` VALUES ('17', 'meetingRoomStatusUpdate', 'meetingRoomStatusUpdate', '5000', 'com.twproject.task.MeetingRoomStatusUpdateJob', '', '\0', '\0', '0', '1495430664189', '23');

-- ----------------------------
-- Table structure for `olpl_job_parameters`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_job_parameters`;
CREATE TABLE `olpl_job_parameters` (
  `job_id` int(11) NOT NULL,
  `valuex` varchar(255) DEFAULT NULL,
  `keyx` varchar(255) NOT NULL,
  PRIMARY KEY (`job_id`,`keyx`),
  KEY `idx_par_job_id` (`job_id`),
  CONSTRAINT `fk_par_job_id` FOREIGN KEY (`job_id`) REFERENCES `olpl_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_job_parameters
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_listener`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_listener`;
CREATE TABLE `olpl_listener` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theClass` varchar(255) NOT NULL,
  `identifiableId` varchar(255) NOT NULL,
  `eventType` varchar(255) DEFAULT NULL,
  `validityStart` datetime DEFAULT NULL,
  `validityEnd` datetime DEFAULT NULL,
  `ownerx` int(11) DEFAULT NULL,
  `media` varchar(255) DEFAULT NULL,
  `body` varchar(4000) DEFAULT NULL,
  `additionalParams` varchar(2000) DEFAULT NULL,
  `oneShot` bit(1) NOT NULL,
  `listenDescendants` bit(1) NOT NULL,
  `lastMatchingDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_list_owner` (`ownerx`),
  CONSTRAINT `fk_list_owner` FOREIGN KEY (`ownerx`) REFERENCES `olpl_operator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_listener
-- ----------------------------
INSERT INTO `olpl_listener` VALUES ('1', 'com.twproject.task.Task', '1', 'TASK_STATUS_CHANGE', null, null, '1', 'DIGEST,STICKY,LOG', null, '', '\0', '', null);
INSERT INTO `olpl_listener` VALUES ('2', 'com.twproject.task.Task', '1', 'TASK_DATE_CHANGE', null, null, '1', 'DIGEST,STICKY,LOG', null, '', '\0', '', null);
INSERT INTO `olpl_listener` VALUES ('3', 'com.twproject.task.Task', '1', 'TASK_MILESTONE_CLOSER', null, null, '1', 'EMAIL,LOG', null, '', '\0', '', null);
INSERT INTO `olpl_listener` VALUES ('4', 'com.twproject.task.Task', '1', 'TASK_EXPIRED', null, null, '1', 'EMAIL,DIGEST,STICKY,LOG', null, '', '\0', '', null);
INSERT INTO `olpl_listener` VALUES ('5', 'com.twproject.task.Task', '1', 'TASK_ISSUE_ADDED', null, null, '1', 'DIGEST,LOG', null, '', '\0', '', '2017-05-22 04:08:48');
INSERT INTO `olpl_listener` VALUES ('6', 'com.twproject.task.Task', '1', 'TASK_ISSUE_CLOSED', null, null, '1', 'DIGEST,LOG', null, '', '\0', '', null);
INSERT INTO `olpl_listener` VALUES ('7', 'com.twproject.task.Task', '1', 'TASK_UPDATED_ISSUE', null, null, '1', 'LOG', null, '', '\0', '', null);
INSERT INTO `olpl_listener` VALUES ('8', 'com.twproject.task.Task', '1', 'TASK_WORKLOG_OVERFLOW', null, null, '1', 'DIGEST,STICKY,LOG', null, '', '\0', '', null);
INSERT INTO `olpl_listener` VALUES ('9', 'com.twproject.task.Task', '1', 'TASK_BUDGET_OVERFLOW', null, null, '1', 'EMAIL,DIGEST,STICKY,LOG', null, '', '\0', '', null);
INSERT INTO `olpl_listener` VALUES ('10', 'com.twproject.task.Task', '1', 'TASK_WORKLOG_MISPLACED', null, null, '1', 'DIGEST,STICKY,LOG', null, '', '\0', '', null);
INSERT INTO `olpl_listener` VALUES ('11', 'com.twproject.task.Task', '1', 'TASK_WORKLOG_OVERTIME', null, null, '1', 'DIGEST,STICKY,LOG', null, '', '\0', '', null);
INSERT INTO `olpl_listener` VALUES ('12', 'com.twproject.task.Task', '1', 'TASK_DIARY_CHANGE', null, null, '1', 'LOG', null, '', '\0', '', null);
INSERT INTO `olpl_listener` VALUES ('13', 'com.twproject.task.Task', '1', 'TASK_CHILD_ADDED', null, null, '1', 'LOG', null, '', '\0', '', null);
INSERT INTO `olpl_listener` VALUES ('14', 'com.twproject.task.Task', '1', 'TASK_DOCUMENT_ADDED', null, null, '1', 'LOG', null, '', '\0', '', null);
INSERT INTO `olpl_listener` VALUES ('15', 'com.twproject.task.Issue', '1', 'ISSUE_CLOSE', null, null, '1', 'EMAIL,DIGEST,STICKY,LOG', null, '', '', '\0', null);
INSERT INTO `olpl_listener` VALUES ('16', 'com.twproject.task.Issue', '2', 'ISSUE_CLOSE', null, null, '1', 'EMAIL,DIGEST,STICKY,LOG', null, '', '', '\0', null);
INSERT INTO `olpl_listener` VALUES ('17', 'com.twproject.task.Issue', '3', 'ISSUE_CLOSE', null, null, '1', 'EMAIL,DIGEST,STICKY,LOG', null, '', '', '\0', null);
INSERT INTO `olpl_listener` VALUES ('18', 'com.twproject.task.Issue', '4', 'ISSUE_CLOSE', null, null, '1', 'EMAIL,DIGEST,STICKY,LOG', null, '', '', '\0', null);
INSERT INTO `olpl_listener` VALUES ('19', 'com.twproject.task.Issue', '5', 'ISSUE_CLOSE', null, null, '1', 'EMAIL,DIGEST,STICKY,LOG', null, '', '', '\0', null);
INSERT INTO `olpl_listener` VALUES ('20', 'com.twproject.task.Issue', '6', 'ISSUE_CLOSE', null, null, '1', 'EMAIL,DIGEST,STICKY,LOG', null, '', '', '\0', null);
INSERT INTO `olpl_listener` VALUES ('21', 'com.twproject.task.Issue', '7', 'ISSUE_CLOSE', null, null, '1', 'EMAIL,DIGEST,STICKY,LOG', null, '', '', '\0', null);
INSERT INTO `olpl_listener` VALUES ('22', 'com.twproject.task.Issue', '8', 'ISSUE_CLOSE', null, null, '1', 'EMAIL,DIGEST,STICKY,LOG', null, '', '', '\0', null);
INSERT INTO `olpl_listener` VALUES ('23', 'com.twproject.task.Issue', '9', 'ISSUE_CLOSE', null, null, '1', 'EMAIL,DIGEST,STICKY,LOG', null, '', '', '\0', null);

-- ----------------------------
-- Table structure for `olpl_location`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_location`;
CREATE TABLE `olpl_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `anagraphicalData` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_loc_anag` (`anagraphicalData`),
  CONSTRAINT `fk_loc_anag` FOREIGN KEY (`anagraphicalData`) REFERENCES `olpl_anagraphicaldata` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_location
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_lookup`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_lookup`;
CREATE TABLE `olpl_lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discriminator` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `intValue` int(11) DEFAULT NULL,
  `areai` int(11) DEFAULT NULL,
  `stringValue` varchar(255) DEFAULT NULL,
  `areas` int(11) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lookupi_area` (`areai`),
  KEY `idx_lookups_area` (`areas`),
  CONSTRAINT `fk_lookupi_area` FOREIGN KEY (`areai`) REFERENCES `olpl_area` (`id`),
  CONSTRAINT `fk_lookups_area` FOREIGN KEY (`areas`) REFERENCES `olpl_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_lookup
-- ----------------------------
INSERT INTO `olpl_lookup` VALUES ('1', 'IssueImpact', 'Light', '30', '1', null, null, null);
INSERT INTO `olpl_lookup` VALUES ('2', 'IssueImpact', 'Medium', '60', '1', null, null, null);
INSERT INTO `olpl_lookup` VALUES ('3', 'IssueImpact', 'Severe', '90', '1', null, null, null);
INSERT INTO `olpl_lookup` VALUES ('4', 'EventType', 'First sample event type', null, null, null, '1', null);
INSERT INTO `olpl_lookup` VALUES ('5', 'EventType', 'Second sample event type', null, null, null, '1', null);
INSERT INTO `olpl_lookup` VALUES ('6', 'CostClassification', 'Travel', null, null, 'TRL', '1', null);
INSERT INTO `olpl_lookup` VALUES ('7', 'CostClassification', 'Stay', null, null, 'STY', '1', null);
INSERT INTO `olpl_lookup` VALUES ('8', 'WLSTS', 'Approved', '1', null, null, null, '#43CF43');
INSERT INTO `olpl_lookup` VALUES ('9', 'WLSTS', 'Billed', '2', null, null, null, '#DA1D33');
INSERT INTO `olpl_lookup` VALUES ('10', 'TaskType', '类型1', null, null, 'type1', '1', null);
INSERT INTO `olpl_lookup` VALUES ('11', 'MeetingRoomType', '大会议室', '1001', '1', null, null, null);
INSERT INTO `olpl_lookup` VALUES ('12', 'MeetingRoomType', '培训室', '1002', '1', null, null, null);
INSERT INTO `olpl_lookup` VALUES ('13', 'IssueType', 'type1', '101', '1', null, null, null);
INSERT INTO `olpl_lookup` VALUES ('14', 'MeetingRoomType', '小会议室', '1003', '1', null, null, null);

-- ----------------------------
-- Table structure for `olpl_message`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_message`;
CREATE TABLE `olpl_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) DEFAULT NULL,
  `messageBodx` longtext,
  `fromOperator` int(11) DEFAULT NULL,
  `toOperator` int(11) DEFAULT NULL,
  `media` varchar(255) DEFAULT NULL,
  `lastTry` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `numberOfTries` int(11) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `received` datetime DEFAULT NULL,
  `readOn` datetime DEFAULT NULL,
  `lastError` varchar(255) DEFAULT NULL,
  `link` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mess_from` (`fromOperator`),
  KEY `idx_mess_to` (`toOperator`),
  KEY `idx_message_media` (`media`),
  KEY `idx_message_read` (`readOn`),
  CONSTRAINT `fk_mess_from` FOREIGN KEY (`fromOperator`) REFERENCES `olpl_operator` (`id`),
  CONSTRAINT `fk_mess_to` FOREIGN KEY (`toOperator`) REFERENCES `olpl_operator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_message
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_op_grp`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_op_grp`;
CREATE TABLE `olpl_op_grp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator` int(11) DEFAULT NULL,
  `groupx` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_op_grp_op` (`operator`),
  KEY `idx_op_grp_groupx` (`groupx`),
  CONSTRAINT `fk_op_grp_groupx` FOREIGN KEY (`groupx`) REFERENCES `olpl_group` (`id`),
  CONSTRAINT `fk_op_grp_op` FOREIGN KEY (`operator`) REFERENCES `olpl_operator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_op_grp
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_op_roles`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_op_roles`;
CREATE TABLE `olpl_op_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator` int(11) DEFAULT NULL,
  `rolex` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_op_role` (`operator`),
  KEY `fk_op_roles_rolex` (`rolex`),
  CONSTRAINT `fk_op_role` FOREIGN KEY (`operator`) REFERENCES `olpl_operator` (`id`),
  CONSTRAINT `fk_op_roles_rolex` FOREIGN KEY (`rolex`) REFERENCES `olpl_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_op_roles
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_operator`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_operator`;
CREATE TABLE `olpl_operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discriminator` varchar(3) NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `hidden` bit(1) NOT NULL,
  `hiddenOn` datetime DEFAULT NULL,
  `hiddenBy` varchar(255) DEFAULT NULL,
  `lastLoggedOn` datetime DEFAULT NULL,
  `authentication` varchar(255) DEFAULT NULL,
  `administrator` bit(1) DEFAULT NULL,
  `loginname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `lpcd` datetime DEFAULT NULL,
  `piq` varchar(255) DEFAULT NULL,
  `pia` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `anagraphicalData` int(11) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `enabledOnlyOn` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `swimmingIn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_operator_name` (`name`),
  KEY `idx_operator_surname` (`surname`),
  KEY `idx_operator_anagraphicalData` (`anagraphicalData`),
  KEY `idx_operator_schedule` (`enabledOnlyOn`),
  KEY `idx_op_owner` (`owner`),
  KEY `idx_op_loco` (`location`),
  CONSTRAINT `fk_operator_anagraphicalData` FOREIGN KEY (`anagraphicalData`) REFERENCES `olpl_anagraphicaldata` (`id`),
  CONSTRAINT `fk_operator_schedule` FOREIGN KEY (`enabledOnlyOn`) REFERENCES `olpl_schedule` (`id`),
  CONSTRAINT `fk_op_loco` FOREIGN KEY (`location`) REFERENCES `olpl_location` (`id`),
  CONSTRAINT `fk_op_owner` FOREIGN KEY (`owner`) REFERENCES `olpl_operator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_operator
-- ----------------------------
INSERT INTO `olpl_operator` VALUES ('1', 'TWO', '2017-05-09 15:43:41', null, 'System Manager', '2017-05-22 05:08:06', '\0', null, null, '2017-05-22 05:08:06', null, '', 'administrator', '6649616c0c2ded2396384b8db2b75135', '2017-05-09 15:43:41', null, null, 'System', 'Manager', null, '', null, null, null, null);

-- ----------------------------
-- Table structure for `olpl_operator_favurls`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_operator_favurls`;
CREATE TABLE `olpl_operator_favurls` (
  `operator_id` int(11) NOT NULL,
  `urlx` longtext,
  `namex` varchar(255) NOT NULL,
  PRIMARY KEY (`operator_id`,`namex`),
  KEY `idx_operator_urls` (`operator_id`),
  CONSTRAINT `fk_operator_urls` FOREIGN KEY (`operator_id`) REFERENCES `olpl_operator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_operator_favurls
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_operator_filt`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_operator_filt`;
CREATE TABLE `olpl_operator_filt` (
  `operator_id` int(11) NOT NULL,
  `filter_val` longtext,
  `filter_key` varchar(255) NOT NULL,
  PRIMARY KEY (`operator_id`,`filter_key`),
  KEY `idx_operator_filt` (`operator_id`),
  CONSTRAINT `fk_operator_filt` FOREIGN KEY (`operator_id`) REFERENCES `olpl_operator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_operator_filt
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_operator_lpl`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_operator_lpl`;
CREATE TABLE `olpl_operator_lpl` (
  `op_id` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lplorder` int(11) NOT NULL,
  PRIMARY KEY (`op_id`,`lplorder`),
  KEY `idx_operator_lpl` (`op_id`),
  CONSTRAINT `fk_operator_lpl` FOREIGN KEY (`op_id`) REFERENCES `olpl_operator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_operator_lpl
-- ----------------------------
INSERT INTO `olpl_operator_lpl` VALUES ('1', '97c6e41cd018e207d10635d14cf4d473', '0');

-- ----------------------------
-- Table structure for `olpl_operator_opt`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_operator_opt`;
CREATE TABLE `olpl_operator_opt` (
  `operator_id` int(11) NOT NULL,
  `value_tw` longtext,
  `option_tw` varchar(255) NOT NULL,
  PRIMARY KEY (`operator_id`,`option_tw`),
  KEY `idx_operator_opt` (`operator_id`),
  CONSTRAINT `fk_operator_opt` FOREIGN KEY (`operator_id`) REFERENCES `olpl_operator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_operator_opt
-- ----------------------------
INSERT INTO `olpl_operator_opt` VALUES ('1', '0', 'ASSIG_SHOW_HORIZON');
INSERT INTO `olpl_operator_opt` VALUES ('1', 'no', 'ASSIG_SHOW_NOTACTIVE');
INSERT INTO `olpl_operator_opt` VALUES ('1', 'no', 'ASSIG_SHOW_NOTACTIVETASKS');
INSERT INTO `olpl_operator_opt` VALUES ('1', '02_GRAVITY_MEDIUM', 'GRAVITY');
INSERT INTO `olpl_operator_opt` VALUES ('1', 'yes', 'HINT_FIRST_SUBTASK');
INSERT INTO `olpl_operator_opt` VALUES ('1', 'HIT_ORDER_BY_STAT', 'HIT_ORDER_BY');
INSERT INTO `olpl_operator_opt` VALUES ('1', 'yes', 'HIT_SHOW_BOARD');
INSERT INTO `olpl_operator_opt` VALUES ('1', 'yes', 'HIT_SHOW_DOCUMENTS');
INSERT INTO `olpl_operator_opt` VALUES ('1', 'yes', 'HIT_SHOW_EVENT');
INSERT INTO `olpl_operator_opt` VALUES ('1', 'yes', 'HIT_SHOW_FORUM');
INSERT INTO `olpl_operator_opt` VALUES ('1', 'yes', 'HIT_SHOW_ISSUES');
INSERT INTO `olpl_operator_opt` VALUES ('1', 'yes', 'HIT_SHOW_MEETING');
INSERT INTO `olpl_operator_opt` VALUES ('1', 'yes', 'HIT_SHOW_RESOURCES');
INSERT INTO `olpl_operator_opt` VALUES ('1', 'yes', 'HIT_SHOW_TASKS');
INSERT INTO `olpl_operator_opt` VALUES ('1', 'getsThingsDone.page', 'HOME_PAGE');
INSERT INTO `olpl_operator_opt` VALUES ('1', '02_GRAVITY_MEDIUM', 'ISSUE_GRAVITY');
INSERT INTO `olpl_operator_opt` VALUES ('1', '05_GRAVITY_BLOCK', 'ISSUE_GRAVITY_ALL');
INSERT INTO `olpl_operator_opt` VALUES ('1', '1', 'ISSUE_STATUS');
INSERT INTO `olpl_operator_opt` VALUES ('1', '1', 'ISSUE_STATUS_ALL');
INSERT INTO `olpl_operator_opt` VALUES ('1', '1', 'ISSUE_TASK');
INSERT INTO `olpl_operator_opt` VALUES ('1', '0', 'MAX_DOCUMENT_AGE_IN_DAYS');
INSERT INTO `olpl_operator_opt` VALUES ('1', '8', 'MAX_ISSUES_DISPLAY');
INSERT INTO `olpl_operator_opt` VALUES ('1', '8', 'MAX_MY_ISSUES_DISPLAY');
INSERT INTO `olpl_operator_opt` VALUES ('1', '1', 'OVERDUE_ERR');
INSERT INTO `olpl_operator_opt` VALUES ('1', '3', 'OVERDUE_WARN');
INSERT INTO `olpl_operator_opt` VALUES ('1', 'yes', 'SHOW_ALSO_DEP');
INSERT INTO `olpl_operator_opt` VALUES ('1', 'no', 'SHOW_ONLY_INBOX');
INSERT INTO `olpl_operator_opt` VALUES ('1', '1', 'STATUS');
INSERT INTO `olpl_operator_opt` VALUES ('1', 'no', 'TASK_SHOW_CHILDREN');
INSERT INTO `olpl_operator_opt` VALUES ('1', 'no', 'TASK_SHOW_COSTS');

-- ----------------------------
-- Table structure for `olpl_persistenttext`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_persistenttext`;
CREATE TABLE `olpl_persistenttext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_persistenttext
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_role`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_role`;
CREATE TABLE `olpl_role` (
  `id` varchar(15) NOT NULL,
  `discriminator` varchar(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `permissionIds` varchar(2000) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `localToAssignment` bit(1) DEFAULT NULL,
  `defsubscript` varchar(2000) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_area` (`area`),
  CONSTRAINT `fk_role_area` FOREIGN KEY (`area`) REFERENCES `olpl_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_role
-- ----------------------------
INSERT INTO `olpl_role` VALUES ('1', 'T', 'Area manager', 'Has complete control on the area.', 'TW_filStoEx_r|TW_tk_cost_c|TW_task_c|TW_filStoEx_w|PL_role_canRead|TW_board_w|TW_ass_man|PL_area_canManage|TW_issue_c|TW_wl_man|TW_ass_crw|TW_task_r|TW_res_cstiu|TW_issue_r|TW_task_w|TW_issue_w|TW_clTree_m|TW_tk_cost_w|TW_res_w|TW_doc_w|TW_fileStor_r|TW_board_c|TW_res_r|TW_board_r|TW_exp_man|TW_doc_c|TW_res_c|TW_doc_r|PL_role_canCreate|PL_role_canWrite|TW_tk_cost_r|TW_filStoEx_c', '2017-05-16 09:43:49', null, null, '2017-05-16 09:43:49', 'AM', '\0', '', '1');
INSERT INTO `olpl_role` VALUES ('2', 'T', 'Supervisor', 'Can read everything and comment on the project and its descendants on which she/he has been assigned.', 'TW_board_r|TW_fileStor_r|TW_task_r|TW_board_c|TW_board_w|TW_doc_r|TW_res_r|TW_issue_r|TW_tk_cost_r', '2017-05-16 09:43:49', null, null, '2017-05-16 09:43:49', 'SU', '\0', '', '1');
INSERT INTO `olpl_role` VALUES ('3', 'T', 'Project launcher', 'Can create a new project and assign a PM.', 'TW_board_r|TW_task_c|TW_board_w|TW_res_r', '2017-05-16 09:43:49', null, null, '2017-05-16 09:43:49', 'PL', '\0', '', '1');
INSERT INTO `olpl_role` VALUES ('4', 'T', 'Operational', 'Minimal standard permission for an operator.', 'TW_board_r|TW_board_w|TW_res_r', '2017-05-16 09:43:49', null, null, '2017-05-16 09:43:49', 'OP', '\0', '', '1');
INSERT INTO `olpl_role` VALUES ('5', 'T', 'Project manager', 'Can manage the project and its descendants on which she/he has been assigned.', 'TW_tk_cost_w|TW_res_w|TW_filStoEx_r|TW_doc_w|TW_tk_cost_c|TW_task_c|TW_filStoEx_w|TW_res_r|TW_issue_c|TW_ass_man|TW_wl_man|TW_exp_man|TW_ass_crw|TW_doc_c|TW_task_r|TW_res_c|TW_doc_r|TW_issue_r|TW_task_w|TW_tk_cost_r|TW_filStoEx_c|TW_issue_w', '2017-05-16 09:43:50', null, null, '2017-05-16 09:43:50', 'PM', '', 'TASK_DIARY_CHANGE_LOG~~yes$~$TASK_STATUS_CHANGE_DIGEST~~yes$~$TASK_EXPIRED_LOG~~yes$~$TASK_EXPIRED_EMAIL~~yes$~$TASK_BUDGET_OVERFLOW_DIGEST~~yes$~$TASK_ISSUE_ADDED_LOG~~yes$~$TASK_WORKLOG_MISPLACED_LOG~~yes$~$TASK_WORKLOG_OVERTIME_LOG~~yes$~$TASK_WORKLOG_OVERFLOW_DIGEST~~yes$~$TASK_ISSUE_CLOSED_DIGEST~~yes$~$TASK_MILESTONE_CLOSER_LOG~~yes$~$TASK_WORKLOG_OVERTIME_STICKY~~yes$~$TASK_CHILD_ADDED_LOG~~yes$~$TASK_UPDATED_ISSUE_LOG~~yes$~$TASK_BUDGET_OVERFLOW_STICKY~~yes$~$TASK_DATE_CHANGE_LOG~~yes$~$TASK_NOTIFY_DESC~~yes$~$TASK_DATE_CHANGE_STICKY~~yes$~$TASK_EXPIRED_STICKY~~yes$~$TASK_STATUS_CHANGE_LOG~~yes$~$TASK_MILESTONE_CLOSER_EMAIL~~yes$~$TASK_EXPIRED_DIGEST~~yes$~$TASK_ISSUE_CLOSED_LOG~~yes$~$TASK_WORKLOG_OVERTIME_DIGEST~~yes$~$TASK_WORKLOG_MISPLACED_DIGEST~~yes$~$TASK_DATE_CHANGE_DIGEST~~yes$~$TASK_ISSUE_ADDED_DIGEST~~yes$~$TASK_WORKLOG_OVERFLOW_LOG~~yes$~$TASK_BUDGET_OVERFLOW_LOG~~yes$~$TASK_WORKLOG_MISPLACED_STICKY~~yes$~$TASK_DOCUMENT_ADDED_LOG~~yes$~$TASK_STATUS_CHANGE_STICKY~~yes$~$TASK_WORKLOG_OVERFLOW_STICKY~~yes$~$TASK_BUDGET_OVERFLOW_EMAIL~~yes', '1');
INSERT INTO `olpl_role` VALUES ('6', 'T', 'Stakeholder', 'Can read and signal issues on the project and its descendants on which she/he has been assigned.', 'TW_filStoEx_r|TW_task_r|TW_issue_c|TW_issue_r|TW_issue_w', '2017-05-16 09:43:50', null, null, '2017-05-16 09:43:50', 'SH', '', 'TASK_EXPIRED_LOG~~yes$~$TASK_MILESTONE_CLOSER_LOG~~yes$~$TASK_STATUS_CHANGE_LOG~~yes$~$TASK_MILESTONE_CLOSER_EMAIL~~yes$~$TASK_EXPIRED_EMAIL~~yes', '1');
INSERT INTO `olpl_role` VALUES ('7', 'T', 'Customer', 'Can read and signal issues on the project and its descendants on which she/he has been assigned.', 'TW_filStoEx_r|TW_task_r|TW_issue_c|TW_issue_r|TW_issue_w', '2017-05-16 09:43:50', null, null, '2017-05-16 09:43:50', 'CU', '', 'TASK_EXPIRED_LOG~~yes$~$TASK_MILESTONE_CLOSER_LOG~~yes$~$TASK_STATUS_CHANGE_LOG~~yes$~$TASK_MILESTONE_CLOSER_EMAIL~~yes$~$TASK_EXPIRED_EMAIL~~yes', '1');
INSERT INTO `olpl_role` VALUES ('8', 'T', 'Worker', 'Can work (e.g. insert worklog, manage issues and documents) on the project and its descendants on which she/he has been assigned.', 'TW_filStoEx_r|TW_doc_w|TW_doc_c|TW_task_r|TW_doc_r|TW_res_r|TW_issue_c|TW_issue_r|TW_issue_w', '2017-05-16 09:43:50', null, null, '2017-05-16 09:43:50', 'WK', '', 'TASK_NOTIFY_DESC~~yes$~$TASK_DIARY_CHANGE_LOG~~yes$~$TASK_EXPIRED_LOG~~yes$~$TASK_STATUS_CHANGE_DIGEST~~yes$~$TASK_DATE_CHANGE_STICKY~~yes$~$TASK_EXPIRED_STICKY~~yes$~$TASK_STATUS_CHANGE_LOG~~yes$~$TASK_EXPIRED_EMAIL~~yes$~$TASK_MILESTONE_CLOSER_EMAIL~~yes$~$TASK_ISSUE_ADDED_LOG~~yes$~$TASK_ISSUE_CLOSED_LOG~~yes$~$TASK_DATE_CHANGE_DIGEST~~yes$~$TASK_ISSUE_CLOSED_DIGEST~~yes$~$TASK_ISSUE_ADDED_DIGEST~~yes$~$TASK_MILESTONE_CLOSER_LOG~~yes$~$TASK_UPDATED_ISSUE_LOG~~yes$~$TASK_STATUS_CHANGE_STICKY~~yes$~$TASK_DATE_CHANGE_LOG~~yes', '1');

-- ----------------------------
-- Table structure for `olpl_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_schedule`;
CREATE TABLE `olpl_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discriminator` varchar(1) NOT NULL,
  `startx` datetime DEFAULT NULL,
  `endx` datetime DEFAULT NULL,
  `startTime` int(11) DEFAULT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `freq` int(11) DEFAULT NULL,
  `repeatx` int(11) DEFAULT NULL,
  `onlyWorkingDays` bit(1) DEFAULT NULL,
  `dayOfWeek` int(11) DEFAULT NULL,
  `weekOfMonth` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_schedule
-- ----------------------------
INSERT INTO `olpl_schedule` VALUES ('1', 'U', '2017-05-16 15:43:42', '2969-05-03 15:43:44', '56621847', '2000', '5', '0', '\0', null, null);
INSERT INTO `olpl_schedule` VALUES ('2', 'U', '2017-05-16 15:43:42', '2969-05-03 15:43:47', '56621860', '5000', '1', '0', '\0', null, null);
INSERT INTO `olpl_schedule` VALUES ('3', 'U', '2017-05-16 15:43:42', '2969-05-03 15:43:47', '56621986', '5000', '1', '0', '\0', null, null);
INSERT INTO `olpl_schedule` VALUES ('4', 'U', '2017-05-16 15:43:42', '2969-05-03 15:43:47', '56622232', '5000', '1', '0', '\0', null, null);
INSERT INTO `olpl_schedule` VALUES ('5', 'U', '2017-05-16 15:43:42', '2969-05-03 15:44:32', '56622251', '50000', '720', '0', '\0', null, null);
INSERT INTO `olpl_schedule` VALUES ('6', 'U', '2017-05-16 15:43:42', '2969-05-03 15:44:32', '56622269', '50000', '720', '0', '\0', null, null);
INSERT INTO `olpl_schedule` VALUES ('7', 'U', '2017-05-16 15:43:42', '2969-05-03 15:44:42', '56622288', '60000', '5', '0', '\0', null, null);
INSERT INTO `olpl_schedule` VALUES ('8', 'U', '2017-05-16 15:43:42', '2969-05-03 15:43:47', '56622321', '5000', '1', '0', '\0', null, null);
INSERT INTO `olpl_schedule` VALUES ('9', 'D', '2017-05-17 00:00:00', '2969-05-03 00:00:50', '0', '50000', '1', '0', '\0', null, null);
INSERT INTO `olpl_schedule` VALUES ('10', 'D', '2017-05-17 00:10:00', '2969-05-03 00:10:50', '600000', '50000', '1', '0', '\0', null, null);
INSERT INTO `olpl_schedule` VALUES ('11', 'D', '2017-05-17 00:35:00', '2969-05-03 00:35:50', '2100000', '50000', '1', '0', '\0', null, null);
INSERT INTO `olpl_schedule` VALUES ('12', 'W', '2017-05-22 03:00:00', '2969-05-03 04:00:00', '10800000', '3600000', '1', '0', null, null, null);
INSERT INTO `olpl_schedule` VALUES ('13', 'W', '2017-05-19 16:00:00', '2969-05-03 17:00:00', '57600000', '3600000', '1', '0', null, null, null);
INSERT INTO `olpl_schedule` VALUES ('14', 'W', '2017-05-18 15:00:00', '2969-05-03 16:00:00', '54000000', '3600000', '1', '0', null, null, null);
INSERT INTO `olpl_schedule` VALUES ('15', 'D', '2017-05-17 00:20:00', '2969-05-03 00:20:50', '1200000', '50000', '1', '0', '\0', null, null);
INSERT INTO `olpl_schedule` VALUES ('16', 'U', '2017-05-16 16:08:10', '2969-05-03 16:09:10', '58089632', '60000', '5', '0', '\0', null, null);
INSERT INTO `olpl_schedule` VALUES ('17', 'P', '2017-05-17 00:00:00', '2017-06-01 00:00:00', '0', '1295999998', null, null, null, null, null);
INSERT INTO `olpl_schedule` VALUES ('23', 'U', '2017-05-21 04:43:00', '2017-05-21 05:43:00', '16980000', '3600000', '1', '1', '\0', null, null);

-- ----------------------------
-- Table structure for `olpl_somehappen`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_somehappen`;
CREATE TABLE `olpl_somehappen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageParams` varchar(2000) DEFAULT NULL,
  `theClass` varchar(255) NOT NULL,
  `identifiableId` varchar(255) NOT NULL,
  `eventType` varchar(255) DEFAULT NULL,
  `happenedAt` datetime DEFAULT NULL,
  `happeningExpiryDate` datetime DEFAULT NULL,
  `messageTemplate` varchar(2000) DEFAULT NULL,
  `link` varchar(2000) DEFAULT NULL,
  `whoCausedTheEvent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_whoCausedTheEvent` (`whoCausedTheEvent`),
  CONSTRAINT `fk_whoCausedTheEvent` FOREIGN KEY (`whoCausedTheEvent`) REFERENCES `olpl_operator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_somehappen
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_wkl_sched_days`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_wkl_sched_days`;
CREATE TABLE `olpl_wkl_sched_days` (
  `sch_id` int(11) NOT NULL,
  `day` int(11) DEFAULT NULL,
  `pos` int(11) NOT NULL,
  PRIMARY KEY (`sch_id`,`pos`),
  KEY `idx_schw_id` (`sch_id`),
  CONSTRAINT `fk_schw_id` FOREIGN KEY (`sch_id`) REFERENCES `olpl_schedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_wkl_sched_days
-- ----------------------------
INSERT INTO `olpl_wkl_sched_days` VALUES ('12', '2', '0');
INSERT INTO `olpl_wkl_sched_days` VALUES ('13', '6', '0');
INSERT INTO `olpl_wkl_sched_days` VALUES ('14', '5', '0');

-- ----------------------------
-- Table structure for `olpl_ws_content`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_ws_content`;
CREATE TABLE `olpl_ws_content` (
  `id` varchar(15) NOT NULL,
  `operator` int(11) DEFAULT NULL,
  `portlet_id` varchar(15) DEFAULT NULL,
  `wspage_id` varchar(15) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `orderx` int(11) DEFAULT NULL,
  `defaultConfiguration` bit(1) NOT NULL,
  `globalAssociation` bit(1) NOT NULL,
  `portletParams` varchar(2000) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_content_operator` (`operator`),
  KEY `idx_content_portlet` (`portlet_id`),
  KEY `idx_content_webpage` (`wspage_id`),
  CONSTRAINT `fk_content_operator` FOREIGN KEY (`operator`) REFERENCES `olpl_operator` (`id`),
  CONSTRAINT `fk_content_portlet` FOREIGN KEY (`portlet_id`) REFERENCES `olpl_ws_portlet` (`id`),
  CONSTRAINT `fk_content_webpage` FOREIGN KEY (`wspage_id`) REFERENCES `olpl_ws_page` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_ws_content
-- ----------------------------
INSERT INTO `olpl_ws_content` VALUES ('1', null, '4', '1', 'HEADER', '0', '', '\0', '', '2017-05-16 09:43:54', null, null, '2017-05-16 09:43:54');
INSERT INTO `olpl_ws_content` VALUES ('10', null, '12', '2', 'LEFT', '1', '', '\0', '', '2017-05-16 09:43:54', null, null, '2017-05-16 09:43:54');
INSERT INTO `olpl_ws_content` VALUES ('11', null, '13', '2', 'LEFT', '2', '', '\0', '', '2017-05-16 09:43:54', null, null, '2017-05-16 09:43:54');
INSERT INTO `olpl_ws_content` VALUES ('12', null, '9', '2', 'RIGHT', '3', '', '\0', '', '2017-05-16 09:43:54', null, null, '2017-05-16 09:43:54');
INSERT INTO `olpl_ws_content` VALUES ('13', null, '27', '2', 'RIGHT', '4', '', '\0', '', '2017-05-16 09:43:54', null, null, '2017-05-16 09:43:54');
INSERT INTO `olpl_ws_content` VALUES ('14', null, '26', '2', 'RIGHT', '5', '', '\0', '', '2017-05-16 09:43:54', null, null, '2017-05-16 09:43:54');
INSERT INTO `olpl_ws_content` VALUES ('15', null, '24', '2', 'RIGHT', '6', '', '\0', '', '2017-05-16 09:43:56', null, null, '2017-05-16 09:43:56');
INSERT INTO `olpl_ws_content` VALUES ('16', null, '3', '2', 'RIGHT', '7', '', '\0', '', '2017-05-16 09:43:56', null, null, '2017-05-16 09:43:56');
INSERT INTO `olpl_ws_content` VALUES ('17', null, '11', '2', 'RIGHT_BOTTOM', '8', '', '\0', '', '2017-05-16 09:43:56', null, null, '2017-05-16 09:43:56');
INSERT INTO `olpl_ws_content` VALUES ('18', null, '15', '2', 'BOTTOM', '9', '', '\0', '', '2017-05-16 09:43:56', null, null, '2017-05-16 09:43:56');
INSERT INTO `olpl_ws_content` VALUES ('19', null, '4', '3', 'HEADER', '0', '', '\0', '', '2017-05-16 09:43:56', null, null, '2017-05-16 09:43:56');
INSERT INTO `olpl_ws_content` VALUES ('2', null, '1', '1', 'LEFT', '1', '', '\0', '', '2017-05-16 09:43:54', null, null, '2017-05-16 09:43:54');
INSERT INTO `olpl_ws_content` VALUES ('20', null, '12', '3', 'LEFT', '1', '', '\0', '', '2017-05-16 09:43:56', null, null, '2017-05-16 09:43:56');
INSERT INTO `olpl_ws_content` VALUES ('21', null, '13', '3', 'LEFT', '2', '', '\0', '', '2017-05-16 09:43:56', null, null, '2017-05-16 09:43:56');
INSERT INTO `olpl_ws_content` VALUES ('22', null, '9', '3', 'RIGHT', '3', '', '\0', '', '2017-05-16 09:43:56', null, null, '2017-05-16 09:43:56');
INSERT INTO `olpl_ws_content` VALUES ('23', null, '27', '3', 'RIGHT', '4', '', '\0', '', '2017-05-16 09:43:56', null, null, '2017-05-16 09:43:56');
INSERT INTO `olpl_ws_content` VALUES ('24', null, '24', '3', 'RIGHT', '5', '', '\0', '', '2017-05-16 09:43:56', null, null, '2017-05-16 09:43:56');
INSERT INTO `olpl_ws_content` VALUES ('25', null, '26', '3', 'RIGHT', '6', '', '\0', '', '2017-05-16 09:43:56', null, null, '2017-05-16 09:43:56');
INSERT INTO `olpl_ws_content` VALUES ('26', null, '3', '3', 'RIGHT', '7', '', '\0', '', '2017-05-16 09:43:57', null, null, '2017-05-16 09:43:57');
INSERT INTO `olpl_ws_content` VALUES ('27', null, '16', '3', 'RIGHT', '8', '', '\0', '', '2017-05-16 09:43:57', null, null, '2017-05-16 09:43:57');
INSERT INTO `olpl_ws_content` VALUES ('28', null, '19', '3', 'RIGHT', '9', '', '\0', '', '2017-05-16 09:43:57', null, null, '2017-05-16 09:43:57');
INSERT INTO `olpl_ws_content` VALUES ('29', null, '11', '3', 'RIGHT_BOTTOM', '10', '', '\0', '', '2017-05-16 09:43:57', null, null, '2017-05-16 09:43:57');
INSERT INTO `olpl_ws_content` VALUES ('3', null, '2', '1', 'LEFT', '2', '', '\0', '', '2017-05-16 09:43:54', null, null, '2017-05-16 09:43:54');
INSERT INTO `olpl_ws_content` VALUES ('30', null, '15', '3', 'BOTTOM', '11', '', '\0', '', '2017-05-16 09:43:57', null, null, '2017-05-16 09:43:57');
INSERT INTO `olpl_ws_content` VALUES ('31', null, '4', '4', 'HEADER', '0', '', '\0', '', '2017-05-16 09:43:57', null, null, '2017-05-16 09:43:57');
INSERT INTO `olpl_ws_content` VALUES ('32', null, '22', '4', 'MAIN', '1', '', '\0', '', '2017-05-16 09:43:57', null, null, '2017-05-16 09:43:57');
INSERT INTO `olpl_ws_content` VALUES ('33', null, '14', '4', 'MAIN', '2', '', '\0', '', '2017-05-16 09:43:57', null, null, '2017-05-16 09:43:57');
INSERT INTO `olpl_ws_content` VALUES ('34', null, '15', '4', 'MAIN_BOTTOM', '3', '', '\0', '', '2017-05-16 09:43:57', null, null, '2017-05-16 09:43:57');
INSERT INTO `olpl_ws_content` VALUES ('4', null, '9', '1', 'RIGHT', '3', '', '\0', '', '2017-05-16 09:43:54', null, null, '2017-05-16 09:43:54');
INSERT INTO `olpl_ws_content` VALUES ('48', '1', '28', '2', 'LEFT', '0', '\0', '\0', '', '2017-05-17 11:00:01', 'System Manager', 'System Manager', '2017-05-17 11:00:01');
INSERT INTO `olpl_ws_content` VALUES ('49', '1', '1', '2', 'RIGHT', '0', '\0', '\0', '', '2017-05-17 11:00:01', 'System Manager', 'System Manager', '2017-05-17 11:00:01');
INSERT INTO `olpl_ws_content` VALUES ('5', null, '24', '1', 'RIGHT', '4', '', '\0', '', '2017-05-16 09:43:54', null, null, '2017-05-16 09:43:54');
INSERT INTO `olpl_ws_content` VALUES ('6', null, '3', '1', 'RIGHT', '5', '', '\0', '', '2017-05-16 09:43:54', null, null, '2017-05-16 09:43:54');
INSERT INTO `olpl_ws_content` VALUES ('7', null, '11', '1', 'RIGHT_BOTTOM', '6', '', '\0', '', '2017-05-16 09:43:54', null, null, '2017-05-16 09:43:54');
INSERT INTO `olpl_ws_content` VALUES ('8', null, '15', '1', 'BOTTOM', '7', '', '\0', '', '2017-05-16 09:43:54', null, null, '2017-05-16 09:43:54');
INSERT INTO `olpl_ws_content` VALUES ('9', null, '4', '2', 'HEADER', '0', '', '\0', '', '2017-05-16 09:43:54', null, null, '2017-05-16 09:43:54');

-- ----------------------------
-- Table structure for `olpl_ws_forum`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_ws_forum`;
CREATE TABLE `olpl_ws_forum` (
  `discriminator` varchar(31) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creationDate` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `hidden` bit(1) DEFAULT NULL,
  `hiddenBy` varchar(255) DEFAULT NULL,
  `hiddenOn` datetime DEFAULT NULL,
  `ancestorIds` varchar(255) DEFAULT NULL,
  `inherit` bit(1) NOT NULL,
  `propagate` bit(1) NOT NULL,
  `active` bit(1) NOT NULL,
  `contentx` longtext,
  `hitsx` int(11) DEFAULT NULL,
  `lastpost` datetime DEFAULT NULL,
  `lastposter` varchar(255) DEFAULT NULL,
  `orderx` int(11) DEFAULT NULL,
  `writetologged` bit(1) DEFAULT NULL,
  `writetoall` bit(1) DEFAULT NULL,
  `postedOn` datetime DEFAULT NULL,
  `privateForum` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `task` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_forum_operator` (`author`),
  KEY `fk_forum_parent` (`parent`),
  KEY `fk_forum_task` (`task`),
  CONSTRAINT `fk_forum_operator` FOREIGN KEY (`author`) REFERENCES `olpl_operator` (`id`),
  CONSTRAINT `fk_forum_parent` FOREIGN KEY (`parent`) REFERENCES `olpl_ws_forum` (`id`),
  CONSTRAINT `fk_forum_task` FOREIGN KEY (`task`) REFERENCES `twk_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_ws_forum
-- ----------------------------

-- ----------------------------
-- Table structure for `olpl_ws_news`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_ws_news`;
CREATE TABLE `olpl_ws_news` (
  `id` varchar(15) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subTitle` varchar(255) DEFAULT NULL,
  `text` varchar(3000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `orderFactor` int(11) DEFAULT NULL,
  `imageWidth` int(11) DEFAULT NULL,
  `imageHeight` int(11) DEFAULT NULL,
  `startingDate` datetime DEFAULT NULL,
  `endingDate` datetime DEFAULT NULL,
  `visible` bit(1) NOT NULL,
  `ownerx` int(11) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_news_owner` (`ownerx`),
  CONSTRAINT `fk_news_owner` FOREIGN KEY (`ownerx`) REFERENCES `olpl_operator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_ws_news
-- ----------------------------
INSERT INTO `olpl_ws_news` VALUES ('1', 'Twproject running on your server', null, 'Now you can manage work with a powerful tool.', null, null, '0', '0', '2017-05-16 09:43:50', '2017-07-04 09:43:50', '', null, '2017-05-16 09:43:50', null, null, '2017-05-16 09:43:50');

-- ----------------------------
-- Table structure for `olpl_ws_page`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_ws_page`;
CREATE TABLE `olpl_ws_page` (
  `id` varchar(15) NOT NULL,
  `discriminator` varchar(3) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `frontOfficeTitle` varchar(255) DEFAULT NULL,
  `relativeUrl` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(2000) DEFAULT NULL,
  `customizable` bit(1) NOT NULL,
  `active` bit(1) NOT NULL,
  `def_template` varchar(15) DEFAULT NULL,
  `ownerx` int(11) DEFAULT NULL,
  `permissionIds` varchar(2000) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_page_name` (`name`),
  KEY `idx_wspage_template` (`def_template`),
  KEY `idx_wspage_owner` (`ownerx`),
  KEY `idx_wspage_area` (`area`),
  CONSTRAINT `fk_wspage_area` FOREIGN KEY (`area`) REFERENCES `olpl_area` (`id`),
  CONSTRAINT `fk_wspage_owner` FOREIGN KEY (`ownerx`) REFERENCES `olpl_operator` (`id`),
  CONSTRAINT `fk_wspage_template` FOREIGN KEY (`def_template`) REFERENCES `olpl_ws_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_ws_page
-- ----------------------------
INSERT INTO `olpl_ws_page` VALUES ('1', 'WSP', 'helpDesk', 'Help Desk', null, 'DESC_PAGE_HELPDESK', null, '', '', '1', null, '', '2017-05-16 09:43:53', null, null, '2017-05-16 09:43:53', null);
INSERT INTO `olpl_ws_page` VALUES ('2', 'WSP', 'getsThingsDone', 'Get things done', null, 'DESC_PAGE_GETSTHINGSDONE', null, '', '', '1', null, '', '2017-05-16 09:43:54', null, null, '2017-05-16 09:43:54', null);
INSERT INTO `olpl_ws_page` VALUES ('3', 'WSP', 'pm', 'Project Manager', null, 'DESC_PAGE_PM', null, '', '', '1', null, '', '2017-05-16 09:43:56', null, null, '2017-05-16 09:43:56', null);
INSERT INTO `olpl_ws_page` VALUES ('4', 'WSP', 'supervisor', 'Supervisor', null, 'DESC_PAGE_SUPERVISOR', null, '', '', '2', null, '', '2017-05-16 09:43:57', null, null, '2017-05-16 09:43:57', null);

-- ----------------------------
-- Table structure for `olpl_ws_portlet`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_ws_portlet`;
CREATE TABLE `olpl_ws_portlet` (
  `id` varchar(15) NOT NULL,
  `discriminator` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `filex` varchar(255) NOT NULL,
  `pixelWidth` int(11) DEFAULT NULL,
  `pixelHeight` int(11) DEFAULT NULL,
  `installed` bit(1) NOT NULL,
  `scrollbar` bit(1) NOT NULL,
  `params` varchar(2000) DEFAULT NULL,
  `ownerx` int(11) DEFAULT NULL,
  `permissionIds` varchar(2000) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_portlet_owner` (`ownerx`),
  CONSTRAINT `fk_portlet_owner` FOREIGN KEY (`ownerx`) REFERENCES `olpl_operator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_ws_portlet
-- ----------------------------
INSERT INTO `olpl_ws_portlet` VALUES ('1', 'PLT', 'Create an issue', 'Create an issue', 'WF_0_applications/teamwork/portal/portlet/wp_create_issues.jsp+++applications/teamwork/portal/portlet/wp_create_issues.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:51', null, null, '2017-05-16 09:43:51');
INSERT INTO `olpl_ws_portlet` VALUES ('10', 'PLT', 'My meetings', 'My meetings', 'WF_0_applications/teamwork/portal/portlet/wp_myMeetings.jsp+++applications/teamwork/portal/portlet/wp_myMeetings.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:52', null, null, '2017-05-16 09:43:52');
INSERT INTO `olpl_ws_portlet` VALUES ('11', 'PLT', 'Company News', 'Company News', 'WF_0_applications/teamwork/portal/portlet/wp_companyNews.jsp+++applications/teamwork/portal/portlet/wp_companyNews.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:52', null, null, '2017-05-16 09:43:52');
INSERT INTO `olpl_ws_portlet` VALUES ('12', 'PLT', 'My Assignments', 'My Assignments', 'WF_0_applications/teamwork/portal/portlet/wp_myAssignments.jsp+++applications/teamwork/portal/portlet/wp_myAssignments.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:52', null, null, '2017-05-16 09:43:52');
INSERT INTO `olpl_ws_portlet` VALUES ('13', 'PLT', 'My Issues', 'My Issues', 'WF_0_applications/teamwork/portal/portlet/wp_myIssues.jsp+++applications/teamwork/portal/portlet/wp_myIssues.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:52', null, null, '2017-05-16 09:43:52');
INSERT INTO `olpl_ws_portlet` VALUES ('14', 'PLT', 'Projects Summary', 'Projects Summary', 'WF_0_applications/teamwork/portal/portlet/wp_projectsSummary.jsp+++applications/teamwork/portal/portlet/wp_projectsSummary.jsp', '0', '0', '', '', '', null, 'TW_task_r', '2017-05-16 09:43:52', null, null, '2017-05-16 09:43:52');
INSERT INTO `olpl_ws_portlet` VALUES ('15', 'PLT', 'Summary Bar', 'Summary Bar', 'WF_0_applications/teamwork/portal/portlet/wp_summaryBar.jsp+++applications/teamwork/portal/portlet/wp_summaryBar.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:52', null, null, '2017-05-16 09:43:52');
INSERT INTO `olpl_ws_portlet` VALUES ('16', 'PLT', 'Twproject Activity', 'Twproject Activity', 'WF_0_applications/teamwork/portal/portlet/wp_teamworkActivity.jsp+++applications/teamwork/portal/portlet/wp_teamworkActivity.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:53', null, null, '2017-05-16 09:43:53');
INSERT INTO `olpl_ws_portlet` VALUES ('17', 'PLT', 'links', 'links', 'WF_0_applications/teamwork/portal/portlet/wp_links.jsp+++applications/teamwork/portal/portlet/wp_links.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:53', null, null, '2017-05-16 09:43:53');
INSERT INTO `olpl_ws_portlet` VALUES ('18', 'PLT', 'WorklogDay', 'WorklogDay', 'WF_0_applications/teamwork/portal/portlet/wp_worklogDay.jsp+++applications/teamwork/portal/portlet/wp_worklogDay.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:53', null, null, '2017-05-16 09:43:53');
INSERT INTO `olpl_ws_portlet` VALUES ('19', 'PLT', 'My responsibilities', 'My responsibilities', 'WF_0_applications/teamwork/portal/portlet/wp_myResponsabilities.jsp+++applications/teamwork/portal/portlet/wp_myResponsabilities.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:53', null, null, '2017-05-16 09:43:53');
INSERT INTO `olpl_ws_portlet` VALUES ('2', 'PLT', 'Issues created by me', 'Issues created by me', 'WF_0_applications/teamwork/portal/portlet/wp_issuesCreatedByMe.jsp+++applications/teamwork/portal/portlet/wp_issuesCreatedByMe.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:52', null, null, '2017-05-16 09:43:52');
INSERT INTO `olpl_ws_portlet` VALUES ('20', 'PLT', 'Iframe', 'Iframe', 'WF_0_applications/teamwork/portal/portlet/wp_iframe.jsp+++applications/teamwork/portal/portlet/wp_iframe.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:53', null, null, '2017-05-16 09:43:53');
INSERT INTO `olpl_ws_portlet` VALUES ('21', 'PLT', 'Example of portlet with native sql', 'Example of portlet with native sql', 'WF_0_applications/teamwork/portal/portlet/wp_nativeSqlQuery.jsp+++applications/teamwork/portal/portlet/wp_nativeSqlQuery.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:53', null, null, '2017-05-16 09:43:53');
INSERT INTO `olpl_ws_portlet` VALUES ('22', 'PLT', 'Panic board', 'Panic board', 'WF_0_applications/teamwork/portal/portlet/wp_panicBoard.jsp+++applications/teamwork/portal/portlet/wp_panicBoard.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:53', null, null, '2017-05-16 09:43:53');
INSERT INTO `olpl_ws_portlet` VALUES ('23', 'PLT', 'Burndown graph', 'Burndown graph', 'WF_0_applications/teamwork/portal/portlet/wp_scrumBurnDown.jsp+++applications/teamwork/portal/portlet/wp_scrumBurnDown.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:53', null, null, '2017-05-16 09:43:53');
INSERT INTO `olpl_ws_portlet` VALUES ('24', 'PLT', 'Todo', 'Todo', 'WF_0_applications/teamwork/portal/portlet/wp_todo.jsp+++applications/teamwork/portal/portlet/wp_todo.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:53', null, null, '2017-05-16 09:43:53');
INSERT INTO `olpl_ws_portlet` VALUES ('25', 'PLT', 'Murphy\'s laws', 'Murphy\'s laws', 'WF_0_applications/teamwork/portal/portlet/wp_murphy.jsp+++applications/teamwork/portal/portlet/wp_murphy.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:53', null, null, '2017-05-16 09:43:53');
INSERT INTO `olpl_ws_portlet` VALUES ('26', 'PLT', 'My documents', 'My documents', 'WF_0_applications/teamwork/portal/portlet/wp_myDocuments.jsp+++applications/teamwork/portal/portlet/wp_myDocuments.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:53', null, null, '2017-05-16 09:43:53');
INSERT INTO `olpl_ws_portlet` VALUES ('27', 'PLT', 'My planned work', 'My planned work', 'WF_0_applications/teamwork/portal/portlet/wp_myPlan.jsp+++applications/teamwork/portal/portlet/wp_myPlan.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:53', null, null, '2017-05-16 09:43:53');
INSERT INTO `olpl_ws_portlet` VALUES ('28', 'PLT', 'create meetingroom', '创建会议室', 'WF_0_applications/teamwork/portal/portlet/wp_create_meetingRoom.jsp+++applications/teamwork/portal/portlet/wp_create_meetingRoom.jsp', '0', '0', '', '', '', '1', '', '2017-05-17 10:37:06', 'System Manager', 'System Manager', '2017-05-17 10:36:57');
INSERT INTO `olpl_ws_portlet` VALUES ('3', 'PLT', 'Activity', 'Activity', 'WF_0_applications/teamwork/portal/portlet/wp_activity.jsp+++applications/teamwork/portal/portlet/wp_activity.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:52', null, null, '2017-05-16 09:43:52');
INSERT INTO `olpl_ws_portlet` VALUES ('4', 'PLT', 'Headline', 'Headline', 'WF_0_applications/teamwork/portal/portlet/wp_headline.jsp+++applications/teamwork/portal/portlet/wp_headline.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:52', null, null, '2017-05-16 09:43:52');
INSERT INTO `olpl_ws_portlet` VALUES ('5', 'PLT', 'Report list', 'Report list', 'WF_0_applications/teamwork/portal/portlet/wp_genericReports.jsp+++applications/teamwork/portal/portlet/wp_genericReports.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:52', null, null, '2017-05-16 09:43:52');
INSERT INTO `olpl_ws_portlet` VALUES ('6', 'PLT', 'Time Counters', 'Time Counters', 'WF_0_applications/teamwork/portal/portlet/wp_timeCounter.jsp+++applications/teamwork/portal/portlet/wp_timeCounter.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:52', null, null, '2017-05-16 09:43:52');
INSERT INTO `olpl_ws_portlet` VALUES ('7', 'PLT', 'Time Counter Slim', 'Time Counter Slim', 'WF_0_applications/teamwork/portal/portlet/wp_timeCounterSlim.jsp+++applications/teamwork/portal/portlet/wp_timeCounterSlim.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:52', null, null, '2017-05-16 09:43:52');
INSERT INTO `olpl_ws_portlet` VALUES ('8', 'PLT', 'Logged Operators', 'Logged Operators', 'WF_0_applications/teamwork/portal/portlet/wp_loggedOperators.jsp+++applications/teamwork/portal/portlet/wp_loggedOperators.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:52', null, null, '2017-05-16 09:43:52');
INSERT INTO `olpl_ws_portlet` VALUES ('9', 'PLT', 'My agenda', 'My agenda', 'WF_0_applications/teamwork/portal/portlet/wp_myAppointments.jsp+++applications/teamwork/portal/portlet/wp_myAppointments.jsp', '0', '0', '', '', '', null, '', '2017-05-16 09:43:52', null, null, '2017-05-16 09:43:52');

-- ----------------------------
-- Table structure for `olpl_ws_template`
-- ----------------------------
DROP TABLE IF EXISTS `olpl_ws_template`;
CREATE TABLE `olpl_ws_template` (
  `id` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `templateFile` varchar(255) NOT NULL,
  `ownerx` int(11) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_templ_owner` (`ownerx`),
  CONSTRAINT `fk_templ_owner` FOREIGN KEY (`ownerx`) REFERENCES `olpl_operator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of olpl_ws_template
-- ----------------------------
INSERT INTO `olpl_ws_template` VALUES ('1', 'default', 'default', 'WF_0_applications/teamwork/portal/template/teamworkTemplate.html+++applications/teamwork/portal/template/teamworkTemplate.html', null, '2017-05-16 09:43:51', null, null, '2017-05-16 09:43:51');
INSERT INTO `olpl_ws_template` VALUES ('2', 'one column', 'one column', 'WF_0_applications/teamwork/portal/template/teamworkTemplateOneColumn.html+++applications/teamwork/portal/template/teamworkTemplateOneColumn.html', null, '2017-05-16 09:43:51', null, null, '2017-05-16 09:43:51');

-- ----------------------------
-- Table structure for `twk_agenda_tar`
-- ----------------------------
DROP TABLE IF EXISTS `twk_agenda_tar`;
CREATE TABLE `twk_agenda_tar` (
  `event` varchar(15) NOT NULL,
  `elt` varchar(15) NOT NULL,
  PRIMARY KEY (`event`,`elt`),
  KEY `fk_ag_tar_res` (`elt`),
  CONSTRAINT `fk_ag_tar_ev` FOREIGN KEY (`event`) REFERENCES `twk_agendaevent` (`id`),
  CONSTRAINT `fk_ag_tar_res` FOREIGN KEY (`elt`) REFERENCES `twk_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_agenda_tar
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_agendaevent`
-- ----------------------------
DROP TABLE IF EXISTS `twk_agendaevent`;
CREATE TABLE `twk_agendaevent` (
  `id` varchar(15) NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `exceptions` varchar(2000) DEFAULT NULL,
  `icalId` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `personal` bit(1) NOT NULL,
  `reminder` bit(1) NOT NULL,
  `status` int(11) NOT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `unavailability` bit(1) NOT NULL,
  `author` varchar(15) DEFAULT NULL,
  `meeting` int(11) DEFAULT NULL,
  `schedule` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_agendaevent_author` (`author`),
  KEY `idx_event_meeting` (`meeting`),
  KEY `idx_event_schedule` (`schedule`),
  KEY `idx_event_eventType` (`type`),
  CONSTRAINT `fk_agendaevent_author` FOREIGN KEY (`author`) REFERENCES `twk_resource` (`id`),
  CONSTRAINT `fk_event_eventType` FOREIGN KEY (`type`) REFERENCES `olpl_lookup` (`id`),
  CONSTRAINT `fk_event_meeting` FOREIGN KEY (`meeting`) REFERENCES `twk_meeting` (`id`),
  CONSTRAINT `fk_event_schedule` FOREIGN KEY (`schedule`) REFERENCES `olpl_schedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_agendaevent
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_assig_costs`
-- ----------------------------
DROP TABLE IF EXISTS `twk_assig_costs`;
CREATE TABLE `twk_assig_costs` (
  `assig_id` varchar(15) NOT NULL,
  `cost_id` varchar(15) NOT NULL,
  PRIMARY KEY (`assig_id`,`cost_id`),
  KEY `idx_assigCosts_assig` (`assig_id`),
  KEY `idx_assigCosts_cost` (`cost_id`),
  CONSTRAINT `fk_assigCosts_assig` FOREIGN KEY (`assig_id`) REFERENCES `twk_assignment` (`id`),
  CONSTRAINT `fk_assigCosts_cost` FOREIGN KEY (`cost_id`) REFERENCES `twk_cost` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_assig_costs
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_assig_pr`
-- ----------------------------
DROP TABLE IF EXISTS `twk_assig_pr`;
CREATE TABLE `twk_assig_pr` (
  `id` varchar(15) NOT NULL,
  `assignment` varchar(15) NOT NULL,
  `cutPoint` bigint(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_assig_pr` (`assignment`),
  CONSTRAINT `fk_assig_pr` FOREIGN KEY (`assignment`) REFERENCES `twk_assignment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_assig_pr
-- ----------------------------
INSERT INTO `twk_assig_pr` VALUES ('1', '1', '1494972000000', '0');

-- ----------------------------
-- Table structure for `twk_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `twk_assignment`;
CREATE TABLE `twk_assignment` (
  `id` varchar(15) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `resourcex` varchar(15) NOT NULL,
  `task` varchar(15) NOT NULL,
  `role` varchar(15) NOT NULL,
  `estimatedwkl` bigint(20) DEFAULT NULL,
  `wkldone` bigint(20) DEFAULT NULL,
  `assignmentDate` datetime DEFAULT NULL,
  `counted` bit(1) DEFAULT NULL,
  `countingStartedAt` datetime DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `induceWorklog` bit(1) DEFAULT NULL,
  `risk` int(11) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `hourlyCost` double DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `costCenter` varchar(15) DEFAULT NULL,
  `ownerx` int(11) DEFAULT NULL,
  `externalCode` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `customField1` varchar(255) DEFAULT NULL,
  `customField2` varchar(255) DEFAULT NULL,
  `customField3` varchar(255) DEFAULT NULL,
  `customField4` varchar(255) DEFAULT NULL,
  `customField5` varchar(255) DEFAULT NULL,
  `customField6` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_assig_resource` (`resourcex`),
  KEY `idx_assig_task` (`task`),
  KEY `idx_assig_role` (`role`),
  KEY `idx_assig_costagg` (`costCenter`),
  KEY `idx_assig_owner` (`ownerx`),
  CONSTRAINT `fk_assig_costagg` FOREIGN KEY (`costCenter`) REFERENCES `twk_cost_aggregator` (`id`),
  CONSTRAINT `fk_assig_owner` FOREIGN KEY (`ownerx`) REFERENCES `olpl_operator` (`id`),
  CONSTRAINT `fk_assig_resource` FOREIGN KEY (`resourcex`) REFERENCES `twk_resource` (`id`),
  CONSTRAINT `fk_assig_role` FOREIGN KEY (`role`) REFERENCES `olpl_role` (`id`),
  CONSTRAINT `fk_assig_task` FOREIGN KEY (`task`) REFERENCES `twk_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_assignment
-- ----------------------------
INSERT INTO `twk_assignment` VALUES ('1', null, '1', '1', '5', '0', '0', null, '\0', null, 'ACTIVITY_ALL_IN_ONE', '', '0', '', '20', '0', null, '1', null, '2017-05-17 10:35:31', 'System Manager', 'System Manager', '2017-05-17 10:35:31', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `twk_assignment_data_hist`
-- ----------------------------
DROP TABLE IF EXISTS `twk_assignment_data_hist`;
CREATE TABLE `twk_assignment_data_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assignmentId` varchar(255) DEFAULT NULL,
  `budget` double NOT NULL,
  `costDone` double NOT NULL,
  `costEstimated` double NOT NULL,
  `createdOn` datetime DEFAULT NULL,
  `estimatedWorklog` bigint(20) NOT NULL,
  `hourlyCost` double NOT NULL,
  `worklogDone` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_assdathist_assid` (`assignmentId`),
  KEY `idx_tskdathist_createdon` (`createdOn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_assignment_data_hist
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_board`
-- ----------------------------
DROP TABLE IF EXISTS `twk_board`;
CREATE TABLE `twk_board` (
  `id` varchar(15) NOT NULL,
  `area` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `lastPostedOn` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_board_area` (`area`),
  CONSTRAINT `fk_board_area` FOREIGN KEY (`area`) REFERENCES `olpl_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_board
-- ----------------------------
INSERT INTO `twk_board` VALUES ('1', '1', 'Office space quality', 'Office space quality discussion and proposals', '', null, '2017-05-16 09:43:50', null, null, '2017-05-16 09:43:50');

-- ----------------------------
-- Table structure for `twk_cost`
-- ----------------------------
DROP TABLE IF EXISTS `twk_cost`;
CREATE TABLE `twk_cost` (
  `id` varchar(15) NOT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `costCenter` varchar(15) DEFAULT NULL,
  `classification` int(11) DEFAULT NULL,
  `realCost` double DEFAULT NULL,
  `estimatedCost` double DEFAULT NULL,
  `customField1` varchar(255) DEFAULT NULL,
  `customField2` varchar(255) DEFAULT NULL,
  `customField3` varchar(255) DEFAULT NULL,
  `customField4` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `statusx` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cost_costagg` (`costCenter`),
  KEY `idx_cost_classif` (`classification`),
  KEY `idx_asscost_sts` (`statusx`),
  CONSTRAINT `fk_asscost_sts` FOREIGN KEY (`statusx`) REFERENCES `olpl_lookup` (`id`),
  CONSTRAINT `fk_cost_classif` FOREIGN KEY (`classification`) REFERENCES `olpl_lookup` (`id`),
  CONSTRAINT `fk_cost_costagg` FOREIGN KEY (`costCenter`) REFERENCES `twk_cost_aggregator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_cost
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_cost_aggregator`
-- ----------------------------
DROP TABLE IF EXISTS `twk_cost_aggregator`;
CREATE TABLE `twk_cost_aggregator` (
  `id` varchar(15) NOT NULL,
  `discriminator` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `manager` varchar(15) DEFAULT NULL,
  `parent` varchar(15) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_costagg_man` (`manager`),
  KEY `idx_costagg_costagg` (`parent`),
  KEY `idx_costaggr_area` (`area`),
  CONSTRAINT `fk_costaggr_area` FOREIGN KEY (`area`) REFERENCES `olpl_area` (`id`),
  CONSTRAINT `fk_costagg_costagg` FOREIGN KEY (`parent`) REFERENCES `twk_cost_aggregator` (`id`),
  CONSTRAINT `fk_costagg_man` FOREIGN KEY (`manager`) REFERENCES `twk_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_cost_aggregator
-- ----------------------------
INSERT INTO `twk_cost_aggregator` VALUES ('1', 'CA', 'Master sample', '1', '2017-05-16 09:43:50', null, null, '2017-05-16 09:43:50', null, null, null, '1');

-- ----------------------------
-- Table structure for `twk_disc_point`
-- ----------------------------
DROP TABLE IF EXISTS `twk_disc_point`;
CREATE TABLE `twk_disc_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documentx` varchar(255) DEFAULT NULL,
  `minute` longtext,
  `orderBy` int(11) NOT NULL,
  `timeScheduled` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `person` varchar(15) DEFAULT NULL,
  `meeting` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `task` varchar(15) DEFAULT NULL,
  `disc_point_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_discp_person` (`person`),
  KEY `idx_discp_task` (`task`),
  KEY `idx_discp_discPointType` (`disc_point_type`),
  KEY `fk_discp_meeting` (`meeting`),
  KEY `fk_discussionpoint_owner` (`owner`),
  KEY `fk_discp_discPointStatus` (`status`),
  CONSTRAINT `fk_discp_discPointStatus` FOREIGN KEY (`status`) REFERENCES `twk_discpointstatus` (`id`),
  CONSTRAINT `fk_discp_discPointType` FOREIGN KEY (`disc_point_type`) REFERENCES `twk_discpointtype` (`id`),
  CONSTRAINT `fk_discp_meeting` FOREIGN KEY (`meeting`) REFERENCES `twk_meeting` (`id`),
  CONSTRAINT `fk_discp_person` FOREIGN KEY (`person`) REFERENCES `twk_resource` (`id`),
  CONSTRAINT `fk_discp_task` FOREIGN KEY (`task`) REFERENCES `twk_task` (`id`),
  CONSTRAINT `fk_discussionpoint_owner` FOREIGN KEY (`owner`) REFERENCES `olpl_operator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_disc_point
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_discpointstatus`
-- ----------------------------
DROP TABLE IF EXISTS `twk_discpointstatus`;
CREATE TABLE `twk_discpointstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creationDate` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_discpointstatus
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_discpointtype`
-- ----------------------------
DROP TABLE IF EXISTS `twk_discpointtype`;
CREATE TABLE `twk_discpointtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creationDate` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `stringValue` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_discpointtype
-- ----------------------------
INSERT INTO `twk_discpointtype` VALUES ('1', '2017-05-16 09:43:50', null, '2017-05-16 09:43:50', null, 'Start', null, '1', null);
INSERT INTO `twk_discpointtype` VALUES ('2', '2017-05-16 09:43:50', null, '2017-05-16 09:43:50', null, 'During', null, '2', null);
INSERT INTO `twk_discpointtype` VALUES ('3', '2017-05-16 09:43:50', null, '2017-05-16 09:43:50', null, 'End', null, '3', null);
INSERT INTO `twk_discpointtype` VALUES ('4', '2017-05-16 09:43:50', null, '2017-05-16 09:43:50', null, 'Final', null, '4', null);

-- ----------------------------
-- Table structure for `twk_document`
-- ----------------------------
DROP TABLE IF EXISTS `twk_document`;
CREATE TABLE `twk_document` (
  `id` varchar(15) NOT NULL,
  `discriminator` varchar(10) NOT NULL,
  `connectionHost` varchar(255) DEFAULT NULL,
  `connectionUser` varchar(255) DEFAULT NULL,
  `connectionPwd` varchar(255) DEFAULT NULL,
  `connectionNotes` varchar(255) DEFAULT NULL,
  `connectionType` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summa` varchar(4000) DEFAULT NULL,
  `kind` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `contentx` longtext,
  `mimeType` varchar(255) DEFAULT NULL,
  `versionLabel` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `authored` datetime DEFAULT NULL,
  `persistentFile` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `hidden` bit(1) DEFAULT NULL,
  `hiddenOn` datetime DEFAULT NULL,
  `hiddenBy` varchar(255) DEFAULT NULL,
  `ownerx` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `task` varchar(15) DEFAULT NULL,
  `resourcex` varchar(15) DEFAULT NULL,
  `lockedBy` varchar(15) DEFAULT NULL,
  `ancestorids` varchar(255) DEFAULT NULL,
  `parent` varchar(15) DEFAULT NULL,
  `tags` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_document_owner` (`ownerx`),
  KEY `idx_document_area` (`area`),
  KEY `idx_doc_task` (`task`),
  KEY `idx_doc_resource` (`resourcex`),
  KEY `idx_doc_lockby` (`lockedBy`),
  KEY `idx_document_ancids` (`ancestorids`),
  KEY `idx_document_document` (`parent`),
  CONSTRAINT `fk_document_area` FOREIGN KEY (`area`) REFERENCES `olpl_area` (`id`),
  CONSTRAINT `fk_document_document` FOREIGN KEY (`parent`) REFERENCES `twk_document` (`id`),
  CONSTRAINT `fk_document_owner` FOREIGN KEY (`ownerx`) REFERENCES `olpl_operator` (`id`),
  CONSTRAINT `fk_doc_lockby` FOREIGN KEY (`lockedBy`) REFERENCES `twk_resource` (`id`),
  CONSTRAINT `fk_doc_resource` FOREIGN KEY (`resourcex`) REFERENCES `twk_resource` (`id`),
  CONSTRAINT `fk_doc_task` FOREIGN KEY (`task`) REFERENCES `twk_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_document
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_event_references`
-- ----------------------------
DROP TABLE IF EXISTS `twk_event_references`;
CREATE TABLE `twk_event_references` (
  `event_id` varchar(15) NOT NULL,
  `elt` varchar(255) NOT NULL,
  PRIMARY KEY (`event_id`,`elt`),
  CONSTRAINT `fk_eventRef_event` FOREIGN KEY (`event_id`) REFERENCES `twk_agendaevent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_event_references
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_issue`
-- ----------------------------
DROP TABLE IF EXISTS `twk_issue`;
CREATE TABLE `twk_issue` (
  `id` varchar(255) NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `hidden` bit(1) DEFAULT NULL,
  `hiddenBy` varchar(255) DEFAULT NULL,
  `hiddenOn` datetime DEFAULT NULL,
  `codex` varchar(30) DEFAULT NULL,
  `customField1` varchar(255) DEFAULT NULL,
  `customField2` varchar(255) DEFAULT NULL,
  `customField3` varchar(255) DEFAULT NULL,
  `customField4` varchar(255) DEFAULT NULL,
  `customField5` varchar(255) DEFAULT NULL,
  `customField6` varchar(255) DEFAULT NULL,
  `dateSignalled` datetime DEFAULT NULL,
  `descriptionx` longtext,
  `estimatedDuration` bigint(20) DEFAULT NULL,
  `extRequesterEmail` varchar(60) DEFAULT NULL,
  `gravity` varchar(255) DEFAULT NULL,
  `jsonData` longtext,
  `lastStatusChangeDate` datetime DEFAULT NULL,
  `orderFactor` double NOT NULL,
  `orderfactorbyres` double DEFAULT NULL,
  `shouldCloseBy` datetime DEFAULT NULL,
  `tags` varchar(1024) DEFAULT NULL,
  `worklogDone` bigint(20) DEFAULT NULL,
  `areax` int(11) DEFAULT NULL,
  `assignedBy` varchar(15) DEFAULT NULL,
  `assignedTo` varchar(15) DEFAULT NULL,
  `impact` int(11) DEFAULT NULL,
  `ownerx` int(11) DEFAULT NULL,
  `statusx` int(11) DEFAULT NULL,
  `task` varchar(15) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_issue_area` (`areax`),
  KEY `idx_issue_assigner` (`assignedBy`),
  KEY `idx_issue_worker` (`assignedTo`),
  KEY `idx_issue_code` (`codex`),
  KEY `idx_issue_extemail` (`extRequesterEmail`),
  KEY `idx_issue_impact` (`impact`),
  KEY `idx_issue_owner` (`ownerx`),
  KEY `idx_issue_issStatus` (`statusx`),
  KEY `idx_issue_task` (`task`),
  KEY `idx_issue_type` (`type`),
  CONSTRAINT `fk_issue_area` FOREIGN KEY (`areax`) REFERENCES `olpl_area` (`id`),
  CONSTRAINT `fk_issue_assigner` FOREIGN KEY (`assignedBy`) REFERENCES `twk_resource` (`id`),
  CONSTRAINT `fk_issue_impact` FOREIGN KEY (`impact`) REFERENCES `olpl_lookup` (`id`),
  CONSTRAINT `fk_issue_issStatus` FOREIGN KEY (`statusx`) REFERENCES `twk_issue_status` (`id`),
  CONSTRAINT `fk_issue_owner` FOREIGN KEY (`ownerx`) REFERENCES `olpl_operator` (`id`),
  CONSTRAINT `fk_issue_task` FOREIGN KEY (`task`) REFERENCES `twk_task` (`id`),
  CONSTRAINT `fk_issue_type` FOREIGN KEY (`type`) REFERENCES `olpl_lookup` (`id`),
  CONSTRAINT `fk_issue_worker` FOREIGN KEY (`assignedTo`) REFERENCES `twk_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_issue
-- ----------------------------
INSERT INTO `twk_issue` VALUES ('1', '2017-05-17 10:35:47', 'System Manager', '2017-05-17 10:35:47', 'System Manager', '\0', null, null, null, null, null, null, null, null, null, '2017-05-17 00:00:00', 'testt', '0', null, '02_GRAVITY_MEDIUM', null, '2017-05-17 10:35:46', '0', '0', '2017-05-31 00:00:00', 't', '0', '1', '1', null, null, '1', '1', '1', null);
INSERT INTO `twk_issue` VALUES ('2', '2017-05-18 04:47:58', 'System Manager', '2017-05-18 04:47:58', 'System Manager', '\0', null, null, null, null, null, null, null, null, null, '2017-05-18 00:00:00', 'ddd', '0', null, '02_GRAVITY_MEDIUM', null, '2017-05-18 04:47:43', '0', '0', null, 'd', '0', '1', '1', null, null, '1', '1', '1', '13');
INSERT INTO `twk_issue` VALUES ('4', '2017-05-18 04:54:59', 'System Manager', '2017-05-18 04:54:59', 'System Manager', '\0', null, null, null, null, null, null, null, null, null, '2017-05-18 00:00:00', 'ddd79', '0', null, '02_GRAVITY_MEDIUM', null, '2017-05-18 04:54:57', '0', '0', '2017-05-19 00:00:00', '799', '0', '1', '1', null, null, '1', '1', '1', '13');
INSERT INTO `twk_issue` VALUES ('5', '2017-05-18 04:57:07', 'System Manager', '2017-05-18 04:57:07', 'System Manager', '\0', null, null, null, null, null, null, null, null, null, '2017-05-18 00:00:00', 'ddd79', '0', null, '02_GRAVITY_MEDIUM', null, '2017-05-18 04:55:32', '0', '0', '2017-05-19 00:00:00', '799', '0', '1', '1', null, null, '1', '1', '1', '13');
INSERT INTO `twk_issue` VALUES ('6', '2017-05-18 09:58:16', 'System Manager', '2017-05-18 09:58:16', 'System Manager', '\0', null, null, null, null, null, null, null, null, null, '2017-05-18 00:00:00', 'fty', '0', null, '02_GRAVITY_MEDIUM', null, '2017-05-18 09:58:14', '0', '0', null, '', '0', '1', '1', null, null, '1', '1', '1', '13');
INSERT INTO `twk_issue` VALUES ('7', '2017-05-18 10:24:35', 'System Manager', '2017-05-18 10:24:35', 'System Manager', '\0', null, null, null, null, null, null, null, null, null, '2017-05-18 00:00:00', 'a', '0', null, '02_GRAVITY_MEDIUM', null, '2017-05-18 10:24:35', '0', '0', null, 'a', '0', '1', '1', null, null, '1', '1', '1', '13');
INSERT INTO `twk_issue` VALUES ('8', '2017-05-18 11:57:50', 'System Manager', '2017-05-18 11:57:50', 'System Manager', '\0', null, null, null, null, null, null, null, null, null, '2017-05-18 00:00:00', '444', '0', null, '02_GRAVITY_MEDIUM', null, '2017-05-18 11:57:25', '0', '0', null, '4', '0', '1', '1', null, null, '1', '1', '1', '13');
INSERT INTO `twk_issue` VALUES ('9', '2017-05-22 04:08:04', 'System Manager', '2017-05-22 04:08:04', 'System Manager', '\0', null, null, null, null, null, null, null, null, null, '2017-05-22 00:00:00', '999', '0', null, '02_GRAVITY_MEDIUM', null, '2017-05-22 04:08:03', '0', '0', null, '9', '0', '1', '1', null, null, '1', '1', '1', '13');

-- ----------------------------
-- Table structure for `twk_issue_history`
-- ----------------------------
DROP TABLE IF EXISTS `twk_issue_history`;
CREATE TABLE `twk_issue_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creationDate` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `commentx` longtext,
  `extRequesterEmail` varchar(60) DEFAULT NULL,
  `assignee` varchar(15) DEFAULT NULL,
  `issue` varchar(255) DEFAULT NULL,
  `oldstatus` int(11) DEFAULT NULL,
  `ownerx` int(11) DEFAULT NULL,
  `statusx` int(11) DEFAULT NULL,
  `task` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_issuehist_res` (`assignee`),
  KEY `idx_issue_extemail` (`extRequesterEmail`),
  KEY `idx_issuehist_issue` (`issue`),
  KEY `idx_issuehist_isoldstat` (`oldstatus`),
  KEY `idx_issuehist_owner` (`ownerx`),
  KEY `idx_issuehist_isstat` (`statusx`),
  KEY `idx_issuehist_task` (`task`),
  CONSTRAINT `fk_issuehist_isoldstat` FOREIGN KEY (`oldstatus`) REFERENCES `twk_issue_status` (`id`),
  CONSTRAINT `fk_issuehist_isstat` FOREIGN KEY (`statusx`) REFERENCES `twk_issue_status` (`id`),
  CONSTRAINT `fk_issuehist_issue` FOREIGN KEY (`issue`) REFERENCES `twk_issue` (`id`),
  CONSTRAINT `fk_issuehist_owner` FOREIGN KEY (`ownerx`) REFERENCES `olpl_operator` (`id`),
  CONSTRAINT `fk_issuehist_res` FOREIGN KEY (`assignee`) REFERENCES `twk_resource` (`id`),
  CONSTRAINT `fk_issuehist_task` FOREIGN KEY (`task`) REFERENCES `twk_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_issue_history
-- ----------------------------
INSERT INTO `twk_issue_history` VALUES ('1', '2017-05-17 10:35:47', 'System Manager', '2017-05-17 10:35:47', 'System Manager', null, null, null, '1', '1', '1', '1', '1');
INSERT INTO `twk_issue_history` VALUES ('2', '2017-05-18 04:48:03', 'System Manager', '2017-05-18 04:48:03', 'System Manager', null, null, null, '2', '1', '1', '1', '1');
INSERT INTO `twk_issue_history` VALUES ('4', '2017-05-18 04:54:59', 'System Manager', '2017-05-18 04:54:59', 'System Manager', null, null, null, '4', '1', '1', '1', '1');
INSERT INTO `twk_issue_history` VALUES ('5', '2017-05-18 04:57:07', 'System Manager', '2017-05-18 04:57:07', 'System Manager', null, null, null, '5', '1', '1', '1', '1');
INSERT INTO `twk_issue_history` VALUES ('6', '2017-05-18 09:58:16', 'System Manager', '2017-05-18 09:58:16', 'System Manager', null, null, null, '6', '1', '1', '1', '1');
INSERT INTO `twk_issue_history` VALUES ('7', '2017-05-18 10:24:35', 'System Manager', '2017-05-18 10:24:35', 'System Manager', null, null, null, '7', '1', '1', '1', '1');
INSERT INTO `twk_issue_history` VALUES ('8', '2017-05-18 11:57:52', 'System Manager', '2017-05-18 11:57:52', 'System Manager', null, null, null, '8', '1', '1', '1', '1');
INSERT INTO `twk_issue_history` VALUES ('9', '2017-05-22 04:08:04', 'System Manager', '2017-05-22 04:08:04', 'System Manager', null, null, null, '9', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `twk_issue_status`
-- ----------------------------
DROP TABLE IF EXISTS `twk_issue_status`;
CREATE TABLE `twk_issue_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `askForComment` bit(1) NOT NULL,
  `askForWorklog` bit(1) NOT NULL,
  `behavesAsClosed` bit(1) NOT NULL,
  `behavesAsOpen` bit(1) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `orderBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_issue_status
-- ----------------------------
INSERT INTO `twk_issue_status` VALUES ('1', '\0', '\0', '\0', '', '#3BBF67', 'open', '1');
INSERT INTO `twk_issue_status` VALUES ('2', '\0', '\0', '\0', '\0', '#F9C154', 'paused', '2');
INSERT INTO `twk_issue_status` VALUES ('3', '\0', '', '\0', '', '#FF9900', 'in test', '3');
INSERT INTO `twk_issue_status` VALUES ('4', '\0', '', '', '\0', '#6EBEF4', 'closed', '4');
INSERT INTO `twk_issue_status` VALUES ('5', '', '', '', '\0', '#763A96', 'aborted', '5');

-- ----------------------------
-- Table structure for `twk_meeting`
-- ----------------------------
DROP TABLE IF EXISTS `twk_meeting`;
CREATE TABLE `twk_meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creationDate` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `hidden` bit(1) DEFAULT NULL,
  `hiddenBy` varchar(255) DEFAULT NULL,
  `hiddenOn` datetime DEFAULT NULL,
  `board` varchar(15) DEFAULT NULL,
  `ownerx` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_meeting_board` (`board`),
  KEY `idx_meeting_owner` (`ownerx`),
  CONSTRAINT `fk_meeting_board` FOREIGN KEY (`board`) REFERENCES `twk_board` (`id`),
  CONSTRAINT `fk_meeting_owner` FOREIGN KEY (`ownerx`) REFERENCES `olpl_operator` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_meeting
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_meeting_room`
-- ----------------------------
DROP TABLE IF EXISTS `twk_meeting_room`;
CREATE TABLE `twk_meeting_room` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `hidden` bit(1) DEFAULT NULL,
  `hiddenBy` varchar(255) DEFAULT NULL,
  `hiddenOn` datetime DEFAULT NULL,
  `codex` varchar(30) DEFAULT NULL,
  `descriptionx` longtext,
  `gravity` varchar(255) DEFAULT NULL,
  `areax` int(11) DEFAULT NULL,
  `task` varchar(15) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `statusx` int(11) DEFAULT NULL,
  `customField1` varchar(255) DEFAULT NULL,
  `customField2` varchar(255) DEFAULT NULL,
  `customField3` varchar(255) DEFAULT NULL,
  `ownerx` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_meeting_room
-- ----------------------------
INSERT INTO `twk_meeting_room` VALUES ('4', null, '2017-05-18 06:01:04', 'System Manager', '2017-05-22 05:12:29', 'System Manager', '\0', null, null, null, null, '05_GRAVITY_BLOCK', '1', '1', '11', '2', null, null, null, '1');
INSERT INTO `twk_meeting_room` VALUES ('5', 'r', '2017-05-21 22:18:32', 'System Manager', '2017-05-22 05:12:30', 'System Manager', '\0', null, null, null, 'r', '05_GRAVITY_BLOCK', '1', null, '11', '2', null, null, null, '1');

-- ----------------------------
-- Table structure for `twk_meetingroom_history`
-- ----------------------------
DROP TABLE IF EXISTS `twk_meetingroom_history`;
CREATE TABLE `twk_meetingroom_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creationDate` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `commentx` longtext,
  `extRequesterEmail` varchar(60) DEFAULT NULL,
  `assignee` varchar(15) DEFAULT NULL,
  `issue` varchar(255) DEFAULT NULL,
  `oldstatus` int(11) DEFAULT NULL,
  `ownerx` int(11) DEFAULT NULL,
  `statusx` int(11) DEFAULT NULL,
  `task` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_issuehist_res` (`assignee`),
  KEY `idx_issue_extemail` (`extRequesterEmail`),
  KEY `idx_issuehist_issue` (`issue`),
  KEY `idx_issuehist_isoldstat` (`oldstatus`),
  KEY `idx_issuehist_owner` (`ownerx`),
  KEY `idx_issuehist_isstat` (`statusx`),
  KEY `idx_issuehist_task` (`task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_meetingroom_history
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_meetingroom_status`
-- ----------------------------
DROP TABLE IF EXISTS `twk_meetingroom_status`;
CREATE TABLE `twk_meetingroom_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `askForComment` bit(1) NOT NULL,
  `askForWorklog` bit(1) NOT NULL,
  `behavesAsClosed` bit(1) NOT NULL,
  `behavesAsOpen` bit(1) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `orderBy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_meetingroom_status
-- ----------------------------
INSERT INTO `twk_meetingroom_status` VALUES ('1', '\0', '\0', '\0', '', '#3BBF67', 'open', '1');
INSERT INTO `twk_meetingroom_status` VALUES ('2', '\0', '\0', '', '\0', '#F9C154', 'closed', '2');

-- ----------------------------
-- Table structure for `twk_person_news`
-- ----------------------------
DROP TABLE IF EXISTS `twk_person_news`;
CREATE TABLE `twk_person_news` (
  `person_id` varchar(15) NOT NULL,
  `news` varchar(2000) DEFAULT NULL,
  `nworder` int(11) NOT NULL,
  PRIMARY KEY (`person_id`,`nworder`),
  CONSTRAINT `twk_person_news_id` FOREIGN KEY (`person_id`) REFERENCES `twk_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_person_news
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_rank_hit`
-- ----------------------------
DROP TABLE IF EXISTS `twk_rank_hit`;
CREATE TABLE `twk_rank_hit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaId` int(11) NOT NULL,
  `entityClass` varchar(255) DEFAULT NULL,
  `entityId` varchar(255) DEFAULT NULL,
  `operatorId` int(11) NOT NULL,
  `weight` double NOT NULL,
  `whenx` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_hit_entClass` (`entityClass`),
  KEY `idx_hit_entId` (`entityId`),
  KEY `idx_hit_op` (`operatorId`),
  KEY `idx_hit_when` (`whenx`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_rank_hit
-- ----------------------------
INSERT INTO `twk_rank_hit` VALUES ('1', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1494921710635');
INSERT INTO `twk_rank_hit` VALUES ('2', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1494922137815');
INSERT INTO `twk_rank_hit` VALUES ('3', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495010013453');
INSERT INTO `twk_rank_hit` VALUES ('4', '1', 'com.twproject.task.Task', '1', '1', '1', '1495010129988');
INSERT INTO `twk_rank_hit` VALUES ('5', '1', 'com.twproject.task.Task', '1', '1', '0.1', '1495010131648');
INSERT INTO `twk_rank_hit` VALUES ('6', '1', 'com.twproject.task.Issue', '1', '1', '0.2', '1495010146586');
INSERT INTO `twk_rank_hit` VALUES ('7', '1', 'com.twproject.task.Task', '1', '1', '0.1', '1495010146587');
INSERT INTO `twk_rank_hit` VALUES ('8', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495011326533');
INSERT INTO `twk_rank_hit` VALUES ('9', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495014877401');
INSERT INTO `twk_rank_hit` VALUES ('10', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495028230957');
INSERT INTO `twk_rank_hit` VALUES ('11', '1', 'com.twproject.resource.Person', '1', '1', '0.1', '1495028231029');
INSERT INTO `twk_rank_hit` VALUES ('12', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495028240388');
INSERT INTO `twk_rank_hit` VALUES ('13', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495031912249');
INSERT INTO `twk_rank_hit` VALUES ('14', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495032552358');
INSERT INTO `twk_rank_hit` VALUES ('15', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495032989776');
INSERT INTO `twk_rank_hit` VALUES ('16', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495034047507');
INSERT INTO `twk_rank_hit` VALUES ('17', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495034498354');
INSERT INTO `twk_rank_hit` VALUES ('18', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495035289664');
INSERT INTO `twk_rank_hit` VALUES ('19', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495035921674');
INSERT INTO `twk_rank_hit` VALUES ('20', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495075483477');
INSERT INTO `twk_rank_hit` VALUES ('21', '1', 'com.twproject.task.Issue', '2', '1', '0.2', '1495075683579');
INSERT INTO `twk_rank_hit` VALUES ('22', '1', 'com.twproject.task.Task', '1', '1', '0.1', '1495075683580');
INSERT INTO `twk_rank_hit` VALUES ('23', '1', 'com.twproject.task.Issue', '3', '1', '0.2', '1495075761692');
INSERT INTO `twk_rank_hit` VALUES ('24', '1', 'com.twproject.task.Task', '1', '1', '0.1', '1495075761694');
INSERT INTO `twk_rank_hit` VALUES ('25', '1', 'com.twproject.task.Issue', '4', '1', '0.2', '1495076099164');
INSERT INTO `twk_rank_hit` VALUES ('26', '1', 'com.twproject.task.Task', '1', '1', '0.1', '1495076099165');
INSERT INTO `twk_rank_hit` VALUES ('27', '1', 'com.twproject.task.Issue', '3', '1', '0.1', '1495076113869');
INSERT INTO `twk_rank_hit` VALUES ('28', '1', 'com.twproject.task.Issue', '5', '1', '0.2', '1495076227585');
INSERT INTO `twk_rank_hit` VALUES ('29', '1', 'com.twproject.task.Task', '1', '1', '0.1', '1495076227586');
INSERT INTO `twk_rank_hit` VALUES ('30', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495076737435');
INSERT INTO `twk_rank_hit` VALUES ('31', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495077689569');
INSERT INTO `twk_rank_hit` VALUES ('32', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495084804759');
INSERT INTO `twk_rank_hit` VALUES ('33', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495086062508');
INSERT INTO `twk_rank_hit` VALUES ('34', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495091410067');
INSERT INTO `twk_rank_hit` VALUES ('35', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495092599662');
INSERT INTO `twk_rank_hit` VALUES ('36', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495094085431');
INSERT INTO `twk_rank_hit` VALUES ('37', '1', 'com.twproject.task.Issue', '6', '1', '0.2', '1495094296541');
INSERT INTO `twk_rank_hit` VALUES ('38', '1', 'com.twproject.task.Task', '1', '1', '0.1', '1495094296543');
INSERT INTO `twk_rank_hit` VALUES ('39', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495095251045');
INSERT INTO `twk_rank_hit` VALUES ('40', '1', 'com.twproject.task.Issue', '7', '1', '0.2', '1495095876406');
INSERT INTO `twk_rank_hit` VALUES ('41', '1', 'com.twproject.task.Task', '1', '1', '0.1', '1495095876408');
INSERT INTO `twk_rank_hit` VALUES ('42', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495096550195');
INSERT INTO `twk_rank_hit` VALUES ('43', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495098174860');
INSERT INTO `twk_rank_hit` VALUES ('44', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495099199259');
INSERT INTO `twk_rank_hit` VALUES ('45', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495100108787');
INSERT INTO `twk_rank_hit` VALUES ('46', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495100319499');
INSERT INTO `twk_rank_hit` VALUES ('47', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495100738299');
INSERT INTO `twk_rank_hit` VALUES ('48', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495101000931');
INSERT INTO `twk_rank_hit` VALUES ('49', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495101374470');
INSERT INTO `twk_rank_hit` VALUES ('50', '1', 'com.twproject.task.Issue', '8', '1', '0.2', '1495101474335');
INSERT INTO `twk_rank_hit` VALUES ('51', '1', 'com.twproject.task.Task', '1', '1', '0.1', '1495101474338');
INSERT INTO `twk_rank_hit` VALUES ('52', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495101655605');
INSERT INTO `twk_rank_hit` VALUES ('53', '1', 'com.twproject.task.MeetingRoom', '4', '1', '0.2', '1495101663561');
INSERT INTO `twk_rank_hit` VALUES ('54', '1', 'com.twproject.task.Task', '1', '1', '0.1', '1495101663602');
INSERT INTO `twk_rank_hit` VALUES ('55', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495418094169');
INSERT INTO `twk_rank_hit` VALUES ('56', '1', 'com.twproject.task.Issue', '9', '1', '0.2', '1495418883677');
INSERT INTO `twk_rank_hit` VALUES ('57', '1', 'com.twproject.task.Task', '1', '1', '0.1', '1495418883679');
INSERT INTO `twk_rank_hit` VALUES ('58', '1', 'com.twproject.task.MeetingRoom', '5', '1', '0.2', '1495419900528');
INSERT INTO `twk_rank_hit` VALUES ('59', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495420003714');
INSERT INTO `twk_rank_hit` VALUES ('60', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495420974562');
INSERT INTO `twk_rank_hit` VALUES ('61', '1', 'com.twproject.operator.TeamworkOperator', '1', '1', '1', '1495422486511');

-- ----------------------------
-- Table structure for `twk_res_ad`
-- ----------------------------
DROP TABLE IF EXISTS `twk_res_ad`;
CREATE TABLE `twk_res_ad` (
  `res_id` varchar(15) NOT NULL,
  `anagraphicaldata_id` int(11) NOT NULL,
  PRIMARY KEY (`res_id`,`anagraphicaldata_id`),
  KEY `idx_res_anagr_resid` (`res_id`),
  KEY `idx_res_anagr_adid` (`anagraphicaldata_id`),
  CONSTRAINT `fk_res_anagr_adid` FOREIGN KEY (`anagraphicaldata_id`) REFERENCES `olpl_anagraphicaldata` (`id`),
  CONSTRAINT `fk_res_anagr_resid` FOREIGN KEY (`res_id`) REFERENCES `twk_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_res_ad
-- ----------------------------
INSERT INTO `twk_res_ad` VALUES ('1', '1');
INSERT INTO `twk_res_ad` VALUES ('2', '2');

-- ----------------------------
-- Table structure for `twk_resource`
-- ----------------------------
DROP TABLE IF EXISTS `twk_resource`;
CREATE TABLE `twk_resource` (
  `id` varchar(15) NOT NULL,
  `discriminator` varchar(10) NOT NULL,
  `inherit` bit(1) DEFAULT NULL,
  `propagate` bit(1) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `hidden` bit(1) DEFAULT NULL,
  `hiddenOn` datetime DEFAULT NULL,
  `hiddenBy` varchar(255) DEFAULT NULL,
  `customField1` varchar(255) DEFAULT NULL,
  `customField2` varchar(255) DEFAULT NULL,
  `customField3` varchar(255) DEFAULT NULL,
  `customField4` varchar(255) DEFAULT NULL,
  `customField5` varchar(255) DEFAULT NULL,
  `customField6` varchar(255) DEFAULT NULL,
  `ancestorids` varchar(255) DEFAULT NULL,
  `parent` varchar(15) DEFAULT NULL,
  `ownerx` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `externalCode` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  `myPhoto` varchar(255) DEFAULT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  `jobDescription` varchar(2000) DEFAULT NULL,
  `staff` bit(1) NOT NULL,
  `myManager` varchar(15) DEFAULT NULL,
  `myManagerIds` varchar(255) DEFAULT NULL,
  `myCostAggregator` varchar(15) DEFAULT NULL,
  `hourlyCostx` double DEFAULT NULL,
  `workDailyCapacity` bigint(20) DEFAULT NULL,
  `tags` varchar(1024) DEFAULT NULL,
  `personName` varchar(255) DEFAULT NULL,
  `personSurname` varchar(255) DEFAULT NULL,
  `courtesyTitle` varchar(255) DEFAULT NULL,
  `hiringDate` datetime DEFAULT NULL,
  `personalInterest` varchar(2000) DEFAULT NULL,
  `blackBoardNotes` varchar(255) DEFAULT NULL,
  `myself` int(11) DEFAULT NULL,
  `typex` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_twres_ancids` (`ancestorids`),
  KEY `idx_res_res` (`parent`),
  KEY `idx_res_owner` (`ownerx`),
  KEY `idx_worker_area` (`area`),
  KEY `idx_res_name` (`name`),
  KEY `idx_res_code` (`code`),
  KEY `idx_res_loc` (`location`),
  KEY `idx_res_boss` (`myManager`),
  KEY `idx_res_manids` (`myManagerIds`),
  KEY `idx_res_cc` (`myCostAggregator`),
  KEY `idx_res_pername` (`personName`),
  KEY `idx_res_persurname` (`personSurname`),
  KEY `idx_res_op` (`myself`),
  KEY `idx_res_type` (`typex`),
  CONSTRAINT `fk_res_boss` FOREIGN KEY (`myManager`) REFERENCES `twk_resource` (`id`),
  CONSTRAINT `fk_res_cc` FOREIGN KEY (`myCostAggregator`) REFERENCES `twk_cost_aggregator` (`id`),
  CONSTRAINT `fk_res_loc` FOREIGN KEY (`location`) REFERENCES `olpl_location` (`id`),
  CONSTRAINT `fk_res_op` FOREIGN KEY (`myself`) REFERENCES `olpl_operator` (`id`),
  CONSTRAINT `fk_res_owner` FOREIGN KEY (`ownerx`) REFERENCES `olpl_operator` (`id`),
  CONSTRAINT `fk_res_res` FOREIGN KEY (`parent`) REFERENCES `twk_resource` (`id`),
  CONSTRAINT `fk_res_type` FOREIGN KEY (`typex`) REFERENCES `olpl_departmenttype` (`id`),
  CONSTRAINT `fk_worker_area` FOREIGN KEY (`area`) REFERENCES `olpl_area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_resource
-- ----------------------------
INSERT INTO `twk_resource` VALUES ('1', 'PERSON', '\0', '', '2017-05-16 10:02:00', 'System Manager', null, '2017-05-16 03:43:41', '\0', null, null, null, null, null, null, null, null, '2^', '2', null, '1', 'Manager System', null, null, null, null, null, null, '\0', null, null, null, '0', '28800000', null, 'System', 'Manager', null, null, null, null, '1', null);
INSERT INTO `twk_resource` VALUES ('2', 'COMPANY', '\0', '', '2017-05-16 10:02:00', 'System Manager', 'System Manager', '2017-05-16 10:02:00', '\0', null, null, null, null, null, null, null, null, null, null, '1', '1', 'TC', null, null, null, null, null, null, '\0', null, null, null, '0', '0', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `twk_stickynote`
-- ----------------------------
DROP TABLE IF EXISTS `twk_stickynote`;
CREATE TABLE `twk_stickynote` (
  `id` varchar(15) NOT NULL,
  `author` varchar(15) DEFAULT NULL,
  `receiver` varchar(15) DEFAULT NULL,
  `board` varchar(15) DEFAULT NULL,
  `typex` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message` varchar(4000) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `w` int(11) DEFAULT NULL,
  `h` int(11) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `iconized` bit(1) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `readOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_stickynote_operator_author` (`author`),
  KEY `idx_sticky_oper_receiv` (`receiver`),
  KEY `idx_sticky_board` (`board`),
  CONSTRAINT `fk_stickynote_operator_author` FOREIGN KEY (`author`) REFERENCES `twk_resource` (`id`),
  CONSTRAINT `fk_sticky_board` FOREIGN KEY (`board`) REFERENCES `twk_board` (`id`),
  CONSTRAINT `fk_sticky_oper_receiv` FOREIGN KEY (`receiver`) REFERENCES `twk_resource` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_stickynote
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_task`
-- ----------------------------
DROP TABLE IF EXISTS `twk_task`;
CREATE TABLE `twk_task` (
  `id` varchar(15) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `relevancex` int(11) DEFAULT NULL,
  `progress` double DEFAULT NULL,
  `tags` varchar(1024) DEFAULT NULL,
  `progressByWorklog` bit(1) DEFAULT NULL,
  `totalWorklogDone` bigint(20) DEFAULT NULL,
  `totalWorklogEstimated` bigint(20) DEFAULT NULL,
  `totalCostsDone` double DEFAULT NULL,
  `totalCostsEstimated` double DEFAULT NULL,
  `totalIssues` int(11) DEFAULT NULL,
  `totalIssuesOpen` int(11) DEFAULT NULL,
  `totalIssuesScoreOpen` int(11) DEFAULT NULL,
  `totalIssuesScoreClosed` int(11) DEFAULT NULL,
  `totalEstimatedFromIssues` bigint(20) DEFAULT NULL,
  `schedule` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `forumEntry` int(11) DEFAULT NULL,
  `externalCode` varchar(50) DEFAULT NULL,
  `costCenter` varchar(15) DEFAULT NULL,
  `notes` varchar(2000) DEFAULT NULL,
  `orderFactor` varchar(255) DEFAULT NULL,
  `startIsMilestone` bit(1) DEFAULT NULL,
  `endIsMilestone` bit(1) DEFAULT NULL,
  `forecasted` double DEFAULT NULL,
  `customField1` varchar(255) DEFAULT NULL,
  `customField2` varchar(255) DEFAULT NULL,
  `customField3` varchar(255) DEFAULT NULL,
  `customField4` varchar(255) DEFAULT NULL,
  `customField5` varchar(255) DEFAULT NULL,
  `customField6` varchar(255) DEFAULT NULL,
  `budgetCustomField1` varchar(255) DEFAULT NULL,
  `budgetCustomField2` varchar(255) DEFAULT NULL,
  `budgetCustomField3` varchar(255) DEFAULT NULL,
  `budgetCustomField4` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `hidden` bit(1) DEFAULT NULL,
  `hiddenOn` datetime DEFAULT NULL,
  `hiddenBy` varchar(255) DEFAULT NULL,
  `ancestorids` varchar(255) DEFAULT NULL,
  `parent` varchar(15) DEFAULT NULL,
  `ownerx` int(11) DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `inherit` bit(1) DEFAULT NULL,
  `propagate` bit(1) DEFAULT NULL,
  `jsonData` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_tsk_code` (`code`),
  KEY `idx_task_name` (`name`),
  KEY `idx_task_type` (`type`),
  KEY `idx_task_schedule` (`schedule`),
  KEY `idx_task_forum` (`forumEntry`),
  KEY `idx_task_ancids` (`ancestorids`),
  KEY `idx_task_task` (`parent`),
  KEY `idx_task_owner` (`ownerx`),
  KEY `idx_task_area` (`area`),
  CONSTRAINT `fk_task_area` FOREIGN KEY (`area`) REFERENCES `olpl_area` (`id`),
  CONSTRAINT `fk_task_forum` FOREIGN KEY (`forumEntry`) REFERENCES `olpl_ws_forum` (`id`),
  CONSTRAINT `fk_task_owner` FOREIGN KEY (`ownerx`) REFERENCES `olpl_operator` (`id`),
  CONSTRAINT `fk_task_schedule` FOREIGN KEY (`schedule`) REFERENCES `olpl_schedule` (`id`),
  CONSTRAINT `fk_task_task` FOREIGN KEY (`parent`) REFERENCES `twk_task` (`id`),
  CONSTRAINT `fk_task_type` FOREIGN KEY (`type`) REFERENCES `olpl_lookup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_task
-- ----------------------------
INSERT INTO `twk_task` VALUES ('1', '1122', '122', '10', '', 'STATUS_ACTIVE', '20', '1', '', '\0', '0', '0', '0', '0', '8', '8', '16', '0', '0', '17', '11', null, null, null, null, null, '\0', '\0', '0', null, null, null, null, null, null, null, null, null, null, '2017-05-16 22:35:30', 'System Manager', 'System Manager', '2017-05-16 22:35:30', '\0', null, null, null, null, '1', '1', '\0', '', null);

-- ----------------------------
-- Table structure for `twk_task_costs`
-- ----------------------------
DROP TABLE IF EXISTS `twk_task_costs`;
CREATE TABLE `twk_task_costs` (
  `task_id` varchar(15) NOT NULL,
  `cost_id` varchar(15) NOT NULL,
  PRIMARY KEY (`task_id`,`cost_id`),
  KEY `idx_taskCosts_task` (`task_id`),
  KEY `idx_taskCosts_cost` (`cost_id`),
  CONSTRAINT `fk_taskCosts_cost` FOREIGN KEY (`cost_id`) REFERENCES `twk_cost` (`id`),
  CONSTRAINT `fk_taskCosts_task` FOREIGN KEY (`task_id`) REFERENCES `twk_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_task_costs
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_task_data_hist`
-- ----------------------------
DROP TABLE IF EXISTS `twk_task_data_hist`;
CREATE TABLE `twk_task_data_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdOn` datetime DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `forecasted` double NOT NULL,
  `progress` double NOT NULL,
  `startDate` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `taskId` varchar(255) DEFAULT NULL,
  `teamSize` int(11) NOT NULL,
  `totalCostsDone` double NOT NULL,
  `totalCostsEstimated` double NOT NULL,
  `totalDescendant` int(11) NOT NULL,
  `totalDescendantClosed` int(11) NOT NULL,
  `totalDocuments` int(11) NOT NULL,
  `totalEstimatedFromIssues` bigint(20) NOT NULL,
  `totalIssues` int(11) NOT NULL,
  `totalIssuesOpen` int(11) NOT NULL,
  `totalIssuesScoreClosed` int(11) NOT NULL,
  `totalIssuesScoreOpen` int(11) NOT NULL,
  `totalWorklogDone` bigint(20) NOT NULL,
  `totalWorklogEstimated` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tskdathist_createdon` (`createdOn`),
  KEY `idx_tskdathist_tskid` (`taskId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_task_data_hist
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_task_sched_hist`
-- ----------------------------
DROP TABLE IF EXISTS `twk_task_sched_hist`;
CREATE TABLE `twk_task_sched_hist` (
  `id` varchar(15) NOT NULL,
  `task` varchar(15) DEFAULT NULL,
  `changeLog` varchar(2000) DEFAULT NULL,
  `schedule` int(11) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsk_sched_task` (`task`),
  KEY `idx_tsk_sched_hist` (`schedule`),
  CONSTRAINT `fk_tsk_sched_hist` FOREIGN KEY (`schedule`) REFERENCES `olpl_schedule` (`id`),
  CONSTRAINT `fk_tsk_sched_task` FOREIGN KEY (`task`) REFERENCES `twk_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_task_sched_hist
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_task_status_hist`
-- ----------------------------
DROP TABLE IF EXISTS `twk_task_status_hist`;
CREATE TABLE `twk_task_status_hist` (
  `id` varchar(15) NOT NULL,
  `task` varchar(15) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `changeLog` varchar(2000) DEFAULT NULL,
  `fromStatus` varchar(255) DEFAULT NULL,
  `toStatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsk_stat_task` (`task`),
  CONSTRAINT `fk_tsk_stat_task` FOREIGN KEY (`task`) REFERENCES `twk_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_task_status_hist
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_taskdep`
-- ----------------------------
DROP TABLE IF EXISTS `twk_taskdep`;
CREATE TABLE `twk_taskdep` (
  `id` varchar(15) NOT NULL,
  `task` varchar(15) DEFAULT NULL,
  `depends` varchar(15) DEFAULT NULL,
  `lag` int(11) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tskdep_task` (`task`),
  KEY `idx_tskdep_deps` (`depends`),
  CONSTRAINT `fk_tskdep_deps` FOREIGN KEY (`depends`) REFERENCES `twk_task` (`id`),
  CONSTRAINT `fk_tskdep_task` FOREIGN KEY (`task`) REFERENCES `twk_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_taskdep
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_taskprocess`
-- ----------------------------
DROP TABLE IF EXISTS `twk_taskprocess`;
CREATE TABLE `twk_taskprocess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `processInstance` bigint(20) DEFAULT NULL,
  `task` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tp_process` (`processInstance`),
  KEY `idx_tp_task` (`task`),
  CONSTRAINT `fk_tp_process` FOREIGN KEY (`processInstance`) REFERENCES `flow_processinstance` (`ID_`),
  CONSTRAINT `fk_tp_task` FOREIGN KEY (`task`) REFERENCES `twk_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_taskprocess
-- ----------------------------

-- ----------------------------
-- Table structure for `twk_worklog`
-- ----------------------------
DROP TABLE IF EXISTS `twk_worklog`;
CREATE TABLE `twk_worklog` (
  `discriminator` varchar(31) NOT NULL,
  `id` varchar(255) NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `lastModifier` varchar(255) DEFAULT NULL,
  `hidden` bit(1) DEFAULT NULL,
  `hiddenBy` varchar(255) DEFAULT NULL,
  `hiddenOn` datetime DEFAULT NULL,
  `action` varchar(2000) DEFAULT NULL,
  `customField1` varchar(255) DEFAULT NULL,
  `customField2` varchar(255) DEFAULT NULL,
  `customField3` varchar(255) DEFAULT NULL,
  `customField4` varchar(255) DEFAULT NULL,
  `duration` bigint(20) NOT NULL,
  `inserted` datetime DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `assig` varchar(15) DEFAULT NULL,
  `issue` varchar(255) DEFAULT NULL,
  `statusx` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_worklog_assig` (`assig`),
  KEY `idx_worklog_inserted` (`inserted`),
  KEY `idx_worklog_issue` (`issue`),
  KEY `idx_worklog_wklsts` (`statusx`),
  CONSTRAINT `fk_worklog_assig` FOREIGN KEY (`assig`) REFERENCES `twk_assignment` (`id`),
  CONSTRAINT `fk_worklog_issue` FOREIGN KEY (`issue`) REFERENCES `twk_issue` (`id`),
  CONSTRAINT `fk_worklog_wklsts` FOREIGN KEY (`statusx`) REFERENCES `olpl_lookup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twk_worklog
-- ----------------------------
