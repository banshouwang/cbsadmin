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
			<table id="requests" class="table">
				<thead>
					<tr>
						<th width="260px">请求编号</th>
						<th>类型</th>
						<th>电话</th>
						<th>日期</th>
						<th>状态</th>
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
			$('#requests').dataTable({
				destroy : true,
				"ajax" : "../d/getAllRequests.action",
				"columns" : [ {
					"data" : "number"
				}, {
					"data" : "category"
				}, {
					"data" : "mobile"
				}, {
					"data" : "time"
				}, {
					"data" : "status"
				}, {
					"data" : null,
					render : function(data, type, row) {
						return "<a href='javascript:void(0);' onclick=deleteRow('" + data.openId + "')>处理</a>" + "&nbsp;&nbsp;" + "<a href='javascript:void(0);' onclick=deleteRow('" + data.openId + "')>完成</a>";
					}
				} ]
			});
		}
	</script>
</body>
</html>