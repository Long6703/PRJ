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
            .form-container {
                display: flex;
                align-items: center;
                margin-bottom: 2%;
            }

            .form-label {
                flex: 0.2;
                text-align: right;
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
