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
                            <div class="col-lg-12" style="padding-bottom: 16px;"><h1>Оформление заказа</h1></div>
                            <div class="col-md-12">
                                <div class="checkout">
                                    <div id="contacts-data">
                                        <div class="checkout-heading">1. Контактные данные</div>
                                        <div class="checkout-content" style="overflow: hidden; display: block;">
                                            <div class="col-md-4" style="margin-left: -10px;">
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
                                                    <button id="nextStep" class="btn btn-shopping-cart btn-arrow">Далее</button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div id="payment-address">
                                        <div class="checkout-heading">2. Доставка и оплата</div>
                                        <div class="checkout-content">
                                            <div class="col-md-2 col-xs-3"><strong>Доставка:</strong></div>
                                            <div class="col-md-10 col-xs-9">
                                                <ul class="links">
                                                    <li><a class="pickupType activeDeliveryType" href="#" onclick="event.preventDefault();">Самовывоз</a></li>
                                                    <li><a class="courierType"  href="#" onclick="event.preventDefault();">Курьер</a></li>
                                                </ul>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="pickup col-md-6" style="padding: 20px 0 20px 20px;">
                                                <ul>
                                                    <li>
                                                        <label style="font-weight: normal;">
                                                            <input type="radio" name="pickupService" value="from_np" checked>&nbsp;из Новой Почты
                                                        </label>
                                                    </li>
                                                </ul>
                                                <label for="np_address" style="padding-top: 10px; font-weight: normal;">Адрес отделения</label>
                                                <select id="np_address" class="form-control">
                                                    <option value="1">1</option>
                                                </select>
                                            </div>

                                            <div class="courier col-md-6" style="padding: 20px 0 20px 20px; display: none;">
                                                <ul>
                                                    <li>
                                                        <label style="font-weight: normal;"><input type="radio" name="courierService" value="express" checked>&nbsp;Мист Экспресс</label>
                                                    </li>
                                                    <li>
                                                        <label style="font-weight: normal;"><input type="radio" name="courierService" value="postman">&nbsp;Postman</label>
                                                    </li>
                                                </ul>
                                                <label for="address" style="padding-top: 10px; font-weight: normal;">Адрес получателя</label>
                                                <select id="address" class="form-control">
                                                    <option value="1">1</option>
                                                    <option value="new" class="">Добавить другой...</option>
                                                </select>
                                                <div id="new_address_field" style="padding-top: 10px; display: none;">
                                                    <div id="street" class="form-group col-md-8 col-xs-8">
                                                        <input name="street" placeholder="Улица" class="form-control" type="text" required="true">
                                                    </div>
                                                    <div id="house" class="form-group col-md-2 col-xs-2">
                                                        <input name="house_number" placeholder="Дом" class="form-control" type="text" required="true">
                                                    </div>
                                                    <div id="flat" class="form-group col-md-2 col-xs-2">
                                                        <input name="flat_number" placeholder="Кв." class="form-control" type="text" required="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-md-2 col-xs-3"><strong>Оплата:</strong></div>
                                            <div class="col-md-10 col-xs-9">
                                                <ul class="links">
                                                    <li><a class="activeDeliveryType" href="#" onclick="event.preventDefault();">Наличными при получении</a></li>
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