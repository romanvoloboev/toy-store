<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
    <script src="../../webres/cp/js/employee.js"></script>
</head>
<body>
<div id="container">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/nav-menu.jsp"%>

    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="col-sm-12 col-md-4 col-lg-6" style="padding-left: 0;">
                    <h4 style="padding-bottom: 7px; padding-top: 8px; margin-bottom: 0;"><i class="fa fa-list"></i>&nbsp;Управление сотрудниками</h4>
                </div>
                <div class="col-sm-12 col-md-8 col-lg-6 to-left-sm" style="padding-left: 0; padding-right: 0; text-align: right;">
                    <button type="button" id="addEmployee" data-toggle="tooltip" class="btn btn-success">
                        <span class="fa fa-plus">&nbsp;Добавить сотрудника</span>
                    </button>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-horizontal col-sm-12 col-md-12 col-lg-12" style="padding: 0;">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="text-left col-md-3">Имя</th>
                                    <th class="text-left col-md-3">E-mail</th>
                                    <th class="text-left col-md-2">Телефон</th>
                                    <th class="text-left col-md-2">Тип уч. записи</th>
                                    <th class="text-center col-md-2">Действие</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${employee}" var="e">
                                    <tr>
                                        <td class="text-left">${e.name}</td>
                                        <td class="text-left">${e.email}</td>
                                        <td class="text-left"><c:out value="${e.phone == '' ? 'Не указан' : e.phone}"/></td>
                                        <td class="text-left">${e.type}</td>
                                        <td class="text-center">
                                            <button type="button" onclick="editEmployee(${e.id})" data-toggle="tooltip" class="btn btn-default" title="Редактировать сотрудника">
                                                <span class="fa fa-pencil"></span>
                                            </button>
                                            <button type="button" onclick="changeEmployeeStatus(${e.id})" data-toggle="tooltip" class="btn <c:out value="${e.active ? 'btn-success' : 'btn-danger'}"/>"
                                                    title="<c:out value="${e.active ? 'Заблокировать сотрудника' : 'Активировать сотрудника'}"/>">
                                                <span class="fa fa-ban"></span>
                                            </button>
                                            <button type="button" onclick="deleteEmployee(${e.id})" data-toggle="tooltip" class="btn btn-danger" title="Удалить сотрудника">
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