<%-- 
    Document   : register
    Created on : Oct 19, 2023, 1:12:13 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .form-container {
                display: flex;
                align-items: center;
                margin-bottom: 2%;
            }

            .form-label {
                flex: 0.2;
                text-align: left;
                padding-right: 10px;
            }

            .form-input {
                flex: 2;
            }
            thead, tr, td{
                border: 1px solid black;
            }
            table{
                margin-top: 30px;
            }

            .error-message {
                color: red;
            }
        </style>
    </head>
    <body>
        <h1>Register!</h1>
        <form action="register" method="post">
            <div class="form-container">
                <div class="form-label">Username:</div>
                <div class="form-input"><input name="username" type="text" placeholder="Enter username"></div>
            </div>
            <div class="form-container">
                <div class="form-label">Password:</div>
                <div class="form-input"><input name="password" type="password" placeholder="Enter password"></div>
            </div>
            <div class="form-container">
                <div class="form-label">Role:</div>
                <div class="form-input">
                    <input type="radio" name="role" value="student" checked>Student
                    <input type="radio" name="role" value="teacher">Teacher
                </div>
            </div>
            <button type="submit" name="register">Register</button>
        </form>
    </body>
</html>
