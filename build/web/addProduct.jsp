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
                    <h4 class="modal__title">Add Product</h4>
                    <a href="managerProduct">
                        <i class="fa-regular fa-circle-xmark"></i>
                    </a>
                </div>
                <form id="addProductForm" action="addProduct" method="post">
                    <label for="productName">Name</label>
                    <input type="text" id="productName" name="name" required>
                    <label for="productPrice">Image</label>
                    <input type="text" id="productPrice" name="image" required>
                    <label for="productPrice">Price</label>
                    <input type="number" id="productPrice" name="price" required>
                    <label for="productPrice">QTY</label>
                    <input type="text" id="productPrice" name="qty" required>
                    <label for="productPrice">Description</label>
                    <textarea id="productPrice" name="description" required></textarea>
                    <label>Category</label>
                    <select name="category" class="">
                        <c:forEach items="${listC}" var="o">
                            <option value="${o.cid}">${o.cname}</option>
                        </c:forEach>
                    </select>
                    <a href="managerProduct">         
                        <input type="button" class="btn" data-dismiss="modal" value="Cancel">
                    </a>
                    <input type="submit" class="btn" value="Add">
                </form>
            </div>
        </div>
    </body>
</html>
