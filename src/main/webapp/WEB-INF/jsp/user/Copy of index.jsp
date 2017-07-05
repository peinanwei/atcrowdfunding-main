<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<div>
					<a class="navbar-brand" style="font-size: 32px;" href="#">众筹平台
						- 控制面板</a>
				</div>
			</div>
			<%@include file="/WEB-INF/jsp/common/userinfo.jsp"%>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<%@include file="/WEB-INF/jsp/common/maininfo.jsp"%>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 数据列表
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" role="form" style="float: left;">
							<div class="form-group has-feedback">
								<div class="input-group">
									<div class="input-group-addon">查询条件</div>
									<input class="form-control has-success" type="text"
										placeholder="请输入查询条件">
								</div>
							</div>
							<button type="button" class="btn btn-warning">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</form>
						<button type="button" class="btn btn-danger"
							style="float: right; margin-left: 10px;" onclick="doDelete()">
							<i class=" glyphicon glyphicon-remove"></i> 删除
						</button>
						<button type="button" class="btn btn-primary"
							style="float: right;"
							onclick="window.location.href='${APP_PATH}/user/add.htm'">
							<i class="glyphicon glyphicon-plus"></i> 新增
						</button>
						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th width="30"><input type="checkbox"></th>
										<th>账号</th>
										<th>名称</th>
										<th>邮箱地址</th>
										<th width="100">操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${userPage.datas}" var="user"
										varStatus="status">
										<tr>
											<td>${status.count }</td>
											<td><input type="checkbox" name="selected"
												value="${user.id }" onclick="doDelete"></td>
											<td>${user.loginacct }</td>
											<td>${user.username }</td>
											<td>${user.email }</td>
											<td>
												<button type="button" class="btn btn-success btn-xs">
													<i class=" glyphicon glyphicon-check"></i>
												</button>
												<button type="button" class="btn btn-primary btn-xs">
													<i class=" glyphicon glyphicon-pencil"></i>
												</button>
												<button type="button" class="btn btn-danger btn-xs"
													onclick="doDelete()">
													<i class=" glyphicon glyphicon-remove"></i>
												</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="6" align="center">
											<ul class="pagination">
												<c:if test="${userPage.pageNo != 1 }">
													<li><a href="${APP_PATH }/user/index.htm?pageNo=1">首页</a></li>
													<li><a
														href="${APP_PATH }/user/index.htm?pageNo=${userPage.pageNo - 1 }">上一页</a></li>
												</c:if>
												<!-- 设置两个变量 begin 和 end -->
												<!-- 1.总页数小于 5 时 -->
												<!-- 2.当前页小于等于 3 时 -->
												<!-- 3.当前页大于 3 时 -->
												<!-- 注意：当end大于总页数时这种情况 -->
												<c:choose>
													<c:when test="${userPage.totalNo < 5 }">
														<c:set var="begin" value="1"></c:set>
														<c:set var="end" value="${userPage.totalNo }"></c:set>
													</c:when>
													<c:when test="${userPage.pageNo <=3  }">
														<c:set var="begin" value="1"></c:set>
														<c:set var="end" value="5"></c:set>
													</c:when>
													<c:otherwise>
														<c:set var="begin" value="${userPage.pageNo - 2 }"></c:set>
														<c:set var="end" value="${userPage.pageNo + 2 }"></c:set>
														<c:if test="${end > userPage.totalNo }">
															<c:set var="begin" value="${userPage.totalNo - 4 }"></c:set>
															<c:set var="end" value="${userPage.totalNo}"></c:set>
														</c:if>
													</c:otherwise>
												</c:choose>
												<c:forEach begin="${begin }" end="${end }" var="index">
													<%-- <c:if test="${userPage.pageNo == index }">
														<li class="active"><a>${index }<span class="sr-only">(current)</span>
														</a></li>
													</c:if>
													<c:if test="${userPage.pageNo != index }">
														<li><a
															href="${APP_PATH }/user/index.htm?pageNo=${index }">${index }</a></li>
													</c:if> --%>
													<li
														<c:if test="${userPage.pageNo eq index }">
													class="active"
													</c:if>><a href="${APP_PATH }/user/index.htm?pageNo=${index }">${index }<span
															class="sr-only">(current)</span>
												</c:forEach>
												<c:if test="${userPage.pageNo != userPage.totalNo }">
													<li><a
														href="${APP_PATH }/user/index.htm?pageNo=${userPage.pageNo + 1 }">下一页</a></li>
													<li><a
														href="${APP_PATH }/user/index.htm?pageNo=${userPage.totalNo }">末页</a></li>
												</c:if>
											</ul>
										</td>
									</tr>

								</tfoot>
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
		$("tbody .btn-success").click(function() {
			window.location.href = "${APP_PATH}/user/assignRole.htm";
		});
		$("tbody .btn-primary").click(function() {
			window.location.href = "${APP_PATH}/user/edit.htm";
		});
	</script>
	<script>
		function doDelete() {
			window.location.href = "${APP_PATH}/user/delete.do?arr=${'input:checked'}";
		};
	</script>
</body>
</html>
