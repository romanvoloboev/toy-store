<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>

    <script type="text/javascript">
        $(function() {
            $('#search-btn').on('click', function() {
                var url = '/cp/product/search_by?';

                var name = $("#input-name").val();
                if (name) {
                    url += 'name=' + encodeURIComponent(name);
                }

                var priceStart = $("#input-price-start").val();
                if (priceStart) {
                    url += '&price_start=' + encodeURIComponent(priceStart);
                }

                var priceEnd = $("#input-price-end").val();
                if (priceEnd) {
                    url += '&price_end=' + encodeURIComponent(priceEnd);
                }


                var status = $("#select-status").val();
                if (status != '1') {
                    url += '&status=' + encodeURIComponent(status);
                }

                location = url;
            });
        });

        function changeProductStatus(id) {
            $.post("/cp/product/change_status", {id:id}, function(response) {
                if(response.status == 'ok') {
                    $.notify("<b>Вы успешно изменили статус товара</b>",
                            {
                                type: "success",
                                delay: 1000,
                                onClose: function(){
                                    location.reload();
                                }
                            });
                } else {
                    $.notify("<b>Не удалось изменить статус, повторите попытку позже</b>",
                            {
                                type: "danger",
                                delay: 1500
                            });
                }
            });
        }

        function deleteProduct(id) {
            $.post('/cp/product/delete', {id:id}, function(response) {
                if(response.status == 'ok') {
                    $.notify("<b>Вы успешно удалили товар</b>",
                            {
                                type: "success",
                                delay: 1000,
                                onClose: function(){
                                    location.reload();
                                }
                            });
                } else {
                    $.notify("<b>Невозможно удалить товар, повторите попытку позже</b>",
                            {
                                type: "danger",
                                delay: 1000
                            });
                }
            });
        }
    </script>

</head>
<body>
<div id="container">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/nav-menu.jsp"%>

    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="col-sm-12 col-md-4 col-lg-6" style="padding-left: 0;">
                    <h4 style="padding-bottom: 7px; padding-top: 8px; margin-bottom: 0;"><i class="fa fa-list"></i>&nbsp;Управление</h4>
                </div>
                <div class="col-sm-12 col-md-8 col-lg-6 to-left-sm" style="padding-left: 0; padding-right: 0; text-align: right;">
                    <a href="<c:url value="/cp/product/add"/>" class="btn btn-success"><i class="fa fa-plus"></i>&nbsp;Добавить товар</a>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="well">
                        <div class="row">
                            <div class="col-md-3 form-group" id="input-name-block" style="padding-right: 0; margin-bottom: 0;">
                                <input type="text" placeholder="Название продукта" id="input-name" class="form-control" autocomplete="off">
                            </div>
                            <div class="col-sm-12 col-md-3 form-group" id="input-price-block"  style="padding-right: 0; margin-bottom: 0;">
                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding-right: 0; padding-left: 0;">
                                    <input type="text" placeholder="Цена от" id="input-price-start" class="form-control">
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding-right: 0;" id="input-price-end-block">
                                    <input type="text" placeholder="Цена до" id="input-price-end" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-2 form-group" id="input-status-block" style="padding-right: 0; margin-bottom: 0;">
                                <select id="select-status" class="form-control">
                                    <option value="1" selected>Активный</option>
                                    <option value="0">Неактивный</option>
                                </select>
                            </div>
                            <div class="col-md-1 form-group" style="padding-right: 0; margin-bottom: 0;">
                                <button type="button" id="search-btn" class="btn btn-default"><i class="fa fa-search"></i> Поиск</button>
                            </div>
                        </div>
                    </div>

                    <div class="form-horizontal col-sm-12 col-md-12 col-lg-12" style="padding: 0;">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="text-center col-md-1">Изображение</th>
                                    <th class="text-left col-md-6">Название продукта</th>
                                    <th class="text-center col-md-2">Цена</th>
                                    <th class="text-center col-md-1">Количество</th>
                                    <th class="text-center col-md-2">Действие</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${products}" var="p">
                                    <tr>
                                        <td class="text-center">
                                            <img src="<c:url value="/image/load?id=${p.images[0]}"/>" class="img-thumbnail">
                                        </td>
                                        <td class="text-left">${p.name}</td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${p.promotion}">
                                                    <span style="text-decoration: line-through;">${p.price}</span><br>
                                                    <div class="text-danger">${p.promotionPrice}</div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div>${p.price}</div>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center">
                                            <c:choose>
                                                <c:when test="${p.quantity <= 5}">
                                                    <span class="label label-danger">${p.quantity}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="label label-success">${p.quantity}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="text-center">
                                            <button type="button" onclick="changeProductStatus(${p.id})" data-toggle="tooltip" class="btn <c:out value="${p.active ? 'btn-default' : 'btn-warning'}"/>"
                                                    title="<c:out value="${p.active ? 'Скрыть товар' : 'Активировать товар'}"/>">
                                                <span class="fa <c:out value="${p.active ? 'fa-eye' : 'fa-eye-slash'}"/>"></span>
                                            </button>
                                            <a href="<c:url value="/cp/product/edit?id=${p.id}"/>" data-toggle="tooltip" title="" class="btn btn-default" data-original-title="Редактировать"><i class="fa fa-pencil"></i></a>
                                            <button type="button" onclick="deleteProduct(${p.id})" data-toggle="tooltip" class="btn btn-danger" title="Удалить товар">
                                                <span class="fa fa-trash"></span>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
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