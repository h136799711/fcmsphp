-- phpMyAdmin SQL Dump
-- version 4.2.0-alpha2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2014-12-31 14:51:49
-- 服务器版本： 5.5.37
-- PHP Version: 5.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jjy`
--

-- --------------------------------------------------------

--
-- 表的结构 `common_config`
--

CREATE TABLE IF NOT EXISTS `common_config` (
`id` int(10) unsigned NOT NULL COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- 转存表中的数据 `common_config`
--

INSERT INTO `common_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEBSITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, '用户管理后台', 0),
(2, 'WEBSITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, '后台管理框架', 1),
(3, 'WEBSITE_KEYWORDS', 0, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, '信息', 0),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEBSITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '', 9),
(41, 'APP_VERSION', 0, '程序版本', 4, '', '程序版本主版本+大改动+小改动', 1419496611, 1419496611, 1, '1.0.0', 5),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', 4),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 9),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 5),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 7),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 10),
(38, 'DEVELOP_MODE', 0, '开发模式', 4, '', '', 1419408635, 1419408635, 1, '1', 0),
(39, 'WEBSITE_OWNER', 1, '网站拥有者', 1, '', '当前网站拥有者或是开发者', 1419415563, 1419415563, 1, '#', 1),
(40, 'DEFAULT_THEME', 4, '默认主题样式', 0, '', '默认主题样式', 1419415629, 1419415629, 1, 'default', 0),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '1', 1),
(42, 'UCENTER_PLATFORM', 1, '管理平台名称', 1, '', '', 1420006808, 1420006808, 1, '管理平台', 1);

-- --------------------------------------------------------

--
-- 表的结构 `common_log`
--

CREATE TABLE IF NOT EXISTS `common_log` (
`id` bigint(20) unsigned NOT NULL COMMENT '主键id，自增',
  `timestamp` int(10) NOT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '客户端IP',
  `request_uri` varchar(1024) DEFAULT NULL COMMENT '请求url',
  `context` text NOT NULL COMMENT '上下文环境Session，Cookie之类',
  `info` text NOT NULL COMMENT '记录信息'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

--
-- 表的结构 `common_member`
--

CREATE TABLE IF NOT EXISTS `common_member` (
`uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `realname` char(16) DEFAULT NULL COMMENT '真实姓名',
  `idnumber` char(32) NOT NULL COMMENT '身份证号',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `orgcode` varchar(64) NOT NULL COMMENT '机构代码'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `common_member`
--

INSERT INTO `common_member` (`uid`, `realname`, `idnumber`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`, `orgcode`) VALUES
(1, 'admin', 'admin', 'admin', 0, '0000-00-00', '', 40, 5, 0, 1417400172, 2130706433, 1419560493, 1, ''),
(2, 'test', 'test', 'admin', 0, '0000-00-00', '', 40, 5, 0, 1417400172, 2130706433, 1419560493, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `common_menu`
--

CREATE TABLE IF NOT EXISTS `common_menu` (
`id` int(10) unsigned NOT NULL COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=150 ;

--
-- 转存表中的数据 `common_menu`
--

INSERT INTO `common_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `status`) VALUES
(136, '充值记录', 147, 2, 'Jjy/RemittanceRecord/index', 0, '汇款记录查询', '', 0, 1),
(135, '配置管理', 133, 2, 'Ucenter/Config/index', 0, '系统的配置信息管理', '', 1, 1),
(129, '系统', 0, 11, 'Ucenter/Config/set', 0, '', '', 1, 1),
(133, '配置模块', 129, 1, '#', 1, '', '', 1, 1),
(134, '菜单配置', 133, 0, 'Ucenter/Menu/index', 0, '系统菜单配置', '', 0, 1),
(137, '日志模块', 129, 0, 'Ucenter/Log/index', 0, '日志记录', '', 0, 1),
(138, '系统日志', 137, 2, 'Ucenter/Log/system', 0, '系统日志', '', 0, 1),
(139, '系统工具', 129, 0, '#', 0, '', '', 0, 1),
(140, '缓存清除', 139, 1, 'Ucenter/Cache/clearAll', 0, '缓存清除,不清楚log日志', '', 0, 1),
(142, '系统设置', 133, 3, 'Ucenter/Config/set', 0, '', '', 0, 1),
(143, '数据备份', 139, 2, 'Database/index?type=export', 0, '数据库备份', '', 0, 1),
(144, '数据还原', 139, 4, 'Database/index?type=import', 0, '数据库还原', '', 0, 1),
(145, '收款账户管理', 147, 1, 'Jjy/BankAccount/index', 0, '收款账户管理', '', 0, 1),
(146, '平台管理', 0, 2, 'Jjy/Index/index', 0, '充值记录', '', 0, 1),
(147, '平台管理', 146, 42, 'Jjy/Index/index', 0, '', '', 0, 1),
(148, '用户管理', 147, 0, 'Jjy/Member/index', 0, '注册用户管理', '', 0, 1),
(149, '充值审核', 147, 5, 'Jjy/RemittanceRecord/needcheck', 0, '充值记录待审核数据', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jjy_bank_account`
--

CREATE TABLE IF NOT EXISTS `jjy_bank_account` (
`id` int(10) unsigned NOT NULL,
  `account` char(64) NOT NULL COMMENT '银行账户名',
  `bank_name` varchar(128) NOT NULL COMMENT '银行名称',
  `bank_type` tinyint(4) NOT NULL COMMENT '银行类别',
  `bank_url` varchar(128) NOT NULL COMMENT '银行支付首页地址',
  `account_name` varchar(32) DEFAULT NULL COMMENT '收款人姓名',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '数据更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `jjy_bank_account`
--

INSERT INTO `jjy_bank_account` (`id`, `account`, `bank_name`, `bank_type`, `bank_url`, `account_name`, `create_time`, `update_time`, `status`) VALUES
(1, '12345678910', '招商银行', 0, 'http://www.cmbchina.com/', '王大锤', 1419696000, 1419696000, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jjy_member`
--

CREATE TABLE IF NOT EXISTS `jjy_member` (
`uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `realname` char(16) DEFAULT NULL COMMENT '真实姓名',
  `idnumber` char(32) NOT NULL COMMENT '身份证号',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `orgcode` varchar(64) NOT NULL COMMENT '机构代码',
  `remark` varchar(32) NOT NULL DEFAULT '' COMMENT '预留信息',
  `email` char(35) NOT NULL COMMENT '邮箱',
  `mobile` char(15) NOT NULL COMMENT '手机号码'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=140 ;

--
-- 转存表中的数据 `jjy_member`
--

INSERT INTO `jjy_member` (`uid`, `realname`, `idnumber`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`, `orgcode`, `remark`, `email`, `mobile`) VALUES
(2, 'test', 'test', 'admin', 0, '0000-00-00', '', 40, 5, 0, 1417400172, 2130706433, 1419560493, 1, '333', '', 'dd', '123456');

-- --------------------------------------------------------

--
-- 表的结构 `jjy_remittance_record`
--

CREATE TABLE IF NOT EXISTS `jjy_remittance_record` (
`id` bigint(20) NOT NULL COMMENT 'id 自增',
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '汇款金额',
  `deposit_type` tinyint(4) NOT NULL COMMENT '存款方式',
  `userid` int(11) NOT NULL COMMENT '用户id',
  `username` varchar(32) NOT NULL COMMENT '汇款账号姓名',
  `remark` varchar(128) DEFAULT NULL COMMENT '汇款预留信息',
  `transaction_date` int(10) unsigned NOT NULL COMMENT '汇款时间',
  `create_time` int(11) NOT NULL COMMENT '汇款时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `status` tinyint(4) NOT NULL COMMENT '状态 -1：已删除 0 被禁用 1：�',
  `reason` varchar(256) DEFAULT NULL COMMENT '不通过理由',
  `operatorid` int(11) DEFAULT NULL COMMENT '操作员id',
  `deposit_bank_address` varchar(128) NOT NULL COMMENT '开户行地址',
  `deposit_bank_account` char(35) NOT NULL COMMENT '银行账户',
  `deposit_bank_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '银行类别',
  `deposit_username` char(15) NOT NULL COMMENT '收款人姓名',
  `currency` tinyint(4) NOT NULL DEFAULT '0' COMMENT '交易货币类型，暂默认0为人民币'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `jjy_remittance_record`
--

INSERT INTO `jjy_remittance_record` (`id`, `money`, `deposit_type`, `userid`, `username`, `remark`, `transaction_date`, `create_time`, `update_time`, `status`, `reason`, `operatorid`, `deposit_bank_address`, `deposit_bank_account`, `deposit_bank_type`, `deposit_username`, `currency`) VALUES
(1, 0, 0, 3, 'test', '123456', 0, 1419762412, 0, 4, 'aaaad', NULL, '', '', 0, '', 0),
(2, 0, 0, 3, 'test', '123456', 0, 1419762412, 0, 3, 'aaaad', NULL, '', '', 0, '', 0),
(3, 0, 0, 3, 'test', '123456', 0, 1419762412, 0, 2, 'aaaad', NULL, '', '', 0, '', 0),
(4, 12, 0, 25, '12', '12', 1419992756, 1419993170, 1419993170, 2, NULL, NULL, '', '', 0, '', 0),
(5, 100, 0, 26, '100', '10', 1420004053, 1420004058, 1420004058, 2, NULL, NULL, '', '', 0, '', 0),
(6, 100, 0, 26, '何必都', 'he', 1420004530, 1420004569, 1420004569, 2, NULL, NULL, '招商银行', '12345678910', 0, '王大锤', 0);

-- --------------------------------------------------------

--
-- 表的结构 `uc_ucenter_admin`
--

CREATE TABLE IF NOT EXISTS `uc_ucenter_admin` (
`id` int(10) unsigned NOT NULL COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `uc_ucenter_admin`
--

INSERT INTO `uc_ucenter_admin` (`id`, `member_id`, `status`) VALUES
(1, 1, 1),
(3, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `uc_ucenter_app`
--

CREATE TABLE IF NOT EXISTS `uc_ucenter_app` (
`id` int(10) unsigned NOT NULL COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `uc_ucenter_app`
--

INSERT INTO `uc_ucenter_app` (`id`, `title`, `url`, `ip`, `auth_key`, `sys_login`, `allow_ip`, `create_time`, `update_time`, `status`) VALUES
(1, 'OAuth2应用模块', 'http://127.0.0.1/', '127.0.0.1', 'auth_key', 1, '127.0.0.1', 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `uc_ucenter_member`
--

CREATE TABLE IF NOT EXISTS `uc_ucenter_member` (
`id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `uc_ucenter_member`
--

INSERT INTO `uc_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'admin', '73ec9701ea26afb1d6585e660febb9a4', 'hebiduhebi@126.com', '', 1417400172, 2130706433, 1420008507, 2130706433, 1417400172, 1),
(2, 'jjy', 'b82e6068a5451e96b4c077df31c234de', 'he@126.com', '', 1419756079, 2130706433, 1420008620, 2130706433, 1419756079, 1);

-- --------------------------------------------------------

--
-- 表的结构 `uc_ucenter_setting`
--

CREATE TABLE IF NOT EXISTS `uc_ucenter_setting` (
`id` int(10) unsigned NOT NULL COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表' AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `common_config`
--
ALTER TABLE `common_config`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uk_name` (`name`), ADD KEY `type` (`type`), ADD KEY `group` (`group`);

--
-- Indexes for table `common_log`
--
ALTER TABLE `common_log`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `common_member`
--
ALTER TABLE `common_member`
 ADD PRIMARY KEY (`uid`), ADD KEY `status` (`status`);

--
-- Indexes for table `common_menu`
--
ALTER TABLE `common_menu`
 ADD PRIMARY KEY (`id`), ADD KEY `pid` (`pid`), ADD KEY `status` (`status`);

--
-- Indexes for table `jjy_bank_account`
--
ALTER TABLE `jjy_bank_account`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jjy_member`
--
ALTER TABLE `jjy_member`
 ADD PRIMARY KEY (`uid`), ADD UNIQUE KEY `uid` (`uid`), ADD KEY `status` (`status`);

--
-- Indexes for table `jjy_remittance_record`
--
ALTER TABLE `jjy_remittance_record`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `uc_ucenter_admin`
--
ALTER TABLE `uc_ucenter_admin`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uc_ucenter_app`
--
ALTER TABLE `uc_ucenter_app`
 ADD PRIMARY KEY (`id`), ADD KEY `status` (`status`);

--
-- Indexes for table `uc_ucenter_member`
--
ALTER TABLE `uc_ucenter_member`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`), ADD UNIQUE KEY `email` (`email`), ADD KEY `status` (`status`);

--
-- Indexes for table `uc_ucenter_setting`
--
ALTER TABLE `uc_ucenter_setting`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `common_config`
--
ALTER TABLE `common_config`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `common_log`
--
ALTER TABLE `common_log`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id，自增',AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `common_member`
--
ALTER TABLE `common_member`
MODIFY `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `common_menu`
--
ALTER TABLE `common_menu`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',AUTO_INCREMENT=150;
--
-- AUTO_INCREMENT for table `jjy_bank_account`
--
ALTER TABLE `jjy_bank_account`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jjy_member`
--
ALTER TABLE `jjy_member`
MODIFY `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=140;
--
-- AUTO_INCREMENT for table `jjy_remittance_record`
--
ALTER TABLE `jjy_remittance_record`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id 自增',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `uc_ucenter_admin`
--
ALTER TABLE `uc_ucenter_admin`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `uc_ucenter_app`
--
ALTER TABLE `uc_ucenter_app`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `uc_ucenter_member`
--
ALTER TABLE `uc_ucenter_member`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `uc_ucenter_setting`
--
ALTER TABLE `uc_ucenter_setting`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
