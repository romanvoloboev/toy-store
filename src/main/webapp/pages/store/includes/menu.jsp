<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="../../webres/store/js/menu.js"></script>

<div class="pull-left wrap-logo">
    <div id="logo">
        <a href="<c:url value="/"/>">
            <img src="../../webres/store/image/logo.png" title="Toy Store" alt="Toy Store">
        </a>
    </div>
</div>

<div class="pull-left wrap-menu">
    <div id="pav-mainnav">
        <div class="navbar-inverse">
            <div class="pav-megamenu">
                <div class="navbar navbar-default">
                    <div id="mainmenutop" class="megamenu" role="navigation">
                        <div class="navbar-header">
                            <a href="javascript:;" data-target=".navbar-collapse"
                                   data-toggle="collapse" class="navbar-toggle">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </a>
                            <div class="collapse navbar-collapse navbar-ex1-collapse">
                                <ul class="nav navbar-nav megamenu"></ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="mini-access visible-xs pull-right" id="mini-menu-items">
    <ul>
        <security:authorize access="isAnonymous()">
            <li><a href="/login" title="Вход" class="mini_account"><span class="fa fa-user"></span></a></li>
        </security:authorize>
        <security:authorize access="isAuthenticated()">
            <li><a href="" title="Личный кабинет" class="mini_account"><span class="fa fa-user"></span></a></li>
            <li><a href="" title="Корзина" class="mini_cart"><span class="fa fa-shopping-cart"></span></a></li>
        </security:authorize>
        <li class="search">
            <a href="javascript:void(0)" class="" title="Поиск">
                <i class="icon fa fa-search"></i>
            </a>
        </li>

    </ul>
</div>