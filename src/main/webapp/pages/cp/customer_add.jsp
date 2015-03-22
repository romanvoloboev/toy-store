<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
    <script type="text/javascript" src="../../webres/cp/js/customer_edit.js"></script>
</head>
<body>
<div id="container">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/nav-menu.jsp"%>

    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" id="save" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Сохранить"><i class="fa fa-save"></i></button>
                    <a href="<c:url value="/cp/customer"/>" data-toggle="tooltip" title="" class="btn btn-default" data-original-title="Назад"><i class="fa fa-reply"></i></a>
                </div>
                <h1>Пользователи</h1>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> Добавление пользователя</h3>
                </div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="row">
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-firstname">Имя</label>
                                <div class="col-sm-10">
                                    <input type="text" name="firstname" placeholder="Введите имя пользователя" id="input-firstname" class="form-control">
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-login">E-Mail</label>
                                <div class="col-sm-10">
                                    <input type="text" name="login" placeholder="Введите login" id="input-login" class="form-control">
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-telephone">Телефон</label>
                                <div class="col-sm-10">
                                    <input type="text" name="telephone" placeholder="Введите телефон" id="input-telephone" class="form-control">
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-password">Пароль</label>
                                <div class="col-sm-10">
                                    <input type="password" name="password" value="" placeholder="Введите пароль" id="input-password" class="form-control" autocomplete="off">
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-confirm">Подтверждение пароля</label>
                                <div class="col-sm-10">
                                    <input type="password" name="confirm" value="" placeholder="Введите пароль еще раз" autocomplete="off" id="input-confirm" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-status">Статус аккаунта</label>
                                <div class="col-sm-10">
                                    <select name="status" id="input-status" class="form-control">
                                        <option value="1" selected="selected">Активен</option>
                                        <option value="0">Отключен</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2 control-label" for="input-customer-city">Адрес доставки</label>
                                <div class="col-md-6" id="new-address-form">
                                    <div class="col-md-8" style="padding: 0;">
                                        <div class="col-md-12 col-sm-12" style="padding: 0 0 10px 0">
                                            <input type="text" placeholder="Введите город" id="input-customer-city" class="form-control" autocomplete="off">
                                            <ul class="dropdown-menu"></ul>
                                            <input type="hidden" name="city_id" value="0">
                                        </div>

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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>