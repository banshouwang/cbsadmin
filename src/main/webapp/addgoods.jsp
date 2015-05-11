<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
</head>
<body class=" theme-blue">
	<div class="content_other">
		<div class="main-content">
			<div class="row">
				<div class="col-md-4">
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane active in" id="home">
							<form id="tab">
								<div class="form-group">
									<label>Username</label> <input type="text" value="jsmith"
										class="form-control">
								</div>
								<div class="form-group">
									<label>First Name</label> <input type="text" value="John"
										class="form-control">
								</div>
								<div class="form-group">
									<label>Last Name</label> <input type="text" value="Smith"
										class="form-control">
								</div>
								<div class="form-group">
									<label>Email</label> <input type="text"
										value="jsmith@yourcompany.com" class="form-control">
								</div>

								<div class="form-group">
									<label>Address</label>
									<textarea value="Smith" rows="3" class="form-control">2817 S 49th
Apt 314
San Jose, CA 95101</textarea>
								</div>

								<div class="form-group">
									<label>Time Zone</label> <select name="DropDownTimezone"
										id="DropDownTimezone" class="form-control">
										<option value="-12.0">(GMT -12:00) Eniwetok,
											Kwajalein</option>
										<option value="-11.0">(GMT -11:00) Midway Island,
											Samoa</option>
										<option value="-10.0">(GMT -10:00) Hawaii</option>

									</select>
								</div>
							</form>
						</div>
					</div>

					<div class="btn-toolbar list-toolbar">
						<button class="btn btn-primary">
							<i class="fa fa-save"></i> Save
						</button>
						<a href="#myModal" data-toggle="modal" class="btn btn-danger">Delete</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
