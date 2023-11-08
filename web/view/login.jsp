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
            article,
            aside,
            details,
            figcaption,
            figure,
            footer,
            header,
            hgroup,
            nav,
            section {
                display: block;
            }

            html {
                font-size: 100%;
                -webkit-text-size-adjust: 100%;
                -ms-text-size-adjust: 100%;
            }

            input:focus,
            textarea:focus {
                outline: none;
            }

            label,
            select,
            button,
            input[type="submit"],
            input[type="radio"],
            input[type="checkbox"] input[type="button"] {
                cursor: pointer;
            }


            ::selection {
                background: #ed327b;
                color: #fff;
            }

            ::-moz-selection {
                background: #ed327b;
                color: #fff;
            }

            * {
                font-size: 100%;
                margin: 0;
                padding: 0;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }

            body {
                background-color: #008F98;
                background-repeat: no-repeat;
                background-position: center center;
                background-position: 50% 65%;
                background-size: cover;
            }

            * {
                font-family: "Helvetica Neue", Helvetica, Arial;
            }

            h5 {
                text-align: center;
                margin-top: 5px;
                color: rgba(0, 0, 0, .3);
            }

            h5>a,
            a:visited {
                color: #008F98;
                text-decoration: underline;
            }

            h5>a:hover {
                text-decoration: none;
            }

            form {
                background: #fff;
                border-radius: 6px;
                padding: 20px;
                padding-top: 30px;
                width: 500px;
                margin: 50px auto;
                margin-top: 120px;
                box-shadow: 15px 15px 0px rgba(0, 0, 0, .1);
            }

            h1 {
                text-align: center;
                font-size: 1.4em;
                font-weight: 700;
                color: #ccc;
                margin-bottom: 24px;
            }

            span {
                font-weight: 200;
            }

            input {
                width: 100%;
                background: #f5f5f5;
                border: 0;
                padding: 20px;
                border-radius: 6px;
                margin-bottom: 10px;
                border: 1px solid #eee;
            }

            .btn {
                position: relative;
                width: 100%;
                padding: 20px;
                border-radius: 6px;
                border: 0;
                background: #00939C;
                font-size: 1.2em;
                color: #fff;
                text-shadow: 1px 1px 0px rgba(0, 0, 0, .1);
                box-shadow: 0px 3px 0px #00939C;
            }

            .btn:active {
                top: 3px;
                box-shadow: none;
            }

            h6 {
                text-align: center;
                padding: 20px;
                padding-top: 35px;
                color: #777;
                cursor: pointer;
            }


            .checkbox-wrapper {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .check{
                display: flex;
            }

            .one-line-text{
                white-space: nowrap;
                margin-left: 10px;
                margin-bottom: 10px;
            }

            .error-message{
                color: red;
                margin-top: 30px;
                text-align: center;
                font-size: medium;
            }
        </style>
    </head>
    <body>
        <%
                String err = "";
                if(request.getAttribute("error")!=null){
                    err = (String)request.getAttribute("error");
                }
        %>
        <form action="login" method="post">
            <h1>Exam Schedule Management</h1>
            <input name="username" placeholder="Username" type="text" />
            <input name="password" placeholder="Password" type="password" />
            <div class="checkbox-wrapper">
                <div class="check">
                    <input type="checkbox" class="checkbox-input" name="rememberme" value="1">
                    <p class="one-line-text">Remember Me</p>
                </div>
                <div class="forgot-password">
                    <a id="forgotPasswordLink" href="#">Forgot Password?</a>
                </div>
            </div>
            <button class="btn" type="submit">Log in</button>
            <p class="error-message"><%=err%></p>
        </form>
        <script>
            document.getElementById("forgotPasswordLink").onclick = function (event) {
                event.preventDefault();

                var username = document.querySelector('input[name="username"]').value;
                var link = "forgotpassword?username=" + encodeURIComponent(username);

                // Chuyển hướng đến đường link mới
                window.location.href = link;
            };
        </script>
    </body>
</html>
