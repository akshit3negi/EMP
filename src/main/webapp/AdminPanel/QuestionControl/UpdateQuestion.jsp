<%@page import="bean.Options"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.OptionOperations"%>
<%@page import="bean.Question"%>
<%@page import="dao.QuestionOperations"%>
<%@page import="bean.Subject"%>
<%@page import="dao.SubjectOperations" import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Question form</title>

<style>
body {
	padding: 10px;
	background-color: gray;
}

.AddQuestForm {
	padding: 10px;
	background-color: cornflowerblue;
	display: inline-block;
	vertical-align: top;
}

.Pform {
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
	width: 110px;
}

.Pform .form-group input, #subId {
	width: 150px;
	padding: 10px;
	margin: 5px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

#subId {
	padding: 5px;
	width: 45%;
}

#quest_text, #ans_text {
	width: 83%;
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

form {
	display: flex;
	flex-direction: column;
	gap: 10px;
}
</style>
</head>

<body>
<%
	if (request.getParameter("id") != null) {
		int id = Integer.parseInt(request.getParameter("id"));
		QuestionOperations qo = new QuestionOperations();
		Question quest = qo.selectQuestion(id);
		if (quest != null) {
	%>

	<div class="AddQuestForm">
		<h2>Add Question Form</h2>
		<form class="Pform" action="/EMP/UpdateQuestionController" method="post">
		<input type="hidden" class="form-control" value="<%=quest.getQuest_id()%>" name="id">
			<div class="form-group">
				<label for="subId">Select Subject:</label> <select name="subId" id="subId">
					<option value="<%=quest.getSubject().getSub_id()%>" disabled selected><%=quest.getSubject().getSub_name()%></option>
					<%
					SubjectOperations subo = new SubjectOperations();
					if (subo.selectAllSubject() != null) {
						List<Subject> li = subo.selectAllSubject();
						for (Subject sub : li) {
					%>
					<option value="<%=sub.getSub_id()%>"><%=sub.getSub_name()%></option>
					<%
					}
					}
					%>
				</select> <label for="question_marks">Question Marks:</label> <input
					type="text" class="form-control" id="question_marks"
					name="question_marks" placeholder="question_marks" value="<%=quest.getQuest_marks()%>">
			</div>


			<div class="form-group">
				<label for="quest_text">Write Question:</label> <input type="text"
					class="form-control" id="quest_text" placeholder="quest_text" value="<%=quest.getQuest_text() %>"
					name="quest_text">
			</div>
			<div class="form-group" id="ans_option">
			<%
			OptionOperations oo=new OptionOperations();
			ArrayList<Options> op=oo.selectAllOption();
			Options option=null;
			for(Options opt:op){
				if(quest.getQuest_id()==opt.getQuestNum().getQuest_id())
					option=opt;
			}
			%>
			<input type="hidden" class="form-control" value="<%=option.getOption_id()%>" name="opid">
				<label for="ans_option">Write Options:</label> <input type="text"
					class="form-control" id="ans_option1" value="<%=option.getOption1()%>" placeholder="Option 1"
					name="ans_option1"> <input type="text"
					class="form-control" id="ans_option2" value="<%=option.getOption2()%>" placeholder="Option 2"
					name="ans_option2"> <input type="text"
					class="form-control" id="ans_option3" value="<%=option.getOption3()%>" placeholder="Option 3"
					name="ans_option3"> <input type="text"
					class="form-control" id="ans_option4" value="<%=option.getOption4()%>" placeholder="Option 4"
					name="ans_option4">
			</div>
			<div class="form-group">
				<label for="ans_text">Write Answer:</label> <input type="text"
					class="form-control" id="ans_text" value="<%=quest.getAns_text()%>" placeholder="ans_text"
					name="ans_text">
			</div>

			<div class="button-group">
				<button type="submit" class="btn btn-default">Update</button>
				<button type="reset" class="btn btn-default">Reset
					Form</button>
			</div>
		</form>
	</div>
	<%
	}
	} else
	out.println("Id is null");
	%>
</body>

</html>