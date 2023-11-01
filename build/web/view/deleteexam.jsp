<%-- 
    Document   : deleteexam
    Created on : Oct 26, 2023, 6:26:03 PM
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

            button[type="submit"] {
                background-color: #00939C;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                padding: 10px 20px;
                transition: background-color 0.3s ease;
            }

            button[type="submit"]:hover {
                background-color: #007f86;
            }

        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <c:choose>
            <c:when test="${not empty litExamses}">
                <h3>Cancel Exam Schedule!</h3>
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
                        <th>Action</th>
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
                            <td>
                                <form action="deleteexam" method="post">
                                    <input type="hidden" name="registrationsID" value="${r.registrationsID}">
                                    <button type="submit">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <h4>You have not registered for any exam yet.</h4>
            </c:otherwise>
        </c:choose>
    </body>
</html>
