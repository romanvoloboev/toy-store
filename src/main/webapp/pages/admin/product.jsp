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
            var url = '';

            var filter_name = $('input[name=\'filter_name\']').val();

            if (filter_name) {
                url += '&filter_name=' + encodeURIComponent(filter_name);
            }

            var filter_model = $('input[name=\'filter_model\']').val();

            if (filter_model) {
                url += '&filter_model=' + encodeURIComponent(filter_model);
            }

            var filter_price = $('input[name=\'filter_price\']').val();

            if (filter_price) {
                url += '&filter_price=' + encodeURIComponent(filter_price);
            }

            var filter_quantity = $('input[name=\'filter_quantity\']').val();

            if (filter_quantity) {
                url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
            }

            var filter_status = $('select[name=\'filter_status\']').val();

            if (filter_status != '*') {
                url += '&filter_status=' + encodeURIComponent(filter_status);
            }

            location = url;
        });

        $('input[name=\'filter_name\']').autocomplete({
            'source': function(request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/product/autocomplete&token=54e3f31ac5b1509337ab799354938a54&filter_name=' +  encodeURIComponent(request),
                    dataType: 'json',
                    success: function(json) {
                        response($.map(json, function(item) {
                            return {
                                label: item['name'],
                                value: item['product_id']
                            }
                        }));
                    }
                });
            },
            'select': function(item) {
                $('input[name=\'filter_name\']').val(item['label']);
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
                    <a href="<c:url value="/cp/product/add"/>" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Добавить"><i class="fa fa-plus"></i></a>
                    <button type="button" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="Удалить"><i class="fa fa-trash-o"></i></button>
                </div>
                <h1>Продукты</h1>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-list"></i> Список продуктов</h3>
                </div>
                <div class="panel-body">
                    <div class="well">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="control-label" for="input-name">Название продукта</label>
                                    <input type="text" name="filter_name" value="" placeholder="Введите название продукта" id="input-name" class="form-control" autocomplete="off">
                                    <ul class="dropdown-menu"></ul>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="input-status">Статус</label>
                                    <select name="filter_status" id="input-status" class="form-control">
                                        <option value="*" selected>--- Выберите из списка ---</option>
                                        <option value="1">Доступен</option>
                                        <option value="0">Недоступен</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="control-label" for="input-price">Цена</label>
                                    <input type="text" name="filter_price" value="" placeholder="Введите цену" id="input-price" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="input-quantity">Количество</label>
                                    <input type="text" name="filter_quantity" value="" placeholder="Введите количество" id="input-quantity" class="form-control">
                                </div>
                                <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> Поиск</button>
                            </div>
                        </div>
                    </div>
                    <form action="" method="post" enctype="multipart/form-data" id="form-product">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <td style="width: 1px;" class="text-center">
                                        <input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);">
                                    </td>
                                    <td class="text-center">Изображение</td>
                                    <td class="text-left">
                                        <a href="<c:url value=""/>" class="asc">Название продукта</a>
                                    </td>
                                    <td class="text-left">
                                        <a href="<c:url value=""/>">Цена</a>
                                    </td>
                                    <td class="text-right">
                                        <a href="<c:url value=""/>">Количество</a>
                                    </td>
                                    <td class="text-left">
                                        <a href="<c:url value=""/>">Состояние</a>
                                    </td>
                                    <td class="text-right">Действие</td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="text-center">
                                        <input type="checkbox" name="selected[]" value="42">
                                    </td>
                                    <td class="text-center">
                                        <img src="http://demo.opencart.com/image/cache/catalog/demo/apple_cinema_30-40x40.jpg" alt="Apple Cinema 30&quot;" class="img-thumbnail">
                                    </td>
                                    <td class="text-left">Apple Cinema 30"</td>
                                    <td class="text-left">
                                        <span style="text-decoration: line-through;">100.0000</span><br>
                                        <div class="text-danger">90.0000</div>
                                    </td>
                                    <td class="text-right">
                                        <span class="label label-success">990</span>
                                    </td>
                                    <td class="text-left">Enabled</td>
                                    <td class="text-right">
                                        <a href="<c:url value=""/>" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Редактировать"><i class="fa fa-pencil"></i></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-center">
                                        <input type="checkbox" name="selected[]" value="1">
                                    </td>
                                    <td class="text-center">
                                        <img src="http://demo.opencart.com/image/cache/catalog/demo/apple_cinema_30-40x40.jpg" alt="Apple Cinema 30&quot;" class="img-thumbnail">
                                    </td>
                                    <td class="text-left">Apple Cinema 30"</td>
                                    <td class="text-left">
                                        <span style="text-decoration: line-through;">100.0000</span><br>
                                        <div class="text-danger">90.0000</div>
                                    </td>
                                    <td class="text-right">
                                        <span class="label label-warning">0</span>
                                    </td>
                                    <td class="text-left">Enabled</td>
                                    <td class="text-right">
                                        <a href="<c:url value=""/>" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Редактировать"><i class="fa fa-pencil"></i></a>
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