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
                            <div class="col-lg-12" style="padding-bottom: 16px;"><h1>История заказов</h1></div>
                            <div class="col-md-12">
                                <div class="wishlist-info">
                                    <table>
                                        <thead>
                                            <tr>
                                                <td>Номер заказа</td>
                                                <td>Дата заказа</td>
                                                <td>Сумма</td>
                                                <td>Статус</td>
                                                <td width="120px;">Детали заказа</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${not empty orders}">
                                                <c:forEach items="${orders}" var="o">
                                                    <tr>
                                                        <td class="image" style="text-align: left;">
                                                            <span style="font-weight: normal;">${o.id}</span>
                                                        </td>
                                                        <td class="name">
                                                            <span style="font-weight: normal;">${o.date}</span>
                                                        </td>
                                                        <td class="price" style="text-align: left;">
                                                            <span style="font-weight: normal;">${o.amount} грн.</span>
                                                        </td>
                                                        <td class="stock" style="text-align: left;">
                                                            <span style="font-weight: normal;">${o.statusName}</span>
                                                        </td>
                                                        <td class="action" style="text-align: center;">
                                                            <a href="<c:url value="/order_details?id=${o.id}"/>" title="Посмотреть детали заказа" onclick=""><span class="fa fa-info fa-lg"></span></a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td colspan="4" class="text-center">Нет заказов</td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                        </tbody>
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