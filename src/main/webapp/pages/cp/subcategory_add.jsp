<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
    <script src="../../webres/cp/js/subcategory_edit.js"></script>
    <script src="../../webres/cp/js/i18n/ru.js"></script>
    <style type="text/css">
        .dropzone {
            border: dashed 2px rgba(72, 72, 67, 0.50);
            border-radius: 5px;
            padding: 0;
        }
        .col-centered{
            float: none;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div id="container">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/nav-menu.jsp"%>

    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="col-sm-12 col-md-4 col-lg-6" style="padding-left: 0;">
                    <h4 style="padding-bottom: 7px; padding-top: 8px; margin-bottom: 0;"><i class="fa fa-plus"></i>&nbsp;Добавление подкатегории</h4>
                </div>
                <div class="col-sm-12 col-md-8 col-lg-6 to-left-sm" style="padding-left: 0; padding-right: 0; text-align: right;">
                    <a href="<c:url value="/cp/category"/>" data-toggle="tooltip" class="btn btn-default" data-original-title="Назад"><i class="fa fa-reply"></i>&nbsp;Отмена</a>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <input type="text" placeholder="Название подкатегории" id="subcategory-name" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12 col-md-4 col-lg-4 col-xs-4">
                                <select class="form-control select2" id="parent-category">
                                    <option value="0" selected disabled>Выберите значение</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <div class="text-center" style="padding-bottom: 10px;">
                                    <span style="color: #e2af00;">Выберите изображение для подкатегории</span>
                                </div>
                                <div class="text-center">
                                    <button type="button" id="select-image" class="btn btn-warning"><i class="fa fa-folder-open"></i> Выбрать</button>
                                </div>
                                <div class="image-previews col-centered col-md-6 text-center" style="display: none; padding-top: 10px;">
                                    <div id="previews" class="dropzone"></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-center">
                            <div class="col-sm-12 col-md-4 col-lg-4">
                                <button type="button" id="save-subcategory" class="btn btn-success"><i class="fa fa-check"></i> Сохранить</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>