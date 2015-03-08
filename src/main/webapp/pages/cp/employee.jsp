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
                    <a href="<c:url value="/cp/new_employee"/>" data-toggle="tooltip" class="btn btn-primary" data-original-title="Добавить"><i class="fa fa-plus"></i></a>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-list"></i> Учетные записи администраторов</h3>
                </div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <td class="text-left">
                                        <a href="" class="asc">Имя</a>
                                    </td>
                                    <td class="text-left">
                                        <a href="">E-Mail</a>
                                    </td>
                                    <td class="text-left">
                                        <a href="">Тип</a>
                                    </td>
                                    <td class="text-left">
                                        <a href="">Статус</a>
                                    </td>
                                    <td class="text-right">Действие</td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="text-left">name</td>
                                    <td class="text-left">a@aol.com</td>
                                    <td class="text-left">Администратор</td>
                                    <td class="text-left">Enabled</td>
                                    <td class="text-right">
                                        <a href="<c:url value="/cp/edit_employee"/>" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Редактировать"><i class="fa fa-pencil"></i></a>
                                        <a href="<c:url value="/cp/remove_admin"/>" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="Удалить"><i class="fa fa-trash"></i></a>
                                    </td>
                                </tr>
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