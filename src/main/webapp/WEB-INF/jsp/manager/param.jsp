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
						- 参数管理</a>
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
									<input id="queryText" class="form-control has-success" type="text"
										placeholder="请输入查询条件">
								</div>
							</div>
							<button onclick="queryParam()" type="button" class="btn btn-warning">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</form>
						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th>名称</th>
										<th>代码</th>
										<th>值</th>
										<th width="100">操作</th>
									</tr>
								</thead>
								<tbody>
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
			 pageQuery();
		});
		
		function updateParam(obj,i,id){
			var con = '<td><input name="val" value="'+ obj +'" type="text">';
			con +=  '<button type="button"  onclick="doUpdate('+id +')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-check"></i></button></td>';
			$("#"+i).replaceWith(con);
		}
		
		function doUpdate(id){
			var val =$("input[name='val'").val();
			$.ajax({
				url : "${APP_PATH}/manager/paramUpdateVal.do",
        		type : "POST",
        		data : {
        			"id" : id,
        			"val": val
        		},
        		beforeSend : function() {
        			loadingIndex = layer.msg('数据更新中', {icon: 16});
        			return true;
        		},
        		success : function( result ) {
        			layer.close(loadingIndex);
        			if ( result.success ) {
        				layer.msg("更新数据成功", {time:1000, icon:6, shift:6});
        				pageQuery();
        				}else{
        					layer.msg("更新数据失败", {time:1000, icon:5, shift:6});
        				}
        			}
			});
		}
		
		function pageQuery() {
        	var loadingIndex = -1;
        	// 使用AJAX异步分页查询用户数据
        	
        	var obj = {};
        	if ( cond ) {
        		// 增加模糊查询参数
        		obj.pageText = $("#queryText").val();
        	}
        	
        	$.ajax({
        		url : "${APP_PATH}/manager/paramQuery.do",
        		type : "POST",
        		data : obj,
        		beforeSend : function() {
        			loadingIndex = layer.msg('数据查询中', {icon: 16});
        			return true;
        		},
        		success : function( result ) {
        			layer.close(loadingIndex);
        			if ( result.success ) {
        				layer.msg("查询数据成功", {time:1000, icon:6, shift:6});
        				// 将查询结果循环遍历，将数据展现出来
        				var pageObj = result.pageObj;
        				var paramList = pageObj.datas;
        				
        				var content = "";
        				$.each(paramList, function(i, par){
        					content += '<tr>';
							content += '	<td>'+ i +'</td>';
							content += '	<td>'+ par.name +'</td>';
							content += '	<td>'+ par.code  +'</td>';
							content += '	<td id="'+ i +'">'+ par.val  +'</td>';
							content += '	<td>';
							content += '		<button type="button" onclick="updateParam('+par.val+','+ i + ',' +par.id +')" class="btn btn-primary btn-xs">';
							content += '			<i class=" glyphicon glyphicon-pencil"></i>';
							content += '		</button>';
							content += '	</td>';
							content += '</tr>';
        				});
        				$("tbody").html(content);
        			} else {
        				layer.msg("用户分页查询数据失败", {time:1000, icon:5, shift:6});
        			};
        		}
        	});
        }
        var cond = false;
        function queryParam() {
        	var queryText = $("#queryText");
        	if ( queryText.val() == "" ) {
        		layer.msg("查询条件不能为空，请输入", {time:1000, icon:5, shift:6}, function(){
        			queryText.focus();
        		});
        		return;
        	}
        	cond = true;
        	pageQuery();
        };
			
	</script>
</body>
</html>
