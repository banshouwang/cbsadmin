<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>车帮手后台管理系统</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="../lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../lib/font-awesome/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="../stylesheets/theme.css">
<link rel="stylesheet" type="text/css" href="../stylesheets/premium.css">
<link rel="stylesheet" type="text/css" href="../lib/datatable/dataTables.bootstrap.css">



<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.navbar-default .navbar-brand,.navbar-default .navbar-brand:hover {
	color: #fff;
}
</style>
</head>
<body class=" theme-blue">
	<div class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="" href="index.html"><span class="navbar-brand"><span class="fa fa-paper-plane"></span> 车帮手</span></a>
		</div>

		<div class="navbar-collapse collapse" style="height: 1px;">
			<ul id="main-menu" class="nav navbar-nav navbar-right">
				<li class="dropdown hidden-xs"><a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span class="glyphicon glyphicon-user padding-right-small" style="position: relative; top: 3px;"></span> ${sessionScope.user.name } <i class="fa fa-caret-down"></i>
				</a>

					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="../mobile/logout.action">注销</a></li>
					</ul></li>
			</ul>
		</div>
	</div>

	<div class="sidebar-nav">
		<ul>
			<li><a href="#" data-target=".dashboard-menu" class="nav-header" data-toggle="collapse"><i class="fa fa-fw fa-dashboard"></i> 控制面版<i class="fa fa-collapse"></i></a></li>
			<li>
				<ul class="dashboard-menu nav nav-list collapse in">
					<li><a href="javascript:void(0);" onclick="openpage('dashboard')"><span class="fa fa-caret-right"></span> Dashboard</a></li>
					<li><a href="javascript:void(0);" onclick="openpage('resource')"><span class="fa fa-caret-right"></span> 资源监控</a></li>
				</ul>
			</li>

			<li data-popover="true" el="popover" data-placement="right"><a href="#" data-target=".premium-menu" class="nav-header collapsed" data-toggle="collapse"> <i class="fa fa-fw fa-fighter-jet"></i> 业务管理<i class="fa fa-collapse"></i></a></li>
			<li>
				<ul class="premium-menu nav nav-list collapse">
					<li><a href="javascript:void(0);" onclick="openpage('requestManage')"><span class="fa fa-caret-right"></span> 请求管理</a></li>
					<li><a href="javascript:void(0);" onclick="openpage('userManage')"><span class="fa fa-caret-right"></span> 用户管理</a></li>
					<li><a href="javascript:void(0);" onclick="openpage('goodsManage')"><span class="fa fa-caret-right"></span> 商品管理</a></li>
					<li><a href="javascript:void(0);" onclick="openpage('cateManage')"><span class="fa fa-caret-right"></span> 分类管理</a></li>
					<li><a href="javascript:void(0);" onclick="openpage('storeManage')"><span class="fa fa-caret-right"></span> 商户管理</a></li>
					<li><a href="javascript:void(0);" onclick="openpage('orderManage')"><span class="fa fa-caret-right"></span> 订单管理</a></li>
				</ul>
			</li>

			<li><a href="#" data-target=".accounts-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa-list-alt"></i> 报表系统 </a></li>
			<li>
				<ul class="accounts-menu nav nav-list collapse">
					<li><a href="#"><span class="fa fa-caret-right"></span> 订单</a></li>
					<li><a href="#"><span class="fa fa-caret-right"></span> 用户</a></li>
					<li><a href="#"><span class="fa fa-caret-right"></span> 商品</a></li>
				</ul>
			</li>
			<li><a href="#" data-target=".money-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa-money"></i> 资金管理 <i class="fa fa-collapse"></i></a></li>
			<li>
				<ul class="money-menu nav nav-list collapse">
					<li><a href="#"><span class="fa fa-caret-right"></span> 结算管理</a></li>
				</ul>
			</li>

			<li><a href="#" data-target=".sys-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa-key"></i> 系统设置 <i class="fa fa-collapse"></i></a></li>
			<li>
				<ul class="sys-menu nav nav-list collapse">
					<li><a href="#"><span class="fa fa-caret-right"></span> 微信设置</a></li>
				</ul>
				<ul class="sys-menu nav nav-list collapse">
					<li><a href="javascript:void(0);" onclick="openpage('proManage')"><span class="fa fa-caret-right"></span> 省份管理</a></li>
				</ul>
				<ul class="sys-menu nav nav-list collapse">
					<li><a href="javascript:void(0);" onclick="openpage('cityManage')"><span class="fa fa-caret-right"></span> 城市管理</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="content">
		<div id="maincontent">
			<!-- <div class="header">
				<div class="stats">
					<p class="stat">
						<span class="label label-info" id="userTotal"></span> 新用户
					</p>
					<p class="stat">
						<span class="label label-success" id="orderTotal"></span> 新订单
					</p>
				</div>

				<h1 class="page-title">Dashboard</h1>
				<ul class="breadcrumb">
					<li><a>Home</a></li>
					<li class="active">Dashboard</li>
				</ul>
			</div> -->
			<div class="main-content">
				<span>新用户</span>
				<hr>
				<table class="table table-striped table-bordered table-hover" id="users">
					<thead>
						<tr>
							<th width="260px">用户编号</th>
							<th>昵称</th>
							<th>性别</th>
							<th>电话</th>
							<th>商家?</th>
							<th>注册日期</th>
						</tr>
					</thead>
				</table>
				<br>
				<span>新订单</span>
				<hr>
				<table class="table table-striped table-bordered table-hover" id="orders">
					<thead>
						<tr>
							<th>订单编号</th>
							<th>总额(元)</th>
							<th>抵用券(元)</th>
							<th>订单状态</th>
							<th>创建时间</th>
							<th>支付时间</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<!-- Footer -->
		<footer>
			<hr>
			<p class="pull-right">
				后台管理系统 by <a href="http://weibo.com/u/5506812360" target="_blank">扳手科技</a>
			</p>
			<p>
				© 2014 <a href="http://weibo.com/u/5506812360" target="_blank">扳手科技</a>
			</p>
		</footer>
	</div>
	<script type="text/javascript" src="../lib/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="../lib/datatable/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="../lib/datatable/dataTables.bootstrap.js"></script>
	<script type="text/javascript" src="../lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="../lib/jquery.validate.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			userTableRender();
			orderTableRender();
		});
		function openpage(command) {
			if (command == "userManage") {
				$("#maincontent").load("usermanage.jsp");
			}
			if (command == "goodsManage") {
				$("#maincontent").load("goodsmanage.jsp");
			}
			if (command == "addgoods") {
				$("#maincontent").load("addgoods.jsp");
			}
			if (command == "cateManage") {
				$("#maincontent").load("catemanage.jsp");
			}
			if (command == "resource") {
				alert("该功能正在开发中...")
				/*$("#maincontent").load("resource.jsp");*/
			}
			if (command == "addcate") {
				$("#maincontent").load("addcate.jsp");
			}
			if (command == "requestManage") {
				$("#maincontent").load("requestmanage.jsp");
			}
			if (command == "orderManage") {
				$("#maincontent").load("ordermanage.jsp");
			}
			if (command == "storeManage") {
				$("#maincontent").load("storemanage.jsp");
			}
			if (command == "proManage") {
				$("#maincontent").load("promanage.jsp");
			}
			if (command == "cityManage") {
				$("#maincontent").load("citymanage.jsp");
			}
			if (command == "dashboard") {
				location.href = "index.jsp";
			}
		}

		function userTableRender() {
			$('#users').dataTable({
				destroy : true,
				"ajax" : "../d/getAllNewUsers.action",
				"columns" : [ {
					"data" : "openId"
				}, {
					"data" : "name"
				}, {
					"data" : "gender"
				}, {
					"data" : "mobile"
				}, {
					"data" : null,
					render : function(data, type, row) {
						if (data.isstore == true) {
							return "是";
						} else {
							return "否";
						}
					}
				}, {
					"data" : "time"
				} ]
			});
		}

		function orderTableRender() {
			$('#orders').dataTable({
				destroy : true,
				"ajax" : "../d/getAllNewOrders.action",
				"columns" : [ {
					"data" : "number"
				}, {
					"data" : "total"
				}, {
					"data" : "ticket"
				}, {
					"data" : "status"
				}, {
					"data" : "createTime"
				}, {
					"data" : "payTime"
				} ]
			});
		}

		function getTotal(){
			var userTable = $('#users').dataTable();
			alert(userTable.fnGetData().length);
		}
	</script>
</body>
</html>
