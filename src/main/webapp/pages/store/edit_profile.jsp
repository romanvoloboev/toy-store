<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Floral Store</title>
    <meta name="description" content="My Store">

    <%@include file="includes/head.jsp"%>
    <script type="text/javascript" src="../../webres/store/js/inputmask.min.js"></script>
    <script type="text/javascript" src="../../webres/store/js/jquery.inputmask.min.js"></script>
    <script src="../../webres/store/js/edit_profile.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js?libraries=places&sensor=false"></script>
    <script src="../../webres/store/js/city_autocomplete.js"></script>
    <style type="text/css">
        .pac-icon {
            width: 0;
            background-image: none;
        }
    </style>
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
                            <div class="col-lg-12" style="padding-bottom: 16px;"><h1>Редактирование личных данных</h1></div>
                            <div class="col-md-8">
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
                                            <c:choose>
                                                <c:when test="${not empty customer.phone}">
                                                    <div id="customer-phone" class="pull-left">${customer.phone}</div>
                                                    <div id="remove-phone" class="pull-right" style="margin-left: 10px;">
                                                        <a onclick="event.preventDefault(); removePhone();" data-toggle="tooltip" data-original-title="Удалить"><i class="fa fa-times fa-lg"></i></a>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <input id="newPhoneInput" placeholder="+38(___)___-__-__" style="width: 293px;" class="form-control" type="text" required>
                                                </c:otherwise>
                                            </c:choose>
                                            <input id="newPhoneInput" placeholder="+38(___)___-__-__" style="width: 293px; display: none;" class="form-control" type="text" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; font-weight: bold;"><p style="margin: 5px 0 5px 0;">Адрес доставки</p></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty customer.addressesList}">
                                                        <c:forEach items="${customer.addressesList}" var="a">
                                                            <div id="customer-address${a.id}" class="pull-left">г. ${a.city}, ул. ${a.street}, д. ${a.house}<c:if test="${not empty a.flat}">, кв. ${a.flat}</c:if></div>
                                                            <div id="address-remove-btn${a.id}" class="pull-right" style="margin-left: 10px;">
                                                                <a onclick="event.preventDefault(); removeAddress(${a.id});" data-toggle="tooltip" title=""  data-original-title="Удалить"><i class="fa fa-times fa-lg"></i></a>
                                                            </div>
                                                            <br>
                                                        </c:forEach>

                                                        <div style="padding-top: 5px;">
                                                            <a href="" id="add-new-address-btn"><i class="fa fa-plus fa-lg"></i> Добавить ещё</a>
                                                        </div>

                                                        <div id="new-address-form" style="display: none;">
                                                            <div class="col-md-12 col-sm-12" style="padding: 0 0 10px 0">
                                                                <input id="newCityInput" style="width: 293px;" type="text" placeholder="Введите город" class="form-control" autocomplete="on">
                                                            </div>
                                                            <div class="col-md-8 col-sm-8"  style="width: 203px; padding-left: 0; padding-right: 0;">
                                                                <input id="newStreetInput" placeholder="Улица" class="form-control" type="text" required>
                                                            </div>
                                                            <div class="col-md-2 col-sm-2" style="width: 45px; padding-right: 0;">
                                                                <input id="newHouseInput" placeholder="Дом" class="form-control" type="text" required>
                                                            </div>
                                                            <div class="col-md-2 col-sm-2"  style="width: 45px; padding-right: 0;">
                                                                <input id="newFlatInput" placeholder="Кв." class="form-control" type="text" required>
                                                            </div>
                                                        </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div id="new-address-form" style="padding-top: 10px;">
                                                        <div class="col-md-12 col-sm-12" style="padding: 0 0 10px 0">
                                                            <input id="newCityInput" style="width: 293px;" type="text" placeholder="Введите город" class="form-control" autocomplete="on">
                                                        </div>
                                                        <div class="col-md-8 col-sm-8"  style="width: 203px; padding-left: 0; padding-right: 0;">
                                                            <input id="newStreetInput" placeholder="Улица" class="form-control" type="text" required>
                                                        </div>
                                                        <div class="col-md-2 col-sm-2" style="width: 45px; padding-right: 0;">
                                                            <input id="newHouseInput" placeholder="Дом" class="form-control" type="text" required>
                                                        </div>
                                                        <div class="col-md-2 col-sm-2"  style="width: 45px; padding-right: 0;">
                                                            <input id="newFlatInput" placeholder="Кв." class="form-control" type="text" required>
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <div style="padding-top: 10px;">
                                                <button type="submit" id="save" class="btn btn-shopping-cart pull-left" disabled>
                                                    <span class="fa fa-check"></span> Сохранить
                                                </button>
                                                <button type="submit" id="cancel" class="btn btn-shopping-cart pull-left" style="margin-left: 10px;">
                                                    <span class="fa"></span> Отмена
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>
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