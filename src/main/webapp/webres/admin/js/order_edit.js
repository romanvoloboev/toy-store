$(function(){
    $('#order a[data-toggle=\'tab\']').on('click', function(e) {
        return false;
    });

    $('#button-customer').on('click', function() {
        $('a[href=\'#tab-cart\']').tab('show');
    });

    $('#button-cart').on('click', function() {
        $('a[href=\'#tab-payment\']').tab('show');
    });


    $('#shipping-type').change(function(){
        if ($(this).val() == '1') {
            $('#shipping-service-pickup').hide();
            $('#shipping-service-courier').show();
            $('#shipping-address-courier').show();
            $('#shipping-address-pickup').hide();
        } else {
            $('#shipping-service-pickup').show();
            $('#shipping-service-courier').hide();
            $('#shipping-address-pickup').show();
            $('#shipping-address-courier').hide();
        }
    });

    $('#shipping-address-courier').change(function() {
        if ($(this).val() == 'new') {
            $('#new_address_field').fadeIn(500);
        } else {
            $('#new_address_field').fadeOut(500);
        }
    })
});