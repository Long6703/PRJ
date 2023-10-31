<%-- 
    Document   : examregistrationlist
    Created on : Oct 27, 2023, 12:00:44 PM
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
        <%@ include file="header.jsp" %>
        <h3>List Course!</h3>
        <table>
            <tr>
                <th>Course ID</th>
                <th>Course Name</th>
                <th>Action</th>
            </tr>
            <c:forEach var="c" items="${listCourseses}">
                <tr>
                    <td>${c.courseID}</td>
                    <td>${c.courseName}</td>
                    <td>
                        <form action="examregistrationlist" method="post">
                            <input type="hidden" name="teacherid" value="${c.teacher.teacher_id}">
                            <input type="hidden" name="courseID" value="${c.courseID}">
                            <button type="submit">List Student Registration</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
