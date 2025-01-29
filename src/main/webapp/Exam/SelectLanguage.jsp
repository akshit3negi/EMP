<%@page import="dao.StudentOperations" import="bean.Student"
	import="bean.Subject" import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select Subject</title>
</head>
<body>
	<div class="container">
		<h1>Examination process -> Phase1:</h1>
		<form action="ExamPhase2.jsp">
			<div class="form-group">
			<input type="hidden" class="form-control" value="<%=session.getAttribute("stuid")%>" name="stuid">
				<label for="sub1">Select your Subject: </label> <select
					class="form-control" name="subject">
					<%
					int stid = Integer.parseInt(session.getAttribute("stuid").toString());
					StudentOperations sto = new StudentOperations();
					if (sto.selectStudent(stid) != null) {
						Student st = sto.selectStudent(stid);
						Set<Subject> subjectlist = st.getSub_list();
						for (Object su : subjectlist) {
							Subject sub = (Subject) su;
					%>
					<option value="<%=sub.getSub_id() %>"><%= sub.getSub_name() %></option>
					<%
					}
					}
					%>
				</select>
			</div>
			<div class="jumbotron">
			<h3>Read before next Phase</h3>
			<ul>
			<li>The test will be in MCQ pattern.</li>
			<li>Read the questions carefully.</li>
			<li>Advised to attempt all the questions.</li>
			<li><input type="checkbox" required>I am ready</li>
			</ul>
			</div>
			<button type="submit" class="btn btn-success" name="submit">Next</button>
		</form>
	</div>
</body>
</html>