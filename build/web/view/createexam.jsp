<%-- 
    Document   : createexam
    Created on : Oct 25, 2023, 10:47:13 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }

            h1 {
                text-align: center;
                margin-top: 20px;
                color: #00939C;
            }

            .form-container {
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 2% 0;
            }

            .form-label {
                flex: 1;
                text-align: right;
                padding: 10px;
            }

            .form-input {
                flex: 2;
                padding: 5px;
            }

            select,
            input[type="date"],
            input[type="time"],
            input[type="text"],
            input[type="radio"] {
                width: 500px;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type="radio"] {
                width: auto;
            }

            table {
                margin: 30px auto;
                border-collapse: collapse;
            }

            table, th, td {
                border: 1px solid black;
            }

            th, td {
                padding: 8px;
                text-align: center;
            }

            .error-message {
                color: red;
            }

            .button {
                display: block;
                margin: 0 auto;
                padding: 10px 20px;
                background-color: #00939C;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .button:hover {
                background-color: #007f86;
            }
            
            span {
                color: red;
                margin-left: 550px;
                margin-top: 100px;
            }
        </style>

    </head>
    <body>
        <h1>Create exam schedule!</h1>
        <form action="createexam" method="post">
            <div class="form-container">
                <div class="form-label">Courses :</div>
                <div class="form-input">
                    <select name="courseID">
                        <c:forEach items="${coursesList}" var="c">
                            <option value="${c.courseID}">${c.courseName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-container">
                <div class="form-label">Exam Date:</div>
                <div class="form-input"><input type="date" name="examdate"></div>
            </div>
            <div class="form-container">
                <div class="form-label">Exam Time:</div>
                <div class="form-input"><input type="time" name="examtime"></div>
            </div>
            <div class="form-container">
                <div class="form-label">Exam Location :</div>
                <div class="form-input"><input type="text" name="examlocation"></div>
            </div>
            <div class="form-container">
                <div class="form-label">Exam Type:</div>
                <div class="form-input">
                    <input type="radio" name="examtype" value="FE" checked>FE
                    <input type="radio" name="examtype" value="PE">PE
                </div>
            </div>
            <div class="form-container">
                <div class="form-label">Date of Public:</div>
                <div class="form-input"><input type="date" name="dateofpublic"></div>
            </div>
            <input type="hidden" name="teacherID" value="${coursesList[0].teacher.teacher_id}" />
            <button class="button" type="submit" name="addname" value="add">Create</button>
            <span style="color: red">${err}</span>
        </form>
    </body>
</html>
