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
            th,tr, td, table{
                border: 1px solid black;
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
