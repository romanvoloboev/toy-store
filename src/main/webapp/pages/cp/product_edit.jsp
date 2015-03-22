<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
    <script src="../../webres/cp/js/product_add.js"></script>

    <style type="text/css">
        .dropzone {
            border: dashed 2px rgba(72, 72, 67, 0.50);
            border-radius: 5px;
            padding: 0;
        }
    </style>
</head>
<body>
<div id="container">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/nav-menu.jsp"%>

    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" id="save-product" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Сохранить"><i class="fa fa-save"></i></button>
                    <a href="<c:url value="/cp/product"/>" data-toggle="tooltip" title="" class="btn btn-default" data-original-title="Отмена"><i class="fa fa-reply"></i></a></div>
                <h1>Товары</h1>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> Добавить товар</h3>
                </div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <ul class="nav nav-tabs">
                            <li class="isActive"><a href="#tab-general" data-toggle="tab">Основная информация</a></li>
                            <li><a href="#tab-image" data-toggle="tab">Изображения</a></li>
                        </ul>

                        <div class="tab-content">
                            <div class="tab-pane isActive" id="tab-general">
                                <div class="col-md-9" style="padding: 0;">
                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <input type="text" placeholder="Название товара" id="product-name" class="form-control">
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" placeholder="Код товара" id="product-code" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <input type="text" placeholder="Категория товара" id="product-category" class="form-control" autocomplete="off">
                                            <ul class="dropdown-menu"></ul>
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" placeholder="Производитель" id="product-brand" class="form-control">
                                            <ul class="dropdown-menu"></ul>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <textarea placeholder="Описание товара" id="product-description" style="display: none;"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-4">
                                            <input type="text" placeholder="Цена" id="product-price" class="form-control">
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" placeholder="Старая цена" id="product-old-price" class="form-control">
                                        </div>
                                        <div class="col-md-4">
                                            <select id="product-age" class="form-control" title="Минимальный возраст">
                                                <option value="*">--- Ограничение по возрасту ---</option>
                                                <option value="1">1+</option>
                                                <option value="2">2+</option>
                                                <option value="3">3+</option>
                                                <option value="4">4+</option>
                                                <option value="5">5+</option>
                                                <option value="6">6+</option>
                                                <option value="7">7+</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-3">
                                            <input type="text" placeholder="Количество" id="input-quantity" class="form-control">
                                        </div>
                                        <div class="col-md-3">
                                            <input type="text" placeholder="Длина (см.)" id="input-length" class="form-control">
                                        </div>
                                        <div class="col-md-3">
                                            <input type="text" placeholder="Ширина (см.)" id="input-width" class="form-control">
                                        </div>
                                        <div class="col-md-3">
                                            <input type="text" placeholder="Высота (см.)" id="input-height" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane" id="tab-image">
                                <div class="col-md-12">
                                    <div class="row form-group">
                                        <div class="col-xs-12 col-md-2" id="thumb-image1">
                                            <div class="panel panel-default">
                                                <div class="panel-image">
                                                    <img src="http://666a658c624a3c03a6b2-25cda059d975d2f318c03e90bcf17c40.r92.cf1.rackcdn.com/unsplash_52cf9489095e8_1.JPG" class="panel-image-preview" />
                                                </div>
                                                <div class="panel-footer text-center">
                                                    <button onclick="$('#thumb-image1').remove();" class="btn">
                                                        <span class="fa fa-times"></span> Удалить
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-md-2" id="thumb-image2">
                                            <div class="panel panel-default">
                                                <div class="panel-image">
                                                    <img src="http://666a658c624a3c03a6b2-25cda059d975d2f318c03e90bcf17c40.r92.cf1.rackcdn.com/unsplash_52cf9489095e8_1.JPG" class="panel-image-preview" />
                                                </div>
                                                <div class="panel-footer text-center">
                                                    <button onclick="$('#thumb-image2').remove();" class="btn">
                                                        <span class="fa fa-times"></span> Удалить
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-2 col-xs-12" style="margin-bottom: 15px; padding-right: 0;">
                                    <button type="button" id="select-image" class="btn btn-success"><i class="fa fa-folder-open"></i> Выбрать</button>
                                </div>
                                <div class="col-md-10 col-xs-12" style="padding-top: 8px;"><span style="color: #e2af00;">Вы можете загрузить до 5 изображений, при этом размер каждого не должен превышать 3Мб.</span></div>
                                <div class="col-md-12 image-previews" style="display: none;">
                                    <div id="previews" class="dropzone"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>
</body>
</html>