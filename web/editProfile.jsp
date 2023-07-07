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
    </head>
    <body>
        <div id="addProductModal" class="modal">
            <div class="modal-content" style="margin: 40px auto">           
                <div class="modal-header">
                    <h4 class="modal__title">Edit Product</h4>
                    <a href="home">
                        <i class="fa-regular fa-circle-xmark"></i>
                    </a>
                </div>
                <form id="addProductForm" action="editProfile" method="post">
                    <label for="productId">ID</label>
                    <input value ="${user.id}" type="text" id="productName" name="id" readonly required>
                    <label for="productName">UserName</label>
                    <input value ="${user.userName}" type="text" id="productName" name="userName" readonly required>
                    <label for="productPrice">Password</label>
                    <input value ="${user.password}" type="text" id="productPrice" name="password" required>
                    <label for="productPrice">Name</label>
                    <input value ="${user.name}" type="text" id="productPrice" name="name" required>
                    <label for="productPrice">Email</label>
                    <input value ="${user.email}" type="text" id="productPrice" name="email" required>
                    <label for="productPrice">Phone</label>
                    <input value ="${user.phone}" type="text" id="productPrice" name="phone" required>
                    <label for="productPrice">Address</label>
                    <input value ="${user.address}" type="text" id="productPrice" name="address" required>
                    <a href="home">         
                        <input type="button" class="btn" data-dismiss="modal" value="Cancel">
                    </a>
                    <input type="submit" class="btn" value="Edit">
                </form>
            </div>
        </div>
    </body>
</html>
