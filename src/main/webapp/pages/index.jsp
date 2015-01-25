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
            $('#pavcontentslider8').carousel({interval:8000});
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

    <section id="sys-notification">
        <div class="container">
            <div id="notification"></div>
        </div>
    </section>

    <section id="pav-slideshow" class="pav-slideshow hidden-xs hidden-sm">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 col-md-9 col-sm-9">
                    <div id="pavcontentslider8" class="carousel slide pavcontentslider">
                        <div class="carousel-inner">
                            <div class="item active">
                                <a href="http://pavothemes.com"><img src="../webres/image/cache/data/slide1-873x380.jpg" alt="Amazing pink tulip"></a>
                                <div class="pav-caption slideExpandUp big-caption pink" style="top:85px;left:50px">
                                    Amazing pink tulip
                                </div>
                                <div class="pav-caption expandUp desc" style="top:130px;left:50px">
                                    Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagis sem nibh id elit. Duis sed
                                </div>
                                <div class="pav-caption pullUp detail" style="top:238px;left:50px">
                                    <a href="#" class="button">Подробнее<i class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </div>

                            <div class="item">
                                <a href="http://pavothemes.com"><img src="../webres/image/cache/data/slide2-873x380.jpg" alt="Sed ut perspiciatis "></a>
                                <div class="pav-caption hatch  big-caption purple" style="top:85px;left:50px">
                                    Sed ut perspiciatis
                                </div>
                                <div class="pav-caption expandOpen desc" style="top:130px;left:50px">
                                    Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt
                                </div>
                                <div class="pav-caption bigEntrance detail" style="top:238px;left:50px">
                                    <a href="#" class="button">Подробнее<i class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </div>

                            <div class="item">
                                <a href="http://pavothemes.com"><img src="../webres/image/cache/data/slide3-873x380.jpg" alt="Nam libero tem"></a>
                                <div class="pav-caption pullDown  big-caption white" style="top:85px;left:50px">
                                    Nam libero tem
                                </div>
                                <div class="pav-caption hatch desc white" style="top:130px;left:50px">
                                    At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas
                                </div>
                                <div class="pav-caption expandOpen detail" style="top:238px;left:50px">
                                    <a href="#" class="button">Подробнее<i class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>

                        <a class="carousel-control left " href="#pavcontentslider8" data-slide="prev">‹</a>
                        <a class="carousel-control right" href="#pavcontentslider8" data-slide="next">›</a>

                        <ol class="carousel-indicators">
                            <li data-target="#pavcontentslider8" data-slide-to="0" class="active"></li>
                            <li data-target="#pavcontentslider8" data-slide-to="1" class=""></li>
                            <li data-target="#pavcontentslider8" data-slide-to="2" class=""></li>
                        </ol>
                    </div>
                </div>

                <div class="col-lg-3 col-md-3 col-sm-3">
                    <div class="box pav-custom">
                        <div class="box-content">
                            <p style="margin-bottom:20px"><img alt="" src="../webres/image/data/adv2.jpg" style="display: none !important;"></p>
                            <p style=""><img alt="" src="../webres/image/data/adv3.jpg" style="display: none !important;"></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="pav-showcase" id="pavo-showcase">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="box-product vertical box productcarousel">
                        <div class="box-heading">
                            <span>Рекомендуемые</span>
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
                                                                <img src="../webres/image/cache/data/demo/product10-480x360.jpg" title="Nemo enim ipsam" alt="Nemo enim ipsam" class="img-responsive">
                                                            </a>
                                                        </div>
                                                        <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=43"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                        <div class="img-overlay"></div>
                                                    </div>

                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=43">Nemo enim ipsam</a></div>
                                                        <div class="rating"><img src="../webres/image/stars-5.png" alt="text_reviews"></div>
                                                        <div class="description">Intel Core 2 Duo processor Powered by an Intel Core 2...</div>
                                                        <div class="price">$589.50</div>
                                                        <div class="cart">
                                                            <button class="button" onclick="addToCart('43');">
                                                                <span class="fa fa-shopping-cart icon"></span>
                                                                <span>Купить</span>
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
                                                                <img src="../webres/image/cache/data/demo/product06-480x360.jpg" title="Expound the actua" alt="Expound the actua" class="img-responsive">
                                                            </a>
                                                        </div>
                                                        <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=40"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                        <div class="img-overlay"></div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=40">Expound the actua</a></div>
                                                        <div class="rating"><img src="../webres/image/stars-4.png" alt="text_reviews"></div>
                                                        <div class="description">iPhone is a revolutionary new mobile phone that allows ...</div>
                                                        <div class="price">$120.68</div>
                                                        <div class="cart">
                                                            <button class="button" onclick="addToCart('40');">
                                                                <span class="fa fa-shopping-cart icon"></span>
                                                                <span>Купить</span>
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
                                                                <img src="../webres/image/cache/data/demo/product01-480x360.jpg" title="Adipisicing elit sed" alt="Adipisicing elit sed" class="img-responsive">
                                                            </a>
                                                        </div>
                                                        <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=42"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                        <div class="img-overlay"></div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=42">Adipisicing elit sed</a></div>
                                                        <div class="rating"><img src="../webres/image/stars-4.png" alt="text_reviews"></div>
                                                        <div class="description">The 30-inch Apple Cinema HD Display delivers an amazing...</div>
                                                        <div class="price">
                                                            <span class="price-old">$119.50</span>
                                                            <span class="price-new">$107.75</span>
                                                        </div>
                                                        <div class="cart">
                                                            <button class="button" onclick="addToCart('42');">
                                                                <span class="fa fa-shopping-cart icon"></span>
                                                                <span>Купить</span>
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
                                                                <img src="../webres/image/cache/data/demo/product17-480x360.jpg" title="The master-builder" alt="The master-builder" class="img-responsive">
                                                            </a>
                                                        </div>
                                                        <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=49"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                        <div class="img-overlay"></div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=49">The master-builder</a></div>
                                                        <div class="rating"><img src="../webres/image/stars-4.png" alt="text_reviews"></div>
                                                        <div class="description">Samsung Galaxy Tab 10.1, is the world’s thinnest tablet, m...</div>
                                                        <div class="price">$236.99</div>
                                                        <div class="cart">
                                                            <button class="button" onclick="addToCart('49');">
                                                                <span class="fa fa-shopping-cart icon"></span>
                                                                <span>Купить</span>
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
                                                                <img src="../webres/image/cache/data/demo/product19-480x360.jpg" title="Voluptate velit esse" alt="Voluptate velit esse" class="img-responsive">
                                                            </a>
                                                        </div>
                                                        <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=46"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                        <div class="img-overlay"></div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=46">Voluptate velit esse</a></div>
                                                        <div class="rating"><img src="../webres/image/stars-5.png" alt="text_reviews"></div>
                                                        <div class="description">Unprecedented power. The next generation of processing tec...</div>
                                                        <div class="price">$1,177.00</div>
                                                        <div class="cart">
                                                            <button class="button" onclick="addToCart('46');">
                                                                <span class="fa fa-shopping-cart icon"></span>
                                                                <span>Купить</span>
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
                                                                <img src="../webres/image/cache/data/demo/product03-480x360.jpg" title="Dolorem eum fugiat" alt="Dolorem eum fugiat" class="img-responsive">
                                                            </a>
                                                        </div>
                                                        <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=47"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                        <div class="img-overlay"></div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=47">Dolorem eum fugiat</a></div>
                                                        <div class="rating"><img src="../webres/image/stars-4.png" alt="text_reviews"></div>
                                                        <div class="description">Stop your co-workers in their tracks with the stunning new...</div>
                                                        <div class="price">$119.50</div>
                                                        <div class="cart">
                                                            <button class="button" onclick="addToCart('47');">
                                                                <span class="fa fa-shopping-cart icon"></span>
                                                                <span>Купить</span>
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
                            <span>Популярные</span>
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
                                            <div class="col-lg-6 col-sm-6 col-xs-12 ">
                                                <div class="product-block">
                                                    <div class="image ">
                                                        <span class="product-label-special label">Распродажа</span>
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=42" class="img front">
                                                                <img src="../webres/image/cache/data/demo/product01-480x360.jpg" title="Adipisicing elit sed" alt="Adipisicing elit sed" class="img-responsive">
                                                            </a>
                                                        </div>
                                                        <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=42"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                        <div class="img-overlay"></div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=42">Adipisicing elit sed</a></div>
                                                        <div class="rating"><img src="../webres/image/stars-4.png" alt="text_reviews"></div>
                                                        <div class="description">The 30-inch Apple Cinema HD Display delivers an amazing...</div>
                                                        <div class="price">
                                                            <span class="price-old">$119.50</span>
                                                            <span class="price-new">$107.75</span>
                                                        </div>
                                                        <div class="cart">
                                                            <button class="button" onclick="addToCart('42');">
                                                                <span class="fa fa-shopping-cart icon"></span>
                                                                <span>Купить</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-sm-6 col-xs-12 ">
                                                <div class="product-block">
                                                    <div class="image ">
                                                        <span class="product-label-special label">Sale</span>
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=30" class="img front">
                                                                <img src="../webres/image/cache/data/demo/product02-480x360.jpg" title="Dignissimos ducimus" alt="Dignissimos ducimus" class="img-responsive">
                                                            </a>
                                                        </div>
                                                        <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=30"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                        <div class="img-overlay"></div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=30">Dignissimos ducimus</a></div>
                                                        <div class="rating"><img src="../webres/image/stars-5.png" alt="text_reviews"></div>
                                                        <div class="description">Canon's press material for the EOS 5D states that it 'defi...</div>
                                                        <div class="price">
                                                            <span class="price-old">$119.50</span>
                                                            <span class="price-new">$96.00</span>
                                                        </div>
                                                        <div class="cart">
                                                            <button class="button" onclick="addToCart('30');">
                                                                <span class="fa fa-shopping-cart icon"></span>
                                                                <span>Купить</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="row box-product">
                                            <div class="col-lg-6 col-sm-6 col-xs-12 ">
                                                <div class="product-block">
                                                    <div class="image ">
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=43" class="img front">
                                                                <img src="../webres/image/cache/data/demo/product10-480x360.jpg" title="Nemo enim ipsam" alt="Nemo enim ipsam" class="img-responsive">
                                                            </a>
                                                        </div>
                                                        <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=43"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                        <div class="img-overlay"></div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=43">Nemo enim ipsam</a></div>
                                                        <div class="rating"><img src="../webres/image/stars-5.png" alt="text_reviews"></div>
                                                        <div class="description">Intel Core 2 Duo processor Powered by an Intel Core 2...</div>
                                                        <div class="price">$589.50</div>
                                                        <div class="cart">
                                                            <button class="button" onclick="addToCart('43');">
                                                                <span class="fa fa-shopping-cart icon"></span>
                                                                <span>Купить</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-sm-6 col-xs-12 ">
                                                <div class="product-block">
                                                    <div class="image ">
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=47" class="img front">
                                                                <img src="../webres/image/cache/data/demo/product03-480x360.jpg" title="Dolorem eum fugiat" alt="Dolorem eum fugiat" class="img-responsive">
                                                            </a>
                                                        </div>
                                                        <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=47"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                        <div class="img-overlay"></div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=47">Dolorem eum fugiat</a></div>
                                                        <div class="rating"><img src="../webres/image/stars-4.png" alt="text_reviews"></div>
                                                        <div class="description">Stop your co-workers in their tracks with the stunning new...</div>
                                                        <div class="price">$119.50</div>
                                                        <div class="cart">
                                                            <button class="button" onclick="addToCart('47');">
                                                                <span class="fa fa-shopping-cart icon"></span>
                                                                <span>Купить</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item active">
                                        <div class="row box-product">
                                            <div class="col-lg-6 col-sm-6 col-xs-12 ">
                                                <div class="product-block">
                                                    <div class="image">
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=46" class="img front">
                                                                <img src="../webres/image/cache/data/demo/product19-480x360.jpg" title="Voluptate velit esse" alt="Voluptate velit esse" class="img-responsive">
                                                            </a>
                                                        </div>
                                                        <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=46"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                        <div class="img-overlay"></div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=46">Voluptate velit esse</a></div>
                                                        <div class="rating"><img src="../webres/image/stars-5.png" alt="text_reviews"></div>
                                                        <div class="description">Unprecedented power. The next generation of processing tec...</div>
                                                        <div class="price">$1,177.00</div>
                                                        <div class="cart">
                                                            <button class="button" onclick="addToCart('46');">
                                                                <span class="fa fa-shopping-cart icon"></span>
                                                                <span>Купить</span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-sm-6 col-xs-12 ">
                                                <div class="product-block">
                                                    <div class="image">
                                                        <div class="image_container">
                                                            <a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=44" class="img front">
                                                                <img src="../webres/image/cache/data/demo/product12-480x360.jpg" title="Occur in which toil" alt="Occur in which toil" class="img-responsive">
                                                            </a>
                                                        </div>
                                                        <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=44"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                        <div class="img-overlay"></div>
                                                    </div>
                                                    <div class="product-meta">
                                                        <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=44">Occur in which toil</a></div>
                                                        <div class="rating"><img src="../webres/image/stars-5.png" alt="text_reviews"></div>
                                                        <div class="description">MacBook Air is ultrathin, ultraportable, and ultra unli...</div>
                                                        <div class="price">$1,177.00</div>
                                                        <div class="cart">
                                                            <button class="button" onclick="addToCart('44');">
                                                                <span class="fa fa-shopping-cart icon"></span>
                                                                <span>Купить</span>
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
                                        <p><img alt="" src="../webres/../webres/image/data/adv.png" style="display: none !important;"></p>
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
                                                                            <img src="../webres/image/cache/data/demo/product17-480x360.jpg" title="The master-builder" alt="The master-builder" class="img-responsive">
                                                                        </a>
                                                                    </div>
                                                                    <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=49"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                                    <div class="img-overlay"></div>
                                                                </div>
                                                                <div class="product-meta">
                                                                    <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=49">The master-builder</a></div>
                                                                    <div class="rating"><img src="../webres/image/stars-4.png" alt="text_reviews"></div>
                                                                    <div class="description">Samsung Galaxy Tab 10.1, is the world’s thinnest tablet, m...</div>
                                                                    <div class="price">$236.99</div>
                                                                    <div class="cart">
                                                                        <button class="button" onclick="addToCart('49');">
                                                                            <span class="fa fa-shopping-cart icon"></span>
                                                                            <span>Купить</span>
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
                                                                            <img src="../webres/image/cache/data/demo/product07-480x360.jpg" title="Lorem ipsum dolor" alt="Lorem ipsum dolor" class="img-responsive">
                                                                        </a>
                                                                    </div>
                                                                    <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=48"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                                    <div class="img-overlay"></div>
                                                                </div>
                                                                <div class="product-meta">
                                                                    <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=48">Lorem ipsum dolor</a></div>
                                                                    <div class="rating"><img src="../webres/image/stars-5.png" alt="text_reviews"></div>
                                                                    <div class="description">More room to move.With 80GB or 160GB ...</div>
                                                                    <div class="price">$119.50</div>
                                                                    <div class="cart">
                                                                        <button class="button" onclick="addToCart('48');">
                                                                            <span class="fa fa-shopping-cart icon"></span>
                                                                            <span>Купить</span>
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
                                                                            <img src="../webres/image/cache/data/demo/product03-480x360.jpg" title="Dolorem eum fugiat" alt="Dolorem eum fugiat" class="img-responsive">
                                                                        </a>
                                                                    </div>
                                                                    <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=47"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                                    <div class="img-overlay"></div>
                                                                </div>
                                                                <div class="product-meta">
                                                                    <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=47">Dolorem eum fugiat</a></div>
                                                                    <div class="rating"><img src="../webres/image/stars-4.png" alt="text_reviews"></div>
                                                                    <div class="description">Stop your co-workers in their tracks with the stunning new...</div>
                                                                    <div class="price">$119.50</div>
                                                                    <div class="cart">
                                                                        <button class="button" onclick="addToCart('47');">
                                                                            <span class="fa fa-shopping-cart icon"></span>
                                                                            <span>Купить</span>
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
                                                                            <img src="../webres/image/cache/data/demo/product19-480x360.jpg" title="Voluptate velit esse" alt="Voluptate velit esse" class="img-responsive">
                                                                        </a>
                                                                    </div>
                                                                    <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=46"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                                    <div class="img-overlay"></div>
                                                                </div>
                                                                <div class="product-meta">
                                                                    <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=46">Voluptate velit esse</a></div>
                                                                    <div class="rating"><img src="../webres/image/stars-5.png" alt="text_reviews"></div>
                                                                    <div class="description">Unprecedented power. The next generation of processing tec...</div>
                                                                    <div class="price">$1,177.00</div>
                                                                    <div class="cart">
                                                                        <button class="button" onclick="addToCart('46');">
                                                                            <span class="fa fa-shopping-cart icon"></span>
                                                                            <span>Купить</span>
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
                                                                            <img src="../webres/image/cache/data/demo/product13-480x360.jpg" title="Pursue pleasure rationally" alt="Pursue pleasure rationally" class="img-responsive">
                                                                        </a>
                                                                    </div>
                                                                    <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=45"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                                    <div class="img-overlay"></div>
                                                                </div>
                                                                <div class="product-meta">
                                                                    <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=45">Pursue pleasure rationally</a></div>
                                                                    <div class="rating"><img src="../webres/image/stars-4.png" alt="text_reviews"></div>
                                                                    <div class="description">Latest Intel mobile architecture Power...</div>
                                                                    <div class="price">$2,000.00</div>
                                                                    <div class="cart">
                                                                        <button class="button" onclick="addToCart('45');">
                                                                            <span class="fa fa-shopping-cart icon"></span>
                                                                            <span>Купить</span>
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
                                                                            <img src="../webres/image/cache/data/demo/product13-480x360.jpg" title="Pursue pleasure rationally" alt="Pursue pleasure rationally" class="img-responsive">
                                                                        </a>
                                                                    </div>
                                                                    <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=45"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                                    <div class="img-overlay"></div>
                                                                </div>
                                                                <div class="product-meta">
                                                                    <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=45">Pursue pleasure rationally</a></div>
                                                                    <div class="rating"><img src="../webres/image/stars-4.png" alt="text_reviews"></div>
                                                                    <div class="description">Latest Intel mobile architecture Power...</div>
                                                                    <div class="price">$2,000.00</div>
                                                                    <div class="cart">
                                                                        <button class="button" onclick="addToCart('45');">
                                                                            <span class="fa fa-shopping-cart icon"></span>
                                                                            <span>Купить</span>
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
                                                                            <img src="../webres/image/cache/data/demo/product13-480x360.jpg" title="Pursue pleasure rationally" alt="Pursue pleasure rationally" class="img-responsive">
                                                                        </a>
                                                                    </div>
                                                                    <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=45"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                                    <div class="img-overlay"></div>
                                                                </div>
                                                                <div class="product-meta">
                                                                    <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=45">Pursue pleasure rationally</a></div>
                                                                    <div class="rating"><img src="../webres/image/stars-4.png" alt="text_reviews"></div>
                                                                    <div class="description">Latest Intel mobile architecture Power...</div>
                                                                    <div class="price">$2,000.00</div>
                                                                    <div class="cart">
                                                                        <button class="button" onclick="addToCart('45');">
                                                                            <span class="fa fa-shopping-cart icon"></span>
                                                                            <span>Купить</span>
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
                                                                            <img src="../webres/image/cache/data/demo/product13-480x360.jpg" title="Pursue pleasure rationally" alt="Pursue pleasure rationally" class="img-responsive">
                                                                        </a>
                                                                    </div>
                                                                    <a class="pav-colorbox cboxElement" href="index.php?route=themecontrol/product&amp;product_id=45"><span class="fa fa-eye"></span>Быстрый просмотр</a>
                                                                    <div class="img-overlay"></div>
                                                                </div>
                                                                <div class="product-meta">
                                                                    <div class="name"><a href="http://demopavothemes.com/pav_floral/index.php?route=product/product&amp;product_id=45">Pursue pleasure rationally</a></div>
                                                                    <div class="rating"><img src="../webres/image/stars-4.png" alt="text_reviews"></div>
                                                                    <div class="description">Latest Intel mobile architecture Power...</div>
                                                                    <div class="price">$2,000.00</div>
                                                                    <div class="cart">
                                                                        <button class="button" onclick="addToCart('45');">
                                                                            <span class="fa fa-shopping-cart icon"></span>
                                                                            <span>Купить</span>
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

    <section id="pav-mass-bottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-3">
                    <div id="pavtestimonial72" class="carousel slide pavtestimonial">
                        <div class="carousel-inner">
                            <div class="item">
                                <div class="testimonial-item">
                                    <div class="testimonial">
                                        <span class="fa fa-quote-left icon"></span>
                                        <div><p>Duis sed odio sit amet nibh vulputa cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non mauris vitae erat</p></div>
                                    </div>
                                    <div class="t-avatar"><img alt="jane doe.." src="../webres/image/cache/data/testimonial1-108x108.jpg" class="img-circle"></div>
                                    <div class="profile">
                                        <div><h3>jane doe</h3><p>Creative Manager</p></div>
                                    </div>
                                </div>
                            </div>
                            <div class="item active">
                                <div class="testimonial-item">
                                    <div class="testimonial">
                                        <span class="fa fa-quote-left icon"></span>
                                        <div><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat</p></div>
                                    </div>
                                    <div class="t-avatar"><img alt="QuynhVT..." src="../webres/image/cache/data/testimonial2-108x108.jpg" class="img-circle"></div>
                                    <div class="profile">
                                        <div><h3>QuynhVT</h3><p>Suppor Manager</p></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control left" href="#pavtestimonial72" data-slide="prev">‹</a>
                        <a class="carousel-control right" href="#pavtestimonial72" data-slide="next">›</a>
                    </div>
                </div>


                <div class="col-lg-9 col-md-9 col-sm-9">
                    <div class="box pav-block bloglatest">
                        <div class="box-heading"><span>Новое в блоге</span></div>
                        <div class="pavblog-latest clearfix box-content">
                            <div class="row">
                                <div class="col-lg-4 col-sm-4 pavblock">
                                    <div class="blog-item">
                                        <div class="blog-body clearfix">
                                            <div class="image clearfix"><img src="../webres/image/cache/data/pavblog/blog1-300x160.jpg" title="Donec tellus Nulla lorem Nullam elit id ut" alt="Donec tellus Nulla lorem Nullam elit id ut"></div>
                                            <div class="group-blog">
                                                <div class="blog-title"><a href="http://demopavothemes.com/pav_floral/index.php?route=pavblog/blog&amp;id=11" title="Donec tellus Nulla lorem Nullam elit id ut">Donec tellus Nulla lorem Nullam elit id ut</a></div>
                                                <div class="description"><p>Donec tellus Nulla lorem Nullam elit id ut elit feugiat lacus. Cong...</p></div>
                                                <p class="created"><span>2013-03-11</span></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-sm-4 pavblock">
                                    <div class="blog-item">
                                        <div class="blog-body clearfix">
                                            <div class="image clearfix"><img src="../webres/image/cache/data/pavblog/blog1-300x160.jpg" title="Donec tellus Nulla lorem Nullam elit id ut" alt="Donec tellus Nulla lorem Nullam elit id ut"></div>
                                            <div class="group-blog">
                                                <div class="blog-title"><a href="http://demopavothemes.com/pav_floral/index.php?route=pavblog/blog&amp;id=11" title="Donec tellus Nulla lorem Nullam elit id ut">Donec tellus Nulla lorem Nullam elit id ut</a></div>
                                                <div class="description"><p>Donec tellus Nulla lorem Nullam elit id ut elit feugiat lacus. Cong...</p></div>
                                                <p class="created"><span>2013-03-11</span></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-sm-4 pavblock">
                                    <div class="blog-item">
                                        <div class="blog-body clearfix">
                                            <div class="image clearfix"><img src="../webres/image/cache/data/pavblog/blog1-300x160.jpg" title="Donec tellus Nulla lorem Nullam elit id ut" alt="Donec tellus Nulla lorem Nullam elit id ut"></div>
                                            <div class="group-blog">
                                                <div class="blog-title"><a href="http://demopavothemes.com/pav_floral/index.php?route=pavblog/blog&amp;id=11" title="Donec tellus Nulla lorem Nullam elit id ut">Donec tellus Nulla lorem Nullam elit id ut</a></div>
                                                <div class="description"><p>Donec tellus Nulla lorem Nullam elit id ut elit feugiat lacus. Cong...</p></div>
                                                <p class="created"><span>2013-03-11</span></p>
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