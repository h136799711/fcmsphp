<?php
// .-----------------------------------------------------------------------------------
// | WE TRY THE BEST WAY
// |-----------------------------------------------------------------------------------
// | Author: 贝贝 <hebiduhebi@163.com>
// | Copyright (c) 2013-2015, http://www.gooraye.net. All Rights Reserved.
// |-----------------------------------------------------------------------------------

namespace Home\Controller;
use Common\Controller\BaseController;

class PublicController extends BaseController {

	/**
	 * GET 登录
	 * POST 登录验证
	 */
	public function login() {
		if (IS_GET) {
			$this -> display();
		} elseif (IS_POST) {
			dump(I('post.'));
			
		}
	}
	
	/**
	 * 注册页面
	 * 
	 * @return 注册页面
	 * @author beibei hebiduhebi@126.com
	 */
	public function register(){
		$this->display();
	}
	
	/**	
	 * 校验验证码是否正确
	 * @return Boolean
	 */
	public function check_verify($code,$id=1){
		
		$config = array(
		'fontSize' => 26, // 验证码字体大小
		'length' => 4, // 验证码位数
		'useNoise' => false, // 关闭验证码杂点
		);
		$Verify = new \Think\Verify($config);
		$Verify->check($code,$id);
	}

	/**
	 * 获取验证码
	 */
	public function verify() {
		$config = array(
		'fontSize' => 26, // 验证码字体大小
		'length' => 4, // 验证码位数
		'useNoise' => false, // 关闭验证码杂点
		);
		$Verify = new \Think\Verify($config);
		$Verify -> entry(1);
	}

}
