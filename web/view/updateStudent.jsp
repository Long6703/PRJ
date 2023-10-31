<%-- 
    Document   : updateStudent
    Created on : Oct 22, 2023, 9:42:14 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Users" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
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
                margin-left: 300px;
                margin-top: 20px;
            }

            button[type="submit"]:hover {
                background-color: #007f86;
            }

        </style>
    </head>
    <body>
        <%
            Users u = null;
            if(request.getSession().getAttribute("user")!=null){
                u = (Users)request.getSession().getAttribute("user");
            }  
        %>
        <%@ include file="header.jsp" %>
        <h3>Update Student!</h3>
        <form action="userdetail" method="post">
            <div class="form-container">
                <div class="form-label">Name :</div>
                <div class="form-input"><input type="text" name="name" value="${student_infor.student_name}"></div>
            </div>
            <div class="form-container">
                <div class="form-label">Email : </div>
                <div class="form-input"><input type="text" name="email" value="${student_infor.student_email}"></div>
            </div>
            <div class="form-container">
                <div class="form-label">Phone :</div>
                <div class="form-input"><input type="text" name="phone" value="${student_infor.student_phone}"></div>
            </div>
            <div class="form-container">
                <div class="form-label">Class :</div>
                <div class="form-input"><input type="text" name="class" value="${student_infor.studentClasses.class_nameString}" readonly></div>
            </div>
            <input type="hidden" name="userid" value="<%= u != null ? u.getUserid() : "" %>">
            <input type="hidden" name="role" value="<%= u != null ? u.getRole() : "" %>">
            <button type="submit">
                Update
            </button>
        </form>
    </body>
</html>
