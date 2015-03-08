<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Floral Store</title>
    <meta name="description" content="My Store">

    <%@include file="includes/head.jsp"%>
    <script src="../../webres/store/js/edit_profile.js"></script>
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
                                <div class="">
                                    <div class="row">
                                        <input type="hidden">
                                        <div class="form-group col-md-12">
                                            <input name="first_name" placeholder="Имя" class="form-control" type="text" required="true">
                                        </div>
                                        <div class="form-group col-md-12">
                                            <input name="email" placeholder="E-mail" class="form-control" type="text" required="true">
                                        </div>
                                        <div class="form-group col-md-12">
                                            <input name="phone" placeholder="телефон" class="form-control" type="text" required="true">
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-12" for="input-customer-city">Адрес доставки</label>
                                            <c:choose>
                                                <c:when test="${empty model.address}">
                                                    <div class="col-md-12" id="new-address-form">
                                                        <div class="col-md-12 col-sm-12" style="padding: 0 0 10px 0">
                                                            <input type="text" placeholder="Введите город" id="input-customer-city" class="form-control" autocomplete="off">
                                                            <ul class="dropdown-menu"></ul>
                                                            <input type="hidden" name="city_id" value="0">
                                                        </div>
                                                        <div id="street" class="col-md-8 col-sm-8"  style="padding-left: 0; padding-right: 0;">
                                                            <input name="street" placeholder="Улица" class="form-control" type="text" required="true">
                                                        </div>
                                                        <div id="house" class="col-md-2 col-sm-2" style="padding-right: 0;">
                                                            <input name="house_number" placeholder="Дом" class="form-control" type="text" required="true">
                                                        </div>
                                                        <div id="flat" class="col-md-2 col-sm-2"  style="padding-right: 0;">
                                                            <input name="flat_number" placeholder="Кв." class="form-control" type="text" required="true">
                                                        </div>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="col-md-12" style="padding-top: 7px;">
                                                        <c:forEach items="${model.address}" var="address">
                                                            <div id="customer-address${address.id}" class="pull-left">${address.name}</div>
                                                            <div class="pull-left" style="margin-left: 10px;">
                                                                <a href onclick="event.preventDefault(); removeAddress(${address.id});" data-toggle="tooltip" title=""  data-original-title="Удалить"><i class="fa fa-times fa-lg"></i></a>
                                                            </div>
                                                            <br>
                                                        </c:forEach>

                                                        <div style="padding-top: 5px;">
                                                            <a href id="add-new-address-btn"><i class="fa fa-plus fa-lg"></i> Добавить ещё</a>
                                                        </div>

                                                        <div id="new-address-form" style="display: none;">
                                                            <div class="col-md-12 col-sm-12" style="padding: 0 0 10px 0">
                                                                <input type="text" placeholder="Введите город" id="input-customer-city" class="form-control" autocomplete="off">
                                                                <ul class="dropdown-menu"></ul>
                                                                <input type="hidden" name="city_id" value="0">
                                                            </div>
                                                            <div id="street" class="col-md-8 col-sm-8"  style="padding-left: 0; padding-right: 0;">
                                                                <input name="street" placeholder="Улица" class="form-control" type="text" required="true">
                                                            </div>
                                                            <div id="house" class="col-md-2 col-sm-2" style="padding-right: 0;">
                                                                <input name="house_number" placeholder="Дом" class="form-control" type="text" required="true">
                                                            </div>
                                                            <div id="flat" class="col-md-2 col-sm-2"  style="padding-right: 0;">
                                                                <input name="flat_number" placeholder="Кв." class="form-control" type="text" required="true">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div style="display: none; padding: 8px;" id="passMismatchMsg" class="alert alert-danger" role="alert"></div>
                                        <div class="form-group col-md-6" style="padding-top: 10px;">
                                            <button type="submit" id="save" class="btn btn-shopping-cart">
                                                <span class="fa fa-check"></span> Сохранить
                                            </button>
                                        </div>
                                    </div>
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