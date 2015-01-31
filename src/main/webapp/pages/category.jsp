<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Floral Store</title>
    <meta name="description" content="My Store">

    <%@include file="includes/head.jsp"%>
    <script src="../webres/js/login_reg_forms.js"></script>
</head>
<body id="offcanvas-container" class="nokeep-header offcanvas-container layout-fullwidth fs12 page-account-login" data-twttr-rendered="true">
<section id="page" class="offcanvas-pusher" role="main">
    <section id="header">
        <%@include file="includes/signup_login.jsp"%>
        <section id="header-main">
            <div class="container">
                <div class="header-wrap">
                    <%@include file="includes/menu.jsp"%>
                    <%@include file="includes/cart.jsp"%>
                </div>
            </div>
        </section>
    </section>
    <section id="columns" class="offcanvas-siderbars">
        <div class="container">
            <div class="wrap-container">
                <div class="row">
                    <div id="breadcrumb">
                        <div>
                            <ol class="breadcrumb" style="margin: 0; padding: 0;">
                                <li><a href="/">Главная</a></li>
                                <li><a href="/">Название категории</a></li>
                            </ol>
                        </div>
                    </div>

                    <section class="col-lg-12 col-md-12 col-sm-12 col-xs-12 main-column">
                        <div id="content">
                            <div class="product-filter clearfix"></div>
                            <div class="product-grid">
                                <div class="products-block">
                                    <div class="row">
                                        <div class="col-xs-12 col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                            <div class="product-block">
                                                <div class="image ">
                                                    <div class="image_container">
                                                        <a href="/subcategory" class="img front">
                                                            <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product02-480x360.jpg" title="Dignissimos ducimus" alt="Dignissimos ducimus" class="img-responsive">
                                                        </a>
                                                    </div>
                                                </div>
                                                <h3 class="name" style="text-align: center;">
                                                    <a href="/subcategory">Название подкатегории</a>
                                                </h3>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                            <div class="product-block">
                                                <div class="image ">
                                                    <div class="image_container">
                                                        <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;path=33&amp;product_id=30" class="img front">
                                                            <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product02-480x360.jpg" title="Dignissimos ducimus" alt="Dignissimos ducimus" class="img-responsive">
                                                        </a>
                                                    </div>
                                                </div>
                                                <h3 class="name" style="text-align: center;">
                                                    <a href="/subcategory">Название подкатегории</a>
                                                </h3>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                            <div class="product-block">
                                                <div class="image ">
                                                    <div class="image_container">
                                                        <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;path=33&amp;product_id=30" class="img front">
                                                            <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product02-480x360.jpg" title="Dignissimos ducimus" alt="Dignissimos ducimus" class="img-responsive">
                                                        </a>
                                                    </div>
                                                </div>
                                                <h3 class="name" style="text-align: center;">
                                                    <a href="/subcategory">Название подкатегории</a>
                                                </h3>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                            <div class="product-block">
                                                <div class="image ">
                                                    <div class="image_container">
                                                        <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;path=33&amp;product_id=30" class="img front">
                                                            <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product02-480x360.jpg" title="Dignissimos ducimus" alt="Dignissimos ducimus" class="img-responsive">
                                                        </a>
                                                    </div>
                                                </div>
                                                <h3 class="name" style="text-align: center;">
                                                    <a href="/subcategory">Название подкатегории</a>
                                                </h3>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                            <div class="product-block">
                                                <div class="image ">
                                                    <div class="image_container">
                                                        <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;path=33&amp;product_id=30" class="img front">
                                                            <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product02-480x360.jpg" title="Dignissimos ducimus" alt="Dignissimos ducimus" class="img-responsive">
                                                        </a>
                                                    </div>
                                                </div>
                                                <h3 class="name" style="text-align: center;">
                                                    <a href="/subcategory">Название подкатегории</a>
                                                </h3>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                            <div class="product-block">
                                                <div class="image ">
                                                    <div class="image_container">
                                                        <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;path=33&amp;product_id=30" class="img front">
                                                            <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product02-480x360.jpg" title="Dignissimos ducimus" alt="Dignissimos ducimus" class="img-responsive">
                                                        </a>
                                                    </div>
                                                </div>
                                                <h3 class="name" style="text-align: center;">
                                                    <a href="/subcategory">Название подкатегории</a>
                                                </h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </section>

    <%@include file="includes/footer.jsp"%>
</section>
</body>
</html>