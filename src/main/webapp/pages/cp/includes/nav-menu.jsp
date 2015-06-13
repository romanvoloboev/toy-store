<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav id="column-left" class="active">
    <div id="profile">
        <div>
            <h4>${customerName}</h4>
            <small>${customerRole}</small>
        </div>
    </div>

    <ul id="menu">
        <li id="dashboard">
            <a href="<c:url value="/cp"/>"><i class="fa fa-dashboard fa-fw"></i> <span>Панель управления</span></a>
        </li>
        <li id="sale">
            <a href="<c:url value="/cp/order"/>"><i class="fa fa-shopping-cart fa-fw"></i> <span>Заказы</span></a>
        </li>
        <li id="catalog">
            <a class="parent"><i class="fa fa-tags fa-fw"></i> <span>Каталог</span></a>
            <ul class="collapse">
                <li><a href="<c:url value="/cp/product"/>">Товары</a></li>
                <li><a href="<c:url value="/cp/category"/>">Категории</a></li>
                <li><a href="<c:url value="/cp/brand"/>">Производители</a></li>
            </ul>
        </li>
        <li id="reviews">
            <a href="<c:url value="/cp/review"/>"><i class="fa fa-comment fa-fw"></i> <span>Отзывы</span></a>
        </li>
        <li id="customers">
            <a href="<c:url value="/cp/customer"/>"><i class="fa fa-users fa-fw"></i> <span>Пользователи</span></a>
        </li>
        <li id="employee">
            <a href="<c:url value="/cp/employee"/>"><i class="fa fa-user-secret fa-fw"></i> <span>Администраторы</span></a>
        </li>

        <%--&lt;%&ndash;заказов - сортировка по количеству совершенных заказов за промежуток времени&ndash;%&gt;--%>
        <%--&lt;%&ndash;товаров - сортировка по товару, купленного больше всего&ndash;%&gt;--%>
        <%--<li id="reports">--%>
            <%--<a class="parent"><i class="fa fa-bar-chart-o fa-fw"></i> <span>Статистика</span></a>--%>
            <%--<ul class="collapse">--%>
                <%--<li><a href="<c:url value="/cp/sale_report"/>">Заказов</a></li>--%>
                <%--<li><a href="<c:url value="/cp/product_report"/>">Товаров</a></li>--%>
            <%--</ul>--%>
        <%--</li>--%>
    </ul>
</nav>
