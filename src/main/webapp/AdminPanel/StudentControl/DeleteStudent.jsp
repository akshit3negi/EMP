<%@page import="dao.StudentOperations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	StudentOperations s = new StudentOperations();
	boolean b = s.delete(id);
	if (b) {
		response.sendRedirect("../showAllStudent.jsp");
	}
	else {
		response.getWriter().println("Failed to Delete, Something went wrong!");
	}
	%>
</body>
</html>