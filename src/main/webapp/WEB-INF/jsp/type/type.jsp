<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}

table tbody tr:nth-child(odd) {
	background: #F4F4F4;
}

table tbody td:nth-child(even) {
	color: #C00;
}

input[type=checkbox] {
	width: 18px;
	height: 18px;
}
</style>
</head>

<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<div>
					<a class="navbar-brand" style="font-size: 32px;" href="">众筹平台
						- 分类管理</a>
				</div>
				<%@include file="/WEB-INF/jsp/common/userinfo.jsp"%>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<%@include file="/WEB-INF/jsp/common/maininfo.jsp"%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 数据矩阵
						</h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th>名称</th>
									<c:forEach items="${types}" var="type">
										<th accttype="${type.id}">${type.name}</th>
									</c:forEach>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${certs}" var="cert">
										<tr>
											<td>${cert.name }</td>
											<td><input certid="${cert.id}" accttype="0" type="checkbox"></td>
											<td><input certid="${cert.id}" accttype="1" type="checkbox"></td>
											<td><input certid="${cert.id}" accttype="2" type="checkbox"></td>
											<td><input certid="${cert.id}" accttype="3" type="checkbox"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/script/docs.min.js"></script>
	<script src="${APP_PATH}/script/layer/layer.js"></script>
	 <script type="text/javascript" src="${APP_PATH}/script/menu.js"></script>
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
		
		//前面的是判断后面的是将jQuery对象转换成dom对象
		<c:forEach items="${maps}" var="map">
			$(":checkbox[certid='${map.certid}'][accttype='${map.accttype}']")[0].checked=true;
		</c:forEach>
		
		$(":checkbox").click(function(){
			var flg = this.checked;
			var certid = $(this).attr("certid");
			var accttype = $(this).attr("accttype");
				if(flg){
					$.ajax({
						type:"post",
						url:"${APP_PATH}/type/insertAcctTypeCert.do",
						data :{
							certid:certid,
							accttype:accttype
						},
						success:function(result){
							if(!result.success){
								layer.msg("分类关系保存失败", {time:1000, icon:5, shift:6});
							}
						}
					});
				}else{
					$.ajax({
						type:"post",
						url:"${APP_PATH}/type/deleteAcctTypeCert.do",
						data :{
							certid:certid,
							accttype:accttype
						},
						success:function(result){
							if(!result.success){
								layer.msg("分类关系删除失败", {time:1000, icon:5, shift:6});
							}
						}
					});
			}
		});
	</script>
</body>
</html>