<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>车帮手商户管理系统</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<script type="text/javascript" src="lib/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="lib/jquery.cookie.js"></script>
<script type="text/javascript" src="lib/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="lib/font-awesome/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="css/theme.css">
<style type="text/css">
.navbar-default .navbar-brand,.navbar-default .navbar-brand:hover {
	color: #fff;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		
	});

	

	function login() {
		$.ajax({
			type : "post",
			url : "d/login.action",
			dataType : "json",
			data : {
				mobile : function() {
					return $("#mobile").val();
				},
				password : function() {
					return $("#password").val();
				}
			},
			success : function(data) {
				var status = data.data;
				if (status != "error") {
					location.href = "jsp/index.jsp";
				} else {
					$("#alert_fail").show();
				}
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(errorThrown);
			}
		});
	}

	
</script>
</head>
<body class=" theme-blue">
	<div class="navbar navbar-default">
		<div class="navbar-header">
			<a><span class="navbar-brand"><span class="fa fa-paper-plane"></span> 车帮手商户后台管理系统</span></a>
		</div>

	</div>
	
	<div class="dialog" id="login_user_pwd">
		<div id="alert_fail" class="alert alert-danger" style="display: none;">
			<button type="button" class="close" data-dismiss="alert">×</button>
			登录失败，请重试!
		</div>
		<div class="panel panel-default">
			<p class="panel-heading no-collapse">登录</p>
			<div class="panel-body">
				<form>
					<div class="form-group">
						<label>用户名</label> <input id="mobile" name="mobile" type="text" class="form-control span12">
					</div>
					<div class="form-group">
						<label>密码</label> <input id="password" name="password" type="password" class="form-control span12 form-control">
					</div>
					<a href="javascript:void(0)" onclick="login()" class="btn btn-primary pull-right">登录</a>
					<div class="clearfix"></div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
