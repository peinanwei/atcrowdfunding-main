<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
						- 项目分类</a>
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
										placeholder="请输入查询条件" id="queryText">
								</div>
							</div>
							<button onclick = "queryProject()" type="button" class="btn btn-warning">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</form>
						<button type="button" onclick = "deleteProjects()" class="btn btn-danger"
							style="float: right; margin-left: 10px;">
							<i class=" glyphicon glyphicon-remove"></i> 删除
						</button>
						<button type="button" class="btn btn-primary"
							style="float: right;" onclick="window.location.href='${APP_PATH}/project/form.htm'">
							<i class="glyphicon glyphicon-plus"></i> 新增
						</button>
						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th width="30"><input type="checkbox" onclick = "allSel(this)"></th>
										<th width="300">分类名称</th>
										<th>简介</th>
										<th width="100">操作</th>
									</tr>
								</thead>
								<tbody >
								<!-- 	
									<tr>
										<td>3</td>
										<td><input type="checkbox"></td>
										<td>电子</td>
										<td>xxxxx</td>
										<td>
											<button type="button" class="btn btn-primary btn-xs">
												<i class=" glyphicon glyphicon-pencil"></i>
											</button>
											<button type="button" class="btn btn-danger btn-xs">
												<i class=" glyphicon glyphicon-remove"></i>
											</button>
										</td>
									</tr> -->

								</tbody>
								<tfoot>
									<tr>
										<td colspan="6" align="center">
											<ul class="pagination">
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
			  <c:if test="${empty param.pageNo}">
			    pageQuery(1);
			    </c:if>
			    <c:if test="${not empty param.pageNo}">
			    pageQuery(${param.pageNo});
			    </c:if>
		});
		
		  function changepageNo( pageNo ) {
          	pageQuery(pageNo);
          }
		  
		 function pageQuery(pageNo) {
         	var loadingIndex = -1;
         	// 使用AJAX异步分页查询用户数据
         		var obj = {
           			"pageNo" : pageNo,
           			"pageSize" : 2,
            	};
         	if(cond){
         		obj.pageText = $("#queryText").val();
         	}
         	$.ajax({
         		url : "${APP_PATH}/project/pageQuery.do",
         		type : "POST",
         		data : obj,
         		beforeSend : function() {
         			loadingIndex = layer.msg('数据查询中', {icon: 16});
         			return true;
         		},
         		success : function( result ) {
         			layer.close(loadingIndex);
         			if ( result.success ) {
         				// 将查询结果循环遍历，将数据展现出来
         				var pageObj = result.pageObj;
         				var projectList = pageObj.datas;
         				console.log(projectList);
         				
         				var content = "";
         				$.each(projectList, function(i, project){
         					// 循环体
         					
         					// 相同类型的引号不能嵌套使用
         					// "a'b'c"
         					// 'a"b"c'
         				        content += '	<tr> ';
								content += '		<td>1</td>';
								content += '		<td><input type="checkbox" value="'+project.id+'"></td>';
								content += '		<td>'+project.name+'</td> ';
								content += '		<td>'+project.remark+'</td> ';
								content += '		<td> ';
								content += '			<button type="button" onclick="window.location.href=\'${APP_PATH}/project/edit.htm?pageNo='+pageObj.pageNo+'&id='+project.id+'\'" class="btn btn-primary btn-xs"> ';
								content += '				<i class=" glyphicon glyphicon-pencil"></i> ';
								content += '			</button>  ';
								content += '			<button type="button" onclick = "deleteProject('+project.id +',\''+project.name+'\')" class="btn btn-danger btn-xs">';
								content += '				<i class=" glyphicon glyphicon-remove"></i>';
								content += '			</button>';
								content += '		</td>';
								content += '   </tr>';
          				
								/* 
								   content = content +  '<tr>';
          	                   content = content +  '  <td>'+(i+1)+'</td>';
          					   content = content +  '  <td><input type="checkbox" value="'+user.id+'"></td>';
          	                   content = content +  '  <td>'+user.loginacct+'</td>';
          	                   content = content +  '  <td>'+user.username+'</td>';
          	                   content = content +  '  <td>'+user.email+'</td>';
          	                   content = content +  '  <td>';
          					   content = content +  '      <button type="button" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>';
          					   content = content +  '      <button type="button" onclick="window.location.href=\'${APP_PATH}/user/edit.htm?pageNo='+pageObj.pageNo+'&id='+user.id+'\'" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>';
          					   content = content +  '	  <button type="button" onclick= "deleteUser('+user.id +',\''+user.loginacct+'\')"  class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
          					   content = content +  '  </td>';
          	                   content = content +  '</tr>';
          	                   */
         				});
         				
         				var pageContent = "";
         				
         				if ( pageObj.pageNo != 1 ) {
         					pageContent = pageContent + '<li><a href="#" onclick="changepageNo('+(pageObj.pageNo-1)+')">上一页</a></li>';
         				}
         				for ( var i = 1; i <= pageObj.totalNo; i++ ) {
         					if ( i == pageObj.pageNo ) {
         						pageContent = pageContent + '<li class="active"><a href="#" onclick="changepageNo('+i+')">'+i+'</a></li>';	
         					} else {
         						pageContent = pageContent + '<li><a href="#" onclick="changepageNo('+i+')">'+i+'</a></li>';
         					};
         				}
         				if ( pageObj.pageNo != pageObj.totalNo ) {
         					pageContent = pageContent + '<li><a href="#" onclick="changepageNo('+(pageObj.pageNo+1)+')">下一页</a></li>';
         				}
         				
         				$(".pagination").html(pageContent);
         				
         				$("tbody").html(content);
         			} else {
         				layer.msg("用户分页查询数据失败", {time:1000, icon:5, shift:6});
         			};
         		}
         	});
         }
		 var cond = false;
		  function queryProject() {
          	var queryText = $("#queryText");
          	if ( queryText.val() == "" ) {
          		layer.msg("查询条件不能为空，请输入", {time:1000, icon:5, shift:6}, function(){
          			queryText.focus();
          		});
          		return;
          	}
          	cond = true;
          	pageQuery(1);
          }
		  
	         function deleteProject(id ,name){
	        	   layer.confirm("确定要删除:"+name +"用户吗？",  {icon: 3, title:'提示'}, function(cindex){
	        		   $.ajax({  
	        				url : "${APP_PATH}/project/delete.do",
	    					type : "POST",
	    					data  : {id : id},
	    					success : function(result) {
	    						if ( result.success ) {
	                				layer.msg("用户信息删除成功", {time:1000, icon:6}, function(){
	                					pageQuery(1);
	                				});
	    						} else {
	    							layer.msg("用户信息删除失败", {time:1000, icon:5, shift:6});
	    						}
	    					}
	        		  
	        			   });
	   			    layer.close(cindex);
	   			}, function(cindex){
	   				
	   			    layer.close(cindex);
	   			});
	           }
		  
	         function allSel( obj ) {
	            	// 获取全选框的勾选状态
	            	var flg = obj.checked;
	            	
	            	var userBox = $("tbody :checkbox");
	            	
	            	$.each(userBox, function(i, n){
	            		n.checked = flg;
	            	});
	            }
	         function deleteProjects(){
	        	 var checkBox = $("tbody :checked");
	            	if ( checkBox.length == 0 ) {
	            		layer.msg("请选择需要删除的用户数据", {time:1000, icon:5, shift:6});
	            	} else {
	        			layer.confirm("删除选择的用户数据, 是否继续？",  {icon: 3, title:'提示'}, function(cindex){
	        				// 删除数据
	        				var obj = {}
	        				$.each(checkBox, function(i, n){
	        					obj["datas["+i+"].id"] = n.value;
	        				});
	        				$.ajax({
	        					url : "${APP_PATH}/project/deletes.do",
	        					type : "POST",
	        					data  : obj,
	        					success : function(result) {
	        						if ( result.success ) {
	                    				layer.msg("用户信息删除成功", {time:1000, icon:6}, function(){
	                    					pageQuery(1);
	                    				});
	        						} else {
	        							layer.msg("用户信息删除失败", {time:1000, icon:5, shift:6});
	        						}
	        					}
	        				});
	        				
	        				
	        			    layer.close(cindex);
	        			}, function(cindex){
	        			    layer.close(cindex);
	        			});
	            	}
	         }
	</script>
</body>
</html>
