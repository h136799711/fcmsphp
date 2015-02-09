-- phpMyAdmin SQL Dump
-- version 4.2.0-alpha2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2014-12-29 09:29:36
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
  `orgcode` varchar(64) NOT NULL COMMENT '机构代码'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `jjy_member`
--

INSERT INTO `jjy_member` (`uid`, `realname`, `idnumber`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`, `orgcode`) VALUES
(1, 'admin', 'admin', 'admin', 0, '0000-00-00', '', 40, 5, 0, 1417400172, 2130706433, 1419560493, 1, ''),
(2, 'test', 'test', 'admin', 0, '0000-00-00', '', 40, 5, 0, 1417400172, 2130706433, 1419560493, 1, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jjy_member`
--
ALTER TABLE `jjy_member`
 ADD PRIMARY KEY (`uid`), ADD KEY `status` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jjy_member`
--
ALTER TABLE `jjy_member`
MODIFY `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
