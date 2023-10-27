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
            .container{
                display: flex;
                margin-left: 100px;
                margin-top: 10px;
                align-items: center;
            }

            .title{
                flex: 0.8;
                text-align: right;
                margin-right: 10px;

            }

            .input{
                flex: 5;
            }


            .button{
                margin-top: 15px;
                margin-left: 190px;
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
        <h1>Account management!</h1>
        <form action="changepassword" method="post">
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
