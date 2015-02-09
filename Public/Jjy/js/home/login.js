function refresh(verify) {
	 verify = verify || ".verify";
	var verifySrc = $(verify).attr("src");
	if(!verifySrc){return ;}
	if (verifySrc.indexOf('?') > 0) {
		$(verify).attr("src", verifySrc + '&r=' + Math.random());
	} else {
		$(verify).attr("src", verifySrc.replace(/\?.*$/, '') + '?' + Math.random());
	}
}

$(document).keydown(function(event) {
//	if (event.keyCode == 13) {
//		$("#submitbtn").click();
//	}
});
$(function() {
	var clickstatus = false;
	$(window)
	$('#submitbtn').click(function(ev) {
		if (clickstatus) {
			return false;
		}
		clickstatus = true;
		var loginname = $('#loginform_loginname').val();
		var varpassword = $('#loginform_loginpassword').val();
		var captcha = $('#loginform_code').val();

		if (loginname == '会员登录' || loginname == '') {
			$.scojs_message('请输入注册账户', $.scojs_message.TYPE_ERROR);
			clickstatus = false;
			ev.preventDefault();
			return false;
		}
		if (jQuery.trim(varpassword) == '') {
			$.scojs_message('请输入密码', $.scojs_message.TYPE_ERROR);
			clickstatus = false;
			ev.preventDefault();
			return false;
		}

		if (captcha == '验证码' || captcha == '') {
			$.scojs_message('请输入验证码确认是真人登录', $.scojs_message.TYPE_ERROR);
			clickstatus = false;
			ev.preventDefault();
			return false;
		}
		$('.loginForm').submit();
	});
});