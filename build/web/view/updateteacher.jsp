<%-- 
    Document   : updateteacher
    Created on : Oct 22, 2023, 9:44:40 PM
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

            .form-container {
                display: flex;
                margin: 2% 0;
            }

            .form-label {
                flex: 1;
                text-align: right;
                padding: 10px;
            }

            .form-input {
                flex: 2;
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

        </style>
    </head>
    <body>
        <%
                Users u = null;
                if(request.getSession().getAttribute("user")!=null){
                    u = (Users)request.getSession().getAttribute("user");
                }  
        %>
        <h1>Update Teacher!</h1>
        <form action="userdetail" method="post">
            <div class="form-container">
                <div class="form-label">Name :</div>
                <div class="form-input"><input type="text" name="name" value="${teacher_infor.teacher_nameString}"></div>
            </div>
            <div class="form-container">
                <div class="form-label">Email : </div>
                <div class="form-input"><input type="text" name="email" value="${teacher_infor.teacher_emailString}"></div>
            </div>
            <div class="form-container">
                <div class="form-label">Phone :</div>
                <div class="form-input"><input type="text" name="phone" value="${teacher_infor.teacher_phoneString}"></div>
            </div>
            <input type="hidden" name="userid" value="<%= u != null ? u.getUserid() : "" %>">
            <input type="hidden" name="role" value="<%= u != null ? u.getRole() : "" %>">
            <button type="submit">
                Update
            </button>
        </form>
    </body>
</html>
