<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
    <script src="../../webres/cp/js/brand.js"></script>
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
                    <a href="<c:url value="/cp/brand/add"/>" data-toggle="tooltip" class="btn btn-success" data-original-title="Добавить производителя"><i class="fa fa-plus"></i>&nbsp;Добавить производителя</a>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-horizontal col-sm-12 col-md-9 col-lg-9" style="padding: 0;">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="text-left col-sm-4 col-md-4 col-lg-4">Название</th>
                                    <th class="text-left col-sm-4 col-md-4 col-lg-4">Страна</th>
                                    <th class="text-center col-sm-4 col-md-4 col-lg-4">Действие</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${brand}" var="b">
                                    <tr>
                                        <td class="text-left">${b.name}</td>
                                        <td class="text-left">${b.country}</td>
                                        <td class="text-center">
                                            <button type="button" onclick="changeBrandStatus(${b.id})" data-toggle="tooltip" class="btn <c:out value="${b.active ? 'btn-default' : 'btn-warning'}"/>"
                                                    title="<c:out value="${b.active ? 'Скрыть производителя' : 'Активировать производителя'}"/>">
                                                <span class="fa <c:out value="${b.active ? 'fa-eye' : 'fa-eye-slash'}"/>"></span>
                                            </button>
                                            <a href="<c:url value="/cp/brand/edit?id=${b.id}"/>" data-toggle="tooltip" class="btn btn-default" title="Редактировать производителя"><i class="fa fa-pencil"></i></a>
                                            <button type="button" onclick="deleteBrand(${b.id})" data-toggle="tooltip" class="btn btn-danger" title="Удалить производителя">
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
</body>
</html>