<%-- 
    Document   : header
    Created on : Oct 31, 2023, 9:33:49 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.Users" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

            body {
                margin: 0 200px;
            }

            .header {
                display: flex;
                justify-content: space-between;
                background-color: #F5F5F5;
                border-radius: 10px;
                padding-left: 10px;
                padding-right: 10px;
            }


            .header-left {
                display: flex;
                align-items: center;
            }

            .header-right {
                display: flex;
                align-items: center;
            }

            .test{
                border: 1px black;
                text-decoration: none;
                padding: 2px 4px;
                background-color: #5CB85C;
                border-radius: 5px;
                color: white;

            }

            a{
                text-decoration: none;
            }

            .text{
                font-weight: bold;
            }

            .header a,
            .header button,
            .header p,
            .header h4 {
                font-size: 15px;
                margin: 8px 0px 8px 0px;
                padding: 0 10px;
            }
        </style>
    </head> 
    <body>
        <%
            Users us = null;
            if (request.getSession().getAttribute("user") != null) {
                us = (Users) request.getSession().getAttribute("user");
            }  
        %>
        <h1 class="header_title">Exam Schedule Management</h1>
        <div class="header">
            <div class="header-left">
                <a href="home.jsp">Home</a>
                <p> | </p>
            </div>
            <div class="header-right">
                <c:choose>
                    <c:when test="<%= us == null %>">
                        <a class="test" href="login">Login</a>
                    </c:when>
                    <c:otherwise>
                        <a class="test" href="">${user.usernameString}</a>
                        <h4> | </h4>
                        <a class="test" href="logout">Logout</a>
                        <h4> | </h4>
                        <a class="test" href="userdetail?userid=<%= us != null ? us.getUserid() : "" %>&role=<%= us != null ? us.getRole() : "" %>&mode=1">Manage profile</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </body>

</html>
