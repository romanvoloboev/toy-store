<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="pull-left wrap-logo">
    <div id="logo">
        <a href="/">
            <img src="../../../webres/user/image/logo.png" title="Floral Store" alt="Floral Store">
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
                                <ul class="nav navbar-nav megamenu">
                                    <li class="home">
                                        <a href="?route=common/home"><span class="menu-title">Home</span></a>
                                    </li>

                                    <li>
                                        <a href="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=33"><span class="menu-title">Office</span></a>
                                    </li>

                                    <li class="parent dropdown pav-parrent">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=18">
                                            <span class="menu-title">Laptops &amp; Notebooks</span><b class="caret"></b>
                                        </a>

                                        <div class="dropdown-menu level1">
                                            <div class="dropdown-menu-inner">
                                                <div class="row">
                                                    <div class="mega-col col-xs-12 col-sm-12 col-md-12"
                                                         data-type="menu">
                                                        <div class="mega-col-inner">
                                                            <ul>
                                                                <li>
                                                                    <a href="http://localhost/test/pav_floral/index.php?route=product/category&amp;path=59">Duistempor</a>
                                                                </li>
                                                                <li>
                                                                    <a href="http://localhost/test/pav_floral/index.php?route=product/category&amp;path=60">Pellentesqueeget</a>
                                                                </li>
                                                                <li>
                                                                    <a href="http://localhost/test/pav_floral/index.php?route=product/category&amp;path=61">Namnunc                                                                        ante</a></li>
                                                                <li>
                                                                    <a href="http://localhost/test/pav_floral/index.php?route=product/category&amp;path=62">Condimentumeu</a>
                                                                </li>
                                                                <li>
                                                                    <a href="http://localhost/test/pav_floral/index.php?route=product/category&amp;path=63">Lehiculalorem</a>
                                                                </li>
                                                                <li>
                                                                    <a href="http://localhost/test/pav_floral/index.php?route=product/category&amp;path=64">Integersemper</a>
                                                                </li>
                                                                <li>
                                                                    <a href="http://localhost/test/pav_floral/index.php?route=product/category&amp;path=65">Sollicitudinlacus</a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
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