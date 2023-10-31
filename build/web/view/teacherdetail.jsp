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
        <style>
            body {
                font-family: Arial, sans-serif;
                font-weight: 20px;
            }


            .form-container {
                display: flex;
            }

            .form-label {
                flex: 1;
                text-align: right;
                padding: 10px;
            }

            .form-input {
                flex: 9;
                padding: 5px;
            }

            input[type="text"] {
                width: 500px;
                padding: 8px;
                border: 1px solid #00939C;
                border-radius: 4px;
                box-sizing: border-box;
            }

            button[type="submit"] {
                background-color: #00939C;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                padding: 10px 20px;
                transition: background-color 0.3s ease;
                margin-left: 250px;
            }

            button[type="submit"]:hover {
                background-color: #007f86;
            }

            .but{
                margin-top: 20px;
                background-color: #00939C;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                padding: 10px 20px;
                transition: background-color 0.3s ease;
                
            }
            
            .but:hover {
                background-color: #007f86;
            }

            .feature{
                display: flex;
                gap: 50px;
                margin-left: 100px;
            }

        </style>
        <%
            Teacher t = null;
            if(request.getAttribute("teacher_infor")!=null){
                t = (Teacher)request.getAttribute("teacher_infor");
            }
            
            Users u = null;
            if(request.getSession().getAttribute("user")!=null){
                u = (Users)request.getSession().getAttribute("user");
            }
        %>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h3>Teacher detail!</h3>
        <div class="form-container">
            <div class="form-label">ID :</div>
            <div class="form-input"><input type="text" name="id" value="<%= t.getTeacher_id() %>" readonly></div>
        </div>
        <div class="form-container">
            <div class="form-label">Name :</div>
            <div class="form-input"><input type="text" name="name" value="<%= t.getTeacher_nameString() %>" readonly></div>
        </div>
        <div class="form-container">
            <div class="form-label">Email : </div>
            <div class="form-input"><input type="text" name="email" value="<%= t.getTeacher_emailString() %>" readonly></div>
        </div>
        <div class="form-container">
            <div class="form-label">Phone :</div>
            <div class="form-input"><input type="text" name="phone" value="<%= t.getTeacher_phoneString() %>" readonly></div>
        </div>
        <div class="feature">
            <a href="userdetail?userid=<%= u != null ? u.getUserid() : "" %>&role=<%= u != null ? u.getRole() : "" %>&mode=2">
                <button class="but">Edit profile</button></a>
            <a href="changepassword"><button class="but">Change password</button></a></a>
        </div>
</body>
</html>
