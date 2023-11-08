<%-- 
    Document   : viewexmas
    Created on : Oct 23, 2023, 10:21:08 AM
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
            .page-link {
                margin-right: 10px; 
                margin-left:  10px;/* Khoảng cách giữa các số */
            }

            .current-page {
                font-weight: bold; /* Làm nổi bật trang hiện tại */
            }


        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h3>View Exam Schedule!</h3> 
        <c:choose>
            <c:when test="${not empty litExamses}">
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
                        <th>Status Process</th>
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
                            <td>${r.statusprocess}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <h4>There are no exams yet.</h4>
            </c:otherwise>
        </c:choose>
        <div id="pagger"></div>
        <script>
            function renderPager(id, pageIndex, totalPage, gap) {
                var container = document.getElementById(id);

                // Hiển thị liên kết "First" nếu không ở trang đầu
                if (pageIndex > 1) {
                    container.innerHTML += '<a href="viewexam?userid=${user.userid}&role=${user.role}&pageindex=1">First</a>';
                }

                // Hiển thị các trang trước trang hiện tại
                for (var i = pageIndex - gap; i < pageIndex; i++) {
                    if (i > 0) {
                        container.innerHTML += '<a class="page-link" href="viewexam?userid=${user.userid}&role=${user.role}&pageindex=' + i + '">' + i + '</a>';
                    }
                }

                // Hiển thị trang hiện tại
                container.innerHTML += '<span class="current-page">' + pageIndex + '</span>';

                // Hiển thị các trang sau trang hiện tại
                for (var i = pageIndex + 1; i <= pageIndex + gap; i++) {
                    if (i <= totalPage) {
                        container.innerHTML += '<a class="page-link" href="viewexam?userid=${user.userid}&role=${user.role}&pageindex=' + i + '">' + i + '</a>';
                    }
                }

                // Hiển thị liên kết "Last" nếu không ở trang cuối
                if (pageIndex < totalPage) {
                    container.innerHTML += '<a href="viewexam?userid=${user.userid}&role=${user.role}&pageindex=' + totalPage + '">Last</a>';
                }
            }
            renderPager('pagger', ${requestScope.pageindex}, ${requestScope.totalpage}, 1);
        </script>
    </body>
</html>
