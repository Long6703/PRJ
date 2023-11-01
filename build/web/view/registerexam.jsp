<%-- 
    Document   : registerexam
    Created on : Oct 23, 2023, 2:06:03 PM
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
        <h3>Register for exam schedule!</h3>
        <c:choose>
            <c:when test="${not empty listCourseses}">
                <table>
                    <tr>
                        <th>Exam ID</th>
                        <th>Course ID</th>
                        <th>Course Name</th>
                        <th>Teacher ID</th>
                        <th>Teacher Name</th>
                        <th>Teacher email</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach var="c" items="${listCourseses}">
                        <tr>
                            <td>${c.examID}</td>
                            <td>${c.courses.courseID}</td>
                            <td>${c.courses.courseName}</td>
                            <td>${c.teacher.teacher_id}</td>
                            <td>${c.teacher.teacher_nameString}</td>
                            <td>${c.teacher.teacher_emailString}</td>
                            <td>
                                <form action="registerexam" method="post">
                                    <input type="hidden" name="examid" value="${c.examID}">
                                    <button type="submit">Register</button>
                                </form>
                            </td>
                        </tr>   
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <h4>There are no exams yet.</h4>
            </c:otherwise>
        </c:choose>
    </body>
</html>
