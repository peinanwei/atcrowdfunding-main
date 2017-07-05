<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty loginUser }">
	<div id="navbar" class="navbar-collapse collapse" style="float: right;">
		<ul class="nav navbar-nav">
				<li><a href="${APP_PATH}/login.htm">登录</a></li>
				<li><a href="${APP_PATH}/reg.htm">注册</a></li>
		</ul>
	</div>

</c:if>
<c:if test="${not empty loginUser}">
	<div id="navbar" class="navbar-collapse collapse" style="float: right;">
		<ul class="nav navbar-nav">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i>
					${loginUser.username }<span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="${APP_PATH}/user/member.htm"><i
							class="glyphicon glyphicon-scale"></i> 会员中心</a></li>
					<li><a href="#"><i class="glyphicon glyphicon-comment"></i>
							消息</a></li>
					<li class="divider"></li>
					<li><a href="${APP_PATH }/exit.htm"><i
							class="glyphicon glyphicon-off"></i> 退出系统</a></li>
				</ul></li>
		</ul>
	</div>
</c:if>
