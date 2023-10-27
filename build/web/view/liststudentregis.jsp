<%-- 
    Document   : liststudentregis
    Created on : Oct 27, 2023, 12:22:22 PM
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
            table, th, tr, td{
                border: 1px solid black;
            }
        </style>
    </head>
    <body>
        <h1>List Student Registrations!</h1>
        <table>
            <tr>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Class Name</th>
                <th>Exam ID</th>
                <th>Course ID</th>   
                <th>Course Name</th>
                <th>Date Registrations</th> 
            </tr>
            <c:forEach var="r" items="${registrations}">
                <tr>
                    <td>${r.student.student_id}</td>
                    <td>${r.student.student_name}</td>
                    <td>${r.student.studentClasses.class_nameString}</td>
                    <td>${r.exam.examID}</td>
                    <td>${r.exam.courses.courseID}</td>
                    <td>${r.exam.courses.courseName}</td>
                    <td>${r.dateRegistrations}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>