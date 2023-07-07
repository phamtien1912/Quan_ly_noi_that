<%-- 
    Document   : addProdduct
    Created on : May 21, 2023, 4:00:13 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/home.css">     
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="style/addProduct.css">
        <style>
            .signup_link {
                margin-top: 10px;
                text-align: center;
                font-size: 16px;
                color: #666666;
            }

            .signup_link a {
                color: #2691d9;
                text-decoration: none;
            }

            .signup_link a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div id="login" class="modal">
            <div style='width: 30%;' class="modal-content"> 
                <h6 style='text-align: center; margin-bottom: 30px; font-size: 25px;' class="login__account-title">LOG IN</h6>
                <p style='margin-bottom: 18px;' class="login__account-desc">Welcome back! Sign in to Your Account</p>
                <c:set var = "cookie" value="${pageContext.request.cookies}"/>
                <p style='color: red; font-size: 20px; margin-bottom: 18px' class="login__account-desc">${messError}</p>
                <form id="login" action="login" method="post">
                    <input type="text" id="username" name="userName" required placeholder="Username" value="${cookie.cUser.value}">
                    <input type="text" id="password" name="password" placeholder="Password" required value="${cookie.cPass.value}">
                    <div id="rem" class="login__form__helper">
                        <div id ="check_rem" class="login__form__checkbox">
                            <input ${cookie.cRem != null ? 'checked' : ''} name="rem" class="form__acp" type="checkbox" id="remember">
                            <label style='font: 11px/18px "Oxygen", sans-serif;' for="remember">Remember Me</label>
                        </div>
                        <div class="login__form__help"><a href="#">Help?</a></div>
                    </div>
                    <a href="home">         
                        <input style='margin-top: 15px; cursor: pointer;' type="button" class="btn" data-dismiss="modal" value="Cancel">
                    </a>
                    <input style='cursor: pointer;' type="submit" class="btn" value="Sign in">
                    <div class="signup_link">Not a member? <a href="signup.jsp">Sign up</a></div>
                </form>
            </div>
        </div>
    </body>
</html>
