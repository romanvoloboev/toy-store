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

            var filter_date_start = $('input[name=\'filter_date_start\']').val();

            if (filter_date_start) {
                url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
            }

            var filter_date_end = $('input[name=\'filter_date_end\']').val();

            if (filter_date_end) {
                url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
            }

            location = url;
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
                <h1>Статистика купленных товаров</h1>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart"></i> Купленные товары</h3>
                </div>
                <div class="panel-body">
                    <div class="well">
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label class="control-label" for="input-date-start">Начальная дата</label>
                                <div class="input-group date">
                                    <input type="text" name="filter_date_start" placeholder="Укажите начало периода" data-format="YYYY-MM-DD" id="input-date-start" class="form-control">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                        </span>
                                </div>
                            </div>
                            <div class="form-group col-md-4">
                                <label class="control-label" for="input-date-end">Конечная дата</label>
                                <div class="input-group date">
                                    <input type="text" name="filter_date_end" placeholder="Укажите конец периода" data-format="YYYY-MM-DD" id="input-date-end" class="form-control">
                                        <span class="input-group-btn">
                                            <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                        </span>
                                </div>
                            </div>
                            <div class="col-md-4 form-group" style="padding-top: 22px;">
                                <button type="button" id="button-filter" class="btn btn-primary pull-left"><i class="fa fa-search"></i> Поиск</button>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <td class="text-left">Название товара</td>
                                <td class="text-right">Количество</td>
                                <td class="text-right">Итого</td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="text-left">HP LP3065</td>
                                <td class="text-right">112979</td>
                                <td class="text-right">$11,177,736,784.00</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>