<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
    <script src="../../webres/cp/js/reviews.js"></script>
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
                    <h4 style="padding-bottom: 7px; padding-top: 8px; margin-bottom: 0;"><i class="fa fa-list"></i>&nbsp;Управление отзывами</h4>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="well">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 form-group" id="input-product-name-block" style="padding-right: 0; margin-bottom: 0;">
                                <select class="form-control select2" id="product-name">
                                    <option value="0" selected disabled>Название товара</option>
                                </select>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 form-group" id="input-customer-name-block" style="padding-right: 0; margin-bottom: 0;">
                                <select class="form-control select2" id="customer-name">
                                    <option value="0" selected disabled>Имя пользователя</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-horizontal">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="text-left col-md-3">Товар</th>
                                    <th class="text-left col-md-3">Комментарий</th>
                                    <th class="text-center col-md-2">Автор</th>
                                    <th class="text-center col-md-1">Оценка</th>
                                    <th class="text-center col-md-1">Дата</th>
                                    <th class="text-center col-md-2">Действие</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${not empty review}">
                                        <c:forEach items="${review}" var="r">
                                            <tr>
                                                <td class="text-left"><a href="<c:url value='/product?id=${r.product}'/>">${r.productName}</a></td>
                                                <td class="text-left">${r.comment}</td>
                                                <td class="text-center">${r.customerName}</td>
                                                <td class="text-center">${r.rating}</td>
                                                <td class="text-center">${r.date}</td>
                                                <td class="text-center">
                                                    <button type="button" onclick="changeReviewStatus(${r.id})" data-toggle="tooltip" class="btn <c:out value="${r.active ? 'btn-success' : 'btn-danger'}"/>"
                                                            title="<c:out value="${r.active ? 'Скрыть комментарий' : 'Активировать комментарий'}"/>">
                                                        <span class="fa <c:out value="${r.active ? 'fa-thumbs-o-down' : 'fa-thumbs-o-up'}"/>"></span>
                                                    </button>
                                                    <button type="button" onclick="deleteReview(${r.id})" data-toggle="tooltip" class="btn btn-danger" title="Удалить комментарий">
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