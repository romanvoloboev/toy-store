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
                    <h4 style="padding-bottom: 7px; padding-top: 8px; margin-bottom: 0;"><i class="fa fa-plus"></i>&nbsp;Добавление производителя</h4>
                </div>
                <div class="col-sm-12 col-md-8 col-lg-6 to-left-sm" style="padding-left: 0; padding-right: 0; text-align: right;">
                    <a href="<c:url value="/cp/brand"/>" data-toggle="tooltip" class="btn btn-default" data-original-title="Назад"><i class="fa fa-reply"></i>&nbsp;Отмена</a>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <input type="text" placeholder="Название производителя" id="brand-name" class="form-control" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <input type="text" placeholder="Страна производителя" id="brand-country" class="form-control" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <button type="button" id="save-brand" class="btn btn-success pull-right"><i class="fa fa-check"></i> Сохранить</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>