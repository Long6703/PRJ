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
            table, th, tr, td{
                border: 1px solid black;
            }
        </style>
    </head>
    <body>
        <h1>List Course!</h1>
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
                            <button type="submit">List Student Registration</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
