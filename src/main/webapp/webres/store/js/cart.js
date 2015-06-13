$(function(){
    $.ajax({
        type: "post",
        url: "/cart/load",
        success: function(response){
            fillCartBlock(response);
        },
        error: function() {
            $.notify("<b>Не удалось загрузить содержимое корзины</b>", {
                type: "danger",
                delay: 800
            });
        }

    });
});

function getNumEnding(iNumber) {
    var aEndings = [' товар',' товара',' товаров'];

    var sEnding, i;
    iNumber = iNumber % 100;
    if (iNumber>=11 && iNumber<=19) {
        sEnding=aEndings[2];
    }
    else {
        i = iNumber % 10;
        switch (i)
        {
            case (1): sEnding = aEndings[0]; break;
            case (2):
            case (3):
            case (4): sEnding = aEndings[1]; break;
            default: sEnding = aEndings[2];
        }
    }
    return sEnding;
}

function addToCart(id) {
    $.ajax({
        type: "post",
        url: "/cart/add",
        data: {id: id},
        success: function (response) {
            if (response.error && response.error.length) {
                $.notify("<b>Не удалось добавить товар</b>", {
                    type: "danger",
                    delay: 800
                });
            } else {
                $.notify("<b>Товар добавлен в корзину</b>", {
                    type: "success",
                    delay: 800
                });
                fillCartBlock(response);

            }
        },
        error: function () {
            $.notify("<b>Неизвестная ошибка добавления товара</b>", {
                type: "danger",
                delay: 800
            });
        }
    });
}

function addToWish(id) {
    $.ajax({
        type: "post",
        url: "/product/add_to_wishlist",
        data: {id: id},
        success: function (response) {
            if (response.status == "ok") {
                $.notify("<b>Товар добавлен в список желаний</b>", {
                    type: "success",
                    delay: 800
                });
            } else {
                $.notify("<b>Не удалось добавить товар в список желаний</b>", {
                    type: "danger",
                    delay: 800
                });
            }
        },
        error: function () {
            $.notify("<b>Неизвестная ошибка</b>", {
                type: "danger",
                delay: 800
            });
        }
    });
}

function removeFromWish(id) {
    $.ajax({
        type: "post",
        url: "/product/remove_from_wishlist",
        data: {id: id},
        success: function (response) {
            if (response.status == "ok") {
                $.notify("<b>Товар убран из списка желаний</b>", {
                    type: "success",
                    delay: 800,
                    onClose: function(){
                        location.reload();
                    }
                });
            }
        },
        error: function () {
            $.notify("<b>Неизвестная ошибка</b>", {
                type: "danger",
                delay: 800
            });
        }
    });
}

function removeCartItem(id) {
    $.ajax({
        type: "post",
        url: "/cart/remove",
        data: {id:id},
        success: function(response){
            fillCartBlock(response);
        },
        error: function() {
            $.notify("<b>Не удалось удалить товар из корзины</b>", {
                type: "danger",
                delay: 800
            });
        }

    });
}

function fillCartBlock(response) {
    var contentItems = '';
    var content = '';

    if (response.cartItems.length) {
        $.each(response.cartItems, function() {
            contentItems += "<tr>" +
                                "<td class='image'>" +
                                    "<a href='/product?id="+this.product+"'><img src='/image/load?id="+this.productImage+"' width='200px' height='150px'></a>" +
                                "</td>" +
                                "<td class='name'>" +
                                    "<a href='/product?id="+this.product+"'>"+this.productName+"</a>" +
                                "</td>" +
                                "<td class='quantity'>x&nbsp;"+this.quantity+"</td>" +
                                "<td class='total'>"+this.price+" грн.</td>" +
                                "<td class='remove'>" +
                                    "<a onclick='removeCartItem("+this.product+")'><i class='fa fa-times'></i></a>" +
                                "</td>" +
                            "</tr>";
        });

        contentItems += "<div class='mini-cart-total'>" +
                            "<table>" +
                                "<tbody>" +
                                    "<tr>" +
                                        "<td class='text-right' width='62%'><b>Итого:</b></td>" +
                                        "<td class='text-right'>"+response.totalAmount+" грн.</td>" +
                                    "</tr>" +
                                "</tbody>" +
                            "</table>" +
                        "</div>" +
                        "<div class='checkout' style='padding-right: 6px;'>" +
                            "<a href='/checkout'>Оформить заказ</a>" +
                        "</div>";
    } else {
        contentItems += "<tr>" +
                            "<td rowspan='5' style='padding-top: 50px; text-align: center; border-bottom: none;'>" +
                                "<span>Ваша корзина пуста</span>" +
                            "</td>" +
                        "</tr>";
    }

    content +=      "<div class='mini-cart-info'>" +
                        "<table>" +
                            "<tbody>" +contentItems+ "</tbody>" +
                        "</table>" +
                    "</div>";

    var heading =   "<span class='icon fa fa-shopping-cart'></span>" +
                    "<div class='heading'>" +
                        "<h4>Корзина</h4>" +
                        "<a><span id='cart-total'>"+response.itemsCount+getNumEnding(response.itemsCount)+" на "+response.totalAmount+" грн.</span></a>" +
                    "</div>" +
                    "<div class='content'>" + content +
                    "</div>";

    $("#cart").html(heading);
}
