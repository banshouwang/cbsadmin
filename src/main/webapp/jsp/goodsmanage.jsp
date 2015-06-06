<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
</head>
<body class=" theme-blue">
	<div class="content_other">
		<div class="main-content">
			<div class="form-group formtable">
				<label>选择商家</label> 
				<select name="store" id="store" class="form-control" onchange="getGoodsByStoreNumber()">
				</select>
			</div>
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
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			getAllStore();
			tableRender("all");
		});

		function getAllStore(){
			$.ajax({
				type : "post",
				url : "../d/getAllStore.action",
				dataType : "json",
				success : function(data) {
					var result = data.data;
					console.log("result: ", result);
					if (result != null) {
						setOptions(result);
					} else {
						alert("获取商店列表失败，请重试");
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(errorThrown);
				}
			});
		}

		function setOptions(data){
			var htmlString = "<option>选择商家</option>";
			$.each(data, function(i, value) {
				htmlString += 
					"<option value='" + value.number +"'>" + value.name + "</option>";
			});
			
			$("#store").append(htmlString);
		}

		function getGoodsByStoreNumber(){
			var storeNumber  = $("#store").val();
			console.log("storeNumber: ", storeNumber);
			tableRender(storeNumber);
		}
		
		function tableRender(storeNumber) {
			$('#goods').dataTable({
				destroy : true,
				"ajax" : "../d/getAllGoods.action?storeNumber=" + storeNumber,
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
				},{
					"data" : null,
					render : function(data, type, row){
						if(data.status == "active"){
							return "有效";
						} else if(data.status == "storeDown"){
							return "被商家下架";
						} else if(data.status == "platformDown"){
							return "被平台下架";
						} else {

						}
					}
				}, {
					"data" : null,
					render : function(data, type, row) {
						var htmlString = "<a href='javascript:void(0);' onclick=deleteRow('" + data.number + "')><i class='fa fa-trash-o'></i></a> &nbsp;&nbsp;"
						if(data.status == "active"){
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
				url : "../d/deleteGoods.action",
				dataType : "json",
				data : {
					number : number
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
				url : "../d/downGoods.action",
				dataType : "json",
				data : {
					number : number
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
				url : "../d/upGoods.action",
				dataType : "json",
				data : {
					number : number
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