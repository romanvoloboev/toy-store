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

    <section id="sys-notification">
        <div class="container">
            <div id="notification"></div>
        </div>
    </section>

    <section id="columns" class="offcanvas-siderbars">
        <div class="container">
            <div class="row visible-xs visible-sm">
                <div class="container">
                    <div class="offcanvas-sidebars-buttons">
                        <button type="button" data-for="column-left" class="pull-left btn btn-danger"
                                style="display: none;"><i class="glyphicon glyphfa fa-indent-left"></i> Sidebar Left
                        </button>
                        <button type="button" data-for="column-right" class="pull-right btn btn-danger"
                                style="display: block;">Sidebar Right <i class="glyphicon glyphfa fa-indent-right"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="wrap-container">
                <div class="row">
                    <section class="col-lg-9 col-sm-9 col-xs-12 main-column" style="margin-top: 5px">
                        <div id="content">
                            <h1>Вход в аккаунт</h1>
                            <div class="login-content">
                                <div class="row">
                                    <div class="col-lg-6 col-sm-6 col-xs-12">
                                        <div class="inner">
                                            <h2>Новый клиент</h2>
                                            <div class="content">
                                                <p><b>Создайте новый аккаунт</b></p>
                                                <p>Создание нового аккаутнта позволит вам воспользоваться всеми возможностями,
                                                которые предоставляет наш интернет-магазин.</p>
                                                <a href="#" class="button">Продолжить</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-sm-6 col-xs-12">
                                        <div class="inner">
                                            <h2>У меня есть аккаунт</h2>
                                            <form action="http://demopavothemes.com/pav_floral/index.php?route=account/login" method="post">
                                                <div class="content">
                                                    <p>Войдите как зарегестрированный пользователь</p>
                                                    <b>E-Mail</b><br>
                                                    <input type="text" name="email">
                                                    <br>
                                                    <br>
                                                    <b>Пароль:</b><br>
                                                    <input type="password" name="password">
                                                    <br><br>
                                                    <input type="checkbox" id="remember_me"><label style="margin-left: 5px" for="remember_me">Запомнить меня?</label>
                                                    <br>
                                                    <a href="http://demopavothemes.com/pav_floral/index.php?route=account/forgotten">Не могу вспомнить пароль</a><br>
                                                    <br>
                                                    <input type="submit" value="Войти" class="button">
                                                    <input type="hidden" name="redirect" value="http://demopavothemes.com/pav_floral/index.php?route=account/account">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">
                        $('#login input').keydown(function (e) {
                            if (e.keyCode == 13) {
                                $('#login').submit();
                            }
                        });
                        </script>
                    </section>
                    <aside class="col-lg-3 col-sm-3 col-xs-12 offcanvas-sidebar" id="oc-column-right">
                        <div id="column-right" class="sidebar">
                            <div class="box">
                                <div class="box-heading"><span>Аккаунт</span></div>
                                <div class="box-content">
                                    <ul>
                                        <li><a href="http://demopavothemes.com/pav_floral/index.php?route=account/login">Вход/Регистрация</a></li>
                                        <li><a href="http://demopavothemes.com/pav_floral/index.php?route=account/forgotten">Смена пароля</a></li>
                                        <li><a href="http://demopavothemes.com/pav_floral/index.php?route=account/address">Мои адреса</a></li>
                                        <li><a href="http://demopavothemes.com/pav_floral/index.php?route=account/wishlist">Список желаний</a></li>
                                        <li><a href="http://demopavothemes.com/pav_floral/index.php?route=account/order">История заказов</a></li>
                                        <li><a href="http://demopavothemes.com/pav_floral/index.php?route=account/newsletter">Новости</a></li>
                                        <li><a href="http://demopavothemes.com/pav_floral/index.php?route=account/recurring">Способы оплаты</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
        </div>
    </section>

    <%@include file="includes/footer.jsp"%>
</section>
</body>
</html>