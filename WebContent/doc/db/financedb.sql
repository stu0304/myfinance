/*
Navicat MySQL Data Transfer

Source Server         : myServer
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : financedb

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2018-05-15 11:40:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_attenchment`
-- ----------------------------
DROP TABLE IF EXISTS `t_attenchment`;
CREATE TABLE `t_attenchment` (
  `t_attid` varchar(50) NOT NULL,
  `t_id` varchar(50) DEFAULT NULL,
  `t_attname` varchar(100) DEFAULT NULL,
  `t_type` varchar(20) DEFAULT NULL,
  `t_atturl` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`t_attid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_attenchment
-- ----------------------------
INSERT INTO `t_attenchment` VALUES ('46c51437-7a9c-4cea-bf92-706fd7ceabad', '8ed2d6d6-0698-40b1-8e85-a495d9d7fb13', '设备导入模板.xlsx', 'fujian', '/hospital/uploadFile\\');
INSERT INTO `t_attenchment` VALUES ('4a7491df-e371-426c-b32f-c3d582733247', '51662e65-99bf-40d0-a5c4-2d435f11f152', '', 'headicon', '/fincance/uploadFile\\');
INSERT INTO `t_attenchment` VALUES ('6e598a2c-c593-4a36-949c-3fa9fb6f31ec', '268f0018-36e1-4a4f-aad8-ce810932c3e5', '01300543111029143262054331837_s.jpg', 'shebei', '/hospital/uploadFile\\');
INSERT INTO `t_attenchment` VALUES ('80bf0be4-4b1a-4018-9743-5442a17c2c06', '400d164d-08bb-4b95-a599-75be3f92a248', 'bg2017122706.jpg', 'headicon', '/fincance/uploadFile\\');
INSERT INTO `t_attenchment` VALUES ('8d35d905-0995-418e-973c-e696ca2aacdc', '8ed2d6d6-0698-40b1-8e85-a495d9d7fb13', 'ocp 5-19.docx', 'fujian', '/hospital/uploadFile\\');
INSERT INTO `t_attenchment` VALUES ('97abff6a-ebd5-4413-9b49-68e0092cac94', 'fd3a93ff-023e-4724-a029-21cb80a9edca', 'TIM图片20171220172409.jpg', 'headicon', '/fincance/uploadFile\\');
INSERT INTO `t_attenchment` VALUES ('99daf83d-14fc-442a-9a4f-e39a07fde064', '3902adf9-378a-4adf-af05-321ebd85bb0b', 'bg2018011106.jpg', 'headicon', '/fincance/uploadFile\\');
INSERT INTO `t_attenchment` VALUES ('d97b0c76-0299-4253-b71f-9f24cd3014e0', '4ccb7efd-61ea-4263-9403-d4a7afd275ea', 'bg2018011104.jpg', 'headicon', '/fincance/uploadFile\\');
INSERT INTO `t_attenchment` VALUES ('e60bc4b7-33e4-417b-bac1-93a9944e9e3a', '42855f07-b499-465d-8c40-49c702a32319', '', 'headicon', '/hospital/uploadFile\\');
INSERT INTO `t_attenchment` VALUES ('fce70d18-cf25-4e31-99e7-4cf0e8eb345e', '', 'bg2017122706.jpg', 'headicon', '/fincance/uploadFile\\');

-- ----------------------------
-- Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `t_com_id` varchar(50) NOT NULL,
  `t_com_pid` varchar(50) DEFAULT NULL,
  `t_com_name` varchar(50) DEFAULT NULL,
  `t_org_code` varchar(50) DEFAULT NULL,
  `t_address` varchar(50) DEFAULT NULL,
  `t_zhuceriqi` varchar(50) DEFAULT NULL,
  `t_zhuciziben` varchar(50) DEFAULT NULL,
  `t_faren` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------
INSERT INTO `t_company` VALUES ('001     3da29e9c-61a8-4f5e-86a2-466ddd485f22', '-1', '航天科工总公司', '123', '天津空港经济区', '2008-2-1', '5000', '王经理');
INSERT INTO `t_company` VALUES ('1845bad7-52b9-403f-87c5-b68337e287e2', '502a6b11-37ad-452a-b3c6-ce892289ee94', '北京朝阳分公司', null, null, null, null, null);
INSERT INTO `t_company` VALUES ('1e96534a-58fb-46ab-8686-d4cc192a8afb', 'cd123e91-805f-46b4-8dd2-3447c373740f', '天津河西分公司', null, null, null, null, null);
INSERT INTO `t_company` VALUES ('2905ae81-1b53-402c-950a-243eb4f769e4', '001', '上海分公司', null, null, null, null, null);
INSERT INTO `t_company` VALUES ('3da29e9c-61a8-4f5e-86a2-466ddd485f22', '2905ae81-1b53-402c-950a-243eb4f769e4', '上海徐汇分公司', '001002003', '上海市徐汇区 102号111', null, '6000', '王经理');
INSERT INTO `t_company` VALUES ('502a6b11-37ad-452a-b3c6-ce892289ee94', '001', '北京分公司', null, null, null, null, null);
INSERT INTO `t_company` VALUES ('b06d1f77-fa2b-475d-9f47-f74d9e895056', '001     3da29e9c-61a8-4f5e-86a2-466ddd485f22', '大软', null, null, null, null, null);
INSERT INTO `t_company` VALUES ('cd123e91-805f-46b4-8dd2-3447c373740f', '001', '天津分公司', null, null, null, null, null);
INSERT INTO `t_company` VALUES ('d3196a07-b5a7-475c-884d-4be8f933a527', 'cd123e91-805f-46b4-8dd2-3447c373740f', '天津和平分公司', null, null, null, null, null);

-- ----------------------------
-- Table structure for `t_dic_code`
-- ----------------------------
DROP TABLE IF EXISTS `t_dic_code`;
CREATE TABLE `t_dic_code` (
  `t_dic_id` varchar(50) NOT NULL,
  `t_dic_code` varchar(50) DEFAULT NULL,
  `t_name` varchar(50) DEFAULT NULL,
  `t_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_dic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dic_code
-- ----------------------------
INSERT INTO `t_dic_code` VALUES ('2447ce18-f83c-43aa-8614-53a7cb7fc319', 'abfa598e-4efa-457e-8756-1153c553595f', '超级管理员', '权限');
INSERT INTO `t_dic_code` VALUES ('6a6c9716-edde-43a5-86da-2b70a1f22f33', '745ec6a0-03d0-44fe-93ad-ed3f13fff21b', '女', '性别');
INSERT INTO `t_dic_code` VALUES ('d19211b0-63ed-4650-985d-3f30ec1e0f2b', '33603a59-7a92-4d12-a05c-eddca091ac5e', '财务主管', '权限');
INSERT INTO `t_dic_code` VALUES ('dadeb277-df59-4786-ad71-a926f2fd81ba', '3c3c352d-28ca-47fa-be3d-bcabe18cd288', '男', '性别');

-- ----------------------------
-- Table structure for `t_loan_details`
-- ----------------------------
DROP TABLE IF EXISTS `t_loan_details`;
CREATE TABLE `t_loan_details` (
  `t_loan_id` varchar(50) NOT NULL,
  `t_loanout_comid` varchar(50) DEFAULT NULL,
  `t_loanin_comid` varchar(50) DEFAULT NULL,
  `t_loan_pre_time` varchar(50) DEFAULT NULL,
  `t_loan_start_time` varchar(50) DEFAULT NULL,
  `t_loan_num` varchar(50) DEFAULT NULL,
  `t_loan_end_time` varchar(50) DEFAULT NULL,
  `t_warn_days` varchar(50) DEFAULT NULL,
  `t_weiyue_num` varchar(50) DEFAULT NULL,
  `t_lixi` varchar(50) DEFAULT NULL,
  `t_changhuan_total` varchar(50) DEFAULT NULL,
  `t_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_loan_details
-- ----------------------------
INSERT INTO `t_loan_details` VALUES ('a0d480cd-5bf0-4d7d-a929-8dd1fc586d1d', '3da29e9c-61a8-4f5e-86a2-466ddd485f22', 'b06d1f77-fa2b-475d-9f47-f74d9e895056', null, '2018-06-01', '140', '2018-06-30', '40', '0.01', '0.4', null, '债务方已还款');
INSERT INTO `t_loan_details` VALUES ('cbbf4f41-40b5-4494-b3fc-6dd05161abd4', '1845bad7-52b9-403f-87c5-b68337e287e2', '3da29e9c-61a8-4f5e-86a2-466ddd485f22', null, '2018-06-01', '6.5', '2018-06-30', '28', '0.01', '0.3', null, '债务方已还款');

-- ----------------------------
-- Table structure for `t_person`
-- ----------------------------
DROP TABLE IF EXISTS `t_person`;
CREATE TABLE `t_person` (
  `t_preson_id` varchar(50) NOT NULL,
  `t_user_id` varchar(50) DEFAULT NULL,
  `t_com_id` varchar(50) DEFAULT NULL,
  `t_dic_id` varchar(50) DEFAULT NULL,
  `t_gender` varchar(10) DEFAULT NULL,
  `t_mobile` varchar(20) DEFAULT NULL,
  `t_email` varchar(30) DEFAULT NULL,
  `t_cname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_preson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_person
-- ----------------------------
INSERT INTO `t_person` VALUES ('03bf0956-d8b2-49f2-a5b7-e10bbfc06e98', '7605356d-4d4a-4f9a-92db-7e198136bee9', 'b06d1f77-fa2b-475d-9f47-f74d9e895056', null, '女', '1353232212', '2q324@163.com', '窦艳梅');
INSERT INTO `t_person` VALUES ('086aa83e-93fc-4d96-8258-edfa49647a4d', '5f184ae7-706b-4d35-8497-07f94ee004df', '1845bad7-52b9-403f-87c5-b68337e287e2', '4', '男', '135498382232', 'zhao@163.com', '赵小明');
INSERT INTO `t_person` VALUES ('3902adf9-378a-4adf-af05-321ebd85bb0b', '9dd475bc-4134-4034-b9c6-287cff320e21', '1e96534a-58fb-46ab-8686-d4cc192a8afb', null, '女', '111111', '222222', '天津河西人');
INSERT INTO `t_person` VALUES ('400d164d-08bb-4b95-a599-75be3f92a248', '2c927ef3-930f-4632-82fe-e82e164284d7', '3da29e9c-61a8-4f5e-86a2-466ddd485f22', null, '男', '111111', '222222', '上海徐汇人');
INSERT INTO `t_person` VALUES ('42855f07-b499-465d-8c40-49c702a32319', '0e86711f-5890-45e4-a058-867ab523e77a', '1e96534a-58fb-46ab-8686-d4cc192a8afb', null, '女', '1354645432', 'yang@163.com', '杨艳萌');
INSERT INTO `t_person` VALUES ('4ccb7efd-61ea-4263-9403-d4a7afd275ea', 'dce33493-0a66-4726-94f3-3c2779300006', 'd3196a07-b5a7-475c-884d-4be8f933a527', null, '男', '111111', '222222', '天津和平人');
INSERT INTO `t_person` VALUES ('51662e65-99bf-40d0-a5c4-2d435f11f152', 'b5a6cf84-ef59-443c-bcc3-e11120093c96', '001', '5', '男', '18766765453', 'wayne@gmail.com', '我是管理员123');
INSERT INTO `t_person` VALUES ('57a14194-d2dc-4a01-be2b-701cf340a973', '9298e46b-88f9-4202-8850-ba696d062c6a', null, null, null, '4444', '44444', null);
INSERT INTO `t_person` VALUES ('7d7b2715-479a-4581-9940-86db7c5dfdf4', '020a2ec4-f25c-4158-8806-b80125e45238', null, null, null, '333', '333333', null);
INSERT INTO `t_person` VALUES ('b5c20974-03ce-471e-90e9-cb8977f9941a', '5e29d82e-4bda-4946-b047-4987ac58d899', null, '5', '男', '13233454565', 'hanwang@163.com', '王先生');
INSERT INTO `t_person` VALUES ('c281777b-eb53-41f3-8782-68d35be2c789', 'ffeb1706-d9c2-4790-9320-13cc137e51b9', null, '4', '男', '13512345678', 'hanwang@163.com', '我是操作员');
INSERT INTO `t_person` VALUES ('c5860507-1a84-4be7-a565-cb0032c9fd9f', 'dd703768-ca11-4dd1-9734-b98c94aabde0', null, null, null, '1111111', '2222222', null);
INSERT INTO `t_person` VALUES ('de7a0eff-e0f0-44de-9d47-271ae27576e2', '40641e56-ed3f-42c4-a884-6d168bf44cc3', null, null, null, '13576879886', 'xiaowang@163.com', null);
INSERT INTO `t_person` VALUES ('fbccd370-7532-46e0-9fce-d7ceae1557bb', '3', null, '5', '男', '1359939343', 'haha@163.com', '哈哈3');
INSERT INTO `t_person` VALUES ('fd3a93ff-023e-4724-a029-21cb80a9edca', '2f1d648f-c3d5-4df0-bb9b-7fc831a6bcac', '1845bad7-52b9-403f-87c5-b68337e287e2', null, '男', '111111', '222222', '朝阳人');

-- ----------------------------
-- Table structure for `t_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user` (
  `t_user_id` varchar(50) NOT NULL,
  `t_user_name` varchar(50) DEFAULT NULL,
  `t_user_pwd` varchar(50) DEFAULT NULL,
  `t_role` varchar(50) DEFAULT NULL,
  `t_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`t_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES ('0e86711f-5890-45e4-a058-867ab523e77a', 'yangyanmeng', 'yangyanmeng', '', '-1');
INSERT INTO `t_sys_user` VALUES ('2c927ef3-930f-4632-82fe-e82e164284d7', 'shxh', 'shxh', '33603a59-7a92-4d12-a05c-eddca091ac5e', '1');
INSERT INTO `t_sys_user` VALUES ('2f1d648f-c3d5-4df0-bb9b-7fc831a6bcac', 'bjcy', 'bjcy', '33603a59-7a92-4d12-a05c-eddca091ac5e', '1');
INSERT INTO `t_sys_user` VALUES ('40641e56-ed3f-42c4-a884-6d168bf44cc3', 'xiaowang', '123', '', '1');
INSERT INTO `t_sys_user` VALUES ('5f184ae7-706b-4d35-8497-07f94ee004df', 'zhaopengxiang', 'zhaopengxiang', '', '1');
INSERT INTO `t_sys_user` VALUES ('7605356d-4d4a-4f9a-92db-7e198136bee9', 'douyanmei', '123', '33603a59-7a92-4d12-a05c-eddca091ac5e', '1');
INSERT INTO `t_sys_user` VALUES ('9dd475bc-4134-4034-b9c6-287cff320e21', 'tjhx', 'tjhx', '33603a59-7a92-4d12-a05c-eddca091ac5e', '1');
INSERT INTO `t_sys_user` VALUES ('b5a6cf84-ef59-443c-bcc3-e11120093c96', 'admin', 'admin', 'abfa598e-4efa-457e-8756-1153c553595f', '1');
INSERT INTO `t_sys_user` VALUES ('dce33493-0a66-4726-94f3-3c2779300006', 'tjhp', 'tjhp', '33603a59-7a92-4d12-a05c-eddca091ac5e', '1');

-- ----------------------------
-- Table structure for `t_zichanfuzhai`
-- ----------------------------
DROP TABLE IF EXISTS `t_zichanfuzhai`;
CREATE TABLE `t_zichanfuzhai` (
  `t_zcfz_id` varchar(50) NOT NULL,
  `t_com_id` varchar(50) DEFAULT NULL,
  `t_huobizijin` varchar(50) DEFAULT NULL,
  `t_yingshouzhangkuan` varchar(50) DEFAULT NULL,
  `t_gudingzichanyuanzhi` varchar(50) DEFAULT NULL,
  `t_leijizhejiu` varchar(50) DEFAULT NULL,
  `t_gudingzichanheji` varchar(50) DEFAULT NULL,
  `t_zichanheji` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_zcfz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_zichanfuzhai
-- ----------------------------
INSERT INTO `t_zichanfuzhai` VALUES ('05ed496c-8df4-44ea-b051-c7165fb3d008', '502a6b11-37ad-452a-b3c6-ce892289ee94', null, null, null, null, null, null);
INSERT INTO `t_zichanfuzhai` VALUES ('33562b94-f11c-4c75-ba2a-d19fb5a59682', 'b06d1f77-fa2b-475d-9f47-f74d9e895056', '-40.0', null, null, null, null, null);
INSERT INTO `t_zichanfuzhai` VALUES ('4587a9ec-c73f-4f27-96b3-4de34eea56ad', 'cd123e91-805f-46b4-8dd2-3447c373740f', null, null, null, null, null, null);
INSERT INTO `t_zichanfuzhai` VALUES ('5dbfac14-b7ee-414d-840d-05c1ef4d9517', '0ae9ffff-d16e-4d1a-99b6-74dbd0cdb2c3', null, null, null, null, null, null);
INSERT INTO `t_zichanfuzhai` VALUES ('644e6a2d-9fe9-4085-9399-00734217d8fa', '1e96534a-58fb-46ab-8686-d4cc192a8afb', '2500', '200', '300', '200', '100', '400');
INSERT INTO `t_zichanfuzhai` VALUES ('7d346012-f529-4bef-8a21-f24e5d198c5b', 'c076f193-5ef4-4054-bbd3-b304d3a67fdf', '1', '2', '3', '4', '5', '6');
INSERT INTO `t_zichanfuzhai` VALUES ('810c88b2-17f8-4813-a853-cea6d9c54e3a', 'd3196a07-b5a7-475c-884d-4be8f933a527', '1000', '300', '4000', '500', '3500', '4800');
INSERT INTO `t_zichanfuzhai` VALUES ('aa5698ae-df72-4dcf-890a-d6a334e37fe3', '2905ae81-1b53-402c-950a-243eb4f769e4', null, null, null, null, null, null);
INSERT INTO `t_zichanfuzhai` VALUES ('b6b82da9-ea29-4b02-a00c-944e35f03f71', '3da29e9c-61a8-4f5e-86a2-466ddd485f22', '100.0', '200', '2000', '500', '1500', '2700');
INSERT INTO `t_zichanfuzhai` VALUES ('c2002f26-4f88-4b7f-9557-aca5ee715d7a', '1845bad7-52b9-403f-87c5-b68337e287e2', '1005.0', '200', '600', '200', '400', '700');
