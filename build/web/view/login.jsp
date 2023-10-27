<%-- 
    Document   : login
    Created on : Oct 19, 2023, 11:23:28 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .container{
                display: flex;
                margin-top: 10px;
                align-items: center;
            }

            .title{
                flex: 0.5;
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
        <h1>Login!</h1>
        <form action="login" method="post">
            <div class="container">
                <div class="title">Username :</div>
                <div class="input"><input type="text" name="username"></div>
            </div>
            <div class="container">
                <div class="title">Password :</div>
                <div class="input"><input type="password" name="password"></div>
            </div>
            <button class="button">Login</button>
        </form>
    </body>
</html>
