<%-- 
    Document   : menu
    Created on : May 18, 2023, 8:50:53 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200;300;400&display=swap" rel="stylesheet">  
        <link href="./assets/fonts/fontawesome-free-5.15.3-web/css/all.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="style/home.css">
        <title>Schon</title>
        <style>
            .submenu {
                display: none;
                transition:0.5s ease;

            }
            .header__listhelo:hover .submenu {
                display: block;
                transition:0.5s ease;

            }
        </style>
    </head>
    <body>
        <!--BEGIN HEADER-->
        <header class="header">
            <div class="grid wide">
                <div class="header__wrap row">
                    <div class="header__logo">
                        <a href="home">
                            <img src="assets/logo.png" alt="logo" />
                        </a>
                    </div>
                    <nav class="header__nav">
                        <ul class="header__menu">
                            <c:if test="${sessionScope.acc.isAdmin == 1}">
                                <li class="header__list">
                                    <a href="managerProduct" class="drop-link" >MANAGER PRODUCT
                                        <i class="fas fa-angle-down"></i>
                                    </a>
                                </li>
                                <li class="header__list">
                                    <a href="managerUser" class="drop-link" >MANAGER USER
                                        <i class="fas fa-angle-down"></i>
                                    </a>
                                </li>
                            </c:if>
                            <li class="header__list">
                                <a href="home" class="drop-link" >HOME
                                    <i class="fas fa-angle-down"></i>
                                </a>
                            </li>
                            <li style="margin-right: 10px;" class="header__list">
                                <a href="product" class="drop-link" 
                                   >PRODUCTS
                                    <i class="fas fa-angle-down"></i>
                                </a>
                            </li>
                            <c:if test="${sessionScope.acc == null}">
                                <li class="header__list">
                                    <a href="login.jsp" class="drop-link" >LOGIN
                                        <i class="fas fa-angle-down"></i>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.acc != null}">
                                <li class="header__listhelo">
                                    <a href="" class="drop-link" >HELLO ${sessionScope.acc.userName}
                                        <i class="fas fa-angle-down"></i>
                                    </a>
                                    <ul class = "submenu">
                                        <li class="header__list">
                                            <a href="logout" class="drop-link" >LOGOUT
                                                <i class="fas fa-angle-down"></i>
                                            </a>
                                        </li>
                                        <li class="header__list">
                                            <a href="loadEditProfile?uid=${sessionScope.acc.id}" class="drop-link" >EDIT PROFILE
                                                <i class="fas fa-angle-down"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                    <div class="header__icon">
                        <ul>
                            <li class="bar-menu">
                                <a href="#">
                                    <i class="fas fa-bars"  ></i>
                                </a>
                            </li>
                            <li class="search-click">
                                <a href="#">
                                    <i class="fas fa-search"></i>
                                </a>
                            </li>
                            <li class="react__love modal__header-click">
                                <a href="showFavorite"> 
                                    <i class="far fa-heart">
                                        <c:if test="${sessionScope.acc != null}">
                                            <span class="num">${size}</span>
                                        </c:if>
                                    </i>
                                </a> 
                            </li>
                            <!-- begin cart form -->
                            <li class="cart-list modal__header-click">
                                <a href="show">
                                    <i  class="fas fa-shopping-bag" >
                                        <span class="num">${sizec}</span>
                                    </i>
                                </a>
                            </li>
                            <!-- end form login -->
                        </ul>
                    </div>
                </div>
            </div>
            <!--CLICK JD-->
            <!-- header search -->
            <div class="search">
                <div class="search-container">
                    <form action="searchProduct" method="post" target="_self" id="search__form">
                        <fieldset>
                            <input name="search" class="search__form-input" type="text" placeholder="Search...">
                            <button style='cursor: pointer' class="search-btn modal__search" type="submit"><i class="fas fa-search"></i></button>
                        </fieldset> 
                    </form>
                    <div class="search-close">
                        <a href=""><i style='font-size: 30px;' class="fas fa-times"></i></a>
                    </div>
                </div>
            </div>
            <!-- end header search -->
        </header>
        <!--END HEADER-->
        <script>

// Show Search
            const search = document.querySelector('.search');
            const input = document.querySelector('.search__form-input');
            const btnSearch = document.querySelector('.search-click');
            const btnClose = document.querySelector('.search-close');
            const modalSearch = document.querySelector('.modal__search');
            function isShow() {
                search.classList.add('isShow');
                input.focus();
            }
            function isHide() {
                search.classList.remove('isShow');
            }
            btnSearch.addEventListener('click', isShow);
            btnClose.addEventListener('click', isHide);
            modalSearch.addEventListener('click', isHide);
        </script>
    </body>
</html>
