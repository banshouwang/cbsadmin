<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

<script type="text/javascript" src="../lib/jquery-1.11.1.min.js"></script>
<!-- <script type="text/javascript" src="../lib/jQuery-Knob/js/jquery.knob.js"></script> -->
<script type="text/javascript" src="../lib/datatable/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../lib/datatable/dataTables.bootstrap.js" ></script>
<script type="text/javascript" src="../lib/jquery.validate.min.js" ></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#example').DataTable();
	} );
	function openpage(command){
		if(command == "userManage"){
			$("#maincontent").load("usermanage.jsp");
		}
		if(command == "goodsManage"){
			$("#maincontent").load("goodsmanage.jsp");
		}
		if(command == "addgoods"){
			$("#maincontent").load("addgoods.jsp");
		}
		if(command == "cateManage"){
			$("#maincontent").load("catemanage.jsp");
		}
		if(command == "resource"){
			$("#maincontent").load("resource.jsp");
		}
		if(command == "addcate"){
			$("#maincontent").load("addcate.jsp");
		}
		if(command == "requestManage"){
			$("#maincontent").load("requestmanage.jsp");
		}
		if(command == "orderManage"){
			$("#maincontent").load("ordermanage.jsp");
		}
		if(command == "storeManage"){
			$("#maincontent").load("storemanage.jsp");
		}
		if(command == "proManage"){
			$("#maincontent").load("promanage.jsp");
		}
		if(command == "cityManage"){
			$("#maincontent").load("citymanage.jsp");
		}
	}
</script>
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
	<script type="text/javascript">
	$(function() {
	    var match = document.cookie.match(new RegExp('color=([^;]+)'));
	    if(match) var color = match[1];
	    if(color) {
	        $('body').removeClass(function (index, css) {
	            return (css.match (/\btheme-\S+/g) || []).join(' ')
	        })
	        $('body').addClass('theme-' + color);
	    }
	
	    $('[data-popover="true"]').popover({html: true});
	    
	});
</script>
	<script type="text/javascript">
	$(function() {
	    var uls = $('.sidebar-nav > ul > *').clone();
	    uls.addClass('visible-xs');
	    $('#main-menu').append(uls.clone());
	});
</script>
	<div class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="" href="index.html"><span class="navbar-brand"><span
					class="fa fa-paper-plane"></span> 车帮手</span></a>
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
			<li><a href="#" data-target=".dashboard-menu" class="nav-header"
				data-toggle="collapse"><i class="fa fa-fw fa-dashboard"></i>
					控制面版<i class="fa fa-collapse"></i></a></li>
			<li>
				<ul class="dashboard-menu nav nav-list collapse in">
					<li><a href="#"><span class="fa fa-caret-right"></span> Dashboard</a></li>
					<li><a href="javascript:void(0);" onclick="openpage('resource')"><span class="fa fa-caret-right"></span> 资源监控</a></li>
				</ul>
			</li>

			<li data-popover="true" el="popover" data-placement="right">
				<a href="#" data-target=".premium-menu" class="nav-header collapsed" data-toggle="collapse"> <i class="fa fa-fw fa-fighter-jet"></i> 业务管理<i class="fa fa-collapse"></i></a>
			</li>
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

			<li><a href="#" data-target=".accounts-menu"
				class="nav-header collapsed" data-toggle="collapse"><i
					class="fa fa-fw fa-list-alt"></i> 报表系统 </a></li>
			<li>
				<ul class="accounts-menu nav nav-list collapse">
					<li><a href="#"><span class="fa fa-caret-right"></span> 订单</a></li>
					<li><a href="#"><span class="fa fa-caret-right"></span> 用户</a></li>
					<li><a href="#"><span class="fa fa-caret-right"></span> 商品</a></li>
				</ul>
			</li>
			<li><a href="#" data-target=".money-menu"
				class="nav-header collapsed" data-toggle="collapse"><i
					class="fa fa-fw fa-money"></i> 资金管理 <i class="fa fa-collapse"></i></a></li>
			<li>
				<ul class="money-menu nav nav-list collapse">
					<li><a href="#"><span class="fa fa-caret-right"></span> 结算管理</a></li>
				</ul>
			</li>
			
			<li><a href="#" data-target=".sys-menu"
				class="nav-header collapsed" data-toggle="collapse"><i
					class="fa fa-fw fa-key"></i> 系统设置 <i class="fa fa-collapse"></i></a></li>
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
			<div class="header">
				<div class="stats">
					<p class="stat">
						<span class="label label-info">5</span> 新用户
					</p>
					<p class="stat"> 
						<span class="label label-success">27</span> 新订单
					</p>
					<p class="stat">
						<span class="label label-danger">1</span> 系统异常
					</p>
				</div>

				<h1 class="page-title">Dashboard</h1>
				<ul class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li class="active">Dashboard</li>
				</ul>

			</div>
			<div class="main-content">
				<!-- New Users -->
				<div class="row">
					<div class="col-sm-6 col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading no-collapse">
								新用户<span class="label label-warning">+10</span>
							</div>
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Username</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Mark</td>
										<td>Tompson</td>
										<td>the_mark7</td>
									</tr>
									<tr>
										<td>Ashley</td>
										<td>Jacobs</td>
										<td>ash11927</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<!-- 警告信息 -->
					<div class="col-sm-6 col-md-6">
						<div class="panel panel-default">
							<a href="#widget1container" class="panel-heading"
								data-toggle="collapse">警告信息 </a>
							<div id="widget1container" class="panel-body collapse in">
								<h2>Here's a Tip</h2>
								<p>
									This template was developed with <a
										href="http://middlemanapp.com/" target="_blank">Middleman</a>
									and includes .erb layouts and views.
								</p>
								<p>All of the views you see here (sign in, sign up, users,
									etc) are already split up so you don't have to waste your time
									doing it yourself!</p>
							</div>
						</div>
					</div>
				</div>

				<!-- New Orders -->
				<div class="row">
					<div class="col-sm-6 col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading no-collapse">
								<span class="panel-icon pull-right"> <a href="#"
									class="demo-cancel-click" rel="tooltip"
									title="Click to refresh"><i class="fa fa-refresh"></i></a>
								</span> 新订单
							</div>
							<table class="table list">
								<tbody>
									<tr>
										<td><a href="#"><p class="title">Safe Insurance</p></a>
											<p class="info">Sales Rating: 82%</p></td>
										<td>
											<p>Date: 7/19/2012</p> <a href="#">View Transaction</a>
										</td>
										<td>
											<p class="text-danger h3 pull-right"
												style="margin-top: 12px;">$22,400</p>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>

					<!-- Motto -->
					<div class="col-sm-6 col-md-6">
						<div class="panel panel-default">
							<a href="#widget2container" class="panel-heading"
								data-toggle="collapse">团队宣言 </a>
							<div id="widget2container" class="panel-body collapse in">
								<h2>Motto</h2>
								<p>The CSS is built with Less. There is a compiled version
									included if you prefer plain CSS.</p>
								<p>Fava bean jícama seakale beetroot courgette shallot
									amaranth pea garbanzo carrot radicchio peanut leek pea sprouts.
								</p>
							</div>
						</div>
					</div>
					<!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->
					<div class="panel panel-default">
						<div class="panel-heading">DataTables Advanced Tables</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="example">
									<thead>
										<tr>
											<th>Rendering engine</th>
											<th>Browser</th>
											<th>Platform(s)</th>
											<th>Engine version</th>
											<th>CSS grade</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center">4</td>
											<td class="center">X</td>
										</tr>
										<tr class="even gradeC">
											<td>Trident</td>
											<td>Internet Explorer 5.0</td>
											<td>Win 95+</td>
											<td class="center">5</td>
											<td class="center">C</td>
										</tr>
										<tr class="odd gradeA">
											<td>Trident</td>
											<td>Internet Explorer 5.5</td>
											<td>Win 95+</td>
											<td class="center">5.5</td>
											<td class="center">A</td>
										</tr>
										<tr class="even gradeA">
											<td>Trident</td>
											<td>Internet Explorer 6</td>
											<td>Win 98+</td>
											<td class="center">6</td>
											<td class="center">A</td>
										</tr>
										<tr class="odd gradeA">
											<td>Trident</td>
											<td>Internet Explorer 7</td>
											<td>Win XP SP2+</td>
											<td class="center">7</td>
											<td class="center">A</td>
										</tr>
										<tr class="even gradeA">
											<td>Trident</td>
											<td>AOL browser (AOL desktop)</td>
											<td>Win XP</td>
											<td class="center">6</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Firefox 1.0</td>
											<td>Win 98+ / OSX.2+</td>
											<td class="center">1.7</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Firefox 1.5</td>
											<td>Win 98+ / OSX.2+</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Firefox 2.0</td>
											<td>Win 98+ / OSX.2+</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Firefox 3.0</td>
											<td>Win 2k+ / OSX.3+</td>
											<td class="center">1.9</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Camino 1.0</td>
											<td>OSX.2+</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Camino 1.5</td>
											<td>OSX.3+</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Netscape 7.2</td>
											<td>Win 95+ / Mac OS 8.6-9.2</td>
											<td class="center">1.7</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Netscape Browser 8</td>
											<td>Win 98SE+</td>
											<td class="center">1.7</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Netscape Navigator 9</td>
											<td>Win 98+ / OSX.2+</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.0</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">1</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.1</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">1.1</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.2</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">1.2</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.3</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">1.3</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.4</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">1.4</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.5</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">1.5</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.6</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">1.6</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.7</td>
											<td>Win 98+ / OSX.1+</td>
											<td class="center">1.7</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.8</td>
											<td>Win 98+ / OSX.1+</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Seamonkey 1.1</td>
											<td>Win 98+ / OSX.2+</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Epiphany 2.20</td>
											<td>Gnome</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Webkit</td>
											<td>Safari 1.2</td>
											<td>OSX.3</td>
											<td class="center">125.5</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Webkit</td>
											<td>Safari 1.3</td>
											<td>OSX.3</td>
											<td class="center">312.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Webkit</td>
											<td>Safari 2.0</td>
											<td>OSX.4+</td>
											<td class="center">419.3</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Webkit</td>
											<td>Safari 3.0</td>
											<td>OSX.4+</td>
											<td class="center">522.1</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Webkit</td>
											<td>OmniWeb 5.5</td>
											<td>OSX.4+</td>
											<td class="center">420</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Webkit</td>
											<td>iPod Touch / iPhone</td>
											<td>iPod</td>
											<td class="center">420.1</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Webkit</td>
											<td>S60</td>
											<td>S60</td>
											<td class="center">413</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera 7.0</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera 7.5</td>
											<td>Win 95+ / OSX.2+</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera 8.0</td>
											<td>Win 95+ / OSX.2+</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera 8.5</td>
											<td>Win 95+ / OSX.2+</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera 9.0</td>
											<td>Win 95+ / OSX.3+</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera 9.2</td>
											<td>Win 88+ / OSX.3+</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera 9.5</td>
											<td>Win 88+ / OSX.3+</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera for Wii</td>
											<td>Wii</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Nokia N800</td>
											<td>N800</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Nintendo DS browser</td>
											<td>Nintendo DS</td>
											<td class="center">8.5</td>
											<td class="center">C/A<sup>1</sup>
											</td>
										</tr>
										<tr class="gradeC">
											<td>KHTML</td>
											<td>Konqureror 3.1</td>
											<td>KDE 3.1</td>
											<td class="center">3.1</td>
											<td class="center">C</td>
										</tr>
										<tr class="gradeA">
											<td>KHTML</td>
											<td>Konqureror 3.3</td>
											<td>KDE 3.3</td>
											<td class="center">3.3</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>KHTML</td>
											<td>Konqureror 3.5</td>
											<td>KDE 3.5</td>
											<td class="center">3.5</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeX">
											<td>Tasman</td>
											<td>Internet Explorer 4.5</td>
											<td>Mac OS 8-9</td>
											<td class="center">-</td>
											<td class="center">X</td>
										</tr>
										<tr class="gradeC">
											<td>Tasman</td>
											<td>Internet Explorer 5.1</td>
											<td>Mac OS 7.6-9</td>
											<td class="center">1</td>
											<td class="center">C</td>
										</tr>
										<tr class="gradeC">
											<td>Tasman</td>
											<td>Internet Explorer 5.2</td>
											<td>Mac OS 8-X</td>
											<td class="center">1</td>
											<td class="center">C</td>
										</tr>
										<tr class="gradeA">
											<td>Misc</td>
											<td>NetFront 3.1</td>
											<td>Embedded devices</td>
											<td class="center">-</td>
											<td class="center">C</td>
										</tr>
										<tr class="gradeA">
											<td>Misc</td>
											<td>NetFront 3.4</td>
											<td>Embedded devices</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeX">
											<td>Misc</td>
											<td>Dillo 0.8</td>
											<td>Embedded devices</td>
											<td class="center">-</td>
											<td class="center">X</td>
										</tr>
										<tr class="gradeX">
											<td>Misc</td>
											<td>Links</td>
											<td>Text only</td>
											<td class="center">-</td>
											<td class="center">X</td>
										</tr>
										<tr class="gradeX">
											<td>Misc</td>
											<td>Lynx</td>
											<td>Text only</td>
											<td class="center">-</td>
											<td class="center">X</td>
										</tr>
										<tr class="gradeC">
											<td>Misc</td>
											<td>IE Mobile</td>
											<td>Windows Mobile 6</td>
											<td class="center">-</td>
											<td class="center">C</td>
										</tr>
										<tr class="gradeC">
											<td>Misc</td>
											<td>PSP browser</td>
											<td>PSP</td>
											<td class="center">-</td>
											<td class="center">C</td>
										</tr>
										<tr class="gradeU">
											<td>Other browsers</td>
											<td>All others</td>
											<td>-</td>
											<td class="center">-</td>
											<td class="center">U</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
							<div class="well">
								<a class="btn btn-default btn-lg btn-block" target="_blank"
									href="https://datatables.net/">View DataTables
									Documentation</a>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii -->
				</div>
			</div>
			<!-- Footer -->
			<footer>
				<hr>

				<!-- Purchase a site license to remove this link from the footer: http://www.portnine.com/bootstrap-themes -->
				<p class="pull-right">
					后台管理系统 by <a href="http://weibo.com/u/5506812360" target="_blank">扳手科技</a>
				</p>
				<p>
					© 2014 <a href="http://weibo.com/u/5506812360" target="_blank">扳手科技</a>
				</p>
			</footer>
		</div>
	</div>




	<script src="../lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
	$("[rel=tooltip]").tooltip();
	$(function() {
	    $('.demo-cancel-click').click(function(){return false;});
	});
</script>
</body>
</html>
