<%@page import="dao.StudentOperations"%>
<%@page import="bean.Student"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
body {
	padding: 10px;
	background-color: darkgray;
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

form {
	background-color: gray;
	width: 900px;
	padding-top: 10px;
	padding-bottom: 10px;
}
</style>
</head>

<body style="padding: 10px">
	<%@ page import="bean.Student"%>


	<%
	if (request.getParameter("id") != null) {
		int id = Integer.parseInt(request.getParameter("id"));
		StudentOperations st = new StudentOperations();
		Student stu = st.selectStudent(id);
		if (stu != null) {
	%>


	<div class="form">
		<h2>Update Form</h2>
		<form method="post" action="/EMP/FinalUpdate">
			<input type="hidden" class="form-control" value="<%=stu.getSid()%>"
				name="id">
			<div class="form-row">
				<div class="col-sm-6">
					<label for="name">Full Name:</label> <input type="text"
						class="form-control" id="name" value="<%=stu.getName()%>"
						placeholder="Enter full name" name="name">
				</div>

				<div class="col-sm-6">
					<label for="admission_date">Admission Date:</label> <input
						type="date" class="form-control" id="admission_date"
						value="<%=stu.getAdmission_date()%>" name="admission_date">
				</div>
			</div>
			<br>
			<div class="form-row">
				<div class="col-sm-6">
					<label for="username">Username:</label> <input type="text"
						class="form-control" id="username" value="<%=stu.getUsername()%>"
						placeholder="Enter username" name="username">
				</div>

				<div class="col-sm-6">
					<label for="password">Password:</label> <input type="password"
						class="form-control" id="password" value="<%=stu.getPassword()%>"
						placeholder="Enter password" name="password">
				</div>
			</div>
			<br>

			<div class="form-row">
				<div class="col-sm-6">
					<label for="contact">Contact No.:</label> <input type="tel"
						class="form-control" id="contact" value="<%=stu.getContact()%>"
						placeholder="Enter contact no." pattern="[0-9]{10}" name="contact">
				</div>
				<div class="col-sm-6">
					<label for="address">Address:</label> <input type="text"
						class="form-control" id="address" value="<%=stu.getAddress()%>"
						placeholder="Enter address" name="address">
				</div>
			</div>
			<br>
			<div class="form-row">
				<div class="col-sm-6">
					<label for="course">Course:</label> <input type="text"
						class="form-control" id="course" value="<%=stu.getCourse()%>"
						placeholder="Enter course" name="course">
				</div>

				<div class="col-sm-6">
					<label for="fees">Course Fee:</label> <input type="text"
						class="form-control" id="fees" value="<%=stu.getFees()%>"
						placeholder="Enter fee" name="fees">
				</div>
			</div>
			<br> <br> <br> <br>
			<button type="submit" class="btn btn-default">Register</button>
			<button type="reset" class="btn btn-default">Clear Form</button>

		</form>
	</div>


	<%
	}
	} else
	out.println("Id id null");
	%>
</body>
</html>