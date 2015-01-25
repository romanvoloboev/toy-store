<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section id="footer">
    <div class="footer-top">
        <div class="container">
            <div class="wrap-fcenter">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="box pav-custom  cusblock">
                            <div class="box-content">
                                <div class="row quickaccess">
                                    <div class="col-lg-3 col-md-3"><span class="fa fa-tags icon">&nbsp;</span>
                                        <h3>Лучшие цены</h3>
                                        <p>Самые низкие цены на товары</p>
                                    </div>

                                    <div class="col-lg-3 col-md-3"><span class="fa fa-star icon">&nbsp;</span>
                                        <h3>Гарантия качества</h3>
                                        <p>Гарантия от производителя</p>
                                    </div>

                                    <div class="col-lg-3 col-md-3"><span class="fa fa-lock icon">&nbsp;</span>
                                        <h3>Гарантия оплаты</h3>
                                        <p>Оплата по факту, или Приват24</p>
                                    </div>

                                    <div class="col-lg-3 col-md-3"><span class="fa fa-calendar icon">&nbsp;</span>
                                        <h3>Мгновенная доставка</h3>
                                        <p>Доставка по Украине до 3х дней</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12">
                        <div class=" box newsletter_block" id="newsletter_footer_top0">
                            <div class="row">
                                <div class="col-sm-6 title_block">Подписаться на рассылку</div>
                                <div class="description"></div>
                                <div class="col-sm-6 block_content">
                                    <form id="formNewLestter" method="post"
                                          action="http://demopavothemes.com/pav_floral/index.php?route=module/pavnewsletter/subscribe">
                                        <p class="wrap-input">
                                            <input type="text" class="inputNew"
                                                   onblur="javascript:if(this.value=='')this.value='Ваш Email';"
                                                   onfocus="javascript:if(this.value=='Ваш Email')this.value='';"
                                                   value="Ваш Email" size="18" name="email">
                                            <i style="margin-right: 15px;" class="fa fa-long-arrow-right"></i>
                                            <input type="submit" name="submitNewsletter" class="button_mini" value="Ok">
                                            <input type="hidden" value="1" name="action">
                                        </p>
                                        <div class="valid"></div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">
                            $('#formNewLestter').on('submit', function () {
                                var sbt = '<img src=\"catalog/view/theme/default/image/close.png\" alt=\"\" class=\"close\">';
                                var email = $('.inputNew').val();
                                $(".warning, .success").remove();
                                if (!isValidEmailAddress(email)) {
                                    $('.valid').html("<div class=\"warning\">Email is not valid!" + sbt + "</div>");
                                    $('.inputNew').focus();
                                    return false;
                                }
                                var url = "http://demopavothemes.com/pav_floral/index.php?route=module/pavnewsletter/subscribe";
                                $.ajax({
                                    type: "post",
                                    url: url,
                                    data: $("#formNewLestter").serialize(),
                                    dataType: 'json',
                                    success: function (json) {
                                        $(".warning, .success").remove();
                                        if (json['error']) {
                                            $('.valid').html("<div class=\"warning\">" + json['error'] + sbt + "</div>");
                                        }
                                        if (json['success']) {
                                            $('.valid').html("<div class=\"success\">" + json['success'] + sbt + "</div>");
                                        }
                                    }
                                });
                                return false;
                            });
                            function isValidEmailAddress(emailAddress) {
                                var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
                                return pattern.test(emailAddress);
                            }
                        </script>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer-center">
        <div class="container">
            <div class="wrap-fcenter">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <div class="box pav-custom">
                            <div class="box-heading"><h2>Свяжитесь с нами</h2></div>
                            <div class="box-content">
                                <p>Тел.: +01 888 (000) 1234</p>

                                <p>Email: www.leotheme.com</p>
                                <ul class="social">
                                    <li><a href="http://facebook.com"><i class="fa fa-facebook">&nbsp;</i></a></li>
                                    <li><a href="http://twitter.com"><i class="fa fa-twitter">&nbsp;</i></a></li>
                                    <li><a href="https://plus.google.com"><i class="fa fa-vk">&nbsp;</i></a></li>
                                    <li><a href="http://youtube.com"><i class="fa fa-youtube">&nbsp;</i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-2">
                        <div class="box pav-custom  ">
                            <div class="box-heading"><h2>Информация</h2></div>
                            <div class="box-content">
                                <ul class="list">
                                    <li><a href="index.php?route=information/information&amp;information_id=4">О нас</a></li>
                                    <li><a href="index.php?route=information/information&amp;information_id=6">Оплата и Доставка</a></li>
                                    <li><a href="index.php?route=information/information&amp;information_id=3">Конфиденциальность</a></li>
                                    <li><a href="index.php?route=information/information&amp;information_id=5">Условия использования</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-2">
                        <div class="box pav-custom  ">
                            <div class="box-heading"><h2>Мой аккаунт</h2></div>
                            <div class="box-content">
                                <ul class="list">
                                    <li><a href="index.php?route=account/account">Мой аккаунт</a></li>
                                    <li><a href="index.php?route=account/order">История заказов</a></li>
                                    <li><a href="index.php?route=account/wishlist">Желаемые покупки</a></li>
                                    <li><a href="index.php?route=account/newsletter">Блог</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="powered">
        <div class="container">
            <div class="powered">
                <div class="copyright pull-left">
                    Powered By <a href="http://www.opencart.com">OpenCart</a><br> Floral Store © 2015.
                    Design By <a href="http://www.pavothemes.com"
                                 title="pavethemes - opencart themes clubs">PavoThemes</a>
                </div>
                <div class=" pull-right"><img style="height: 30px; margin-left: 15px"
                                              src="../../webres/image/new_post.png" alt=""></div>
                <div class=" pull-right"><img style="height: 30px;" src="../../webres/image/privat24.png" alt=""></div>
            </div>
        </div>
    </div>
</section>