<%-- 
    Document   : editexam
    Created on : Oct 25, 2023, 12:46:53 PM
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
        <h1>Edit exam schedule!</h1>
        <table>
            <tr>
                <th>Course Name</th>
                <th>Exam date</th>
                <th>Exam time</th>
                <th>Exam location</th>
                <th>Exam form</th>
                <th>Exam type</th>
                <th>Date of public</th>
                <th>Action</th>
            </tr>
            <c:forEach var="exam" items="${allExamByTeacher}">
                <tr>
                    <td>${exam.courses.courseName}</td>
                    <td>${exam.exam_date}</td>
                    <td>${exam.exam_time}</td>
                    <td>${exam.exam_location}</td>
                    <td>${exam.exam_form}</td>
                    <td>${exam.exam_type}</td>
                    <td>${exam.dateOfPublic}</td>
                    <td>
                        <form action="editexam" method="post">
                            <input type="hidden" name="examId" value="${exam.examID}">
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                    <td>
                        <form action="updateexam" method="get">
                            <input type="hidden" name="courseId" value="${exam.examID}">
                            <button type="submit">Update</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
