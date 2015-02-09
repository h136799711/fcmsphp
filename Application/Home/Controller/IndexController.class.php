<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    
    public function index(){
       $this->display();
    }
	
	/**
	 * 首页
	 */
	public function home(){
		$this->display();
	}
	
}