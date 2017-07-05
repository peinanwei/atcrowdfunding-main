<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh_CN">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<link rel="stylesheet" href="${APP_PATH }/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/main.css">
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	table tbody tr:nth-child(odd){background:#F4F4F4;}
	table tbody td:nth-child(even){color:#C00;}
	</style>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 消息模板</a></div>
        </div>
				<%@include file="/WEB-INF/jsp/common/userinfo.jsp" %>	
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
			<%@include file="/WEB-INF/jsp/common/maininfo.jsp"%>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
			  </div>
			  <div class="panel-body">
          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30">#</th>
                  <th>消息描述</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>密码找回</td>
                  <td>
                      <button type="button" value="1" onclick="getMessage(this)" class="btn btn-primary btn-xs"><i class="glyphicon glyphicon-pencil"></i></button>
				  </td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>用户激活</td>
                  <td>
                      <button type="button" value="2" onclick="getMessage(this)" class="btn btn-primary btn-xs"><i class="glyphicon glyphicon-pencil"></i></button>
				  </td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>风险提示</td>
                  <td>
                      <button type="button" value="3" onclick="getMessage(this)" class="btn btn-primary btn-xs"><i class="glyphicon glyphicon-pencil"></i></button>
				  </td>
                </tr>
                <tr>
                  <td>4</td>
                  <td>关于我们</td>
                  <td>
                      <button type="button" value="4" onclick="getMessage(this)" class="btn btn-primary btn-xs"><i class="glyphicon glyphicon-pencil"></i></button>
				  </td>
                </tr>
              </tbody>
            </table>
          </div>
          
          <div id="headerMessage">
          </div>
          <div id="textMessage">
          </div>
          <div id="btnMessage">
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
            });
            
            function getMessage(obj){
            	var messageId=$(obj).val();
            	$.ajax({
            		url:"${APP_PATH}/user/getMessage.htm",
    	        	type:"post",
    	        	data:{
    	        		"messageId":messageId
    	        	},
    	        	success :function(result){
    	        		 var text = $(obj).parents("tr").find("td:eq(1)").text();
    	        		 
    	        		 var header='<h4 id="header" style="text-align: center;color:red;">'+text+'_信息修改<h4>';
    	        		 var message= '<textarea class='+messageId+' id="textArea"  rows="5" cols="142">'+result.message+'</textarea>';
    	        		 var btn = '<button onclick="editMessage()" type="button" class="btn btn-warning">修改</button>';
    	        		 $("#headerMessage").html(header);
    	        		 $("#textMessage").html(message);
    	        		 $("#btnMessage").html(btn);
    	        		 
    	        	}
            	});
            }
            function editMessage(){
            	var textMessage= $("#textArea");
            	$.ajax({
            		url:"${APP_PATH}/user/editMessage.do",
            		type:"post",
            		data:{
            			"id":textMessage.attr("class"),
            			"message":textMessage.val(),
            		},
            		beforeSend :function(){
            			loadingIndex = layer.msg($("#header").text()+'修改中', {icon: 16});
            		},
            		success : function(result) {
            			layer.close(loadingIndex);
            			if ( result.success) {
            				layer.msg($("#header").text()+"成功", {time:1000, icon:6}, function(){
            					window.location.href = "${APP_PATH}/user/message.htm";
            				});
            			} else {
            				layer.msg($("#header").text()+"失败", {time:1000, icon:5, shift:6});
            			}
            		}
            	});
            	
            }
        </script>
  </body>
</html>
