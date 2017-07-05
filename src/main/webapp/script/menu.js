function showMenu() {
	// 读取当前浏览器的路径
	var url = window.location.href;
	var host = window.location.host;
	// path = http://www.xxx.com/user/index.htm
	var path = "";
	if ( url.indexOf("?") != -1 ) {
        path = url.substring(url.indexOf(host) + host.length, url.indexOf("?"));
	} else {
		path = url.substring(url.indexOf(host) + host.length);
	}
	// 通过选择器获取对应的菜单节点
	var linkObj = $(".list-group a[href*='"+path+"']");
	
	linkObj.css("color","red");
	
	var ulObj = linkObj.parent().parent();
	ulObj.show();
	
	ulObj.parent().removeClass("tree-closed");
}

showMenu();