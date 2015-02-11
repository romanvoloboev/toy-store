$(function(){
    $('.courierType').on('click', function(){
        $('.pickup').hide();
        $('.courier').fadeIn(500);
        $('.courierType').addClass('activeDeliveryType');
        $('.pickupType').removeClass('activeDeliveryType');
    });

    $('.pickupType').on('click', function(){
        $('.courier').hide();
        $('.pickup').fadeIn(500);
        $('.pickupType').addClass('activeDeliveryType');
        $('.courierType').removeClass('activeDeliveryType');
    });

    $('#address').change(function(){
        var value = $(this).val();
        if (value == 'new') {
            $('#new_address_field').fadeIn(500);
        } else {
            $('#new_address_field').fadeOut(500);
        }
    });

    $('#confirmOrder').on('click', function() {
        $('#contacts-data').hide();
        $('#payment-address').hide();
        $('#order-success').fadeIn(500);
    });
});