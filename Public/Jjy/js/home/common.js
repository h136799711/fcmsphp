(function($, w) {
	function TODO(){
		alert("该功能正在开发中...");
	}
	function addFavorite(sURL, sTitle)
{
    try
    {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e)
        {
            alert("加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}
//设为首页 <a onclick="SetHome(this,window.location)">设为首页</a>
function setHome(obj,url){
	  	if (document.all) {
 
            document.body.style.behavior='url(#default#homepage)';
 
               document.body.setHomePage(url);
 
        }else{
 
            alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!");
 
        }
        
}
	
	window.myUtils = {
		setHome:setHome,
		addFavorite:addFavorite,
		TODO:TODO
	}
	
	$(window).load(function() {
		NProgress.done();
	})
	$(function() {
			NProgress.start();
			//nprogress
			$(document).ajaxStart(function() {
				NProgress.start();
			}).ajaxStop(function() {
				NProgress.done();
			}).ajaxComplete(function() {
				NProgress.inc();
			});

			//ajax get请求
			$('.ajax-get').click(function(ev) {
				
				ev.preventDefault();
				var target;
				var that = this;
			
				if ((target = $(this).attr('href')) || (target = $(this).attr('url'))) {

					if ($(this).hasClass('confirm')) {

						var conf = $.scojs_confirm({
							content: '确认要执行该操作吗?',
							action: function() {
								ajaxget(that, target);
							}
						});
						conf.show();
					}else{
						ajaxget(that, target);
					}
				}
				return false;
			});
			
			function ajaxget(that, target) {
					$.get(target).always(function() {

					}).success(function(data) {
						if (data.status == 1) {
							if (data.url) {
								$.scojs_message(data.info + ' 页面即将自动跳转~', $.scojs_message.TYPE_OK);
							} else {
								$.scojs_message(data.info, $.scojs_message.TYPE_OK);
							}
							setTimeout(function() {
								if (data.url) {
									location.href = data.url;
								} else if ($(that).hasClass('no-refresh')) {
								} else {
									location.reload();
								}
							}, 1500);
						} else {
							$.scojs_message(data.info, $.scojs_message.TYPE_OK);
							setTimeout(function() {
								if (data.url) {
									location.href = data.url;
								} else {
								}
							}, 1500);
						}
					});
				}
				//ajax post submit请求
			$('.ajax-post').click(function() {
				console.log("click");
				var target, query, form;
				var target_form = $(this).attr('target-form');
				var that = this;
				var need_confirm = false;
				if (($(this).attr('type') == 'submit') || (target = $(this).attr('href')) || (target = $(this).attr('url'))) {
					form = $('.' + target_form);
					if(form.hasClass("validate-form")){
						if(!form.valid()){
							$.scojs_message('表单验证不通过！',$.scojs_message.TYPE_ERROR);
							return false;
						}
					}
					if ($(this).attr('hide-data') === 'true') {
						//以隐藏数据作为参数
						form = $('.hide-data');
						query = form.serialize();
					} else if (form.get(0) == undefined) {
						return false;
					} else if (form.get(0).nodeName == 'FORM') {
						if ($(this).attr('url') !== undefined || $(this).attr("href") !== undefined) {
							target = $(this).attr('url') || $(this).attr("href");
						} else {
							target = form.get(0).action;
						}
						query = form.serialize();


					} else if (form.get(0).nodeName == 'INPUT' || form.get(0).nodeName == 'SELECT' || form.get(0).nodeName == 'TEXTAREA') {
						//以input 为触发节点
						form.each(function(k, v) {
							if (v.type == 'checkbox' && v.checked == true) {
								nead_confirm = true;
							}
						})
						query = form.serialize();

					} else {

						query = form.find('input,select,textarea').serialize();
						
					}


				}
				
				if ($(this).hasClass('confirm')) {
					$(this).scojs_confirm({
						content: '确认要执行该操作吗',
						action: function() {
							ajaxpost(that, target, query);
						}
					}).show();
				} else {
					ajaxpost(that, target, query);
				}
				return false;
			}); //END ajax-post

			function ajaxpost(that, target, query) {
				//					return true;
				$(that).button("loading");
//				console.log("query=",query);
//				return ;
				$.post(target, query).fail(function() {
					$.scojs_message('Unknown Error', $.scojs_message.TYPE_ERROR);
				}).always(function() {
					$(that).button("reset");
				}).done(function(data) {
					if (data.status == 1) {
						if (data.url) {
							$.scojs_message(data.info + ' 页面即将自动跳转~', $.scojs_message.TYPE_OK);
						} else {
							$.scojs_message(data.info, $.scojs_message.TYPE_OK);
						}
						setTimeout(function() {
							if (data.url) {
								location.href = data.url;
							} else if ($(that).hasClass('no-refresh')) {} else {
								location.reload();
							}
						}, 1500);
					} else {

						$.scojs_message(data.info, $.scojs_message.TYPE_OK);
						setTimeout(function() {
							if (data.url) {
								location.href = data.url;
							} else {}
						}, 1500);
					}
				});
			}

		}) //end $.ready

})(jQuery, window);