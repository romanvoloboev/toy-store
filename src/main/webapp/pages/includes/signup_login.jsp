<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<section id="topbar">
    <div class="container">
        <div class="topbar">
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-7 col-xs-12">
                    <div class="pull-left">
                        <div id="search">
                            <div class="button-search pull-right"><span style="margin-right: 5px" class="fa fa-search"></span></div>
                            <input type="text" autocomplete="off" name="search" placeholder="Что ищем?">
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-6 col-sm-5 hidden-xs">
                    <security:authorize access="isAuthenticated()">
                        <ul class="links pull-right">
                            <li>
                                <a href="/profile"><span class="fa fa-user"></span>Личный кабинет</a>
                            </li>
                            <li>
                                <a href="/logout"><span class="fa fa-sign-out"></span>Выход</a>
                            </li>
                        </ul>
                    </security:authorize>
                    <security:authorize access="isAnonymous()">
                        <ul class="links pull-right">
                            <li>
                                <a href="/login"><span class="fa fa-sign-in"></span>Вход в интернет-магазин</a>
                            </li>
                        </ul>
                    </security:authorize>
                </div>
            </div>
        </div>
    </div>
</section>
