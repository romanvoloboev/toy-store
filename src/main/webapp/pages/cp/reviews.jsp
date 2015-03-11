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

            var filter_product = $('input[name=\'filter_product\']').val();

            if (filter_product) {
                url += '&filter_product=' + encodeURIComponent(filter_product);
            }

            var filter_author = $('input[name=\'filter_author\']').val();

            if (filter_author) {
                url += '&filter_author=' + encodeURIComponent(filter_author);
            }

            var filter_status = $('select[name=\'filter_status\']').val();

            if (filter_status != '*') {
                url += '&filter_status=' + encodeURIComponent(filter_status);
            }

            var filter_date_added = $('input[name=\'filter_date_added\']').val();

            if (filter_date_added) {
                url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
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
                <h1>Отзывы</h1>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-list"></i> Список отзывов</h3>
                </div>
                <div class="panel-body">
                    <div class="well">
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label class="control-label" for="input-product">Товар</label>
                                <input type="text" name="filter_product" placeholder="Введите название товара" id="input-product" class="form-control">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="input-author">Автор</label>
                                <input type="text" name="filter_author" placeholder="Введите имя автора" id="input-author" class="form-control">
                            </div>
                            <div class="form-group col-md-3">
                                <label class="control-label" for="input-date-added">Дата добавления</label>
                                <div class="input-group date">
                                    <input type="text" name="filter_date_added" placeholder="Укажите дату" data-format="YYYY-MM-DD" id="input-date-added" class="form-control">
                                    <span class="input-group-btn">
                                        <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group col-md-3" style="padding-top: 22px;">
                                <button type="button" id="button-filter" class="btn btn-primary pull-left"><i class="fa fa-search"></i> Поиск</button>
                            </div>
                        </div>
                    </div>
                    <div class="form-horizontal">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <td class="text-left">
                                        <a href="">Товар</a>
                                    </td>
                                    <td class="text-left">
                                        <a href="">Автор</a>
                                    </td>
                                    <td class="text-right">
                                        <a href="">Рейтинг</a>
                                    </td>
                                    <td class="text-left">
                                        <a href="">Статус</a>
                                    </td>
                                    <td class="text-left">
                                        <a href="" class="asc">Дата добавления</a>
                                    </td>
                                    <td class="text-center">Действие</td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="text-left">iPhone</td>
                                    <td class="text-left">kecske</td>
                                    <td class="text-right">2</td>
                                    <td class="text-left">Принят / Не подтвержден</td>
                                    <td class="text-left">06/10/2014</td>
                                    <td class="text-center">
                                        <a href="" data-toggle="tooltip" title="" class="btn btn-success" data-original-title="Принять"><i class="fa fa-thumbs-up"></i></a>
                                        <a href="" data-toggle="tooltip" title="" class="btn btn-danger" data-original-title="Удалить"><i class="fa fa-trash"></i></a>
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