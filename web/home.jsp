<%-- 
    Document   : home
    Created on : Oct 19, 2023, 12:41:47 PM
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
            }

            .header {
                background-color: #00939C;
                color: white;
                text-align: center;
                padding: 20px;
            }

            .header h1 {
                margin: 0;
            }

            .container {
                display: flex;
                justify-content: space-around;
                margin: 20px;
            }

            .container h2 {
                color: #00939C;
            }

            ul {
                list-style-type: none;
            }

            ul li {
                margin: 10px 0;
            }

            a {
                text-decoration: none;
            }

            a:hover {
                text-decoration: underline;
            }

            .button {
                background-color: #00939C;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .button:hover {
                background-color: #007f86;
            }


        </style>
        <%
            Users u = null;
            if(request.getSession().getAttribute("user")!=null){
                u = (Users)request.getSession().getAttribute("user");
            }  
        %>
    </head>
    <body>
        <div class="header">
            <h1>Home page!</h1>
            <h2>Welcome <%= u != null ? u.getUsernameString() : "Guest" %></h2>
            <a href="logout"><button>Logout</button></a>
            <a href="login"><button>Login</button></a>
        </div>
        <div class="container">
            <div>
                <h2>List feature for user</h2>
                <ul>
                    <li>
                        <a href="userdetail?userid=<%= u != null ? u.getUserid() : "" %>&role=<%= u != null ? u.getRole() : "" %>&mode=1">
                            Show personal information
                        </a>
                    </li>
                    <li>
                        <a href="userdetail?userid=<%= u != null ? u.getUserid() : "" %>&role=<%= u != null ? u.getRole() : "" %>&mode=2">
                            Edit profile
                        </a>
                    </li>
                    <li>
                        <a href="changepassword">
                            Account management
                        </a>
                    </li>
                </ul>
            </div>
            <div>
                <h2>List feature for student</h2>
                <ul>
                    <li>
                        <a href="viewexam?userid=<%= u != null ? u.getUserid() : "" %>&role=<%= u != null ? u.getRole() : "" %>">
                            View Exam Schedule
                        </a>
                    </li>
                    <li>
                        <a href="registerexam?userid=<%= u != null ? u.getUserid() : "" %>&role=<%= u != null ? u.getRole() : "" %>">
                            Register exam schedule
                        </a>
                    </li>
                    <li>
                        <a href="deleteexam?userid=<%= u != null ? u.getUserid() : "" %>&role=<%= u != null ? u.getRole() : "" %>">
                            Cancel Exam Schedule
                        </a>
                    </li>
                </ul>
            </div>
            <div>
                <h2>List feature for teacher</h2>
                <ul>
                    <li>
                        <a href="createexam?userid=<%= u != null ? u.getUserid() : "" %>&role=<%= u != null ? u.getRole() : "" %>">
                            Create exam schedule
                        </a>
                    </li>
                    <li>
                        <a href="editexam?userid=<%= u != null ? u.getUserid() : "" %>&role=<%= u != null ? u.getRole() : "" %>">
                            Edit exam schedule
                        </a>
                    </li>
                    <li>
                        <a href="examregistrationlist?userid=<%= u != null ? u.getUserid() : "" %>&role=<%= u != null ? u.getRole() : "" %>">
                            See exam registration list
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </body>
</html>
