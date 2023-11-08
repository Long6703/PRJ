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
                Filter by class :
                <select name="cname">
                    <option value="all">All</option>
                    <c:forEach var="c" items="${listclass}">
                        <option value="${c.class_nameString}">${c.class_nameString}</option>
                    </c:forEach>
                </select>
                <button type="submit">Search</button>
                <table>
                    <tr>
                        <th>Student ID</th>
                        <th>Student Name</th>
                        <th>Class Name</th>
                        <th>Exam ID</th>
                        <th>Course Name</th>
                        <th>Date Registrations</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach var="r" items="${registrations}">
                        <tr>
                            <td>${r.student.student_id}</td>
                            <td>${r.student.student_name}</td>
                            <td>${r.student.studentClasses.class_nameString}</td>
                            <td>${r.exam.examID}</td>
                            <td>${r.exam.courses.courseName}</td>
                            <td>${r.dateRegistrations}</td>
                        <input type="hidden" name="teacherid" value="${r.exam.courses.teacher.teacher_id}">
                        <input type="hidden" name="courseID" value="${r.exam.courses.courseID}">
                        <td>
                            <form action="updateprocess" method="get">
                                <input type="hidden" name="studentid" value="${r.student.student_id}">
                                <input type="hidden" name="examid" value="${r.exam.examID}">
                                <button name="yes" onclick="hideButton(this)">Approve</button>
                                <button name="no" onclick="hideButton(this)">Reject</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:when>
        <c:otherwise>
            <h4>You have not created a test schedule or have no students registered yet.</h4>
        </c:otherwise>
    </c:choose>
    <script>
        function hideButton(clickedButton) {
            // Lấy danh sách tất cả các nút trong biểu mẫu
            var buttons = document.querySelectorAll('button[name="no"], button[name="yes"]');

            // Ẩn nút đã được nhấn
            clickedButton.style.display = 'none';

            // Lặp qua danh sách nút còn lại và ẩn chúng
            buttons.forEach(function (button) {
                if (button !== clickedButton) {
                    button.style.display = 'none';
                }
            });
        }
    </script>
</body>
</html>
