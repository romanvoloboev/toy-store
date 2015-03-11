<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>

    <script type="text/javascript">
        $('#button-filter').on('click', function() {

            var filter_name = $('input[name=\'filter_name\']').val();

            if (filter_name) {
                url += '&filter_name=' + encodeURIComponent(filter_name);
            }

            var filter_email = $('input[name=\'filter_email\']').val();

            if (filter_email) {
                url += '&filter_email=' + encodeURIComponent(filter_email);
            }

            var filter_status = $('select[name=\'filter_status\']').val();

            if (filter_status != '*') {
                url += '&filter_status=' + encodeURIComponent(filter_status);
            }

        });

        $('input[name=\'filter_name\']').autocomplete({
            'source': function(request, response) {
                $.ajax({
                    url: 'index.php?route=sale/customer/autocomplete&token=240007936b7aa12ac9d5a264a03a7059&filter_name=' +  encodeURIComponent(request),
                    dataType: 'json',
                    success: function(json) {
                        response($.map(json, function(item) {
                            return {
                                label: item['name'],
                                value: item['customer_id']
                            }
                        }));
                    }
                });
            },
            'select': function(item) {
                $('input[name=\'filter_name\']').val(item['label']);
            }
        });

        $('input[name=\'filter_email\']').autocomplete({
            'source': function(request, response) {
                $.ajax({
                    url: 'index.php?route=sale/customer/autocomplete&token=240007936b7aa12ac9d5a264a03a7059&filter_email=' +  encodeURIComponent(request),
                    dataType: 'json',
                    success: function(json) {
                        response($.map(json, function(item) {
                            return {
                                label: item['email'],
                                value: item['customer_id']
                            }
                        }));
                    }
                });
            },
            'select': function(item) {
                $('input[name=\'filter_email\']').val(item['label']);
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
                    <a href="<c:url value="/cp/new_customer"/>" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Добавить"><i class="fa fa-plus"></i></a>
                </div>
                <h1>Пользователи</h1>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-list"></i> Список пользователей</h3>
                </div>
                <div class="panel-body">
                    <div class="well">
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="input-name">Имя</label>
                                <input type="text" name="filter_name" value="" placeholder="Введите имя пользователя" id="input-name" class="form-control" autocomplete="off"><ul class="dropdown-menu"></ul>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="input-email">E-Mail</label>
                                <input type="text" name="filter_email" value="" placeholder="Введите e-mail" id="input-email" class="form-control" autocomplete="off"><ul class="dropdown-menu"></ul>
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="input-status">Статус</label>
                                <select name="filter_status" id="input-status" class="form-control">
                                    <option value="*" selected>--- Выберите из списка ---</option>
                                    <option value="1">Активен</option>
                                    <option value="0">Отключен</option>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <button style="margin-top: 23px;" type="button" id="button-filter" class="btn btn-primary pull-left"><i class="fa fa-search"></i> Найти</button>
                            </div>
                        </div>
                    </div>
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
                                        <a href="">Статус</a>
                                    </td>
                                    <td class="text-right">Действие</td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="text-left">name</td>
                                    <td class="text-left">a@aol.com</td>
                                    <td class="text-left">Enabled</td>
                                    <td class="text-right">
                                        <a href="<c:url value="/cp/edit_customer"/>" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Редактировать"><i class="fa fa-pencil"></i></a>
                                        <a href="<c:url value="/cp/remove_customer"/>" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="Удалить"><i class="fa fa-trash"></i></a>
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