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

            input[type="text"],
            input[type="date"],
            input[type="time"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            button[type="submit"] {
                padding: 5px 10px;
                background-color: #00939C;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-left: 500px;
            }

            button[type="submit"]:hover {
                background-color: #007f86;
            }

        </style>

    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h3>Update Exam Schedule!</h3>
        <form action="updateexam" method="post">
            <table>
                <tr>
                    <th>Exam ID</th>
                    <th>Courses Name</th>
                    <th>Exam Date</th>
                    <th>Exam Time</th>
                    <th>Exam Location</th>
                    <th>Exam Type</th>
                    <th>Date of Publication</th>
                </tr>
                <tr>
                    <td><input type="text" name="examId" value="${examses.examID}" readonly></td>
                    <td><input type="text" name="courseName" value="${examses.courses.courseName}" readonly></td>
                    <td><input type="date" name="examDate" value="${examses.exam_date}"></td>
                    <td><input type="time" name="examTime" value="${examses.exam_time}"></td>
                    <td><input type="text" name="examLocation" value="${examses.exam_location}"></td>
                    <td><input type="text" name="examType" value="${examses.exam_type}"></td>
                    <td><input type="date" name="dateOfPublic" value="${examses.dateOfPublic}"></td>
                <input type="hidden" name="examID" value="${examses.examID}">
                </tr>
            </table>
            <button type="submit">Update</button>
        </form>
    </body>
</html>
