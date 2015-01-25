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

  <section id="sys-notification">
    <div class="container">
      <div id="notification"></div>
    </div>
  </section>

  <section id="columns" class="offcanvas-siderbars">
    <div class="container">
      <div class="wrap-container">
        <div class="row">
          <div id="breadcrumb">
            <ol class="breadcrumb">
              <li><a href="http://demopavothemes.com/pav_floral/index.php?route=common/home">Главная</a></li>
              <li><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=44">Occur in which toil</a></li>
            </ol>
          </div>

          <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12  main-column">
            <div id="content">
              <div class="product-info">
                <div class="row">
                  <div class="col-lg-7 col-sm-6 image-container">
                    <div class="image">
                      <a href="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg" class="colorbox cboxElement">
                        <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-500x375.jpg" title="Occur in which toil" alt="Occur in which toil" id="image" data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg" class="product-image-zoom">
                      </a>
                    </div>
                    <div class="image-additional slide carousel" id="image-additional">
                      <div id="image-additional-carousel" class="carousel-inner">
                        <div class="item active">
                          <a href="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg" title="Occur in which toil" class="" data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg" data-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg">
                            <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-500x375.jpg" style="max-width:114px" title="Occur in which toil" alt="Occur in which toil" data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg" class="product-image-zoom">
                          </a>
                          <a href="http://demopavothemes.com/pav_floral/image/cache/data/demo/product14-600x450.jpg" title="Occur in which toil" class="colorbox cboxElement" data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product14-600x450.jpg" data-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product14-600x450.jpg">
                            <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product14-114x86.jpg" style="max-width:114px" title="Occur in which toil" alt="Occur in which toil" data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product14-600x450.jpg" class="product-image-zoom">
                          </a>
                          <a href="http://demopavothemes.com/pav_floral/image/cache/data/demo/product13-600x450.jpg" title="Occur in which toil" class="colorbox cboxElement" data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product13-600x450.jpg" data-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product13-600x450.jpg">
                            <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product13-114x86.jpg" style="max-width:114px" title="Occur in which toil" alt="Occur in which toil" data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product13-600x450.jpg" class="product-image-zoom">
                          </a>
                          <a href="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg" title="Occur in which toil" class="colorbox cboxElement" data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg" data-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg">
                            <img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-114x86.jpg" style="max-width:114px" title="Occur in which toil" alt="Occur in which toil" data-zoom-image="http://demopavothemes.com/pav_floral/image/cache/data/demo/product12-600x450.jpg" class="product-image-zoom">
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
                      <div><img src="../webres/image/stars-5.png" alt="1 reviews">&nbsp;&nbsp;
                        <a onclick="$('a[href=\'#tab-review\']').trigger('click');">1 отзыв</a>
                        &nbsp;&nbsp;|&nbsp;&nbsp;
                        <a onclick="$('a[href=\'#tab-review\']').trigger('click');">Написать отзыв</a>
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
                  <a href="#tab-review" style="display: inline;">Отзывы <span style="color:#666;font-size:.85em">10</span></a>
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
                      <div class="rating"><img src="../webres/image/stars-5.png" alt="1 reviews"></div>
                      <div class="text">Text </div>
                    </div>
                    <div class="pagination">
                      <div class="results">Showing 1 to 1 of 1 (1 Pages)</div>
                    </div>
                  </div>
                  <h2 id="review-title">Оставьте отзыв о товаре</h2>
                  <b>Ваше имя:</b><br>
                  <input type="text" name="name" value="">
                  <br>
                  <br>
                  <b>Электронная почта:</b><br>
                  <input type="text" name="email" value="">
                  <br>
                  <br>
                  <b>Комментарий:</b>
                  <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
                  <br>
                  <br>
                  <b>Оцените товар:</b> <span>Плохо</span>&nbsp;
                  <input type="radio" name="rating" value="1">
                  &nbsp;
                  <input type="radio" name="rating" value="2">
                  &nbsp;
                  <input type="radio" name="rating" value="3">
                  &nbsp;
                  <input type="radio" name="rating" value="4">
                  &nbsp;
                  <input type="radio" name="rating" value="5">
                  &nbsp;<span>Хорошо</span><br>
                  <br>
                  <b>Подтвердите что Вы не робот:</b><br> <br>
                  <img src="index.php?route=product/product/captcha" alt="" id="captcha">
                  <br>
                  <br>
                  <input type="text" name="captcha" value="">
                  <br>
                  <br>
                  <div class="" style="text-align:right">
                    <button class="btn btn-shopping-cart" id="button-review">
                      <span class="fa fa-check"></span>
                      <span>Добавить</span>
                    </button>
                  </div>
                </div>
              </div>
              <div class="product-related box">
                <div class="box-heading">
                  <span>Похожие товары</span>
                </div>
                <div id="related" class="slide product-grid" data-interval="0">
                  <div class="carousel-controls">
                    <a class="carousel-control left icon-angle-left" href="#related" data-slide="prev"></a>
                    <a class="carousel-control right icon-angle-right" href="#related" data-slide="next"></a>
                  </div>
                  <div class="products-block carousel-inner">
                    <div class="item active">
                      <div class="row">
                        <div class="col-xs-6 col-lg-3 col-md-3 col-sm-3">
                          <div class=" product-block">
                            <div class="image">
                              <a id="colorbox_42" class="product-zoom cboxElement" href="http://demopavothemes.com/pav_floral/image/data/demo/product01.jpg" title="Adipisicing elit sed"><span class="fa fa-search-plus"></span></a>
                              <script type="text/javascript">
                                $(document).ready(function() {
                                  var id = 42;
                                  $('#colorbox_' + id).colorbox({
                                    overlayClose: true,
                                    opacity: 0.5
                                  });
                                });
                              </script>

                              <div class="image_container">
                                <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=42" class="img front"><img src="http://demopavothemes.com/pav_floral/image/cache/data/demo/product01-300x225.jpg" title="Adipisicing elit sed" alt="Adipisicing elit sed" class="img-responsive"></a>
                              </div>
                              <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=42"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                              <div class="img-overlay"></div>
                            </div>
                            <div class="name">
                              <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=42">Adipisicing elit sed</a>
                            </div>
                            <div class="group-item">
                              <div class="rating"><img src="../webres/image/stars-5.png" alt="1 reviews"></div>
                              <div class="price-cart">
                                <div class="price">
                                  <span class="price-old">119.50 грн.</span> <span class="price-new">107.75 грн.</span>
                                </div>
                                <div class="cart">
                                  <button class="button" onclick="addToCart('43');">
                                    <span class="fa fa-shopping-cart icon"></span>
                                    <span>Купить</span>
                                  </button>
                                </div>
                              </div>
                            </div>
                            <div class="wishlist-compare">
                              <a class="wishlist" onclick="addToWishList('42');" title="Add to Wish List">Add to Wish List</a>
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
          <div class="col-lg-3 col-md-3 offcanvas-sidebar" id="oc-column-right">
            <div id="column-right" class="sidebar">
              <div class="box category">
                <div class="box-heading">
                  <span>Категории</span></div>
                <div class="box-content">
                  <ul class="box-category">
                    <li class="haschild">
                      <a href="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=20"><i class="fa fa-asterisk"></i>Desktops <span class="badge">(13)</span></a>
                      <div class="head pull-right"><a href="javascript:void(0);" class="fa fa-plus"></a></div>
                      <ul>
                        <li>
                          <a href="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=20_26"> PC <span class="badge pull-right">(0)</span></a>
                        </li>
                        <li>
                          <a href="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=20_27"> Mac <span class="badge pull-right">(1)</span></a>
                        </li>
                      </ul>
                    </li>
                    <li class="haschild">
                      <a href="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=18"><i class="fa fa-asterisk"></i>Laptops &amp; Notebooks <span class="badge">(5)</span></a>
                      <div class="head pull-right"><a href="javascript:void(0);" class="fa fa-plus"></a></div>
                      <ul>
                        <li>
                          <a href="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=18_46"> Macs <span class="badge pull-right">(0)</span></a>
                        </li>
                        <li>
                          <a href="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=18_45"> Windows <span class="badge pull-right">(0)</span></a>
                        </li>
                      </ul>
                    </li>
                    <li class="haschild">
                      <a href="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=25"><i class="fa fa-asterisk"></i>Components <span class="badge">(2)</span></a>
                      <div class="head pull-right"><a href="javascript:void(0);" class="fa fa-plus"></a></div>
                      <ul>
                        <li>
                          <a href="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=25_29"> Mice and Trackballs <span class="badge pull-right">(0)</span></a>
                        </li>
                        <li>
                          <a href="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=25_28"> Monitors <span class="badge pull-right">(2)</span></a>
                        </li>
                        <li>
                          <a href="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=25_30"> Printers <span class="badge pull-right">(0)</span></a>
                        </li>
                        <li>
                          <a href="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=25_31"> Scanners <span class="badge pull-right">(0)</span></a>
                        </li>
                        <li>
                          <a href="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=25_32"> Web Cameras <span class="badge pull-right">(0)</span></a>
                        </li>
                      </ul>
                    </li>
                    <li class="">
                      <a href="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=57"><i class="fa fa-asterisk"></i>Tablets <span class="badge">(1)</span></a>
                    </li>
                    <li class="">
                      <a href="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=17"><i class="fa fa-asterisk"></i>Software <span class="badge">(0)</span></a>
                    </li>
                    <li class="">
                      <a href="http://demopavothemes.com/pav_floral/index.php?route=product/category&amp;path=33"><i class="fa fa-asterisk"></i>Cameras <span class="badge">(2)</span></a>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="box box-product special">
                <div class="box-heading"><span>Рекомендуем</span></div>
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
                          <div class="rating"><img src="../webres/image/stars-4.png" alt="Based on 1 reviews."></div>
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
                          <div class="rating"><img src="../webres/image/stars-4.png" alt="Based on 1 reviews."></div>
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