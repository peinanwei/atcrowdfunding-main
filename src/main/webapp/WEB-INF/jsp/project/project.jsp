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
<link rel="stylesheet" href="${APP_PATH }/css/theme.css">
<style>
#footer {
	padding: 15px 0;
	background: #fff;
	border-top: 1px solid #ddd;
	text-align: center;
}

#topcontrol {
	color: #fff;
	z-index: 99;
	width: 30px;
	height: 30px;
	font-size: 20px;
	background: #222;
	position: relative;
	right: 14px !important;
	bottom: 11px !important;
	border-radius: 3px !important;
}

#topcontrol:after {
	/*top: -2px;*/
	left: 8.5px;
	content: "\f106";
	position: absolute;
	text-align: center;
	font-family: FontAwesome;
}

#topcontrol:hover {
	color: #fff;
	background: #18ba9b;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

.nav-tabs>li.active>a,.nav-tabs>li.active>a:focus,.nav-tabs>li.active>a:hover
	{
	border-bottom-color: #ddd;
}

.nav-tabs>li>a {
	border-radius: 0;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/jsp/common/bodyHead.jsp"%>

	<div class="container theme-showcase" role="main">

		<%@include file="/WEB-INF/jsp/common/heard.jsp"%>

		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="jumbotron nofollow" style="padding-top: 10px;">
						<h3>酷驰触控龙头，智享厨房黑科技</h3>
						<div style="float: left; width: 70%;">
							智能时代，酷驰触控厨房龙头，让煮妇解放双手，触发更多烹饪灵感，让美味信手拈来。</div>
						<div style="float: right;">
							<button type="button" class="btn btn-default">
								<i style="color: #f60" class="glyphicon glyphicon-heart"></i> 关注
								111
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="row clearfix">
						<div class="col-md-8 column">
							<img alt="140x140" width="740"
								src="${APP_PATH }/img/product_detail_head.jpg" /> <img
								alt="140x140" width="740"
								src="${APP_PATH }/img/product_detail_body.jpg" />

						</div>
						<div class="col-md-4 column">
							<div class="panel panel-default" style="border-radius: 0px;">
								<div class="panel-heading"
									style="background-color: #fff; border-color: #fff;">
									<span class="label label-success"><i
										class="glyphicon glyphicon-tag"></i> 众筹中</span>
								</div>
								<div class="panel-body">
									<h3>已筹资金：￥50000.00</h3>
									<p>
										<span>目标金额 ： 1000.00</span><span style="float: right;">达成
											： 60%</span>
									</p>
									<div class="progress" style="height: 10px; margin-bottom: 5px;">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: 60%;"></div>
									</div>
									<p>剩余 15 天</p>
									<div>
										<p>
											<span>已有629人支持该项目
										</p>
										<button type="button"
											class="btn  btn-warning btn-lg btn-block" data-toggle="modal"
											data-target="#myModal">立即支持</button>
									</div>
								</div>
								<div class="panel-footer"
									style="background-color: #fff; border-top: 1px solid #ddd; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px;">
									<div class="container-fluid">
										<div class="row clearfix">
											<div class="col-md-3 column" style="padding: 0;">
												<img alt="140x140" src="${APP_PATH }/img/services-box2.jpg"
													data-holder-rendered="true"
													style="width: 80px; height: 80px;">
											</div>
											<div class="col-md-9 column">
												<div class="">
													<h4>
														<b>福建省南安厨卫</b> <span
															style="float: right; font-size: 12px;"
															class="label label-success">已认证</span>
													</h4>
													<p style="font-size: 12px">
														酷驰是一家年轻的厨卫科技公司，我们有一支朝气蓬勃，有激情、有想法、敢实践的团队。</p>
													<p style="font-size: 12px">客服电话:0595-86218855</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="panel panel-default" style="border-radius: 0px;">
								<div class="panel-heading">
									<h3>
										￥1.00 <span style="float: right; font-size: 12px;">无限额，447位支持者</span>
									</h3>
								</div>
								<div class="panel-body">
									<p>配送费用：包邮</p>
									<p>预计发放时间：项目筹款成功后的50天内</p>
									<button type="button" class="btn  btn-warning btn-lg"
										onclick="window.location.href='${APP_PATH}/trade/pay-step-1.htm'">支持</button>
									<br>
									<br>
									<p>感谢您的支持，在众筹开始后，您将以79元的优惠价格获得“遇见彩虹?”智能插座一件（参考价208元）。</p>
								</div>
							</div>

							<div class="panel panel-default" style="border-radius: 0px;">
								<div class="panel-heading">
									<h3>
										￥149.00 <span style="float: right; font-size: 12px;">限额2000位，剩余1966位</span>
									</h3>
								</div>
								<div class="panel-body">
									<p>配送费用：包邮</p>
									<p>预计发放时间：项目筹款成功后的50天内</p>
									<button type="button" class="btn  btn-warning btn-lg"
										onclick="window.location.href='${APP_PATH}/trade/pay-step-1.htm'">支持</button>
									<br>
									<br>
									<p>感谢您的支持，在众筹开始后，您将以79元的优惠价格获得“遇见彩虹?”智能插座一件（参考价208元）。</p>
								</div>
							</div>
							<div class=" panel panel-default" style="border-radius: 0px;">
								<div class="panel-heading">
									<h3>风险提示</h3>
								</div>
								<div id="riskMessage" class="panel-body">
								</div>
							</div>

							<div>
								<h2>为你推荐</h2>
								<hr>
							</div>
							<div class="prjtip panel panel-default"
								style="border-radius: 0px;">
								<div class="panel-body">
									<img src="${APP_PATH }/img/product-3.png" width="100%"
										height="100%">
								</div>
							</div>

							<div class="prjtip panel panel-default"
								style="border-radius: 0px;">
								<div class="panel-body">
									<img src="${APP_PATH }/img/product-4.jpg" width="100%"
										height="100%">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="container" style="margin-top: 20px;">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div id="footer">
						<div class="footerNav">
							<a rel="nofollow" href="http://www.atguigu.com">关于我们</a> | <a
								rel="nofollow" href="http://www.atguigu.com">服务条款</a> | <a
								rel="nofollow" href="http://www.atguigu.com">免责声明</a> | <a
								rel="nofollow" href="http://www.atguigu.com">网站地图</a> | <a
								rel="nofollow" href="http://www.atguigu.com">联系我们</a>
						</div>
						<div class="copyRight">Copyright ?2010-2014atguigu.com 版权所有
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>
	<!-- /container -->


	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog " style="width: 960px; height: 400px;"
			role="document">
			<div class="modal-content" data-spy="scroll"
				data-target="#myScrollspy">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">选择支持项</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row clearfix">
							<div class="col-sm-3 col-md-3 column" id="myScrollspy">
								<ul class="nav nav-tabs nav-stacked">
									<li class="active"><a href="#section-1">￥1.00</a></li>
									<li class="active"><a href="#section-2">￥149.00</a></li>
									<li class="active"><a href="#section-3">￥249.00</a></li>
									<li class="active"><a href="#section-4">￥549.00</a></li>
									<li class="active"><a href="#section-5">￥1999.00</a></li>
								</ul>
							</div>
							<div id="navList" class="col-sm-9 col-md-9 column"
								style="height: 400px; overflow-y: auto;">
								<h2 id="section-1" style="border-bottom: 1px dashed #ddd;">
									<span style="font-size: 20px; font-weight: bold;">￥1.00</span><span
										style="font-size: 12px; margin-left: 60px;">无限额，223位支持者</span>
								</h2>
								<p>配送费用：全国包邮</p>
								<p>预计发放时间：项目筹款成功后的30天内</p>
								<button type="button" class="btn  btn-warning btn-lg "
									onclick="window.location.href='${APP_PATH}/trade/pay-step-1.htm'">支持</button>
								<br>
								<br>
								<p>每满1750人抽取一台活性富氢净水直饮机，至少抽取一台。抽取名额（小数点后一位四舍五入）=参与人数÷1750人，由苏宁官方抽取。</p>
								<hr>
								<h2 id="section-2" style="border-bottom: 1px dashed #ddd;">
									<span style="font-size: 20px; font-weight: bold;">￥149.00</span><span
										style="font-size: 12px; margin-left: 60px;">无限额，223位支持者</span>
								</h2>
								<p>配送费用：全国包邮</p>
								<p>预计发放时间：项目筹款成功后的30天内</p>
								<button type="button" class="btn  btn-warning btn-lg "
									onclick="window.location.href='${APP_PATH}/trade/pay-step-1.htm'">支持</button>
								<br>
								<br>
								<p>每满1750人抽取一台活性富氢净水直饮机，至少抽取一台。抽取名额（小数点后一位四舍五入）=参与人数÷1750人，由苏宁官方抽取。</p>
								<hr>
								<h2 id="section-3" style="border-bottom: 1px dashed #ddd;">
									<span style="font-size: 20px; font-weight: bold;">￥249.00</span><span
										style="font-size: 12px; margin-left: 60px;">无限额，223位支持者</span>
								</h2>
								<p>配送费用：全国包邮</p>
								<p>预计发放时间：项目筹款成功后的30天内</p>
								<button type="button" class="btn  btn-warning btn-lg "
									onclick="window.location.href='${APP_PATH}/trade/pay-step-1.htm'">支持</button>
								<br>
								<br>
								<p>每满1750人抽取一台活性富氢净水直饮机，至少抽取一台。抽取名额（小数点后一位四舍五入）=参与人数÷1750人，由苏宁官方抽取。</p>
								<hr>
								<h2 id="section-4" style="border-bottom: 1px dashed #ddd;">
									<span style="font-size: 20px; font-weight: bold;">￥549.00</span><span
										style="font-size: 12px; margin-left: 60px;">无限额，223位支持者</span>
								</h2>
								<p>配送费用：全国包邮</p>
								<p>预计发放时间：项目筹款成功后的30天内</p>
								<button type="button" class="btn  btn-warning btn-lg "
									onclick="window.location.href='${APP_PATH}/trade/pay-step-1.htm'">支持</button>
								<br>
								<br>
								<p>每满1750人抽取一台活性富氢净水直饮机，至少抽取一台。抽取名额（小数点后一位四舍五入）=参与人数÷1750人，由苏宁官方抽取。</p>
								<hr>
								<h2 id="section-5" style="border-bottom: 1px dashed #ddd;">
									<span style="font-size: 20px; font-weight: bold;">￥1999.00</span><span
										style="font-size: 12px; margin-left: 60px;">无限额，223位支持者</span>
								</h2>
								<p>配送费用：全国包邮</p>
								<p>预计发放时间：项目筹款成功后的30天内</p>
								<button type="button" class="btn  btn-warning btn-lg "
									onclick="window.location.href='${APP_PATH}/trade/pay-step-1.htm'">支持</button>
								<br>
								<br>
								<p>每满1750人抽取一台活性富氢净水直饮机，至少抽取一台。抽取名额（小数点后一位四舍五入）=参与人数÷1750人，由苏宁官方抽取。</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	<script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
	<script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/script/docs.min.js"></script>
	<script src="${APP_PATH }/script/back-to-top.js"></script>
	<script src="${APP_PATH}/script/layer/layer.js"></script>
	<script>
		$(".prjtip img").css("cursor", "pointer");
		$(".prjtip img").click(function() {
			window.location.href = '${APP_PATH }/project/project.htm';
		});
		$(function(){
	    	$.ajax({
	    		url:"${APP_PATH}/user/getMessage.htm",
	        	type:"post",
	        	data:{
	        		"messageId":3
	        	},
	        	beforeSend:function(){
	        		var loadingIndex = layer.msg('查询中', {icon: 16});
	    			layer.close(loadingIndex);
	        	},
	        	success :function(result){
	        		 var message = "<p >"+result.message+"</p>";
	        		 $("#riskMessage").html(message);
	        	}
	    	});
	    });
	</script>
</body>
</html>