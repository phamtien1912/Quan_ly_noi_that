<%-- 
    Document   : nhap
    Created on : May 30, 2023, 9:17:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <link rel="stylesheet" href="style/product.css">
    </head>
    <body>
        <div class="app">
            <jsp:include page="Menu.jsp"/>
            <c:set var="p" value="${product}" />
            <div style="background-color: #F6F6F6" class="detail">
                <div style="" class="container"> 
                    <div class="detail__wrap">
                        <div class="detail__img">
                            <img style='height: auto;
                                 width: 100%;' src="<c:out value="${p.getImage()}" />">
                        </div>
                        <div class="detail__content">
                            <h1 style="margin-bottom: 50px;" class="detail__name"><c:out value="${p.getName()}" /></h1>
                            <p class="detail__des"><c:out value="${p.getDes()}" /></p>
                            <div style="text-align: center; margin-bottom: 30px;" class="product__item-price">
                                <p class="detail__price">$ <c:out value="${p.getPrice()}" /></p>
                            </div>

                            <form action="">
                                <div class="addProduct">
                                    <div class="add_qty">
                                        <label for="qty">Quantity</label>
                                        <input type="number" id="qty" name="Qty" value="1">
                                    </div>

                                    <div class="add_button">
                                        <input type="button" class="btn" data-dismiss="modal" value="Add to card">
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>

            <div class="comment">
                <h2>Đánh Giá Sản Phẩm</h2>
                
                <form action="addreview">
                    <div class="review">
                        <div class="add_review">
                            <input type="hidden" name="productId" value="${p.getId()}">
                            
                            <label for="message">Review</label>
                            <textarea id="message" name="message" rows="6" cols="200"></textarea>
                        </div>
                        
                        <div class="sub_review">
                            <input type="submit" value="ADD REVIEW">
                        </div>
                    </div>
                </form>
                
                <c:set var="listComment" value="${requestScope.listComment}" />
                <c:set var="listUser" value="${requestScope.listUser}" />
                <c:forEach var="i" items="${listComment}" varStatus="status">
                    <div class="comment_n">
                        <div class="comment_user">
                            <p><c:out value="${listUser[status.index].getName()}"/></p>
                        </div>

                        <div class="comment_text">
                            <p><c:out value="${i.getCommentText()}"/></p>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <jsp:include page="Footer.jsp"/>
        </div>

        <script src="js/main.js"></script>
    </body>
</html>