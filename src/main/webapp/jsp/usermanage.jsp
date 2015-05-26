<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
</head>
<body class=" theme-blue">
	<div class="content_other">
		<div class="main-content">
			<div class="btn-toolbar list-toolbar">
				<button class="btn btn-primary">
					<i class="fa fa-plus"></i> New User
				</button>
				<div class="btn-group"></div>
			</div>
			<table id="users" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width="260px">用户编号</th>
						<th>昵称</th>
						<th>性别</th>
						<th>电话</th>
						<th>商家?</th>
						<th>注册日期</th>
						<th>操作</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			tableRender();
		});

		function tableRender() {
			$('#users').dataTable({
				destroy : true,
				"ajax" : "../d/getAllUsers.action",
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
				}, {
					"data" : null,
					render : function(data, type, row) {
						return "<a href='javascript:void(0);' onclick=deleteRow('" + data.openId + "')><i class='fa fa-pencil'></i></a>" + "&nbsp;&nbsp;" + "<a href='javascript:void(0);' onclick=deleteRow('" + data.openId + "')><i class='fa fa-trash-o'></i></a>";
					}
				} ]
			});
		}
	</script>
</body>
</html>