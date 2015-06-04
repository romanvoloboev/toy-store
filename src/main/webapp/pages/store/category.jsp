<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>${category.name} - ToyStore</title>
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
                                <li><a href="<c:url value="/"/>">Главная</a></li>
                                <li>${category.name}</li>
                            </ol>
                        </div>
                    </div>
                    <section class="col-lg-12 col-md-12 col-sm-12 col-xs-12 main-column">
                        <div id="content">
                            <div class="product-filter clearfix"></div>
                            <div class="product-grid">
                                <div class="products-block">
                                    <div class="row">
                                        <c:forEach items="${subcategories}" var="s">
                                            <div class="col-xs-12 col-sm-6 col-lg-3 col-md-3" style="margin-bottom: 15px;">
                                                <div class="thumbnail text-center">
                                                    <a href="<c:url value="/subcategory?id=${s.id}"/>">
                                                        <img src="<c:url value="/image/load?id=${s.image}"/>" style="height: 230px;">
                                                        <div class="col-xs-12 col-sm-12 col-lg-12 col-md-12">
                                                            <h3 class="text-center" style="margin: 0;">${s.name}</h3>
                                                        </div>
                                                    </a>
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