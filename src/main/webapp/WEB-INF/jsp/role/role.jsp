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
						- 角色维护</a>
				</div>
			</div>
			<%@include file="/WEB-INF/jsp/common/userinfo.jsp"%>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<%@include file="/WEB-INF/jsp/common/maininfo.jsp"%>
			
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
			  </div>
			  <div class="panel-body">
		<form class="form-inline" role="form" style="float:left;">
		  <div class="form-group has-feedback">
		    <div class="input-group">
		      <div class="input-group-addon">查询条件</div>
		      <input id="queryTest" class="form-control has-success" type="text" placeholder="请输入查询条件">
		    </div>
		  </div>
		  <button onclick="queryRole()" type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
		</form>
		<button type="button" class="btn btn-danger" style="float:right;margin-left:10px;" onclick="deleteRoles()"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
		<button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='${APP_PATH}/role/form.htm'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
		<br>
 	<hr style="clear:both;">
          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30">#</th>
				  <th width="30"><input type="checkbox" onclick="allSel(this)"></th>
                  <th>名称</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody>
              
               <!-- <tr>
                  <td>1</td>
				  <td><input type="checkbox"></td>
                  <td>PM - 项目经理</td>
                  <td>
				      <button type="button" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>
				      <button type="button" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>
					  <button type="button" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>
				  </td>
                </tr> -->
               
              </tbody>
			  <tfoot>
			     <tr >
				     <td colspan="6" align="center">
						<ul class="pagination">
							<!-- 	<li class="disabled"><a href="#">上一页</a></li>
								<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">下一页</a></li> -->
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
	<script src="${APP_PATH }/script/layer/layer.js"></script>
	<script type="text/javascript" src="${APP_PATH}/script/menu.js"></script>
        <script type="text/javascript">
            $(function () {
			    $(".list-group-item").click(function(){
				    if ( $(this).find("ul") ) {
						$(this).toggleClass("tree-closed");
						if ( $(this).hasClass("tree-closed") ) {
							$("ul", this).hide("fast");
						} else {
							$("ul", this).show("fast");
						}
					}
				});
			    //页面加载后完成后就执行
			    pageQueryRole(1);
            });
            
            $("tbody .btn-success").click(function(){
                window.location.href = "${APP_PATH }/manager/assignPermission.htm";
            });
            
            function changePageno (pageNo ){
          	  pageQueryRole(pageNo);
             };
           //查询页面方法
             function pageQueryRole(pageNo){
            	
             var loadingIndex =-1;
             //定义变量添加动态数据
          	var obj ={
                 		"pageNo":pageNo,
            	 		"pageSize":10
                    }; 
             //根据cond的bollean值动态的添加动态查询的条件
          	if(cond){
         	   //增加模糊查询参数
         	   obj.pagetext=$("#queryTest").val();
            }
          
             //ajax方法
          	 	$.ajax({
          	 		url:"${APP_PATH}/role/pageQueryRole.do",
          	 		type:"POST",
          	 		data:obj,
          	 		beforeSend: function(){
          	 			loadingIndex = layer.msg('数据查询中', {icon: 16});
          	 		},	
          	 		success:function(result){
          	 			layer.close(loadingIndex);
              			if ( result.success ) {
              				// 将查询结果循环遍历，将数据展现出来
              				var pageObj = result.pageObj;
              				var roleList = pageObj.datas;
              				//集合中元素拼接并放在的tr
              				var content = "";
              				$.each(roleList, function(i, role){
              			content+='	 <tr>';
              	        content+='     <td>'+(i+1)+'</td>';
              			content+='	  <td><input type="checkbox" value="'+role.id+'" ></td>';
              	        content+='     <td>'+role.name+'</td>';
              	        content+='     <td>';
              			content+='	      <button type="button" onclick="window.location.href=\'${APP_PATH}/role/assignPermission.htm?roleid='+role.id+'\'" class="btn btn-success btn-xs"  ><i class=" glyphicon glyphicon-check"></i></button>';
              			content+='	      <button type="button" onclick="window.location.href=\'${APP_PATH}/role/edit.htm?pageNo='+pageObj.pageNo+'&id='+role.id+'\'" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>';
              			content+='		  <button type="button" onclick="deleteRole('+role.id+',\''+role.name+'\')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
              			content+='	  </td>';
              	        content+='   </tr>';
              				});
              				//分页的拼接
              				var pageContent="";
              				   if(pageObj.pageNo ==1 ){
              					pageContent+= '<li class="disabled"><a href="#">上一页</a></li>';
              				}else{
              					pageContent = pageContent + '<li><a href="#" onclick="changePageno('+(pageObj.pageNo-1)+')">上一页</a></li>';
              				}
  							for(var i =1;i<= pageObj.totalNo ;i++){
  								if(pageNo==i){
  								pageContent+='<li class="active"><a href="#" onclick="changePageno('+i+')">'+i+'</a></li>';
  								}else{
  								pageContent+='<li ><a href="#" onclick="changePageno('+i+')">'+i+'</a></li>';
  								}
  	            			}
  							  if(pageObj.totalNo != pageObj.pageNo){
  								pageContent+='<li><a href="#" onclick="changePageno('+(pageObj.pageNo+1)+')">下一页</a></li>';
  							}else{
  								  pageContent+='<li class="disabled"><a href="#">下一页</a></li>';
  							}
  							  
  							$(".pagination").html(pageContent);
              				$("tbody").html(content);
          	 				
          	 			}else{
          	 				layer.msg("分页数据查询失败", {time:1000, icon:6, shift:6});
          	 			};
          	 		},
          	 	});  
             };
             
             //模糊查询
             var cond =false;
             function queryRole(){
            	 var queryTest = $("#queryTest");
          	   if(queryTest.val()==""){
          		   layer.msg("查询条件不能为空!", {time:1000, icon:5, shift:6}, function(){
          			   queryTest.focus();
                 		});
             		return;
          	   }
          	   cond =true;
          	   pageQueryRole(1);
             };
             
             //删除单行数据
             function deleteRole(id,name){
            	 alert(id);
  	        	   layer.confirm("是否删除"+name+"继续操作?",  {icon: 3, title:'提示'}, function(cindex){
  	        		   //确定删除部分
  	        		   $.ajax({
  	        			   url:"${APP_PATH}/role/delete.do",
  	        			   type:"POST",
  	        			   data:{
  	        				   id:id
  	        			   },
  	        			   success:function(result){
  	        				   if(result.success){
  	        					   layer.msg("数据删除成功", {time:1000, icon:6, shift:6});
  	        					   pageQueryRole(1);
  	        				   }else{
  	        					   layer.msg("数据删除失败", {time:1000, icon:5, shift:6});
  	        				   }
  	        			   }
  	        		   });
  	   			    layer.close(cindex);
  	   			}, function(cindex){
  	   			    layer.close(cindex);
  	   			}); 
             };
             
             function allSel( obj ) {
                	// 获取全选框的勾选状态
                	var flg = obj.checked;
                	
                	var roleBox = $("tbody :checkbox");
                	
                	$.each(roleBox, function(i, n){
                		n.checked = flg;
                	});
                }
             
             //批量删除
             function deleteRoles() {
          	   var checkBox = $("tbody :checked");
             	if ( checkBox.length == 0 ) {
             		layer.msg("请选择需要删除的用户数据", {time:1000, icon:5, shift:6});
             	} else {
          	 		layer.confirm("确认继续删除 ",  {icon: 3, title:'提示'}, function(cindex){
          	 			var obj = {};
          	 			$.each(checkBox,function(i,n){
          	 				obj["datasRole["+i+"].id"]=n.value;
          	 			});
          	 			$.ajax({
   	        			   url:"${APP_PATH}/role/deletes.do",
   	        			   type:"POST",
   	        			   data:obj,
   	        			   success:function(result){
   	        				   if(result.success){
   	        					   layer.msg("数据删除成功", {time:1000, icon:6, shift:6});
   	        					   pageQueryRole(1);
   	        				   }else{
   	        					   layer.msg("数据删除失败", {time:1000, icon:5, shift:6});
   	        				   };
   	        			   }
   	        		   });
          			    layer.close(cindex);
          			}, function(cindex){
          			    layer.close(cindex);
          			});
          	 	};
             }
        </script>
  </body>
</html>
