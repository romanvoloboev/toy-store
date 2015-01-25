<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<section id="topbar">
    <div class="container">
        <div class="topbar">
            <div class="row">
                <div class="col-lg-9 col-md-6 col-sm-5 hidden-xs">
                    <%--<security:authorize access="isAuthenticated()">--%>
                        <security:authorize ifNotGranted="IS_AUTHENTICATED_ANONYMOUSLY">
                        <ul class="links  pull-left">
                            <li class="hidden-sm hidden-xs">
                                <a href="http://demopavothemes.com/pav_floral/index.php?route=account/wishlist" id="wishlist-total">
                                    <span class="fa fa-heart"></span>Желаемые покупки
                                </a>
                            </li>
                            <li>
                                <a href="http://demopavothemes.com/pav_floral/index.php?route=account/account">
                                    <span class="fa fa-user"></span>Мой аккаунт
                                </a>
                            </li>
                        </ul>
                    </security:authorize>
                    <%--<security:authorize access="isAnonymous()">--%>
                    <security:authorize ifAnyGranted="IS_AUTHENTICATED_ANONYMOUSLY">
                        <div class="login pull-right hidden-sm hidden-md">
                            <a href="http://demopavothemes.com/pav_floral/index.php?route=account/login"><b>Войдите</b></a>,
                            как зарегестрированный пользователь, или <a
                                href="http://demopavothemes.com/pav_floral/index.php?route=account/register"><b>создайте</b></a>
                            новый аккаунт.
                        </div>
                    </security:authorize>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-7 col-xs-12">
                    <div class="pull-right">
                        <div id="search">
                            <div class="button-search pull-right"><span style="margin-right: 5px" class="fa fa-search"></span></div>
                            <input type="text" name="search" placeholder="Что найти?">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
