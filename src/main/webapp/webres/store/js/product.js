var productId = 0;
function getNumEnding(iNumber) {
    var aEndings = [' отзыв',' отзыва',' отзывов'];

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

function setReviewsCount(count) {
    $("#reviews-count").html("<em>("+count+getNumEnding(count)+")</em>");
}

function setProductId(id) {
    productId = id;
}

$(function(){
    $("#add-new-review").on("click", function() {
        var coment = $("#comment").val();
        var rating = $('#product-rating').raty('score');
        console.log(rating, coment, productId);
        if (rating >= 0 && coment.length != 0 && productId != 0) {
            $.ajax({
                type: "post",
                url: "/add_review",
                data: JSON.stringify({comment:coment, rating:rating, product:productId}),
                contentType: "application/json; charset=utf-8",
                success: function(response) {
                    if (response.status == "ok") {
                        $.notify("<b>Спасибо за отзыв! Он отправлен на модерацию и появиться позже.</b>",
                            {
                                type: "success",
                                delay: 1500,
                                onClose: function(){
                                    location.reload();
                                }
                            });
                    } else if (response.status == "validationError") {
                        $.notify("<b>Невозможно добавить отзыв, неверный формат данных!</b>",
                            {
                                type: "danger",
                                delay: 1000
                            });
                    } else {
                        $.notify("<b>Ошибка при добавлении отзыва.</b>",
                            {
                                type: "danger",
                                delay: 1000
                            });
                    }

                }
            });
        } else {
            $.notify("<b>Вы не ввели отзыв или не оставили оценку</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }

    });

    $('#image-additional .item:first').addClass('active');
    $('#image-additional').carousel({interval:false});

    $("#image").elevateZoom( {  gallery:'image-additional-carousel',
        cursor: 'pointer',
        galleryActiveClass: 'active' } );

    $('#product-rating').raty({
        score: function() {
            return $(this).attr('data-score');
        }
    });

    $("#reviews-link").on("click", function(){
        if ($("#tab-review").css("display") == "none") {
            $("#tab-description").hide();
            $("#description-link").removeClass("selected");

            $("#reviews-link").addClass("selected");
            $("#tab-review").show();
        }
    });

    $("#description-link").on("click", function(){
        if ($("#tab-description").css("display") == "none") {
            $("#description-link").addClass("selected");
            $("#tab-description").show();

            $("#reviews-link").removeClass("selected");
            $("#tab-review").hide();
        }
    });
});