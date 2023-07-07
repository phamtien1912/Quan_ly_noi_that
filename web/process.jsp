<%-- 
    Document   : process
    Created on : May 26, 2023, 11:19:42 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400&display=swap" rel="stylesheet">  
        <link href="./assets/fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="style/home.css">
        <!--        <link rel="stylesheet" href="style/home1.css">-->
        <link rel="stylesheet" href="style/process.css">
        <link rel="stylesheet" href="style/purchase.css">

    </head>
    <body>
        <div class="app">
            <jsp:include page="header.jsp"></jsp:include>


                <div  class="homepage">
                    <div class="nav_homepage">
                        <ul class="navhome">
                            <li><a href="#" target="_parent" rel="noopener noreferrer">Tài Khoản Của Tôi</a></li>
                            <li><a href="/btlWeb_1/pur" target="_parent" rel="noopener noreferrer">Đơn Hàng</a></li>
                            <li><a href="#" target="_parent" rel="noopener noreferrer">Thông báo</a></li>
                        </ul>
                    </div>

                    <div class="content_homepage1">
                        <div class="content_homepage">
                            <div class="nav_content">
                                <ul>                    
                                    <li class="js_selectNav selected" ><a href="/btlWeb_1/pur?page=0">Tất Cả</a></li>
                                    <li class="js_selectNav" ><a href="/btlWeb_1/pur?page=1">Chờ Thanh Toán</a></li>
                                    <li class="js_selectNav"><a href="/btlWeb_1/pur?page=2">Vận Chuyển</a></li>
                                    <li class="js_selectNav"><a href="/btlWeb_1/pur?page=3">Đang Giao</a></li>
                                    <li class="js_selectNav"><a href="/btlWeb_1/pur?page=4">Hoàn Thành</a></li>
                                    <li class="js_selectNav"><a href="/btlWeb_1/pur?page=5">Đã Hủy</a></li>              
                                </ul>
                            </div>

                            <div class="content">
                                <div class="js_content active">
                                <c:set var="listProduct" value="${requestScope.dataProduct}" />
                                <c:set var="listOrder" value="${requestScope.dataOrder}" />

                                <c:choose>
                                    <c:when test="${empty listProduct}">
                                        <div  style="height: 600px">
                                            <div class="container_icon">
                                                <div style="width: 150px" class="icon_order">
                                                    <img src="assets/order.png" alt="">
                                                </div>

                                                <div class="icon_order_content">
                                                    <p>Chưa có đơn hàng</p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="p" items="${listProduct}" varStatus="status">
                                            <div class="product_link">
                                                <a rel="stylesheet" href="/btlWeb_1/comment?productId=${p.getId()}">
                                                    <div class="content_product">
                                                        <div class="icon_pro">
                                                            <img class="pur__img" src="<c:out value="${p.getImage()}" />" alt="">
                                                        </div>
                                                        <div class="icon_content">
                                                            <p class="product_name" style="font-weight: 600;"><c:out value="${p.getName()}" /></p>
                                                            <p>x<c:out value="${listOrder[status.index].getAmount()}" /></p>
                                                            <p>$ <c:out value="${p.getPrice()}" /></p>
                                                            <c:set var="price" value="${listOrder[status.index].getAmount() * p.getPrice()}" />
                                                            <p class="icon_price" style="color: red; font-size: 20px;">Thành Tiền: $ <c:out value="${price}" /></p>
                                                        </div>
                                                    </div>
                                                </a>
                                                <form action="MuaServerlet">
                                                    <div class="sellandcall">
                                                        <input type="hidden" name="productId" value="${p.getId()}" />
                                                        <input type="hidden" name="orderId" value="${listOrder[status.index].getId()}" />
                                                        <c:choose>
                                                            <c:when test="${requestScope.index > 0 and requestScope.index < 3}">
                                                                <div style="width: 634px;">
                                                                    <c:choose>
                                                                        <c:when test="${listOrder[status.index].getStatus() == '1'}">
                                                                            <p style="margin: 20px 0 0 10px">Đang Chờ Thanh Toán</p> 
                                                                        </c:when>
                                                                        <c:when test="${listOrder[status.index].getStatus() == '2'}">
                                                                            <p style="margin: 20px 0 0 10px">Đang Vận Chuyển</p>
                                                                        </c:when>
                                                                        <c:when test="${listOrder[status.index].getStatus() == '3'}">
                                                                            <p style="margin: 20px 0 0 10px">Đang Chờ Thanh Toán</p>
                                                                        </c:when>
                                                                        <c:when test="${listOrder[status.index].getStatus() == '4'}">
                                                                            <p style="margin: 20px 0 0 10px">Đã Nhận Được Hàng</p>
                                                                        </c:when>
                                                                        <c:when test="${listOrder[status.index].getStatus() == '5'}">
                                                                            <p style="margin: 20px 0 0 10px">Đã Hủy Đơn Hàng</p>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                                <div class="clickBut">
                                                                    <button class="clickP" name="action" value="HuyDon">Hủy Đơn</button>
                                                                </div>
                                                            </c:when>

                                                            <c:otherwise>
                                                                <div style="width: 800px;">
                                                                    <c:choose>
                                                                        <c:when test="${listOrder[status.index].getStatus() == '1'}">
                                                                            <p style="margin: 20px 0 0 10px">Đang Chờ Thanh Toán</p> 
                                                                        </c:when>
                                                                        <c:when test="${listOrder[status.index].getStatus() == '2'}">
                                                                            <p style="margin: 20px 0 0 10px">Đang Vận Chuyển</p>
                                                                        </c:when>
                                                                        <c:when test="${listOrder[status.index].getStatus() == '3'}">
                                                                            <p style="margin: 20px 0 0 10px">Đang Chờ Thanh Toán</p>
                                                                        </c:when>
                                                                        <c:when test="${listOrder[status.index].getStatus() == '4'}">
                                                                            <p style="margin: 20px 0 0 10px">Đã Nhận Được Hàng</p>
                                                                        </c:when>
                                                                        <c:when test="${listOrder[status.index].getStatus() == '5'}">
                                                                            <p style="margin: 20px 0 0 10px">Đã Hủy Đơn Hàng</p>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <div class="clickBut">
                                                            <button class="clickP" name="action" value="MuaLai">Mua Lại</button>
                                                        </div>
                                                        <div class="clickBut">
                                                            <button class="clickP" name="action" value="LienHe">Liên Hệ Người Bán</button>
                                                        </div>
                                                    </div>
                                                </form>
                                                <div class="block_distance"></div>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <jsp:include page="footer.jsp"></jsp:include>
        </div>
        <script src="./js/main.js"></script>
        <script src="js/purchase.js"></script>
    </body>
</html>
