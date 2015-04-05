<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Floral Store</title>
    <meta name="description" content="My Store">

    <%@include file="includes/head.jsp"%>
</head>
<body id="offcanvas-container" class="nokeep-header offcanvas-container layout-fullwidth fs12 page-account-login" data-twttr-rendered="true">
<section id="page" class="offcanvas-pusher" role="main">
    <section id="header">
        <%@include file="includes/signup_login.jsp"%>
        <section id="header-main">
            <div class="container">
                <div class="header-wrap">
                    <%@include file="includes/menu.jsp"%>
                    <%@include file="includes/cart.jsp"%>
                </div>
            </div>
        </section>
    </section>
    <section id="columns">
        <div class="container">
            <div class="wrap-container">
                <div class="row">
                    <div class="col-lg-2 col-sm-2 col-xs-12" style="padding-top: 15px;">
                        <div id="column-right" class="sidebar">
                            <div class="box">
                                <div class="box-heading" style="text-align: center;"><span>Личный кабинет</span></div>
                                <div class="box-content box-content-profile" style="padding: 0; text-align: center;">
                                    <ul>
                                        <li><a href="<c:url value="/profile"/>">Профиль</a></li>
                                        <li><a href="<c:url value="/wishlist"/>">Список желаний</a></li>
                                        <li><a href="<c:url value="/orders"/>">История заказов</a></li>
                                        <li><a href="<c:url value="/cart"/>">Корзина</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-10 col-sm-10 col-xs-12" style="padding-top: 15px;">
                        <div id="content" class="user-settings">
                            <div class="col-lg-12" style="padding-bottom: 16px;"><h1>Список желаний</h1></div>
                            <div class="col-md-12">
                                <div class="wishlist-info">
                                    <table>
                                        <thead>
                                            <tr>
                                                <td class="image">Товар</td>
                                                <td class="name"></td>
                                                <td class="price">Цена</td>
                                                <td class="stock">Статус</td>
                                                <td class="action"></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="image">
                                                    <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=43">
                                                        <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product10-200x150.jpg">
                                                    </a>
                                                </td>
                                                <td class="name">
                                                    <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=43">Название</a>
                                                </td>
                                                <td class="price">
                                                    <div class="price">1500.00 грн.</div>
                                                </td>
                                                <td class="stock">В наличии</td>
                                                <td class="action">
                                                    <a href="" title="Добавить в корзину" onclick=""><i class="fa fa-shopping-cart fa-lg"></i></a>
                                                    <a href="" style="margin-left: 10px;" title="Удалить из списка" onclick=""><i class="fa fa-times fa-lg"></i></a>
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
    </section>

    <%@include file="includes/footer.jsp"%>
</section>
</body>
</html>