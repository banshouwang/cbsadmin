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
				<button class="btn btn-primary" onclick="openpage('addcate')">
					<i class="fa fa-plus"></i> 添加分类
				</button>
				<div class="btn-group"></div>
			</div>

			<div class="panel-body">
				<div class="dataTable_wrapper">
					<table class="table table-striped table-bordered table-hover" id="cates">
						<thead>
							<tr>
								<th>分类编号</th>
								<th>名称</th>
								<th>日期</th>
								<th>是否有效</th>
								<th>操作</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$(document).ready(function() {
		tableRender();
	});

	function tableRender(){
		$('#cates').dataTable({
			destroy: true,
			"ajax": "../d/getAllCates.action",
			"columns" : [ {
				"data" : "num"
			}, {
				"data" : "name"
			}, {
				"data" : "time"
			}, {
				"data" : "is_valid"
			},{
				"data" : null,
				render : function(data, type, row) {
					return "<a href='javascript:void(0);' onclick=deleteRow('" + data.num + "')><i class='fa fa-trash-o'></i></a>";
				}
			}]
		});
	}
	
	function deleteRow(number) {
		console.log("row number: ", number);
		$.ajax({
			type : "post",
			url : "../d/deleteCate.action",
			dataType : "json",
			data : {
				number : number
			},
			success : function(data) {
				var result = data.data;
				if(result == "success"){
					alert("删除成功");
				} else {
					alert("删除失败");
				}
				
				tableRender();
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert(errorThrown);
			}
		});
	}
</script>
</body>
</html>