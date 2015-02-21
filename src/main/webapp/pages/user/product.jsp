<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Floral Store</title>
    <meta name="description" content="My Store">

    <%@include file="includes/head.jsp"%>

    <script type="text/javascript">
        $(function(){
            $('#image-additional .item:first').addClass('active');
            $('#image-additional').carousel({interval:false});

            $("#image").elevateZoom( {  gallery:'image-additional-carousel',
                cursor: 'pointer',
                galleryActiveClass: 'active' } );

            if ($.browser.msie && $.browser.version == 6) {
                $('.date, .datetime, .time').bgIframe();
            }

            $('.date').datepicker({dateFormat: 'yy-mm-dd'});
            $('.datetime').datetimepicker({
                dateFormat: 'yy-mm-dd',
                timeFormat: 'h:m'
            });
            $('.time').timepicker({timeFormat: 'h:m'});

            var activeCat = '.box-category li a.active';
            if($(activeCat).length > 0){
                $(activeCat).parent('li').find('ul').show();
                $(activeCat).parent('li').find('a.fa').toggleClass('aToggle');
                $(activeCat).parent('li').find('a.fa').toggleClass('fa-minus');
            }
            $('.head a').click(function(){
                $('.head a').removeClass('aToggle');
                $('.head a').removeClass('fa-minus');
                var ul = $(this).parent('div').parent('li').find('ul');
                if(!ul.is(':visible')){
                    $('.box-category ul li > ul').slideUp();
                    $(this).toggleClass('aToggle');
                    $(this).toggleClass('fa-minus');
                }else{
                    $(this).removeClass('aToggle');
                    $(this).removeClass('fa-minus');
                }
                ul.stop(true,true).slideToggle();
            });


            $('#tabs a').tabs();

            $('#review .pagination a').live('click', function() {
                $('#review').fadeOut('slow');

                $('#review').load(this.href);

                $('#review').fadeIn('slow');

                return false;
            });

            $('#review').load('index.php?route=product/product/review&product_id=44');

            $('#button-review').bind('click', function() {
                $.ajax({
                    url: 'index.php?route=product/product/write&product_id=44',
                    type: 'post',
                    dataType: 'json',
                    data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
                    beforeSend: function() {
                        $('.success, .warning').remove();
                        $('#button-review').attr('disabled', true);
                        $('#review-title').after('<div class="attention"><img src="..webres/image/loading.gif" alt="" /> Please Wait!</div>');
                    },
                    complete: function() {
                        $('#button-review').attr('disabled', false);
                        $('.attention').remove();
                    },
                    success: function(data) {
                        if (data['error']) {
                            $('#review-title').after('<div class="warning">' + data['error'] + '</div>');
                        }

                        if (data['success']) {
                            $('#review-title').after('<div class="success">' + data['success'] + '</div>');

                            $('input[name=\'name\']').val('');
                            $('textarea[name=\'text\']').val('');
                            $('input[name=\'rating\']:checked').attr('checked', '');
                            $('input[name=\'captcha\']').val('');
                        }
                    }
                });
            });

            $('select[name="profile_id"], input[name="quantity"]').change(function(){
                $.ajax({
                    url: 'index.php?route=product/product/getRecurringDescription',
                    type: 'post',
                    data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
                    dataType: 'json',
                    beforeSend: function() {
                        $('#profile-description').html('');
                    },
                    success: function(json) {
                        $('.success, .warning, .attention, information, .error').remove();

                        if (json['success']) {
                            $('#profile-description').html(json['success']);
                        }
                    }
                });
            });

            $('#button-cart').bind('click', function() {
                $.ajax({
                    url: 'index.php?route=checkout/cart/add',
                    type: 'post',
                    data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
                    dataType: 'json',
                    success: function(json) {
                        $('.success, .warning, .attention, information, .error').remove();

                        if (json['error']) {
                            if (json['error']['option']) {
                                for (i in json['error']['option']) {
                                    $('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
                                }
                            }

                            if (json['error']['profile']) {
                                $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                            }
                        }

                        if (json['success']) {
                            $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="..webres/image/close.png" alt="" class="close" /></div>');

                            $('.success').fadeIn('slow');

                            $('#cart-total').html(json['total']);

                            $('html, body').animate({ scrollTop: 0 }, 'slow');
                        }
                    }
                });
            });

            $('div.product-rating').rating();
        });



    </script>

</head>
<body id="offcanvas-container" class="nokeep-header offcanvas-container layout-fullwidth fs12 page-product" data-twttr-rendered="true">
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

    <section id="columns" class="offcanvas-siderbars">
        <div class="container">
            <div class="wrap-container">
                <div class="row">
                    <div id="breadcrumb">
                        <div>
                            <ol class="breadcrumb" style="margin: 0; padding: 0;">
                                <li><a href="/">Главная</a></li>
                                <li><a href="/">Категория</a></li>
                                <li><a href="/">Подкатегория</a></li>
                            </ol>
                        </div>
                    </div>

                    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12  main-column" style="padding-top: 15px;">
                        <div id="content">
                            <div class="product-info">
                                <div class="row">
                                    <div class="col-lg-7 col-sm-6 image-container">
                                        <div class="image">
                                            <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-500x375.jpg" id="image"
                                                 data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg" class="product-image-zoom">
                                        </div>
                                        <div class="image-additional slide carousel" id="image-additional">
                                            <div id="image-additional-carousel" class="carousel-inner">
                                                <div class="item active">
                                                    <a href="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg"
                                                       data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg"
                                                       data-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg">
                                                        <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-500x375.jpg" style="max-width:114px"
                                                             data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg" class="product-image-zoom">
                                                    </a>
                                                    <a href="http://demopavothemes.com/pav_floral/image/cache/data/demo/product14-600x450.jpg"
                                                       data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product14-600x450.jpg"
                                                       data-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product14-600x450.jpg">
                                                        <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product14-114x86.jpg" style="max-width:114px"
                                                             data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product14-600x450.jpg" class="product-image-zoom">
                                                    </a>
                                                    <a href="http://demopavothemes.com/pav_floral/image/cache/data/demo/product13-600x450.jpg"
                                                       data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product13-600x450.jpg"
                                                       data-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product13-600x450.jpg">
                                                        <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product13-114x86.jpg" style="max-width:114px"
                                                             data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product13-600x450.jpg" class="product-image-zoom">
                                                    </a>
                                                    <a href="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg"
                                                       data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg"
                                                       data-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg">
                                                        <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-114x86.jpg" style="max-width:114px"
                                                             data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg" class="product-image-zoom">
                                                    </a>
                                                </div>
                                            </div>
                                            <a class="carousel-control left" href="#image-additional" data-slide="prev">‹</a>
                                            <a class="carousel-control right" href="#image-additional" data-slide="next">›</a>
                                        </div>
                                    </div>
                                    <div class="col-lg-5 col-sm-6">
                                        <h1>Occur in which toil</h1>
                                        <div class="review">
                                            <div><img src="../../webres/image/stars-5.png" alt="1 reviews">&nbsp;&nbsp;
                                                <a onclick="$('a[href=\'#tab-review\']').trigger('click');">1 отзыв</a>
                                            </div>
                                        </div>
                                        <span style="color: green; margin-left: 5px;"><strong><em>Есть в наличии</em></strong></span><br>
                                        <div class="description">
                                            <span>Код товара: </span>Product 17<br>
                                            <span>Производитель: </span>BK Toys<br>
                                            <span>Страна: </span>Китай<br>
                                            <span>Возраст ребенка: </span>3-5<br>
                                            <span>Пол ребенка: </span>унисекс<br>
                                            <span>Материал: </span>пластмасса<br>
                                            <span>Размер: </span>33/22/16
                                        </div>

                                        <div class="price-cart">
                                            <div class="product-extra">
                                                <div class="price pull-left">62 999 грн.</div>
                                                <div class="pull-left" style="margin-left: 5px;">
                                                    <div class="pull-left">
                                                        <button class="btn btn-shopping-cart" id="button-cart">
                                                            <span class="fa fa-shopping-cart"></span>
                                                            <span>Купить</span>
                                                        </button>
                                                    </div>
                                                    <div class="pull-left" style="margin-left: 15px;">
                                                        <button class="btn btn-shopping-cart" id="button-wishlist">
                                                            <span class="fa fa-heart"></span>
                                                            <span>В избранное</span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tabs-group">
                                <div id="tabs" class="htabs clearfix">
                                    <a href="#tab-description" class="selected" style="display: inline;">Описание</a>
                                    <a href="#tab-review" style="display: inline;">Отзывы</a>
                                </div>
                                <div id="tab-description" class="tab-content" style="display: block;">
                                    <div>
                                        MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don’t lose inches and pounds overnight.
                                        It’s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design.
                                        With MacBook Air, mobile computing suddenly has a new standard.
                                    </div>
                                </div>
                                <div id="tab-review" class="tab-content clearfix" style="display: none;">
                                    <div id="review">
                                        <div class="review-list">
                                            <div class="author"><b>pavothemes</b>  on  17/10/2013</div>
                                            <div class="text">Text </div>
                                        </div>
                                        <div class="pagination">
                                            <div class="results">Showing 1 to 1 of 1 (1 Pages)</div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-sm-12 col-xs-12" style="padding-left: 0; padding-right: 0;">
                                        <div class="inner">
                                            <h2>Оставьте отзыв о товаре</h2>
                                            <form action="<c:url value=""/>" method="post">
                                                <fieldset>
                                                    <div class="form-group">
                                                        <input name="name" placeholder="Ваше имя" style="width: 50%;" class="form-control" type="text" required="true">
                                                    </div>
                                                    <div class="form-group">
                                                        <input name="email" placeholder="E-mail" style="width: 50%;"  class="form-control" type="email" required="true">
                                                    </div>
                                                    <div class="form-group">
                                                        <textarea required name="comment" placeholder="Ваш комментарий"  style="width: 50%; height: 140px;"></textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <b>Оцените товар по 5-ти бальной шкале</b>
                                                        <div class="product-rating"></div>
                                                    </div>

                                                    <div class="form-group">
                                                        <button type="submit" class="btn btn-shopping-cart">
                                                            <span class="fa fa-check"></span> Отправить
                                                        </button>
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 offcanvas-sidebar" id="oc-column-right" style="padding-top: 15px;">
                        <div id="column-right" class="sidebar">
                            <div class="box box-product special">
                                <div class="box-heading"><span>Похожие товары</span></div>
                                <div class="box-content">
                                    <div class="box-product">
                                        <div class="row">
                                            <div class=" col-lg-3">
                                                <div class="product-block">
                                                    <div class="image">
                                                        <div class="product-label-special label">Распродажа</div>
                                                        <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=42"><img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product01-160x120.jpg" title="Adipisicing elit sed" alt="Adipisicing elit sed"></a>
                                                    </div>
                                                    <h3 class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=42">Adipisicing elit sed</a></h3>
                                                    <div class="rating"><img src="../../webres/image/stars-4.png" alt="Based on 1 reviews."></div>
                                                    <div class="price-cart">
                                                        <div class="price">
                                                            <span class="price-old">$119.50</span> <span class="price-new">$107.75</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class=" col-lg-3">
                                                <div class="product-block">
                                                    <div class="image">
                                                        <div class="product-label-special label">Распродажа</div>
                                                        <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=42"><img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product01-160x120.jpg" title="Adipisicing elit sed" alt="Adipisicing elit sed"></a>
                                                    </div>
                                                    <h3 class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=42">Adipisicing elit sed</a></h3>
                                                    <div class="rating"><img src="../../webres/image/stars-4.png" alt="Based on 1 reviews."></div>
                                                    <div class="price-cart">
                                                        <div class="price">
                                                            <span class="price-old">$119.50</span> <span class="price-new">$107.75</span>
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
                </div>
            </div>
        </div>
    </section>
    <%@include file="includes/footer.jsp"%>
</section>
<%@include file="includes/sidebarmenu.jsp"%>
<%@include file="includes/colorbox.jsp"%>
</body>
</html>