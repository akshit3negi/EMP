<%@page import="bean.StuExamInfo"%>
<%@page import="dao.StuExamInfoOperation"%>
<%@page import="dao.QuestionOperations"%>
<%@page import="dao.AnswerOperations"%>
<%@page import="dao.SubjectOperations"%>
<%@page import="dao.StudentOperations"%>
<%@page import="dao.SubjectDeclaration"%>
<%@page import="dao.StudentDeclaration"%>
<%@page import="bean.Student"
		import="bean.Subject"
		import="bean.Answer"
		import="bean.Question"
		import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Report</title>
<style type="text/css">

body {
    font-family: monospace;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
    font-size: 15px;
}

.container {
    background: white;
    height: auto;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 80%;
    margin: auto;
}

h2, h3 {
    color: #333;
    font-weight: bold;
    margin-bottom: 10px;
}

.profile-name {
    display: flex;
    align-items: center;
    gap: 20px;
}

.profile-name img {
    border-radius: 50%;
    border: 3px solid #ddd;
    width: 100px;
    height: 100px;
}

.flex-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    margin-bottom: 20px;
}

.flex-item {
    padding: 10px;
    margin-right:50px;
    flex: 1;
    color: #007bff;
}

.progress-container {
    width: 100%;
    background: #e0e0e0;
    border-radius: 5px;
    overflow: hidden;
    margin-top: 10px;
}

.progress-bar {
    background: #4caf50;
    height: 20px;
    text-align: center;
    color: white;
    line-height: 20px;
    font-weight: bold;
}

.card {
    padding: 10px;
    border-radius: 5px;
    background: #f9f9f9;
    border-left: 5px solid #007bff;
    margin-bottom: 10px;
}

.box-shadow {
    box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
    border-radius: 5px;
    padding: 10px;
}

strong,i {
/*     font-weight: bold; */
    color: #f2f3f4;
}

.table {
    width: 100%;
    border-collapse: collapse;
    background: white;
}

.table th, .table td {
    padding: 10px;
    text-align: left;
    border: 1px solid #ddd;
}

.table th {
    background: #007bff;
    color: white;
}

.table-striped tbody tr:nth-child(odd) {
    background-color: #f2f2f2;
}

.Pstamp {
   display: inline-block;
   margin-left: 10px;
   padding: 2px 15px;
   color: green;
   font-size: 1.5em;
   font-weight: bold;
   text-transform: uppercase;
   border: 3px solid green;
   border-radius: 5px;
   transform: rotate(10deg);
	box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.5);
	opacity: 0.85;
    }
    
    .Fstamp {
   display: inline-block;
   margin-left: 10px;
   padding: 2px 15px;
   color: red;
   font-size: 1.5em;
   font-weight: bold;
   text-transform: uppercase;
   border: 3px solid red;
   border-radius: 5px;
   transform: rotate(10deg);
	box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.5);
	opacity: 0.85;
    }

</style>
</head>
<body>
<div class="container">
<h2>Result:</h2>
<%
int subid=Integer.parseInt(request.getParameter("sub"));
int id=Integer.parseInt(request.getParameter("stu"));

if(id>0){
	
StudentOperations so=new StudentOperations();
SubjectOperations subo=new SubjectOperations();
QuestionOperations qo=new QuestionOperations();
AnswerOperations ao=new AnswerOperations();

Student st= so.selectStudent(id);
Subject sub=subo.selectSubject(subid);
List<Answer> li=ao.selectByStuAndLang(st,sub);
int qno=0;
%>
<div class="flex-container profile-name">
<div class="flex-item text-center">
<img src="#" height="100" width="100" alt="profile_pic"/>
<pre>
    <%=st.getName()%>
</pre>
</div>
<div class="flex-item">
            <p><strong>Username:</strong> <%= st.getUsername() %></p>
            <p><strong>Contact:</strong> <%= st.getContact() %></p>
            <p><strong>Address:</strong> <%= st.getAddress() %></p>
            <p><strong>Admission Date:</strong> <%= st.getAdmission_date() %></p>
            <p><strong>Course:</strong> <%= st.getCourse() %></p>
        </div>
<div class="flex-item">
<% 
StuExamInfoOperation seio=new StuExamInfoOperation();
StuExamInfo seiOb=seio.selectByStuAndLang(st, sub);
int correctQuest=seiOb.getCorrectQuest();
int marksScored=seiOb.getMarks();
int questAttempted=li.size();
String status=seiOb.getStatus();
List<Question> list=qo.getTotalQuest(sub);
int totalQuestions=list.size();
int TotalMarksSum=0;
for(Question ql:list) {
	TotalMarksSum+=ql.getQuest_marks();
	}
double percent=((marksScored * 100) / TotalMarksSum);

%>
            <p><i>Total Question:</i> <%=totalQuestions%></p>
            <p><i>Total Questions Attempted:</i> <%= questAttempted%></p>
            <p><i>Total Correct Answers:</i> <%= correctQuest %></p>
            <p><i>Total Marks:</i> <%= TotalMarksSum %></p>
            <p><i>Marks Obtained:</i> <%= marksScored %></p>
            <p style="display: inline-block;"><i>Status:</i>
            <div class=<% 
            if(status.equals("Pass")){ %>"Pstamp" <%}
            else if(status.equals("Fail")){%>"Fstamp"<% }
            %>> <%= status %></div></p>
            
            <div class="progress-container">
                <div class="progress-bar" style="width:<%= percent+"%"%>; <%if(percent<60 && percent>=30){%> background:#ffc40c; <%}else if(percent<30){%> background:red<%}%>";><%= percent+"%"%></div>
            </div>
        </div>        
    </div>
<table class="table table-bordered table-striped" style="margin-top: 20px;">
    <thead>
        <tr>
            <th>Question No.</th>
            <th>Question</th>
            <th>Your Answer</th>
            <th>Right Answer</th>
            <th>Correct?</th>
        </tr>
    </thead>
    <tbody>
        <%
        for (Answer ans : li) {
            qno++;
        %>
        <tr>
            <td><%= qno %></td>
            <td><%= ans.getQuest().getQuest_text() %></td>
            <td><%= ans.getAnstext() %></td>
            <td><%= ans.getQuest().getAns_text() %></td>
            <td><%= ans.iscorrect()?"Yes":"No"%></td>
        </tr>
        <%
        }
        %>
    </tbody>
</table>
<%
}
%>
</div>
</body>
</html>