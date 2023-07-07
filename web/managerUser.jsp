<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Product</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="style/magerProduct.css">

    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div style='width: 100%;' class="table-wrapper">
                <div class="table-title">
                    <div class="row btn_add">
                        <div class="">
                            <h2>Manager <b>User</b></h2>
                        </div>
                        <a href="addUser.jsp">
                            <div class="add btn">
                                <i class="fa-solid fa-circle-plus"></i>
                                <p>Add New User</p>
                            </div>
                        </a>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>UserName</th>
                            <th>FullName</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listU}" var="o">
                            <tr>
                                <td>${o.id}</td>
                                <td>${o.userName}</td>
                                <td>${o.name}</td>
                                <td>${o.email}</td>
                                <td>${o.phone}</td>
                                <td>${o.address}</td>
                                <td>
                                    <a href="loadEditUser?uid=${o.id}" class="edit" data-toggle="modal"><i class="fa-solid fa-pen"></i></a>
                                    <a href="deleteUser?uid=${o.id}" class="delete" data-toggle="modal"><i class="fa-solid fa-trash"></i> </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <a href="home"><button type="button" class="btn btn-primary">Back to home</button>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>