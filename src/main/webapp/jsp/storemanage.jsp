<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
</head>
<body class=" theme-blue">
	<div class="content_other">
		<div class="main-content">
			<table id="store" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>商店编号</th>
						<th>商店名称</th>
						<th>地址</th>
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
			$('#store').dataTable({
				destroy : true,
				"ajax" : "../d/getAllStore.action",
				"columns" : [ {
					"data" : "number"
				}, {
					"data" : "name"
				}, {
					"data" : "address"
				},{
					"data" : "tel"
				}, {
					"data" : "time"
				}, {
					"data" : null,
					render : function(data, type, row) {
						if(data.isvalid == true){
							return "有效";
						} else {
							return "无效";
						}
					}
				}, {
					"data" : null,
					render : function(data, type, row) {
						var htmlString = "<a href='javascript:void(0);' onclick=deleteRow('" + data.number + "')><i class='fa fa-trash-o'></i></a> &nbsp;&nbsp;"
						if(data.isvalid == true){
							htmlString += "<a href='javascript:void(0);' onclick=down('" + data.number + "')>下架</a>";
						} else {
							htmlString += "<a href='javascript:void(0);' onclick=up('" + data.number + "')>上架</a>";
						}
						return htmlString;
					}
				} ]
			});
		}

		function deleteRow(number) {
			console.log("row number: ", number);
			$.ajax({
				type : "post",
				url : "../d/deleteStore.action",
				dataType : "json",
				data : {
					storeNum : number
				},
				success : function(data) {
					if(data.data == "success"){
						alert("删除成功");
						tableRender("all");
					} else {
						alert("删除失败");
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(errorThrown);
				}
			});
		}

		function down(number) {
			console.log("row number: ", number);
			$.ajax({
				type : "post",
				url : "../d/downStore.action",
				dataType : "json",
				data : {
					storeNum : number
				},
				success : function(data) {
					if(data.data == "success"){
						alert("下架成功");
						tableRender("all");
					} else {
						alert("下架失败，请重试");
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(errorThrown);
				}
			});
		}

		function up(number) {
			console.log("row number: ", number);
			$.ajax({
				type : "post",
				url : "../d/upStore.action",
				dataType : "json",
				data : {
					storeNum : number
				},
				success : function(data) {
					if(data.data == "success"){
						alert("上架成功");
						tableRender("all");
					} else {
						alert("上架失败，请重试");
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(errorThrown);
				}
			});
		}
	</script>
</body>
</html>