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
                <h1>Администраторы</h1>
                <div class="pull-right">
                    <a href="<c:url value="/cp/new_employee"/>" data-toggle="tooltip" class="btn btn-primary" data-original-title="Сохранить"><i class="fa fa-save"></i></a>
                    <a href="<c:url value="/cp/employee"/>" data-toggle="tooltip" title="" class="btn btn-default" data-original-title="Отмена"><i class="fa fa-reply"></i></a>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-list"></i>Создание учетной записи администратора</h3>
                </div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="row">
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="name">Имя</label>
                                <div class="col-sm-10">
                                    <input type="text" placeholder="Введите имя" id="name" class="form-control" required="true">
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="login">E-mail</label>
                                <div class="col-sm-10">
                                    <input type="login" placeholder="Введите e-mail"  id="login" class="form-control" required="true">
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="login">Пароль</label>
                                <div class="col-sm-10">
                                    <input type="password" placeholder="Введите пароль" id="password" class="form-control" required="true">
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="login">Повторите пароль</label>
                                <div class="col-sm-10">
                                    <input type="password" placeholder="Введите пароль еще раз" id="password-repeat" class="form-control" required="true">
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="account-status">Статус</label>
                                <div class="col-sm-10">
                                    <select id="account-status" class="form-control">
                                        <option value="1" selected>Активен</option>
                                        <option value="0">Неактивен</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="account-type">Тип</label>
                                <div class="col-sm-10">
                                    <select id="account-type" class="form-control">
                                        <option value="0" selected>Менеджер</option>
                                        <option value="1">Гл. Администратор</option>
                                    </select>
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