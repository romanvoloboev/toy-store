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
                            <div class="col-md-8" style="padding-bottom: 16px;">
                                <div class="col-lg-5"><h1>Контактные данные</h1></div>
                                <div class="col-md-7">
                                    <ul class="list footer-list" style="padding-top: 8px;">
                                        <li><a href="/edit_profile">Редактировать</a></li>
                                        <li style="margin-left: 15px;"><a href="/edit_password">Изменить пароль</a></li>
                                    </ul>
                                </div>
                            </div>
                            <table>
                                <tbody>
                                    <tr>
                                        <td style="width: 20%; text-align: right; font-weight: bold;"><p>Ваше имя</p></td>
                                        <td><p style="margin-left: 20px;">asdasddddddddddda</p></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%; text-align: right; font-weight: bold;"><p>E-mail</p></td>
                                        <td><p style="margin-left: 20px;">asdddddddddddddddddddd</p></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%; text-align: right; font-weight: bold;"><p>Телефон</p></td>
                                        <td><p style="margin-left: 20px;">+38(066)019-37-84</p></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%; text-align: right; font-weight: bold;"><p>Адреса доставки</p></td>
                                        <td>
                                            <p style="margin-left: 20px;">Никополь Днепропетровская обл. Никопольский р-н, Херсонская, д.117</p>
                                            <p style="margin-left: 20px;">Никополь Днепропетровская обл. Никопольский р-н, Херсонская, д.117</p>
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