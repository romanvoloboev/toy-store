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

            var filter_group = $('select[name=\'filter_group\']').val();

            if (filter_group) {
                url += '&filter_group=' + encodeURIComponent(filter_group);
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
                <h1>Статистика продаж</h1>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart"></i> Продажи</h3>
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
                            <div class="form-group col-md-2">
                                <label class="control-label" for="input-group">Группировать по</label>
                                <select name="filter_group" id="input-group" class="form-control">
                                    <option value="day" selected="selected">дням</option>
                                    <option value="week">неделям</option>
                                    <option value="month">месяцам</option>
                                </select>
                            </div>
                            <div class="form-group col-md-2" style="padding-top: 22px;">
                                <button type="button" id="button-filter" class="btn btn-primary pull-left"><i class="fa fa-search"></i> Поиск</button>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <td class="text-left">Дата начала</td>
                                <td class="text-left">Дата конца</td>
                                <td class="text-right">Кол-во заказов</td>
                                <td class="text-right">Итого</td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="text-left">08/03/2015</td>
                                <td class="text-left">11/03/2015</td>
                                <td class="text-right">1</td>
                                <td class="text-right">$1,280.00</td>
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