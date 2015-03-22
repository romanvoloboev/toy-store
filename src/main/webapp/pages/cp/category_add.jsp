<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
    <script src="../../webres/cp/js/category.js"></script>

    <style type="text/css">
        .dropzone {
            border: dashed 2px rgba(72, 72, 67, 0.50);
            border-radius: 5px;
            padding: 0;
        }
    </style>

    <script type="text/javascript">
        $('input[name=\'path\']').autocomplete({
            'source': function(request, response) {
                $.ajax({
                    url: '' +  encodeURIComponent(request),
                    dataType: 'json',
                    success: function(json) {
                        json.unshift({
                            category_id: 0,
                            name: ' --- None --- '
                        });

                        response($.map(json, function(item) {
                            return {
                                label: item['name'],
                                value: item['category_id']
                            }
                        }));
                    }
                });
            },
            'select': function(item) {
                $('input[name=\'path\']').val(item['label']);
                $('input[name=\'parent_id\']').val(item['value']);
            }
        });
    </script>
</head>
<body>
<div id="container">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/nav-menu.jsp"%>

    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <a href="<c:url value="/cp/category"/>" data-toggle="tooltip" title="" class="btn btn-default" data-original-title="Отмена"><i class="fa fa-reply"></i></a></div>
                <h1>Категории</h1>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> Создание категорий и подкатегорий</h3>
                </div>
                <div class="panel-body">
                    <div class="form-horizontal">

                        <ul class="nav nav-tabs">
                            <li class="isActive"><a href="#tab-category" data-toggle="tab">Добавление категории</a></li>
                            <li><a href="#tab-subcategory" data-toggle="tab">Добавление подкатегории</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane isActive" id="tab-category">
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <input type="text" placeholder="Название категории" id="category-name" class="form-control" required="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <button type="button" id="save-category" class="btn btn-success pull-right"><i class="fa fa-check"></i> Сохранить</button>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab-subcategory">
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <input type="text" placeholder="Название подкатегории" id="subcategory-name" class="form-control" required="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <input type="text" placeholder="Родительская категория" id="parent-category" class="form-control" required="true">
                                        <ul class="dropdown-menu"></ul>
                                        <input type="hidden" name="parent_id">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-4">
                                        <div class="text-center" style="padding-bottom: 10px;">
                                            <span style="color: #e2af00;">Вы можете загрузить 1 изображение не больше 3Мб.</span>
                                        </div>
                                        <div class="text-center">
                                            <button type="button" id="select-image" class="btn btn-warning"><i class="fa fa-folder-open"></i> Выбрать</button>
                                        </div>
                                        <div class="image-previews" style="display: none; padding-top: 10px;">
                                            <div id="previews" class="dropzone"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-4">
                                        <button type="button" id="save-subcategory" class="btn btn-success pull-right"><i class="fa fa-check"></i> Сохранить</button>
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