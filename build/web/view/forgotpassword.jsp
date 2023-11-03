<%-- 
    Document   : forgotpassword
    Created on : Nov 3, 2023, 1:18:03 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            
            input[type="password"] {
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
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h3>Authentication user!</h3>
        <form action="forgotpassword" method="post">
            <div class="form-container">
                <div class="form-label">Username :</div>
                <div class="form-input">
                    <input type="text" name="username" value="${username}">
                </div>
            </div>
            <div class="form-container">
                <div class="form-label">Role :</div>
                <div class="form-input">
                    <input type="radio" name="role" value="student" checked>Student
                    <input type="radio" name="role" value="teacher">Teacher
                </div>
            </div> 
            <div class="form-container">
                <div class="form-label">Name :</div>
                <div class="form-input"><input type="text" name="name"></div>
            </div>
            <div class="form-container">
                <div class="form-label">Email : </div>
                <div class="form-input"><input type="text" name="email"></div>
            </div>
            <div class="form-container">
                <div class="form-label">Phone :</div>
                <div class="form-input"><input type="text" name="phone"></div>
            </div>
            <div class="form-container">
                <div class="form-label">New Password :</div>
                <div class="form-input"><input type="password" name="newpass"></div>
            </div>
            <div class="form-container">
                <div class="form-label">Re_New Password :</div>
                <div class="form-input"><input type="password" name="renewpass"></div>
            </div>
            <div>
                <button type="submit">Change Password</button>
                <div style="margin-left: 200px; color: red; margin-top: 20px">${err}</div>
            </div>
        </form>
    </body>
</html>
