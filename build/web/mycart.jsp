<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/cart.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <center>
                <h1 class="cart__title">Cart</h1>
                <table>
                    <tr>
                        <th>No</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total money</th>
                        <th>Action</th>
                    </tr>
                    <c:set var="o" value="${requestScope.cart}" />
                    <c:set var="tt" value="0"/>
                    <c:forEach items="${o.items}" var="i">
                        <c:set var="tt" value="${tt+1}"/>
                        <tr>
                            <td>${tt}</td>
                            <td>${i.product.name}</td>
                            <td class="quantity">
                                <button><a class="quantity__button quantity__reduce" href="process?num=-1&id=${i.product.id}">-</a></button>
                                <span class="quantity__value">${i.quantity}</span>
                                <button><a class="quantity__button quantity__increase" href="process?num=1&id=${i.product.id}">+</a></button>
                            </td>

                            <td class="tr">${i.price} $</td>
                            <td class="tr">${i.price*i.quantity} $</td>
                            <td class="center">
                                <form action="process" method="post">
                                    <input class="btn" type="hidden" name="id" value="${i.product.id}">
                                    <input class="btn" type="submit" value="return item"/>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <h3 class="center">Total money:   ${o.totalMoney} $</h3>
                <hr>
                <form action="checkout" method="post" class="center">
                    <input class="btn" type="submit" value="Check Out">
                </form>
                <a  href="pur">
                    <input class="btn" type="button" value="Process">
                </a>
                <a  href="home">
                    <input class="btn" type="button" value="Back to Home">
                </a>
            </center>
        </div>

    </body>
</html>
