<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
<script type="text/javascript">
    $(function() {
        $('#input-description').summernote({
            height: 250,
            toolbar: [
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']]
            ]
        });
    });

    $('input[name=\'category\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: '' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['category_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'category\']').val('');

            $('#product-category' + item['value']).remove();

            $('#product-category').append('<div id="product-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_category[]" value="' + item['value'] + '" /></div>');
        }
    });

    var image_row = 0;

    function addImage() {
        html  = '<tr id="image-row' + image_row + '">';
        html += '  <td class="text-left"><a href="" id="thumb-image' + image_row + '"data-toggle="image" class="img-thumbnail"><img src="http://demo.opencart.com/image/cache/no_image-100x100.png" alt="" title="" data-placeholder="http://demo.opencart.com/image/cache/no_image-100x100.png" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /></td>';
        html += '  <td class="text-right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" placeholder="Sort Order" class="form-control" /></td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="Remove" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#images tbody').append(html);

        image_row++;
    }



</script>

</head>
<body>
<div id="container">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/nav-menu.jsp"%>

    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" form="form-product" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Сохранить"><i class="fa fa-save"></i></button>
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
                                    <label class="col-sm-2 control-label" for="input-image">Изображение</label>
                                    <div class="col-sm-10">
                                        <a href="" id="thumb-image" data-toggle="image" class="img-thumbnail">
                                            <img src="../../webres/admin/img/upload.png" height="100px" width="100px" alt="Выберите изображение для загрузки" data-placeholder="../../webres/admin/img/upload.png"></a>
                                        <input type="hidden" name="image" value="" id="input-image">
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
                                <%--todo image uploading--%>
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