<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Floral Store</title>
    <meta name="description" content="My Store">

    <%@include file="includes/head.jsp"%>
    <script src="../../webres/store/js/login_reg_forms.js"></script>
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
                    <section class="col-lg-12 col-sm-12 col-xs-12 main-column" style="margin-top: 5px">
                        <div id="content">
                            <div class="login-content">
                                <div class="row">
                                    <div class="col-lg-3 col-sm-4 col-xs-12">
                                        <div class="inner">
                                            <h2>У меня уже есть аккаунт</h2>
                                            <form action="<c:url value="/check_customer"/>" method="post">
                                                <p><b>Войдите как существующий клиент</b></p>
                                                <fieldset>
                                                    <div class="form-group">
                                                        <input name="j_username" placeholder="E-Mail" class="form-control" type="email" required="true">
                                                    </div>
                                                    <div class="form-group">
                                                        <input name="j_password" placeholder="Пароль" class="form-control" type="password" required="true">
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="checkbox">
                                                            <input name="j_spring_security_remember_me" value="true" checked="checked" type="checkbox">Запомнить
                                                            меня
                                                        </label>
                                                    </div>
                                                    <div class="form-group">
                                                        <button type="submit" class="btn btn-shopping-cart">
                                                            <span class="fa fa-sign-in"></span> Войти
                                                        </button>
                                                        <a style="float: right; padding-top: 4px;" href=""><b>Забыли пароль?</b></a>
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-4 col-sm-offset-2 col-xs-12 col-lg-offset-2">
                                        <div class="inner">
                                            <h2>Вы новый клиент?</h2>
                                            <form id="register-form" method="POST" action="<c:url value=""/>">
                                                <p><b>Создайте аккаунт</b></p>
                                                <fieldset>
                                                    <div class="form-group form-inline">
                                                        <input name="first_name" placeholder="Ваше имя" class="form-control" type="text" required="true">
                                                    </div>
                                                    <div class="form-group">
                                                        <input id="email" name="email" placeholder="E-Mail" class="form-control" type="email" required="true">
                                                    </div>
                                                    <div class="form-group">
                                                        <input name="pass" id="password" placeholder="Пароль" class="form-control" type="password" required="true">
                                                    </div>
                                                    <div class="form-group">
                                                        <input name="repeat_pass" id="confirmPassword" placeholder="Повторите пароль" class="form-control" type="password" required="true">
                                                    </div>
                                                    <div style="display: none; padding: 8px;" id="passMismatchMsg" class="alert alert-danger" role="alert"></div>
                                                    <div class="form-group">
                                                        <p>Регистрируясь, вы соглашаетесь с <a style="color: #0088cc" href="/terms">пользовательским соглашением</a></p>
                                                    </div>
                                                    <div class="form-group">
                                                        <button type="submit" id="createBtn" class="btn btn-shopping-cart" disabled="true">
                                                            <span class="fa fa-check"></span> Зарегистрироваться
                                                        </button>
                                                    </div>
                                                </fieldset>
                                            </form>
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
</body>
</html>