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

        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h3>List Student Registrations!</h3>
        <c:choose>
            <c:when test="${not empty registrations}">
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
            </c:when>
            <c:otherwise>
                <h4>You have not created a test schedule or have no students registered yet.</h4>
            </c:otherwise>
        </c:choose>

    </body>
</html>
