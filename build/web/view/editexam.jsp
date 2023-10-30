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
                border: 1px solid #00939C; /* Màu viền của bảng */
            }

            th, td {
                padding: 8px;
                text-align: center;
            }

            button[type="submit"] {
                padding: 5px 10px;
                background-color: #00939C;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button[type="submit"]:hover {
                background-color: #007f86;
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
