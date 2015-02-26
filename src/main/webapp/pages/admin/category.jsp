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
                    <a href="<c:url value="/cp/category/add"/>" data-toggle="tooltip" class="btn btn-primary" data-original-title="Добавить категорию"><i class="fa fa-plus"></i></a>
                    <button type="button" data-toggle="tooltip" class="btn btn-danger" onclick="$('#form-category').submit();" data-original-title="Удалить">
                        <i class="fa fa-trash-o"></i>
                    </button>
                </div>
                <h1>Категории</h1>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-list"></i> Список категорий</h3>
                </div>
                <div class="panel-body">
                    <form action="/delete" method="post" enctype="multipart/form-data" id="form-category">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);"></td>
                                    <td class="text-left"><a href="<c:url value=""/>" class="asc">Название категории</a></td>
                                    <td class="text-right">Действие</td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="text-center"><input type="checkbox" name="selected[]" value="33"></td>
                                    <td class="text-left">Категория</td>
                                    <td class="text-right"><a href="<c:url value="/cp/category/edit"/>" data-toggle="tooltip" class="btn btn-primary" data-original-title="Редактировать"><i class="fa fa-pencil"></i></a></td>
                                </tr>
                                <tr>
                                    <td class="text-center"><input type="checkbox" name="selected[]" value="29"></td>
                                    <td class="text-left">Категория&nbsp;&nbsp;&gt;&nbsp;&nbsp;Подкатегория</td>
                                    <td class="text-right"><a href="<c:url value=""/>" data-toggle="tooltip" class="btn btn-primary" data-original-title="Редактировать"><i class="fa fa-pencil"></i></a></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>