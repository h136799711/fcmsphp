可展开折叠的滚动在线qq客服jQuery插件 我爱模板推荐

蓝色靠右的在线客服插件，可随着滚动条滚动，使用非常方便，仅需引入相关js代码即可。

使用方法：
1、在head引入下面的js和css代码：
<script type="text/javascript" src="http://www.5imoban.net/download/jquery/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="skin/5imoban.net.blue1.css">
<script src="js/5imoban.net.js"></script>
<script>
$(function(){
	$("#lrkfwarp").lrkf({
		kftop:'140',				//距离顶部距离
		btntext:'客服在线',			//默认为 客服在线 四个字，如果你了解css可以使用图片代替
		//defshow:false,			    //如果想默认折叠，将defshow:false,的注释打开，默认为展开
		position:'absolute',		//如果为absolute所有浏览器在拖动滚动条时均有动画效果，如果为空则只有IE6有动画效果，其他浏览器
		qqs:[
			{'name':'售前1号','qq':'412611348'},			//注意逗号是英文的逗号
			{'name':'客服2号','qq':'412611348'},
			{'name':'客服3号','qq':'412611348'},
			{'name':'客服4号','qq':'412611348'}			//注意最后一个{}不要英文逗号
		],
		tel:[
			{'name':'24小时热线','tel':'400-888-0888'},	//注意逗号是英文的逗号
			{'name':'售后','tel':'13554804241'}
		],
		more:"http://www.5imoban.net/"				//>>更多方式
	});
});

</script>

至于参数设置，代码上已经写得非常清楚

更多网站素材欢迎访问：http://www.5imoban.net/sucai/