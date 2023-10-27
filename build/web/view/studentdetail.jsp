<%-- 
    Document   : studentdetail
    Created on : Oct 19, 2023, 4:07:17 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Student" %>
<%@page import="Model.Classes" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            Student s = null;
            if(request.getAttribute("student_infor")!=null){
                s = (Student)request.getAttribute("student_infor");
            }
        %>

        <style>
            th, tr, td {
                border: 1px solid black;
            }
        </style>
    </head>
    <body>
        <h1>Student detail!</h1>
        ID : <%= s.getStudent_id() %><br>
        Name  :<%= s.getStudent_name() %><br>
        Email : <%= s.getStudent_email() %><br>
        Phone : <%= s.getStudent_phone()%><br>
        Class : <%= s.getStudentClasses().getClass_nameString() %><br>
    </body>
</html>
