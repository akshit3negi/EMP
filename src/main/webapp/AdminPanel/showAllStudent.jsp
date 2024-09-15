
<%@page import="dao.StudentOperations" import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Select All Students</title>
<style type="text/css">
body {
	background-color: gray;
}

table {
	background-color: darkgray;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">WebSiteName</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#">Page 1</a></li>
				<li><a href="#">Page 2</a></li>
			</ul>
			<form class="navbar-form navbar-left" action="#">
				<div class="form-group">
					<input type="text" name="search" class="form-control"
						placeholder="Search by Username">
				</div>
				<button type="submit" name="submit_search" class="btn btn-default">Submit</button>
			</form>
		</div>
	</nav>

	<!------------------------ Searched Record -------------------------------->

	<%
	if (request.getParameter("submit_search") != null && request.getParameter("search") != ""){
		String uname = request.getParameter("search");
	%>
	<h2 style="text-align: center;">Searched Record</h2>
	<div class="container-fluid">
		<table class="table">
			<tr>
				<th>S_ID</th>
				<th>Name</th>
				<th>Username</th>
				<th>Password</th>
				<th>Address</th>
				<th>Contact</th>
				<th>Course</th>
				<th>Admission_Date</th>
				<th>Fee</th>
			</tr>
			<%@ page import="java.util.ArrayList" import="bean.Student"%>
			<%
			StudentOperations opr = new StudentOperations();
			List<Student> list = opr.searchByName(uname);
			if (list.size() == 0)
				out.println("<th style='color:red;'>Record not found!</th>");
			else
				for (Student stu : list) {
			%>
			<tr>
				<td><%=stu.getSid()%></td>
				<td><%=stu.getName()%></td>
				<td><%=stu.getUsername()%></td>
				<td><%=stu.getPassword()%></td>
				<td><%=stu.getAddress()%></td>
				<td><%=stu.getContact()%></td>
				<td><%=stu.getCourse()%></td>
				<td><%=stu.getAdmission_date()%></td>
				<td><%=stu.getFees()%></td>
				<td><a class="update"
					href="StudentControl/UpdateStudent.jsp?id=<%=stu.getSid()%>">Update</a></td>
				<td><a class="delete"
					href="StudentControl/DeleteStudent.jsp?id=<%=stu.getSid()%>">Delete</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>

	<hr>
	<%
	}
	%>


	<!------------------------ All Records -------------------------------->

	<h2 style="text-align: center;">Student Record</h2>
	<div class="container-fluid">
		<table class="table">
			<tr>
				<th>S_ID</th>
				<th>Name</th>
				<th>Username</th>
				<th>Password</th>
				<th>Address</th>
				<th>Contact</th>
				<th>Course</th>
				<th>Admission_Date</th>
				<th>Fee</th>
			</tr>
			<%@ page import="java.util.ArrayList" import="bean.Student"%>
			<%
			StudentOperations opr = new StudentOperations();
			ArrayList<Student> list = opr.selectAllStudents();
			Student stu = null;
			for (Student l : list) {
				stu = l;
			%>
			<tr>
				<td><%=stu.getSid()%></td>
				<td><%=stu.getName()%></td>
				<td><%=stu.getUsername()%></td>
				<td><%=stu.getPassword()%></td>
				<td><%=stu.getAddress()%></td>
				<td><%=stu.getContact()%></td>
				<td><%=stu.getCourse()%></td>
				<td><%=stu.getAdmission_date()%></td>
				<td><%=stu.getFees()%></td>
				<td><a class="update"
					href="StudentControl/UpdateStudent.jsp?id=<%=stu.getSid()%>">Update</a></td>
				<td><a class="delete"
					href="StudentControl/DeleteStudent.jsp?id=<%=stu.getSid()%>">Delete</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>

</body>
</html>