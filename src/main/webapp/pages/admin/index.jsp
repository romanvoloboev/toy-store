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
                <h1>Панель управления</h1>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="tile">
                        <div class="tile-heading">Всего заказов</div>
                        <div class="tile-body"><i class="fa fa-shopping-cart"></i>
                            <h2 class="pull-right">1</h2>
                        </div>
                        <div class="tile-footer"><a href="">Подробнее...</a></div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="tile">
                        <div class="tile-heading">Сумма заказов</div>
                        <div class="tile-body"><i class="fa fa-credit-card"></i>
                            <h2 class="pull-right">3.7K</h2>
                        </div>
                        <div class="tile-footer"><a href="">Подробнее...</a></div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="tile">
                        <div class="tile-heading">Всего покупателей</div>
                        <div class="tile-body"><i class="fa fa-user"></i>
                            <h2 class="pull-right">1</h2>
                        </div>
                        <div class="tile-footer"><a href="">Подробнее...</a></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-sx-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-shopping-cart"></i> Последние заказы</h3>
                        </div>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <td class="text-right">ID</td>
                                    <td>Покупатель</td>
                                    <td>Статус</td>
                                    <td>Дата заказа</td>
                                    <td class="text-right">Итого</td>
                                    <td class="text-right">Действие</td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="text-right">1</td>
                                    <td>demo demo</td>
                                    <td>Complete</td>
                                    <td>03/12/2014</td>
                                    <td class="text-right">$3,699.59</td>
                                    <td class="text-right"><a href="" data-toggle="tooltip" title="" class="btn btn-info" data-original-title="Подробнее"><i class="fa fa-eye"></i></a></td>
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