<%-- 
    Document   : updateExam
    Created on : Oct 25, 2023, 4:37:58 PM
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
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }

            th, td {
                border: 1px solid #ccc;
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }

            input[type="text"], input[type="date"], input[type="time"] {
                width: 100%;
                padding: 5px;
                border: 1px solid #ccc;
            }

            input[type="text"][readonly], input[type="date"][readonly], input[type="time"][readonly] {
                background-color: #f2f2f2;
            }

            button[type="submit"] {
                background-color: #007BFF;
                color: #fff;
                padding: 5px 10px;
                border: none;
                cursor: pointer;
            }
        </style>

    </head>
    <body>
        <h1>Update Exam Schedule!</h1>
        <form action="updateexam" method="post">
            <table>
                <tr>
                    <th>Courses Name</th>
                    <th>Exam Date</th>
                    <th>Exam Time</th>
                    <th>Exam Location</th>
                    <th>Exam Type</th>
                    <th>Date of Publication</th>
                </tr>
                <tr>
                    <td><input type="text" name="courseName" value="${examses.courses.courseName}" readonly></td>
                    <td><input type="date" name="examDate" value="${examses.exam_date}"></td>
                    <td><input type="time" name="examTime" value="${examses.exam_time}"></td>
                    <td><input type="text" name="examLocation" value="${examses.exam_location}"></td>
                    <td><input type="text" name="examType" value="${examses.exam_type}"></td>
                    <td><input type="date" name="dateOfPublic" value="${examses.dateOfPublic}"></td>
                <input type="hidden" name="examID" value="${examses.examID}">
                </tr>
                <button type="submit">Update</button>
            </table>
        </form>
    </body>
</html>
