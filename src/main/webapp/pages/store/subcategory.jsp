<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>${subcategory.name} - ToyStore</title>
    <%@include file="includes/head.jsp"%>
    <script type="text/javascript">
        $(function() {
            function getParameterByName(name) {
                name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
                var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                        results = regex.exec(location.search);
                return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
            }

            var st = getParameterByName('sort_by');

            if (st) {
                $('select#sortType option[value="' + st + '"]').prop("selected", true);
            }

            $('#sortType').on('change', function() {
                var url = '/subcategory?id=${subcategory.id}';

                var type = $("#sortType :selected").val();
                if (type && type != 'rating') {
                    url += '&sort_by=' + encodeURIComponent(type);
                }
                location = url;
            });
        });
    </script>
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
                                <li><a href="<c:url value="/"/>">Главная</a></li>
                                <li><a href="<c:url value="/category?id=${subcategory.category}"/>">${subcategory.categoryName}</a></li>
                                <li>${subcategory.name}</li>
                            </ol>
                        </div>
                        <div style="float: right; margin-top: -20px;">
                            <span>Сортировка:&nbsp;</span>
                            <select id="sortType">
                                <option value="rating">по рейтингу</option>
                                <option value="cheap">от дешевых к дорогим</option>
                                <option value="expensive">от дорогих к дешевым</option>
                                <option value="novelty">новинки</option>
                            </select>
                        </div>
                    </div>

                    <section class="col-lg-12 col-md-12 col-sm-12 col-xs-12 main-column">
                        <div id="content">
                            <div class="product-filter clearfix"></div>
                            <div class="product-grid">
                                <div class="products-block">
                                    <div class="row">
                                        <c:forEach items="${products}" var="p">
                                            <div class="col-xs-12 col-sm-6 col-lg-3 col-md-4 col-fullwidth">
                                                <div class="product-block">
                                                    <div class="image">
                                                        <div class="image_container">
                                                            <a href="<c:url value="/product?id=${p.id}"/>" class="img front">
                                                                <img src="<c:url value="/image/load?id=${p.images[0]}"/>"  style="height: 170px;">
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-meta col-md-12" style="padding: 0;">
                                                        <h4 class="subcategoryname">
                                                            <a href="<c:url value="/product?id=${p.id}"/>" style="overflow: hidden;">${p.name}</a>
                                                        </h4>

                                                        <c:choose>
                                                            <c:when test="${p.rating < 1}">
                                                                <div class="rating"><img src="../../webres/store/image/stars-0.png"></div>
                                                            </c:when>
                                                            <c:when test="${p.rating >= 1 && p.rating < 2}">
                                                                <div class="rating"><img src="../../webres/store/image/stars-1.png"></div>
                                                            </c:when>
                                                            <c:when test="${p.rating >= 2 && p.rating < 3}">
                                                                <div class="rating"><img src="../../webres/store/image/stars-2.png"></div>
                                                            </c:when>
                                                            <c:when test="${p.rating >= 3 && p.rating < 4}">
                                                                <div class="rating"><img src="../../webres/store/image/stars-3.png"></div>
                                                            </c:when>
                                                            <c:when test="${p.rating >= 4 && p.rating < 5}">
                                                                <div class="rating"><img src="../../webres/store/image/stars-4.png"></div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="rating"><img src="../../webres/store/image/stars-5.png"></div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <div class="description" style="word-wrap: break-word;">${p.description}</div>
                                                        <div class="group-item">
                                                            <div class="price-cart">
                                                                <div class="price" style="margin-bottom: 8px !important;">
                                                                    <c:choose>
                                                                        <c:when test="${p.promotion}">
                                                                            <span class="price-old">${p.price} грн.</span>
                                                                            <span class="price-new">${p.promotionPrice} грн.</span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span class="price-new">${p.price} грн.</span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>
                                                                <div class="cart">
                                                                    <button type="button" class="btn btn-shopping-cart buy-product" onclick="addToCart(${p.id})">
                                                                        <span class="fa fa-shopping-cart icon"></span> Купить
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
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