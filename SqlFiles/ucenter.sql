-- phpMyAdmin SQL Dump
-- version 4.2.0-alpha2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2014-12-12 18:08:49
-- 服务器版本： 5.5.37
-- PHP Version: 5.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `resp_ot`
--

-- --------------------------------------------------------

--
-- 表的结构 `uc_ucenter_admin`
--

CREATE TABLE IF NOT EXISTS `uc_ucenter_admin` (
`id` int(10) unsigned NOT NULL COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=1 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `uc_ucenter_member`
--

INSERT INTO `uc_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'admin', '73ec9701ea26afb1d6585e660febb9a4', 'hebiduhebi@126.com', '', 1417400172, 2130706433, 1418369758, 2130706433, 1417400172, 1);

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
-- AUTO_INCREMENT for table `uc_ucenter_admin`
--
ALTER TABLE `uc_ucenter_admin`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID';
--
-- AUTO_INCREMENT for table `uc_ucenter_app`
--
ALTER TABLE `uc_ucenter_app`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID';
--
-- AUTO_INCREMENT for table `uc_ucenter_member`
--
ALTER TABLE `uc_ucenter_member`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uc_ucenter_setting`
--
ALTER TABLE `uc_ucenter_setting`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
