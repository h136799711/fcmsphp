<?php
namespace Home\Controller;
use Think\Controller;

class IndexController extends HomeController {
    
	protected function _initialize(){
		parent::_initialize();
	}
	
    public function index(){
       	$this->display();
    }
	
	/*
	 * 地图
	 * */
	public function map(){
		//经度
		$lng = I('get.lng');
		//纬度
		$lat = I('get.lat');
		$$height = I('get.height');
		$this->assign("lng",$lng);
		$this->assign("height",$height);
		$this->assign("lat",$lat);
		$this->display();
	}
	
	
}