<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
    <script type="text/javascript" src="../../webres/admin/js/product_add.js"></script>

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
                <h1>Продукты</h1>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> Добавить продукт</h3>
                </div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab-general" data-toggle="tab">Основная информация</a></li>
                            <li><a href="#tab-image" data-toggle="tab">Изображения</a></li>
                        </ul>

                        <div class="tab-content">
                            <div class="tab-pane active" id="tab-general">
                                <div class="form-group required">
                                    <label class="col-sm-2 control-label" for="input-name1">Название продукта</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="product_description" value="" placeholder="Введите название продукта" id="input-name1" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-description">Описание</label>
                                    <div class="col-sm-10">
                                        <textarea name="product_description" placeholder="Введите описание продукта" id="input-description" style="display: none;"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-status">Категория</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="category" value="" placeholder="Выберите категорию товара" id="input-category" class="form-control" autocomplete="off">
                                        <ul class="dropdown-menu"></ul>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-price">Цена</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="price" value="" placeholder="Введите цену" id="input-price" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-quantity">Количество</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="quantity" value="1" placeholder="Введите количество товара" id="input-quantity" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-length">Размеры</label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-sm-3">
                                                <input type="text" name="length" value="" placeholder="Длина (см.)" id="input-length" class="form-control">
                                            </div>
                                            <div class="col-sm-3">
                                                <input type="text" name="width" value="" placeholder="Ширина (см.)" id="input-width" class="form-control">
                                            </div>
                                            <div class="col-sm-3">
                                                <input type="text" name="height" value="" placeholder="Высота (см.)" id="input-height" class="form-control">
                                            </div>
                                            <div class="col-sm-3">
                                                <input type="text" name="weight" value="" placeholder="Вес (кг.)" id="input-weight" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-status">Статус</label>
                                    <div class="col-sm-10">
                                        <select name="status" id="input-status" class="form-control">
                                            <option value="1" selected="selected">Доступен</option>
                                            <option value="0">Недоступен</option>
                                        </select>
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
                                    <button type="button" id="select-image" class="btn btn-success"><i class="fa fa-folder-open"></i> Добавить</button>
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
</div>
</body>
</html>