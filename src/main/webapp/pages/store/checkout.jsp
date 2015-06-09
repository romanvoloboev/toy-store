<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Floral Store</title>
    <meta name="description" content="My Store">

    <%@include file="includes/head.jsp"%>
    <script src="../../webres/store/js/checkout.js"></script>

    <script type="text/javascript" src="../../webres/store/js/inputmask.min.js"></script>
    <script type="text/javascript" src="../../webres/store/js/jquery.inputmask.min.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js?libraries=places&sensor=false"></script>
    <script src="../../webres/store/js/city_autocomplete.js"></script>

    <script type="text/javascript">
        $('.checkout-heading a').live('click', function() {
            $('.checkout-content').slideUp('slow');
            $('#contacts-data').find('.checkout-heading').html('1. Контактные данные');
            $('#contacts-data').find('.checkout-content').slideDown('slow');
        });

        $('#nextStep').live('click', function() {
            $('.checkout-content').slideUp('slow');
            $('#payment-address').find('.checkout-content').slideDown('slow');
            $('#contacts-data').find('.checkout-heading').html('1. Контактные данные <a>Редактировать &raquo;</a>');
        });
    </script>
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
                            <div class="col-lg-12" style="padding-bottom: 16px;"><h1>Оформление заказа</h1></div>
                            <div class="col-md-12">
                                <div class="checkout">
                                    <div id="contacts-data">
                                        <div class="checkout-heading">1. Контактные данные</div>
                                        <div class="checkout-content" style="overflow: hidden; display: block;">
                                            <div class="col-md-6" style="margin-left: -10px;">
                                                <table>
                                                    <tbody>
                                                    <tr>
                                                        <td style="text-align: right; font-weight: bold;"><p style="margin: 5px 0 5px 0;">ФИО получателя</p></td>
                                                        <td><input id="name" style="width: 250px; margin-left: 10px;" value="${customer.name}" class="form-control" type="text"></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right; font-weight: bold;"><p style="margin: 5px 0 5px 0;">Телефон</p></td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${not empty customer.phone}">
                                                                    <div id="customer-phone" class="pull-left" style="margin-left: 10px;">${customer.phone}</div>
                                                                    <div id="remove-phone" class="pull-left" style="margin-left: 10px;">
                                                                        <a onclick="event.preventDefault(); removePhone();" data-toggle="tooltip" data-original-title="Удалить"><i class="fa fa-times fa-lg"></i></a>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <input id="newPhoneInput" placeholder="+38(___)___-__-__" style="margin-left: 10px; width: 250px;" class="form-control" type="text" required>
                                                                </c:otherwise>
                                                            </c:choose>
                                                            <input id="newPhoneInput" placeholder="+38(___)___-__-__" style="margin-left: 10px; width: 250px; display: none;" class="form-control" type="text" required>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                    <tfoot>
                                                    <tr>
                                                        <td></td>
                                                        <td>
                                                            <div class="form-group col-md-12" style="padding-top: 10px;">
                                                                <button id="nextStep" class="btn btn-shopping-cart btn-arrow">Далее</button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="payment-address">
                                        <div class="checkout-heading">2. Доставка и оплата</div>
                                        <div class="checkout-content">
                                            <c:choose>
                                                <c:when test="${empty customer.addressesList}">
                                                    <div id="new-customer-address-form" class="col-md-6" style="padding: 0 0 15px; display: block;">
                                                        <div class="col-md-12 col-sm-12 text-center" style="padding-bottom: 5px;">
                                                            <span style="color: #e82000; font-weight: bold;">Для продолжения укажите свой адрес</span>
                                                        </div>
                                                        <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" style="padding: 0 0 15px 0">
                                                            <input id="newCityInput" type="text" placeholder="Введите город" class="form-control" autocomplete="on">
                                                        </div>
                                                        <div class="col-lg-6 col-md-6 col-xs-6 col-sm-6"  style="padding-left: 0; padding-right: 0;">
                                                            <input id="newStreetInput" placeholder="Улица" class="form-control" type="text" required>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-xs-2 col-sm-2" id="new-house" style="padding-right: 0;">
                                                            <input id="newHouseInput" placeholder="Дом" class="form-control" type="text" required>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-xs-2 col-sm-2" id="new-flat" style="padding-right: 0;">
                                                            <input id="newFlatInput" placeholder="Кв." class="form-control" type="text" required>
                                                        </div>
                                                        <div class="col-lg-2 col-md-2 col-xs-2 col-sm-2" style="padding-right: 0;">
                                                            <button type="button" id="btn-add-address" class="btn btn-shopping-cart pull-right"><i class="fa fa-check"></i>&nbsp;OK</button>
                                                        </div>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div id="delivery-content" style="padding: 0;">
                                                        <div class="col-md-2 col-xs-3"><strong>Доставка:</strong></div>
                                                        <div class="col-md-10 col-xs-9">
                                                            <ul class="links">
                                                                <li><a class="pickupType activeDeliveryType" href="#" data-deliveryType="1" onclick="event.preventDefault();">Самовывоз</a></li>
                                                                <li><a class="courierType" href="#" data-deliveryType="2" onclick="event.preventDefault();">Курьер</a></li>
                                                            </ul>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                        <div class="pickup col-md-6" style="padding: 20px 0 20px 20px;">
                                                            <ul>
                                                                <li>
                                                                    <label style="font-weight: normal;">
                                                                        <input type="radio" id="pickupService" value="1" checked>&nbsp;из Новой Почты
                                                                    </label>
                                                                </li>
                                                            </ul>
                                                            <div id="courier-city-block">
                                                                <select class="form-control" id="courier-city">
                                                                    <option value="0" selected disabled>--- Выберите город отделения ---</option>
                                                                </select>
                                                            </div>

                                                            <div id="department-address" style="display: none;">
                                                                <label for="shipping-address-pickup" style="padding-top: 10px; font-weight: normal;">Адрес отделения</label>
                                                                <select class="form-control" id="shipping-address-pickup" disabled>
                                                                    <option value="0" selected disabled>--- Выберите адрес отделения ---</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>

                                            <div id="delivery-content" style="padding: 0; display: none;">
                                                <div class="col-md-2 col-xs-3"><strong>Доставка:</strong></div>
                                                <div class="col-md-10 col-xs-9">
                                                    <ul class="links">
                                                        <li><a class="pickupType activeDeliveryType" href="#" data-deliveryType="1" onclick="event.preventDefault();">Самовывоз</a></li>
                                                        <li><a class="courierType" href="#" data-deliveryType="2" onclick="event.preventDefault();">Курьер</a></li>
                                                    </ul>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="pickup col-md-6" style="padding: 20px 0 20px 20px;">
                                                    <ul>
                                                        <li>
                                                            <label style="font-weight: normal;">
                                                                <input type="radio" id="pickupService" value="1" checked>&nbsp;из Новой Почты
                                                            </label>
                                                        </li>
                                                    </ul>
                                                    <div id="courier-city-block">
                                                        <select class="form-control" id="courier-city">
                                                            <option value="0" selected disabled>--- Выберите город отделения ---</option>
                                                        </select>
                                                    </div>

                                                    <div id="department-address" style="display: none;">
                                                        <label for="shipping-address-pickup" style="padding-top: 10px; font-weight: normal;">Адрес отделения</label>
                                                        <select class="form-control" id="shipping-address-pickup" disabled>
                                                            <option value="0" selected disabled>--- Выберите адрес отделения ---</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="courier col-md-6" style="padding: 20px 0 20px 20px; display: none;">
                                                <ul>
                                                    <li>
                                                        <label style="font-weight: normal;"><input type="radio" id="mistexpr" name="courierService" value="2" checked>&nbsp;Мист Экспресс</label>
                                                    </li>
                                                    <li>
                                                        <label style="font-weight: normal;"><input type="radio" id="postman" name="courierService" value="3">&nbsp;Postman</label>
                                                    </li>
                                                </ul>
                                                <label for="address" style="padding-top: 10px; font-weight: normal;">Адрес получателя</label>
                                                <select id="address" class="form-control">
                                                </select>
                                                <div id="new_address_field" class="col-md-12" style="padding: 0 0 15px; margin-top: 15px; display: none;">
                                                    <div class="col-lg-12 col-md-12 col-xs-12 col-sm-12" style="padding: 0 0 15px 0">
                                                        <input id="newCityInput" type="text" placeholder="Введите город" class="form-control" autocomplete="on">
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-xs-6 col-sm-6"  style="padding-left: 0; padding-right: 0;">
                                                        <input id="newStreetInput" placeholder="Улица" class="form-control" type="text" required>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-2 col-sm-2" id="new-house" style="padding-right: 0;">
                                                        <input id="newHouseInput" placeholder="Дом" class="form-control" type="text" required>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-2 col-sm-2" id="new-flat" style="padding-right: 0;">
                                                        <input id="newFlatInput" placeholder="Кв." class="form-control" type="text" required>
                                                    </div>
                                                    <div class="col-lg-2 col-md-2 col-xs-2 col-sm-2" style="padding-right: 0;">
                                                        <button type="button" id="btn-add-address" class="btn btn-shopping-cart pull-right"><i class="fa fa-check"></i>&nbsp;OK</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-md-2 col-xs-3"><strong>Оплата:</strong></div>
                                            <div class="col-md-10 col-xs-9">
                                                <ul class="links">
                                                    <li><a class="cashType activePaymentType" href="#" id="cash" onclick="event.preventDefault();">Наличными</a></li>
                                                    <li><a class="noncashType" href="#" id="nocash" onclick="event.preventDefault();">Безналичными</a></li>
                                                </ul>
                                            </div>

                                            <div class="cart col-md-6 col-xs-12" style="padding-top: 20px;">
                                                <button id="confirmOrder" class="btn btn-shopping-cart">
                                                    <span class="fa fa-shopping-cart icon"></span> Заказ подтверждаю
                                                </button>
                                            </div>

                                        </div>
                                    </div>
                                    <div id="order-success" style="display: none;">
                                        <p>Благодарим за покупку, мы получили заказ и скоро свяжемся с Вами.</p>
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