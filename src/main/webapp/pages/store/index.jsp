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
            $('#productcarousel415422').carousel({interval:5000,auto:true,pause:'hover'});
            $('#productcarousel2be500').carousel({interval:7000,auto:true,pause:'hover'});
            $('#productcarousel8cd118').carousel({interval:9000,auto:true,pause:'hover'});
            $('#pavtestimonial72').carousel({interval:8000,auto:true,pause:'hover'});

            $('.colorbox-t').colorbox({iframe:true, innerWidth:640, innerHeight:390});

            $('.colorbox').colorbox({
                overlayClose: true,
                opacity: 0.5,
                rel: false,
                onLoad:function(){
                    $("#cboxNext").remove(0);
                    $("#cboxPrevious").remove(0);
                    $("#cboxCurrent").remove(0);
                }
            });
            $('.pav-colorbox').colorbox({
                width: '800px',
                height: '550px',
                overlayClose: true,
                opacity: 0.5,
                iframe: true
            });
        })
    </script>
</head>
<body id="offcanvas-container" class="nokeep-header offcanvas-container layout-fullwidth fs12 page-home " data-twttr-rendered="true">
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

    <section class="pav-showcase" id="pavo-showcase">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="box-product vertical box productcarousel">
                        <div class="box-heading">
                            <span>Популярные товары</span>
                        </div>
                        <div class="box-content">
                            <div class="box-products slide" id="productcarousel415422">
                                <div class="carousel-controls">
                                    <a class="carousel-control left" href="#productcarousel415422" data-slide="prev">‹</a>
                                    <a class="carousel-control right" href="#productcarousel415422" data-slide="next">›</a>
                                </div>
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <div class="row box-product">
                                            <div class="col-lg-12 col-sm-12 col-xs-12 ">
                                                <div class="product-block">
                                                    <div class="image">
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=43" class="img front">
                                                                <img src="../../webres/store/image/cache/data/demo/product10-480x360.jpg" title="Nemo enim ipsam" alt="Nemo enim ipsam" class="img-responsive">
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=43">Nemo enim ipsam</a></div>
                                                        <div class="rating"><img src="../../webres/store/image/stars-5.png" alt="text_reviews"></div>
                                                        <div class="description">Intel Core 2 Duo processor Powered by an Intel Core 2...</div>
                                                        <div class="price">$589.50</div>
                                                        <div class="cart">
                                                            <button class="btn btn-shopping-cart">
                                                                <span class="fa fa-shopping-cart icon"></span> Купить
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row box-product">
                                            <div class="col-lg-12 col-sm-12 col-xs-12 ">
                                                <div class="product-block">
                                                    <div class="image">
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=40" class="img front">
                                                                <img src="../../webres/store/image/cache/data/demo/product06-480x360.jpg" title="Expound the actua" alt="Expound the actua" class="img-responsive">
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=40">Expound the actua</a></div>
                                                        <div class="rating"><img src="../../webres/store/image/stars-4.png" alt="text_reviews"></div>
                                                        <div class="description">iPhone is a revolutionary new mobile phone that allows ...</div>
                                                        <div class="price">$120.68</div>
                                                        <div class="cart">
                                                            <button class="btn btn-shopping-cart">
                                                                <span class="fa fa-shopping-cart icon"></span> Купить
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="row box-product">
                                            <div class="col-lg-12 col-sm-12 col-xs-12">
                                                <div class="product-block">
                                                    <div class="image">
                                                        <span class="product-label-special label">Распродажа</span>
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=42" class="img front">
                                                                <img src="../../webres/store/image/cache/data/demo/product01-480x360.jpg" title="Adipisicing elit sed" alt="Adipisicing elit sed" class="img-responsive">
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=42">Adipisicing elit sed</a></div>
                                                        <div class="rating"><img src="../../webres/store/image/stars-4.png" alt="text_reviews"></div>
                                                        <div class="description">The 30-inch Apple Cinema HD Display delivers an amazing...</div>
                                                        <div class="price">
                                                            <span class="price-old">$119.50</span>
                                                            <span class="price-new">$107.75</span>
                                                        </div>
                                                        <div class="cart">
                                                            <button class="btn btn-shopping-cart">
                                                                <span class="fa fa-shopping-cart icon"></span> Купить
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row box-product">
                                            <div class="col-lg-12 col-sm-12 col-xs-12">
                                                <div class="product-block">
                                                    <div class="image ">
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=49" class="img front">
                                                                <img src="../../webres/store/image/cache/data/demo/product17-480x360.jpg" title="The master-builder" alt="The master-builder" class="img-responsive">
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=49">The master-builder</a></div>
                                                        <div class="rating"><img src="../../webres/store/image/stars-4.png" alt="text_reviews"></div>
                                                        <div class="description">Samsung Galaxy Tab 10.1, is the world’s thinnest tablet, m...</div>
                                                        <div class="price">$236.99</div>
                                                        <div class="cart">
                                                            <button class="btn btn-shopping-cart">
                                                                <span class="fa fa-shopping-cart icon"></span> Купить
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="row box-product">
                                            <div class="col-lg-12 col-sm-12 col-xs-12">
                                                <div class="product-block">
                                                    <div class="image ">
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=46" class="img front">
                                                                <img src="../../webres/store/image/cache/data/demo/product19-480x360.jpg" title="Voluptate velit esse" alt="Voluptate velit esse" class="img-responsive">
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=46">Voluptate velit esse</a></div>
                                                        <div class="rating"><img src="../../webres/store/image/stars-5.png" alt="text_reviews"></div>
                                                        <div class="description">Unprecedented power. The next generation of processing tec...</div>
                                                        <div class="price">$1,177.00</div>
                                                        <div class="cart">
                                                            <button class="btn btn-shopping-cart">
                                                                <span class="fa fa-shopping-cart icon"></span> Купить
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row box-product">
                                            <div class="col-lg-12 col-sm-12 col-xs-12">
                                                <div class="product-block">
                                                    <div class="image ">
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=47" class="img front">
                                                                <img src="../../webres/store/image/cache/data/demo/product03-480x360.jpg" title="Dolorem eum fugiat" alt="Dolorem eum fugiat" class="img-responsive">
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=47">Dolorem eum fugiat</a></div>
                                                        <div class="rating"><img src="../../webres/store/image/stars-4.png" alt="text_reviews"></div>
                                                        <div class="description">Stop your co-workers in their tracks with the stunning new...</div>
                                                        <div class="price">$119.50</div>
                                                        <div class="cart">
                                                            <button class="btn btn-shopping-cart">
                                                                <span class="fa fa-shopping-cart icon"></span> Купить
                                                            </button>
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

                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="box-product pink horizontal box productcarousel">
                        <div class="box-heading">
                            <span>Скидки</span>
                        </div>
                        <div class="box-content">
                            <div class="box-products slide" id="productcarousel2be500">
                                <div class="carousel-controls">
                                    <a class="carousel-control left" href="#productcarousel2be500" data-slide="prev">‹</a>
                                    <a class="carousel-control right" href="#productcarousel2be500" data-slide="next">›</a>
                                </div>
                                <div class="carousel-inner">
                                    <div class="item">
                                        <div class="row box-product">
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <div class="product-block">
                                                    <div class="image ">
                                                        <span class="product-label-special label">Распродажа</span>
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=42" class="img front">
                                                                <img src="../../webres/store/image/cache/data/demo/product01-480x360.jpg" title="Adipisicing elit sed" alt="Adipisicing elit sed" class="img-responsive">
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=42">Adipisicing elit sed</a></div>
                                                        <div class="rating"><img src="../../webres/store/image/stars-4.png" alt="text_reviews"></div>
                                                        <div class="description">The 30-inch Apple Cinema HD Display delivers an amazing...</div>
                                                        <div class="price">
                                                            <span class="price-old">$119.50</span>
                                                            <span class="price-new">$107.75</span>
                                                        </div>
                                                        <div class="cart">
                                                            <button class="btn btn-shopping-cart">
                                                                <span class="fa fa-shopping-cart icon"></span> Купить
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <div class="product-block">
                                                    <div class="image ">
                                                        <span class="product-label-special label">Sale</span>
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=30" class="img front">
                                                                <img src="../../webres/store/image/cache/data/demo/product02-480x360.jpg" title="Dignissimos ducimus" alt="Dignissimos ducimus" class="img-responsive">
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=30">Dignissimos ducimus</a></div>
                                                        <div class="rating"><img src="../../webres/store/image/stars-5.png" alt="text_reviews"></div>
                                                        <div class="description">Canon's press material for the EOS 5D states that it 'defi...</div>
                                                        <div class="price">
                                                            <span class="price-old">$119.50</span>
                                                            <span class="price-new">$96.00</span>
                                                        </div>
                                                        <div class="cart">
                                                            <button class="btn btn-shopping-cart">
                                                                <span class="fa fa-shopping-cart icon"></span> Купить
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="row box-product">
                                            <div class="col-md-6 col-sm-6 col-xs-12 ">
                                                <div class="product-block">
                                                    <div class="image ">
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=43" class="img front">
                                                                <img src="../../webres/store/image/cache/data/demo/product10-480x360.jpg" title="Nemo enim ipsam" alt="Nemo enim ipsam" class="img-responsive">
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=43">Nemo enim ipsam</a></div>
                                                        <div class="rating"><img src="../../webres/store/image/stars-5.png" alt="text_reviews"></div>
                                                        <div class="description">Intel Core 2 Duo processor Powered by an Intel Core 2...</div>
                                                        <div class="price">$589.50</div>
                                                        <div class="cart">
                                                            <button class="btn btn-shopping-cart">
                                                                <span class="fa fa-shopping-cart icon"></span> Купить
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 ">
                                                <div class="product-block">
                                                    <div class="image ">
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=47" class="img front">
                                                                <img src="../../webres/store/image/cache/data/demo/product03-480x360.jpg" title="Dolorem eum fugiat" alt="Dolorem eum fugiat" class="img-responsive">
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=47">Dolorem eum fugiat</a></div>
                                                        <div class="rating"><img src="../../webres/store/image/stars-4.png" alt="text_reviews"></div>
                                                        <div class="description">Stop your co-workers in their tracks with the stunning new...</div>
                                                        <div class="price">$119.50</div>
                                                        <div class="cart">
                                                            <button class="btn btn-shopping-cart">
                                                                <span class="fa fa-shopping-cart icon"></span> Купить
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item active">
                                        <div class="row box-product">
                                            <div class="col-md-6 col-sm-6 col-xs-12 ">
                                                <div class="product-block">
                                                    <div class="image">
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=46" class="img front">
                                                                <img src="../../webres/store/image/cache/data/demo/product19-480x360.jpg" title="Voluptate velit esse" alt="Voluptate velit esse" class="img-responsive">
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=46">Voluptate velit esse</a></div>
                                                        <div class="rating"><img src="../../webres/store/image/stars-5.png" alt="text_reviews"></div>
                                                        <div class="description">Unprecedented power. The next generation of processing tec...</div>
                                                        <div class="price">$1,177.00</div>
                                                        <div class="cart">
                                                            <button class="btn btn-shopping-cart">
                                                                <span class="fa fa-shopping-cart icon"></span> Купить
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-12 ">
                                                <div class="product-block">
                                                    <div class="image">
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=44" class="img front">
                                                                <img src="../../webres/store/image/cache/data/demo/product12-480x360.jpg" title="Occur in which toil" alt="Occur in which toil" class="img-responsive">
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=44">Occur in which toil</a></div>
                                                        <div class="rating"><img src="../../webres/store/image/stars-5.png" alt="text_reviews"></div>
                                                        <div class="description">MacBook Air is ultrathin, ultraportable, and ultra unli...</div>
                                                        <div class="price">$1,177.00</div>
                                                        <div class="cart">
                                                            <button class="btn btn-shopping-cart">
                                                                <span class="fa fa-shopping-cart icon"></span> Купить
                                                            </button>
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

    <section id="columns" class="offcanvas-siderbars">
        <div class="container">
            <div class="wrap-container">
                <div class="row">
                    <section class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div id="content">
                            <div class="content-top">
                                <div class="box pav-custom">
                                    <div class="box-content">
                                        <p><img alt="" src="../../webres/store/image/data/adv.png" style="display: none !important;"></p>
                                    </div>
                                </div>
                                <div class="box-product yellow horizontal box productcarousel">
                                    <div class="box-heading"><span>Новинки</span></div>
                                    <div class="box-content">
                                        <div class="box-products slide" id="productcarousel8cd118">
                                            <div class="carousel-controls">
                                                <a class="carousel-control left" href="#productcarousel8cd118" data-slide="prev">‹</a>
                                                <a class="carousel-control right" href="#productcarousel8cd118" data-slide="next">›</a>
                                            </div>
                                            <div class="carousel-inner">
                                                <div class="item active">
                                                    <div class="row box-product">
                                                        <div class="col-lg-3 col-sm-3 col-xs-12 ">
                                                            <div class="product-block">
                                                                <div class="image">
                                                                    <div class="image_container">
                                                                        <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=49" class="img front">
                                                                            <img src="../../webres/store/image/cache/data/demo/product17-480x360.jpg" title="The master-builder" alt="The master-builder" class="img-responsive">
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <div class="product-meta">
                                                                    <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=49">The master-builder</a></div>
                                                                    <div class="rating"><img src="../../webres/store/image/stars-4.png" alt="text_reviews"></div>
                                                                    <div class="description">Samsung Galaxy Tab 10.1, is the world’s thinnest tablet, m...</div>
                                                                    <div class="price">$236.99</div>
                                                                    <div class="cart">
                                                                        <button class="btn btn-shopping-cart">
                                                                            <span class="fa fa-shopping-cart icon"></span> Купить
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-sm-3 col-xs-12 ">
                                                            <div class="product-block">
                                                                <div class="image ">
                                                                    <div class="image_container">
                                                                        <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=48" class="img front">
                                                                            <img src="../../webres/store/image/cache/data/demo/product07-480x360.jpg" title="Lorem ipsum dolor" alt="Lorem ipsum dolor" class="img-responsive">
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <div class="product-meta">
                                                                    <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=48">Lorem ipsum dolor</a></div>
                                                                    <div class="rating"><img src="../../webres/store/image/stars-5.png" alt="text_reviews"></div>
                                                                    <div class="description">More room to move.With 80GB or 160GB ...</div>
                                                                    <div class="price">$119.50</div>
                                                                    <div class="cart">
                                                                        <button class="btn btn-shopping-cart">
                                                                            <span class="fa fa-shopping-cart icon"></span> Купить
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-sm-3 col-xs-12 ">
                                                            <div class="product-block">
                                                                <div class="image ">
                                                                    <div class="image_container">
                                                                        <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=47" class="img front">
                                                                            <img src="../../webres/store/image/cache/data/demo/product03-480x360.jpg" title="Dolorem eum fugiat" alt="Dolorem eum fugiat" class="img-responsive">
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <div class="product-meta">
                                                                    <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=47">Dolorem eum fugiat</a></div>
                                                                    <div class="rating"><img src="../../webres/store/image/stars-4.png" alt="text_reviews"></div>
                                                                    <div class="description">Stop your co-workers in their tracks with the stunning new...</div>
                                                                    <div class="price">$119.50</div>
                                                                    <div class="cart">
                                                                        <button class="btn btn-shopping-cart">
                                                                            <span class="fa fa-shopping-cart icon"></span> Купить
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-sm-3 col-xs-12 ">
                                                            <div class="product-block">
                                                                <div class="image">
                                                                    <div class="image_container">
                                                                        <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=46" class="img front">
                                                                            <img src="../../webres/store/image/cache/data/demo/product19-480x360.jpg" title="Voluptate velit esse" alt="Voluptate velit esse" class="img-responsive">
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <div class="product-meta">
                                                                    <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=46">Voluptate velit esse</a></div>
                                                                    <div class="rating"><img src="../../webres/store/image/stars-5.png" alt="text_reviews"></div>
                                                                    <div class="description">Unprecedented power. The next generation of processing tec...</div>
                                                                    <div class="price">$1,177.00</div>
                                                                    <div class="cart">
                                                                        <button class="btn btn-shopping-cart">
                                                                            <span class="fa fa-shopping-cart icon"></span> Купить
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <div class="row box-product">
                                                        <div class="col-lg-3 col-sm-3 col-xs-12 ">
                                                            <div class="product-block">
                                                                <div class="image ">
                                                                    <div class="image_container">
                                                                        <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=45" class="img front">
                                                                            <img src="../../webres/store/image/cache/data/demo/product13-480x360.jpg" title="Pursue pleasure rationally" alt="Pursue pleasure rationally" class="img-responsive">
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <div class="product-meta">
                                                                    <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=45">Pursue pleasure rationally</a></div>
                                                                    <div class="rating"><img src="../../webres/store/image/stars-4.png" alt="text_reviews"></div>
                                                                    <div class="description">Latest Intel mobile architecture Power...</div>
                                                                    <div class="price">$2,000.00</div>
                                                                    <div class="cart">
                                                                        <button class="btn btn-shopping-cart">
                                                                            <span class="fa fa-shopping-cart icon"></span> Купить
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-sm-3 col-xs-12 ">
                                                            <div class="product-block">
                                                                <div class="image ">
                                                                    <div class="image_container">
                                                                        <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=45" class="img front">
                                                                            <img src="../../webres/store/image/cache/data/demo/product13-480x360.jpg" title="Pursue pleasure rationally" alt="Pursue pleasure rationally" class="img-responsive">
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <div class="product-meta">
                                                                    <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=45">Pursue pleasure rationally</a></div>
                                                                    <div class="rating"><img src="../../webres/store/image/stars-4.png" alt="text_reviews"></div>
                                                                    <div class="description">Latest Intel mobile architecture Power...</div>
                                                                    <div class="price">$2,000.00</div>
                                                                    <div class="cart">
                                                                        <button class="btn btn-shopping-cart">
                                                                            <span class="fa fa-shopping-cart icon"></span> Купить
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-sm-3 col-xs-12 ">
                                                            <div class="product-block">
                                                                <div class="image ">
                                                                    <div class="image_container">
                                                                        <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=45" class="img front">
                                                                            <img src="../../webres/store/image/cache/data/demo/product13-480x360.jpg" title="Pursue pleasure rationally" alt="Pursue pleasure rationally" class="img-responsive">
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <div class="product-meta">
                                                                    <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=45">Pursue pleasure rationally</a></div>
                                                                    <div class="rating"><img src="../../webres/store/image/stars-4.png" alt="text_reviews"></div>
                                                                    <div class="description">Latest Intel mobile architecture Power...</div>
                                                                    <div class="price">$2,000.00</div>
                                                                    <div class="cart">
                                                                        <button class="btn btn-shopping-cart">
                                                                            <span class="fa fa-shopping-cart icon"></span> Купить
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-lg-3 col-sm-3 col-xs-12 ">
                                                            <div class="product-block">
                                                                <div class="image ">
                                                                    <div class="image_container">
                                                                        <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=45" class="img front">
                                                                            <img src="../../webres/store/image/cache/data/demo/product13-480x360.jpg" title="Pursue pleasure rationally" alt="Pursue pleasure rationally" class="img-responsive">
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <div class="product-meta">
                                                                    <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=45">Pursue pleasure rationally</a></div>
                                                                    <div class="rating"><img src="../../webres/store/image/stars-4.png" alt="text_reviews"></div>
                                                                    <div class="description">Latest Intel mobile architecture Power...</div>
                                                                    <div class="price">$2,000.00</div>
                                                                    <div class="cart">
                                                                        <button class="btn btn-shopping-cart">
                                                                            <span class="fa fa-shopping-cart icon"></span> Купить
                                                                        </button>
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
                </div>
            </div>
        </div>
    </section>
    <%@include file="includes/footer.jsp"%>
</section>
<%@include file="includes/sidebarmenu.jsp"%>
</body>
</html>