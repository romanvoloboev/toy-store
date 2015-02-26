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
                    <form action="" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">
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
                </form>
            </div>
        </div>
    </div>

    <script type="text/javascript"><!--
    // Manufacturer
    $('input[name=\'manufacturer\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/manufacturer/autocomplete&token=98b17f235c96ec3337ba43fd7182b39f&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    json.unshift({
                        manufacturer_id: 0,
                        name: ' --- None --- '
                    });

                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['manufacturer_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'manufacturer\']').val(item['label']);
            $('input[name=\'manufacturer_id\']').val(item['value']);
        }
    });

    // Category
    $('input[name=\'category\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/category/autocomplete&token=98b17f235c96ec3337ba43fd7182b39f&filter_name=' +  encodeURIComponent(request),
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

    $('#product-category').delegate('.fa-minus-circle', 'click', function() {
        $(this).parent().remove();
    });

    // Filter
    $('input[name=\'filter\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/filter/autocomplete&token=98b17f235c96ec3337ba43fd7182b39f&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['filter_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'filter\']').val('');

            $('#product-filter' + item['value']).remove();

            $('#product-filter').append('<div id="product-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_filter[]" value="' + item['value'] + '" /></div>');
        }
    });

    $('#product-filter').delegate('.fa-minus-circle', 'click', function() {
        $(this).parent().remove();
    });

    // Downloads
    $('input[name=\'download\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/download/autocomplete&token=98b17f235c96ec3337ba43fd7182b39f&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['download_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'download\']').val('');

            $('#product-download' + item['value']).remove();

            $('#product-download').append('<div id="product-download' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_download[]" value="' + item['value'] + '" /></div>');
        }
    });

    $('#product-download').delegate('.fa-minus-circle', 'click', function() {
        $(this).parent().remove();
    });

    // Related
    $('input[name=\'related\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/product/autocomplete&token=98b17f235c96ec3337ba43fd7182b39f&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            label: item['name'],
                            value: item['product_id']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            $('input[name=\'related\']').val('');

            $('#product-related' + item['value']).remove();

            $('#product-related').append('<div id="product-related' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product_related[]" value="' + item['value'] + '" /></div>');
        }
    });

    $('#product-related').delegate('.fa-minus-circle', 'click', function() {
        $(this).parent().remove();
    });
    //--></script>
    <script type="text/javascript"><!--
    var attribute_row = 0;

    function addAttribute() {
        html  = '<tr id="attribute-row' + attribute_row + '">';
        html += '  <td class="text-left"><input type="text" name="product_attribute[' + attribute_row + '][name]" value="" placeholder="Attribute" class="form-control" /><input type="hidden" name="product_attribute[' + attribute_row + '][attribute_id]" value="" /></td>';
        html += '  <td class="text-left">';
        html += '<div class="input-group"><span class="input-group-addon"><img src="view/image/flags/gb.png" title="English" /></span><textarea name="product_attribute[' + attribute_row + '][product_attribute_description][1][text]" rows="5" placeholder="Text" class="form-control"></textarea></div>';
        html += '  </td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#attribute-row' + attribute_row + '\').remove();" data-toggle="tooltip" title="Remove" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#attribute tbody').append(html);

        attributeautocomplete(attribute_row);

        attribute_row++;
    }

    function attributeautocomplete(attribute_row) {
        $('input[name=\'product_attribute[' + attribute_row + '][name]\']').autocomplete({
            'source': function(request, response) {
                $.ajax({
                    url: 'index.php?route=catalog/attribute/autocomplete&token=98b17f235c96ec3337ba43fd7182b39f&filter_name=' +  encodeURIComponent(request),
                    dataType: 'json',
                    success: function(json) {
                        response($.map(json, function(item) {
                            return {
                                category: item.attribute_group,
                                label: item.name,
                                value: item.attribute_id
                            }
                        }));
                    }
                });
            },
            'select': function(item) {
                $('input[name=\'product_attribute[' + attribute_row + '][name]\']').val(item['label']);
                $('input[name=\'product_attribute[' + attribute_row + '][attribute_id]\']').val(item['value']);
            }
        });
    }

    $('#attribute tbody tr').each(function(index, element) {
        attributeautocomplete(index);
    });
    //--></script>
    <script type="text/javascript"><!--
    var option_row = 0;

    $('input[name=\'option\']').autocomplete({
        'source': function(request, response) {
            $.ajax({
                url: 'index.php?route=catalog/option/autocomplete&token=98b17f235c96ec3337ba43fd7182b39f&filter_name=' +  encodeURIComponent(request),
                dataType: 'json',
                success: function(json) {
                    response($.map(json, function(item) {
                        return {
                            category: item['category'],
                            label: item['name'],
                            value: item['option_id'],
                            type: item['type'],
                            option_value: item['option_value']
                        }
                    }));
                }
            });
        },
        'select': function(item) {
            html  = '<div class="tab-pane" id="tab-option' + option_row + '">';
            html += '	<input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="" />';
            html += '	<input type="hidden" name="product_option[' + option_row + '][name]" value="' + item['label'] + '" />';
            html += '	<input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + item['value'] + '" />';
            html += '	<input type="hidden" name="product_option[' + option_row + '][type]" value="' + item['type'] + '" />';

            html += '	<div class="form-group">';
            html += '	  <label class="col-sm-2 control-label" for="input-required' + option_row + '">Required</label>';
            html += '	  <div class="col-sm-10"><select name="product_option[' + option_row + '][required]" id="input-required' + option_row + '" class="form-control">';
            html += '	      <option value="1">Yes</option>';
            html += '	      <option value="0">No</option>';
            html += '	  </select></div>';
            html += '	</div>';

            if (item['type'] == 'text') {
                html += '	<div class="form-group">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '">Option Value</label>';
                html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="Option Value" id="input-value' + option_row + '" class="form-control" /></div>';
                html += '	</div>';
            }

            if (item['type'] == 'textarea') {
                html += '	<div class="form-group">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '">Option Value</label>';
                html += '	  <div class="col-sm-10"><textarea name="product_option[' + option_row + '][value]" rows="5" placeholder="Option Value" id="input-value' + option_row + '" class="form-control"></textarea></div>';
                html += '	</div>';
            }

            if (item['type'] == 'file') {
                html += '	<div class="form-group" style="display: none;">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '">Option Value</label>';
                html += '	  <div class="col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="Option Value" id="input-value' + option_row + '" class="form-control" /></div>';
                html += '	</div>';
            }

            if (item['type'] == 'date') {
                html += '	<div class="form-group">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '">Option Value</label>';
                html += '	  <div class="col-sm-3"><div class="input-group date"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="Option Value" data-format="YYYY-MM-DD" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                html += '	</div>';
            }

            if (item['type'] == 'time') {
                html += '	<div class="form-group">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '">Option Value</label>';
                html += '	  <div class="col-sm-10"><div class="input-group time"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="Option Value" data-format="HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                html += '	</div>';
            }

            if (item['type'] == 'datetime') {
                html += '	<div class="form-group">';
                html += '	  <label class="col-sm-2 control-label" for="input-value' + option_row + '">Option Value</label>';
                html += '	  <div class="col-sm-10"><div class="input-group datetime"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="Option Value" data-format="YYYY-MM-DD HH:mm" id="input-value' + option_row + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
                html += '	</div>';
            }

            if (item['type'] == 'select' || item['type'] == 'radio' || item['type'] == 'checkbox' || item['type'] == 'image') {
                html += '<div class="table-responsive">';
                html += '  <table id="option-value' + option_row + '" class="table table-striped table-bordered table-hover">';
                html += '  	 <thead>';
                html += '      <tr>';
                html += '        <td class="text-left">Option Value</td>';
                html += '        <td class="text-right">Quantity</td>';
                html += '        <td class="text-left">Subtract Stock</td>';
                html += '        <td class="text-right">Price</td>';
                html += '        <td class="text-right">Points</td>';
                html += '        <td class="text-right">Weight</td>';
                html += '        <td></td>';
                html += '      </tr>';
                html += '  	 </thead>';
                html += '  	 <tbody>';
                html += '    </tbody>';
                html += '    <tfoot>';
                html += '      <tr>';
                html += '        <td colspan="6"></td>';
                html += '        <td class="text-left"><button type="button" onclick="addOptionValue(' + option_row + ');" data-toggle="tooltip" title="Add Option Value" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>';
                html += '      </tr>';
                html += '    </tfoot>';
                html += '  </table>';
                html += '</div>';

                html += '  <select id="option-values' + option_row + '" style="display: none;">';

                for (i = 0; i < item['option_value'].length; i++) {
                    html += '  <option value="' + item['option_value'][i]['option_value_id'] + '">' + item['option_value'][i]['name'] + '</option>';
                }

                html += '  </select>';
                html += '</div>';
            }

            $('#tab-option .tab-content').append(html);

            $('#option > li:last-child').before('<li><a href="#tab-option' + option_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick="$(\'a[href=\\\'#tab-option' + option_row + '\\\']\').parent().remove(); $(\'#tab-option' + option_row + '\').remove(); $(\'#option a:first\').tab(\'show\')"></i> ' + item['label'] + '</li>');

            $('#option a[href=\'#tab-option' + option_row + '\']').tab('show');

            $('.date').datetimepicker({
                pickTime: false
            });

            $('.time').datetimepicker({
                pickDate: false
            });

            $('.datetime').datetimepicker({
                pickDate: true,
                pickTime: true
            });

            option_row++;
        }
    });
    //--></script>
    <script type="text/javascript"><!--
    var option_value_row = 0;

    function addOptionValue(option_row) {
        html  = '<tr id="option-value-row' + option_value_row + '">';
        html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]" class="form-control">';
        html += $('#option-values' + option_row).html();
        html += '  </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="" /></td>';
        html += '  <td class="text-right"><input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="" placeholder="Quantity" class="form-control" /></td>';
        html += '  <td class="text-left"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]" class="form-control">';
        html += '    <option value="1">Yes</option>';
        html += '    <option value="0">No</option>';
        html += '  </select></td>';
        html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price_prefix]" class="form-control">';
        html += '    <option value="+">+</option>';
        html += '    <option value="-">-</option>';
        html += '  </select>';
        html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="" placeholder="Price" class="form-control" /></td>';
        html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]" class="form-control">';
        html += '    <option value="+">+</option>';
        html += '    <option value="-">-</option>';
        html += '  </select>';
        html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="" placeholder="Points" class="form-control" /></td>';
        html += '  <td class="text-right"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]" class="form-control">';
        html += '    <option value="+">+</option>';
        html += '    <option value="-">-</option>';
        html += '  </select>';
        html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="" placeholder="Weight" class="form-control" /></td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#option-value-row' + option_value_row + '\').remove();" data-toggle="tooltip" title="Remove" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#option-value' + option_row + ' tbody').append(html);

        option_value_row++;
    }
    //--></script>
    <script type="text/javascript"><!--
    var discount_row = 0;

    function addDiscount() {
        html  = '<tr id="discount-row' + discount_row + '">';
        html += '  <td class="text-left"><select name="product_discount[' + discount_row + '][customer_group_id]" class="form-control">';
        html += '    <option value="1">Default</option>';
        html += '  </select></td>';
        html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][quantity]" value="" placeholder="Quantity" class="form-control" /></td>';
        html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][priority]" value="" placeholder="Priority" class="form-control" /></td>';
        html += '  <td class="text-right"><input type="text" name="product_discount[' + discount_row + '][price]" value="" placeholder="Price" class="form-control" /></td>';
        html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_start]" value="" placeholder="Date Start" data-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
        html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_discount[' + discount_row + '][date_end]" value="" placeholder="Date End" data-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#discount-row' + discount_row + '\').remove();" data-toggle="tooltip" title="Remove" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#discount tbody').append(html);

        $('.date').datetimepicker({
            pickTime: false
        });

        discount_row++;
    }
    //--></script>
    <script type="text/javascript"><!--
    var special_row = 0;

    function addSpecial() {
        html  = '<tr id="special-row' + special_row + '">';
        html += '  <td class="text-left"><select name="product_special[' + special_row + '][customer_group_id]" class="form-control">';
        html += '      <option value="1">Default</option>';
        html += '  </select></td>';
        html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][priority]" value="" placeholder="Priority" class="form-control" /></td>';
        html += '  <td class="text-right"><input type="text" name="product_special[' + special_row + '][price]" value="" placeholder="Price" class="form-control" /></td>';
        html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_start]" value="" placeholder="Date Start" data-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
        html += '  <td class="text-left"><div class="input-group date"><input type="text" name="product_special[' + special_row + '][date_end]" value="" placeholder="Date End" data-format="YYYY-MM-DD" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
        html += '  <td class="text-left"><button type="button" onclick="$(\'#special-row' + special_row + '\').remove();" data-toggle="tooltip" title="Remove" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
        html += '</tr>';

        $('#special tbody').append(html);

        $('.date').datetimepicker({
            pickTime: false
        });

        special_row++;
    }
    //--></script>
    <script type="text/javascript"><!--
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
    //--></script>
    <script type="text/javascript"><!--
    var recurring_count = 0;

    function addRecurring() {
        recurring_count++;

        html  = '';
        html += '<tr id="recurring-row' + recurring_count + '">';
        html += '  <td class="left">';
        html += '    <select name="product_recurrings[' + recurring_count + '][recurring_id]" class="form-control">>';
        html += '    </select>';
        html += '  </td>';
        html += '  <td class="left">';
        html += '    <select name="product_recurrings[' + recurring_count + '][customer_group_id]" class="form-control">>';
        html += '      <option value="1">Default</option>';
        html += '    <select>';
        html += '  </td>';
        html += '  <td class="left">';
        html += '    <a onclick="$(\'#recurring-row' + recurring_count + '\').remove()" data-toggle="tooltip" title="Remove" class="btn btn-danger"><i class="fa fa-minus-circle"></i></a>';
        html += '  </td>';
        html += '</tr>';

        $('#tab-recurring table tbody').append(html);
    }
    //--></script>
    <script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });
    //--></script>
    <script type="text/javascript"><!--
    $('#language a:first').tab('show');
    $('#option a:first').tab('show');
    //--></script></div>
</div>
</body>
</html>