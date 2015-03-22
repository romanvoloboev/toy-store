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
                <div class="pull-right">
                    <button type="submit" id="save" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Сохранить"><i class="fa fa-save"></i></button>
                    <a href="<c:url value="/cp/brand"/>" data-toggle="tooltip" title="" class="btn btn-default" data-original-title="Назад"><i class="fa fa-reply"></i></a>
                </div>
                <h1>Производители</h1>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> Редактирование производителя</h3>
                </div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-1 control-label" for="brand-name">Название</label>
                                <div class="col-sm-4">
                                    <input type="text" id="brand-name" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label" for="brand-country">Страна</label>
                                <div class="col-sm-4">
                                    <input type="text" id="brand-country" class="form-control">
                                    <ul class="dropdown-menu"></ul>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label" for="brand-status">Статус</label>
                                <div class="col-sm-4">
                                    <select name="status" id="brand-status" class="form-control">
                                        <option value="1">Активен</option>
                                        <option value="0">Отключен</option>
                                    </select>
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