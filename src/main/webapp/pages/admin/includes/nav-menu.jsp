<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav id="column-left" class="active">
    <div id="profile">
        <div>
            <h4>Roman Voloboev</h4>
            <small>Администратор</small>
        </div>
    </div>

    <ul id="menu">
        <li id="dashboard">
            <a href="/admin"><i class="fa fa-dashboard fa-fw"></i> <span>Панель управления</span></a>
        </li>
        <li id="sale">
            <a href=""><i class="fa fa-shopping-cart fa-fw"></i> <span>Заказы</span></a>
        </li>
        <li id="catalog">
            <a class="parent"><i class="fa fa-tags fa-fw"></i> <span>Каталог</span></a>
            <ul class="collapse">
                <li><a href="">Категории</a></li>
                <li><a href="">Товары</a></li>
            </ul>
        </li>
        <li id="users">
            <a class="parent"><i class="fa fa-users fa-fw"></i> <span>Пользователи</span></a>
            <ul class="collapse">
                <li><a href="">Администраторы</a></li>
                <li><a href="">Покупатели</a></li>
            </ul>
        </li>
        <%--заказов - сортировка по количеству совершенных заказов за промежуток времени--%>
        <%--товаров - сортировка по товару, купленного больше всего--%>
        <%--пользователей - сортировка по количесвту совершенных заказов--%>
        <li id="reports">
            <a class="parent"><i class="fa fa-bar-chart-o fa-fw"></i> <span>Статистика</span></a>
            <ul class="collapse">
                <li><a href="">Заказов</a></li>
                <li><a href="">Товаров</a></li>
                <li><a href="">Пользователей</a></li>
            </ul>
        </li>
    </ul>
</nav>
