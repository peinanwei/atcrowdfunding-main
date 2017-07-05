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
<link rel="stylesheet" href="${APP_PATH}/css/pagination.css">
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
						- 流程管理</a>
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

						<button id="uploadProcessFile" type="button" class="btn btn-primary" style="float: right;">
							<i class="glyphicon glyphicon-upload"></i> 上传流程定义文件
						</button>
						<form id="uploadForm"  method="post" enctype="multipart/form-data" >
							<input id="procDefFile" name="procDefFile" style="display: none;" type="file" >
						
						</form>
						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th width="30"><input type="checkbox" onclick="allSel(this)"></th>
										<th>流程名称</th>
										<th>KEY</th>
										<th>VERSION</th>
										<th width="100">操作</th>
									</tr>
								</thead>
								<tbody>
								
								</tbody>
								<tfoot>
									<tr>
										<td colspan="6" align="center">
											<div id="Pagination" class="pagination">
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
	<script src="${APP_PATH	}/script/layer/layer.js"></script>
	<script src="${APP_PATH	}/jquery/jquery.pagination.js"></script>
	<script src="${APP_PATH }/jquery/jquery.form.js"></script>
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
			pageQuery(0);
		});
		
		$("#uploadProcessFile").click(function(){
			$("#procDefFile").click();
		});
		$("#procDefFile").change(function(){
			var loadingIndex = -1;
			var options ={
				url:"${APP_PATH}/process/uploadProcDefFile.do",
				beforeSubmit:function(){
					loadingIndex = layer.msg('流程定义文件提交中，请稍后！', {icon: 16});
				},
				success:function(result){
					layer.close(loadingIndex);
					//重置文件域对象
					$("#uploadForm")[0].reset();
					if(result.success){
						layer.msg("流程文件上传成功", {time:1000, icon:6, shift:6});
						pageQuery(0);
					}else{
						layer.msg("流程文件上传失败", {time:1000, icon:5, shift:6});
					}
				},
				
			}
			$("#uploadForm").ajaxSubmit(options);
		});
		
		
		var pageSize=8;
		function pageQuery(pageIndex) {
        	
        	var loadingIndex = -1;
        	
        	var obj = {
       			"pageNo" : pageIndex+1,
       			"pageSize" : pageSize
        	};
        	
        	$.ajax({
        		url : "${APP_PATH}/process/pageQuery.do",
        		type : "POST",
        		data : obj,
        		beforeSend : function() {
        			loadingIndex = layer.msg('数据查询中', {icon: 16});
        			return true;
        		},
        		success : function( result ) {
        			layer.close(loadingIndex);
        			if ( result.success ) {
        				layer.msg("用户分页查询数据成功", {time:1000, icon:6, shift:6});
        				var pageObj = result.pageObj;
        				var procDefList = pageObj.datas;
        				
        				var content = "";
        				/* 放入的map集合,此时的procDef不是对象,是一个个map集合,
        				用点的方式也可以拿到属性,如果用对象会出现一个圈的情况,一个对象关联了另一个对象 */
        				$.each(procDefList, function(i, procDef){
         				   content = content +  '<tr>';
      	                   content = content +  '  <td>'+(i+1)+'</td>';
      					   content = content +  '  <td><input type="checkbox" value="'+procDef.id+'"></td>';
      	                   content = content +  '  <td>'+procDef.name+'</td>';
      	                   content = content +  '  <td>'+procDef.key+'</td>';
      	                   content = content +  '  <td>'+procDef.version+'</td>';
      	                   content = content +  '  <td>';
      					   content = content +  '      <button type="button" onclick="window.location.href=\'${APP_PATH}/process/showprocess.htm?id='+procDef.id+'\'" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-eye-open"></i></button>';
      					   content = content +  '	  <button type="button"  onclick="deleteAdv('+procDef.id+',\''+procDef.name+'\')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
      					   content = content +  '  </td>';
      	                   content = content +  '</tr>';
        				});
        				
        				$("#Pagination").pagination(pageObj.totalSize, {
        					num_edge_entries: 2, //边缘页数
        					num_display_entries: 4, //主体页数
        					callback: pageQuery,
        					items_per_page:pageSize, //每页显示1项
        					current_page : pageIndex,
        					prev_text:"上一页",
        					next_text:"下一页"
        				});
        				$("tbody").html(content);
        				
        			} else {
        				layer.msg("用户分页查询数据失败", {time:1000, icon:5, shift:6});
        			};
        		}
        	});
        }
	</script>
</body>
</html>
