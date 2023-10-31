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
            }

            table {
                border-collapse: collapse;
                width: 100%;
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
        <%@ include file="header.jsp" %>
        <h3>View Exam Schedule!</h3>
        <table>
            <tr>
                <th>Exam ID</th>
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
                    <td>${r.exam.examID}</td>
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
