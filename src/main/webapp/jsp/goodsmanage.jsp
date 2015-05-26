<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
</head>
<body class=" theme-blue">
	<div class="content_other">
		<div class="main-content">
			<label for="select-choice-a" class="select">选择商家</label>
					<select name="select-choice-a" id="select-choice-a" data-native-menu="false">
						<option value="宁波市">宁波市</option>
					</select> 
			<table id="goods" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>商品编号</th>
						<th>分类</th>
						<th>商品名称</th>
						<th>原价</th>
						<th>平台价</th>
						<th>是否打折</th>
						<th>抵用券</th>
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
			$('#goods').dataTable({
				destroy : true,
				"ajax" : "../d/getAllGoods.action",
				"columns" : [ {
					"data" : "number"
				}, {
					"data" : "category"
				}, {
					"data" : "name"
				},{
					"data" : "priceori"
				}, {
					"data" : "pricehere"
				}, {
					"data" : "isticket"
				}, {
					"data" : "ticket"
				}, {
					"data" : null,
					render : function(data, type, row) {
						return "<a href='javascript:void(0);' onclick=deleteRow('" + data.number + "')><i class='fa fa-trash-o'></i></a>";
					}
				} ]
			});
		}

		function deleteRow(number){
			alert("AAAAA");
		}
	</script>
</body>
</html>