
<%@page import="dao.SubjectOperations" import="java.util.List"%>
<%@ page import="java.util.ArrayList" import="bean.Subject"%>
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
<title>All Subjects</title>
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
						placeholder="Search by Subject Name">
				</div>
				<button type="submit" name="submit_search" class="btn btn-default">Submit</button>
			</form>
		</div>
	</nav>

	<!------------------------ Searched Subject -------------------------------->

	<%
	if (request.getParameter("submit_search") != null && request.getParameter("search") != "") {
		String subName = request.getParameter("search");
	%>
	<h2 style="text-align: center;">Searched Subject</h2>
	<div class="container-fluid">
		<table class="table">
			<tr>
				<th>Subject Id</th>
				<th>Subject Name</th>
				<th>Subject Code</th>
				<th>Max. Marks</th>
				<th>Passing Marks</th>
				<th>Total Question</th>
				<th>Duration(min)</th>
				<th>Fees</th>
				<th>Offer(%)</th>
			</tr>

			<%
			SubjectOperations opr = new SubjectOperations();
			List<Subject> list = opr.searchByName(subName);
			if (list.size() == 0)
				out.println("<th style='color:red;'>Subject Not Found</th>");
			else
				for (Subject sub : list) {
			%>
			<tr>
				<td><%=sub.getSub_id()%></td>
				<td><%=sub.getSub_name()%></td>
				<td><%=sub.getSub_code()%></td>
				<td><%=sub.getSub_maxMarks()%></td>
				<td><%=sub.getSub_passingMarks()%></td>
				<td><%=sub.getSub_totalQuest()%></td>
				<td><%=sub.getSub_duration()%></td>
				<td><%=sub.getSub_fees()%></td>
				<td><%=sub.getSub_offer()%></td>
				<td><a class="update"
					href="SubjectControl/UpdateSubjectForm.jsp?id=<%=sub.getSub_id()%>">Update</a></td>
				<td><a class="delete"
					href="../DeleteSubject?id=<%=sub.getSub_id()%>">Delete</a></td>
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


	<!------------------------ All Subjects -------------------------------->

	<h2 style="text-align: center;">All Subjects</h2>
	<div class="container-fluid">
		<table class="table">
			<tr>
				<th>Subject Id</th>
				<th>Subject Name</th>
				<th>Subject Code</th>
				<th>Max. Marks</th>
				<th>Passing Marks</th>
				<th>Total Question</th>
				<th>Duration(min)</th>
				<th>Fees</th>
				<th>Offer(%)</th>
			</tr>
			<%
			SubjectOperations opr = new SubjectOperations();
			List<Subject> list = opr.selectAllSubject();
			for (Subject sub : list) {
			%>
			<tr>
				<td><%=sub.getSub_id()%></td>
				<td><%=sub.getSub_name()%></td>
				<td><%=sub.getSub_code()%></td>
				<td><%=sub.getSub_maxMarks()%></td>
				<td><%=sub.getSub_passingMarks()%></td>
				<td><%=sub.getSub_totalQuest()%></td>
				<td><%=sub.getSub_duration()%></td>
				<td><%=sub.getSub_fees()%></td>
				<td><%=sub.getSub_offer()%></td>
				<td><a class="update"
					href="SubjectControl/UpdateSubjectForm.jsp?id=<%=sub.getSub_id()%>">Update</a></td>
				<td><a class="delete"
					href="../DeleteSubject?id=<%=sub.getSub_id()%>">Delete</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>

</body>
</html>