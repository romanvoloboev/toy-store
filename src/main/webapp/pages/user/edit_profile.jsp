<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Floral Store</title>
    <meta name="description" content="My Store">

    <%@include file="includes/head.jsp"%>
    <script src="../../webres/js/login_reg_forms.js"></script>
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
                            <div class="col-lg-12" style="padding-bottom: 16px;"><h1>Редактирование профиля</h1></div>
                            <div class="col-md-4" style="padding-left: 0;">
                                <form id="profile-edit-form" method="POST" action="<c:url value=""/>">
                                    <fieldset>

                                        <input type="hidden">

                                        <div class="form-group col-md-12">
                                            <input name="first_name" placeholder="Имя" class="form-control" type="text" required="true">
                                        </div>
                                        <div class="form-group col-md-12">
                                            <input name="last_name" placeholder="Фамилия" class="form-control" type="text" required="true">
                                        </div>
                                        <div class="form-group col-md-12">
                                            <input name="phone" placeholder="телефон" class="form-control" type="text" required="true">
                                        </div>
                                        <div class="form-group col-md-12">
                                            <input name="city" placeholder="город" class="form-control" type="text" required="true">
                                        </div>
                                        <div class="form-group col-md-12">
                                            <input name="street" placeholder="Улица" class="form-control" type="text" required="true">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <input name="house_number" placeholder="Номер дома" class="form-control" type="text" required="true">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <input name="flat_number" placeholder="Квартира" class="form-control" type="text" required="true">
                                        </div>
                                        <div style="display: none; padding: 8px;" id="passMismatchMsg" class="alert alert-danger" role="alert"></div>
                                        <div class="form-group col-md-6">
                                            <button type="submit" id="save" class="btn btn-shopping-cart">
                                                <span class="fa fa-check"></span> Сохранить
                                            </button>
                                        </div>
                                    </fieldset>
                                </form>
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