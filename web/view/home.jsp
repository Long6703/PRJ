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
            .container{
                display: flex;
                align-content: center;
                justify-content: space-around;
            }

            .header{
                text-align: center;
            }

            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            .header {
                background-color: #3498db;
                color: #fff;
                padding: 20px;
                text-align: center;
            }

            h1 {
                font-size: 36px;
            }

            h2 {
                font-size: 20px;
            }

            a {
                text-decoration: none;
                color: #3498db;
                margin: 5px;
            }

            button {
                background-color: #3498db;
                color: #fff;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
            }

            .container {
                margin: 20px;
                display: flex;
                justify-content: space-around;
            }

            ul {
                list-style-type: none;
            }

            li {
                margin: 10px 0;
            }

            /* Styling links inside the list */
            ul li a {
                color: #3498db;
            }

            /* On hover style for links */
            ul li a:hover {
                text-decoration: underline;
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
            <a href="login"><button>Login</button></a>
            <a href="#"><button>Logout</button></a>
            <a href="register"><button>Register</button></a>
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
