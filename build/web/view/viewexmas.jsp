<%-- 
    Document   : viewexmas
    Created on : Oct 23, 2023, 10:21:08 AM
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
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                height: 100vh;
            }

            h1 {
                text-align: center;
                margin-top: 20px;
                color: #00939C;
            }

            table {
                border-collapse: collapse;
                width: 80%;
                margin: 20px auto;
            }

            table, th, td {
                border: 1px solid #00939C;
            }

            th, td {
                padding: 8px;
                text-align: center;
            }


        </style>
    </head>
    <body>
        <h1>View Exam Schedule!</h1>
        <table>
            <tr>
                <th>Courses ID</th>
                <th>Courses Name</th>
                <th>Exam Date</th>
                <th>Exam Time</th>
                <th>Exam Location</th>
                <th>Exam Form</th>
                <th>Exam Type</th>
                <th>Date of Publication</th>
            </tr>

            <c:forEach var="r" items="${litExamses}">
                <tr>
                    <td>${r.exam.courses.courseID}</td>
                    <td>${r.exam.courses.courseName}</td>
                    <td>${r.exam.exam_date}</td>
                    <td>${r.exam.exam_time}</td>
                    <td>${r.exam.exam_location}</td>
                    <td>${r.exam.exam_form}</td>
                    <td>${r.exam.exam_type}</td>
                    <td>${r.exam.dateOfPublic}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
