<?php
// .-----------------------------------------------------------------------------------
// | WE TRY THE BEST WAY
// |-----------------------------------------------------------------------------------
// | Author: 贝贝 <hebiduhebi@163.com>
// | Copyright (c) 2013-2015, http://www.gooraye.net. All Rights Reserved.
// |-----------------------------------------------------------------------------------

namespace Ucenter\Controller;

class MenuController extends UcenterController {

	protected function _initialize() {
		parent::_initialize();
		//
		if (I('get.pid', 0) != 0) {
			$result = apiCall("Ucenter/Menu/getInfo", array( array('id' => I('get.pid'))));
			if ($result['status']) {
				$this -> assign('parentMenu', $result['info']);
			} else {
				LogRecord('INFO:' . $result['info'], '[FILE] ' . __FILE__ . ' [LINE] ' . __LINE__);
				$this -> error(L('UNKNOWN_ERR'));
			}
		}
	}

	/**
	 * 菜单
	 */
	public function index() {
		$map = array();
		$map['pid'] = I('get.pid', 0);

		$page = array('curpage' => I('get.p', 0), 'size' => C('LIST_ROWS'));
		$order = "sort desc";
		$result = apiCall("Ucenter/Menu/query", array($map, $page, $order));

		parent::queryResult($result);

	}

	/**
	 * 保存
	 */
	public function save() {
		if (IS_GET) { $this -> error($this -> NOT_SUPPORT_METHOD);
		}
		$entity = I('post.');

		$entity['pid'] = I('post.pid', 0);

		$redirect_url = U('Ucenter/Menu/index', array('pid' => I('post.pid', 0)));
		
		//TODO: 保存到权限规则表中
		$result = apiCall('Ucenter/Menu/getInfo', array(array('id'=>I('get.id', 0))));
		if($result['status'] && is_array($result['info'])){
			$newEntity = array(
				'title'=>$entity['title'],
				'name'=>$entity['url'],
				'type'=>$entity['pid'],
			);
			$this->updateAuthRule($result['info']['title'], $result['info']['url'], $result['info']['pid'], $newEntity);
		}else{
			$this->error("获取数据错误，请重试！");
		}
		
		$result = apiCall('Ucenter/Menu/saveByID', array(I('get.id', 0), $entity));
		if ($result['status'] === false) {
			LogRecord('INFO:' . $result['info'], '[FILE] ' . __FILE__ . ' [LINE] ' . __LINE__);
			$this -> error($result['info']);
		} else {
			$this -> success(L('RESULT_SUCCESS'), $redirect_url);
		}

	}

	public function edit() {
		if (IS_GET) {
			$map = array('id' => I('get.id'));
			$result = apiCall('Ucenter/' . CONTROLLER_NAME . '/getInfo', array($map));
			if ($result['status'] === false) {
				LogRecord('INFO:' . $result['info'], '[FILE] ' . __FILE__ . ' [LINE] ' . __LINE__);
				$this -> error(L('C_GET_NULLDATA'));
			} else {
				$this -> assign("entity", $result['info']);
			}
			$map['id'] = array('neq' , I('get.id'));
			$result = apiCall('Ucenter/Menu/queryNoPaging', array($map));
			if ($result['status']) {
				$tree = new \Common\Model\TreeModel();
				$menus = $tree -> toFormatTree($result['info']);

				$this -> assign("pid", I('pid', 0));
				$this -> assign("menus", $menus);
				$this -> display();
			} else {
				$this -> error($result['info']);
			}
		} else {
		}
	}

	/**
	 * 增加菜单
	 */
	public function add() {
		if (IS_GET) {
			$result = apiCall('Ucenter/Menu/queryNoPaging', array());
			if ($result['status']) {
				$tree = new \Common\Model\TreeModel();
				$menus = $tree -> toFormatTree($result['info']);

				$this -> assign("pid", I('pid', 0));
				$this -> assign("menus", $menus);
				$this -> display();
			} else {
				$this -> error($result['info']);
			}
		} else {
			$menu = I('post.');
			$menu['pid'] = I('pid', 0);
			$success_url = U('Ucenter/Menu/index', array('pid' => I('post.pid', 0)));

			$result = apiCall('Ucenter/Menu/add', array($menu));
			if ($result['status'] === false) {
				LogRecord('INFO:' . $result['info'], '[FILE] ' . __FILE__ . ' [LINE] ' . __LINE__);
				$this -> error($result['info']);
			} else {
				//新增权限节点
				$this -> addAuthRule($menu['title'], $menu['url'], $menu['pid']);
				$this -> success(L('RESULT_SUCCESS'), $success_url);
			}
		}
	}

	/**
	 * 删除菜单
	 */
	public function delete() {
		$map = array('pid' => I('id', -1));
		$result = apiCall('Ucenter/Menu/query', array($map));
		if ($result['status'] && !is_null($result['info'])) {

			if (count($result['info']['list']) > 0) {
				$this -> error(L('ERR_CANT_DEL_HAS_CHILDREN'));
			} else {

				$map = array('id' => I('id', -1));
				//获取菜单信息
				$result = apiCall('Ucenter/Menu/getInfo', array($map));
				
				if($result['status']){
					$entity = $result['info'];
					//删除对应节点
					$this->delAuthRule($entity['title'], $entity['url'], $entity['pid']);
				}else{
					LogRecord('[INFO]' . $result['info'], '[FILE] ' . __FILE__ . ' [LINE] ' . __LINE__);
					$this -> error($result['info']);
				}
				
				$result = apiCall('Ucenter/Menu/delete', array($map));
				
				if ($result['status'] === false) {
					LogRecord('[INFO]' . $result['info'], '[FILE] ' . __FILE__ . ' [LINE] ' . __LINE__);
					$this -> error($result['info']);
				} else {
					$this -> success(L('RESULT_SUCCESS'), $success_url);
				}

			}
		}
	}

	/**
	 * 保存节点
	 */
	private function addAuthRule($title, $url, $pid) {
		$authRuleCtrl = A('Ucenter/AuthRule');

		if ($pid == 0) {
			//一级
			$type = 2;
		} else {
			//一级以下
			$type = 1;
		}
		$authRuleCtrl -> add($title, $url, $type);

	}



	/**
	 * 保存节点
	 */
	private function updateAuthRule($title, $url, $pid,$newEntity) {
		$authRuleCtrl = A('Ucenter/AuthRule');
		
		if($newEntity['type'] == 0){
			$newEntity['type'] = 2;
		}else{
			$newEntity['type'] = 1;
		}
		if ($pid == 0) {
			//一级
			$type = 2;
		} else {
			//一级以下
			$type = 1;
		}
		
		$authRuleCtrl -> save($title, $url, $type,$newEntity);

	}
	
	

	/**
	 * 保存节点
	 */
	private function delAuthRule($title, $url, $pid) {
		$authRuleCtrl = A('Ucenter/AuthRule');

		if ($pid == 0) {
			//一级
			$type = 2;
		} else {
			//一级以下
			$type = 1;
		}
		$authRuleCtrl -> delete($title, $url, $type);

	}
	

}
