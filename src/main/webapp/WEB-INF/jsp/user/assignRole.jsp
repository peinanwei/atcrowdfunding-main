<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet"
	href="${APP_PATH }/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
<link rel="stylesheet" href="${APP_PATH }/css/main.css">
<link rel="stylesheet" href="${APP_PATH }/css/doc.min.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}
</style>
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<div>
					<a class="navbar-brand" style="font-size: 32px;" href="user.html">众筹平台
						- 用户维护</a>
				</div>
			</div>
			<%@include file="/WEB-INF/jsp/common/userinfo.jsp"%>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<%@include file="/WEB-INF/jsp/common/maininfo.jsp"%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
					<li><a href="#">首页</a></li>
					<li><a href="#">数据列表</a></li>
					<li class="active">分配角色</li>
				</ol>
				<div class="panel panel-default">
					<div class="panel-body">
						<form role="form" class="form-inline">
							<div class="form-group">
								<label for="exampleInputPassword1">未分配角色列表</label><br> 
								<select id="leftList" class="form-control" multiple size="10"
									style="width: 200px; overflow-y: auto;">
									<c:forEach items="${unAssignRoles}" var="role">
									<option value="${role.id} " class="doubleLeft">${role.name }</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<ul>
									<li id="left2RightBtn" class="btn btn-default glyphicon glyphicon-chevron-right"></li>
									<br>
									<li id="right2LeftBtn" class="btn btn-default glyphicon glyphicon-chevron-left"
										style="margin-top: 20px;"></li>
								</ul>
							</div>
							<div class="form-group" style="margin-left: 40px;">
								<label for="exampleInputPassword1">已分配角色列表</label><br>
								<select id="rightList" class="form-control" multiple size="10"
									style="width: 200px; overflow-y: auto;">
									<c:forEach items="${assignRoles}" var="role">
									<option value="${role.id}" class="doubleRight">${role.name }</option>
									</c:forEach>
								</select>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">帮助</h4>
				</div>
				<div class="modal-body">
					<div class="bs-callout bs-callout-info">
						<h4>测试标题1</h4>
						<p>测试内容1，测试内容1，测试内容1，测试内容1，测试内容1，测试内容1</p>
					</div>
					<div class="bs-callout bs-callout-info">
						<h4>测试标题2</h4>
						<p>测试内容2，测试内容2，测试内容2，测试内容2，测试内容2，测试内容2</p>
					</div>
				</div>
				
		<!--   <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary">Save changes</button>
		  </div>
		  -->
			</div>
		</div>
	</div>
	<script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/script/docs.min.js"></script>
	<script src="${APP_PATH}/script/layer/layer.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".list-group-item").click(function() {
				if ($(this).find("ul")) {
					$(this).toggleClass("tree-closed");
					if ($(this).hasClass("tree-closed")) {
						$("ul", this).hide("fast");
					} else {
						$("ul", this).show("fast");
					}
				}
			});
			
		});
		
		$("#left2RightBtn").click(left);
		
		$(".doubleLeft").dblclick(function(){
			left();
			$(this).removeClass("doubleLeft");
			$(this).addClass("doubleRight");
		});
			
		
		
		
		$("#right2LeftBtn").click(right);

		$(".doubleRight").dblclick(function(){
			right();
			$(this).removeClass("doubleRight");
			$(this).addClass("doubleLeft"); 
			
		});
		
		
		function left(){
			var selOptions = $("#leftList :selected");
			if(selOptions.length == 0){
				layer.msg("请选择需要分配的角色", {time:1000, icon:6, shift:6});
			}else{
				var dataobj = {
						"userId":"${user.id}"
				};
				
				$.each(selOptions, function(i,role){
					dataobj["dataIds["+i+"]"] = role.value;
				});
				$.ajax({
	    			url : "${APP_PATH}/user/assign.do",
	    			type : "POST",
	    			data : dataobj,
	    			success : function(result) {
	    				if ( result.success ) {
	    					layer.msg("角色分配成功", {time:1000, icon:6}, function(){
	    						$("#rightList").append(selOptions).end();
	    					});
	    				} else {
	    					layer.msg("角色分配失败", {time:1000, icon:5, shift:6});
	    				}
	    			}
	    		});
			}
		};
		
		
		function right(){
			var selOptions = $("#rightList :selected");
			if(selOptions.length == 0){
				layer.msg("请选择需要移除的角色", {time:1000, icon:6, shift:6});
			}else{
				var dataObj = {
						"userId":"${user.id}"
				};
				
				$.each(selOptions, function(i,role){
					dataObj["dataIds["+i+"]"] = role.value;
				});
				$.ajax({
	    			url : "${APP_PATH}/user/deleteAssign.do",
	    			type : "POST",
	    			data : dataObj,
	    			success : function(result) {
	    				if ( result.success ) {
	    					layer.msg("角色移除成功", {time:1000, icon:6}, function(){
	    						$("#leftList").append(selOptions).end();
	    					});
	    				} else {
	    					layer.msg("角色移除失败", {time:1000, icon:5, shift:6});
	    				}
	    			}
	    		});
			}
		};
		
		
		
		
		
		
		
	</script>
</body>
</html>
