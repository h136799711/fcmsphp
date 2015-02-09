-- phpMyAdmin SQL Dump
-- version 4.2.0-alpha2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2014-12-28 10:20:01
-- 服务器版本： 5.5.37
-- PHP Version: 5.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hebidu_rbac`
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- 转存表中的数据 `common_config`
--

INSERT INTO `common_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEBSITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, '用户管理后台', 0),
(2, 'WEBSITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, '后台管理框架', 1),
(3, 'WEBSITE_KEYWORDS', 0, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, '古睿信息', 0),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEBSITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '浙ICP备14029991号-2', 9),
(41, 'APP_VERSION', 0, '程序版本', 4, '', '程序版本主版本+大改动+小改动', 1419496611, 1419496611, 1, '1.0.0', 5),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', 4),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 9),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 5),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 7),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 10),
(38, 'DEVELOP_MODE', 0, '开发模式', 4, '', '', 1419408635, 1419408635, 1, '1', 0),
(39, 'WEBSITE_OWNER', 1, '网站拥有者', 1, '', '当前网站拥有者或是开发者', 1419415563, 1419415563, 1, '绍兴古睿信息科技有限公司', 1),
(40, 'DEFAULT_THEME', 4, '默认主题样式', 0, '', '默认主题样式', 1419415629, 1419415629, 1, 'default', 0),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '1', 1);

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

--
-- 转存表中的数据 `common_log`
--

INSERT INTO `common_log` (`id`, `timestamp`, `remote_addr`, `request_uri`, `context`, `info`) VALUES
(29, 1419403989, '127.0.0.1', '/resp/hebidu/hebidu/index.php/Ucenter/Config/edit/id/37.shtml', 'COOKIE:a:12:{s:24:"thinkphp_show_page_trace";s:3:"0|0";s:15:"CNZZDATA4126717";s:48:"cnzz_eid=1921425653-1409744830-&ntime=1409744830";s:16:"ebak_loginlangid";s:1:"1";s:16:"bdshare_firstime";s:13:"1413184559164";s:15:"CNZZDATA5524076";s:73:"cnzz_eid=1153009811-1410917713-http%3A%2F%2Flocalhost%2F&ntime=1415065905";s:15:"AJSTAT_ok_times";s:1:"1";s:15:"CNZZDATA1702264";s:73:"cnzz_eid=2138502453-1418106368-http%3A%2F%2Flocalhost%2F&ntime=1418106368";s:19:"T3_TSV3_LOGGED_USER";s:32:"ZrMHnKszUTFgLND68h606mQ2dwIDqQxo";s:8:"ts_email";s:15:"admin@admin.com";s:12:"ts_autologin";s:31:"impa20mg0xkw4wk0g88ko4cow8c4840";s:9:"PHPSESSID";s:26:"hg6e0gcputh81orai5khd7ev00";s:14:"think_language";s:5:"zh-CN";}SESSION:a:1:{s:6:"oauth_";a:3:{s:3:"uid";s:1:"1";s:12:"activemenuid";s:3:"129";s:15:"activesubmenuid";s:3:"135";}}POST:a:0:{}GET:a:1:{s:2:"id";s:2:"37";}SERVER:a:37:{s:9:"HTTP_HOST";s:9:"localhost";s:15:"HTTP_CONNECTION";s:10:"keep-alive";s:11:"HTTP_PRAGMA";s:8:"no-cache";s:18:"HTTP_CACHE_CONTROL";s:8:"no-cache";s:11:"HTTP_ACCEPT";s:74:"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";s:15:"HTTP_USER_AGENT";s:109:"Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36";s:8:"HTTP_DNT";s:1:"1";s:12:"HTTP_REFERER";s:72:"http://localhost/resp/hebidu/hebidu/index.php/Ucenter/Config/index.shtml";s:20:"HTTP_ACCEPT_ENCODING";s:17:"gzip,deflate,sdch";s:20:"HTTP_ACCEPT_LANGUAGE";s:35:"zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4";s:11:"HTTP_COOKIE";s:569:"thinkphp_show_page_trace=0|0; CNZZDATA4126717=cnzz_eid%3D1921425653-1409744830-%26ntime%3D1409744830; ebak_loginlangid=1; bdshare_firstime=1413184559164; CNZZDATA5524076=cnzz_eid%3D1153009811-1410917713-http%253A%252F%252Flocalhost%252F%26ntime%3D1415065905; AJSTAT_ok_times=1; CNZZDATA1702264=cnzz_eid%3D2138502453-1418106368-http%253A%252F%252Flocalhost%252F%26ntime%3D1418106368; T3_TSV3_LOGGED_USER=ZrMHnKszUTFgLND68h606mQ2dwIDqQxo; ts_email=admin%40admin.com; ts_autologin=impa20mg0xkw4wk0g88ko4cow8c4840; PHPSESSID=hg6e0gcputh81orai5khd7ev00; think_language=zh-CN";s:4:"PATH";s:1312:"C:ProgramDataOracleJavajavapath;C:Program Files (x86)NVIDIA CorporationPhysXCommon;C:Program Files (x86)Common FilesNetSarang;c:\rubyin;C:Program Files (x86)InteliCLS Client;C:Program FilesInteliCLS Client;C:WINDOWSsystem32;C:WINDOWS;C:WINDOWSSystem32Wbem;C:WINDOWSSystem32WindowsPowerShellv1.0;C:Program Files (x86)IntelOpenCL SDK2.0inx86;C:Program Files (x86)IntelOpenCL SDK2.0inx64;C:Program FilesIntelIntel(R) Management Engine ComponentsDAL;C:Program FilesIntelIntel(R) Management Engine ComponentsIPT;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsDAL;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsIPT;C:Program FilesLenovo Fingerprint Reader;C:Program FilesLenovo Fingerprint Readerx86;C:ProgramDataLenovoReadyApps;C:Program FilesIntelWiFiin;C:Program FilesCommon FilesIntelWirelessCommon;C:Program FilesTortoiseSVNin;C:AppCanAppCanStudioPersonalHDKemulatormas;C:Program Files (x86)QuickTimeQTSystem;C:php;C:ProgramDataComposerSetupin;C:Program Files (x86)Windows Kits8.1Windows Performance Toolkit;C:Program Files (x86)Microsoft SDKsTypeScript1.0;C:Program FilesMicrosoft SQL Server110ToolsBinn;J:Program FilesTortoiseGitin;C:Program Files\nodejs;";s:10:"SystemRoot";s:10:"C:WINDOWS";s:7:"COMSPEC";s:27:"C:WINDOWSsystem32cmd.exe";s:7:"PATHEXT";s:62:".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.RB;.RBW";s:6:"WINDIR";s:10:"C:WINDOWS";s:16:"SERVER_SIGNATURE";s:0:"";s:15:"SERVER_SOFTWARE";s:32:"Apache/2.2.25 (Win32) PHP/5.4.28";s:11:"SERVER_NAME";s:9:"localhost";s:11:"SERVER_ADDR";s:9:"127.0.0.1";s:11:"SERVER_PORT";s:2:"80";s:11:"REMOTE_ADDR";s:9:"127.0.0.1";s:13:"DOCUMENT_ROOT";s:6:"F:/WWW";s:12:"SERVER_ADMIN";s:16:"admin@mshome.net";s:15:"SCRIPT_FILENAME";s:35:"F:/WWW/resp/hebidu/hebidu/index.php";s:11:"REMOTE_PORT";s:5:"60031";s:17:"GATEWAY_INTERFACE";s:7:"CGI/1.1";s:15:"SERVER_PROTOCOL";s:8:"HTTP/1.1";s:14:"REQUEST_METHOD";s:3:"GET";s:12:"QUERY_STRING";s:0:"";s:11:"REQUEST_URI";s:61:"/resp/hebidu/hebidu/index.php/Ucenter/Config/edit/id/37.shtml";s:11:"SCRIPT_NAME";s:29:"/resp/hebidu/hebidu/index.php";s:9:"PATH_INFO";s:17:"Config/edit/id/37";s:15:"PATH_TRANSLATED";s:38:"F:WWWUcenterConfigeditid37.shtml";s:8:"PHP_SELF";s:61:"/resp/hebidu/hebidu/index.php/Ucenter/Config/edit/id/37.shtml";s:18:"REQUEST_TIME_FLOAT";d:1419403988.086;s:12:"REQUEST_TIME";i:1419403988;}', 'ERR: 模板不存在:./Application/Ucenter/View/default/Config/edit.html\r\n'),
(30, 1419405334, '127.0.0.1', '/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml', 'COOKIE:a:12:{s:24:"thinkphp_show_page_trace";s:3:"0|0";s:15:"CNZZDATA4126717";s:48:"cnzz_eid=1921425653-1409744830-&ntime=1409744830";s:16:"ebak_loginlangid";s:1:"1";s:16:"bdshare_firstime";s:13:"1413184559164";s:15:"CNZZDATA5524076";s:73:"cnzz_eid=1153009811-1410917713-http%3A%2F%2Flocalhost%2F&ntime=1415065905";s:15:"AJSTAT_ok_times";s:1:"1";s:15:"CNZZDATA1702264";s:73:"cnzz_eid=2138502453-1418106368-http%3A%2F%2Flocalhost%2F&ntime=1418106368";s:19:"T3_TSV3_LOGGED_USER";s:32:"ZrMHnKszUTFgLND68h606mQ2dwIDqQxo";s:8:"ts_email";s:15:"admin@admin.com";s:12:"ts_autologin";s:31:"impa20mg0xkw4wk0g88ko4cow8c4840";s:9:"PHPSESSID";s:26:"hg6e0gcputh81orai5khd7ev00";s:14:"think_language";s:5:"zh-CN";}SESSION:a:1:{s:6:"oauth_";a:3:{s:3:"uid";s:1:"1";s:12:"activemenuid";s:3:"129";s:15:"activesubmenuid";s:3:"135";}}POST:a:0:{}GET:a:0:{}SERVER:a:36:{s:9:"HTTP_HOST";s:9:"localhost";s:15:"HTTP_CONNECTION";s:10:"keep-alive";s:11:"HTTP_PRAGMA";s:8:"no-cache";s:18:"HTTP_CACHE_CONTROL";s:8:"no-cache";s:11:"HTTP_ACCEPT";s:74:"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";s:15:"HTTP_USER_AGENT";s:109:"Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36";s:8:"HTTP_DNT";s:1:"1";s:20:"HTTP_ACCEPT_ENCODING";s:17:"gzip,deflate,sdch";s:20:"HTTP_ACCEPT_LANGUAGE";s:35:"zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4";s:11:"HTTP_COOKIE";s:569:"thinkphp_show_page_trace=0|0; CNZZDATA4126717=cnzz_eid%3D1921425653-1409744830-%26ntime%3D1409744830; ebak_loginlangid=1; bdshare_firstime=1413184559164; CNZZDATA5524076=cnzz_eid%3D1153009811-1410917713-http%253A%252F%252Flocalhost%252F%26ntime%3D1415065905; AJSTAT_ok_times=1; CNZZDATA1702264=cnzz_eid%3D2138502453-1418106368-http%253A%252F%252Flocalhost%252F%26ntime%3D1418106368; T3_TSV3_LOGGED_USER=ZrMHnKszUTFgLND68h606mQ2dwIDqQxo; ts_email=admin%40admin.com; ts_autologin=impa20mg0xkw4wk0g88ko4cow8c4840; PHPSESSID=hg6e0gcputh81orai5khd7ev00; think_language=zh-CN";s:4:"PATH";s:1312:"C:ProgramDataOracleJavajavapath;C:Program Files (x86)NVIDIA CorporationPhysXCommon;C:Program Files (x86)Common FilesNetSarang;c:\rubyin;C:Program Files (x86)InteliCLS Client;C:Program FilesInteliCLS Client;C:WINDOWSsystem32;C:WINDOWS;C:WINDOWSSystem32Wbem;C:WINDOWSSystem32WindowsPowerShellv1.0;C:Program Files (x86)IntelOpenCL SDK2.0inx86;C:Program Files (x86)IntelOpenCL SDK2.0inx64;C:Program FilesIntelIntel(R) Management Engine ComponentsDAL;C:Program FilesIntelIntel(R) Management Engine ComponentsIPT;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsDAL;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsIPT;C:Program FilesLenovo Fingerprint Reader;C:Program FilesLenovo Fingerprint Readerx86;C:ProgramDataLenovoReadyApps;C:Program FilesIntelWiFiin;C:Program FilesCommon FilesIntelWirelessCommon;C:Program FilesTortoiseSVNin;C:AppCanAppCanStudioPersonalHDKemulatormas;C:Program Files (x86)QuickTimeQTSystem;C:php;C:ProgramDataComposerSetupin;C:Program Files (x86)Windows Kits8.1Windows Performance Toolkit;C:Program Files (x86)Microsoft SDKsTypeScript1.0;C:Program FilesMicrosoft SQL Server110ToolsBinn;J:Program FilesTortoiseGitin;C:Program Files\nodejs;";s:10:"SystemRoot";s:10:"C:WINDOWS";s:7:"COMSPEC";s:27:"C:WINDOWSsystem32cmd.exe";s:7:"PATHEXT";s:62:".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.RB;.RBW";s:6:"WINDIR";s:10:"C:WINDOWS";s:16:"SERVER_SIGNATURE";s:0:"";s:15:"SERVER_SOFTWARE";s:32:"Apache/2.2.25 (Win32) PHP/5.4.28";s:11:"SERVER_NAME";s:9:"localhost";s:11:"SERVER_ADDR";s:9:"127.0.0.1";s:11:"SERVER_PORT";s:2:"80";s:11:"REMOTE_ADDR";s:9:"127.0.0.1";s:13:"DOCUMENT_ROOT";s:6:"F:/WWW";s:12:"SERVER_ADMIN";s:16:"admin@mshome.net";s:15:"SCRIPT_FILENAME";s:35:"F:/WWW/resp/hebidu/hebidu/index.php";s:11:"REMOTE_PORT";s:5:"62035";s:17:"GATEWAY_INTERFACE";s:7:"CGI/1.1";s:15:"SERVER_PROTOCOL";s:8:"HTTP/1.1";s:14:"REQUEST_METHOD";s:3:"GET";s:12:"QUERY_STRING";s:0:"";s:11:"REQUEST_URI";s:54:"/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml";s:11:"SCRIPT_NAME";s:29:"/resp/hebidu/hebidu/index.php";s:9:"PATH_INFO";s:10:"Config/add";s:15:"PATH_TRANSLATED";s:31:"F:WWWUcenterConfigadd.shtml";s:8:"PHP_SELF";s:54:"/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml";s:18:"REQUEST_TIME_FLOAT";d:1419405333.6370001;s:12:"REQUEST_TIME";i:1419405333;}', 'ERR: 参数错误或者未定义:entity\r\n'),
(31, 1419405374, '127.0.0.1', '/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml', 'COOKIE:a:12:{s:24:"thinkphp_show_page_trace";s:3:"0|0";s:15:"CNZZDATA4126717";s:48:"cnzz_eid=1921425653-1409744830-&ntime=1409744830";s:16:"ebak_loginlangid";s:1:"1";s:16:"bdshare_firstime";s:13:"1413184559164";s:15:"CNZZDATA5524076";s:73:"cnzz_eid=1153009811-1410917713-http%3A%2F%2Flocalhost%2F&ntime=1415065905";s:15:"AJSTAT_ok_times";s:1:"1";s:15:"CNZZDATA1702264";s:73:"cnzz_eid=2138502453-1418106368-http%3A%2F%2Flocalhost%2F&ntime=1418106368";s:19:"T3_TSV3_LOGGED_USER";s:32:"ZrMHnKszUTFgLND68h606mQ2dwIDqQxo";s:8:"ts_email";s:15:"admin@admin.com";s:12:"ts_autologin";s:31:"impa20mg0xkw4wk0g88ko4cow8c4840";s:9:"PHPSESSID";s:26:"hg6e0gcputh81orai5khd7ev00";s:14:"think_language";s:5:"zh-CN";}SESSION:a:1:{s:6:"oauth_";a:3:{s:3:"uid";s:1:"1";s:12:"activemenuid";s:3:"129";s:15:"activesubmenuid";s:3:"135";}}POST:a:0:{}GET:a:0:{}SERVER:a:36:{s:9:"HTTP_HOST";s:9:"localhost";s:15:"HTTP_CONNECTION";s:10:"keep-alive";s:11:"HTTP_PRAGMA";s:8:"no-cache";s:18:"HTTP_CACHE_CONTROL";s:8:"no-cache";s:11:"HTTP_ACCEPT";s:74:"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";s:15:"HTTP_USER_AGENT";s:109:"Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36";s:8:"HTTP_DNT";s:1:"1";s:20:"HTTP_ACCEPT_ENCODING";s:17:"gzip,deflate,sdch";s:20:"HTTP_ACCEPT_LANGUAGE";s:35:"zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4";s:11:"HTTP_COOKIE";s:569:"thinkphp_show_page_trace=0|0; CNZZDATA4126717=cnzz_eid%3D1921425653-1409744830-%26ntime%3D1409744830; ebak_loginlangid=1; bdshare_firstime=1413184559164; CNZZDATA5524076=cnzz_eid%3D1153009811-1410917713-http%253A%252F%252Flocalhost%252F%26ntime%3D1415065905; AJSTAT_ok_times=1; CNZZDATA1702264=cnzz_eid%3D2138502453-1418106368-http%253A%252F%252Flocalhost%252F%26ntime%3D1418106368; T3_TSV3_LOGGED_USER=ZrMHnKszUTFgLND68h606mQ2dwIDqQxo; ts_email=admin%40admin.com; ts_autologin=impa20mg0xkw4wk0g88ko4cow8c4840; PHPSESSID=hg6e0gcputh81orai5khd7ev00; think_language=zh-CN";s:4:"PATH";s:1312:"C:ProgramDataOracleJavajavapath;C:Program Files (x86)NVIDIA CorporationPhysXCommon;C:Program Files (x86)Common FilesNetSarang;c:\rubyin;C:Program Files (x86)InteliCLS Client;C:Program FilesInteliCLS Client;C:WINDOWSsystem32;C:WINDOWS;C:WINDOWSSystem32Wbem;C:WINDOWSSystem32WindowsPowerShellv1.0;C:Program Files (x86)IntelOpenCL SDK2.0inx86;C:Program Files (x86)IntelOpenCL SDK2.0inx64;C:Program FilesIntelIntel(R) Management Engine ComponentsDAL;C:Program FilesIntelIntel(R) Management Engine ComponentsIPT;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsDAL;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsIPT;C:Program FilesLenovo Fingerprint Reader;C:Program FilesLenovo Fingerprint Readerx86;C:ProgramDataLenovoReadyApps;C:Program FilesIntelWiFiin;C:Program FilesCommon FilesIntelWirelessCommon;C:Program FilesTortoiseSVNin;C:AppCanAppCanStudioPersonalHDKemulatormas;C:Program Files (x86)QuickTimeQTSystem;C:php;C:ProgramDataComposerSetupin;C:Program Files (x86)Windows Kits8.1Windows Performance Toolkit;C:Program Files (x86)Microsoft SDKsTypeScript1.0;C:Program FilesMicrosoft SQL Server110ToolsBinn;J:Program FilesTortoiseGitin;C:Program Files\nodejs;";s:10:"SystemRoot";s:10:"C:WINDOWS";s:7:"COMSPEC";s:27:"C:WINDOWSsystem32cmd.exe";s:7:"PATHEXT";s:62:".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.RB;.RBW";s:6:"WINDIR";s:10:"C:WINDOWS";s:16:"SERVER_SIGNATURE";s:0:"";s:15:"SERVER_SOFTWARE";s:32:"Apache/2.2.25 (Win32) PHP/5.4.28";s:11:"SERVER_NAME";s:9:"localhost";s:11:"SERVER_ADDR";s:9:"127.0.0.1";s:11:"SERVER_PORT";s:2:"80";s:11:"REMOTE_ADDR";s:9:"127.0.0.1";s:13:"DOCUMENT_ROOT";s:6:"F:/WWW";s:12:"SERVER_ADMIN";s:16:"admin@mshome.net";s:15:"SCRIPT_FILENAME";s:35:"F:/WWW/resp/hebidu/hebidu/index.php";s:11:"REMOTE_PORT";s:5:"62096";s:17:"GATEWAY_INTERFACE";s:7:"CGI/1.1";s:15:"SERVER_PROTOCOL";s:8:"HTTP/1.1";s:14:"REQUEST_METHOD";s:3:"GET";s:12:"QUERY_STRING";s:0:"";s:11:"REQUEST_URI";s:54:"/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml";s:11:"SCRIPT_NAME";s:29:"/resp/hebidu/hebidu/index.php";s:9:"PATH_INFO";s:10:"Config/add";s:15:"PATH_TRANSLATED";s:31:"F:WWWUcenterConfigadd.shtml";s:8:"PHP_SELF";s:54:"/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml";s:18:"REQUEST_TIME_FLOAT";d:1419405373.6040001;s:12:"REQUEST_TIME";i:1419405373;}', 'ERR: 参数错误或者未定义:entity\r\n'),
(32, 1419405390, '127.0.0.1', '/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml', 'COOKIE:a:12:{s:24:"thinkphp_show_page_trace";s:3:"0|0";s:15:"CNZZDATA4126717";s:48:"cnzz_eid=1921425653-1409744830-&ntime=1409744830";s:16:"ebak_loginlangid";s:1:"1";s:16:"bdshare_firstime";s:13:"1413184559164";s:15:"CNZZDATA5524076";s:73:"cnzz_eid=1153009811-1410917713-http%3A%2F%2Flocalhost%2F&ntime=1415065905";s:15:"AJSTAT_ok_times";s:1:"1";s:15:"CNZZDATA1702264";s:73:"cnzz_eid=2138502453-1418106368-http%3A%2F%2Flocalhost%2F&ntime=1418106368";s:19:"T3_TSV3_LOGGED_USER";s:32:"ZrMHnKszUTFgLND68h606mQ2dwIDqQxo";s:8:"ts_email";s:15:"admin@admin.com";s:12:"ts_autologin";s:31:"impa20mg0xkw4wk0g88ko4cow8c4840";s:9:"PHPSESSID";s:26:"hg6e0gcputh81orai5khd7ev00";s:14:"think_language";s:5:"zh-CN";}SESSION:a:1:{s:6:"oauth_";a:3:{s:3:"uid";s:1:"1";s:12:"activemenuid";s:3:"129";s:15:"activesubmenuid";s:3:"135";}}POST:a:0:{}GET:a:0:{}SERVER:a:36:{s:9:"HTTP_HOST";s:9:"localhost";s:15:"HTTP_CONNECTION";s:10:"keep-alive";s:11:"HTTP_PRAGMA";s:8:"no-cache";s:18:"HTTP_CACHE_CONTROL";s:8:"no-cache";s:11:"HTTP_ACCEPT";s:74:"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";s:15:"HTTP_USER_AGENT";s:109:"Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36";s:8:"HTTP_DNT";s:1:"1";s:20:"HTTP_ACCEPT_ENCODING";s:17:"gzip,deflate,sdch";s:20:"HTTP_ACCEPT_LANGUAGE";s:35:"zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4";s:11:"HTTP_COOKIE";s:569:"thinkphp_show_page_trace=0|0; CNZZDATA4126717=cnzz_eid%3D1921425653-1409744830-%26ntime%3D1409744830; ebak_loginlangid=1; bdshare_firstime=1413184559164; CNZZDATA5524076=cnzz_eid%3D1153009811-1410917713-http%253A%252F%252Flocalhost%252F%26ntime%3D1415065905; AJSTAT_ok_times=1; CNZZDATA1702264=cnzz_eid%3D2138502453-1418106368-http%253A%252F%252Flocalhost%252F%26ntime%3D1418106368; T3_TSV3_LOGGED_USER=ZrMHnKszUTFgLND68h606mQ2dwIDqQxo; ts_email=admin%40admin.com; ts_autologin=impa20mg0xkw4wk0g88ko4cow8c4840; PHPSESSID=hg6e0gcputh81orai5khd7ev00; think_language=zh-CN";s:4:"PATH";s:1312:"C:ProgramDataOracleJavajavapath;C:Program Files (x86)NVIDIA CorporationPhysXCommon;C:Program Files (x86)Common FilesNetSarang;c:\rubyin;C:Program Files (x86)InteliCLS Client;C:Program FilesInteliCLS Client;C:WINDOWSsystem32;C:WINDOWS;C:WINDOWSSystem32Wbem;C:WINDOWSSystem32WindowsPowerShellv1.0;C:Program Files (x86)IntelOpenCL SDK2.0inx86;C:Program Files (x86)IntelOpenCL SDK2.0inx64;C:Program FilesIntelIntel(R) Management Engine ComponentsDAL;C:Program FilesIntelIntel(R) Management Engine ComponentsIPT;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsDAL;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsIPT;C:Program FilesLenovo Fingerprint Reader;C:Program FilesLenovo Fingerprint Readerx86;C:ProgramDataLenovoReadyApps;C:Program FilesIntelWiFiin;C:Program FilesCommon FilesIntelWirelessCommon;C:Program FilesTortoiseSVNin;C:AppCanAppCanStudioPersonalHDKemulatormas;C:Program Files (x86)QuickTimeQTSystem;C:php;C:ProgramDataComposerSetupin;C:Program Files (x86)Windows Kits8.1Windows Performance Toolkit;C:Program Files (x86)Microsoft SDKsTypeScript1.0;C:Program FilesMicrosoft SQL Server110ToolsBinn;J:Program FilesTortoiseGitin;C:Program Files\nodejs;";s:10:"SystemRoot";s:10:"C:WINDOWS";s:7:"COMSPEC";s:27:"C:WINDOWSsystem32cmd.exe";s:7:"PATHEXT";s:62:".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.RB;.RBW";s:6:"WINDIR";s:10:"C:WINDOWS";s:16:"SERVER_SIGNATURE";s:0:"";s:15:"SERVER_SOFTWARE";s:32:"Apache/2.2.25 (Win32) PHP/5.4.28";s:11:"SERVER_NAME";s:9:"localhost";s:11:"SERVER_ADDR";s:9:"127.0.0.1";s:11:"SERVER_PORT";s:2:"80";s:11:"REMOTE_ADDR";s:9:"127.0.0.1";s:13:"DOCUMENT_ROOT";s:6:"F:/WWW";s:12:"SERVER_ADMIN";s:16:"admin@mshome.net";s:15:"SCRIPT_FILENAME";s:35:"F:/WWW/resp/hebidu/hebidu/index.php";s:11:"REMOTE_PORT";s:5:"62123";s:17:"GATEWAY_INTERFACE";s:7:"CGI/1.1";s:15:"SERVER_PROTOCOL";s:8:"HTTP/1.1";s:14:"REQUEST_METHOD";s:3:"GET";s:12:"QUERY_STRING";s:0:"";s:11:"REQUEST_URI";s:54:"/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml";s:11:"SCRIPT_NAME";s:29:"/resp/hebidu/hebidu/index.php";s:9:"PATH_INFO";s:10:"Config/add";s:15:"PATH_TRANSLATED";s:31:"F:WWWUcenterConfigadd.shtml";s:8:"PHP_SELF";s:54:"/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml";s:18:"REQUEST_TIME_FLOAT";d:1419405389.5739999;s:12:"REQUEST_TIME";i:1419405389;}', 'ERR: 参数错误或者未定义:entity\r\n'),
(33, 1419405480, '127.0.0.1', '/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml', 'COOKIE:a:12:{s:24:"thinkphp_show_page_trace";s:3:"0|0";s:15:"CNZZDATA4126717";s:48:"cnzz_eid=1921425653-1409744830-&ntime=1409744830";s:16:"ebak_loginlangid";s:1:"1";s:16:"bdshare_firstime";s:13:"1413184559164";s:15:"CNZZDATA5524076";s:73:"cnzz_eid=1153009811-1410917713-http%3A%2F%2Flocalhost%2F&ntime=1415065905";s:15:"AJSTAT_ok_times";s:1:"1";s:15:"CNZZDATA1702264";s:73:"cnzz_eid=2138502453-1418106368-http%3A%2F%2Flocalhost%2F&ntime=1418106368";s:19:"T3_TSV3_LOGGED_USER";s:32:"ZrMHnKszUTFgLND68h606mQ2dwIDqQxo";s:8:"ts_email";s:15:"admin@admin.com";s:12:"ts_autologin";s:31:"impa20mg0xkw4wk0g88ko4cow8c4840";s:9:"PHPSESSID";s:26:"hg6e0gcputh81orai5khd7ev00";s:14:"think_language";s:5:"zh-CN";}SESSION:a:1:{s:6:"oauth_";a:3:{s:3:"uid";s:1:"1";s:12:"activemenuid";s:3:"129";s:15:"activesubmenuid";s:3:"135";}}POST:a:0:{}GET:a:0:{}SERVER:a:36:{s:9:"HTTP_HOST";s:9:"localhost";s:15:"HTTP_CONNECTION";s:10:"keep-alive";s:11:"HTTP_PRAGMA";s:8:"no-cache";s:18:"HTTP_CACHE_CONTROL";s:8:"no-cache";s:11:"HTTP_ACCEPT";s:74:"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";s:15:"HTTP_USER_AGENT";s:109:"Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36";s:8:"HTTP_DNT";s:1:"1";s:20:"HTTP_ACCEPT_ENCODING";s:17:"gzip,deflate,sdch";s:20:"HTTP_ACCEPT_LANGUAGE";s:35:"zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4";s:11:"HTTP_COOKIE";s:569:"thinkphp_show_page_trace=0|0; CNZZDATA4126717=cnzz_eid%3D1921425653-1409744830-%26ntime%3D1409744830; ebak_loginlangid=1; bdshare_firstime=1413184559164; CNZZDATA5524076=cnzz_eid%3D1153009811-1410917713-http%253A%252F%252Flocalhost%252F%26ntime%3D1415065905; AJSTAT_ok_times=1; CNZZDATA1702264=cnzz_eid%3D2138502453-1418106368-http%253A%252F%252Flocalhost%252F%26ntime%3D1418106368; T3_TSV3_LOGGED_USER=ZrMHnKszUTFgLND68h606mQ2dwIDqQxo; ts_email=admin%40admin.com; ts_autologin=impa20mg0xkw4wk0g88ko4cow8c4840; PHPSESSID=hg6e0gcputh81orai5khd7ev00; think_language=zh-CN";s:4:"PATH";s:1312:"C:ProgramDataOracleJavajavapath;C:Program Files (x86)NVIDIA CorporationPhysXCommon;C:Program Files (x86)Common FilesNetSarang;c:\rubyin;C:Program Files (x86)InteliCLS Client;C:Program FilesInteliCLS Client;C:WINDOWSsystem32;C:WINDOWS;C:WINDOWSSystem32Wbem;C:WINDOWSSystem32WindowsPowerShellv1.0;C:Program Files (x86)IntelOpenCL SDK2.0inx86;C:Program Files (x86)IntelOpenCL SDK2.0inx64;C:Program FilesIntelIntel(R) Management Engine ComponentsDAL;C:Program FilesIntelIntel(R) Management Engine ComponentsIPT;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsDAL;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsIPT;C:Program FilesLenovo Fingerprint Reader;C:Program FilesLenovo Fingerprint Readerx86;C:ProgramDataLenovoReadyApps;C:Program FilesIntelWiFiin;C:Program FilesCommon FilesIntelWirelessCommon;C:Program FilesTortoiseSVNin;C:AppCanAppCanStudioPersonalHDKemulatormas;C:Program Files (x86)QuickTimeQTSystem;C:php;C:ProgramDataComposerSetupin;C:Program Files (x86)Windows Kits8.1Windows Performance Toolkit;C:Program Files (x86)Microsoft SDKsTypeScript1.0;C:Program FilesMicrosoft SQL Server110ToolsBinn;J:Program FilesTortoiseGitin;C:Program Files\nodejs;";s:10:"SystemRoot";s:10:"C:WINDOWS";s:7:"COMSPEC";s:27:"C:WINDOWSsystem32cmd.exe";s:7:"PATHEXT";s:62:".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.RB;.RBW";s:6:"WINDIR";s:10:"C:WINDOWS";s:16:"SERVER_SIGNATURE";s:0:"";s:15:"SERVER_SOFTWARE";s:32:"Apache/2.2.25 (Win32) PHP/5.4.28";s:11:"SERVER_NAME";s:9:"localhost";s:11:"SERVER_ADDR";s:9:"127.0.0.1";s:11:"SERVER_PORT";s:2:"80";s:11:"REMOTE_ADDR";s:9:"127.0.0.1";s:13:"DOCUMENT_ROOT";s:6:"F:/WWW";s:12:"SERVER_ADMIN";s:16:"admin@mshome.net";s:15:"SCRIPT_FILENAME";s:35:"F:/WWW/resp/hebidu/hebidu/index.php";s:11:"REMOTE_PORT";s:5:"62253";s:17:"GATEWAY_INTERFACE";s:7:"CGI/1.1";s:15:"SERVER_PROTOCOL";s:8:"HTTP/1.1";s:14:"REQUEST_METHOD";s:3:"GET";s:12:"QUERY_STRING";s:0:"";s:11:"REQUEST_URI";s:54:"/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml";s:11:"SCRIPT_NAME";s:29:"/resp/hebidu/hebidu/index.php";s:9:"PATH_INFO";s:10:"Config/add";s:15:"PATH_TRANSLATED";s:31:"F:WWWUcenterConfigadd.shtml";s:8:"PHP_SELF";s:54:"/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml";s:18:"REQUEST_TIME_FLOAT";d:1419405479.325;s:12:"REQUEST_TIME";i:1419405479;}', 'ERR: 参数错误或者未定义:entity\r\n'),
(34, 1419405490, '127.0.0.1', '/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml', 'COOKIE:a:12:{s:24:"thinkphp_show_page_trace";s:3:"0|0";s:15:"CNZZDATA4126717";s:48:"cnzz_eid=1921425653-1409744830-&ntime=1409744830";s:16:"ebak_loginlangid";s:1:"1";s:16:"bdshare_firstime";s:13:"1413184559164";s:15:"CNZZDATA5524076";s:73:"cnzz_eid=1153009811-1410917713-http%3A%2F%2Flocalhost%2F&ntime=1415065905";s:15:"AJSTAT_ok_times";s:1:"1";s:15:"CNZZDATA1702264";s:73:"cnzz_eid=2138502453-1418106368-http%3A%2F%2Flocalhost%2F&ntime=1418106368";s:19:"T3_TSV3_LOGGED_USER";s:32:"ZrMHnKszUTFgLND68h606mQ2dwIDqQxo";s:8:"ts_email";s:15:"admin@admin.com";s:12:"ts_autologin";s:31:"impa20mg0xkw4wk0g88ko4cow8c4840";s:9:"PHPSESSID";s:26:"hg6e0gcputh81orai5khd7ev00";s:14:"think_language";s:5:"zh-CN";}SESSION:a:1:{s:6:"oauth_";a:3:{s:3:"uid";s:1:"1";s:12:"activemenuid";s:3:"129";s:15:"activesubmenuid";s:3:"135";}}POST:a:0:{}GET:a:0:{}SERVER:a:36:{s:9:"HTTP_HOST";s:9:"localhost";s:15:"HTTP_CONNECTION";s:10:"keep-alive";s:11:"HTTP_PRAGMA";s:8:"no-cache";s:18:"HTTP_CACHE_CONTROL";s:8:"no-cache";s:11:"HTTP_ACCEPT";s:74:"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";s:15:"HTTP_USER_AGENT";s:109:"Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36";s:8:"HTTP_DNT";s:1:"1";s:20:"HTTP_ACCEPT_ENCODING";s:17:"gzip,deflate,sdch";s:20:"HTTP_ACCEPT_LANGUAGE";s:35:"zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4";s:11:"HTTP_COOKIE";s:569:"thinkphp_show_page_trace=0|0; CNZZDATA4126717=cnzz_eid%3D1921425653-1409744830-%26ntime%3D1409744830; ebak_loginlangid=1; bdshare_firstime=1413184559164; CNZZDATA5524076=cnzz_eid%3D1153009811-1410917713-http%253A%252F%252Flocalhost%252F%26ntime%3D1415065905; AJSTAT_ok_times=1; CNZZDATA1702264=cnzz_eid%3D2138502453-1418106368-http%253A%252F%252Flocalhost%252F%26ntime%3D1418106368; T3_TSV3_LOGGED_USER=ZrMHnKszUTFgLND68h606mQ2dwIDqQxo; ts_email=admin%40admin.com; ts_autologin=impa20mg0xkw4wk0g88ko4cow8c4840; PHPSESSID=hg6e0gcputh81orai5khd7ev00; think_language=zh-CN";s:4:"PATH";s:1312:"C:ProgramDataOracleJavajavapath;C:Program Files (x86)NVIDIA CorporationPhysXCommon;C:Program Files (x86)Common FilesNetSarang;c:\rubyin;C:Program Files (x86)InteliCLS Client;C:Program FilesInteliCLS Client;C:WINDOWSsystem32;C:WINDOWS;C:WINDOWSSystem32Wbem;C:WINDOWSSystem32WindowsPowerShellv1.0;C:Program Files (x86)IntelOpenCL SDK2.0inx86;C:Program Files (x86)IntelOpenCL SDK2.0inx64;C:Program FilesIntelIntel(R) Management Engine ComponentsDAL;C:Program FilesIntelIntel(R) Management Engine ComponentsIPT;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsDAL;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsIPT;C:Program FilesLenovo Fingerprint Reader;C:Program FilesLenovo Fingerprint Readerx86;C:ProgramDataLenovoReadyApps;C:Program FilesIntelWiFiin;C:Program FilesCommon FilesIntelWirelessCommon;C:Program FilesTortoiseSVNin;C:AppCanAppCanStudioPersonalHDKemulatormas;C:Program Files (x86)QuickTimeQTSystem;C:php;C:ProgramDataComposerSetupin;C:Program Files (x86)Windows Kits8.1Windows Performance Toolkit;C:Program Files (x86)Microsoft SDKsTypeScript1.0;C:Program FilesMicrosoft SQL Server110ToolsBinn;J:Program FilesTortoiseGitin;C:Program Files\nodejs;";s:10:"SystemRoot";s:10:"C:WINDOWS";s:7:"COMSPEC";s:27:"C:WINDOWSsystem32cmd.exe";s:7:"PATHEXT";s:62:".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.RB;.RBW";s:6:"WINDIR";s:10:"C:WINDOWS";s:16:"SERVER_SIGNATURE";s:0:"";s:15:"SERVER_SOFTWARE";s:32:"Apache/2.2.25 (Win32) PHP/5.4.28";s:11:"SERVER_NAME";s:9:"localhost";s:11:"SERVER_ADDR";s:9:"127.0.0.1";s:11:"SERVER_PORT";s:2:"80";s:11:"REMOTE_ADDR";s:9:"127.0.0.1";s:13:"DOCUMENT_ROOT";s:6:"F:/WWW";s:12:"SERVER_ADMIN";s:16:"admin@mshome.net";s:15:"SCRIPT_FILENAME";s:35:"F:/WWW/resp/hebidu/hebidu/index.php";s:11:"REMOTE_PORT";s:5:"62255";s:17:"GATEWAY_INTERFACE";s:7:"CGI/1.1";s:15:"SERVER_PROTOCOL";s:8:"HTTP/1.1";s:14:"REQUEST_METHOD";s:3:"GET";s:12:"QUERY_STRING";s:0:"";s:11:"REQUEST_URI";s:54:"/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml";s:11:"SCRIPT_NAME";s:29:"/resp/hebidu/hebidu/index.php";s:9:"PATH_INFO";s:10:"Config/add";s:15:"PATH_TRANSLATED";s:31:"F:WWWUcenterConfigadd.shtml";s:8:"PHP_SELF";s:54:"/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml";s:18:"REQUEST_TIME_FLOAT";d:1419405489.4560001;s:12:"REQUEST_TIME";i:1419405489;}', 'ERR: 参数错误或者未定义:entity\r\n'),
(35, 1419408583, '127.0.0.1', '/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml', 'COOKIE:a:13:{s:24:"thinkphp_show_page_trace";s:3:"0|0";s:15:"CNZZDATA4126717";s:48:"cnzz_eid=1921425653-1409744830-&ntime=1409744830";s:16:"ebak_loginlangid";s:1:"1";s:16:"bdshare_firstime";s:13:"1413184559164";s:15:"CNZZDATA5524076";s:73:"cnzz_eid=1153009811-1410917713-http%3A%2F%2Flocalhost%2F&ntime=1415065905";s:15:"AJSTAT_ok_times";s:1:"1";s:15:"CNZZDATA1702264";s:73:"cnzz_eid=2138502453-1418106368-http%3A%2F%2Flocalhost%2F&ntime=1418106368";s:19:"T3_TSV3_LOGGED_USER";s:32:"ZrMHnKszUTFgLND68h606mQ2dwIDqQxo";s:8:"ts_email";s:15:"admin@admin.com";s:12:"ts_autologin";s:31:"impa20mg0xkw4wk0g88ko4cow8c4840";s:9:"PHPSESSID";s:26:"hg6e0gcputh81orai5khd7ev00";s:14:"think_language";s:5:"zh-CN";s:26:"onethink_admin___forward__";s:49:"/resp/backend1/admin.php?s=/Config/index/p/2.html";}SESSION:a:2:{s:6:"oauth_";a:3:{s:3:"uid";s:1:"1";s:12:"activemenuid";s:3:"129";s:15:"activesubmenuid";s:3:"135";}s:14:"onethink_admin";a:6:{s:9:"user_auth";a:3:{s:3:"uid";s:1:"1";s:8:"username";s:5:"admin";s:15:"last_login_time";s:10:"1418369758";}s:14:"user_auth_sign";s:40:"95b8d0aac7daef2c9383ae00cef897303b3ded92";s:21:"ADMIN_MENU_LIST.Index";a:2:{s:4:"main";a:5:{i:0;a:4:{s:2:"id";s:1:"1";s:5:"title";s:6:"首页";s:3:"url";s:11:"Index/index";s:5:"class";s:7:"current";}i:1;a:3:{s:2:"id";s:1:"2";s:5:"title";s:6:"内容";s:3:"url";s:13:"Article/index";}i:2;a:3:{s:2:"id";s:2:"16";s:5:"title";s:6:"用户";s:3:"url";s:10:"User/index";}i:3;a:3:{s:2:"id";s:2:"68";s:5:"title";s:6:"系统";s:3:"url";s:12:"Config/group";}i:4;a:3:{s:2:"id";s:2:"43";s:5:"title";s:6:"扩展";s:3:"url";s:12:"Addons/index";}}s:5:"child";a:0:{}}s:20:"ADMIN_MENU_LIST.User";a:2:{s:4:"main";a:5:{i:0;a:3:{s:2:"id";s:1:"1";s:5:"title";s:6:"首页";s:3:"url";s:11:"Index/index";}i:1;a:3:{s:2:"id";s:1:"2";s:5:"title";s:6:"内容";s:3:"url";s:13:"Article/index";}i:2;a:4:{s:2:"id";s:2:"16";s:5:"title";s:6:"用户";s:3:"url";s:10:"User/index";s:5:"class";s:7:"current";}i:3;a:3:{s:2:"id";s:2:"68";s:5:"title";s:6:"系统";s:3:"url";s:12:"Config/group";}i:4;a:3:{s:2:"id";s:2:"43";s:5:"title";s:6:"扩展";s:3:"url";s:12:"Addons/index";}}s:5:"child";a:2:{s:12:"用户管理";a:2:{i:0;a:5:{s:2:"id";s:2:"17";s:3:"pid";s:2:"16";s:5:"title";s:12:"用户信息";s:3:"url";s:10:"User/index";s:3:"tip";s:0:"";}i:1;a:5:{s:2:"id";s:2:"27";s:3:"pid";s:2:"16";s:5:"title";s:12:"权限管理";s:3:"url";s:17:"AuthManager/index";s:3:"tip";s:0:"";}}s:12:"行为管理";a:2:{i:0;a:5:{s:2:"id";s:2:"19";s:3:"pid";s:2:"16";s:5:"title";s:12:"用户行为";s:3:"url";s:11:"User/action";s:3:"tip";s:0:"";}i:1;a:5:{s:2:"id";s:3:"106";s:3:"pid";s:2:"16";s:5:"title";s:12:"行为日志";s:3:"url";s:16:"Action/actionlog";s:3:"tip";s:0:"";}}}}s:22:"ADMIN_MENU_LIST.Config";a:2:{s:4:"main";a:5:{i:0;a:3:{s:2:"id";s:1:"1";s:5:"title";s:6:"首页";s:3:"url";s:11:"Index/index";}i:1;a:3:{s:2:"id";s:1:"2";s:5:"title";s:6:"内容";s:3:"url";s:13:"Article/index";}i:2;a:3:{s:2:"id";s:2:"16";s:5:"title";s:6:"用户";s:3:"url";s:10:"User/index";}i:3;a:4:{s:2:"id";s:2:"68";s:5:"title";s:6:"系统";s:3:"url";s:12:"Config/group";s:5:"class";s:7:"current";}i:4;a:3:{s:2:"id";s:2:"43";s:5:"title";s:6:"扩展";s:3:"url";s:12:"Addons/index";}}s:5:"child";a:2:{s:12:"系统设置";a:6:{i:0;a:5:{s:2:"id";s:2:"69";s:3:"pid";s:2:"68";s:5:"title";s:12:"网站设置";s:3:"url";s:12:"Config/group";s:3:"tip";s:0:"";}i:1;a:5:{s:2:"id";s:2:"80";s:3:"pid";s:2:"68";s:5:"title";s:12:"分类管理";s:3:"url";s:14:"Category/index";s:3:"tip";s:0:"";}i:2;a:5:{s:2:"id";s:2:"58";s:3:"pid";s:2:"68";s:5:"title";s:12:"模型管理";s:3:"url";s:11:"Model/index";s:3:"tip";s:0:"";}i:3;a:5:{s:2:"id";s:2:"70";s:3:"pid";s:2:"68";s:5:"title";s:12:"配置管理";s:3:"url";s:12:"Config/index";s:3:"tip";s:0:"";}i:4;a:5:{s:2:"id";s:2:"75";s:3:"pid";s:2:"68";s:5:"title";s:12:"菜单管理";s:3:"url";s:10:"Menu/index";s:3:"tip";s:0:"";}i:5;a:5:{s:2:"id";s:2:"76";s:3:"pid";s:2:"68";s:5:"title";s:12:"导航管理";s:3:"url";s:13:"Channel/index";s:3:"tip";s:0:"";}}s:12:"数据备份";a:2:{i:0;a:5:{s:2:"id";s:2:"86";s:3:"pid";s:2:"68";s:5:"title";s:15:"备份数据库";s:3:"url";s:26:"Database/index?type=export";s:3:"tip";s:0:"";}i:1;a:5:{s:2:"id";s:2:"90";s:3:"pid";s:2:"68";s:5:"title";s:15:"还原数据库";s:3:"url";s:26:"Database/index?type=import";s:3:"tip";s:0:"";}}}}s:21:"ADMIN_MENU_LIST.Model";a:2:{s:4:"main";a:5:{i:0;a:3:{s:2:"id";s:1:"1";s:5:"title";s:6:"首页";s:3:"url";s:11:"Index/index";}i:1;a:3:{s:2:"id";s:1:"2";s:5:"title";s:6:"内容";s:3:"url";s:13:"Article/index";}i:2;a:3:{s:2:"id";s:2:"16";s:5:"title";s:6:"用户";s:3:"url";s:10:"User/index";}i:3;a:4:{s:2:"id";s:2:"68";s:5:"title";s:6:"系统";s:3:"url";s:12:"Config/group";s:5:"class";s:7:"current";}i:4;a:3:{s:2:"id";s:2:"43";s:5:"title";s:6:"扩展";s:3:"url";s:12:"Addons/index";}}s:5:"child";a:2:{s:12:"系统设置";a:6:{i:0;a:5:{s:2:"id";s:2:"69";s:3:"pid";s:2:"68";s:5:"title";s:12:"网站设置";s:3:"url";s:12:"Config/group";s:3:"tip";s:0:"";}i:1;a:5:{s:2:"id";s:2:"80";s:3:"pid";s:2:"68";s:5:"title";s:12:"分类管理";s:3:"url";s:14:"Category/index";s:3:"tip";s:0:"";}i:2;a:5:{s:2:"id";s:2:"58";s:3:"pid";s:2:"68";s:5:"title";s:12:"模型管理";s:3:"url";s:11:"Model/index";s:3:"tip";s:0:"";}i:3;a:5:{s:2:"id";s:2:"70";s:3:"pid";s:2:"68";s:5:"title";s:12:"配置管理";s:3:"url";s:12:"Config/index";s:3:"tip";s:0:"";}i:4;a:5:{s:2:"id";s:2:"75";s:3:"pid";s:2:"68";s:5:"title";s:12:"菜单管理";s:3:"url";s:10:"Menu/index";s:3:"tip";s:0:"";}i:5;a:5:{s:2:"id";s:2:"76";s:3:"pid";s:2:"68";s:5:"title";s:12:"导航管理";s:3:"url";s:13:"Channel/index";s:3:"tip";s:0:"";}}s:12:"数据备份";a:2:{i:0;a:5:{s:2:"id";s:2:"86";s:3:"pid";s:2:"68";s:5:"title";s:15:"备份数据库";s:3:"url";s:26:"Database/index?type=export";s:3:"tip";s:0:"";}i:1;a:5:{s:2:"id";s:2:"90";s:3:"pid";s:2:"68";s:5:"title";s:15:"还原数据库";s:3:"url";s:26:"Database/index?type=import";s:3:"tip";s:0:"";}}}}}}POST:a:8:{s:5:"title";s:3:"Dev";s:4:"name";s:12:"开发模式";s:5:"group";s:1:"0";s:4:"type";s:1:"0";s:5:"value";s:0:"";s:5:"extra";s:0:"";s:6:"remark";s:0:"";s:4:"sort";s:1:"0";}GET:a:0:{}SERVER:a:41:{s:9:"HTTP_HOST";s:9:"localhost";s:15:"HTTP_CONNECTION";s:10:"keep-alive";s:14:"CONTENT_LENGTH";s:2:"95";s:11:"HTTP_PRAGMA";s:8:"no-cache";s:18:"HTTP_CACHE_CONTROL";s:8:"no-cache";s:11:"HTTP_ACCEPT";s:3:"*/*";s:11:"HTTP_ORIGIN";s:16:"http://localhost";s:21:"HTTP_X_REQUESTED_WITH";s:14:"XMLHttpRequest";s:15:"HTTP_USER_AGENT";s:109:"Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36";s:12:"CONTENT_TYPE";s:48:"application/x-www-form-urlencoded; charset=UTF-8";s:8:"HTTP_DNT";s:1:"1";s:12:"HTTP_REFERER";s:70:"http://localhost/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml";s:20:"HTTP_ACCEPT_ENCODING";s:12:"gzip,deflate";s:20:"HTTP_ACCEPT_LANGUAGE";s:35:"zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4";s:11:"HTTP_COOKIE";s:665:"thinkphp_show_page_trace=0|0; CNZZDATA4126717=cnzz_eid%3D1921425653-1409744830-%26ntime%3D1409744830; ebak_loginlangid=1; bdshare_firstime=1413184559164; CNZZDATA5524076=cnzz_eid%3D1153009811-1410917713-http%253A%252F%252Flocalhost%252F%26ntime%3D1415065905; AJSTAT_ok_times=1; CNZZDATA1702264=cnzz_eid%3D2138502453-1418106368-http%253A%252F%252Flocalhost%252F%26ntime%3D1418106368; T3_TSV3_LOGGED_USER=ZrMHnKszUTFgLND68h606mQ2dwIDqQxo; ts_email=admin%40admin.com; ts_autologin=impa20mg0xkw4wk0g88ko4cow8c4840; PHPSESSID=hg6e0gcputh81orai5khd7ev00; think_language=zh-CN; onethink_admin___forward__=%2Fresp%2Fbackend1%2Fadmin.php%3Fs%3D%2FConfig%2Findex%2Fp%2F2.html";s:4:"PATH";s:1312:"C:ProgramDataOracleJavajavapath;C:Program Files (x86)NVIDIA CorporationPhysXCommon;C:Program Files (x86)Common FilesNetSarang;c:\rubyin;C:Program Files (x86)InteliCLS Client;C:Program FilesInteliCLS Client;C:WINDOWSsystem32;C:WINDOWS;C:WINDOWSSystem32Wbem;C:WINDOWSSystem32WindowsPowerShellv1.0;C:Program Files (x86)IntelOpenCL SDK2.0inx86;C:Program Files (x86)IntelOpenCL SDK2.0inx64;C:Program FilesIntelIntel(R) Management Engine ComponentsDAL;C:Program FilesIntelIntel(R) Management Engine ComponentsIPT;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsDAL;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsIPT;C:Program FilesLenovo Fingerprint Reader;C:Program FilesLenovo Fingerprint Readerx86;C:ProgramDataLenovoReadyApps;C:Program FilesIntelWiFiin;C:Program FilesCommon FilesIntelWirelessCommon;C:Program FilesTortoiseSVNin;C:AppCanAppCanStudioPersonalHDKemulatormas;C:Program Files (x86)QuickTimeQTSystem;C:php;C:ProgramDataComposerSetupin;C:Program Files (x86)Windows Kits8.1Windows Performance Toolkit;C:Program Files (x86)Microsoft SDKsTypeScript1.0;C:Program FilesMicrosoft SQL Server110ToolsBinn;J:Program FilesTortoiseGitin;C:Program Files\nodejs;";s:10:"SystemRoot";s:10:"C:WINDOWS";s:7:"COMSPEC";s:27:"C:WINDOWSsystem32cmd.exe";s:7:"PATHEXT";s:62:".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.RB;.RBW";s:6:"WINDIR";s:10:"C:WINDOWS";s:16:"SERVER_SIGNATURE";s:0:"";s:15:"SERVER_SOFTWARE";s:32:"Apache/2.2.25 (Win32) PHP/5.4.28";s:11:"SERVER_NAME";s:9:"localhost";s:11:"SERVER_ADDR";s:9:"127.0.0.1";s:11:"SERVER_PORT";s:2:"80";s:11:"REMOTE_ADDR";s:9:"127.0.0.1";s:13:"DOCUMENT_ROOT";s:6:"F:/WWW";s:12:"SERVER_ADMIN";s:16:"admin@mshome.net";s:15:"SCRIPT_FILENAME";s:35:"F:/WWW/resp/hebidu/hebidu/index.php";s:11:"REMOTE_PORT";s:5:"50217";s:17:"GATEWAY_INTERFACE";s:7:"CGI/1.1";s:15:"SERVER_PROTOCOL";s:8:"HTTP/1.1";s:14:"REQUEST_METHOD";s:4:"POST";s:12:"QUERY_STRING";s:0:"";s:11:"REQUEST_URI";s:54:"/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml";s:11:"SCRIPT_NAME";s:29:"/resp/hebidu/hebidu/index.php";s:9:"PATH_INFO";s:10:"Config/add";s:15:"PATH_TRANSLATED";s:31:"F:WWWUcenterConfigadd.shtml";s:8:"PHP_SELF";s:54:"/resp/hebidu/hebidu/index.php/Ucenter/Config/add.shtml";s:18:"REQUEST_TIME_FLOAT";d:1419408582.6559999;s:12:"REQUEST_TIME";i:1419408582;}', 'ERR: [FILE] F:WWW\resphebiduhebiduApplicationUcenterControllerUcenterController.class.php [LINE] 102INFO:配置名称不能为空'),
(41, 1419501438, '127.0.0.1', '/resp/hebidu/hebidu/index.php/Ucenter/Config/index/group/2.shtml', 'COOKIE:a:12:{s:24:"thinkphp_show_page_trace";s:3:"0|0";s:15:"CNZZDATA4126717";s:48:"cnzz_eid=1921425653-1409744830-&ntime=1409744830";s:16:"ebak_loginlangid";s:1:"1";s:16:"bdshare_firstime";s:13:"1413184559164";s:15:"CNZZDATA5524076";s:73:"cnzz_eid=1153009811-1410917713-http%3A%2F%2Flocalhost%2F&ntime=1415065905";s:15:"AJSTAT_ok_times";s:1:"1";s:15:"CNZZDATA1702264";s:73:"cnzz_eid=2138502453-1418106368-http%3A%2F%2Flocalhost%2F&ntime=1418106368";s:19:"T3_TSV3_LOGGED_USER";s:32:"ZrMHnKszUTFgLND68h606mQ2dwIDqQxo";s:8:"ts_email";s:15:"admin@admin.com";s:12:"ts_autologin";s:31:"impa20mg0xkw4wk0g88ko4cow8c4840";s:9:"PHPSESSID";s:26:"j0kkclpe2to466i30gsrigifp6";s:14:"think_language";s:5:"zh-CN";}SESSION:a:2:{s:14:"onethink_admin";a:1:{s:33:"d2d977c58444271d9c780187e93f80e51";a:2:{s:11:"verify_code";s:32:"3b5c8ce8b89b69ff4427db81c124a5d7";s:11:"verify_time";i:1419486468;}}s:6:"oauth_";a:5:{s:3:"uid";s:1:"1";s:11:"topbar_menu";a:2:{i:0;a:10:{s:2:"id";s:3:"129";s:5:"title";s:6:"系统";s:3:"pid";s:1:"0";s:4:"sort";s:2:"11";s:3:"url";s:1:"#";s:4:"hide";s:1:"0";s:3:"tip";s:0:"";s:5:"group";s:0:"";s:6:"is_dev";s:1:"0";s:6:"status";s:1:"1";}i:1;a:10:{s:2:"id";s:3:"136";s:5:"title";s:12:"用户中心";s:3:"pid";s:1:"0";s:4:"sort";s:1:"2";s:3:"url";s:19:"Ucenter/Index/index";s:4:"hide";s:1:"0";s:3:"tip";s:0:"";s:5:"group";s:0:"";s:6:"is_dev";s:1:"0";s:6:"status";s:1:"1";}}s:12:"activemenuid";s:3:"129";s:12:"left_menu129";a:3:{i:0;a:11:{s:2:"id";s:3:"133";s:5:"title";s:12:"配置模块";s:3:"pid";s:3:"129";s:4:"sort";s:1:"1";s:3:"url";s:1:"#";s:4:"hide";s:1:"0";s:3:"tip";s:0:"";s:5:"group";s:0:"";s:6:"is_dev";s:1:"0";s:6:"status";s:1:"1";s:8:"children";a:3:{i:0;a:10:{s:2:"id";s:3:"142";s:5:"title";s:12:"系统设置";s:3:"pid";s:3:"133";s:4:"sort";s:1:"3";s:3:"url";s:18:"Ucenter/Config/set";s:4:"hide";s:1:"0";s:3:"tip";s:0:"";s:5:"group";s:0:"";s:6:"is_dev";s:1:"0";s:6:"status";s:1:"1";}i:1;a:10:{s:2:"id";s:3:"135";s:5:"title";s:12:"配置管理";s:3:"pid";s:3:"133";s:4:"sort";s:1:"2";s:3:"url";s:20:"Ucenter/Config/index";s:4:"hide";s:1:"0";s:3:"tip";s:27:"系统的配置信息管理";s:5:"group";s:0:"";s:6:"is_dev";s:1:"1";s:6:"status";s:1:"1";}i:2;a:10:{s:2:"id";s:3:"134";s:5:"title";s:12:"菜单配置";s:3:"pid";s:3:"133";s:4:"sort";s:1:"0";s:3:"url";s:18:"Ucenter/Menu/index";s:4:"hide";s:1:"0";s:3:"tip";s:18:"系统菜单配置";s:5:"group";s:0:"";s:6:"is_dev";s:1:"0";s:6:"status";s:1:"1";}}}i:1;a:11:{s:2:"id";s:3:"137";s:5:"title";s:12:"日志模块";s:3:"pid";s:3:"129";s:4:"sort";s:1:"0";s:3:"url";s:17:"Ucenter/Log/index";s:4:"hide";s:1:"0";s:3:"tip";s:12:"日志记录";s:5:"group";s:0:"";s:6:"is_dev";s:1:"0";s:6:"status";s:1:"1";s:8:"children";a:1:{i:0;a:10:{s:2:"id";s:3:"138";s:5:"title";s:12:"系统日志";s:3:"pid";s:3:"137";s:4:"sort";s:1:"2";s:3:"url";s:18:"Ucenter/Log/system";s:4:"hide";s:1:"0";s:3:"tip";s:12:"系统日志";s:5:"group";s:0:"";s:6:"is_dev";s:1:"0";s:6:"status";s:1:"1";}}}i:2;a:11:{s:2:"id";s:3:"139";s:5:"title";s:12:"系统工具";s:3:"pid";s:3:"129";s:4:"sort";s:1:"0";s:3:"url";s:1:"#";s:4:"hide";s:1:"0";s:3:"tip";s:0:"";s:5:"group";s:0:"";s:6:"is_dev";s:1:"0";s:6:"status";s:1:"1";s:8:"children";a:1:{i:0;a:10:{s:2:"id";s:3:"140";s:5:"title";s:12:"缓存清除";s:3:"pid";s:3:"139";s:4:"sort";s:1:"1";s:3:"url";s:22:"Ucenter/Cache/clearAll";s:4:"hide";s:1:"0";s:3:"tip";s:31:"缓存清除,不清楚log日志";s:5:"group";s:0:"";s:6:"is_dev";s:1:"0";s:6:"status";s:1:"1";}}}}s:15:"activesubmenuid";s:3:"135";}}POST:a:0:{}GET:a:1:{s:5:"group";s:1:"2";}SERVER:a:37:{s:9:"HTTP_HOST";s:9:"localhost";s:15:"HTTP_CONNECTION";s:10:"keep-alive";s:11:"HTTP_PRAGMA";s:8:"no-cache";s:18:"HTTP_CACHE_CONTROL";s:8:"no-cache";s:11:"HTTP_ACCEPT";s:74:"text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8";s:15:"HTTP_USER_AGENT";s:109:"Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36";s:8:"HTTP_DNT";s:1:"1";s:12:"HTTP_REFERER";s:80:"http://localhost/resp/hebidu/hebidu/index.php/Ucenter/Config/index/group/4.shtml";s:20:"HTTP_ACCEPT_ENCODING";s:17:"gzip,deflate,sdch";s:20:"HTTP_ACCEPT_LANGUAGE";s:35:"zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4";s:11:"HTTP_COOKIE";s:599:"thinkphp_show_page_trace=0|0; thinkphp_show_page_trace=0|0; CNZZDATA4126717=cnzz_eid%3D1921425653-1409744830-%26ntime%3D1409744830; ebak_loginlangid=1; bdshare_firstime=1413184559164; CNZZDATA5524076=cnzz_eid%3D1153009811-1410917713-http%253A%252F%252Flocalhost%252F%26ntime%3D1415065905; AJSTAT_ok_times=1; CNZZDATA1702264=cnzz_eid%3D2138502453-1418106368-http%253A%252F%252Flocalhost%252F%26ntime%3D1418106368; T3_TSV3_LOGGED_USER=ZrMHnKszUTFgLND68h606mQ2dwIDqQxo; ts_email=admin%40admin.com; ts_autologin=impa20mg0xkw4wk0g88ko4cow8c4840; PHPSESSID=j0kkclpe2to466i30gsrigifp6; think_language=zh-CN";s:4:"PATH";s:1312:"C:ProgramDataOracleJavajavapath;C:Program Files (x86)NVIDIA CorporationPhysXCommon;C:Program Files (x86)Common FilesNetSarang;c:\rubyin;C:Program Files (x86)InteliCLS Client;C:Program FilesInteliCLS Client;C:WINDOWSsystem32;C:WINDOWS;C:WINDOWSSystem32Wbem;C:WINDOWSSystem32WindowsPowerShellv1.0;C:Program Files (x86)IntelOpenCL SDK2.0inx86;C:Program Files (x86)IntelOpenCL SDK2.0inx64;C:Program FilesIntelIntel(R) Management Engine ComponentsDAL;C:Program FilesIntelIntel(R) Management Engine ComponentsIPT;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsDAL;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsIPT;C:Program FilesLenovo Fingerprint Reader;C:Program FilesLenovo Fingerprint Readerx86;C:ProgramDataLenovoReadyApps;C:Program FilesIntelWiFiin;C:Program FilesCommon FilesIntelWirelessCommon;C:Program FilesTortoiseSVNin;C:AppCanAppCanStudioPersonalHDKemulatormas;C:php;C:ProgramDataComposerSetupin;C:Program Files (x86)Windows Kits8.1Windows Performance Toolkit;C:Program Files (x86)Microsoft SDKsTypeScript1.0;C:Program FilesMicrosoft SQL Server110ToolsBinn;J:Program FilesTortoiseGitin;C:Program Files\nodejs;C:Program Files (x86)QuickTimeQTSystem;";s:10:"SystemRoot";s:10:"C:WINDOWS";s:7:"COMSPEC";s:27:"C:WINDOWSsystem32cmd.exe";s:7:"PATHEXT";s:62:".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.RB;.RBW";s:6:"WINDIR";s:10:"C:WINDOWS";s:16:"SERVER_SIGNATURE";s:0:"";s:15:"SERVER_SOFTWARE";s:32:"Apache/2.2.25 (Win32) PHP/5.4.28";s:11:"SERVER_NAME";s:9:"localhost";s:11:"SERVER_ADDR";s:9:"127.0.0.1";s:11:"SERVER_PORT";s:2:"80";s:11:"REMOTE_ADDR";s:9:"127.0.0.1";s:13:"DOCUMENT_ROOT";s:6:"F:/WWW";s:12:"SERVER_ADMIN";s:16:"admin@mshome.net";s:15:"SCRIPT_FILENAME";s:35:"F:/WWW/resp/hebidu/hebidu/index.php";s:11:"REMOTE_PORT";s:5:"52298";s:17:"GATEWAY_INTERFACE";s:7:"CGI/1.1";s:15:"SERVER_PROTOCOL";s:8:"HTTP/1.1";s:14:"REQUEST_METHOD";s:3:"GET";s:12:"QUERY_STRING";s:0:"";s:11:"REQUEST_URI";s:64:"/resp/hebidu/hebidu/index.php/Ucenter/Config/index/group/2.shtml";s:11:"SCRIPT_NAME";s:29:"/resp/hebidu/hebidu/index.php";s:9:"PATH_INFO";s:20:"Config/index/group/2";s:15:"PATH_TRANSLATED";s:41:"F:WWWUcenterConfigindexgroup2.shtml";s:8:"PHP_SELF";s:64:"/resp/hebidu/hebidu/index.php/Ucenter/Config/index/group/2.shtml";s:18:"REQUEST_TIME_FLOAT";d:1419501437.8310001;s:12:"REQUEST_TIME";i:1419501437;}', 'ERR: XML标签语法错误 : name="$key" value=":I("group",-1)"\r\n'),
(42, 1419505027, '127.0.0.1', '/resp/hebidu/hebidu/public/Ucenter/css/login.css?c=aAPP_VERSIONm__M_VERSION__', 'COOKIE:a:11:{s:15:"CNZZDATA4126717";s:48:"cnzz_eid=1921425653-1409744830-&ntime=1409744830";s:16:"ebak_loginlangid";s:1:"1";s:16:"bdshare_firstime";s:13:"1413184559164";s:15:"CNZZDATA5524076";s:73:"cnzz_eid=1153009811-1410917713-http%3A%2F%2Flocalhost%2F&ntime=1415065905";s:15:"AJSTAT_ok_times";s:1:"1";s:15:"CNZZDATA1702264";s:73:"cnzz_eid=2138502453-1418106368-http%3A%2F%2Flocalhost%2F&ntime=1418106368";s:19:"T3_TSV3_LOGGED_USER";s:32:"ZrMHnKszUTFgLND68h606mQ2dwIDqQxo";s:8:"ts_email";s:15:"admin@admin.com";s:12:"ts_autologin";s:31:"impa20mg0xkw4wk0g88ko4cow8c4840";s:9:"PHPSESSID";s:26:"n1llogj283qkmf9e9vgc5udot1";s:14:"think_language";s:5:"zh-CN";}SESSION:N;POST:a:0:{}GET:a:1:{s:1:"c";s:26:"aAPP_VERSIONm__M_VERSION__";}SERVER:a:38:{s:15:"REDIRECT_STATUS";s:3:"200";s:9:"HTTP_HOST";s:9:"localhost";s:15:"HTTP_CONNECTION";s:10:"keep-alive";s:11:"HTTP_ACCEPT";s:18:"text/css,*/*;q=0.1";s:15:"HTTP_USER_AGENT";s:109:"Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36";s:8:"HTTP_DNT";s:1:"1";s:12:"HTTP_REFERER";s:75:"http://localhost/resp/hebidu/hebidu/index.php/Ucenter/Public/register.shtml";s:20:"HTTP_ACCEPT_ENCODING";s:17:"gzip,deflate,sdch";s:20:"HTTP_ACCEPT_LANGUAGE";s:35:"zh-CN,zh;q=0.8,en-US;q=0.6,en;q=0.4";s:11:"HTTP_COOKIE";s:539:"CNZZDATA4126717=cnzz_eid%3D1921425653-1409744830-%26ntime%3D1409744830; ebak_loginlangid=1; bdshare_firstime=1413184559164; CNZZDATA5524076=cnzz_eid%3D1153009811-1410917713-http%253A%252F%252Flocalhost%252F%26ntime%3D1415065905; AJSTAT_ok_times=1; CNZZDATA1702264=cnzz_eid%3D2138502453-1418106368-http%253A%252F%252Flocalhost%252F%26ntime%3D1418106368; T3_TSV3_LOGGED_USER=ZrMHnKszUTFgLND68h606mQ2dwIDqQxo; ts_email=admin%40admin.com; ts_autologin=impa20mg0xkw4wk0g88ko4cow8c4840; PHPSESSID=n1llogj283qkmf9e9vgc5udot1; think_language=zh-CN";s:4:"PATH";s:1312:"C:ProgramDataOracleJavajavapath;C:Program Files (x86)NVIDIA CorporationPhysXCommon;C:Program Files (x86)Common FilesNetSarang;c:\rubyin;C:Program Files (x86)InteliCLS Client;C:Program FilesInteliCLS Client;C:WINDOWSsystem32;C:WINDOWS;C:WINDOWSSystem32Wbem;C:WINDOWSSystem32WindowsPowerShellv1.0;C:Program Files (x86)IntelOpenCL SDK2.0inx86;C:Program Files (x86)IntelOpenCL SDK2.0inx64;C:Program FilesIntelIntel(R) Management Engine ComponentsDAL;C:Program FilesIntelIntel(R) Management Engine ComponentsIPT;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsDAL;C:Program Files (x86)IntelIntel(R) Management Engine ComponentsIPT;C:Program FilesLenovo Fingerprint Reader;C:Program FilesLenovo Fingerprint Readerx86;C:ProgramDataLenovoReadyApps;C:Program FilesIntelWiFiin;C:Program FilesCommon FilesIntelWirelessCommon;C:Program FilesTortoiseSVNin;C:AppCanAppCanStudioPersonalHDKemulatormas;C:php;C:ProgramDataComposerSetupin;C:Program Files (x86)Windows Kits8.1Windows Performance Toolkit;C:Program Files (x86)Microsoft SDKsTypeScript1.0;C:Program FilesMicrosoft SQL Server110ToolsBinn;J:Program FilesTortoiseGitin;C:Program Files\nodejs;C:Program Files (x86)QuickTimeQTSystem;";s:10:"SystemRoot";s:10:"C:WINDOWS";s:7:"COMSPEC";s:27:"C:WINDOWSsystem32cmd.exe";s:7:"PATHEXT";s:62:".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.RB;.RBW";s:6:"WINDIR";s:10:"C:WINDOWS";s:16:"SERVER_SIGNATURE";s:0:"";s:15:"SERVER_SOFTWARE";s:32:"Apache/2.2.25 (Win32) PHP/5.4.28";s:11:"SERVER_NAME";s:9:"localhost";s:11:"SERVER_ADDR";s:9:"127.0.0.1";s:11:"SERVER_PORT";s:2:"80";s:11:"REMOTE_ADDR";s:9:"127.0.0.1";s:13:"DOCUMENT_ROOT";s:6:"F:/WWW";s:12:"SERVER_ADMIN";s:16:"admin@mshome.net";s:15:"SCRIPT_FILENAME";s:35:"F:/WWW/resp/hebidu/hebidu/index.php";s:11:"REMOTE_PORT";s:5:"53797";s:21:"REDIRECT_QUERY_STRING";s:28:"c=aAPP_VERSIONm__M_VERSION__";s:12:"REDIRECT_URL";s:48:"/resp/hebidu/hebidu/public/Ucenter/css/login.css";s:17:"GATEWAY_INTERFACE";s:7:"CGI/1.1";s:15:"SERVER_PROTOCOL";s:8:"HTTP/1.1";s:14:"REQUEST_METHOD";s:3:"GET";s:12:"QUERY_STRING";s:28:"c=aAPP_VERSIONm__M_VERSION__";s:11:"REQUEST_URI";s:77:"/resp/hebidu/hebidu/public/Ucenter/css/login.css?c=aAPP_VERSIONm__M_VERSION__";s:11:"SCRIPT_NAME";s:29:"/resp/hebidu/hebidu/index.php";s:9:"PATH_INFO";s:21:"Ucenter/css/login.css";s:15:"PATH_TRANSLATED";s:35:"F:WWWPublicUcentercsslogin.css";s:8:"PHP_SELF";s:58:"/resp/hebidu/hebidu/index.php/Public/Ucenter/css/login.css";s:18:"REQUEST_TIME_FLOAT";d:1419505027.7479999;s:12:"REQUEST_TIME";i:1419505027;}', 'ERR: 无法加载模块:Public\r\n');

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
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `common_member`
--

INSERT INTO `common_member` (`uid`, `realname`, `idnumber`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`) VALUES
(1, '', '', 'admin', 0, '0000-00-00', '', 40, 5, 0, 1417400172, 2130706433, 1419560493, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=145 ;

--
-- 转存表中的数据 `common_menu`
--

INSERT INTO `common_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `status`) VALUES
(136, '用户中心', 0, 2, 'Ucenter/Index/index', 0, '', '', 0, 1),
(135, '配置管理', 133, 2, 'Ucenter/Config/index', 0, '系统的配置信息管理', '', 1, 1),
(129, '系统', 0, 11, '#', 0, '', '', 0, 1),
(133, '配置模块', 129, 1, '#', 0, '', '', 0, 1),
(134, '菜单配置', 133, 0, 'Ucenter/Menu/index', 0, '系统菜单配置', '', 0, 1),
(137, '日志模块', 129, 0, 'Ucenter/Log/index', 0, '日志记录', '', 0, 1),
(138, '系统日志', 137, 2, 'Ucenter/Log/system', 0, '系统日志', '', 0, 1),
(139, '系统工具', 129, 0, '#', 0, '', '', 0, 1),
(140, '缓存清除', 139, 1, 'Ucenter/Cache/clearAll', 0, '缓存清除,不清楚log日志', '', 0, 1),
(142, '系统设置', 133, 3, 'Ucenter/Config/set', 0, '', '', 0, 1),
(143, '数据备份', 139, 2, 'Database/index?type=export', 0, '数据库备份', '', 0, 1),
(144, '数据还原', 139, 4, 'Database/index?type=import', 0, '数据库还原', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `uc_ucenter_admin`
--

CREATE TABLE IF NOT EXISTS `uc_ucenter_admin` (
`id` int(10) unsigned NOT NULL COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `uc_ucenter_admin`
--

INSERT INTO `uc_ucenter_admin` (`id`, `member_id`, `status`) VALUES
(1, 1, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `uc_ucenter_member`
--

INSERT INTO `uc_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'admin', '73ec9701ea26afb1d6585e660febb9a4', 'hebiduhebi@126.com', '', 1417400172, 2130706433, 1419561740, 2130706433, 1417400172, 1);

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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `common_log`
--
ALTER TABLE `common_log`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id，自增',AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `common_member`
--
ALTER TABLE `common_member`
MODIFY `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `common_menu`
--
ALTER TABLE `common_menu`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',AUTO_INCREMENT=145;
--
-- AUTO_INCREMENT for table `uc_ucenter_admin`
--
ALTER TABLE `uc_ucenter_admin`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `uc_ucenter_app`
--
ALTER TABLE `uc_ucenter_app`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',AUTO_INCREMENT=3;
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
