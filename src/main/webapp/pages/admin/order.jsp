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
            url = '';

            var filter_order_id = $('input[name=\'filter_order_id\']').val();

            if (filter_order_id) {
                url += '&filter_order_id=' + encodeURIComponent(filter_order_id);
            }

            var filter_customer = $('input[name=\'filter_customer\']').val();

            if (filter_customer) {
                url += '&filter_customer=' + encodeURIComponent(filter_customer);
            }

            var filter_order_status = $('select[name=\'filter_order_status\']').val();

            if (filter_order_status != '*') {
                url += '&filter_order_status=' + encodeURIComponent(filter_order_status);
            }

            var filter_total = $('input[name=\'filter_total\']').val();

            if (filter_total) {
                url += '&filter_total=' + encodeURIComponent(filter_total);
            }

            var filter_date_added = $('input[name=\'filter_date_added\']').val();

            if (filter_date_added) {
                url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
            }

            var filter_date_modified = $('input[name=\'filter_date_modified\']').val();

            if (filter_date_modified) {
                url += '&filter_date_modified=' + encodeURIComponent(filter_date_modified);
            }

            location = url;
        });

        $('input[name=\'filter_customer\']').autocomplete({
            'source': function(request, response) {
                $.ajax({
                    url: '' +  encodeURIComponent(request),
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
                $('input[name=\'filter_customer\']').val(item['label']);
            }
        });

        $('input[name^=\'selected\']:first').trigger('change');

        $('a[id^=\'button-delete\']').on('click', function(e) {
            e.preventDefault();

            if (confirm('Delete/Uninstall cannot be undone! Are you sure you want to do this?')) {
                location = $(this).attr('href');
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
                    <a href="<c:url value="/cp/order/add"/>" data-toggle="tooltip" class="btn btn-primary" data-original-title="Добавить"><i class="fa fa-plus"></i></a></div>
                <h1>Заказы</h1>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-list"></i> Список заказов</h3>
                </div>
                <div class="panel-body">
                    <div class="well">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="control-label" for="input-order-id">Номер заказа</label>
                                    <input type="text" name="filter_order_id" placeholder="Введите номер заказа" id="input-order-id" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="input-order-status">Состояние заказа</label>
                                    <select name="filter_order_status" id="input-order-status" class="form-control">
                                        <option value="*" selected>--- Выберите из исписка ---</option>
                                        <option value="0">Открыт</option>
                                        <option value="1">Выполнен</option>
                                        <option value="2">Отклонен</option>
                                        <option value="3">Доставляется</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="control-label" for="input-date-added">Дата заказа</label>
                                    <div class="input-group date">
                                        <input type="text" name="filter_date_added" placeholder="Выберите дату заказа" data-format="YYYY-MM-DD" id="input-date-added" class="form-control">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="input-customer">Покупатель</label>
                                    <input type="text" name="filter_customer" placeholder="Введите имя покупателя" id="input-customer" class="form-control" autocomplete="off">
                                    <ul class="dropdown-menu"></ul>
                                </div>
                                <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> Поиск</button>
                            </div>
                        </div>
                    </div>
                    <form method="post" enctype="multipart/form-data" target="_blank" id="form-order">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <td class="text-right"><a href="<c:url value=""/>" class="desc">Номер заказа</a></td>
                                    <td class="text-left"><a href="<c:url value=""/>">Покупатель</a></td>
                                    <td class="text-left"><a href="<c:url value=""/>">Состояние заказа</a></td>
                                    <td class="text-left"><a href="<c:url value=""/>">Сумма заказа</a></td>
                                    <td class="text-left"><a href="<c:url value=""/>">Дата заказа</a></td>
                                    <td class="text-right">Действие</td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="text-right">1202</td>
                                    <td class="text-left">lily rose</td>
                                    <td class="text-left">Pending</td>
                                    <td class="text-right">$105.00</td>
                                    <td class="text-left">23/02/2015</td>
                                    <td class="text-right">
                                        <a href="<c:url value=""/>" data-toggle="tooltip" class="btn btn-info" data-original-title="Подробнее"><i class="fa fa-eye"></i></a>
                                        <a href="<c:url value=""/>" data-toggle="tooltip" class="btn btn-primary" data-original-title="Редактировать"><i class="fa fa-pencil"></i></a>
                                        <a href="<c:url value=""/>" id="button-delete" data-toggle="tooltip" class="btn btn-danger" data-original-title="Удалить"><i class="fa fa-trash-o"></i></a>
                                    </td>
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