<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>

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
                    <button type="submit" form="form-category" data-toggle="tooltip" class="btn btn-primary" data-original-title="Сохранить"><i class="fa fa-save"></i></button>
                    <a href="<c:url value="/cp/category"/>" data-toggle="tooltip" title="" class="btn btn-default" data-original-title="Отмена"><i class="fa fa-reply"></i></a></div>
                <h1>Категории</h1>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> Создание новой категории</h3>
                </div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-name">Название категории</label>
                            <div class="col-sm-10">
                                <input type="text" name="category_name" placeholder="Название категории" id="input-name" class="form-control" required="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-parent">Подкатегория</label>
                            <div class="col-sm-10">
                                <input type="text" name="path" placeholder="Подкатегория" id="input-parent" class="form-control" autocomplete="off">
                                <ul class="dropdown-menu"></ul>
                                <input type="hidden" name="parent_id">
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