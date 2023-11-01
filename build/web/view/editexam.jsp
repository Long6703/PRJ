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
                font-weight: 20px;
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
        <%@ include file="header.jsp" %>
        <h3>Edit exam schedule!</h3>
        <c:choose>
            <c:when test="${not empty allExamByTeacher}">
                <table>
                    <tr>
                        <th>Exam ID</th>
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
                            <td>${exam.examID}</td>
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
            </c:when>
            <c:otherwise>
                <h4>You have not created any exams yet.</h4>
            </c:otherwise>
        </c:choose>
    </body>
</html>
