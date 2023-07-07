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
            <div class="modal-content">           
                <div class="modal-header">
                    <h4 class="modal__title">Add User</h4>
                    <a href="managerUser">
                        <i class="fa-regular fa-circle-xmark"></i>
                    </a>
                </div>
                <form id="addProductForm" action="addUser" method="post">
                    <label for="productName">UserName</label>
                    <input type="text" id="productName" name="userName" required>
                    <label for="productPrice">Password</label>
                    <input type="text" id="productPrice" name="password" required>
                    <label for="productPrice">Name</label>
                    <input type="text" id="productPrice" name="name" required>
                    <label for="productPrice">Email</label>
                    <input type="text" id="productPrice" name="email" required>
                    <label for="productPrice">Phone</label>
                    <input type="text" id="productPrice" name="phone" required>
                    <label for="productPrice">Address</label>
                    <input type="text" id="productPrice" name="address" required>
                    <div style='display: flex;margin-bottom: 10px;'>
                        <label for="productPrice">Is Admin</label>
                        <input style='position: absolute;left: -16.5%;margin-top: 3px; padding: 2px' type="checkbox" id="myCheckbox" name="checkbox" onclick="updateHiddenInput(this)" >
                        <input type="hidden" name="isAdmin" id="myCheckboxValue" value="0">
                    </div>
                    <a href="managerUser">         
                        <input type="button" class="btn" data-dismiss="modal" value="Cancel">
                    </a>
                    <input type="submit" class="btn" value="Add">
                </form>
            </div>
        </div>
        <script>
            var checkbox = document.getElementById("myCheckbox");
            checkbox.addEventListener("change", function () {
                var checkboxValueField = document.getElementsByName("isAdmin")[0];
                checkboxValueField.value = checkbox.checked ? "1" : "0";
            });
        </script>
    </body>
</html>
