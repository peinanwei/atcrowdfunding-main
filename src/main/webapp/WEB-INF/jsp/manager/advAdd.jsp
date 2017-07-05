<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<li class="active">新增</li>
				</ol>
				<div class="panel panel-default">
					<div class="panel-heading">
						表单数据
						<div style="float: right; cursor: pointer;" data-toggle="modal"
							data-target="#myModal">
							<i class="glyphicon glyphicon-question-sign"></i>
						</div>
					</div>
					<div class="panel-body">
						<form id="advertForm" method="post" enctype="multipart/form-data">
							<input type="hidden" id="advertStatus" name="status" value="1">
							<div class="form-group">
								<label for="exampleInputPassword1">名称</label> <input type="text"
									class="form-control" id="advertName" name="name"
									placeholder="请输入广告名称">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">链接地址</label> <input
									type="text" class="form-control" id="advertUrl" name="url"
									placeholder="请输入链接地址">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">广告图片</label> <input
									type="file" class="form-control" id="advertUrl" name="advPic"
									placeholder="请输入链接地址">
							</div>
							<button id="saveBtn" type="button" class="btn btn-success">
								<i class="glyphicon glyphicon-plus"></i> 新增
							</button>
							<button id="insertBtn" type="button" class="btn btn-success">
								<i class="glyphicon glyphicon-plus"></i> 提交
							</button>
							<button type="button" class="btn btn-danger">
								<i class="glyphicon glyphicon-refresh"></i> 重置
							</button>
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
				<!--
		  <div class="modal-footer">
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
	<script src="${APP_PATH }/jquery/jquery.form.js"></script>
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
		
		/*  异步提交表单*/
		$("#insertBtn").click(function(){
			var loadingIndex = -1;
			var options ={
					url:"${APP_PATH}/manager/advInsert.do",
					beforeSubmit:function(){
						loadingIndex = layer.msg('数据保存中，请稍后！', {icon: 16});
					},
					success:function(result){
						layer.close(loadingIndex);
						window.location.href="${APP_PATH}/manager/advertisement.htm";
					},
				}
				$("#advertForm").ajaxSubmit(options);
				return ;
			});
			
			
			
			//提交表单
			/*var id = ${loginUser.id};
			 $.ajax({
				url:"${APP_PATH}/manager/advInsert.do",
				type:"POST",
				data:{
					"name" : $("#name").val(),
					"iconPath" : $("#iconpath").val(),
					"url" : $("#url").val(),
					"status" : $("#status").val(),
					"userId" : id
				},
				beforeSend:function(){
					loadingIndex = layer.msg('数据保存中，请稍后！', {icon: 16});
					return true;
				},
				success : function( result ) {
					layer.close(loadingIndex);
        			if ( result.success ) {
        				layer.msg("用户保存成功", {time:1000, icon:6, shift:6},function(){
        					window.location.href="${APP_PATH}/manager/advertisement.htm";
        				});
        			}else{
        				layer.msg("用户保存失败请再试一次", {time:1000, icon:5, shift:6});
        			}
				}
			}); */
			
		
	</script>
</body>
</html>
