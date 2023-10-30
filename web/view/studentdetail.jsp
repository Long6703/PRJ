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
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: flex-start;
                height: 100vh;
            }

            h1 {
                text-align: center;
                margin-top: 20px;
                color: #00939C;
            }

            table {
                border-collapse: collapse;
                width: 80%;
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
        <h1>Student detail!</h1>
        ID : <%= s.getStudent_id() %><br>
        Name  :<%= s.getStudent_name() %><br>
        Email : <%= s.getStudent_email() %><br>
        Phone : <%= s.getStudent_phone()%><br>
        Class : <%= s.getStudentClasses().getClass_nameString() %><br>
    </body>
</html>
