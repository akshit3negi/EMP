<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<title>Student Registration Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<%-- <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/common/style.css"> --%>
<%@ include file="common/Header.jsp" %>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding-top: 70px;
        }

        .form-container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            font-size: 25px;
        }

        .form-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .form-half {
            width: 45%;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="date"],
        input[type="password"],
        input[type="tel"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        button {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Student Registration Form</h2>
        <br>
        <form method="post" action="./RegisterController">
            <div class="form-row">
                <div class="form-half">
                    <label for="name">Full Name:</label>
                    <input type="text" id="name" placeholder="Enter full name" name="name">
                </div>

                <div class="form-half">
                    <label for="admission_date">Admission Date:</label>
                    <input type="date" id="admission_date" name="admission_date">
                </div>
            </div>
            <br>
            <div class="form-row">
                <div class="form-half">
                    <label for="username">Username:</label>
                    <input type="text" id="username" placeholder="Enter username" name="username">
                </div>

                <div class="form-half">
                    <label for="password">Password:</label>
                    <input type="password" id="password" placeholder="Enter password" name="password">
                </div>
            </div>
            <br>
            <div class="form-row">
                <div class="form-half">
                    <label for="contact">Contact No.:</label>
                    <input type="tel" id="contact" placeholder="Enter contact no." pattern="[0-9]{10}" name="contact">
                </div>
                <div class="form-half">
                    <label for="address">Address:</label>
                    <input type="text" id="address" placeholder="Enter address" name="address">
                </div>
            </div>
            <br>
            <div class="form-row">
                <div class="form-half">
                    <label for="course">Course:</label>
                    <input type="text" id="course" placeholder="Enter course" name="course">
                </div>

                <div class="form-half">
                    <label for="fees">Course Fee:</label>
                    <input type="text" id="fees" placeholder="Enter fee" name="fees">
                </div>
            </div>
            <br>
            <button type="submit" class="btn btn-default">Register</button>
            <button type="reset" class="btn btn-default">Clear Form</button>
        </form>
    </div>
</body>
</html>
