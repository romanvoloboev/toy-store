<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
    <script src="../../webres/cp/js/order.js"></script>
    <script src="../../webres/cp/js/i18n/ru.js"></script>
</head>
<body>
<div id="container">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/nav-menu.jsp"%>

    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="col-sm-12 col-md-4 col-lg-6" style="padding-left: 0;">
                    <h4 style="padding-bottom: 7px; padding-top: 8px; margin-bottom: 0;"><i class="fa fa-list"></i>&nbsp;Управление заказами</h4>
                </div>
                <div class="col-sm-12 col-md-8 col-lg-6 to-left-sm" style="padding-left: 0; padding-right: 0; text-align: right;">
                    <a href="<c:url value="/cp/order/add"/>" class="btn btn-success"><i class="fa fa-plus"></i>&nbsp;Добавить заказ</a>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="well">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 form-group" id="input-order-block" style="padding-right: 0; margin-bottom: 0;">
                                <input type="text" placeholder="Номер заказа" id="order-number" class="form-control" autocomplete="off">
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 form-group" id="input-status-block"  style="padding-right: 0; margin-bottom: 0;">
                                <select class="form-control" id="order-status">
                                    <option value="0" selected disabled>Состояние заказа</option>
                                    <option value="1">Открыт</option>
                                    <option value="2">Отклоенен</option>
                                    <option value="3">Выполнен</option>
                                    <option value="4">Доставляется</option>
                                </select>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3" id="customer-block">
                                <select class="form-control select2" id="customer">
                                    <option value="0" selected disabled>Пользователь</option>
                                </select>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-1 col-lg-1 form-group" style="padding-right: 0; margin-bottom: 0;">
                                <button type="button" id="search-btn" class="btn btn-default"><i class="fa fa-search"></i> Поиск</button>
                            </div>
                        </div>
                    </div>
                    <div class="form-horizontal">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="text-center col-md-1">Номер заказа</th>
                                    <th class="text-left col-md-3">Покупатель</th>
                                    <th class="text-center col-md-2">Состояние</th>
                                    <th class="text-center col-md-2">Сумма заказа</th>
                                    <th class="text-center col-md-2">Дата заказа</th>
                                    <th class="text-center col-md-2">Действие</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${not empty order}">
                                        <c:forEach items="${order}" var="o">
                                            <tr>
                                                <td class="text-center">${o.id}</td>
                                                <td class="text-left">${o.customerName}</td>
                                                <td class="text-center">
                                                    <c:choose>
                                                        <c:when test="${o.statusName == 'Открыт'}">
                                                            <span class="label label-warning">${o.statusName}</span>
                                                        </c:when>
                                                        <c:when test="${o.statusName == 'Отклонён'}">
                                                            <span class="label label-danger">${o.statusName}</span>
                                                        </c:when>
                                                        <c:when test="${o.statusName == 'Выполнен'}">
                                                            <span class="label label-success">${o.statusName}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="label label-primary">${o.statusName}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="text-center">${o.amount}</td>
                                                <td class="text-center">${o.date}</td>
                                                <td class="text-center">
                                                    <div class="btn-group btn-group-default">
                                                        <button data-toggle="dropdown" title="Изменить состояние" class="btn btn-default dropdown-toggle" type="button"><span class="fa fa-cogs"></span>
                                                        </button>
                                                        <ul class="dropdown-menu dropup">
                                                            <li><a href="#" onclick="return changeStatus(${o.id}, 1)">Открыт</a></li>
                                                            <li><a href="#" onclick="return changeStatus(${o.id}, 2)">Отклонён</a></li>
                                                            <li><a href="#" onclick="return changeStatus(${o.id}, 3)">Выполнен</a></li>
                                                            <li><a href="#" onclick="return changeStatus(${o.id}, 4)">Доставляется</a></li>
                                                        </ul>
                                                    </div>
                                                    <a href="<c:url value="/cp/order/details?id=${o.id}"/>" data-toggle="tooltip" class="btn btn-default" data-original-title="Подробнее"><i class="fa fa-info-circle"></i></a>
                                                    <button onclick="deleteOrder(${o.id})" type="button" data-toggle="tooltip" class="btn btn-danger" title="Удалить заказ">
                                                        <span class="fa fa-trash"></span>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td class="text-center" colspan="6">Нет данных</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
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