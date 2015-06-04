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

$(function(){

    $('#image-additional .item:first').addClass('active');
    $('#image-additional').carousel({interval:false});

    $("#image").elevateZoom( {  gallery:'image-additional-carousel',
        cursor: 'pointer',
        galleryActiveClass: 'active' } );

    $('div.product-rating').rating();

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