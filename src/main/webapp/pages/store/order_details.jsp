<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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
    <section id="columns">
        <div class="container">
            <div class="wrap-container">
                <div class="row">
                    <div class="col-lg-2 col-sm-2 col-xs-12" style="padding-top: 15px;">
                        <div id="column-right" class="sidebar">
                            <div class="box">
                                <div class="box-heading" style="text-align: center;"><span>Личный кабинет</span></div>
                                <div class="box-content box-content-profile" style="padding: 0; text-align: center;">
                                    <ul>
                                        <li><a href="<c:url value="/profile"/>">Профиль</a></li>
                                        <li><a href="<c:url value="/wishlist"/>">Список желаний</a></li>
                                        <li><a href="<c:url value="/orders"/>">История заказов</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-10 col-sm-10 col-xs-12" style="padding-top: 15px;">
                        <div id="content" class="user-settings">
                            <div class="col-lg-12" style="padding-bottom: 16px;"><h1>Детали заказа</h1></div>
                            <div class="col-md-12">
                                <div class="wishlist-info">
                                    <table>
                                        <thead>
                                        <tr>
                                            <td class="image col-md-2"></td>
                                            <td class="name col-md-4" style="text-align: left !important;">Название</td>
                                            <td class="name col-md-2" style="text-align: center !important;">Цена</td>
                                            <td class="quantity col-md-2" style="text-align: center !important;">Количество</td>
                                            <td class="price col-md-2" style="text-align: center !important;">Сумма</td>
                                          </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${not empty order}">
                                                <c:forEach items="${orderItems}" var="o">
                                                    <tr>
                                                        <td class="image text-center" style="vertical-align: middle;">
                                                            <a href="<c:url value="/product?id=${o.id}"/>">
                                                                <img src="<c:url value="/image/load?id=${o.productImage}"/>" style="max-height: 50px;">
                                                            </a>
                                                        </td>
                                                        <td class="name" style="vertical-align: middle;">
                                                            <a href="<c:url value="/product?id=${o.id}"/>">${o.productName}</a>
                                                        </td>
                                                        <td class="price text-center" style="vertical-align: middle;">
                                                            <div class="price">${o.price}</div>
                                                        </td>
                                                        <td class="price text-center" style="vertical-align: middle;">
                                                            <div class="price">${o.quantity}</div>
                                                        </td>
                                                        <td class="stock text-center" style="vertical-align: middle;">${o.totalItemPrice} грн.</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td colspan="5" class="text-center">Нет данных</td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                        </tbody>
                                        <c:if test="${not empty order}">
                                            <tfoot>
                                            <tr>
                                                <td colspan="3"></td>
                                                <td style="text-align: center;"><b>Итого:</b></td>
                                                <td style="text-align: center;">${order.amount} грн.</td>
                                            </tr>
                                            </tfoot>
                                        </c:if>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@include file="includes/footer.jsp"%>
</section>
</body>
</html>