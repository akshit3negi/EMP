<%@page import="dao.StudentOperations" import="dao.SubjectOperations"
	import="bean.Student" import="bean.Subject" import="java.util.Set"
	import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Update form</title>

<style>
body {
	padding: 10px;
	background-color: gray;
}

.UpdateForm, .Subject {
	padding: 10px;
	background-color: cornflowerblue;
	display: inline-block;
	vertical-align: top;
}

.Subject {
	background-color: rgb(99, 72, 150);
}

.takenSub, .allSub {
	padding: 10px;
	background-color: rgb(125, 97, 170);
	display: inline-block;
}

.Pform, .Cform1, .Cform2 {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
}

.Pform .form-group {
	display: inline-block;
	display: flex;
	flex-direction: row;
	align-items: center;
	width: 100%;
	justify-content: space-around;
}

.Pform .form-group label {
	width: 75px;
	margin-right: 10px;
}

.Pform .form-group input {
	width: 150px;
	padding: 10px;
	margin: 3px 10px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

button[type="submit"], button[type="reset"] {
	padding: 3px 10px;
	margin-top: 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 25%;
	color: black;
}

button[type="submit"] {
	background-color: #4CAF50;
}

button[type="reset"] {
	background-color: #f44336;
}

.button-group {
	display: flex;
	gap: 10px;
	justify-content: left;
}

.takenSub button[type="submit"] {
	padding: 10px 10px;
	margin-top: 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
	color: black;
}

.allSub button[type="submit"] {
	padding: 10px 10px;
	margin-top: 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
	color: black;
}

form {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.container {
	display: flex;
	gap: 20px;
}
</style>
</head>

<body>

	<div class="AllForm">
	
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	if (request.getParameter("id") != null) {
		StudentOperations st = new StudentOperations();
		Student stu = st.selectStudent(id);
		if (stu != null) {
	%>
	
		<div class="UpdateForm">
			<h2>Update Form</h2>
			<form class="Pform" action="/EMP/FinalUpdate" method="post">
				<input type="hidden" class="form-control" value="<%=stu.getSid()%>"
					name="id">
				<div class="form-group">
					<label for="name">Full Name:</label> <input type="text"
						class="form-control" id="name" value="<%=stu.getName()%>"
						placeholder="Enter full name" name="name"> 
					<label for="admission_date">Admission Date:</label> <input type="date"
						class="form-control" id="admission_date"
						value="<%=stu.getAdmission_date()%>" name="admission_date">
				</div>
				<div class="form-group">
					<label for="username">Username:</label> <input type="text"
						class="form-control" id="username" value="<%=stu.getUsername()%>"
						placeholder="Enter username" name="username"> 
						<label for="password">Password:</label> <input type="password"
						class="form-control" id="password" value="<%=stu.getPassword()%>"
						placeholder="Enter password" name="password">
				</div>
				<div class="form-group">
					<label for="contact">Contact No.:</label> <input type="tel"
						class="form-control" id="contact" value="<%=stu.getContact()%>"
						placeholder="Enter contact no." pattern="[0-9]{10}" name="contact">
					<label for="address">Address:</label> <input type="text"
						class="form-control" id="address" value="<%=stu.getAddress()%>"
						placeholder="Enter address" name="address">
				</div>
				<div class="form-group">
					<label for="course">Course:</label> <input type="text"
						class="form-control" id="course" value="<%=stu.getCourse()%>"
						placeholder="Enter course" name="course"> <label
						for="fees">Course Fee:</label> <input type="text"
						class="form-control" id="fees" value="<%=stu.getFees()%>"
						placeholder="Enter fee" name="fees">
				</div>
				<div class="button-group">
					<button type="submit" class="btn btn-default">Update</button>
					<button type="reset" class="btn btn-default">Reset Form</button>
				</div>
			</form>
		</div>
		<%
	}
	} else
	out.println("Id id null");
	%>
		<!-- ------------------------------Add/Remove Subject----------------------------- -->
		<div class="Subject">
			<div class="takenSub">
				<h3>Selected Subject</h3>
				<form class="Cform1" action="../../RemoveSubjectFromStudent">
				<%
							StudentOperations so = new StudentOperations();
							Student s = so.selectStudent(id);
							Set<Subject> set = s.getSub_list();
							if (set.size() == 0)
								out.println("To be added");
							else
								for (Subject sub : set) {
							%>
					<li><input type="checkbox" name="<%=sub.getSub_name()%>" value="<%=sub.getSub_id()%>"><%=sub.getSub_name()%>
					</li>
						<%
							}
							%>
						 <input type="hidden" name="id" value="<%=id%>">
					<button type="submit" name="removesub" class="btn btn-success" value="Remove">Remove Subject</button>
				</form>
			</div>
			
			<div class="allSub">
				<h3>All Subjects</h3>
				<form class="Cform2" action="../../AddSubjectController">
					<%
			SubjectOperations subo=new SubjectOperations();
			List<Subject> list=subo.selectAllSubject();
			for(Subject sub:list){
			%>
					<li><input type="checkbox"
						name="<%=sub.getSub_name()%>" value="<%=sub.getSub_id()%>"><%=sub.getSub_name() %>
						</li> 
						<%
			}
			%>
						<input type="hidden" name="id" value="<%=id%>">
					<button type="submit" name="addsub" class="btn btn-success"
						value="Add">Add Subject</button>
				</form>
			</div>
		</div>
	</div>
</body>

</html>
