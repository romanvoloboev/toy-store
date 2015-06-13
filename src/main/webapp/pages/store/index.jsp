<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Главная - ToyStore</title>

    <%@include file="includes/head.jsp"%>
    <link href="../../webres/store/css/productcarousel.css" rel="stylesheet">
    <script type="text/javascript">
        $(function(){
            $('#productcarousel415422').carousel({interval:5000,auto:true,pause:'hover'});
            $('#productcarousel2be500').carousel({interval:7000,auto:true,pause:'hover'});
            $('#productcarousel8cd118').carousel({interval:9000,auto:true,pause:'hover'});
        })
    </script>
</head>
<body id="offcanvas-container" class="nokeep-header offcanvas-container layout-fullwidth fs12 page-home " data-twttr-rendered="true">
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

    <section class="pav-showcase" id="pavo-showcase">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="box-product vertical box productcarousel">
                        <div class="box-heading">
                            <span>Популярные товары</span>
                        </div>
                        <div class="box-content">
                            <div class="box-products slide" id="productcarousel415422">
                                <div class="carousel-controls">
                                    <a class="carousel-control left" href="#productcarousel415422" data-slide="prev">‹</a>
                                    <a class="carousel-control right" href="#productcarousel415422" data-slide="next">›</a>
                                </div>
                                <div class="carousel-inner">
                                    <c:forEach var="i" begin="0" end="${fn:length(popularProducts)-1}" step="2">
                                        <div class="item <c:out value="${i==0 ? 'active' : ''}"/> ">
                                            <c:if test="${popularProducts[i] != null}">
                                                <div class="row box-product">
                                                    <div class="col-lg-12 col-sm-12 col-xs-12 ">
                                                        <div class="product-block">
                                                            <div class="image">
                                                                <c:if test="${popularProducts[i].promotion}">
                                                                    <span class="product-label-special label">Акция</span>
                                                                </c:if>
                                                                <div class="image_container" style="padding: 5px;">
                                                                    <a href="<c:url value="/product?id=${popularProducts[i].id}"/>" class="img front">
                                                                        <img src="<c:url value="/image/load?id=${popularProducts[i].images[0]}"/>" class="img-responsive" style="max-height: 190px !important;">
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div class="product-meta">
                                                                <div class="name"><a href="<c:url value="/product?id=${popularProducts[i].id}"/>">${popularProducts[i].name}</a></div>
                                                                <c:choose>
                                                                    <c:when test="${popularProducts[i].rating < 1}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-0.png"></div>
                                                                    </c:when>
                                                                    <c:when test="${popularProducts[i].rating >= 1 && popularProducts[i].rating < 2}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-1.png"></div>
                                                                    </c:when>
                                                                    <c:when test="${popularProducts[i].rating >= 2 && popularProducts[i].rating < 3}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-2.png"></div>
                                                                    </c:when>
                                                                    <c:when test="${popularProducts[i].rating >= 3 && popularProducts[i].rating < 4}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-3.png"></div>
                                                                    </c:when>
                                                                    <c:when test="${popularProducts[i].rating >= 4 && popularProducts[i].rating < 5}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-4.png"></div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="rating"><img src="../../webres/store/image/stars-5.png"></div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <div class="description">${popularProducts[i].description}</div>
                                                                <c:choose>
                                                                    <c:when test="${popularProducts[i].promotion}">
                                                                        <span class="price-old">${popularProducts[i].price} грн.</span>
                                                                        <span class="price" style="display: inline-block;">${popularProducts[i].promotionPrice} грн.</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="price">${popularProducts[i].price} грн.</div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <div class="cart">
                                                                    <button type="button" class="btn btn-shopping-cart buy-product" onclick="addToCart(${popularProducts[i].id})">
                                                                        <span class="fa fa-shopping-cart icon"></span> Купить
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>

                                            <c:if test="${popularProducts[i+1] != null}">
                                                <div class="row box-product">
                                                    <div class="col-lg-12 col-sm-12 col-xs-12 ">
                                                        <div class="product-block">
                                                            <div class="image">
                                                                <c:if test="${popularProducts[i+1].promotion}">
                                                                    <span class="product-label-special label">Акция</span>
                                                                </c:if>
                                                                <div class="image_container" style="padding: 5px;">
                                                                    <a href="<c:url value="/product?id=${popularProducts[i+1].id}"/>" class="img front">
                                                                        <img src="<c:url value="/image/load?id=${popularProducts[i+1].images[0]}"/>" class="img-responsive" style="max-height: 190px !important;">
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div class="product-meta">
                                                                <div class="name"><a href="<c:url value="/product?id=${popularProducts[i+1].id}"/>">${popularProducts[i+1].name}</a></div>
                                                                <c:choose>
                                                                    <c:when test="${popularProducts[i+1].rating < 1}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-0.png"></div>
                                                                    </c:when>
                                                                    <c:when test="${popularProducts[i+1].rating >= 1 && popularProducts[i+1].rating < 2}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-1.png"></div>
                                                                    </c:when>
                                                                    <c:when test="${popularProducts[i+1].rating >= 2 && popularProducts[i+1].rating < 3}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-2.png"></div>
                                                                    </c:when>
                                                                    <c:when test="${popularProducts[i+1].rating >= 3 && popularProducts[i+1].rating < 4}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-3.png"></div>
                                                                    </c:when>
                                                                    <c:when test="${popularProducts[i+1].rating >= 4 && popularProducts[i+1].rating < 5}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-4.png"></div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="rating"><img src="../../webres/store/image/stars-5.png"></div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <div class="description">${popularProducts[i+1].description}</div>
                                                                <c:choose>
                                                                    <c:when test="${popularProducts[i+1].promotion}">
                                                                        <span class="price-old">${popularProducts[i+1].price} грн.</span>
                                                                        <span class="price" style="display: inline-block;">${popularProducts[i+1].promotionPrice} грн.</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="price">${popularProducts[i+1].price} грн.</div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <div class="cart">
                                                                    <button type="button" class="btn btn-shopping-cart buy-product" onclick="addToCart(${popularProducts[i+1].id})">
                                                                        <span class="fa fa-shopping-cart icon"></span> Купить
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="box-product pink horizontal box productcarousel">
                        <div class="box-heading">
                            <span>Акционные товары</span>
                        </div>
                        <div class="box-content">
                            <div class="box-products slide" id="productcarousel2be500">
                                <div class="carousel-controls">
                                    <a class="carousel-control left" href="#productcarousel2be500" data-slide="prev">‹</a>
                                    <a class="carousel-control right" href="#productcarousel2be500" data-slide="next">›</a>
                                </div>
                                <div class="carousel-inner">
                                    <c:forEach var="i" begin="0" end="${fn:length(promotionProducts)-1}" step="2">
                                        <div class="item <c:out value="${i==0 ? 'active' : ''}"/> ">

                                            <div class="row box-product">
                                                <c:if test="${promotionProducts[i] != null}">
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <div class="product-block">
                                                            <div class="image">
                                                                <c:if test="${promotionProducts[i].promotion}">
                                                                    <span class="product-label-special label">Акция</span>
                                                                </c:if>
                                                                <div class="image_container" style="padding: 5px;">
                                                                    <a href="<c:url value="/product?id=${promotionProducts[i].id}"/>" class="img front">
                                                                        <img src="<c:url value="/image/load?id=${promotionProducts[i].images[0]}"/>" class="img-responsive" style="max-height: 195px !important;">
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div class="product-meta">
                                                                <div class="name"><a href="<c:url value="/product?id=${promotionProducts[i].id}"/>">${promotionProducts[i].name}</a></div>
                                                                <c:choose>
                                                                    <c:when test="${promotionProducts[i].rating < 1}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-0.png"></div>
                                                                    </c:when>
                                                                    <c:when test="${promotionProducts[i].rating >= 1 && promotionProducts[i].rating < 2}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-1.png"></div>
                                                                    </c:when>
                                                                    <c:when test="${promotionProducts[i].rating >= 2 && promotionProducts[i].rating < 3}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-2.png"></div>
                                                                    </c:when>
                                                                    <c:when test="${promotionProducts[i].rating >= 3 && promotionProducts[i].rating < 4}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-3.png"></div>
                                                                    </c:when>
                                                                    <c:when test="${promotionProducts[i].rating >= 4 && promotionProducts[i].rating < 5}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-4.png"></div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="rating"><img src="../../webres/store/image/stars-5.png"></div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <div class="description">${promotionProducts[i].description}</div>
                                                                <c:choose>
                                                                    <c:when test="${promotionProducts[i].promotion}">
                                                                        <span class="price-old">${promotionProducts[i].price} грн.</span>
                                                                        <span class="price" style="display: inline-block;">${promotionProducts[i].promotionPrice} грн.</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="price">${promotionProducts[i].price} грн.</div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <div class="cart">
                                                                    <button type="button" class="btn btn-shopping-cart buy-product" onclick="addToCart(${promotionProducts[i].id})">
                                                                        <span class="fa fa-shopping-cart icon"></span> Купить
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${promotionProducts[i+1] != null}">
                                                    <div class="col-md-6 col-sm-6 col-xs-12 ">
                                                        <div class="product-block">
                                                            <div class="image">
                                                                <c:if test="${promotionProducts[i+1].promotion}">
                                                                    <span class="product-label-special label">Акция</span>
                                                                </c:if>
                                                                <div class="image_container" style="padding: 5px;">
                                                                    <a href="<c:url value="/product?id=${promotionProducts[i+1].id}"/>" class="img front">
                                                                        <img src="<c:url value="/image/load?id=${promotionProducts[i+1].images[0]}"/>" class="img-responsive" style="max-height: 195px !important;">
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div class="product-meta">
                                                                <div class="name"><a href="<c:url value="/product?id=${promotionProducts[i+1].id}"/>">${promotionProducts[i+1].name}</a></div>
                                                                <c:choose>
                                                                    <c:when test="${promotionProducts[i+1].rating < 1}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-0.png"></div>
                                                                    </c:when>
                                                                    <c:when test="${promotionProducts[i+1].rating >= 1 && promotionProducts[i+1].rating < 2}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-1.png"></div>
                                                                    </c:when>
                                                                    <c:when test="${promotionProducts[i+1].rating >= 2 && promotionProducts[i+1].rating < 3}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-2.png"></div>
                                                                    </c:when>
                                                                    <c:when test="${promotionProducts[i+1].rating >= 3 && promotionProducts[i+1].rating < 4}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-3.png"></div>
                                                                    </c:when>
                                                                    <c:when test="${promotionProducts[i+1].rating >= 4 && promotionProducts[i+1].rating < 5}">
                                                                        <div class="rating"><img src="../../webres/store/image/stars-4.png"></div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="rating"><img src="../../webres/store/image/stars-5.png"></div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <div class="description">${promotionProducts[i+1].description}</div>
                                                                <c:choose>
                                                                    <c:when test="${promotionProducts[i+1].promotion}">
                                                                        <span class="price-old">${promotionProducts[i+1].price} грн.</span>
                                                                        <span class="price" style="display: inline-block;">${promotionProducts[i+1].promotionPrice} грн.</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="price">${promotionProducts[i+1].price} грн.</div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <div class="cart">
                                                                    <button type="button" class="btn btn-shopping-cart buy-product" onclick="addToCart(${promotionProducts[i+1].id})">
                                                                        <span class="fa fa-shopping-cart icon"></span> Купить
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="columns" class="offcanvas-siderbars">
        <div class="container">
            <div class="wrap-container">
                <div class="row">
                    <section class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div id="content">
                            <div class="content-top">
                                <div class="box-product yellow horizontal box productcarousel">
                                    <div class="box-heading"><span>Последние поступления</span></div>
                                    <div class="box-content">
                                        <div class="box-products slide" id="productcarousel8cd118">
                                            <div class="carousel-controls">
                                                <a class="carousel-control left" href="#productcarousel8cd118" data-slide="prev">‹</a>
                                                <a class="carousel-control right" href="#productcarousel8cd118" data-slide="next">›</a>
                                            </div>
                                            <div class="carousel-inner">
                                                <c:forEach var="i" begin="0" end="${fn:length(newProducts)-1}" step="4">
                                                    <div class="item <c:out value="${i==0 ? 'active' : ''}"/> ">
                                                        <div class="row box-product">
                                                            <c:if test="${newProducts[i] != null}">
                                                                <div class="col-lg-3 col-sm-3 col-xs-12 ">
                                                                    <div class="product-block">
                                                                        <div class="image">
                                                                            <c:if test="${newProducts[i].promotion}">
                                                                                <span class="product-label-special label">Акция</span>
                                                                            </c:if>
                                                                            <div class="image_container" style="padding: 5px;">
                                                                                <a href="<c:url value="/product?id=${newProducts[i].id}"/>" class="img front">
                                                                                    <img src="<c:url value="/image/load?id=${newProducts[i].images[0]}"/>" class="img-responsive" style="max-height: 195px !important;">
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                        <div class="product-meta">
                                                                            <div class="name"><a href="<c:url value="/product?id=${newProducts[i].id}"/>">${newProducts[i].name}</a></div>
                                                                            <c:choose>
                                                                                <c:when test="${newProducts[i].rating < 1}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-0.png"></div>
                                                                                </c:when>
                                                                                <c:when test="${newProducts[i].rating >= 1 && newProducts[i].rating < 2}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-1.png"></div>
                                                                                </c:when>
                                                                                <c:when test="${newProducts[i].rating >= 2 && newProducts[i].rating < 3}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-2.png"></div>
                                                                                </c:when>
                                                                                <c:when test="${newProducts[i].rating >= 3 && newProducts[i].rating < 4}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-3.png"></div>
                                                                                </c:when>
                                                                                <c:when test="${newProducts[i].rating >= 4 && newProducts[i].rating < 5}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-4.png"></div>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-5.png"></div>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                            <div class="description">${newProducts[i].description}</div>
                                                                            <c:choose>
                                                                                <c:when test="${newProducts[i].promotion}">
                                                                                    <span class="price-old">${newProducts[i].price} грн.</span>
                                                                                    <span class="price" style="display: inline-block;">${newProducts[i].promotionPrice} грн.</span>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <div class="price">${newProducts[i].price} грн.</div>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                            <div class="cart">
                                                                                <button type="button" class="btn btn-shopping-cart buy-product" onclick="addToCart(${newProducts[i].id})">
                                                                                    <span class="fa fa-shopping-cart icon"></span> Купить
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:if>

                                                            <c:if test="${newProducts[i+1] != null}">
                                                                <div class="col-lg-3 col-sm-3 col-xs-12 ">
                                                                    <div class="product-block">
                                                                        <div class="image">
                                                                            <c:if test="${newProducts[i+1].promotion}">
                                                                                <span class="product-label-special label">Акция</span>
                                                                            </c:if>
                                                                            <div class="image_container" style="padding: 5px;">
                                                                                <a href="<c:url value="/product?id=${newProducts[i+1].id}"/>" class="img front">
                                                                                    <img src="<c:url value="/image/load?id=${newProducts[i+1].images[0]}"/>" class="img-responsive" style="max-height: 195px !important;">
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                        <div class="product-meta">
                                                                            <div class="name"><a href="<c:url value="/product?id=${newProducts[i+1].id}"/>">${newProducts[i+1].name}</a></div>
                                                                            <c:choose>
                                                                                <c:when test="${newProducts[i+1].rating < 1}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-0.png"></div>
                                                                                </c:when>
                                                                                <c:when test="${newProducts[i+1].rating >= 1 && newProducts[i+1].rating < 2}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-1.png"></div>
                                                                                </c:when>
                                                                                <c:when test="${newProducts[i+1].rating >= 2 && newProducts[i+1].rating < 3}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-2.png"></div>
                                                                                </c:when>
                                                                                <c:when test="${newProducts[i+1].rating >= 3 && newProducts[i+1].rating < 4}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-3.png"></div>
                                                                                </c:when>
                                                                                <c:when test="${newProducts[i+1].rating >= 4 && newProducts[i+1].rating < 5}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-4.png"></div>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-5.png"></div>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                            <div class="description">${newProducts[i+1].description}</div>
                                                                            <c:choose>
                                                                                <c:when test="${newProducts[i+1].promotion}">
                                                                                    <span class="price-old">${newProducts[i+1].price} грн.</span>
                                                                                    <span class="price" style="display: inline-block;">${newProducts[i+1].promotionPrice} грн.</span>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <div class="price">${newProducts[i+1].price} грн.</div>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                            <div class="cart">
                                                                                <button type="button" class="btn btn-shopping-cart buy-product" onclick="addToCart(${newProducts[i+1].id})">
                                                                                    <span class="fa fa-shopping-cart icon"></span> Купить
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:if>

                                                            <c:if test="${newProducts[i+2] != null}">
                                                                <div class="col-lg-3 col-sm-3 col-xs-12 ">
                                                                    <div class="product-block">
                                                                        <div class="image">
                                                                            <c:if test="${newProducts[i+2].promotion}">
                                                                                <span class="product-label-special label">Акция</span>
                                                                            </c:if>
                                                                            <div class="image_container" style="padding: 5px;">
                                                                                <a href="<c:url value="/product?id=${newProducts[i+2].id}"/>" class="img front">
                                                                                    <img src="<c:url value="/image/load?id=${newProducts[i+2].images[0]}"/>" class="img-responsive" style="max-height: 195px !important;">
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                        <div class="product-meta">
                                                                            <div class="name"><a href="<c:url value="/product?id=${newProducts[i+2].id}"/>">${newProducts[i+2].name}</a></div>
                                                                            <c:choose>
                                                                                <c:when test="${newProducts[i+2].rating < 1}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-0.png"></div>
                                                                                </c:when>
                                                                                <c:when test="${newProducts[i+2].rating >= 1 && newProducts[i+2].rating < 2}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-1.png"></div>
                                                                                </c:when>
                                                                                <c:when test="${newProducts[i+2].rating >= 2 && newProducts[i+2].rating < 3}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-2.png"></div>
                                                                                </c:when>
                                                                                <c:when test="${newProducts[i+2].rating >= 3 && newProducts[i+2].rating < 4}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-3.png"></div>
                                                                                </c:when>
                                                                                <c:when test="${newProducts[i+2].rating >= 4 && newProducts[i+2].rating < 5}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-4.png"></div>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-5.png"></div>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                            <div class="description">${newProducts[i+2].description}</div>
                                                                            <c:choose>
                                                                                <c:when test="${newProducts[i+2].promotion}">
                                                                                    <span class="price-old">${newProducts[i+2].price} грн.</span>
                                                                                    <span class="price" style="display: inline-block;">${newProducts[i+2].promotionPrice} грн.</span>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <div class="price">${newProducts[i+2].price} грн.</div>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                            <div class="cart">
                                                                                <button type="button" class="btn btn-shopping-cart buy-product" onclick="addToCart(${newProducts[i+2].id})">
                                                                                    <span class="fa fa-shopping-cart icon"></span> Купить
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:if>

                                                            <c:if test="${newProducts[i+3] != null}">
                                                                <div class="col-lg-3 col-sm-3 col-xs-12 ">
                                                                    <div class="product-block">
                                                                        <div class="image">
                                                                            <c:if test="${newProducts[i+3].promotion}">
                                                                                <span class="product-label-special label">Акция</span>
                                                                            </c:if>
                                                                            <div class="image_container" style="padding: 5px;">
                                                                                <a href="<c:url value="/product?id=${newProducts[i+3].id}"/>" class="img front">
                                                                                    <img src="<c:url value="/image/load?id=${newProducts[i+3].images[0]}"/>" class="img-responsive" style="max-height: 195px !important;">
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                        <div class="product-meta">
                                                                            <div class="name"><a href="<c:url value="/product?id=${newProducts[i+3].id}"/>">${newProducts[i+3].name}</a></div>
                                                                            <c:choose>
                                                                                <c:when test="${newProducts[i+3].rating < 1}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-0.png"></div>
                                                                                </c:when>
                                                                                <c:when test="${newProducts[i+3].rating >= 1 && newProducts[i+3].rating < 2}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-1.png"></div>
                                                                                </c:when>
                                                                                <c:when test="${newProducts[i+3].rating >= 2 && newProducts[i+3].rating < 3}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-2.png"></div>
                                                                                </c:when>
                                                                                <c:when test="${newProducts[i+3].rating >= 3 && newProducts[i+3].rating < 4}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-3.png"></div>
                                                                                </c:when>
                                                                                <c:when test="${newProducts[i+3].rating >= 4 && newProducts[i+3].rating < 5}">
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-4.png"></div>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <div class="rating"><img src="../../webres/store/image/stars-5.png"></div>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                            <div class="description">${newProducts[i+3].description}</div>
                                                                            <c:choose>
                                                                                <c:when test="${newProducts[i+3].promotion}">
                                                                                    <span class="price-old">${newProducts[i+3].price} грн.</span>
                                                                                    <span class="price" style="display: inline-block;">${newProducts[i+3].promotionPrice} грн.</span>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <div class="price">${newProducts[i+3].price} грн.</div>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                            <div class="cart">
                                                                                <button type="button" class="btn btn-shopping-cart buy-product" onclick="addToCart(${newProducts[i+3].id})">
                                                                                    <span class="fa fa-shopping-cart icon"></span> Купить
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </c:forEach>
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
<%@include file="includes/sidebarmenu.jsp"%>
</body>
</html>