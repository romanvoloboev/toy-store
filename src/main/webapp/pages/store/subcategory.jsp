<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Floral Store</title>
    <meta name="description" content="My Store">

    <%@include file="includes/head.jsp"%>
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
                                <li><a href="/">Категория</a></li>
                                <li><a href="/">Подкатегория</a></li>
                            </ol>
                        </div>
                        <div style="float: right; margin-top: -20px;">
                            <span>Выводить:</span>
                            <select onchange="location = this.value;">
                                <option value="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=33&amp;sort=rating&amp;order=DESC">от дешевых к дорогим</option>
                                <option value="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=33&amp;sort=p.price&amp;order=DESC">от дорогих к дешевым</option>
                                <option value="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=33&amp;sort=p.price&amp;order=ASC">популярные</option>
                                <option value="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=33&amp;sort=pd.name&amp;order=DESC">новинки</option>
                                <option value="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=33&amp;sort=pd.name&amp;order=ASC">по рейтингу</option>
                            </select>
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
                                                        <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;path=33&amp;product_id=30" class="img front">
                                                            <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product02-480x360.jpg" title="Dignissimos ducimus" alt="Dignissimos ducimus" class="img-responsive">
                                                        </a>
                                                    </div>
                                                </div>
                                                <h3 class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;path=33&amp;product_id=30">Dignissimos ducimus</a></h3>
                                                <div class="rating"><img src="../../webres/image/stars-5.png" alt="text_reviews"></div>
                                                <div class="description">Canon's press material for the EOS 5D states that it 'defines (a) new D-SLR category', while we're n.....</div>
                                                <div class="group-item">
                                                    <div class="price-cart">
                                                        <div class="price">
                                                            <span class="price-old">$119.50</span> <span class="price-new">$96.00</span>
                                                            <br>
                                                            <span class="price-tax">Ex Tax: $80.00</span>
                                                        </div>
                                                        <div class="cart">
                                                            <button type="submit" class="btn btn-shopping-cart">
                                                                <span class="fa fa-shopping-cart icon"></span> Купить
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
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
                                                <h3 class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;path=33&amp;product_id=30">Dignissimos ducimus</a></h3>
                                                <div class="rating"><img src="../../webres/image/stars-5.png" alt="text_reviews"></div>
                                                <div class="description">Canon's press material for the EOS 5D states that it 'defines (a) new D-SLR category', while we're n.....</div>
                                                <div class="group-item">
                                                    <div class="price-cart">
                                                        <div class="price">
                                                            <span class="price-old">$119.50</span> <span class="price-new">$96.00</span>
                                                            <br>
                                                            <span class="price-tax">Ex Tax: $80.00</span>
                                                        </div>
                                                        <div class="cart">
                                                            <button type="submit" class="btn btn-shopping-cart">
                                                                <span class="fa fa-shopping-cart icon"></span> Купить
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
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