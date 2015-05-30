<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
</head>
<body>
<div id="container">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/nav-menu.jsp"%>

    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="col-sm-12 col-md-4 col-lg-6" style="padding-left: 0;">
                    <h4 style="padding-bottom: 7px; padding-top: 8px; margin-bottom: 0;"><i class="fa fa-list"></i>&nbsp;Информация о заказе №${order.id}</h4>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-order" data-toggle="tab">Общая информация</a></li>
                        <li><a href="#tab-payment" data-toggle="tab">Доставка и оплата</a></li>
                        <li><a href="#tab-product" data-toggle="tab">Товары</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-order">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td>Покупатель:</td>
                                    <td>${order.customerName}</td>
                                </tr>
                                <tr>
                                    <td>E-mail:</td>
                                    <td>${order.customerEmail}</td>
                                </tr>
                                <tr>
                                    <td>Телефон:</td>
                                    <td>${order.customerPhone}</td>
                                </tr>
                                <tr>
                                    <td>Итого:</td>
                                    <td>${order.amount}</td>
                                </tr>
                                <tr>
                                    <td>Статус заказа:</td>
                                    <td>${order.statusName}</td>
                                </tr>
                                <tr>
                                    <td>Дата заказа:</td>
                                    <td>${order.date}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane" id="tab-payment">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td>Способ доставки</td>
                                    <td>${order.deliveryTypeName}</td>
                                </tr>
                                <tr>
                                    <td>Служба доставки</td>
                                    <td>${order.deliveryServiceName}</td>
                                </tr>
                                <tr>
                                    <td>Адрес</td>
                                    <td>${order.customerAddress}</td>
                                </tr>
                                <tr>
                                    <td>Оплата</td>
                                    <td>${order.paymentTypeName}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane" id="tab-product">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th class="text-left col-md-6">Название</th>
                                    <th class="text-center col-md-2">Количество</th>
                                    <th class="text-center col-md-2">Цена за единицу</th>
                                    <th class="text-center col-md-2">Всего</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${order.items}" var="item">
                                    <tr>
                                        <td class="text-left"><a href="<c:url value='/product?id=${item.product}'/>">${item.productName}</a></td>
                                        <td class="text-center">${item.quantity}</td>
                                        <td class="text-center">${item.price}</td>
                                        <td class="text-center">${item.totalItemPrice}</td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="3" class="text-right"><strong>Итого:</strong></td>
                                    <td class="text-center">${order.amount}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>