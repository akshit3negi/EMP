<%@page import="bean.Answer"%>
<%@page import="dao.AnswerOperations"%>
<%@page import="bean.Question"%>
<%@page import="dao.QuestionOperations"%>
<%@page import="dao.OptionOperations" import="bean.Options"
	import="java.util.ArrayList"%>
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
<title>Answers List</title>
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
	<!------------------------ Navigation Bar ----------------------------->
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
	<!------------------------ All Records -------------------------------->

	<h2 style="text-align: center;">All Answers</h2>
	<div class="container-fluid">
		<table class="table">
			<tr>
				<th>Answer ID</th>
				<th>Subject Name</th>
				<th>Question</th>
				<th>Question Marks</th>
				<th>Answer by Student</th>
				<th>Correct Answer</th>
				<th>Correct</th>
				<th>Date</th>
			</tr>
			<%
			AnswerOperations ansop = new AnswerOperations();
			if (ansop.selectAllAnswer() != null) {
				for (Answer ans : ansop.selectAllAnswer()) {
			%>
			<tr>
				<td><%=ans.getAns_id()%></td>
				<td><%=ans.getSub().getSub_name()%></td>
				<td><%=ans.getQuest().getQuest_text()%></td>
				<td><%=ans.getQuest().getQuest_marks()%></td>
				<td><%=ans.getAnstext()%></td>
				<td><%=ans.getQuest().getAns_text()%></td>
				<td><%=ans.iscorrect()%></td>
				<td><%=ans.getAnsdate()%></td>
			</tr>
			<%
			}
			}
			%>
		</table>
	</div>

</body>
</html>