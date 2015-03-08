<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
    <script src="../../webres/cp/js/order_edit.js"></script>
</head>
<body>
<div id="container">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/nav-menu.jsp"%>

    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <h1>Заказы</h1>
                <div class="pull-right">
                    <button type="submit" class="btn btn-primary" data-toggle="tooltip" data-original-title="Сохранить"><i class="fa fa-save"></i></button>
                    <a href="<c:url value="/cp/order"/>" data-toggle="tooltip" class="btn btn-default" data-original-title="Назад"><i class="fa fa-reply"></i></a>

                    <div class="pull-left" style="width: 300px;">
                        <label class="col-md-3 col-xs-3 control-label" for="order-status" style="margin-top: 7px;">Статус</label>
                        <div class="col-md-9 col-xs-9">
                            <select name="order_status" id="order-status" class="form-control">
                                <option value="0" selected>Открыт</option>
                                <option value="1">Выполнен</option>
                                <option value="2">Отклонен</option>
                                <option value="3">Доставляется</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> Редактировать заказ</h3>
                </div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <ul id="order" class="nav nav-tabs nav-justified">
                            <li class="disabled active"><a href="#tab-customer" data-toggle="tab">1. Данные клиента</a></li>
                            <li class="disabled"><a href="#tab-cart" data-toggle="tab">2. Товары</a></li>
                            <li class="disabled"><a href="#tab-payment" data-toggle="tab">3. Доставка и оплата</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab-customer">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-customer">Клиент</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="customer" value="" placeholder="Введите имя клиента" id="input-customer" class="form-control" autocomplete="off">
                                        <ul class="dropdown-menu"></ul>
                                        <input type="hidden" name="customer_id" value="0">
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <label class="col-sm-2 control-label" for="input-firstname">Имя</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="firstname" value="Svyatoslav" id="input-firstname" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <label class="col-sm-2 control-label" for="input-lastname">Фамилия</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="lastname" value="Karyagin" id="input-lastname" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <label class="col-sm-2 control-label" for="input-email">E-Mail</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="email" value="spellscape@spellscape.biz" id="input-email" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <label class="col-sm-2 control-label" for="input-telephone">Телефон</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="telephone" value="466677678" id="input-telephone" class="form-control">
                                    </div>
                                </div>
                                <div class="text-right">
                                    <button type="button" id="button-customer" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-arrow-right"></i> Продолжить</button>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab-cart">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <td class="text-left">Название</td>
                                            <td class="text-right">Количество</td>
                                            <td class="text-right">Цена за единицу</td>
                                            <td class="text-right">Всего</td>
                                            <td></td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="text-left"><a href="">HP LP3065</a></td>
                                            <td class="text-right">1</td>
                                            <td class="text-right">£61.25</td>
                                            <td class="text-right">£61.25</td>
                                            <td class="text-right">
                                                <a href="<c:url value=""/>" id="button-delete" data-toggle="tooltip" class="btn btn-danger" data-original-title="Удалить"><i class="fa fa-trash-o"></i></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" class="text-right">Итого:</td>
                                            <td class="text-right">£64.31</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab-product">
                                        <fieldset>
                                            <legend>Добавление товара</legend>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="input-product">Выберите продукт</label>
                                                <div class="col-sm-10">
                                                    <input type="text" name="product" value="" id="input-product" class="form-control" autocomplete="off"><ul class="dropdown-menu"></ul>
                                                    <input type="hidden" name="product_id" value="">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label" for="input-quantity">Количество</label>
                                                <div class="col-sm-10">
                                                    <input type="text" name="quantity" value="1" id="input-quantity" class="form-control">
                                                </div>
                                            </div>
                                        </fieldset>
                                        <div class="text-right">
                                            <button type="button" id="button-product-add" data-loading-text="Loading..." class="btn btn-primary"><i class="fa fa-plus-circle"></i> Добавить</button>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-sm-6 text-left">
                                        <button type="button" onclick="$('a[href=\'#tab-customer\']').tab('show');" class="btn btn-default"><i class="fa fa-arrow-left"></i> Назад</button>
                                    </div>
                                    <div class="col-sm-6 text-right">
                                        <button type="button" id="button-cart" class="btn btn-primary"><i class="fa fa-arrow-right"></i> Продолжить</button>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab-payment">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-customer-city">Город</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="city" placeholder="Введите город" id="input-customer-city" class="form-control" autocomplete="off">
                                        <ul class="dropdown-menu"></ul>
                                        <input type="hidden" name="city_id" value="0">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="shipping-type">Способ доставки</label>
                                    <div class="col-sm-10">
                                        <select name="shipping_type" id="shipping-type" class="form-control">
                                            <option value="0" selected>Самовывоз</option>
                                            <option value="1">Курьером</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Служба доставки</label>
                                    <div class="col-sm-10">
                                        <select name="shipping_service_pickup" id="shipping-service-pickup" class="form-control">
                                            <option value="0" selected>Новая почта</option>
                                        </select>
                                        <select name="shipping_service_courier" id="shipping-service-courier" class="form-control" style="display: none;">
                                            <option value="1" selected>Мист Экспресс</option>
                                            <option value="2">Postman</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Выберите адрес доставки</label>
                                    <div class="col-sm-10">
                                        <select name="shipping_address_pickup" id="shipping-address-pickup" class="form-control">
                                            <option value="0" selected>bbbbbb</option>
                                        </select>
                                        <select name="shipping_address_courier" id="shipping-address-courier" class="form-control" style="display: none;">
                                            <option value="0" selected>aaaaaa</option>
                                            <option value="new">Добавить другой...</option>
                                        </select>
                                        <div id="new_address_field" style="padding-top: 15px; display: none;">
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
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="payment-type">Способ оплаты</label>
                                    <div class="col-sm-10">
                                        <select name="payment_type" id="payment-type" class="form-control">
                                            <option value="0" selected>Наличными при получении</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 text-left">
                                        <button type="button" onclick="$('a[href=\'#tab-cart\']').tab('show');" class="btn btn-default"><i class="fa fa-arrow-left"></i> Назад</button>
                                    </div>
                                </div>
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