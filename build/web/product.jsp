<%-- 
    Document   : product
    Created on : May 6, 2023, 2:28:04 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">       
        <style>
            .filter__flex {
                display: flex;
                justify-content: space-between;
                align-items: center;
                display: block;
            }

            .filter__select {
                width: 100%;
                height: 37px;
                border-radius: 20px;
                padding-left: 10px;
                outline: none;
                margin-bottom: 30px;
            }
        </style>
    </head>
    <body>
        <main>
            <jsp:include page="header.jsp"/>
            <!--begin top-->
            <div class="top" style='background-image: url("assets/img100.jpg"); background-position: 50% 100%'>
                <div class="container">
                    <div class="top__body" style='margin-top: 74px;'>
                        <h1>CHAIRS</h1>
                        <nav class="top__body--path">
                            <ul>
                                <li>
                                    <a href="#">Home</a>
                                    <i class="fa fa-angle-right"></i>
                                </li>
                                <li>
                                    <a href="#">Products</a>
                                    <i class="fa fa-angle-right"></i>
                                </li>
                                <li>Chairs</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <!--end top-->
            <!--begin sidebar-->
            <div class="container">
                <div class="sidebar">
                    <div class="sidebar__categories">
                        <h2 style='font-size: 30px;margin-bottom: 20px'>CATEGORIES</h2>
                        <ul>
                            <c:forEach items = "${dataC}" var = "o">
                                <li style='margin: 0 0 18px;'>
                                    <a href="category?cid=${o.cid} ">
                                        <span class="sidebar__name">${o.cname}</span>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <!--end CATEGORIES-->
                    <div class="sidebar__categories">
                        <h2 style='font-size: 30px;margin-bottom: 20px'>FITER</h2>
                        <div class="filter">
                            <form id="filterProduct" action="filterProduct" method="post">
                                <h5 class="filter__name">Price :</h5>
                                <div class="filter__flex">
                                    <label for="productPrice">FROM :</label>
                                    <input type="text" id="productPrice" name="priceFrom">
                                </div>
                                <div class="filter__flex">
                                    <label for="productName">TO :</label>
                                    <input type="text" id="productName" name="priceTo">
                                </div>

                                <h5 style="margin-bottom: 10px;" class="filter__name">COLOR :</h5>
                                <select name="color" class="filter__select">
                                    <option value="all">All</option>
                                    <option value="green">GREEN</option>
                                    <option value="black">BLACK</option>
                                    <option value="red">RED</option>
                                    <option value="gray">GRAY</option>
                                    <option value="pink">PINK</option>
                                    <option value="blue">BLUE</option>
                                </select>
                                <input style='cursor: pointer;' type="submit" class="btn" value="Filter">
                            </form>
                        </div>
                    </div>
                </div>    
                <!--end sidebar-->
                <!--begin right-->
                <div class="right">
                    <!--begin headder-->
                    <div class="right__header">
                        <div class="right__box">
                            <ul class="right__line">
                                <li>
                                    <a href="#" class="right__link1" >Default Sorting </a>
                                </li>
                                <li>
                                    <a class="right__link" href="#">
                                        <i class="fas fa-th-large"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#" class="right__link">
                                        <i class="fas fa-th-list"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--end header-->
                    <!--begin bot-->
                    <div style='justify-content: space-between; margin-bottom: 20px' class="right__bot">
                        <c:forEach items = "${requestScope.dataP}" var ="o">
                            <div class="col">
                                <div style="cursor: pointer" class="product__item active l-12 m-12 c-12" >
                                    <div style='margin-left: 0px;' class="product__item-img">
                                        <a style='cursor: pointer;' href="comment?productId=${o.id}">
                                            <img src="${o.image}" alt="lounge chair">
                                        </a>
                                    </div>
                                    <div class="product__item-body">
                                        <div class="product__item-rating">
                                            <i class="fas fa-star product__item-rating-current"></i>
                                            <i class="fas fa-star product__item-rating-current"></i>
                                            <i class="fas fa-star product__item-rating-current"></i>
                                            <i class="far fa-star"></i>
                                        </div>
                                        <div class="product__item-name">
                                            <p>${o.name}</p>
                                        </div>
                                        <div class="product__item-price">
                                            <h3></i>${o.price} $</h3>
                                        </div>
                                        <div class="product__item-links">
                                            <ul style='background-color: white;'>
                                                <li style='width: auto;padding: 0;'><a href="#" class="product__link"><i class="fas fa-shopping-bag"></i><span>Add to Cart</span></a></li>
                                                <li style='width: auto;padding: 0;'><a href="favoriteProduct?pid=${o.id}" class="product__link-item" ><i class="far fa-heart"></i></a></li>
                                                <li style='width: auto;padding: 0;'><a href="comment?productId=${o.id}" class="product__link-item" ><i class="fas fa-eye"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <!--end bot-->
                    <!--begin page-->
                    <!--end page-->
                </div>
                <!--end right-->
            </div>
            <!--end bottom-->
            <jsp:include page="footer.jsp"/>
        </main>
    </body>
</html>