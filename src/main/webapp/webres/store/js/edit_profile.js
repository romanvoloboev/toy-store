$(function(){

    $("#new-phone").inputmask('+38(999)999-99-99');

    $('#add-new-address-btn').click(function(e){
        e.preventDefault();
        $('#new-address-form').fadeIn(500);
        $('#add-new-address-btn').hide();
    });

    $('#save').click(function(){
        var name = $("#name").val();
        var phone = '';
        var city = '';
        var street = '';
        var house = '';
        var flat = '';

        if ($("#new-phone").css('display') != 'none') {
            phone = $("#new-phone").val();
            if (phone.indexOf('_') != -1) {
                // todo: notify about wrong format
                return;
            } else if (phone.indexOf('+38(___)___-__-__') != -1) {
                phone = '';
            }
        }

        if ($("#new-address-form").css('display') != 'none') {
            city = $('#new-city').val().trim();
            street = $('#new-street').val().trim();
            house = $('#new-house').val().trim();
            flat = $('#new-flat').val().trim();

            if (city.length == 0 || street.length == 0 || house.length == 0) {
                // todo: notify about wrong format
                return;
            }
        }

        $.post('/customer_update_profile', {name: name, phone: phone, city: city, street: street, house: house, flat: flat}, function(response) {
            if(response.status == 'ok') {
                // todo: notify OK and reload page
            } else {
                // todo: notify ERROR
            }
        });


    });
});


function removeAddress(id){
    $.post('/customer_remove_address', {id:id}, function(response) {
        if(response.status == 'ok') {
            // todo: notify OK
        } else {
            // todo: notify ERROR
        }
    });
    $("#customer-address"+id).hide();
    $("#address-remove-btn"+id).hide().next("br").remove();
}

function removePhone() {
    $.post('/customer_remove_phone', function(response) {
        if(response.status == 'ok') {
            // todo: notify OK
        } else {
            // todo: notify ERROR
        }
    });
    $("#customer-phone").hide();
    $("#remove-phone").hide();
    $("#new-phone").show();
}