<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
    <script src="../../webres/cp/js/order_add.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js?libraries=places&sensor=false"></script>
    <script src="../../webres/store/js/city_autocomplete.js"></script>
</head>
<body>
<div id="container">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/nav-menu.jsp"%>

    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="col-sm-12 col-md-4 col-lg-6" style="padding-left: 0;">
                    <h4 style="padding-bottom: 7px; padding-top: 8px; margin-bottom: 0;"><i class="fa fa-plus"></i>&nbspДобавление заказа</h4>
                </div>
                <div class="col-sm-12 col-md-8 col-lg-6 to-left-sm" style="padding-left: 0; padding-right: 0; text-align: right;">
                    <a href="<c:url value="/cp/order"/>" data-toggle="tooltip" class="btn btn-default" data-original-title="Назад"><i class="fa fa-reply"></i>&nbsp;Отмена</a>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-horizontal col-xs-12 col-sm-12 col-md-8 col-lg-8" style="padding: 0;">
                        <div class="form-group">
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <select class="form-control select2" id="product-name">
                                    <option value="0" selected disabled>--- Выберите товар ---</option>
                                </select>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                <input type="text" placeholder="Количество" id="product-quantity" class="form-control">
                            </div>
                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                <button type="button" id="btn-add-product" class="btn btn-primary pull-right"><i class="fa fa-plus-circle"></i>&nbsp;Добавить</button>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered" id="products" style="display: none;">
                                <thead>
                                <tr>
                                    <th class="text-left col-xs-6 col-sm-6 col-md-6 col-lg-6">Товар</th>
                                    <th class="text-center col-xs-2 col-sm-2 col-md-2 col-lg-2">Количество</th>
                                    <th class="text-center col-xs-2 col-sm-2 col-md-2 col-lg-2">Цена за единицу</th>
                                    <th class="text-center col-xs-2 col-sm-2 col-md-2 col-lg-2">Иого</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <select class="form-control select2" id="customer-name">
                                    <option value="0" selected disabled>--- Выберите пользователя ---</option>
                                </select>
                            </div>
                        </div>

                        <div id="new-customer-address-form" class="col-md-12" style="padding: 0 0 15px; display: none;">
                            <div class="col-md-12 col-sm-12 text-center" style="padding-bottom: 5px;">
                                <span style="color: #e82000; font-weight: bold;">Пользователь не указал ни одного адреса. Укажите Вы.</span>
                            </div>
                            <div class="col-md-12 col-sm-12" style="padding: 0 0 15px 0">
                                <input id="newCityInput" type="text" placeholder="Введите город" class="form-control" autocomplete="on">
                            </div>
                            <div class="col-md-4 col-sm-8"  style="padding-left: 0; padding-right: 0;">
                                <input id="newStreetInput" placeholder="Улица" class="form-control" type="text" required>
                            </div>
                            <div class="col-md-3 col-sm-3" id="new-house" style="padding-right: 0;">
                                <input id="newHouseInput" placeholder="Дом" class="form-control" type="text" required>
                            </div>
                            <div class="col-md-3 col-sm-3" id="new-flat" style="padding-right: 0;">
                                <input id="newFlatInput" placeholder="Кв." class="form-control" type="text" required>
                            </div>
                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="padding-right: 0;">
                                <button type="button" id="btn-add-address" class="btn btn-primary pull-right"><i class="fa fa-plus-circle"></i>&nbsp;Добавить</button>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <select class="form-control" id="delivery-type" disabled>
                                    <option value="0" selected disabled>--- Тип доставки ---</option>
                                    <option value="1">Самовывоз</option>
                                    <option value="2">Курьером</option>
                                </select>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <select id="shipping-service-pickup" class="form-control" disabled>
                                    <option value="0" selected disabled>--- Служба доставки ---</option>
                                    <option value="1">Новая почта</option>
                                </select>
                                <select id="shipping-service-courier" class="form-control" style="display: none;">
                                    <option value="0" selected disabled>--- Служба доставки ---</option>
                                    <option value="2">Мист Экспресс</option>
                                    <option value="3">Postman</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="courier-city-block" style="display: none;">
                                <select class="form-control" id="courier-city" disabled>
                                    <option value="0" selected disabled>--- Выберите город отделения ---</option>
                                </select>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="shipping-address-block">
                                <select class="form-control" id="shipping-address-pickup" disabled style="display: none">
                                    <option value="0" selected disabled>--- Выберите адрес отделения ---</option>
                                </select>
                                <select class="form-control" id="shipping-address-courier" style="display: none">
                                    <option value="0" selected disabled>--- Выберите адрес пользователя ---</option>
                                </select>
                            </div>

                        </div>
                        <div class="form-group">
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <select id="payment-type" class="form-control">
                                    <option value="0" selected disabled>--- Способ оплаты ---</option>
                                    <option value="1">Наличными</option>
                                    <option value="2">Безналичными</option>
                                </select>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <button type="button" id="btn-add-order" class="btn btn-success pull-right"><i class="fa fa-check"></i> Сохранить</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>