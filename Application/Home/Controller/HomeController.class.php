<?php
// .-----------------------------------------------------------------------------------
// | WE TRY THE BEST WAY
// |-----------------------------------------------------------------------------------
// | Author: 贝贝 <hebiduhebi@163.com>
// | Copyright (c) 2013-2015, http://www.gooraye.net. All Rights Reserved.
// |-----------------------------------------------------------------------------------

namespace Home\Controller;
use Common\Controller\BaseController;

class HomeController extends BaseController {

	protected $NOT_SUPPORT_METHOD = "不支持的请求方法！";

	protected function _initialize() {
		parent::_initialize();
		
		//获取配置
		$this -> getConfig();
		//对页面一些配置赋值
		$this -> assignPageVars();
		// 是否是超级管理员
		define('IS_ROOT', is_administrator());

		//定义版本
		if (defined("APP_DEBUG") && APP_DEBUG) {
			define("APP_VERSION", time());
		} else {
			define("APP_VERSION", C('APP_VERSION'));
		}
		
		//权限检测
//		if ($this -> checkAuthority() === false) {
//			$this -> error(L('ERR_NO_PERMISSION'));
//		}
	}
	
	//===================权限相关START=======================

	public function checkAuthority() {
		//是系统管理员则都可以访问
		if (IS_ROOT) {
			return true;
		}
		
		$access = $this -> accessControl();
		if (false === $access) {
			$this -> error('403:禁止访问');
		} elseif (null === $access) {
			//检测访问权限
			$rule = strtolower(MODULE_NAME . '/' . CONTROLLER_NAME . '/' . ACTION_NAME);
			if (!$this -> checkRule($rule, array('in', '1,2'))) {
				$this -> error('未授权访问!');
			} else {
				// 检测分类及内容有关的各项动态权限
				$dynamic = $this -> checkDynamic();
				if (false === $dynamic) {
					$this -> error('未授权访问!');
				}
			}
		}
		//TODO:检测权限
		return true;
	}
	
	
    /**
     * 权限检测
     * @param string  $rule    检测的规则
     * @param string  $mode    check模式
     * @return boolean
     */
    private function checkRule($rule, $mode='url'){
        static $Auth    =   null;
        if (!$Auth) {
            $Auth       =   new \Think\Auth();
        }
		
        if(!$Auth->check($rule,UID,2,$mode)){
            return false;
        }
		
        return true;
    }
	
	/**
     * action访问控制,在 **登陆成功** 后执行的第一项权限检测任务
     *
     * @return boolean|null  返回值必须使用 `===` 进行判断
     *
     *   返回 **false**, 不允许任何人访问(超管除外)
     *   返回 **true**, 允许任何管理员访问,无需执行节点权限检测
     *   返回 **null**, 需要继续执行节点权限检测决定是否允许访问
	 * 
     */
    private function accessControl(){
        $allow = C('ALLOW_VISIT');
        $deny  = C('DENY_VISIT');
        $check = strtolower(CONTROLLER_NAME.'/'.ACTION_NAME);
        if ( !empty($deny)  && in_array_case($check,$deny) ) {
            return false;//非超管禁止访问deny中的方法
        }
        if ( !empty($allow) && in_array_case($check,$allow) ) {
            return true;
        }
        return null;//需要检测节点权限
    }
	
	private function checkDynamic(){
		 return true;
	}
	
	//===================权限相关END=======================
	
	
	//页面上变量赋值
	public function assignPageVars() {
		$seo = array('title' => C('WEBSITE_TITLE'), 'keywords' => C('WEBSITE_KEYWORDS'), 'description' => C('WEBSITE_DESCRIPTION'));
		$cfg = array('owner' => C('WEBSITE_OWNER'), 'statisticalcode' => C('WEBSITE_STATISTICAL_CODE'));
		
		//
		$this -> assignVars($seo, $cfg);
	}

	/**
	 * 从数据库中取得配置信息
	 */
	protected function getConfig() {
		$config = S('config_' . session_id() . '_' . session("uid"));
		if (APP_DEBUG === true) {
			//调试模式下，不缓存配置
			$config = false;
		}
		if ($config === false) {
			$map = array();
			$fields = 'type,name,value';
			$result = apiCall('Ucenter/Config/queryNoPaging', array($map, false, $fields));
			if ($result['status']) {
				$config = array();
				if (is_array($result['info'])) {
					foreach ($result['info'] as $value) {
						$config[$value['name']] = $this -> parse($value['type'], $value['value']);
					}
				}
				//缓存配置300秒
				S("config_" . session_id() . '_' . session("uid"), $config, 300);
			} else {
				LogRecord('INFO:' . $result['info'], '[FILE] ' . __FILE__ . ' [LINE] ' . __LINE__);
				$this -> error($result['info']);
			}
		}
		C($config);
		C('SHOW_PAGE_TRACE',false);
	}

	/**
	 * 根据配置类型解析配置
	 * @param  integer $type  配置类型
	 * @param  string  $value 配置值
	 */
	private static function parse($type, $value) {
		switch ($type) {
			case 3 :
				//解析数组
				$array = preg_split('/[,;\r\n]+/', trim($value, ",;\r\n"));
				if (strpos($value, ':')) {
					$value = array();
					foreach ($array as $val) {
						list($k, $v) = explode(':', $val);
						$value[$k] = $v;
					}
				} else {
					$value = $array;
				}
				break;
		}
		return $value;
	}


	

}
