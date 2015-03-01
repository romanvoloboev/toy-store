<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Админ-панель</title>
    <%@include file="includes/head.jsp"%>
</head>
<body>
<div id="container">
    <%@include file="includes/header.jsp"%>
    <%@include file="includes/nav-menu.jsp"%>

    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <a href="" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Редактировать"><i class="fa fa-pencil"></i></a>
                    <a href="<c:url value="/cp/order"/>" data-toggle="tooltip" title="" class="btn btn-default" data-original-title="Назад"><i class="fa fa-reply"></i></a>
                </div>
                <h1>Заказы</h1>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-list"></i> Информация о заказе</h3>
                </div>
                <div class="panel-body">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-order" data-toggle="tab">Общая информация</a></li>
                        <li><a href="#tab-payment" data-toggle="tab">Доставка и оплата</a></li>
                        <li><a href="#tab-product" data-toggle="tab">Товары</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-order">
                            <table class="table table-bordered">
                                <tbody><tr>
                                    <td>Номер заказа:</td>
                                    <td>#1228</td>
                                </tr>
                                <tr>
                                    <td>Покупатель:</td>
                                    <td>Svyatoslav Karyagin</td>
                                </tr>
                                <tr>
                                    <td>E-mail:</td>
                                    <td><a href="mailto:spellscape@spellscape.biz">spellscape@spellscape.biz</a></td>
                                </tr>
                                <tr>
                                    <td>Телефон:</td>
                                    <td>466677678</td>
                                </tr>
                                <tr>
                                    <td>Итого:</td>
                                    <td>£64.31</td>
                                </tr>
                                <tr>
                                    <td>Статус заказа:</td>
                                    <td id="order-status">Pending</td>
                                </tr>
                                <tr>
                                    <td>Дата заказа:</td>
                                    <td>27/02/2015</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane" id="tab-payment">
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <td>Способ доставки</td>
                                    <td>Самовывоз</td>
                                </tr>
                                <tr>
                                    <td>Служба доставки</td>
                                    <td>Новая почта</td>
                                </tr>
                                <tr>
                                    <td>Адрес</td>
                                    <td>pr. Kosmonavtov 7</td>
                                </tr>
                                <tr>
                                    <td>Оплата</td>
                                    <td>Наличными при получении</td>
                                </tr>
                                </tbody></table>
                        </div>
                        <div class="tab-pane" id="tab-product">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <td class="text-left">Название</td>
                                    <td class="text-right">Количество</td>
                                    <td class="text-right">Цена за единицу</td>
                                    <td class="text-right">Всего</td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="text-left"><a href="">HP LP3065</a></td>
                                    <td class="text-right">1</td>
                                    <td class="text-right">£61.25</td>
                                    <td class="text-right">£61.25</td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="text-right">Итого:</td>
                                    <td class="text-right">£64.31</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript"><!--
        $(document).delegate('#button-invoice', 'click', function() {
            $.ajax({
                url: 'index.php?route=sale/order/createinvoiceno&token=4a305028ecf3734497729bad4c22b930&order_id=1228',
                dataType: 'json',
                beforeSend: function() {
                    $('#button-invoice').button('loading');
                },
                complete: function() {
                    $('#button-invoice').button('reset');
                },
                success: function(json) {
                    $('.alert').remove();

                    if (json['error']) {
                        $('#tab-order').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                    }

                    if (json['invoice_no']) {
                        $('#button-invoice').replaceWith(json['invoice_no']);
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });

        $(document).delegate('#button-reward-add', 'click', function() {
            $.ajax({
                url: 'index.php?route=sale/order/addreward&token=4a305028ecf3734497729bad4c22b930&order_id=1228',
                type: 'post',
                dataType: 'json',
                beforeSend: function() {
                    $('#button-reward-add').button('loading');
                },
                complete: function() {
                    $('#button-reward-add').button('reset');
                },
                success: function(json) {
                    $('.alert').remove();

                    if (json['error']) {
                        $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                    }

                    if (json['success']) {
                        $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                        $('#button-reward-add').replaceWith('<button id="button-reward-remove" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i> Remove Reward Points</button>');
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });

        $(document).delegate('#button-reward-remove', 'click', function() {
            $.ajax({
                url: 'index.php?route=sale/order/removereward&token=4a305028ecf3734497729bad4c22b930&order_id=1228',
                type: 'post',
                dataType: 'json',
                beforeSend: function() {
                    $('#button-reward-remove').button('loading');
                },
                complete: function() {
                    $('#button-reward-remove').button('reset');
                },
                success: function(json) {
                    $('.alert').remove();

                    if (json['error']) {
                        $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                    }

                    if (json['success']) {
                        $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                        $('#button-reward-remove').replaceWith('<button id="button-reward-add" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i> Add Reward Points</button>');
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });

        $(document).delegate('#button-commission-add', 'click', function() {
            $.ajax({
                url: 'index.php?route=sale/order/addcommission&token=4a305028ecf3734497729bad4c22b930&order_id=1228',
                type: 'post',
                dataType: 'json',
                beforeSend: function() {
                    $('#button-commission-add').button('loading');
                },
                complete: function() {
                    $('#button-commission-add').button('reset');
                },
                success: function(json) {
                    $('.alert').remove();

                    if (json['error']) {
                        $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                    }

                    if (json['success']) {
                        $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                        $('#button-commission-add').replaceWith('<button id="button-commission-remove" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i> Remove Commission</button>');
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });

        $(document).delegate('#button-commission-remove', 'click', function() {
            $.ajax({
                url: 'index.php?route=sale/order/removecommission&token=4a305028ecf3734497729bad4c22b930&order_id=1228',
                type: 'post',
                dataType: 'json',
                beforeSend: function() {
                    $('#button-commission-remove').button('loading');

                },
                complete: function() {
                    $('#button-commission-remove').button('reset');
                },
                success: function(json) {
                    $('.alert').remove();

                    if (json['error']) {
                        $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                    }

                    if (json['success']) {
                        $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                        $('#button-commission-remove').replaceWith('<button id="button-commission-add" class="btn btn-success btn-xs"><i class="fa fa-minus-circle"></i> Add Commission</button>');
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });

        $('#history').delegate('.pagination a', 'click', function(e) {
            e.preventDefault();

            $('#history').load(this.href);
        });

        $('#history').load('index.php?route=sale/order/history&token=4a305028ecf3734497729bad4c22b930&order_id=1228');

        $('#button-history').on('click', function() {
            if(typeof verifyStatusChange == 'function'){
                if(verifyStatusChange() == false){
                    return false;
                }else{
                    addOrderInfo();
                }
            }else{
                addOrderInfo();
            }

            $.ajax({
                url: 'index.php?route=sale/order/api&token=4a305028ecf3734497729bad4c22b930&api=api/order/history&order_id=1228',
                type: 'post',
                dataType: 'json',
                data: 'order_status_id=' + encodeURIComponent($('select[name=\'order_status_id\']').val()) + '&notify=' + ($('input[name=\'notify\']').prop('checked') ? 1 : 0) + '&append=' + ($('input[name=\'append\']').prop('checked') ? 1 : 0) + '&comment=' + encodeURIComponent($('textarea[name=\'comment\']').val()),
                beforeSend: function() {
                    $('#button-history').button('loading');
                },
                complete: function() {
                    $('#button-history').button('reset');
                },
                success: function(json) {
                    $('.alert').remove();

                    if (json['error']) {
                        $('#history').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }

                    if (json['success']) {
                        $('#history').load('index.php?route=sale/order/history&token=4a305028ecf3734497729bad4c22b930&order_id=1228');

                        $('#history').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                        $('textarea[name=\'comment\']').val('');

                        $('#order-status').html($('select[name=\'order_status_id\'] option:selected').text());
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });

        function changeStatus(){
            var status_id = $('select[name="order_status_id"]').val();

            $('#openbay-info').remove();

            $.ajax({
                url: 'index.php?route=extension/openbay/getorderinfo&token=4a305028ecf3734497729bad4c22b930&order_id=1228&status_id='+status_id,
                dataType: 'html',
                success: function(html) {
                    $('#history').after(html);
                }
            });
        }

        function addOrderInfo(){
            var status_id = $('select[name="order_status_id"]').val();

            $.ajax({
                url: 'index.php?route=extension/openbay/addorderinfo&token=4a305028ecf3734497729bad4c22b930&order_id=1228&status_id='+status_id,
                type: 'post',
                dataType: 'html',
                data: $(".openbay-data").serialize()
            });
        }

        $(document).ready(function() {
            changeStatus();
        });

        $('select[name="order_status_id"]').change(function(){ changeStatus(); });
        //--></script></div>
</div>
</body>
</html>