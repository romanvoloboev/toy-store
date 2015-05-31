<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header id="header" class="navbar navbar-static-top">
    <div class="navbar-header">
        <a type="button" id="button-menu" class="pull-left"><i class="fa fa-dedent fa-lg"></i></a>
    </div>
    <ul class="nav pull-right">
        <c:choose>
            <c:when test="${newOrders + newReviews > 0}">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown">
                        <span class="label label-danger pull-left">${newOrders + newReviews}</span> <i class="fa fa-bell fa-lg"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right alerts-dropdown">
                        <li class="dropdown-header">Уведомления</li>
                        <c:if test="${newOrders != 0}">
                            <li>
                                <a href="<c:url value="/cp/order/search_by?status=1"/>" style="display: block; overflow: auto;">
                                    <span class="label label-warning pull-right">${newOrders}</span>Новые заказы
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${newReviews != 0}">
                            <li>
                                <a href="<c:url value="/cp/review/search_by?active=false"/>" style="display: block; overflow: auto;">
                                    <span class="label label-warning pull-right">${newReviews}</span>Новые отзывы
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </li>
            </c:when>
            <c:otherwise>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bell fa-lg"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right alerts-dropdown">
                        <li class="dropdown-header">Уведомления</li>
                        <li>
                            <a style="display: block; overflow: auto;">
                                Нет новых событий
                            </a>
                        </li>
                    </ul>
                </li>
            </c:otherwise>
        </c:choose>
        <li><a href="<c:url value="/"/>" title="Перейти в магазин"><i class="fa fa-building fa-lg"></i> <span class="hidden-xs hidden-sm hidden-md">В магазин</span></a></li>
    </ul>
</header>