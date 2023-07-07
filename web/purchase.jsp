<%-- 
    Document   : purchase
    Created on : May 26, 2023, 9:28:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" href="./style/purchase.css">
    </head>
    <body>


        <div class="nav_content">
            <ul>                    
                <li class="js_selectNav selected" onclick="changeContent(this, indexInt)"><a href="/btlWeb_1/pur?page=0">Tất Cả</a></li>
                <li class="js_selectNav" onclick="changeContent(this, indexInt)"><a href="/btlWeb_1/pur?page=1">Đã Xác Nhận</a></li>
                <li class="js_selectNav" onclick="changeContent(this, indexInt)"><a href="/btlWeb_1/pur?page=2">Đang Giao</a></li>
                <li class="js_selectNav" onclick="changeContent(this, indexInt)"><a href="/btlWeb_1/pur?page=3">Đã Nhận</a></li>
                <li class="js_selectNav" onclick="changeContent(this, indexInt)"><a href="/btlWeb_1/pur?page=4">Hoàn Thành</a></li>
                <li class="js_selectNav" onclick="changeContent(this, indexInt)"><a href="/btlWeb_1/pur?page=5">Đã Hủy</a></li>              
            </ul>
        </div>

        <div class="content">
            <div class="js_content active">
                <c:forEach items="${requestScope.list}" var="i">
                    <div class="content_product">

                        <div class="icon_pro">
                            <img src="${i.getImage()}" alt="">
                        </div>
                        <div class="icon_content">
                            <p>${i.getName()}</p>
                            <p class="icon_price">${i.getPrice()}</p>
                        </div>

                    </div>


                    <div class="sellandcall">
                        <form action="MuaServerlet">
                            <div style="width: 800px;"></div>
                            <div class="clickBut">
                                <button class="clickP" name="action" value="MuaLai">Mua Lại</button>
                            </div>

                            <div class="clickBut">
                                <button class="clickP" name="action" value="LienHe">Liên Hệ Người Bán</button>
                            </div>
                        </form>
                    </div>
                </c:forEach>
            </div>
            <div class="js_content">Chào ae</div>
            <div class="js_content">Hi hi</div>
            <div class="js_content">Ha ha</div>
            <div class="js_content">He he</div>
            <div class="js_content">Ho ho</div>
        </div>

        <script type="text/javascript" src="./js/sell.js"></script>
    </body>
</html>
