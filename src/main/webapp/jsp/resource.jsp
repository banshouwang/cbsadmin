<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>

</head>
<body class=" theme-blue">
			<div class="main-content">
				<div class="panel panel-default">
					<a href="#page-stats" class="panel-heading" data-toggle="collapse">资源监控</a>
					<div id="page-stats" class="panel-collapse panel-body collapse in">

						<div class="row">
							<div class="col-md-3 col-sm-6">
								<div class="knob-container">
									<input class="knob" data-width="200" data-min="0"
										data-max="3000" data-displayPrevious="true" value="1500"
										data-fgColor="#92A3C2" data-readOnly=true;>
									<h3 class="text-muted text-center">CPU</h3>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="knob-container">
									<input class="knob" data-width="200" data-min="0"
										data-max="4500" data-displayPrevious="true" value="3299"
										data-fgColor="#92A3C2" data-readOnly=true;>
									<h3 class="text-muted text-center">Memory</h3>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="knob-container">
									<input class="knob" data-width="200" data-min="0"
										data-max="2700" data-displayPrevious="true" value="1840"
										data-fgColor="#92A3C2" data-readOnly=true;>
									<h3 class="text-muted text-center">Disk</h3>
								</div>
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="knob-container">
									<input class="knob" data-width="200" data-min="0"
										data-max="15000" data-displayPrevious="true" value="10067"
										data-fgColor="#92A3C2" data-readOnly=true;>
									<h3 class="text-muted text-center">ImageStore</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
</body>
</html>
