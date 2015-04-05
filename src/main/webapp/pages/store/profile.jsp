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
                                        <li><a href="<c:url value="/cart"/>">Корзина</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-10 col-sm-10 col-xs-12" style="padding-top: 15px;">
                        <div id="content" class="user-settings">
                            <div class="col-md-8" style="padding-bottom: 16px;">
                                <div class="col-lg-5" style="padding-left: 0;"><h1>Контактные данные</h1></div>
                                <div class="col-md-7">
                                    <ul class="list footer-list" style="padding-top: 8px;">
                                        <li><a href="<c:url value="/edit_profile"/>">Редактировать</a></li>
                                        <li style="margin-left: 15px;"><a href="<c:url value="/edit_password"/>">Изменить пароль</a></li>
                                    </ul>
                                </div>
                            </div>
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="width: 20%; text-align: right; font-weight: bold;"><p>Ваше имя</p></td>
                                        <td><p style="margin-left: 20px;">${customer.name}</p></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%; text-align: right; font-weight: bold;"><p>E-mail</p></td>
                                        <td><p style="margin-left: 20px;">${customer.email}</p></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%; text-align: right; font-weight: bold;"><p>Телефон</p></td>
                                        <td><p style="margin-left: 20px;">${customer.phone}</p></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%; text-align: right; font-weight: bold;"><p>Адрес доставки</p></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty addressesList}">
                                                    <c:forEach items="${addressesList}" var="a">
                                                        <p style="margin-left: 20px;">${a.value}</p>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <p style="margin-left: 20px;">не указан</p>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
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