<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
    <script src="../../webres/cp/js/customer.js"></script>
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
                    <h4 style="padding-bottom: 7px; padding-top: 8px; margin-bottom: 0;"><i class="fa fa-list"></i>&nbsp;Управление пользователями</h4>
                </div>
                <div class="col-sm-12 col-md-8 col-lg-6 to-left-sm" style="padding-left: 0; padding-right: 0; text-align: right;">
                    <a href="<c:url value="/cp/customer/add"/>" class="btn btn-success"><i class="fa fa-plus"></i>&nbsp;Добавить пользователя</a>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="well">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 form-group" id="input-customer-name-block" style="padding-right: 0; margin-bottom: 0;">
                                <select class="form-control select2" id="customer-name">
                                    <option value="0" selected disabled>Имя пользователя</option>
                                </select>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 form-group" id="input-customer-email-block" style="padding-right: 0; margin-bottom: 0;">
                                <select class="form-control select2" id="customer-email">
                                    <option value="0" selected disabled>E-mail пользователя</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-horizontal col-sm-12 col-md-12 col-lg-12" style="padding: 0;">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="text-left col-md-3">Имя</th>
                                    <th class="text-left col-md-3">E-mail</th>
                                    <th class="text-left col-md-3">Телефон</th>
                                    <th class="text-center col-md-1">Отзывы</th>
                                    <th class="text-center col-md-2">Действие</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${not empty customer}">
                                        <c:forEach items="${customer}" var="c">
                                            <tr>
                                                <td class="text-left">${c.name}</td>
                                                <td class="text-left">${c.email}</td>
                                                <td class="text-left"><c:out value="${c.phone == '' ? 'Не указан' : c.phone}"/></td>
                                                <td class="text-center"><a href="<c:url value=""/>"><span class="label label-success">${c.reviewsCount}</span></a></td>
                                                <td class="text-center">
                                                    <a href="<c:url value="/cp/customer/edit?id=${c.id}"/>" data-toggle="tooltip" title="Редактировать" class="btn btn-default" data-original-title="Редактировать"><i class="fa fa-pencil"></i></a>
                                                    <button type="button" onclick="changeCustomerStatus(${c.id})" data-toggle="tooltip" class="btn <c:out value="${c.active ? 'btn-success' : 'btn-danger'}"/>"
                                                            title="<c:out value="${c.active ? 'Заблокировать пользователя' : 'Активировать пользователя'}"/>">
                                                        <span class="fa fa-ban"></span>
                                                    </button>
                                                    <button type="button" onclick="deleteCustomer(${c.id})" data-toggle="tooltip" class="btn btn-danger" title="Удалить пользователя">
                                                        <span class="fa fa-trash"></span>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td class="text-center" colspan="5">Нет данных</td>
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