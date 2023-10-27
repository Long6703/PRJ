<%-- 
    Document   : teacherdetail
    Created on : Oct 19, 2023, 4:22:53 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Teacher" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            Teacher t = null;
            if(request.getAttribute("teacher_infor")!=null){
                t = (Teacher)request.getAttribute("teacher_infor");
            }
        %>
    </head>
    <body>
        <h1>Teacher detail!</h1>
        ID : <%= t.getTeacher_id() %><br>
        Name : <%= t.getTeacher_nameString() %><br>
        Email : <%= t.getTeacher_emailString() %><br>
        Phone : <%= t.getTeacher_phoneString() %><br>
    </body>
</html>