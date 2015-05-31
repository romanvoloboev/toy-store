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
                <h1>Панель управления</h1>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="tile">
                        <div class="tile-heading">Пользователей</div>
                        <div class="tile-body"><i class="fa fa-user"></i>
                            <h2 class="pull-right">${customersCount}</h2>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="tile">
                        <div class="tile-heading">Продано товаров</div>
                        <div class="tile-body"><i class="fa fa-shopping-cart"></i>
                            <h2 class="pull-right">${soldProductsCount}</h2>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="tile">
                        <div class="tile-heading">Сумма продаж</div>
                        <div class="tile-body"><i class="fa fa-credit-card"></i>
                            <h2 class="pull-right">${totalMoney} ₴</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-sx-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-shopping-cart"></i> Последние заказы</h3>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="text-center col-md-2">Номер заказа</th>
                                    <th class="text-left col-md-4">Покупатель</th>
                                    <th class="text-center col-md-2">Состояние</th>
                                    <th class="text-center col-md-2">Сумма заказа</th>
                                    <th class="text-center col-md-2">Дата заказа</th>
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