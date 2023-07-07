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
            small {
                position: absolute;
                left: 0;
                top: 100%;
                margin-top: 3px;
                color: #e74c3c;
            }
        </style>
    </head>

    <body>
        <div id="signup" class="modal">
            <div id="signup_content" style='width: 30%;' class="modal-content"> 
                <h6 style='text-align: center; margin-bottom: 30px; font-size: 25px;' class="login__account-title">SIGN IN</h6>
                <p style='margin-bottom: 18px;' class="login__account-desc">Create your very own account</p>
                <form id="form__signup" action="signup" method="post">
                    <div class="form-control">
                        <p style='color: red; margin-bottom: 8px;' class="login__account-desc">${mess}</p>
                        <input id="username" name="userName" type="text" class="login__form__control" placeholder="User name">
                        <small></small>
                    </div>
                    <div class="form-control">
                        <input id="email" name="email" type="text" class="login__form__control" placeholder="Email address">
                        <small></small>
                    </div>
                    <div class="form-control">
                        <input id="name" name="name" type="text" class="login__form__control" placeholder="Full name">
                        <small></small>
                    </div>
                    <div class="form-control">
                        <input id="phone" name="phone" type="text" class="login__form__control" placeholder="Phone number">
                        <small></small>
                    </div>
                    <div class="form-control">
                        <input id="address" name="address" type="text" class="login__form__control" placeholder="Address">
                        <small></small>
                    </div>
                    <div class="form-control">
                        <input id="password" name="password" type="text" class="login__form__control" placeholder="Password">
                        <small></small>
                    </div><div class="form-control">
                        <input id="password2"  type="text" class="login__form__control" placeholder="Confirm password">
                        <small></small>
                    </div>
                    <a href="home">         
                        <input style='margin-top: 15px;' type="button" class="btn" data-dismiss="modal" value="Cancel">
                    </a>
                    <input type="submit" class="btn" value="Sign Up">
                </form>
            </div>
        </div>
    </body>
</html>
