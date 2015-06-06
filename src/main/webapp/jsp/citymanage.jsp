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
				<label>选择省份</label> <select name="province" id="province" class="form-control">
				</select> <br><label>城市名称</label> <input id="name" name="name" type="text" class="form-control"> <br><a href="javascript:void(0);" class="btn btn-primary" onclick="addCity()"><i class="fa fa-save"></i> 添加</a>

			</div>
			<table id="pro" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>省份编号</th>
						<th>省份名称</th>
						<th>城市名称</th>
						<th>操作</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			getAllPros();
			tableRender();
		});

		function getAllPros(){
			$.ajax({
				type : "post",
				url : "../d/getAllPros.action",
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
			var htmlString = "<option>选择省份</option>";
			$.each(data, function(i, value) {
				htmlString += 
					"<option value='" + value.name +"'>" + value.name + "</option>";
			});
			
			$("#province").append(htmlString);
		}

		
		function tableRender() {
			$('#pro').dataTable({
				destroy : true,
				"ajax" : "../d/getAllCities.action",
				"columns" : [ {
					"data" : "number"
				}, {
					"data" : "pname"
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
				url : "../d/deleteCity.action",
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

		function addCity(){
			var province = $("#province").val();
			var city = $("#name").val();

			if(province != "选择省份" && city != ""){
				$.ajax({
					type : "post",
					url : "../d/addCity.action",
					dataType : "json",
					data : {
						name : city,
						pname : province
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
				alert("省份和城市名称不能为空");
			}
		}
		
	</script>
</body>
</html>