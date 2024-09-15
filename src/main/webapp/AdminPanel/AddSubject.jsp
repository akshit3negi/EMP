<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Subject Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
body{
padding: 10px;
background-color:darkgray;
}
.col-sm-6 {
	display: inline-block;
	width: 20%;
}

.form-row {
	margin: 50px;
}

button[type=submit] {
	margin-left: 65px;
}

form{
background-color: gray;
width:900px;
padding-top: 10px;
padding-bottom: 10px;
}
</style>
</head>
<body>
	<div class="form">
		<h2>Add Subject Form</h2>
		<form method="get" action="../SubjectController">
				<div class="form-row">
					<div class="col-sm-6">
						<label for="name">Subject Name:</label> 
						<input type="text" class="form-control" id="name" placeholder="Subject Name"
							name="name">
					</div>

					<div class="col-sm-6">
						<label for="code">Subject Code:</label> 
						<input type="text" class="form-control" id="code" placeholder="Subject Code"
							name="code">
					</div>
				</div>
				<br>
				<div class="form-row">
					<div class="col-sm-6">
						<label for="maxMarks">Max Marks:</label> <input type="text"
							class="form-control" id="maxMarks" placeholder="Subject Max Marks"
							name="maxMarks">
					</div>

					<div class="col-sm-6">
						<label for="passMarks">Passing Marks:</label> <input type="text"
							class="form-control" id="passMarks" placeholder="Subject Passing Marks"
							name="passMarks">
					</div>
				</div>
				<br>

				<div class="form-row">
					<div class="col-sm-6">
						<label for="totalQuest">Total Question:</label> <input type="text"
							class="form-control" id="totalQuest" placeholder="Total number of Questions"
							 name="totalQuest">
					</div>
					<div class="col-sm-6">
						<label for="duration">Duration:</label> <input type="text"
							class="form-control" id="duration" placeholder="Subject Duration"
							name="duration">
					</div>
				</div>
				<br>
				<div class="form-row">
					<div class="col-sm-6">
						<label for="subFees">Subject Fees:</label> <input type="text"
							class="form-control" id="subFees" placeholder="Subject Fees"
							name="subFees">
					</div>

					<div class="col-sm-6">
						<label for="offer">Subject Offer:</label> <input type="text"
							class="form-control" id="offer" placeholder="Subject Offer"
							name="offer">
					</div>
				</div>
<br><br><br><br>
			<button type="submit" class="btn btn-default">Submit</button>
			<button type="reset" class="btn btn-default">Clear Form</button>
			
		</form>
	</div>

</body>
</html>
