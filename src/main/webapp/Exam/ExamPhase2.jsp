<%@page import="dao.StudentOperations"%>
<%@page import="bean.Student"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.OptionOperations"%>
<%@ page import="bean.Options"%>
<%@ page import="bean.Question"%>
<%@ page import="java.util.List"%>
<%@ page import="bean.Subject"%>
<%@ page import="dao.SubjectOperations"%>
<%@ page import="dao.QuestionOperations"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Exam</title>
<style>
body {
	font-family: monospace;
}

h2, h3 {
	margin: 1px;
	font-weight: bold;
	color: black;
}
</style>
</head>
<body>

	<div class="container">
		<%
		int qno = 0;
		boolean lastQ=false;
		if (request.getParameter("submit") != null) {
			int subid = Integer.parseInt(request.getParameter("subject"));
			int stuid = Integer.parseInt(request.getParameter("stuid"));
			QuestionOperations qo = new QuestionOperations();
			Subject sub = new SubjectOperations().selectSubject(subid);
			Student stu = new StudentOperations().selectStudent(stuid); 
		%>
		<h1>
			Subject Id:
			<%=sub.getSub_id()%>
			Subject Name:
			<%=sub.getSub_name()%></h1>
			
			
			<%
        String message = (String) session.getAttribute("message");
        if (message != null) {
        %>
            <p style="color: red; font-weight: bold;"><%= message %></p>
        <%
            session.removeAttribute("message");
        }
        %>
			
		<%
//		List<Question> li = qo.selectBySubject(sub);
		List<Question> li=qo.selectNotIn(sub, stu);
		if (li != null && li.size() != 0) {
			for (Question ql : li) {
				qno++;
				if(li.size()==1) lastQ=true;
				OptionOperations oo = new OptionOperations();
				ArrayList<Options> ol = oo.selectAllOption();
				Options option = null;
				for (Options op : ol) {
					if (op.getQuestNum().getQuest_id() == ql.getQuest_id()) {
					option = op;
				}
				}
				if (option != null) {
			System.out.println("before answer submission");
			
		%>
		<form action="../Question_Check_store">
			<div class="well well-sm">
				<h3>
					<br>(<%=qno%>) :
					<%=ql.getQuest_text()%>
					<span class="badge badge-success"> [<%=ql.getQuest_marks()%> marks]
					</span>
				</h3>
				<ul class="list-group">
					<li class="list-group-item"><input type="radio"
						value="<%=option.getOption1()%>" name="answer" required><%=option.getOption1()%></li>
					<li class="list-group-item"><input type="radio"
						value="<%=option.getOption2()%>" name="answer"><%=option.getOption2()%></li>
					<li class="list-group-item"><input type="radio"
						value="<%=option.getOption3()%>" name="answer"><%=option.getOption3()%></li>
					<li class="list-group-item"><input type="radio"
						value="<%=option.getOption4()%>" name="answer"><%=option.getOption4()%></li>
					<input type="hidden" value="<%=stu.getSid()%>" name="stuid">
					<input type="hidden" value="<%=ql.getQuest_id()%>" name="qid">
					<input type="hidden" value="<%=sub.getSub_id()%>" name="subid">
					<input type="hidden" value="<%=lastQ%>" name="lastQ">
					<br>
					<button type="submit" class="next" name="submit">Submit</button>
				</ul>
			</div>
		</form>
		
		<%
		} else {
		out.println("Options not found.");
		}
		}
		} else {
		out.println("Looks like you have already attended the Exam Or There are No Question for " + sub.getSub_name() + " subject.");
		%> <br> 
		Check your Previous Score for <%=sub.getSub_name()%> 
		<a href="Result.jsp?sub=<%=sub.getSub_id()%>&stu=<%=stu.getSid()%>"> Get Report</a>
		<%
		}
		} else {
		out.println("No Subject Selected.");
		}
		%>
	</div>
	
</body>
</html>
