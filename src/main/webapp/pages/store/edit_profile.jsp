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
                            <div class="col-lg-12" style="padding-bottom: 16px;"><h1>Редактирование профиля</h1></div>
                            <div class="col-md-7">
                                <table>
                                    <tbody>
                                    <tr>
                                        <td style="text-align: left; font-weight: bold;"><p style="margin: 5px 0 5px 0;">Ваше имя</p></td>
                                        <td><input id="name" style="width: 293px;" value="${customer.name}" class="form-control" type="text" required></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; font-weight: bold;"><p style="margin: 5px 0 5px 0;">E-mail</p></td>
                                        <td><p style="margin: 5px 0 5px 0;">${customer.email}</p></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; font-weight: bold;"><p style="margin: 5px 0 5px 0;">Телефон</p></td>
                                        <td>
                                            <div id="customer-phone" class="pull-left">${customer.phone}</div>
                                            <input id="new-phone" placeholder="+38(___)___-__-__" style="width: 293px; display: none;" class="form-control" type="text" required>
                                            <div id="remove-phone" class="pull-right" style="margin-left: 10px;">
                                                <a href="" onclick="event.preventDefault(); removePhone();" data-toggle="tooltip" title=""  data-original-title="Удалить"><i class="fa fa-times fa-lg"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; font-weight: bold;"><p style="margin: 5px 0 5px 0;">Адрес доставки</p></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty addressesList}">
                                                        <c:forEach items="${addressesList}" var="a">
                                                            <div id="customer-address${a.id}" class="pull-left">${a.value}</div>
                                                            <div id="address-remove-btn${a.id}" class="pull-right" style="margin-left: 10px;">
                                                                <a href="" onclick="event.preventDefault(); removeAddress(${a.id});" data-toggle="tooltip" title=""  data-original-title="Удалить"><i class="fa fa-times fa-lg"></i></a>
                                                            </div>
                                                            <br>
                                                        </c:forEach>

                                                        <div style="padding-top: 5px;">
                                                            <a href="" id="add-new-address-btn"><i class="fa fa-plus fa-lg"></i> Добавить ещё</a>
                                                        </div>

                                                        <div id="new-address-form" style="display: none;">
                                                            <div class="col-md-12 col-sm-12" style="padding: 0 0 10px 0">
                                                                <input id="new-city" style="width: 293px;" type="text" placeholder="Введите город" class="form-control" autocomplete="off">
                                                                <ul class="dropdown-menu"></ul>
                                                                <input type="hidden" name="city_id" value="0">
                                                            </div>
                                                            <div id="new-street" class="col-md-8 col-sm-8"  style="width: 203px; padding-left: 0; padding-right: 0;">
                                                                <input placeholder="Улица" class="form-control" type="text" required>
                                                            </div>
                                                            <div id="new-house" class="col-md-2 col-sm-2" style="width: 45px; padding-right: 0;">
                                                                <input placeholder="Дом" class="form-control" type="text" required>
                                                            </div>
                                                            <div id="new-flat" class="col-md-2 col-sm-2"  style="width: 45px; padding-right: 0;">
                                                                <input placeholder="Кв." class="form-control" type="text" required>
                                                            </div>
                                                        </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div id="new-address-form">
                                                        <div class="col-md-12 col-sm-12" style="padding: 0 0 10px 0">
                                                            <input id="new-city" style="width: 293px;" type="text" placeholder="Введите город" class="form-control" autocomplete="off">
                                                            <ul class="dropdown-menu"></ul>
                                                            <input type="hidden" name="city_id" value="0">
                                                        </div>
                                                        <div id="new-street" class="col-md-8 col-sm-8"  style="width: 203px; padding-left: 0; padding-right: 0;">
                                                            <input placeholder="Улица" class="form-control" type="text" required>
                                                        </div>
                                                        <div id="new-house" class="col-md-2 col-sm-2" style="width: 45px; padding-right: 0;">
                                                            <input placeholder="Дом" class="form-control" type="text" required>
                                                        </div>
                                                        <div id="new-flat" class="col-md-2 col-sm-2"  style="width: 45px; padding-right: 0;">
                                                            <input placeholder="Кв." class="form-control" type="text" required>
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="form-group col-md-3 col-sm-3 col-sm-offset-7 col-md-offset-7" style="padding-top: 10px; padding-left: 0; padding-right: 0;">
                                    <button type="submit" id="save" class="btn btn-shopping-cart pull-right">
                                        <span class="fa fa-check"></span> Сохранить
                                    </button>
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