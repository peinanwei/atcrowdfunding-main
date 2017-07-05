<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keys" content="">
<meta name="author" content="">
<link rel="stylesheet"
	href="${APP_PATH }/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH }/css/login.css">
<style>
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<div>
					<a class="navbar-brand" href="index.html" style="font-size: 32px;">尚筹网-创意产品众筹平台</a>
				</div>
			</div>
		</div>
	</nav>

	<div class="container">
		<h3>${result.errorMSG }</h3>
		<form action="${APP_PATH }/dologin.htm" method="post"
			class="form-signin" role="form">
			<h2 class="form-signin-heading">
				<i class="glyphicon glyphicon-log-in"></i> 用户登录
			</h2>
			<div class="form-group has-success has-feedback">
				<input type="text" class="form-control" id="loginacct" value="admin"
					name="loginacct" placeholder="请输入登录账号" autofocus> <span
					class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			<div class="form-group has-success has-feedback">
				<input type="password" class="form-control" id="userpswd"
					value="123456" name="userpswd" placeholder="请输入登录密码"
					style="margin-top: 10px;"> <span
					class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="form-group has-success has-feedback">
				<select class="form-control" name="usertype" id="usertype">
					<option value="member">会员</option>
					<option value="user">管理</option>
				</select>
			</div>
			<div class="checkbox">
				<label> <input type="checkbox" value="remember-me">
					记住我
				</label> <br>
          		<label style="float:left;">
           			 <a onclick="editMessage()">忘记密码</a>
          		</label>
          		<label style="float:right;">
					<a href="${APP_PATH }/reg.htm">我要注册</a>
				</label>
				<br>
			</div>
			<a class="btn btn-lg btn-success btn-block" onclick="dologin()">
				登录</a>
		</form>
	</div>
	<script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/script/layer/layer.js"></script>
	<script>
		function dologin() {
			var loginacct = $("#loginacct");
			if ($.trim(loginacct.val()) == "") {
				//alert("登录账号不能为空，请输入");
				layer.msg("登录账号不能为空，请输入", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					loginacct.focus();
				});
				return;
			}
			var userpswd = $("#userpswd");
			if ($.trim(userpswd.val()) == "") {
				//alert("登录密码不能为空，请输入");
				layer.msg("登录密码不能为空，请输入", {
					time : 1000,
					icon : 5,
					shift : 6
				}, function() {
					userpswd.focus();
				});
				return;
			}
			// JS XMLHttpRequest
			var loadingIndex = -1;
		
			var url="";
			if("member" == $("#usertype").val()){
				url="${APP_PATH}/doMemberlogin.do";
			}else{
				url="${APP_PATH}/dologin.do";
			}
			$.ajax({
				url : url,
				type : "POST",
				data : {
					"loginacct" : loginacct.val(),
					"userpswd" : userpswd.val(),
					"usertype" : $("#usertype").val(),
				},

				beforeSend : function() {
					loadingIndex = layer.msg('处理中', {
						icon : 16
					});
					return true;
				},
				success : function(result) {
					layer.close(loadingIndex);
					if (result.success) {
						if ("member" == $("#usertype").val()) {
							window.location.href = "${APP_PATH}/member/member.htm";
						} else {
							window.location.href = "${APP_PATH}/main.htm";
						}
					} else {
						layer.msg(result.errorMsg, {
							time : 1000,
							icon : 5,
							shift : 6
						}, function() {
							return;
						});
					}
				},

			});
		}
		function editMessage(){
	    	$.ajax({
	    		url:"${APP_PATH}/user/getMessage.htm",
	        	type:"post",
	        	data:{
	        		"messageId":1
	        	},
	        	beforeSend:function(){
	        		var loadingIndex = layer.msg('查询中', {icon: 16});
	    			layer.close(loadingIndex);
	        	},
	        	success :function(result){
	        		window.location.href="${APP_PATH}/user/editpassword.htm";
	        	}
	    	});
	    };
	</script>
</body>
</html>