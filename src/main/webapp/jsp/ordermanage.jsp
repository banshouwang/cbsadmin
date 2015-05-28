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
				<select name="store" id="store" class="form-control" onchange="getOrderByStoreNumber()">
				</select>
			</div>
			<table id="order" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>订单编号</th>
						<th>总额(元)</th>
						<th>抵用券(元)</th>
						<th>订单状态</th>
						<th>创建时间</th>
						<th>支付时间</th>
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

		function getOrderByStoreNumber(){
			var storeNumber  = $("#store").val();
			if(storeNumber == "选择商家"){
				storeNumber = "all";
			}
			tableRender(storeNumber);
		}
		
		function tableRender(storeNumber) {
			$('#order').dataTable({
				destroy : true,
				"ajax" : "../d/getAllOrder.action?storeNumber=" + storeNumber,
				"columns" : [ {
					"data" : "number"
				}, {
					"data" : "total"
				}, {
					"data" : "ticket"
				},{
					"data" : "status"
				}, {
					"data" : "createTime"
				}, {
					"data" : "payTime"
				}, {
					"data" : null,
					render : function(data, type, row) {
						return "<a href='javascript:void(0);' onclick=deleteRow('" + data.number + "')><i class='fa fa-trash-o'></i></a>"
					}
				} ]
			});
		}

		function deleteRow(number) {
			console.log("row number: ", number);
			$.ajax({
				type : "post",
				url : "../d/deleteByNumber.action",
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
	</script>
</body>
</html>