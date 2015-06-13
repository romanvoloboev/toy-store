<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>${product.name} - ToyStore</title>
    <%@include file="includes/head.jsp"%>
    <link href="../../webres/store/css/jquery.raty.css" rel="stylesheet">
    <script type="text/javascript">
        $(function(){
            setReviewsCount(${product.reviewsCount});
            setProductId(${product.id});
        });
    </script>
    <script src="../../webres/store/js/product.js"></script>
    <script type="text/javascript" src="../../webres/store/js/jquery.raty.js"></script>
    <script type="text/javascript" src="../../webres/store/js/elevatezoom-min.js"></script>
</head>
<body id="offcanvas-container" class="nokeep-header offcanvas-container layout-fullwidth fs12 page-product" data-twttr-rendered="true">
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
                                <li><a href="<c:url value="/"/>">Главная</a></li>
                                <li><a href="<c:url value="/category?id=${product.category}"/>">${product.categoryName}</a></li>
                                <li><a href="<c:url value="/subcategory?id=${product.subcategory}"/>">${product.subcategoryName}</a></li>
                                <li>${product.name}</li>
                            </ol>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12  main-column" style="padding-top: 15px;">
                        <div id="content">
                            <div class="product-info">
                                <div class="row">
                                    <div class="col-lg-7 col-sm-6 image-container">
                                        <div class="image">
                                            <img src="<c:url value='/image/load?id=${product.images[0]}'/>" id="image" style="max-width:500px; max-height: 375px;"
                                                 data-zoom-image="<c:url value="/image/load?id=${product.images[0]}"/>" class="product-image-zoom">
                                        </div>
                                        <c:if test="${fn:length(product.images) > 1}">
                                            <div class="image-additional slide carousel" id="image-additional">
                                                <div id="image-additional-carousel" class="carousel-inner">
                                                    <div class="item active">
                                                        <c:forEach items="${product.images}" var="image">
                                                            <a href="<c:url value='/image/load?id=${image}'/>"
                                                               data-zoom-image="<c:url value='/image/load?id=${image}'/>"
                                                               data-image="<c:url value='/image/load?id=${image}'/>">
                                                                <img src="<c:url value='/image/load?id=${image}'/>" style="max-width:114px;"
                                                                     data-zoom-image="<c:url value='/image/load?id=${image}'/>" class="product-image-zoom">
                                                            </a>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="col-lg-5 col-sm-6">
                                        <h1 style="padding-left: 5px;">${product.name}</h1>
                                        <c:choose>
                                            <c:when test="${product.quantity <= 5}">
                                                <div class="col-md-6 col-sm-6 col-xs-4" style="color: #ff6300; padding-top: 1px; padding-right: 0; padding-left: 5px;"><strong><em>Товар заканчивается</em></strong></div>
                                                <c:choose>
                                                    <c:when test="${product.rating < 1}">
                                                        <img src="../../webres/store/image/stars-0.png">
                                                    </c:when>
                                                    <c:when test="${product.rating >= 1 && product.rating < 2}">
                                                        <img src="../../webres/store/image/stars-1.png">
                                                    </c:when>
                                                    <c:when test="${product.rating >= 2 && product.rating < 3}">
                                                        <img src="../../webres/store/image/stars-2.png">
                                                    </c:when>
                                                    <c:when test="${product.rating >= 3 && product.rating < 4}">
                                                        <img src="../../webres/store/image/stars-3.png">
                                                    </c:when>
                                                    <c:when test="${product.rating >= 4 && product.rating < 5}">
                                                        <img src="../../webres/store/image/stars-4.png">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="../../webres/store/image/stars-5.png">
                                                    </c:otherwise>
                                                </c:choose>
                                                <span id="reviews-count"></span>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="col-md-5 col-sm-5 col-xs-3" style="color: #15b000; padding-top: 1px; padding-right: 0; padding-left: 5px;"><strong><em>Есть в наличии</em></strong></div>
                                                <c:choose>
                                                    <c:when test="${product.rating < 1}">
                                                        <img src="../../webres/store/image/stars-0.png">
                                                    </c:when>
                                                    <c:when test="${product.rating >= 1 && product.rating < 2}">
                                                        <img src="../../webres/store/image/stars-1.png">
                                                    </c:when>
                                                    <c:when test="${product.rating >= 2 && product.rating < 3}">
                                                        <img src="../../webres/store/image/stars-2.png">
                                                    </c:when>
                                                    <c:when test="${product.rating >= 3 && product.rating < 4}">
                                                        <img src="../../webres/store/image/stars-3.png">
                                                    </c:when>
                                                    <c:when test="${product.rating >= 4 && product.rating < 5}">
                                                        <img src="../../webres/store/image/stars-4.png">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="../../webres/store/image/stars-5.png">
                                                    </c:otherwise>
                                                </c:choose>
                                                <span id="reviews-count"></span>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="description col-md-12" style="padding-right: 0; padding-top: 15px !important;">
                                            <span>Код товара: </span>${product.code}<br>
                                            <span>Производитель: </span>${product.brandName}<br>
                                            <span>Страна: </span>${product.brandCountry}<br>
                                            <c:if test="${product.height != null && product.length != null && product.width != null}">
                                                <span>Размер:</span> ${product.width} x ${product.height} x ${product.length} см.
                                            </c:if>
                                        </div>
                                        <div class="price-cart" style="padding-left: 5px;">
                                            <div class="product-extra">
                                                <c:choose>
                                                    <c:when test="${product.promotion}">
                                                        <div class="pull-left col-md-12" style="padding: 0;">
                                                            <span class="price-old">${product.price} грн.</span>
                                                            <span class="price">${product.promotionPrice} грн.</span>
                                                        </div>
                                                        <div class="col-md-12" style="padding-left: 0; padding-right: 0;">
                                                            <span style="color: #d50300; font-weight: bold;">Акция действует до:</span> <b>${product.promotionEnd}</b>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="pull-left col-md-12" style="padding: 0;">
                                                            <span class="price" style="padding-left: 0;">${product.price} грн.</span>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                                <div class="pull-left" style="padding-top: 20px;">
                                                    <div class="pull-left">
                                                        <button type="button" class="btn btn-shopping-cart buy-product" onclick="addToCart(${product.id})">
                                                            <span class="fa fa-shopping-cart icon"></span> Купить
                                                        </button>
                                                    </div>
                                                    <div class="pull-left" style="margin-left: 15px;">
                                                        <button type="button" class="btn btn-shopping-cart buy-product" onclick="addToWish(${product.id})">
                                                            <span class="fa fa-heart"></span> В список желаний
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tabs-group">
                                <div id="tabs" class="htabs clearfix">
                                    <a id="description-link" class="selected" style="display: inline;">Описание</a>
                                    <a id="reviews-link" style="display: inline;">Отзывы<c:if test="${product.reviewsCount > 0}"> (${product.reviewsCount})</c:if></a>
                                </div>
                                <div id="tab-description" class="tab-content" style="display: block;">
                                    <div>${product.description}</div>
                                </div>
                                <div id="tab-review" class="tab-content clearfix" style="display: none;">
                                    <c:if test="${product.reviewsCount > 0}">
                                        <c:forEach items="${product.reviewsList}" var="r">
                                            <div id="review">
                                                <div class="review-list">
                                                    <div class="author" style="margin-bottom: 10px !important;">
                                                        <b>${r.customerName}</b>&nbsp;${r.date}<br>
                                                        <c:choose>
                                                            <c:when test="${r.rating == 0}">
                                                                <img src="../../webres/store/image/stars-0.png">
                                                            </c:when>
                                                            <c:when test="${r.rating == 1}">
                                                                <img src="../../webres/store/image/stars-1.png">
                                                            </c:when>
                                                            <c:when test="${r.rating == 2}">
                                                                <img src="../../webres/store/image/stars-2.png">
                                                            </c:when>
                                                            <c:when test="${r.rating == 3}">
                                                                <img src="../../webres/store/image/stars-3.png">
                                                            </c:when>
                                                            <c:when test="${r.rating == 4}">
                                                                <img src="../../webres/store/image/stars-4.png">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="../../webres/store/image/stars-5.png">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <div class="text">${r.comment}</div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>

                                    <security:authorize access="isAuthenticated()" var="isAuth" />

                                    <c:choose>
                                        <c:when test="${isAuth}">
                                            <div class="col-lg-12 col-sm-12 col-xs-12" style="padding-left: 0; padding-right: 0;">
                                                <div class="inner">
                                                    <h2>Оставьте отзыв о товаре</h2>
                                                    <form action="<c:url value=""/>" method="post">
                                                        <fieldset>
                                                            <div class="form-group">
                                                                <textarea id="comment" required name="comment" placeholder="Ваш комментарий" style="width: 50%; height: 140px;"></textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                <b>Оцените товар по 5-ти бальной шкале</b>
                                                                <div id="product-rating"></div>
                                                            </div>

                                                            <div class="form-group">
                                                                <button type="button" class="btn btn-shopping-cart" id="add-new-review">
                                                                    <span class="fa fa-check"></span> Добавить
                                                                </button>
                                                            </div>
                                                        </fieldset>
                                                    </form>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div><b>Вы не можете оставлять комментарии, пожалуйста войдите в систему.</b></div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:if test="${not empty similar}">
                        <div class="col-lg-3 col-md-3 offcanvas-sidebar" id="oc-column-right" style="padding-top: 15px;">
                            <div id="column-right" class="sidebar">
                                <div class="box box-product special">
                                    <div class="box-heading"><span>Похожие товары</span></div>
                                    <div class="box-content">
                                        <div class="box-product">
                                            <div class="row">
                                                <c:forEach items="${similar}" var="s">
                                                    <div class=" col-lg-3">
                                                        <div class="product-block">
                                                            <div class="image">
                                                                <a href=""><img src="<c:url value='/image/load?id=${s.images[0]}'/>"></a>
                                                            </div>
                                                            <h3 class="name"><a href="<c:url value="/product?id=${s.id}"/>">${s.name}</a></h3>
                                                            <div class="rating">
                                                                <c:choose>
                                                                    <c:when test="${s.rating < 1}">
                                                                        <img src="../../webres/store/image/stars-0.png">
                                                                    </c:when>
                                                                    <c:when test="${s.rating >= 1 && s.rating < 2}">
                                                                        <img src="../../webres/store/image/stars-1.png">
                                                                    </c:when>
                                                                    <c:when test="${s.rating >= 2 && s.rating < 3}">
                                                                        <img src="../../webres/store/image/stars-2.png">
                                                                    </c:when>
                                                                    <c:when test="${s.rating >= 3 && s.rating < 4}">
                                                                        <img src="../../webres/store/image/stars-3.png">
                                                                    </c:when>
                                                                    <c:when test="${s.rating >= 4 && s.rating < 5}">
                                                                        <img src="../../webres/store/image/stars-4.png">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img src="../../webres/store/image/stars-5.png">
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                            <div class="price-cart">
                                                                <div class="price">
                                                                    <c:choose>
                                                                        <c:when test="${s.promotion}">
                                                                            <span class="price-old">${s.price} грн.</span>
                                                                            <span class="price">${s.promotionPrice} грн.</span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span class="price">${s.price} грн.</span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </section>
    <%@include file="includes/footer.jsp"%>
</section>
<%@include file="includes/sidebarmenu.jsp"%>
</body>
</html>