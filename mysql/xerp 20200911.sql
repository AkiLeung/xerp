/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL57
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : localhost:3306
 Source Schema         : xerp

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : 65001

 Date: 11/09/2020 23:47:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_flw_vacation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_flw_vacation`;
CREATE TABLE `tbl_flw_vacation`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `bill_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `subject` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `message` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `flow_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `flow_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `flow_node_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `flow_node_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `flow_node_num` int(4) NULL DEFAULT NULL,
  `flow_node_nam` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `flow_creator_num` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `flow_creator_nam` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `cur_handler_num` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `cur_handler_nam` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `updated_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_hr_org_business
-- ----------------------------
DROP TABLE IF EXISTS `tbl_hr_org_business`;
CREATE TABLE `tbl_hr_org_business`  (
  `uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `business_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `business_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `supervisor_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `comment` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_czech_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_hr_org_business
-- ----------------------------
INSERT INTO `tbl_hr_org_business` VALUES ('6f7ce001db4b4bdd8c3d6d799e72389e', 'BS10003', '游戏事业部', '', '', '', 3, '01', '系统管理员', '2019-12-26 16:59:03', '系统管理员', '2019-12-26 16:59:03');
INSERT INTO `tbl_hr_org_business` VALUES ('80bc675c7ee743c9966e950e3911cea7', 'BS10004', '研发事业部', '', '', '', 4, '01', '系统管理员', '2019-12-26 16:59:22', '系统管理员', '2019-12-26 16:59:22');
INSERT INTO `tbl_hr_org_business` VALUES ('91b007a9e28342c0a7d059e9a4eab691', 'BS10001', '采购事业部', NULL, NULL, 'TEST1', 1, '01', NULL, NULL, NULL, NULL);
INSERT INTO `tbl_hr_org_business` VALUES ('d64ebab359f54a10bf2b69fc4cb8d599', 'BS10002', '销售事业部', NULL, NULL, 'TEST2', 2, '01', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tbl_hr_org_business_unit
-- ----------------------------
DROP TABLE IF EXISTS `tbl_hr_org_business_unit`;
CREATE TABLE `tbl_hr_org_business_unit`  (
  `uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `parent_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `unit_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `unit_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `supervisor_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `sort` float NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_czech_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_hr_org_business_unit
-- ----------------------------
INSERT INTO `tbl_hr_org_business_unit` VALUES ('17d5787cf2a74aa1972ca65f9c575182', '91b007a9e28342c0a7d059e9a4eab691', 'BS-D0001', '采购组A', '', '', '', 1, '01', '系统管理员', '2020-09-04 22:54:46', '系统管理员', '2020-09-04 22:54:46');
INSERT INTO `tbl_hr_org_business_unit` VALUES ('6dee8a02502746edbb044c193e63c7fe', '91b007a9e28342c0a7d059e9a4eab691', 'BS-D0002', '采购组B', '', '', '', 1, '99', '系统管理员', '2020-09-04 23:19:57', '系统管理员', '2020-09-04 23:33:33');

-- ----------------------------
-- Table structure for tbl_hr_org_company
-- ----------------------------
DROP TABLE IF EXISTS `tbl_hr_org_company`;
CREATE TABLE `tbl_hr_org_company`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `parent_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `company_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `company_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `country` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `language` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `fax_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `supervisor_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `factory` varchar(5) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `warehouse` varchar(5) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `sort` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_hr_org_company
-- ----------------------------
INSERT INTO `tbl_hr_org_company` VALUES ('456757ec9a014e4391cb4fa3b6e42cd0', 'ec8fa583237c459abbdd6c77cfc0a94f', '1003', 'C 股份有限公司', 'C Address', 'LA', 'US', 'en_US', 'xxxxxxx', '123456789', '789456@GOOGLE.COM', '', '', '', 'true', 'true', '3', '01', '系统管理员', '2019-12-26 20:24:50', '系统管理员', '2019-12-27 17:43:15');
INSERT INTO `tbl_hr_org_company` VALUES ('7d4ef4e7a0fc44b3bc48afac73293da5', 'ec8fa583237c459abbdd6c77cfc0a94f', '1002', 'B 有限责任公司', 'B Address', '广州', 'CN', 'zh_CN', '020-123456789', '798456123', '132456789@163.com', '', '', '', 'true', 'true', '2', '01', '系统管理员', '2019-12-26 00:33:23', '系统管理员', '2019-12-27 17:43:11');
INSERT INTO `tbl_hr_org_company` VALUES ('c858f352ec4642c98e4a192b7d72f632', 'ec8fa583237c459abbdd6c77cfc0a94f', '1001', 'A 有限责任公司', 'A Address', '中山', 'CN', 'zh_CN', '0760', '12345679', '123456789@123.com', '', '', '', 'true', 'true', '1', '01', '系统管理员', '2019-12-25 22:45:28', '系统管理员', '2019-12-27 17:43:52');
INSERT INTO `tbl_hr_org_company` VALUES ('ec8fa583237c459abbdd6c77cfc0a94f', '', '1000', '科技集团有限公司', '中山市XXXXXXXXXX路', '中山', 'CN', 'zh_CN', '0760-XXXXX1', 'FAX:1234567890', '0123456789@168.COM', '', '', '测试用', 'false', 'false', '0', '01', '系统管理员', '2019-12-20 22:25:53', '系统管理员', '2019-12-27 17:43:19');

-- ----------------------------
-- Table structure for tbl_hr_org_department
-- ----------------------------
DROP TABLE IF EXISTS `tbl_hr_org_department`;
CREATE TABLE `tbl_hr_org_department`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `parent_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `department_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `department_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `supervisor_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `sort` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_czech_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_hr_org_department
-- ----------------------------
INSERT INTO `tbl_hr_org_department` VALUES ('05cead9d1a9c4e8daf90bfdd9fbee294', '31bcc9881f8544da8272fb9e15151e62', 'M10010402', '采购组B', '', '', '', '2', '01', '系统管理员', '2019-12-25 23:43:25', '系统管理员', '2019-12-25 23:43:25');
INSERT INTO `tbl_hr_org_department` VALUES ('068ad392943d43cb9586c0752931fa68', 'c858f352ec4642c98e4a192b7d72f632', 'M100105', '财务部', '', '', '', '5', '01', '系统管理员', '2019-12-25 23:32:47', '系统管理员', '2019-12-25 23:32:47');
INSERT INTO `tbl_hr_org_department` VALUES ('0e88018cae574ea283f516cb6270f0ac', '068ad392943d43cb9586c0752931fa68', 'M10010505', '出纳组', '', '', '', '5', '01', '系统管理员', '2019-12-25 23:45:08', '系统管理员', '2019-12-25 23:45:08');
INSERT INTO `tbl_hr_org_department` VALUES ('1b73c48ddaa94b0b8a09007f0b24932f', '4108a4b637e4413bb1cef8231bb42ab1', 'M10010102', '行政组', '', '', '', '2', '01', '系统管理员', '2019-12-25 23:47:15', '系统管理员', '2019-12-25 23:47:15');
INSERT INTO `tbl_hr_org_department` VALUES ('24664f6d43664484988e657aeed81150', '9ef97d037763466293c8e44c79270784', 'M10010302', '外语销售', '', '', '', '2', '01', '系统管理员', '2019-12-25 23:34:17', '系统管理员', '2019-12-25 23:34:26');
INSERT INTO `tbl_hr_org_department` VALUES ('31231a811da449c98d778b244e91ae68', 'c4ce497d5d6b4c528f74ac876f13f873', 'M10010203', '薪酬组', '', '', '', '3', '01', '系统管理员', '2019-12-25 23:46:30', '系统管理员', '2019-12-25 23:46:30');
INSERT INTO `tbl_hr_org_department` VALUES ('31bcc9881f8544da8272fb9e15151e62', 'c858f352ec4642c98e4a192b7d72f632', 'M100104', '采购部', '', '', '', '4', '01', '系统管理员', '2019-12-25 23:32:19', '系统管理员', '2019-12-25 23:32:19');
INSERT INTO `tbl_hr_org_department` VALUES ('3a870e8c0a7d4fea919a025821ea3858', 'c4ce497d5d6b4c528f74ac876f13f873', 'M10010202', '招聘组', '', '', '', '2', '01', '系统管理员', '2019-12-25 23:46:15', '系统管理员', '2019-12-25 23:46:15');
INSERT INTO `tbl_hr_org_department` VALUES ('4108a4b637e4413bb1cef8231bb42ab1', 'c858f352ec4642c98e4a192b7d72f632', 'M100101', '行政部', '', '', '', '1', '01', '系统管理员', '2019-12-25 23:31:11', '系统管理员', '2019-12-25 23:31:11');
INSERT INTO `tbl_hr_org_department` VALUES ('4180c97c46f04d2db9f74f059f5a5b76', 'c858f352ec4642c98e4a192b7d72f632', 'M100106', ' IT 部', '', '', '', '6', '01', '系统管理员', '2019-12-25 23:33:18', '系统管理员', '2019-12-25 23:33:32');
INSERT INTO `tbl_hr_org_department` VALUES ('45c1a9bdff6e4916aa07cb0753f756cd', '24664f6d43664484988e657aeed81150', 'M1001030201', '外语销售组A', '', '', '', '1', '01', '系统管理员', '2019-12-25 23:42:42', '系统管理员', '2019-12-25 23:42:42');
INSERT INTO `tbl_hr_org_department` VALUES ('484422f4b0d54637b16f2156ae219777', '4180c97c46f04d2db9f74f059f5a5b76', 'M10010602', '系统管理科', '', '', '', '2', '01', '系统管理员', '2019-12-25 23:45:42', '系统管理员', '2019-12-25 23:45:42');
INSERT INTO `tbl_hr_org_department` VALUES ('4845a7fc12ed498bbdc8bdb81896d625', '068ad392943d43cb9586c0752931fa68', 'M10010501', '总账组', '', '', '', '1', '01', '系统管理员', '2019-12-25 23:44:00', '系统管理员', '2019-12-25 23:44:00');
INSERT INTO `tbl_hr_org_department` VALUES ('54adc12792fa495fb8f4af1ccefb8c4c', '068ad392943d43cb9586c0752931fa68', 'M10010503', '应付组', '', '', '', '3', '01', '系统管理员', '2019-12-25 23:44:37', '系统管理员', '2019-12-25 23:44:37');
INSERT INTO `tbl_hr_org_department` VALUES ('5d37138b99904660b4e32107c21403f8', '31bcc9881f8544da8272fb9e15151e62', 'M10010403', '采购组C', '', '', '', '3', '01', '系统管理员', '2019-12-25 23:43:39', '系统管理员', '2019-12-25 23:43:39');
INSERT INTO `tbl_hr_org_department` VALUES ('65f5d05f2c294a729e04ab3db842aef3', 'a9d75823fee54e9ea0f2f743384864cc', 'M1001030101', '中文销售组A', '', '', '', '1', '01', '系统管理员', '2019-12-25 23:36:36', '系统管理员', '2019-12-25 23:36:36');
INSERT INTO `tbl_hr_org_department` VALUES ('7a54c082284144b5848b516ad50b2648', 'ec8fa583237c459abbdd6c77cfc0a94f', 'M100000', '董事会', '', '', '', '0', '01', '系统管理员', '2019-12-25 23:13:41', '系统管理员', '2019-12-25 23:24:11');
INSERT INTO `tbl_hr_org_department` VALUES ('87c484d5629d4c25a74e7649f3d49a43', '068ad392943d43cb9586c0752931fa68', 'M10010504', '资产组', '', '', '', '4', '01', '系统管理员', '2019-12-25 23:44:47', '系统管理员', '2019-12-25 23:44:47');
INSERT INTO `tbl_hr_org_department` VALUES ('96568724d4d44df990db926b60ae5de9', '4108a4b637e4413bb1cef8231bb42ab1', 'M10010101', '前台部', '', '', '', '1', '01', '系统管理员', '2019-12-25 23:46:58', '系统管理员', '2019-12-25 23:46:58');
INSERT INTO `tbl_hr_org_department` VALUES ('96e455b757a54414857dcc969618d885', 'c4ce497d5d6b4c528f74ac876f13f873', 'M10010201', '考勤组', '', '', '', '1', '01', '系统管理员', '2019-12-25 23:46:04', '系统管理员', '2019-12-25 23:46:04');
INSERT INTO `tbl_hr_org_department` VALUES ('993e967c563f42238d836485efadb2df', 'ec8fa583237c459abbdd6c77cfc0a94f', 'M100001', '董秘办', '', '', '', '1', '01', '系统管理员', '2019-12-25 23:14:01', '系统管理员', '2019-12-25 23:24:17');
INSERT INTO `tbl_hr_org_department` VALUES ('9ef97d037763466293c8e44c79270784', 'c858f352ec4642c98e4a192b7d72f632', 'M100103', '销售部', '', '', '', '3', '01', '系统管理员', '2019-12-25 23:32:09', '系统管理员', '2019-12-25 23:32:09');
INSERT INTO `tbl_hr_org_department` VALUES ('a9d75823fee54e9ea0f2f743384864cc', '9ef97d037763466293c8e44c79270784', 'M10010301', '中文销售', '', '', '', '1', '01', '系统管理员', '2019-12-25 23:34:03', '系统管理员', '2019-12-25 23:34:03');
INSERT INTO `tbl_hr_org_department` VALUES ('ad093906c9f84ad6b860fefbb289927e', 'ec8fa583237c459abbdd6c77cfc0a94f', 'M100002', '财务部', '', '', '', '2', '01', '系统管理员', '2019-12-25 23:14:43', '系统管理员', '2019-12-25 23:24:25');
INSERT INTO `tbl_hr_org_department` VALUES ('ba5d51dfc7754c50a286b3dab25d7abe', '24664f6d43664484988e657aeed81150', 'M1001030202', '外语销售组B', '', '', '', '1', '01', '系统管理员', '2019-12-25 23:42:54', '系统管理员', '2019-12-25 23:42:54');
INSERT INTO `tbl_hr_org_department` VALUES ('c4ce497d5d6b4c528f74ac876f13f873', 'c858f352ec4642c98e4a192b7d72f632', 'M100102', '人事部', '', '', '', '2', '01', '系统管理员', '2019-12-25 23:32:01', '系统管理员', '2019-12-25 23:32:01');
INSERT INTO `tbl_hr_org_department` VALUES ('c5aca38e8a4f4c629ba357c06656a31e', '31bcc9881f8544da8272fb9e15151e62', 'M10010401', '采购组A', '', '', '', '1', '01', '系统管理员', '2019-12-25 23:43:12', '系统管理员', '2019-12-25 23:43:12');
INSERT INTO `tbl_hr_org_department` VALUES ('e14592db112443cda9a873e8aed174c7', 'a9d75823fee54e9ea0f2f743384864cc', 'M1001030102', '中文销售组B', '', '', '', '2', '01', '系统管理员', '2019-12-25 23:36:47', '系统管理员', '2019-12-25 23:36:47');
INSERT INTO `tbl_hr_org_department` VALUES ('e2ffee3114084e30a8a55d57d4efbda2', '4180c97c46f04d2db9f74f059f5a5b76', 'M10010601', '系统应用科', '', '', '', '1', '01', '系统管理员', '2019-12-25 23:45:21', '系统管理员', '2019-12-25 23:45:21');
INSERT INTO `tbl_hr_org_department` VALUES ('e37f888f6b7c48ab85d44102d6f4d8ae', '068ad392943d43cb9586c0752931fa68', 'M10010502', '应收组', '', '', '', '2', '01', '系统管理员', '2019-12-25 23:44:27', '系统管理员', '2019-12-25 23:44:27');
INSERT INTO `tbl_hr_org_department` VALUES ('eaeabcb1217549498e5d1e8dabfce635', 'ec8fa583237c459abbdd6c77cfc0a94f', 'M100003', '总经办', '', '', '', '3', '01', '系统管理员', '2019-12-25 23:15:05', '系统管理员', '2019-12-25 23:24:31');
INSERT INTO `tbl_hr_org_department` VALUES ('eb31ce6b55944dc5ba8848413e85aa1c', 'a9d75823fee54e9ea0f2f743384864cc', 'M1001030103', '中文销售组C', '', '', '', '3', '01', '系统管理员', '2019-12-25 23:37:02', '系统管理员', '2019-12-25 23:37:02');

-- ----------------------------
-- Table structure for tbl_hr_org_factory
-- ----------------------------
DROP TABLE IF EXISTS `tbl_hr_org_factory`;
CREATE TABLE `tbl_hr_org_factory`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `company_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `factory_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `factory_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_czech_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_hr_org_factory
-- ----------------------------
INSERT INTO `tbl_hr_org_factory` VALUES ('13a544232fbc46b69d7b75e901359925', '456757ec9a014e4391cb4fa3b6e42cd0', '1003-01', 'C01 工厂', '', 1, '01', '系统管理员', '2019-12-27 18:26:11', '系统管理员', '2019-12-27 18:26:11');
INSERT INTO `tbl_hr_org_factory` VALUES ('5570c0a5f0ea46218840f8a85fa691bb', 'c858f352ec4642c98e4a192b7d72f632', '1001-02', 'A02 工厂', '', 2, '01', '系统管理员', '2019-12-27 18:25:25', '系统管理员', '2019-12-27 18:25:33');
INSERT INTO `tbl_hr_org_factory` VALUES ('5f28fcf8ada241ef9e30258ea76499c1', 'c858f352ec4642c98e4a192b7d72f632', '1001-01', 'A01 工厂', '', 1, '01', '系统管理员', '2019-12-27 18:25:07', '系统管理员', '2019-12-27 18:25:38');
INSERT INTO `tbl_hr_org_factory` VALUES ('82b6465e3f624fa3ae8ff463198c42ac', '7d4ef4e7a0fc44b3bc48afac73293da5', '1002-01', 'B01 工厂', '', 1, '01', '系统管理员', '2019-12-27 18:25:52', '系统管理员', '2019-12-27 18:25:52');

-- ----------------------------
-- Table structure for tbl_hr_org_location
-- ----------------------------
DROP TABLE IF EXISTS `tbl_hr_org_location`;
CREATE TABLE `tbl_hr_org_location`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `factory_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `location_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `location_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `comment` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_hr_org_location
-- ----------------------------
INSERT INTO `tbl_hr_org_location` VALUES ('01cea1a32f984a71b9d23a926e6e25c1', '5f28fcf8ada241ef9e30258ea76499c1', '1001-01-02', '成品仓库', NULL, 2, '01', '系统管理员', '2019-12-27 23:48:56', '系统管理员', '2019-12-27 23:54:57');
INSERT INTO `tbl_hr_org_location` VALUES ('6d5ed4673f3548fb9101f22735a48d5b', '5f28fcf8ada241ef9e30258ea76499c1', '1001-01-03', '半成品库', '', 3, '01', '系统管理员', '2019-12-28 00:00:16', '系统管理员', '2019-12-28 00:00:16');
INSERT INTO `tbl_hr_org_location` VALUES ('f5653370f4044c8180f0b7be042368b7', '5f28fcf8ada241ef9e30258ea76499c1', '1001-01-01', '原料库', '', 1, '01', '系统管理员', '2019-12-27 23:59:25', '系统管理员', '2019-12-27 23:59:25');

-- ----------------------------
-- Table structure for tbl_hr_org_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `tbl_hr_org_warehouse`;
CREATE TABLE `tbl_hr_org_warehouse`  (
  `uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `company_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `warehouse_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `warehouse_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `comment` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_czech_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_hr_org_warehouse
-- ----------------------------
INSERT INTO `tbl_hr_org_warehouse` VALUES ('58fe7e7af1164d3aa1265d5e9569f66f', '456757ec9a014e4391cb4fa3b6e42cd0', 'W100201', '加州#02 货仓', '', '', 1, '01', '系统管理员', '2019-12-29 17:53:30', '系统管理员', '2019-12-29 17:53:30');
INSERT INTO `tbl_hr_org_warehouse` VALUES ('616204eeba374dea9e46b7ae8dd7a98e', '7d4ef4e7a0fc44b3bc48afac73293da5', 'W100201', '中山#01 货仓', '', '', 1, '01', '系统管理员', '2019-12-29 17:53:12', '系统管理员', '2019-12-29 17:53:12');
INSERT INTO `tbl_hr_org_warehouse` VALUES ('bf60d8b53aa94fcdab76b92d4cb5c8f2', 'c858f352ec4642c98e4a192b7d72f632', 'W100101', '货仓#01', 'TEST10', 'TEST11', 1, '01', '系统管理员', '2019-12-29 17:52:39', '系统管理员', '2019-12-29 17:52:39');

-- ----------------------------
-- Table structure for tbl_hr_org_warehouse_factory
-- ----------------------------
DROP TABLE IF EXISTS `tbl_hr_org_warehouse_factory`;
CREATE TABLE `tbl_hr_org_warehouse_factory`  (
  `uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `warehouse_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `facotry_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `facotry_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `comments` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `sort` float NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_czech_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_hr_person_docs
-- ----------------------------
DROP TABLE IF EXISTS `tbl_hr_person_docs`;
CREATE TABLE `tbl_hr_person_docs`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `person_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `person_name1` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `person_name2` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `person_name3` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `identity_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `identity_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `region` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `job_position` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `cellphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `join_date` datetime(0) NULL DEFAULT NULL,
  `cmp_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `dep_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tbl_sys_config_number
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_config_number`;
CREATE TABLE `tbl_sys_config_number`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `module_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `module_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `pre_num_word` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `increment_range` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `default_length` int(4) NULL DEFAULT NULL,
  `current_range` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `current_value` int(4) NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `updated_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_config_number
-- ----------------------------
INSERT INTO `tbl_sys_config_number` VALUES ('1', '01', 'Test0001', '测试1', 'ORD', '', 10, '', 98, '2020-06-03 22:27:34', '2020-08-27 00:47:08');
INSERT INTO `tbl_sys_config_number` VALUES ('2', '01', 'Test0002', '测试2', 'ORD-Y', 'YYYY', 3, '2020', 65, '2020-06-04 00:26:57', '2020-08-27 00:37:02');
INSERT INTO `tbl_sys_config_number` VALUES ('3', '01', 'Test0003', '测试3', 'ORD-M', 'YYYYMM', 3, '202006', 14, '2020-06-04 00:26:57', '2020-06-07 18:17:59');
INSERT INTO `tbl_sys_config_number` VALUES ('4', '01', 'Test0004', '测试4', 'ORD-D', 'YYYYMMdd', 3, '20200607', 5, '2020-06-04 00:26:57', '2020-06-07 18:18:02');

-- ----------------------------
-- Table structure for tbl_sys_data_key_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_data_key_type`;
CREATE TABLE `tbl_sys_data_key_type`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `type_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `sort` int(8) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_czech_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_data_key_type
-- ----------------------------
INSERT INTO `tbl_sys_data_key_type` VALUES ('91c9fe4e33b344208e6b37da22e3b761', 'language', '語言', '01', 1);
INSERT INTO `tbl_sys_data_key_type` VALUES ('959a60a0f9be43b8baf3decbb07a1472', 'country', '國家', '01', 2);

-- ----------------------------
-- Table structure for tbl_sys_data_key_value
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_data_key_value`;
CREATE TABLE `tbl_sys_data_key_value`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `type_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `key_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `key_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `comment` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_czech_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_data_key_value
-- ----------------------------
INSERT INTO `tbl_sys_data_key_value` VALUES ('1bd803f4ab5c48bb8adc06fb39e348e1', '01', 'language', 'en_US', 'English', '', 1, 'admin', '2019-11-01 19:20:41', 'admin', '2019-11-01 19:20:41');
INSERT INTO `tbl_sys_data_key_value` VALUES ('48b03a929f094cffaa8cdcceb8119593', '01', 'language', 'zh_CN', 'Chinese', '', 2, 'admin', '2019-11-01 19:20:41', 'admin', '2019-11-01 19:20:41');
INSERT INTO `tbl_sys_data_key_value` VALUES ('552c7e8ddb6f4b20be5fe8999ec3306d', '01', 'country', 'CN', 'China', '', 1, 'admin', '2019-11-01 19:20:41', 'admin', '2019-11-01 19:20:41');
INSERT INTO `tbl_sys_data_key_value` VALUES ('7dad56a537a84baa91742e8620bf7e78', '01', 'country', 'US', 'America', '', 2, 'admin', '2019-11-01 19:20:41', 'admin', '2019-11-01 19:20:41');

-- ----------------------------
-- Table structure for tbl_sys_flow_direction
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_flow_direction`;
CREATE TABLE `tbl_sys_flow_direction`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `flow_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `node_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `direction_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `direction_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `direction_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `target_node_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `target_node_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `gooflow_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `gooflow_m` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `gooflow_alt` varchar(5) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `comment` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_czech_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_flow_direction
-- ----------------------------
INSERT INTO `tbl_sys_flow_direction` VALUES ('22164d4015044c8db93b4a7c9ba37684', '47f3837a02744a61bed31021d4c26525', '54fffcec08be4efca9cf02640d921877', '01', '1', '完成', '3', '完成', '', 'true', '', 'sl', 1, '系统管理员', '2020-01-22 17:43:47', '系统管理员', '2020-01-22 17:43:47');
INSERT INTO `tbl_sys_flow_direction` VALUES ('2b8bacf3fac8464d84ca21cff4a881f7', 'cd458d4be53b4b1eaad4a1c5aa7f8ae2', '13c55654274641aaadce70edd3205c3a', '02', '99', '退回【起草】', 'ba7ed00664fa44848601c3b8c2749403', '起草', '', 'true', '', 'sl', 99, '系统管理员', '2020-01-22 21:58:28', '系统管理员', '2020-01-22 21:58:28');
INSERT INTO `tbl_sys_flow_direction` VALUES ('4024aed8b03a4ddebf7bf15781c0e848', 'cd458d4be53b4b1eaad4a1c5aa7f8ae2', 'ba7ed00664fa44848601c3b8c2749403', '01', '3', '转交【归档】', '6180c859b90e4d758387c2da6861fb1e', '归档', '', 'true', 'TEST2', 'sl', 3, '系统管理员', '2020-09-02 23:29:18', '系统管理员', '2020-09-02 23:29:18');
INSERT INTO `tbl_sys_flow_direction` VALUES ('47b1ff3834d6441c83c7b11cfd401efb', '47f3837a02744a61bed31021d4c26525', '54fffcec08be4efca9cf02640d921877', '02', '98', '退回【审批】', '2', '审批', '', 'true', '', 'sl', 98, '系统管理员', '2020-01-22 17:44:32', '系统管理员', '2020-01-22 17:44:32');
INSERT INTO `tbl_sys_flow_direction` VALUES ('51710160dd0e4f70af9fd4b4ac524ec0', '47f3837a02744a61bed31021d4c26525', '1', '01', '1', '呈交【审批】', '2', '审批', 'sl', '', 'true', 'sl', 1, '系统管理员', '2020-01-22 17:33:04', '系统管理员', '2020-01-22 17:42:39');
INSERT INTO `tbl_sys_flow_direction` VALUES ('5b6e6c37977f448ea5011758ef8a01fe', 'cd458d4be53b4b1eaad4a1c5aa7f8ae2', 'ba7ed00664fa44848601c3b8c2749403', '01', '2', '提交【复审】', '13c55654274641aaadce70edd3205c3a', '复审', '', 'true', 'TEST', 'sl', 2, '系统管理员', '2020-09-02 23:28:56', '系统管理员', '2020-09-02 23:28:56');
INSERT INTO `tbl_sys_flow_direction` VALUES ('64c4ec4de1c44ca5b7a8b59e2cebe0f1', 'cd458d4be53b4b1eaad4a1c5aa7f8ae2', '13c55654274641aaadce70edd3205c3a', '02', '2', '退回【初审】', '229120748b7349e09c10bd08082f60e4', '初审', '', 'true', '', 'sl', 2, '系统管理员', '2020-01-22 21:58:10', '系统管理员', '2020-01-22 21:58:10');
INSERT INTO `tbl_sys_flow_direction` VALUES ('8448bbe106ea491ca38f185015a38279', 'cd458d4be53b4b1eaad4a1c5aa7f8ae2', '13c55654274641aaadce70edd3205c3a', '01', '1', '归档', '6180c859b90e4d758387c2da6861fb1e', '归档', '', 'true', '', 'sl', 1, '系统管理员', '2020-01-22 21:57:55', '系统管理员', '2020-01-22 21:57:55');
INSERT INTO `tbl_sys_flow_direction` VALUES ('866d06157af149098b24df5984c42bbb', '47f3837a02744a61bed31021d4c26525', '54fffcec08be4efca9cf02640d921877', '02', '99', '退回【起草】', '1', '起草', 'sl', '', 'true', 'sl', 99, '系统管理员', '2020-01-22 17:44:09', '系统管理员', '2020-01-22 17:44:17');
INSERT INTO `tbl_sys_flow_direction` VALUES ('99620a9969144595947b24fbc9b0056a', 'cd458d4be53b4b1eaad4a1c5aa7f8ae2', 'ba7ed00664fa44848601c3b8c2749403', '01', '1', '提交【初审】', '229120748b7349e09c10bd08082f60e4', '初审', '', 'true', '', 'sl', 1, '系统管理员', '2020-01-22 21:55:43', '系统管理员', '2020-01-22 21:55:43');
INSERT INTO `tbl_sys_flow_direction` VALUES ('c6ca1cbf94214670b3da123b3ffd0b8a', '47f3837a02744a61bed31021d4c26525', '2', '02', '99', '退回【起草】', '1', '起草', '', 'true', '', 'sl', 99, '系统管理员', '2020-01-22 17:43:29', '系统管理员', '2020-01-22 17:43:29');
INSERT INTO `tbl_sys_flow_direction` VALUES ('d67404b285fb4ba69af84d118322243f', '47f3837a02744a61bed31021d4c26525', '2', '01', '1', '报销', '54fffcec08be4efca9cf02640d921877', '报销', '', 'true', '', 'sl', 1, '系统管理员', '2020-01-22 17:43:06', '系统管理员', '2020-01-22 17:43:06');
INSERT INTO `tbl_sys_flow_direction` VALUES ('dd6f55998a5547d0b5d71d185fc8c1ad', 'cd458d4be53b4b1eaad4a1c5aa7f8ae2', '229120748b7349e09c10bd08082f60e4', '01', '1', '提交【复审】', '13c55654274641aaadce70edd3205c3a', '复审', '', 'true', '', 'sl', 1, '系统管理员', '2020-01-22 21:57:16', '系统管理员', '2020-01-22 21:57:16');
INSERT INTO `tbl_sys_flow_direction` VALUES ('ded596fc90e44874b9f10227187c18e4', 'cd458d4be53b4b1eaad4a1c5aa7f8ae2', '6180c859b90e4d758387c2da6861fb1e', '01', '1', '完成', '2ea477ac103a4225a5c4778dda63bacd', '完成', '', 'true', '', 'sl', 1, '系统管理员', '2020-01-22 21:58:41', '系统管理员', '2020-01-22 21:58:41');
INSERT INTO `tbl_sys_flow_direction` VALUES ('fa2304703b06466fb8fac598e1dd7420', 'cd458d4be53b4b1eaad4a1c5aa7f8ae2', '229120748b7349e09c10bd08082f60e4', '02', '99', '退回【起草】', 'ba7ed00664fa44848601c3b8c2749403', '起草', '', 'true', '', 'sl', 99, '系统管理员', '2020-01-22 21:57:35', '系统管理员', '2020-01-22 21:57:35');

-- ----------------------------
-- Table structure for tbl_sys_flow_module
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_flow_module`;
CREATE TABLE `tbl_sys_flow_module`  (
  `uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `module_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `module_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `comment` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `sort` varchar(11) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_czech_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_flow_module
-- ----------------------------
INSERT INTO `tbl_sys_flow_module` VALUES ('5b67edda76f848c487ea4718f6e32bbe', '01', 'M000006', '财务管理', '财务管理', '6', '系统管理员', '2020-01-21 21:41:10', '系统管理员', '2020-01-21 21:41:10');
INSERT INTO `tbl_sys_flow_module` VALUES ('62ec7c25dfdf4e13be2db03358fef60b', '01', 'M000003', '销售管理', '销售管理', '3', '系统管理员', '2020-01-21 21:40:19', '系统管理员', '2020-01-21 21:40:19');
INSERT INTO `tbl_sys_flow_module` VALUES ('64c2653b580c422ebcf9604e3eebbbf4', '01', 'M000001', '行政管理', '行政管理', '1', '系统管理员', '2020-01-21 21:39:31', '系统管理员', '2020-01-21 21:39:31');
INSERT INTO `tbl_sys_flow_module` VALUES ('735f2eb7b8ff446693be5677dcf3e89e', '01', 'M000004', '采购管理', '采购管理', '4', '系统管理员', '2020-01-21 21:40:32', '系统管理员', '2020-01-21 21:40:32');
INSERT INTO `tbl_sys_flow_module` VALUES ('7ab9e33e650e4f2680ef88fd767ea26d', '01', 'M000007', '信息管理', '信息管理', '7', '系统管理员', '2020-01-21 21:41:21', '系统管理员', '2020-01-21 21:41:21');
INSERT INTO `tbl_sys_flow_module` VALUES ('9c79269324d04d2a9dd160f2339df0d2', '01', 'M000005', '仓库管理', '仓库管理', '5', '系统管理员', '2020-01-21 21:40:55', '系统管理员', '2020-01-21 21:40:55');
INSERT INTO `tbl_sys_flow_module` VALUES ('c2e0c64b6ead4061a42cca46aab0450f', '01', 'M000002', '人事管理', '人事管理', '2', '系统管理员', '2020-01-21 21:39:49', '系统管理员', '2020-01-21 21:39:49');

-- ----------------------------
-- Table structure for tbl_sys_flow_name
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_flow_name`;
CREATE TABLE `tbl_sys_flow_name`  (
  `uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `module_code` varchar(36) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `flow_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `flow_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `flow_version` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `comment` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_czech_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_flow_name
-- ----------------------------
INSERT INTO `tbl_sys_flow_name` VALUES ('47f3837a02744a61bed31021d4c26525', 'M000006', '01', 'flow00001 ', '报销流程', '1.0', '测试', '系统管理员', '2020-01-21 23:20:47', '系统管理员', '2020-01-22 16:21:47');
INSERT INTO `tbl_sys_flow_name` VALUES ('cd458d4be53b4b1eaad4a1c5aa7f8ae2', 'M000002', '01', 'flow00002', '请假流程', '1.0', '', '系统管理员', '2020-01-22 21:54:07', '系统管理员', '2020-01-22 21:54:07');

-- ----------------------------
-- Table structure for tbl_sys_flow_node
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_flow_node`;
CREATE TABLE `tbl_sys_flow_node`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `flow_uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `node_code` int(4) NULL DEFAULT NULL,
  `node_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `node_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `handler_role` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `handler_field` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `handler_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `handler_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `edit_field` varchar(500) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `node_formula` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `gooflow_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `gooflow_left` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `gooflow_top` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `gooflow_width` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `gooflow_height` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `gooflow_alt` varchar(5) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `comment` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_czech_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_flow_node
-- ----------------------------
INSERT INTO `tbl_sys_flow_node` VALUES ('1', '47f3837a02744a61bed31021d4c26525', '01', 0, '起草', '00', NULL, NULL, NULL, NULL, NULL, NULL, 'start', '138', '30', '100', '24', NULL, NULL, '系统管理员', '2020-01-22 02:29:57', '系统管理员', '2020-01-22 02:29:57');
INSERT INTO `tbl_sys_flow_node` VALUES ('13c55654274641aaadce70edd3205c3a', 'cd458d4be53b4b1eaad4a1c5aa7f8ae2', '01', 2, '复审', '01', NULL, NULL, NULL, NULL, NULL, NULL, 'task', '138', '220', '100', '24', NULL, '', '系统管理员', '2020-01-22 21:54:37', '系统管理员', '2020-01-22 21:55:21');
INSERT INTO `tbl_sys_flow_node` VALUES ('2', '47f3837a02744a61bed31021d4c26525', '01', 1, '审批', '01', NULL, NULL, NULL, NULL, NULL, NULL, 'task', '138', '130', '100', '24', NULL, NULL, '系统管理员', '2020-01-22 02:29:57', '系统管理员', '2020-01-22 02:29:57');
INSERT INTO `tbl_sys_flow_node` VALUES ('229120748b7349e09c10bd08082f60e4', 'cd458d4be53b4b1eaad4a1c5aa7f8ae2', '01', 1, '初审', '01', NULL, NULL, NULL, NULL, NULL, NULL, 'task', '138', '120', '100', '24', NULL, '', '系统管理员', '2020-01-22 21:54:28', '系统管理员', '2020-01-22 21:55:24');
INSERT INTO `tbl_sys_flow_node` VALUES ('2ea477ac103a4225a5c4778dda63bacd', 'cd458d4be53b4b1eaad4a1c5aa7f8ae2', '01', 99, '完成', '99', NULL, NULL, NULL, NULL, NULL, NULL, 'end', '1180', '500', '100', '24', NULL, '', '系统管理员', '2020-01-22 21:54:56', '系统管理员', '2020-01-22 21:54:56');
INSERT INTO `tbl_sys_flow_node` VALUES ('3', '47f3837a02744a61bed31021d4c26525', '01', 99, '完成', '99', NULL, NULL, NULL, NULL, NULL, NULL, 'end', '138', '330', '100', '24', NULL, NULL, '系统管理员', '2020-01-22 02:29:57', '系统管理员', '2020-01-22 02:29:57');
INSERT INTO `tbl_sys_flow_node` VALUES ('54fffcec08be4efca9cf02640d921877', '47f3837a02744a61bed31021d4c26525', '01', 2, '报销', '02', NULL, NULL, NULL, NULL, NULL, NULL, 'node', '138', '230', '100', '24', NULL, '', '系统管理员', '2020-01-22 16:21:23', '系统管理员', '2020-01-22 16:21:23');
INSERT INTO `tbl_sys_flow_node` VALUES ('6180c859b90e4d758387c2da6861fb1e', 'cd458d4be53b4b1eaad4a1c5aa7f8ae2', '01', 3, '归档', '02', '办理角色	', '办理字段	', 'admin', '系统管理员', '编辑字段', '流向公式', 'node', '138', '320', '100', '24', NULL, '備註信息	', '系统管理员', '2020-01-22 21:54:50', '系统管理员', '2020-09-11 23:36:59');
INSERT INTO `tbl_sys_flow_node` VALUES ('ba7ed00664fa44848601c3b8c2749403', 'cd458d4be53b4b1eaad4a1c5aa7f8ae2', '01', 0, '起草', '00', NULL, NULL, NULL, NULL, NULL, NULL, 'start', '138', '20', '100', '24', NULL, '', '系统管理员', '2020-01-22 21:54:17', '系统管理员', '2020-09-02 01:12:24');

-- ----------------------------
-- Table structure for tbl_sys_info
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_info`;
CREATE TABLE `tbl_sys_info`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `sys_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sys_motto` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_info
-- ----------------------------
INSERT INTO `tbl_sys_info` VALUES ('81ca3d9ca72f4df2b9afcf3798976ce5', 'System Name..123', 'Company Motto..123', '系统管理员', '2019-10-30 23:44:52', '系统管理员', '2019-10-30 23:45:09');

-- ----------------------------
-- Table structure for tbl_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_log`;
CREATE TABLE `tbl_sys_log`  (
  `log_id` int(20) NOT NULL AUTO_INCREMENT,
  `log_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_class` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_line` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_thread` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_level` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_message` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1001 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_log
-- ----------------------------
INSERT INTO `tbl_sys_log` VALUES (780, 'PermissionController.java', 'com.xerp.core.controller.PermissionController', 'listData', '77', 'http-nio-8080-exec-3', 'ERROR', 'XERP Exception:org.springframework.jdbc.UncategorizedSQLException: \r\n### Error querying database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, expect RPAREN, actual QUES pos 98, line 3, column 44, token QUES : select * from tbl_sys_permission where 1 = 1\n         \n            and ( permission_code like \"%\"?\"%\" or permission_name like \"%\"?\"%\" or permission_url like \"%\"?\"%\" )\n         \n        order by permission_code asc\n         \n            limit ?,?\r\n### The error may exist in file [C:\\JOSEPH\\Tomcat9\\webapps\\xerp\\WEB-INF\\classes\\mapper\\permissionMapper.xml]\r\n### The error may involve com.xerp.core.dao.IPermissionDAO.listData\r\n### The error occurred while executing a query\r\n### SQL: select * from tbl_sys_permission where 1 = 1                       and ( permission_code like \"%\"?\"%\" or permission_name like \"%\"?\"%\" or permission_url like \"%\"?\"%\" )                   order by permission_code asc                       limit ?,?\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, expect RPAREN, actual QUES pos 98, line 3, column 44, token QUES : select * from tbl_sys_permission where 1 = 1\n         \n            and ( permission_code like \"%\"?\"%\" or permission_name like \"%\"?\"%\" or permission_url like \"%\"?\"%\" )\n         \n        order by permission_code asc\n         \n            limit ?,?\n; uncategorized SQLException; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, expect RPAREN, actual QUES pos 98, line 3, column 44, token QUES : select * from tbl_sys_permission where 1 = 1\n         \n            and ( permission_code like \"%\"?\"%\" or permission_name like \"%\"?\"%\" or permission_url like \"%\"?\"%\" )\n         \n        order by permission_code asc\n         \n            limit ?,?; nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, expect RPAREN, actual QUES pos 98, line 3, column 44, token QUES : select * from tbl_sys_permission where 1 = 1\n         \n            and ( permission_code like \"%\"?\"%\" or permission_name like \"%\"?\"%\" or permission_url like \"%\"?\"%\" )\n         \n        order by permission_code asc\n         \n            limit ?,?', '2020-01-20 21:58:45');
INSERT INTO `tbl_sys_log` VALUES (781, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-1', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-20 22:02:15');
INSERT INTO `tbl_sys_log` VALUES (782, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-1', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-20 22:43:44');
INSERT INTO `tbl_sys_log` VALUES (783, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-9', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-20 22:47:30');
INSERT INTO `tbl_sys_log` VALUES (784, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-2', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-20 22:59:26');
INSERT INTO `tbl_sys_log` VALUES (785, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-1', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-20 23:14:17');
INSERT INTO `tbl_sys_log` VALUES (786, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 00:02:22');
INSERT INTO `tbl_sys_log` VALUES (787, 'RoleUserController.java', 'com.xerp.core.controller.RoleUserController', 'listData', '65', 'http-nio-8080-exec-8', 'ERROR', 'XERP Exception:org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\r\n### The error may exist in file [C:\\JOSEPH\\Tomcat9\\webapps\\xerp\\WEB-INF\\classes\\mapper\\roleUserMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select         tbl_sys_role_user.*,         tbl_sys_user.permission_name          from tbl_sys_role_user           left join tbl_sys_user on tbl_sys_role_user.user_code = tbl_sys_user.user_code         where tbl_sys_role_user.role_code = ?          order by tbl_sys_role_user.user_code asc                       limit ?,?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'', '2020-01-21 00:08:40');
INSERT INTO `tbl_sys_log` VALUES (788, 'RoleUserController.java', 'com.xerp.core.controller.RoleUserController', 'listData', '65', 'http-nio-8080-exec-8', 'ERROR', 'XERP Exception:org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\r\n### The error may exist in file [C:\\JOSEPH\\Tomcat9\\webapps\\xerp\\WEB-INF\\classes\\mapper\\roleUserMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select         tbl_sys_role_user.*,         tbl_sys_user.permission_name          from tbl_sys_role_user           left join tbl_sys_user on tbl_sys_role_user.user_code = tbl_sys_user.user_code         where tbl_sys_role_user.role_code = ?          order by tbl_sys_role_user.user_code asc                       limit ?,?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'', '2020-01-21 00:09:11');
INSERT INTO `tbl_sys_log` VALUES (789, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-10', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 00:14:49');
INSERT INTO `tbl_sys_log` VALUES (790, 'RoleUserController.java', 'com.xerp.core.controller.RoleUserController', 'listData', '65', 'http-nio-8080-exec-3', 'ERROR', 'XERP Exception:org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\r\n### The error may exist in file [C:\\JOSEPH\\Tomcat9\\webapps\\xerp\\WEB-INF\\classes\\mapper\\roleUserMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select         tbl_sys_role_user.*,         tbl_sys_user.permission_name          from tbl_sys_role_user           left join tbl_sys_user on tbl_sys_role_user.user_code = tbl_sys_user.user_code         where tbl_sys_role_user.role_code = ?          order by tbl_sys_role_user.user_code asc                       limit ?,?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'', '2020-01-21 00:15:05');
INSERT INTO `tbl_sys_log` VALUES (791, 'RoleUserController.java', 'com.xerp.core.controller.RoleUserController', 'listData', '65', 'http-nio-8080-exec-2', 'ERROR', 'XERP Exception:org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\r\n### The error may exist in file [C:\\JOSEPH\\Tomcat9\\webapps\\xerp\\WEB-INF\\classes\\mapper\\roleUserMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select         tbl_sys_role_user.*,         tbl_sys_user.permission_name          from tbl_sys_role_user           left join tbl_sys_user on tbl_sys_role_user.user_code = tbl_sys_user.user_code         where tbl_sys_role_user.role_code = ?          order by tbl_sys_role_user.user_code asc                       limit ?,?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'', '2020-01-21 00:16:25');
INSERT INTO `tbl_sys_log` VALUES (792, 'RoleUserController.java', 'com.xerp.core.controller.RoleUserController', 'listData', '65', 'http-nio-8080-exec-5', 'ERROR', 'XERP Exception:org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\r\n### The error may exist in file [C:\\JOSEPH\\Tomcat9\\webapps\\xerp\\WEB-INF\\classes\\mapper\\roleUserMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select         tbl_sys_role_user.*,         tbl_sys_user.permission_name          from tbl_sys_role_user           left join tbl_sys_user on tbl_sys_role_user.user_code = tbl_sys_user.user_code         where tbl_sys_role_user.role_code = ?          order by tbl_sys_role_user.user_code asc                       limit ?,?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'', '2020-01-21 00:16:30');
INSERT INTO `tbl_sys_log` VALUES (793, 'RoleUserController.java', 'com.xerp.core.controller.RoleUserController', 'listData', '65', 'http-nio-8080-exec-6', 'ERROR', 'XERP Exception:org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\r\n### The error may exist in file [C:\\JOSEPH\\Tomcat9\\webapps\\xerp\\WEB-INF\\classes\\mapper\\roleUserMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select         tbl_sys_role_user.*,         tbl_sys_user.permission_name          from tbl_sys_role_user           left join tbl_sys_user on tbl_sys_role_user.user_code = tbl_sys_user.user_code         where tbl_sys_role_user.role_code = ?          order by tbl_sys_role_user.user_code asc                       limit ?,?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'', '2020-01-21 00:16:33');
INSERT INTO `tbl_sys_log` VALUES (794, 'RoleUserController.java', 'com.xerp.core.controller.RoleUserController', 'listData', '65', 'http-nio-8080-exec-9', 'ERROR', 'XERP Exception:org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\r\n### The error may exist in file [C:\\JOSEPH\\Tomcat9\\webapps\\xerp\\WEB-INF\\classes\\mapper\\roleUserMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select         tbl_sys_role_user.*,         tbl_sys_user.permission_name          from tbl_sys_role_user           left join tbl_sys_user on tbl_sys_role_user.user_code = tbl_sys_user.user_code         where tbl_sys_role_user.role_code = ?          order by tbl_sys_role_user.user_code asc                       limit ?,?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'', '2020-01-21 00:17:50');
INSERT INTO `tbl_sys_log` VALUES (795, 'RoleUserController.java', 'com.xerp.core.controller.RoleUserController', 'listData', '65', 'http-nio-8080-exec-7', 'ERROR', 'XERP Exception:org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\r\n### The error may exist in file [C:\\JOSEPH\\Tomcat9\\webapps\\xerp\\WEB-INF\\classes\\mapper\\roleUserMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select         tbl_sys_role_user.*,         tbl_sys_user.permission_name          from tbl_sys_role_user           left join tbl_sys_user on tbl_sys_role_user.user_code = tbl_sys_user.user_code         where tbl_sys_role_user.role_code = ?          order by tbl_sys_role_user.user_code asc                       limit ?,?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'', '2020-01-21 00:17:56');
INSERT INTO `tbl_sys_log` VALUES (796, 'RoleUserController.java', 'com.xerp.core.controller.RoleUserController', 'listData', '65', 'http-nio-8080-exec-10', 'ERROR', 'XERP Exception:org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\r\n### The error may exist in file [C:\\JOSEPH\\Tomcat9\\webapps\\xerp\\WEB-INF\\classes\\mapper\\roleUserMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select         tbl_sys_role_user.*,         tbl_sys_user.permission_name          from tbl_sys_role_user           left join tbl_sys_user on tbl_sys_role_user.user_code = tbl_sys_user.user_code         where tbl_sys_role_user.role_code = ?          order by tbl_sys_role_user.user_code asc                       limit ?,?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'tbl_sys_user.permission_name\' in \'field list\'', '2020-01-21 00:17:58');
INSERT INTO `tbl_sys_log` VALUES (797, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-9', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 00:20:17');
INSERT INTO `tbl_sys_log` VALUES (798, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-9', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 00:42:17');
INSERT INTO `tbl_sys_log` VALUES (799, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-2', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 17:04:48');
INSERT INTO `tbl_sys_log` VALUES (800, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-5', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 17:12:20');
INSERT INTO `tbl_sys_log` VALUES (801, 'UserController.java', 'com.xerp.core.controller.UserController', 'listData', '70', 'http-nio-8080-exec-10', 'ERROR', 'XERP Exception:org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'search\' in \'class java.lang.String\'', '2020-01-21 17:12:30');
INSERT INTO `tbl_sys_log` VALUES (802, 'UserController.java', 'com.xerp.core.controller.UserController', 'listData', '70', 'http-nio-8080-exec-4', 'ERROR', 'XERP Exception:org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'search\' in \'class java.lang.String\'', '2020-01-21 17:12:41');
INSERT INTO `tbl_sys_log` VALUES (803, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 17:14:26');
INSERT INTO `tbl_sys_log` VALUES (804, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-5', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 17:41:47');
INSERT INTO `tbl_sys_log` VALUES (805, 'RolePermissionController.java', 'com.xerp.core.controller.RolePermissionController', 'saveData', '113', 'http-nio-8080-exec-1', 'ERROR', 'XERP Exception:org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.binding.BindingException: Parameter \'roleCode\' not found. Available parameters are [0, 1, param1, param2]', '2020-01-21 17:42:00');
INSERT INTO `tbl_sys_log` VALUES (806, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 17:43:18');
INSERT INTO `tbl_sys_log` VALUES (807, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 17:47:55');
INSERT INTO `tbl_sys_log` VALUES (808, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-9', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 18:09:21');
INSERT INTO `tbl_sys_log` VALUES (809, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 18:22:00');
INSERT INTO `tbl_sys_log` VALUES (810, 'CompanyController.java', 'com.xerp.core.controller.CompanyController', 'listData', '56', 'http-nio-8080-exec-5', 'INFO', 'com.xerp.core.controller.CompanyController-listData', '2020-01-21 18:26:55');
INSERT INTO `tbl_sys_log` VALUES (811, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 18:46:55');
INSERT INTO `tbl_sys_log` VALUES (812, 'FlowModuleController.java', 'com.xerp.core.controller.FlowModuleController', 'saveData', '205', 'http-nio-8080-exec-8', 'ERROR', 'XERP Exception:java.lang.NullPointerException', '2020-01-21 18:58:19');
INSERT INTO `tbl_sys_log` VALUES (813, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 21:26:56');
INSERT INTO `tbl_sys_log` VALUES (814, 'FlowModuleController.java', 'com.xerp.core.controller.FlowModuleController', 'saveData', '205', 'http-nio-8080-exec-8', 'ERROR', 'XERP Exception:java.lang.NullPointerException', '2020-01-21 21:30:53');
INSERT INTO `tbl_sys_log` VALUES (815, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '91', 'http-nio-8080-exec-4', 'ERROR', 'com.xerp.core.controller.UserLoginController-UnknownAccountException:org.apache.shiro.authc.UnknownAccountException', '2020-01-21 21:34:38');
INSERT INTO `tbl_sys_log` VALUES (816, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-3', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 21:34:42');
INSERT INTO `tbl_sys_log` VALUES (817, 'FlowModuleController.java', 'com.xerp.core.controller.FlowModuleController', 'saveData', '218', 'http-nio-8080-exec-9', 'ERROR', 'XERP Exception:org.springframework.jdbc.UncategorizedSQLException: \r\n### Error updating database.  Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'ort,,created_by,created_datetime,mo\', expect RPAREN, actual IDENTIFIER pos 101, line 2, column 61, token IDENTIFIER created_by : insert into tbl_sys_flow_module\n        (uuid,status,module_code,module_name,comment,sort,,created_by,created_datetime,modified_by,modified_datetime) values\n        (?,?,?,?,?,?,?,?,?,?)\r\n### SQL: insert into tbl_sys_flow_module         (uuid,status,module_code,module_name,comment,sort,,created_by,created_datetime,modified_by,modified_datetime) values         (?,?,?,?,?,?,?,?,?,?)\r\n### Cause: java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'ort,,created_by,created_datetime,mo\', expect RPAREN, actual IDENTIFIER pos 101, line 2, column 61, token IDENTIFIER created_by : insert into tbl_sys_flow_module\n        (uuid,status,module_code,module_name,comment,sort,,created_by,created_datetime,modified_by,modified_datetime) values\n        (?,?,?,?,?,?,?,?,?,?)\n; uncategorized SQLException; SQL state [null]; error code [0]; sql injection violation, syntax error: syntax error, error in :\'ort,,created_by,created_datetime,mo\', expect RPAREN, actual IDENTIFIER pos 101, line 2, column 61, token IDENTIFIER created_by : insert into tbl_sys_flow_module\n        (uuid,status,module_code,module_name,comment,sort,,created_by,created_datetime,modified_by,modified_datetime) values\n        (?,?,?,?,?,?,?,?,?,?); nested exception is java.sql.SQLException: sql injection violation, syntax error: syntax error, error in :\'ort,,created_by,created_datetime,mo\', expect RPAREN, actual IDENTIFIER pos 101, line 2, column 61, token IDENTIFIER created_by : insert into tbl_sys_flow_module\n        (uuid,status,module_code,module_name,comment,sort,,created_by,created_datetime,modified_by,modified_datetime) values\n        (?,?,?,?,?,?,?,?,?,?)', '2020-01-21 21:35:33');
INSERT INTO `tbl_sys_log` VALUES (818, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 21:38:52');
INSERT INTO `tbl_sys_log` VALUES (819, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 22:24:01');
INSERT INTO `tbl_sys_log` VALUES (820, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-3', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 22:49:55');
INSERT INTO `tbl_sys_log` VALUES (821, 'FlowNameController.java', 'com.xerp.core.controller.FlowNameController', 'saveData', '189', 'http-nio-8080-exec-7', 'ERROR', 'XERP Exception:com.alibaba.fastjson.JSONException: syntax error, pos 1, line 1, column 2ws=create&uuid=null&status=01&flowCode=flow00001+&flowName=test&flowVersion=test&moduleCode=&moduleName=&comment=', '2020-01-21 22:52:30');
INSERT INTO `tbl_sys_log` VALUES (822, 'FlowNameController.java', 'com.xerp.core.controller.FlowNameController', 'saveData', '189', 'http-nio-8080-exec-6', 'ERROR', 'XERP Exception:com.alibaba.fastjson.JSONException: syntax error, pos 1, line 1, column 2ws=create&uuid=null&status=01&flowCode=flow00001+&flowName=flow00001+&flowVersion=flow00001+&moduleCode=&moduleName=&comment=flow00001+', '2020-01-21 23:01:37');
INSERT INTO `tbl_sys_log` VALUES (823, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 23:07:15');
INSERT INTO `tbl_sys_log` VALUES (824, 'FlowNameController.java', 'com.xerp.core.controller.FlowNameController', 'saveData', '189', 'http-nio-8080-exec-4', 'ERROR', 'XERP Exception:org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'flow_code\' in \'class com.xerp.core.entity.FlowName\'', '2020-01-21 23:07:28');
INSERT INTO `tbl_sys_log` VALUES (825, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 23:13:49');
INSERT INTO `tbl_sys_log` VALUES (826, 'FlowNameController.java', 'com.xerp.core.controller.FlowNameController', 'listByUuid', '95', 'http-nio-8080-exec-6', 'ERROR', 'XERP Exception:com.alibaba.fastjson.JSONException: can not cast to JSONObject.', '2020-01-21 23:14:36');
INSERT INTO `tbl_sys_log` VALUES (827, 'FlowNameController.java', 'com.xerp.core.controller.FlowNameController', 'listByUuid', '95', 'http-nio-8080-exec-7', 'ERROR', 'XERP Exception:com.alibaba.fastjson.JSONException: can not cast to JSONObject.', '2020-01-21 23:14:52');
INSERT INTO `tbl_sys_log` VALUES (828, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 23:16:52');
INSERT INTO `tbl_sys_log` VALUES (829, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-5', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 23:54:13');
INSERT INTO `tbl_sys_log` VALUES (830, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-21 23:59:06');
INSERT INTO `tbl_sys_log` VALUES (831, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-10', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 00:05:47');
INSERT INTO `tbl_sys_log` VALUES (832, 'FlowModuleController.java', 'com.xerp.core.controller.FlowModuleController', 'getZTree', '175', 'http-nio-8080-exec-1', 'ERROR', 'XERP Exception:org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'creater\' in \'field list\'\r\n### The error may exist in file [C:\\JOSEPH\\Tomcat9\\webapps\\xerp\\WEB-INF\\classes\\mapper\\FlowModuleMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select uuid,creater,module_code,module_name,status,sort from tbl_sys_flow_module where 1 = 1 order by sort asc\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'creater\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'creater\' in \'field list\'', '2020-01-22 00:06:08');
INSERT INTO `tbl_sys_log` VALUES (833, 'FlowModuleController.java', 'com.xerp.core.controller.FlowModuleController', 'getZTree', '175', 'http-nio-8080-exec-1', 'ERROR', 'XERP Exception:org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'creater\' in \'field list\'\r\n### The error may exist in file [C:\\JOSEPH\\Tomcat9\\webapps\\xerp\\WEB-INF\\classes\\mapper\\FlowModuleMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select uuid,creater,module_code,module_name,status,sort from tbl_sys_flow_module where 1 = 1 order by sort asc\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'creater\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'creater\' in \'field list\'', '2020-01-22 00:06:47');
INSERT INTO `tbl_sys_log` VALUES (834, 'FlowModuleController.java', 'com.xerp.core.controller.FlowModuleController', 'getZTree', '175', 'http-nio-8080-exec-7', 'ERROR', 'XERP Exception:org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'creater\' in \'field list\'\r\n### The error may exist in file [C:\\JOSEPH\\Tomcat9\\webapps\\xerp\\WEB-INF\\classes\\mapper\\FlowModuleMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select uuid,creater,module_code,module_name,status,sort from tbl_sys_flow_module where 1 = 1 order by sort asc\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'creater\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'creater\' in \'field list\'', '2020-01-22 00:06:54');
INSERT INTO `tbl_sys_log` VALUES (835, 'FlowModuleController.java', 'com.xerp.core.controller.FlowModuleController', 'getZTree', '175', 'http-nio-8080-exec-2', 'ERROR', 'XERP Exception:org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'creater\' in \'field list\'\r\n### The error may exist in file [C:\\JOSEPH\\Tomcat9\\webapps\\xerp\\WEB-INF\\classes\\mapper\\FlowModuleMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select uuid,creater,module_code,module_name,status,sort from tbl_sys_flow_module where 1 = 1 order by sort asc\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'creater\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'creater\' in \'field list\'', '2020-01-22 00:07:45');
INSERT INTO `tbl_sys_log` VALUES (836, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 00:09:42');
INSERT INTO `tbl_sys_log` VALUES (837, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-9', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 00:30:09');
INSERT INTO `tbl_sys_log` VALUES (838, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-9', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 01:55:44');
INSERT INTO `tbl_sys_log` VALUES (839, 'FlowNodeController.java', 'com.xerp.core.controller.FlowNodeController', 'listByUuid', '88', 'http-nio-8080-exec-8', 'ERROR', 'XERP Exception:com.alibaba.fastjson.JSONException: can not cast to JSONObject.', '2020-01-22 02:18:29');
INSERT INTO `tbl_sys_log` VALUES (840, 'FlowNodeController.java', 'com.xerp.core.controller.FlowNodeController', 'listByUuid', '88', 'http-nio-8080-exec-3', 'ERROR', 'XERP Exception:com.alibaba.fastjson.JSONException: can not cast to JSONObject.', '2020-01-22 02:18:47');
INSERT INTO `tbl_sys_log` VALUES (841, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-5', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 02:20:46');
INSERT INTO `tbl_sys_log` VALUES (842, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 02:26:05');
INSERT INTO `tbl_sys_log` VALUES (843, 'FlowNodeController.java', 'com.xerp.core.controller.FlowNodeController', 'saveData', '179', 'http-nio-8080-exec-1', 'ERROR', 'XERP Exception:org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'flow_uuid\' in \'class com.xerp.core.entity.FlowNode\'', '2020-01-22 02:26:21');
INSERT INTO `tbl_sys_log` VALUES (844, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 02:27:25');
INSERT INTO `tbl_sys_log` VALUES (845, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-5', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 15:31:06');
INSERT INTO `tbl_sys_log` VALUES (846, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 15:35:26');
INSERT INTO `tbl_sys_log` VALUES (847, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 16:16:32');
INSERT INTO `tbl_sys_log` VALUES (848, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 17:02:31');
INSERT INTO `tbl_sys_log` VALUES (849, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 17:19:51');
INSERT INTO `tbl_sys_log` VALUES (850, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-5', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 17:32:35');
INSERT INTO `tbl_sys_log` VALUES (851, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-9', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 17:41:03');
INSERT INTO `tbl_sys_log` VALUES (852, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-2', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 17:42:23');
INSERT INTO `tbl_sys_log` VALUES (853, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 17:49:28');
INSERT INTO `tbl_sys_log` VALUES (854, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 18:33:16');
INSERT INTO `tbl_sys_log` VALUES (855, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 18:58:27');
INSERT INTO `tbl_sys_log` VALUES (856, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 21:12:05');
INSERT INTO `tbl_sys_log` VALUES (857, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '75', 'http-nio-8080-exec-10', 'INFO', 'User: 系统管理员 login system,From IP:0:0:0:0:0:0:0:1', '2020-01-22 21:17:59');
INSERT INTO `tbl_sys_log` VALUES (858, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-01-22 22:19:07');
INSERT INTO `tbl_sys_log` VALUES (859, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-4', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-25 01:47:04');
INSERT INTO `tbl_sys_log` VALUES (860, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-25 01:48:36');
INSERT INTO `tbl_sys_log` VALUES (861, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-25 01:53:08');
INSERT INTO `tbl_sys_log` VALUES (862, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '75', 'http-nio-8080-exec-4', 'INFO', 'User: 系统管理员 login system,From IP:0:0:0:0:0:0:0:1', '2020-08-25 01:53:25');
INSERT INTO `tbl_sys_log` VALUES (863, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '75', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login system,From IP:0:0:0:0:0:0:0:1', '2020-08-25 01:54:10');
INSERT INTO `tbl_sys_log` VALUES (864, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '75', 'http-nio-8080-exec-4', 'INFO', 'User: 系统管理员 login system,From IP:0:0:0:0:0:0:0:1', '2020-08-25 01:54:40');
INSERT INTO `tbl_sys_log` VALUES (865, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '75', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login system,From IP:0:0:0:0:0:0:0:1', '2020-08-25 01:54:48');
INSERT INTO `tbl_sys_log` VALUES (866, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '75', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login system,From IP:0:0:0:0:0:0:0:1', '2020-08-25 01:54:59');
INSERT INTO `tbl_sys_log` VALUES (867, 'CompanyController.java', 'com.xerp.core.controller.CompanyController', 'listData', '56', 'http-nio-8080-exec-3', 'INFO', 'com.xerp.core.controller.CompanyController-listData', '2020-08-25 01:55:08');
INSERT INTO `tbl_sys_log` VALUES (868, 'BusinessController.java', 'com.xerp.core.controller.BusinessController', 'listData', '57', 'http-nio-8080-exec-3', 'INFO', 'com.xerp.core.controller.BusinessController-listData', '2020-08-25 01:55:10');
INSERT INTO `tbl_sys_log` VALUES (869, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-25 01:56:07');
INSERT INTO `tbl_sys_log` VALUES (870, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-5', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-26 16:35:42');
INSERT INTO `tbl_sys_log` VALUES (871, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-9', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-26 17:52:17');
INSERT INTO `tbl_sys_log` VALUES (872, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-26 17:52:17');
INSERT INTO `tbl_sys_log` VALUES (873, 'CompanyController.java', 'com.xerp.core.controller.CompanyController', 'listData', '56', 'http-nio-8080-exec-9', 'INFO', 'com.xerp.core.controller.CompanyController-listData', '2020-08-26 17:52:41');
INSERT INTO `tbl_sys_log` VALUES (874, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-26 23:02:38');
INSERT INTO `tbl_sys_log` VALUES (875, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-26 23:08:44');
INSERT INTO `tbl_sys_log` VALUES (876, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-26 23:36:46');
INSERT INTO `tbl_sys_log` VALUES (877, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-26 23:41:31');
INSERT INTO `tbl_sys_log` VALUES (878, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-26 23:58:56');
INSERT INTO `tbl_sys_log` VALUES (879, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-27 00:08:44');
INSERT INTO `tbl_sys_log` VALUES (880, 'BillNumberController.java', 'com.xerp.core.controller.BillNumberController', 'saveData', '214', 'http-nio-8080-exec-1', 'ERROR', 'XERP Exception:java.lang.NumberFormatException: null', '2020-08-27 00:22:50');
INSERT INTO `tbl_sys_log` VALUES (881, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-27 00:27:57');
INSERT INTO `tbl_sys_log` VALUES (882, 'BillNumberController.java', 'com.xerp.core.controller.BillNumberController', 'listData', '68', 'http-nio-8080-exec-4', 'ERROR', 'XERP Exception:org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.reflection.ReflectionException: Could not set property \'currentRange\' of \'class com.xerp.core.entity.BillNumber\' with value \'\' Cause: org.apache.ibatis.reflection.ReflectionException: There is no setter for property named \'currentRange\' in \'class com.xerp.core.entity.BillNumber\'', '2020-08-27 00:28:07');
INSERT INTO `tbl_sys_log` VALUES (883, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-27 00:28:59');
INSERT INTO `tbl_sys_log` VALUES (884, 'BillNumberController.java', 'com.xerp.core.controller.BillNumberController', 'saveData', '206', 'http-nio-8080-exec-3', 'ERROR', 'XERP Exception:org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'uuid\' at row 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into tbl_sys_config_number         (uuid,         module_code,         module_name,         pre_num_word,         increment_range,         default_length,         created_datetime,         updated_datetime)         values         (?,         ?,         ?,         ?,         ?,         ?,         ?,         ?)\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'uuid\' at row 1\n; Data truncation: Data too long for column \'uuid\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'uuid\' at row 1', '2020-08-27 00:29:31');
INSERT INTO `tbl_sys_log` VALUES (885, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-27 00:33:41');
INSERT INTO `tbl_sys_log` VALUES (886, 'BillNumberController.java', 'com.xerp.core.controller.BillNumberController', 'saveData', '206', 'http-nio-8080-exec-7', 'ERROR', 'XERP Exception:org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'uuid\' at row 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into tbl_sys_config_number         (uuid,         module_code,         module_name,         pre_num_word,         increment_range,         default_length,         created_datetime,         updated_datetime)         values         (?,         ?,         ?,         ?,         ?,         ?,         ?,         ?)\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'uuid\' at row 1\n; Data truncation: Data too long for column \'uuid\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'uuid\' at row 1', '2020-08-27 00:34:20');
INSERT INTO `tbl_sys_log` VALUES (887, 'BillNumberController.java', 'com.xerp.core.controller.BillNumberController', 'saveData', '206', 'http-nio-8080-exec-3', 'ERROR', 'XERP Exception:org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'uuid\' at row 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into tbl_sys_config_number         (uuid,         module_code,         module_name,         pre_num_word,         increment_range,         default_length,         created_datetime,         updated_datetime)         values         (?,         ?,         ?,         ?,         ?,         ?,         ?,         ?)\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'uuid\' at row 1\n; Data truncation: Data too long for column \'uuid\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'uuid\' at row 1', '2020-08-27 00:34:25');
INSERT INTO `tbl_sys_log` VALUES (888, 'BillNumberController.java', 'com.xerp.core.controller.BillNumberController', 'saveData', '206', 'http-nio-8080-exec-4', 'ERROR', 'XERP Exception:org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'uuid\' at row 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into tbl_sys_config_number         (uuid,         module_code,         module_name,         pre_num_word,         increment_range,         default_length,         created_datetime,         updated_datetime)         values         (?,         ?,         ?,         ?,         ?,         ?,         ?,         ?)\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'uuid\' at row 1\n; Data truncation: Data too long for column \'uuid\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'uuid\' at row 1', '2020-08-27 00:34:31');
INSERT INTO `tbl_sys_log` VALUES (889, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-27 00:44:40');
INSERT INTO `tbl_sys_log` VALUES (890, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-27 01:23:06');
INSERT INTO `tbl_sys_log` VALUES (891, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-9', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-27 01:35:03');
INSERT INTO `tbl_sys_log` VALUES (892, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '75', 'http-nio-8080-exec-2', 'INFO', 'User: 系统管理员 login system,From IP:0:0:0:0:0:0:0:1', '2020-08-27 01:35:05');
INSERT INTO `tbl_sys_log` VALUES (893, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-27 01:43:12');
INSERT INTO `tbl_sys_log` VALUES (894, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-5', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-27 01:45:52');
INSERT INTO `tbl_sys_log` VALUES (895, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-27 01:49:10');
INSERT INTO `tbl_sys_log` VALUES (896, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-31 16:11:20');
INSERT INTO `tbl_sys_log` VALUES (897, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-31 16:39:45');
INSERT INTO `tbl_sys_log` VALUES (898, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-31 16:43:03');
INSERT INTO `tbl_sys_log` VALUES (899, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-31 16:47:48');
INSERT INTO `tbl_sys_log` VALUES (900, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-31 16:52:36');
INSERT INTO `tbl_sys_log` VALUES (901, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-31 17:25:44');
INSERT INTO `tbl_sys_log` VALUES (902, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-31 20:43:21');
INSERT INTO `tbl_sys_log` VALUES (903, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-31 20:46:26');
INSERT INTO `tbl_sys_log` VALUES (904, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-31 20:47:50');
INSERT INTO `tbl_sys_log` VALUES (905, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-31 21:19:01');
INSERT INTO `tbl_sys_log` VALUES (906, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-31 21:57:37');
INSERT INTO `tbl_sys_log` VALUES (907, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-31 22:57:11');
INSERT INTO `tbl_sys_log` VALUES (908, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-1', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-31 23:20:04');
INSERT INTO `tbl_sys_log` VALUES (909, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-08-31 23:28:14');
INSERT INTO `tbl_sys_log` VALUES (910, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '75', 'http-nio-8080-exec-5', 'INFO', 'User: 系统管理员 login system,From IP:0:0:0:0:0:0:0:1', '2020-08-31 23:28:19');
INSERT INTO `tbl_sys_log` VALUES (911, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-4', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 00:01:32');
INSERT INTO `tbl_sys_log` VALUES (912, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 00:20:05');
INSERT INTO `tbl_sys_log` VALUES (913, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 00:26:14');
INSERT INTO `tbl_sys_log` VALUES (914, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 00:28:56');
INSERT INTO `tbl_sys_log` VALUES (915, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-10', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 00:31:35');
INSERT INTO `tbl_sys_log` VALUES (916, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 00:42:59');
INSERT INTO `tbl_sys_log` VALUES (917, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 01:46:47');
INSERT INTO `tbl_sys_log` VALUES (918, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 01:52:41');
INSERT INTO `tbl_sys_log` VALUES (919, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-9', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 02:12:01');
INSERT INTO `tbl_sys_log` VALUES (920, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-9', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 02:56:31');
INSERT INTO `tbl_sys_log` VALUES (921, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-10', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 03:23:19');
INSERT INTO `tbl_sys_log` VALUES (922, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-3', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 03:39:02');
INSERT INTO `tbl_sys_log` VALUES (923, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 19:24:36');
INSERT INTO `tbl_sys_log` VALUES (924, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 19:28:32');
INSERT INTO `tbl_sys_log` VALUES (925, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 22:40:57');
INSERT INTO `tbl_sys_log` VALUES (926, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-4', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 22:53:53');
INSERT INTO `tbl_sys_log` VALUES (927, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-9', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 22:56:25');
INSERT INTO `tbl_sys_log` VALUES (928, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-01 23:07:58');
INSERT INTO `tbl_sys_log` VALUES (929, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-02 00:12:42');
INSERT INTO `tbl_sys_log` VALUES (930, 'CompanyController.java', 'com.xerp.core.controller.CompanyController', 'listData', '56', 'http-nio-8080-exec-1', 'INFO', 'com.xerp.core.controller.CompanyController-listData', '2020-09-02 01:02:35');
INSERT INTO `tbl_sys_log` VALUES (931, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-02 01:17:09');
INSERT INTO `tbl_sys_log` VALUES (932, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-9', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-02 01:56:54');
INSERT INTO `tbl_sys_log` VALUES (933, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-3', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-02 22:50:00');
INSERT INTO `tbl_sys_log` VALUES (934, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '91', 'http-nio-8080-exec-9', 'ERROR', 'com.xerp.core.controller.UserLoginController-UnknownAccountException:org.apache.shiro.authc.UnknownAccountException', '2020-09-02 23:18:15');
INSERT INTO `tbl_sys_log` VALUES (935, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-10', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-02 23:18:18');
INSERT INTO `tbl_sys_log` VALUES (936, 'FlowDirectionController.java', 'com.xerp.core.controller.FlowDirectionController', 'saveData', '186', 'http-nio-8080-exec-9', 'ERROR', 'XERP Exception:org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'gooflow_alt\' at row 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into tbl_sys_flow_direction         (uuid,         flow_uuid,         node_uuid,         direction_type,         direction_code,         direction_name,         target_node_uuid,         target_node_name,         comment,         gooflow_type,         gooflow_m,         gooflow_alt,         sort,         created_by,         created_datetime,         modified_by,         modified_datetime)         values         (?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?)\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'gooflow_alt\' at row 1\n; Data truncation: Data too long for column \'gooflow_alt\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'gooflow_alt\' at row 1', '2020-09-02 23:29:41');
INSERT INTO `tbl_sys_log` VALUES (937, 'FlowDirectionController.java', 'com.xerp.core.controller.FlowDirectionController', 'saveData', '186', 'http-nio-8080-exec-7', 'ERROR', 'XERP Exception:org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'gooflow_alt\' at row 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into tbl_sys_flow_direction         (uuid,         flow_uuid,         node_uuid,         direction_type,         direction_code,         direction_name,         target_node_uuid,         target_node_name,         comment,         gooflow_type,         gooflow_m,         gooflow_alt,         sort,         created_by,         created_datetime,         modified_by,         modified_datetime)         values         (?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?)\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'gooflow_alt\' at row 1\n; Data truncation: Data too long for column \'gooflow_alt\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'gooflow_alt\' at row 1', '2020-09-02 23:29:55');
INSERT INTO `tbl_sys_log` VALUES (938, 'FlowDirectionController.java', 'com.xerp.core.controller.FlowDirectionController', 'saveData', '186', 'http-nio-8080-exec-1', 'ERROR', 'XERP Exception:org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'gooflow_alt\' at row 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into tbl_sys_flow_direction         (uuid,         flow_uuid,         node_uuid,         direction_type,         direction_code,         direction_name,         target_node_uuid,         target_node_name,         comment,         gooflow_type,         gooflow_m,         gooflow_alt,         sort,         created_by,         created_datetime,         modified_by,         modified_datetime)         values         (?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?)\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'gooflow_alt\' at row 1\n; Data truncation: Data too long for column \'gooflow_alt\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'gooflow_alt\' at row 1', '2020-09-02 23:30:03');
INSERT INTO `tbl_sys_log` VALUES (939, 'FlowDirectionController.java', 'com.xerp.core.controller.FlowDirectionController', 'saveData', '186', 'http-nio-8080-exec-8', 'ERROR', 'XERP Exception:org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'gooflow_alt\' at row 1\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into tbl_sys_flow_direction         (uuid,         flow_uuid,         node_uuid,         direction_type,         direction_code,         direction_name,         target_node_uuid,         target_node_name,         comment,         gooflow_type,         gooflow_m,         gooflow_alt,         sort,         created_by,         created_datetime,         modified_by,         modified_datetime)         values         (?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?,         ?)\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'gooflow_alt\' at row 1\n; Data truncation: Data too long for column \'gooflow_alt\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'gooflow_alt\' at row 1', '2020-09-02 23:30:21');
INSERT INTO `tbl_sys_log` VALUES (940, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-4', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-03 00:22:41');
INSERT INTO `tbl_sys_log` VALUES (941, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '95', 'http-nio-8080-exec-6', 'ERROR', 'com.xerp.core.controller.UserLoginController-IncorrectCredentialsException:org.apache.shiro.authc.IncorrectCredentialsException: Submitted credentials for token [org.apache.shiro.authc.UsernamePasswordToken - admin, rememberMe=false] did not match the expected credentials.', '2020-09-03 01:04:47');
INSERT INTO `tbl_sys_log` VALUES (942, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '95', 'http-nio-8080-exec-7', 'ERROR', 'com.xerp.core.controller.UserLoginController-IncorrectCredentialsException:org.apache.shiro.authc.IncorrectCredentialsException: Submitted credentials for token [org.apache.shiro.authc.UsernamePasswordToken - admin, rememberMe=false] did not match the expected credentials.', '2020-09-03 01:04:52');
INSERT INTO `tbl_sys_log` VALUES (943, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-03 01:05:03');
INSERT INTO `tbl_sys_log` VALUES (944, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-03 02:42:56');
INSERT INTO `tbl_sys_log` VALUES (945, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-03 02:45:54');
INSERT INTO `tbl_sys_log` VALUES (946, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-5', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-03 02:48:25');
INSERT INTO `tbl_sys_log` VALUES (947, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-03 02:55:22');
INSERT INTO `tbl_sys_log` VALUES (948, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '75', 'http-nio-8080-exec-3', 'INFO', 'User: 系统管理员 login system,From IP:0:0:0:0:0:0:0:1', '2020-09-03 02:55:36');
INSERT INTO `tbl_sys_log` VALUES (949, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '75', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login system,From IP:0:0:0:0:0:0:0:1', '2020-09-03 02:56:42');
INSERT INTO `tbl_sys_log` VALUES (950, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-03 16:29:15');
INSERT INTO `tbl_sys_log` VALUES (951, 'CompanyController.java', 'com.xerp.core.controller.CompanyController', 'listData', '56', 'http-nio-8080-exec-4', 'INFO', 'com.xerp.core.controller.CompanyController-listData', '2020-09-03 16:31:54');
INSERT INTO `tbl_sys_log` VALUES (952, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-03 16:41:36');
INSERT INTO `tbl_sys_log` VALUES (953, 'BusinessController.java', 'com.xerp.core.controller.BusinessController', 'listData', '57', 'http-nio-8080-exec-2', 'INFO', 'com.xerp.core.controller.BusinessController-listData', '2020-09-03 16:42:54');
INSERT INTO `tbl_sys_log` VALUES (954, 'BusinessController.java', 'com.xerp.core.controller.BusinessController', 'listData', '57', 'http-nio-8080-exec-5', 'INFO', 'com.xerp.core.controller.BusinessController-listData', '2020-09-03 16:43:17');
INSERT INTO `tbl_sys_log` VALUES (955, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-03 17:54:23');
INSERT INTO `tbl_sys_log` VALUES (956, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-03 17:57:07');
INSERT INTO `tbl_sys_log` VALUES (957, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-03 18:02:25');
INSERT INTO `tbl_sys_log` VALUES (958, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-03 18:05:53');
INSERT INTO `tbl_sys_log` VALUES (959, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-04 18:16:47');
INSERT INTO `tbl_sys_log` VALUES (960, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-04 19:26:23');
INSERT INTO `tbl_sys_log` VALUES (961, 'CompanyController.java', 'com.xerp.core.controller.CompanyController', 'getListZTreeByCmpUuid', '315', 'http-nio-8080-exec-4', 'ERROR', 'XERP Exception:org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.xerp.core.dao.ICompanyDAO.companyListZTreeByUuid', '2020-09-04 19:27:22');
INSERT INTO `tbl_sys_log` VALUES (962, 'CompanyController.java', 'com.xerp.core.controller.CompanyController', 'getListZTreeByCmpUuid', '315', 'http-nio-8080-exec-6', 'ERROR', 'XERP Exception:org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.xerp.core.dao.ICompanyDAO.companyListZTreeByUuid', '2020-09-04 19:28:11');
INSERT INTO `tbl_sys_log` VALUES (963, 'CompanyController.java', 'com.xerp.core.controller.CompanyController', 'getListZTreeByCmpUuid', '315', 'http-nio-8080-exec-5', 'ERROR', 'XERP Exception:org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.xerp.core.dao.ICompanyDAO.companyListZTreeByUuid', '2020-09-04 19:28:15');
INSERT INTO `tbl_sys_log` VALUES (964, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-04 19:31:01');
INSERT INTO `tbl_sys_log` VALUES (965, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-04 19:39:28');
INSERT INTO `tbl_sys_log` VALUES (966, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-04 20:04:23');
INSERT INTO `tbl_sys_log` VALUES (967, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-04 22:21:10');
INSERT INTO `tbl_sys_log` VALUES (968, 'BusinessController.java', 'com.xerp.core.controller.BusinessController', 'listData', '57', 'http-nio-8080-exec-6', 'INFO', 'com.xerp.core.controller.BusinessController-listData', '2020-09-04 22:41:48');
INSERT INTO `tbl_sys_log` VALUES (969, 'CompanyController.java', 'com.xerp.core.controller.CompanyController', 'listData', '56', 'http-nio-8080-exec-8', 'INFO', 'com.xerp.core.controller.CompanyController-listData', '2020-09-04 22:42:11');
INSERT INTO `tbl_sys_log` VALUES (970, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-04 22:45:13');
INSERT INTO `tbl_sys_log` VALUES (971, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-04 22:50:06');
INSERT INTO `tbl_sys_log` VALUES (972, 'BusinessController.java', 'com.xerp.core.controller.BusinessController', 'listData', '57', 'http-nio-8080-exec-7', 'INFO', 'com.xerp.core.controller.BusinessController-listData', '2020-09-04 22:50:58');
INSERT INTO `tbl_sys_log` VALUES (973, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-04 23:13:51');
INSERT INTO `tbl_sys_log` VALUES (974, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-04 23:19:16');
INSERT INTO `tbl_sys_log` VALUES (975, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-05 01:43:51');
INSERT INTO `tbl_sys_log` VALUES (976, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-05 01:47:14');
INSERT INTO `tbl_sys_log` VALUES (977, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-05 02:06:55');
INSERT INTO `tbl_sys_log` VALUES (978, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-06 19:57:24');
INSERT INTO `tbl_sys_log` VALUES (979, 'PortalController.java', 'com.xerp.core.controller.PortalController', 'listByUuid', '94', 'http-nio-8080-exec-2', 'ERROR', 'java.lang.NullPointerException', '2020-09-06 19:58:04');
INSERT INTO `tbl_sys_log` VALUES (980, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-08 16:56:32');
INSERT INTO `tbl_sys_log` VALUES (981, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-1', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-11 17:37:23');
INSERT INTO `tbl_sys_log` VALUES (982, 'PortalController.java', 'com.xerp.core.controller.PortalController', 'listByUuid', '94', 'http-nio-8080-exec-1', 'ERROR', 'java.lang.NullPointerException', '2020-09-11 17:38:42');
INSERT INTO `tbl_sys_log` VALUES (983, 'PortalController.java', 'com.xerp.core.controller.PortalController', 'listByUuid', '94', 'http-nio-8080-exec-7', 'ERROR', 'java.lang.NullPointerException', '2020-09-11 17:38:44');
INSERT INTO `tbl_sys_log` VALUES (984, 'PortalController.java', 'com.xerp.core.controller.PortalController', 'listByUuid', '94', 'http-nio-8080-exec-5', 'ERROR', 'java.lang.NullPointerException', '2020-09-11 17:42:51');
INSERT INTO `tbl_sys_log` VALUES (985, 'PortalController.java', 'com.xerp.core.controller.PortalController', 'listByUuid', '94', 'http-nio-8080-exec-9', 'ERROR', 'java.lang.NullPointerException', '2020-09-11 17:43:00');
INSERT INTO `tbl_sys_log` VALUES (986, 'PortalController.java', 'com.xerp.core.controller.PortalController', 'listByUuid', '94', 'http-nio-8080-exec-4', 'ERROR', 'java.lang.NullPointerException', '2020-09-11 17:43:19');
INSERT INTO `tbl_sys_log` VALUES (987, 'PortalController.java', 'com.xerp.core.controller.PortalController', 'listByUuid', '94', 'http-nio-8080-exec-8', 'ERROR', 'java.lang.NullPointerException', '2020-09-11 17:43:33');
INSERT INTO `tbl_sys_log` VALUES (988, 'PortalController.java', 'com.xerp.core.controller.PortalController', 'listByUuid', '94', 'http-nio-8080-exec-8', 'ERROR', 'java.lang.NullPointerException', '2020-09-11 17:45:16');
INSERT INTO `tbl_sys_log` VALUES (989, 'PortalController.java', 'com.xerp.core.controller.PortalController', 'listByUuid', '94', 'http-nio-8080-exec-10', 'ERROR', 'java.lang.NullPointerException', '2020-09-11 17:56:30');
INSERT INTO `tbl_sys_log` VALUES (990, 'PortalController.java', 'com.xerp.core.controller.PortalController', 'listByUuid', '94', 'http-nio-8080-exec-1', 'ERROR', 'java.lang.NullPointerException', '2020-09-11 17:56:40');
INSERT INTO `tbl_sys_log` VALUES (991, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '75', 'http-nio-8080-exec-5', 'INFO', 'User: 系统管理员 login system,From IP:0:0:0:0:0:0:0:1', '2020-09-11 17:56:43');
INSERT INTO `tbl_sys_log` VALUES (992, 'PortalController.java', 'com.xerp.core.controller.PortalController', 'listByUuid', '94', 'http-nio-8080-exec-7', 'ERROR', 'java.lang.NullPointerException', '2020-09-11 17:56:44');
INSERT INTO `tbl_sys_log` VALUES (993, 'PortalController.java', 'com.xerp.core.controller.PortalController', 'listByUuid', '94', 'http-nio-8080-exec-10', 'ERROR', 'java.lang.NullPointerException', '2020-09-11 17:56:44');
INSERT INTO `tbl_sys_log` VALUES (994, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-2', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-11 18:02:36');
INSERT INTO `tbl_sys_log` VALUES (995, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-7', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-11 22:29:11');
INSERT INTO `tbl_sys_log` VALUES (996, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-11 22:45:30');
INSERT INTO `tbl_sys_log` VALUES (997, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-3', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-11 23:09:34');
INSERT INTO `tbl_sys_log` VALUES (998, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-6', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-11 23:15:45');
INSERT INTO `tbl_sys_log` VALUES (999, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-11 23:22:40');
INSERT INTO `tbl_sys_log` VALUES (1000, 'UserLoginController.java', 'com.xerp.core.controller.UserLoginController', 'systemLogin', '87', 'http-nio-8080-exec-8', 'INFO', 'User: 系统管理员 login System From IP:0:0:0:0:0:0:0:1', '2020-09-11 23:31:44');

-- ----------------------------
-- Table structure for tbl_sys_menu_module
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_menu_module`;
CREATE TABLE `tbl_sys_menu_module`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `module_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `module_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `module_icons` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `comment` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `sort` int(8) NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_czech_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_menu_module
-- ----------------------------
INSERT INTO `tbl_sys_menu_module` VALUES ('2f649b23e2c147cb9dd944d5088f52c3', '01', 'sys0006', '貨倉管理', '', '', 60, '系统管理员', '2019-11-03 18:19:58', '系统管理员', '2019-12-20 15:24:03');
INSERT INTO `tbl_sys_menu_module` VALUES ('3f071f4c39df45c9ad4a1cc1390593ac', '01', 'sys0002', '銷售管理', '', '', 20, '系统管理员', '2019-11-03 18:19:58', '系统管理员', '2019-12-20 15:23:43');
INSERT INTO `tbl_sys_menu_module` VALUES ('89196ad0ea614797b9d0c3a0bac49c9a', '01', 'sys0004', '人事管理', '', '', 40, '系统管理员', '2019-12-20 15:25:27', '系统管理员', '2019-12-20 15:25:27');
INSERT INTO `tbl_sys_menu_module` VALUES ('91176812cc594218b790447066c3c243', '01', 'sys0007', 'IT 服務', '', '', 70, '系统管理员', '2019-11-03 18:19:58', '系统管理员', '2019-12-30 17:15:16');
INSERT INTO `tbl_sys_menu_module` VALUES ('91c9fe4e33b344208e6b37da22e3b761', '01', 'sys0003', '行政管理', '', '', 30, '系统管理员', '2019-11-03 18:19:58', '系统管理员', '2019-12-20 15:23:52');
INSERT INTO `tbl_sys_menu_module` VALUES ('9586c8a3c02040969e3ebe8ed9ee1d43', '01', 'sys0008', '財務管理', '', '', 80, '系统管理员', '2019-11-03 18:19:58', '系统管理员', '2019-12-20 15:24:11');
INSERT INTO `tbl_sys_menu_module` VALUES ('959a60a0f9be43b8baf3decbb07a1472', '99', 'sys0001', '常规操作', '', '', 10, '系统管理员', '2019-11-03 18:19:58', '系统管理员', '2020-09-02 01:04:37');
INSERT INTO `tbl_sys_menu_module` VALUES ('a6a8adfed89c4a9c829a8924e022526b', '01', 'sys9999', '系統管理', '', '', 100, '系统管理员', '2019-10-29 03:29:53', '系统管理员', '2019-10-29 03:30:01');
INSERT INTO `tbl_sys_menu_module` VALUES ('d9b10142026f44e5a5550361883eecd4', '01', 'sys0005', '採購管理', '', '', 50, '系统管理员', '2019-11-03 18:19:58', '系统管理员', '2019-12-20 15:23:59');

-- ----------------------------
-- Table structure for tbl_sys_menu_option
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_menu_option`;
CREATE TABLE `tbl_sys_menu_option`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `parent_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `menu_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `unfold` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `left_path` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `main_path` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `comment` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_czech_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_menu_option
-- ----------------------------
INSERT INTO `tbl_sys_menu_option` VALUES ('0d6dc45913bb404aa97d61317feb7806', '89196ad0ea614797b9d0c3a0bac49c9a', '01', 'M-00002', '人事管理', 'x', '', '', '人事管理', 2, '系统管理员', '2020-09-03 01:06:50', '系统管理员', '2020-09-03 01:06:50');
INSERT INTO `tbl_sys_menu_option` VALUES ('5913a76adefe4b03812e53d38c09c814', '91176812cc594218b790447066c3c243', '01', 'test1', 'test2', 'x', 'test4', '', 'test3', 2, '系统管理员', '2019-11-03 19:17:23', '系统管理员', '2019-11-04 00:37:38');
INSERT INTO `tbl_sys_menu_option` VALUES ('842a5cc63c4f4ea4937b5b8ab845de91', '89196ad0ea614797b9d0c3a0bac49c9a', '01', 'M-00005', '请假流程', 'x', 'flwLeftMenu/flwVacation/LeftMenu.action', '', '请假流程', 5, '系统管理员', '2020-08-27 01:35:36', '系统管理员', '2020-08-27 01:39:23');
INSERT INTO `tbl_sys_menu_option` VALUES ('bbdb752801c642f6ba5a641685fdbce3', 'a6a8adfed89c4a9c829a8924e022526b', '01', 'M9996', '系統配置', 'x', 'sysConfig/configMenu.action', '', '', 1, '系统管理员', '2019-11-03 18:32:01', '系统管理员', '2019-11-04 00:37:34');
INSERT INTO `tbl_sys_menu_option` VALUES ('f50e400a980c488c9d663fd02419cba4', '89196ad0ea614797b9d0c3a0bac49c9a', '01', 'M-00001', '组织架构', 'x', '', '', '', 1, '系统管理员', '2019-12-20 15:27:35', '系统管理员', '2019-12-20 15:27:35');

-- ----------------------------
-- Table structure for tbl_sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_permission`;
CREATE TABLE `tbl_sys_permission`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permission_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限id',
  `permission_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `permission_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限访问路径',
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态：1有效；2删除',
  `comment` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_permission
-- ----------------------------
INSERT INTO `tbl_sys_permission` VALUES ('4252fa0f3b3c47519ca3e6833277ab34', 'SYS-000000000000002', 'TEST1', 'TEST1', '', '', '00', '');
INSERT INTO `tbl_sys_permission` VALUES ('da1ae445921f482b86c16966464c0859', 'SYS-000000000000001', '系统管理员', 'admin:*', '', '', '01', '系统管理员');
INSERT INTO `tbl_sys_permission` VALUES ('f35e3673dc04444bbeda667ac8afcd15', 'XXX-00000000000000X', 'TEST', NULL, '', NULL, '01', '');

-- ----------------------------
-- Table structure for tbl_sys_portal
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_portal`;
CREATE TABLE `tbl_sys_portal`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `portal_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `portal_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `comment` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `sort` int(4) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_portal
-- ----------------------------
INSERT INTO `tbl_sys_portal` VALUES ('0e011133214a414da936b1f3fb1bdaf2', 'SYS-99999', '测试门户', '测试门户-TEST', 2, '01', '系统管理员', '2019-12-19 20:56:02', '系统管理员', '2019-12-19 22:23:40');
INSERT INTO `tbl_sys_portal` VALUES ('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', 'SYS-00001', '系统默认', '系统默认', 1, '01', 'admin', '2019-10-29 02:21:15', '系统管理员', '2019-12-19 18:04:14');

-- ----------------------------
-- Table structure for tbl_sys_portal_menu
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_portal_menu`;
CREATE TABLE `tbl_sys_portal_menu`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_czech_ci NOT NULL,
  `parent_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `portal_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `menu_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `menu_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `menu_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `left_path` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `main_path` varchar(150) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `sort` int(4) NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_czech_ci NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_czech_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_portal_menu
-- ----------------------------
INSERT INTO `tbl_sys_portal_menu` VALUES ('0b18482730454cef9492fa66ed8d5ffc', '8677c0f1ff8b4378a06d8adfe968bbd6', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', '', '01', 'M000001', '日常用语', '', '', '', '', 1, '01', '系统管理员', '2019-12-30 18:35:38', '系统管理员', '2019-12-30 18:35:38');
INSERT INTO `tbl_sys_portal_menu` VALUES ('14cf3ee8540a40d0b57f66d11e4f989c', '', '0e011133214a414da936b1f3fb1bdaf2', '2f649b23e2c147cb9dd944d5088f52c3', '00', 'sys0006', '貨倉管理', '', '', '', '', 60, '99', '系统管理员', '2019-12-30 18:50:57', '系统管理员', '2019-12-30 18:51:21');
INSERT INTO `tbl_sys_portal_menu` VALUES ('15d20b41f30446078b6bd260914a84aa', '', '0e011133214a414da936b1f3fb1bdaf2', '91176812cc594218b790447066c3c243', '00', 'sys0007', 'IT 服務', '', '', '', '', 70, '01', '系统管理员', '2019-12-30 18:50:57', '系统管理员', '2019-12-30 18:50:57');
INSERT INTO `tbl_sys_portal_menu` VALUES ('2224bdcea0b2454191c873d7d837c44b', '', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', 'a6a8adfed89c4a9c829a8924e022526b', '00', 'sys9999', '系統管理', '', '', '', '', 100, '01', '系统管理员', '2019-12-20 16:19:42', '系统管理员', '2019-12-20 16:19:42');
INSERT INTO `tbl_sys_portal_menu` VALUES ('490697a7fc02443f932daea835f1f069', '', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', '91c9fe4e33b344208e6b37da22e3b761', '00', 'sys0003', '行政管理', '', '', '', '', 30, '01', '系统管理员', '2019-12-20 16:19:42', '系统管理员', '2019-12-20 16:19:42');
INSERT INTO `tbl_sys_portal_menu` VALUES ('50aa3539278d4ef4ab9c57f78b506013', '', '0e011133214a414da936b1f3fb1bdaf2', 'd9b10142026f44e5a5550361883eecd4', '00', 'sys0005', '採購管理', '', '', '', '', 50, '99', '系统管理员', '2019-12-30 18:50:56', '系统管理员', '2019-12-30 18:51:17');
INSERT INTO `tbl_sys_portal_menu` VALUES ('5e0adc15be3e464c841eb7a01065c1c8', '', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', '89196ad0ea614797b9d0c3a0bac49c9a', '00', 'sys0004', '人事管理', '', '', '', '', 40, '01', '系统管理员', '2019-12-20 16:19:42', '系统管理员', '2019-12-20 16:19:42');
INSERT INTO `tbl_sys_portal_menu` VALUES ('629078be81c346f6bf38d890e6ed4202', '', '0e011133214a414da936b1f3fb1bdaf2', '959a60a0f9be43b8baf3decbb07a1472', '00', 'sys0001', '常规操作', '', '', '', '', 10, '99', '系统管理员', '2019-12-30 18:50:56', '系统管理员', '2019-12-30 18:51:02');
INSERT INTO `tbl_sys_portal_menu` VALUES ('633390e9925e407c9b995720681f1945', '6f054a72f609444faca0c4e5aea19afd', '0e011133214a414da936b1f3fb1bdaf2', 'bbdb752801c642f6ba5a641685fdbce3', '01', 'M9996', '系統配置', 'sysConfig/configMenu.action', '', '', '', 1, '01', '系统管理员', '2019-12-30 18:50:57', '系统管理员', '2019-12-30 18:50:57');
INSERT INTO `tbl_sys_portal_menu` VALUES ('63f21d3d5cdc40808fa955b25a6e3169', '', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', '91176812cc594218b790447066c3c243', '00', 'sys0007', 'IT 服務', '', '', '', '', 70, '01', '系统管理员', '2019-12-20 16:19:42', '系统管理员', '2019-12-20 16:19:42');
INSERT INTO `tbl_sys_portal_menu` VALUES ('66919fd610af43b1942882fb5c9b8780', '', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', '2f649b23e2c147cb9dd944d5088f52c3', '00', 'sys0006', '貨倉管理', '', '', '', '', 60, '01', '系统管理员', '2019-12-20 16:19:42', '系统管理员', '2019-12-20 16:19:42');
INSERT INTO `tbl_sys_portal_menu` VALUES ('6d0bdf4d9d8c4f0483190c85f2fb3e7d', '5e0adc15be3e464c841eb7a01065c1c8', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', '', '01', 'M-00009', '请假申请', 'vacation/leftMenu.action', 'vacation/toHandleList.action', '', '', 9, '01', '系统管理员', '2020-08-27 01:45:14', '系统管理员', '2020-09-03 01:08:21');
INSERT INTO `tbl_sys_portal_menu` VALUES ('6f054a72f609444faca0c4e5aea19afd', '', '0e011133214a414da936b1f3fb1bdaf2', 'a6a8adfed89c4a9c829a8924e022526b', '00', 'sys9999', '系統管理', '', '', '', '', 100, '01', '系统管理员', '2019-12-30 18:50:57', '系统管理员', '2019-12-30 18:50:57');
INSERT INTO `tbl_sys_portal_menu` VALUES ('6f2affec37db4da9a6ac6c228b8773e4', '', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', '9586c8a3c02040969e3ebe8ed9ee1d43', '00', 'sys0008', '財務管理', '', '', '', '', 80, '01', '系统管理员', '2019-12-20 16:19:42', '系统管理员', '2019-12-20 16:19:42');
INSERT INTO `tbl_sys_portal_menu` VALUES ('7d70b598f3694f5ba307e55f81272724', '15d20b41f30446078b6bd260914a84aa', '0e011133214a414da936b1f3fb1bdaf2', '5913a76adefe4b03812e53d38c09c814', '01', 'test1', 'test2', 'test4', '', '', '', 2, '01', '系统管理员', '2019-12-30 18:50:57', '系统管理员', '2019-12-30 18:50:57');
INSERT INTO `tbl_sys_portal_menu` VALUES ('8677c0f1ff8b4378a06d8adfe968bbd6', '', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', '959a60a0f9be43b8baf3decbb07a1472', '00', 'sys0001', '常规操作', '', '', '', '', 10, '01', '系统管理员', '2019-12-20 16:19:42', '系统管理员', '2019-12-20 16:19:42');
INSERT INTO `tbl_sys_portal_menu` VALUES ('8d9be17117fd49f889eb28dad0e6178d', '8677c0f1ff8b4378a06d8adfe968bbd6', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', '', '01', 'M000000', '我的收藏', '', '', '', '', 0, '01', '系统管理员', '2019-12-30 18:36:49', '系统管理员', '2019-12-30 18:37:06');
INSERT INTO `tbl_sys_portal_menu` VALUES ('95d1a563799343d5bfb6a84d75eca51f', '5e0adc15be3e464c841eb7a01065c1c8', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', 'f50e400a980c488c9d663fd02419cba4', '01', 'M-00001', '组织架构', 'sysOrg/orgMenu.action', '', '', '', 1, '01', '系统管理员', '2019-12-20 16:19:42', '系统管理员', '2019-12-20 16:19:42');
INSERT INTO `tbl_sys_portal_menu` VALUES ('9c21f93f6f2f4a97b83e752ce10130dc', '63f21d3d5cdc40808fa955b25a6e3169', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', '5913a76adefe4b03812e53d38c09c814', '01', 'test1', 'test2', '', '', '', '', 2, '01', '系统管理员', '2019-12-20 16:19:42', '系统管理员', '2019-12-20 16:19:42');
INSERT INTO `tbl_sys_portal_menu` VALUES ('9e0e85cb51f242f2910c9bf2bc8db296', '', '0e011133214a414da936b1f3fb1bdaf2', '9586c8a3c02040969e3ebe8ed9ee1d43', '00', 'sys0008', '財務管理', '', '', '', '', 80, '00', '系统管理员', '2019-12-30 18:50:57', '系统管理员', '2019-12-30 18:51:25');
INSERT INTO `tbl_sys_portal_menu` VALUES ('a96832645a82400bafb23ad19f1b9d01', '', '0e011133214a414da936b1f3fb1bdaf2', '89196ad0ea614797b9d0c3a0bac49c9a', '00', 'sys0004', '人事管理', '', '', '', '', 40, '01', '系统管理员', '2019-12-30 18:50:56', '系统管理员', '2019-12-30 18:50:56');
INSERT INTO `tbl_sys_portal_menu` VALUES ('b6e7fc4a1eb249a6bf1d68120b8c149f', '', '0e011133214a414da936b1f3fb1bdaf2', '91c9fe4e33b344208e6b37da22e3b761', '00', 'sys0003', '行政管理', '', '', '', '', 30, '99', '系统管理员', '2019-12-30 18:50:56', '系统管理员', '2019-12-30 18:51:09');
INSERT INTO `tbl_sys_portal_menu` VALUES ('bb30a2666f3b46f39153ac1b15198ba6', '2224bdcea0b2454191c873d7d837c44b', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', 'bbdb752801c642f6ba5a641685fdbce3', '01', 'M9996', '系統配置', 'sysConfig/configMenu.action', '', '', '', 1, '01', '系统管理员', '2019-12-20 16:19:42', '系统管理员', '2019-12-20 16:19:42');
INSERT INTO `tbl_sys_portal_menu` VALUES ('be573477a7014d348c332e61885460fb', '5e0adc15be3e464c841eb7a01065c1c8', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', '', '01', 'M-00003', '档案管理', 'hrms/leftMenu.action', '', '', '', 2, '01', '系统管理员', '2020-09-03 01:08:11', '系统管理员', '2020-09-03 01:08:11');
INSERT INTO `tbl_sys_portal_menu` VALUES ('c0c083119c5645d484e5115008974c12', '', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', '3f071f4c39df45c9ad4a1cc1390593ac', '00', 'sys0002', '銷售管理', '', '', '', '', 20, '01', '系统管理员', '2019-12-20 16:19:42', '系统管理员', '2019-12-20 16:19:42');
INSERT INTO `tbl_sys_portal_menu` VALUES ('d20d46891470453e89a827e5f0d1883a', '', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', 'd9b10142026f44e5a5550361883eecd4', '00', 'sys0005', '採購管理', '', '', '', '', 50, '01', '系统管理员', '2019-12-20 16:19:42', '系统管理员', '2019-12-20 16:19:42');
INSERT INTO `tbl_sys_portal_menu` VALUES ('d7a5607f4a7d4d1588c4bf2142b56ac1', 'a96832645a82400bafb23ad19f1b9d01', '0e011133214a414da936b1f3fb1bdaf2', 'f50e400a980c488c9d663fd02419cba4', '01', 'M-00001', '组织架构', '', '', '', '', 1, '01', '系统管理员', '2019-12-30 18:50:56', '系统管理员', '2019-12-30 18:50:56');
INSERT INTO `tbl_sys_portal_menu` VALUES ('e72f65a7fa5b4271961edd17e3bb1a70', '8677c0f1ff8b4378a06d8adfe968bbd6', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', '', '01', 'M000002', '修改密码', '', '', '', '', 2, '01', '系统管理员', '2019-12-30 18:36:05', '系统管理员', '2019-12-30 18:36:05');
INSERT INTO `tbl_sys_portal_menu` VALUES ('f5b163ba5b9b4dc0a7bf6a9b553d36d3', '', '0e011133214a414da936b1f3fb1bdaf2', '3f071f4c39df45c9ad4a1cc1390593ac', '00', 'sys0002', '銷售管理', '', '', '', '', 20, '99', '系统管理员', '2019-12-30 18:50:56', '系统管理员', '2019-12-30 18:51:06');

-- ----------------------------
-- Table structure for tbl_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_role`;
CREATE TABLE `tbl_sys_role`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_role
-- ----------------------------
INSERT INTO `tbl_sys_role` VALUES ('1f79252178be423c9fb8601309218361', 'SYS-000000000000001', '测试权限', '测试使用', '01');

-- ----------------------------
-- Table structure for tbl_sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_role_permission`;
CREATE TABLE `tbl_sys_role_permission`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色code',
  `permission_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限code',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_role_permission
-- ----------------------------
INSERT INTO `tbl_sys_role_permission` VALUES ('89be801466234932b4c1056ad04c0a11', 'SYS-000000000000001', 'SYS-000000000000001', '系统管理员', '2020-01-21 17:48:25');
INSERT INTO `tbl_sys_role_permission` VALUES ('aa1f2bb60c574cb18a14b9a2ae66d57f', 'SYS-000000000000001', 'XXX-00000000000000X', '系统管理员', '2020-01-20 23:00:01');
INSERT INTO `tbl_sys_role_permission` VALUES ('ee27dec99ae046aab2a9a4a0d9f32d7a', 'SYS-000000000000001', 'SYS-000000000000002', '系统管理员', '2020-01-21 17:48:25');

-- ----------------------------
-- Table structure for tbl_sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_role_user`;
CREATE TABLE `tbl_sys_role_user`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_role_user
-- ----------------------------
INSERT INTO `tbl_sys_role_user` VALUES ('1d6c2c46ca884e31a73ec9bd79889a73', 'SYS-000000000000001', '000001', '系统管理员', '2020-01-21 17:48:40');
INSERT INTO `tbl_sys_role_user` VALUES ('3cac7e5bbdf6462d8fc9513673b45700', 'SYS-000000000000001', 'admin', '系统管理员', '2020-01-21 17:17:24');

-- ----------------------------
-- Table structure for tbl_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_user`;
CREATE TABLE `tbl_sys_user`  (
  `uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `hr_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `salt` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '01 02 03',
  `theme` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `portal_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `cmp_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `dep_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `bus_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `bus_unit_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `valid_from` date NULL DEFAULT NULL,
  `valid_to` date NULL DEFAULT NULL,
  `language` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `created_datetime` datetime(0) NULL DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `modified_datetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_sys_user
-- ----------------------------
INSERT INTO `tbl_sys_user` VALUES ('965272d24d6e43bca500db14997f2a73', NULL, '000002', '张三', '00', 'fe09f6c7abef3433e13af49cfd4a74a5', '7929cb8c15a3405ca0d25303c3c7fc13', '01', 'default', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', 'c858f352ec4642c98e4a192b7d72f632', '96e455b757a54414857dcc969618d885', '', '', '2017-01-01', '2999-12-31', 'zh_CN', '系统管理员', '2020-09-11 17:38:33', '系统管理员', '2020-09-11 17:38:33');
INSERT INTO `tbl_sys_user` VALUES ('c3456d81f63145eb88f30c38fd1093fd', NULL, 'admin', '系统管理员', '*', 'a370744c3bec2286f4855b41e0d744f2', '3d665ec984a447d4abbb6db6cab3f988', '01', 'cupertino', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', 'ec8fa583237c459abbdd6c77cfc0a94f', '', '', '', '2017-01-01', '2999-12-31', 'zh_CN', '系统管理员', '2019-10-30 01:54:56', '系统管理员', '2020-09-11 17:56:40');
INSERT INTO `tbl_sys_user` VALUES ('df39efd176754e3e8ffe1945aa981880', NULL, '000001', 'CEO-总经理', '00', 'a34fe9c57a82038546655f2602a9b0d2', '828addf8579b4df99c825044d5f0b216', '01', 'bootstrap', 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', NULL, NULL, NULL, NULL, '2017-01-03', '2999-12-31', 'en_US', '系统管理员', '2020-01-09 21:40:20', '系统管理员', '2020-09-03 00:30:52');

SET FOREIGN_KEY_CHECKS = 1;
