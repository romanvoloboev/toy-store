<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header id="header" class="navbar navbar-static-top">
    <div class="navbar-header">
        <a type="button" id="button-menu" class="pull-left"><i class="fa fa-dedent fa-lg"></i></a>
    </div>
    <ul class="nav pull-right">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" title="Уведомления">
                <span class="label label-danger pull-left">2</span> <i class="fa fa-bell fa-lg"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-right alerts-dropdown">
                <li class="dropdown-header">Заказы</li>
                <li>
                    <a href="" style="display: block; overflow: auto;">
                        <span class="label label-warning pull-right">0</span>Новые
                    </a>
                </li>
                <li>
                    <a href="">
                        <span class="label label-success pull-right">1</span>Выполненые
                    </a>
                </li>
            </ul>
        </li>
        <li><a href="/" title="Перейти в магазин"><span class="hidden-xs hidden-sm hidden-md">В магазин</span> <i class="fa fa-building fa-lg"></i></a></li>
        <li><a href="" title="Выйти"><span class="hidden-xs hidden-sm hidden-md">Выйти</span> <i class="fa fa-sign-out fa-lg"></i></a></li>
    </ul>
</header>