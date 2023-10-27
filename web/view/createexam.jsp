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
            .form-container {
                display: flex;
                align-items: center;
                margin-bottom: 2%;
            }

            .form-label {
                flex: 0.2;
                text-align: right;
                padding-right: 10px;
            }

            .form-input {
                flex: 2;
            }
            thead, tr, td{
                border: 1px solid black;
            }
            table{
                margin-top: 30px;
            }

            .error-message {
                color: red;
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
        </form>
    </body>
</html>
