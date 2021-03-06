<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
    <script src="../../webres/cp/js/customer_add.js"></script>
</head>
<body>
<div id="container">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/nav-menu.jsp"%>

    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="col-sm-12 col-md-4 col-lg-6" style="padding-left: 0;">
                    <h4 style="padding-bottom: 7px; padding-top: 8px; margin-bottom: 0;"><i class="fa fa-pencil"></i>&nbspРедактирование пользователя</h4>
                </div>
                <div class="col-sm-12 col-md-8 col-lg-6 to-left-sm" style="padding-left: 0; padding-right: 0; text-align: right;">
                    <a href="<c:url value="/cp/customer"/>" data-toggle="tooltip" class="btn btn-default" data-original-title="Назад"><i class="fa fa-reply"></i>&nbsp;Отмена</a>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="row col-md-6">
                            <div class="form-group">
                                <input type="hidden" id="customer-id" value="${customer.id}">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <input type="text" value="${customer.name}" id="name" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <input type="text" value="${customer.email}" id="email" class="form-control">
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <input type="text" value="${customer.phone}" id="phone" placeholder="+38(___)___-__-__" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <input type="password" value="${customer.password}" placeholder="Введите пароль" id="password" class="form-control" autocomplete="off">
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <input type="password" value="${customer.password}" placeholder="Введите пароль еще раз" autocomplete="off" id="password-confirm" class="form-control">
                                </div>
                            </div>
                            <div style="display: none; padding: 8px;" id="passMismatchMsg" class="alert alert-danger" role="alert"></div>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <button type="button" id="save" class="btn btn-success pull-right"><i class="fa fa-check"></i> Сохранить</button>
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