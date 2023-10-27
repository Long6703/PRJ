<%-- 
    Document   : registerexam
    Created on : Oct 23, 2023, 2:06:03 PM
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
            table, th, td, tr{
                border: 1px solid black;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px;
            }

            th, td {
                border: 1px solid #ccc;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #3498db;
                color: #fff;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:nth-child(odd) {
                background-color: #fff;
            }

            button {
                background-color: #3498db;
                color: #fff;
                border: none;
                padding: 8px 12px;
                cursor: pointer;
            }

            button:hover {
                background-color: #2980b9;
            }

            form {
                margin: 20px;
            }

        </style>
    </head>
    <body>
        <h1>Register for exam schedule!</h1>
        <table>
            <tr>
                <th>Course ID</th>
                <th>Course Name</th>
                <th>Teacher ID</th>
                <th>Teacher Name</th>
                <th>Teacher email</th>
                <th>Action</th>
            </tr>
            <c:forEach var="c" items="${listCourseses}">
                <tr>
                    <td>${c.courses.courseID}</td>
                    <td>${c.courses.courseName}</td>
                    <td>${c.teacher.teacher_id}</td>
                    <td>${c.teacher.teacher_nameString}</td>
                    <td>${c.teacher.teacher_emailString}</td>
                    <td>
                        <form action="registerexam" method="post">
                            <input type="hidden" name="examid" value="${c.examID}">
                            <button type="submit">Register</button>
                        </form>
                    </td>
                </tr>   
            </c:forEach>
        </table>
    </body>
</html>
