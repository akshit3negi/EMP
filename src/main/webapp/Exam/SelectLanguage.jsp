<%@page import="dao.StudentOperations" import="bean.Student"
	import="bean.Subject" import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select Subject</title>
<%@ include file="../common/Header.jsp" %>
<style type="text/css">

body {
            padding-top: 80px;
padding-left: 30px;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            font-size: 25px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        select {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .instructions {
            background-color: #e9ecef;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .instructions h3 {
            margin-top: 0;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            margin-bottom: 10px;
        }

        .btn-submit {
            background-color: #d8595c;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            width: 100%;
            text-align: center;
        }

        .btn-submit:hover {
            background-color: #c14649;
        }

</style>
</head>
<body>
    <div class="container">
        <h1>Examination process - Phase 1</h1>
        <form action="ExamPhase2.jsp">
            <div class="form-group">
                <input type="hidden" value="<%=session.getAttribute("stuid")%>" name="stuid">
                <label for="sub1">Select your Subject: </label>
                <select name="subject">
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
            <div class="instructions">
                <h3>Read before next Phase</h3>
                <ul>
                    <li>The test will be in MCQ pattern.</li>
                    <li>Read the questions carefully.</li>
                    <li>Advised to attempt all the questions.</li>
                    <li><input type="checkbox" required> I am ready</li>
                </ul>
            </div>
            <button type="submit" class="btn-submit" name="submit">Next</button>
        </form>
    </div>
</body>
</html>