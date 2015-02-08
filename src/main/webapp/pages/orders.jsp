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
                                        <li><a href="/profile">Мои настройки</a></li>
                                        <li><a href="/wishlist">Список желаний</a></li>
                                        <li><a href="/orders">История заказов</a></li>
                                        <li><a href="/cart">Корзина</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-10 col-sm-10 col-xs-12" style="padding-top: 15px;">
                        <div id="content" class="user-settings">
                            <div class="col-lg-12" style="padding-bottom: 20px;"><h1>История заказов</h1></div>
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
                                            <tr>
                                                <td class="image" style="text-align: left;">
                                                    <span style="font-weight: normal;">88</span>
                                                </td>
                                                <td class="name">
                                                    <span style="font-weight: normal;">30/01/2015</span>
                                                </td>
                                                <td class="price" style="text-align: left;">
                                                    <span style="font-weight: normal;">1500.00 грн.</span>
                                                </td>
                                                <td class="stock">
                                                    <span style="font-weight: normal;">Выполнен</span>
                                                </td>
                                                <td class="action" style="text-align: center;">
                                                    <a href="/order_details" title="Посмотреть детали заказа" onclick=""><span class="fa fa-info fa-lg"></span></a>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="image" style="text-align: left;">
                                                    <span style="font-weight: normal;">88</span>
                                                </td>
                                                <td class="name">
                                                    <span style="font-weight: normal;">30/01/2015</span>
                                                </td>
                                                <td class="price" style="text-align: left;">
                                                    <span style="font-weight: normal;">1500.00 грн.</span>
                                                </td>
                                                <td class="stock">
                                                    <span style="font-weight: normal;">Выполнен</span>
                                                </td>
                                                <td class="action" style="text-align: center;">
                                                    <a href="/order_details" title="Посмотреть детали заказа" onclick=""><span class="fa fa-info fa-lg"></span></a>
                                                </td>
                                            </tr>
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