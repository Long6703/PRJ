<%-- 
    Document   : changepass
    Created on : Oct 22, 2023, 10:58:45 PM
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
                color: #00939C; /* Màu chữ tương tự cho cả hai trang */
            }

            .container {
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 2% 0;
                width: 500px;
            }

            .title {
                flex: 1;
                text-align: right;
                padding: 10px;
            }

            .input {
                flex: 2;
                padding: 5px;
            }

            input[type="password"] {
                width: 500px;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            button[type="submit"] {
                display: block;
                margin: 0 auto;
                padding: 10px 20px;
                background-color: #00939C;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button[type="submit"]:hover {
                background-color: #007f86;
            }

            span {
                color: red;
                margin-left: 180px;
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
        <form action="changepassword" method="post">
            <h1>Account management!</h1>
            <div class="container">
                <div class="title">Old Password</div>
                <div class="input"><input type="password" name="oldpass"></div>
            </div>
            <div class="container">
                <div class="title">New Password</div>
                <div class="input"><input type="password" name="newpass"></div>
            </div>
            <div class="container">
                <div class="title">Re-New Password</div>
                <div class="input"><input type="password" name="renewpass"></div>
            </div>
            <button type="submit">Change</button><br>
            <span style="color: red">${err}</span>
        </form>
    </body>
</html>
