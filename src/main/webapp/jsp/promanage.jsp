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
				<div class="form-group">
					<label>省份名称</label> <input id="name" name="name" type="text"
						class="form-control">
				</div>
				<a href="javascript:void(0);" class="btn btn-primary" onclick="addPro()"><i class="fa fa-save"></i> 添加</a>
				
			</div>
			<table id="province" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>省份编号</th>
						<th>省份名称</th>
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
			$('#province').dataTable({
				destroy : true,
				"ajax" : "../d/getAllPros.action",
				"columns" : [ {
					"data" : "number"
				}, {
					"data" : "name"
				}, {
					"data" : null,
					render : function(data, type, row) {
						var htmlString = "<a href='javascript:void(0);' onclick=deleteRow('" + data.number + "')><i class='fa fa-trash-o'></i></a>";
						return htmlString;
					}
				} ]
			});
		}

		function deleteRow(number) {
			console.log("row number: ", number);
			$.ajax({
				type : "post",
				url : "../d/deleteProByNumber.action",
				dataType : "json",
				data : {
					number : number
				},
				success : function(data) {
					if(data.data == "success"){
						alert("删除成功");
						tableRender();
					} else {
						alert("删除失败");
					}
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(errorThrown);
				}
			});
		}

		function addPro() {
			var name = $("#name").val();
			if(name != ""){
				$.ajax({
					type : "post",
					url : "../d/addPro.action",
					dataType : "json",
					data : {
						name : name
					},
					success : function(data) {
						if(data.data == "success"){
							alert("添加成功");
							tableRender();
						} else {
							alert("添加失败，请重试");
						}
						$("#name").val('');
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						alert(errorThrown);
					}
				});
			} else {
				alert("请先输入省份名称");
			}
			
		}
	</script>
</body>
</html>