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
            if (phone.indexOf('_') != -1 || phone.indexOf('+38(___)___-__-__') != -1) {
                // todo: notify about wrong format
                return;
            }
        }

        if ($("#new-address-form").css('display') != 'none') {
            city = $('#new-city').val();
            street = $('#new-street').val();
            house = $('#new-house').val();
            flat = $('#new-flat').val();
        }

        $.post('/customer_update_profile', {name: name, phone: phone, city: city, street: street, house: house, flat: flat}, function(response) {
            if(response.status == 'ok') {
                // todo: notify OK
            } else {
                // todo: notify ERROR
            }
            });

        $('#new-address-form').hide();
        $('#add-new-address-btn').show();
    });

    $('#remove-address').click(function(e){
        e.preventDefault();

        //todo remove address
    });




});


function removeAddress(id){
    $("#customer-address"+id).hide();
    $("#address-remove-btn"+id).hide().next("br").remove();
}

function removePhone() {
    $("#customer-phone").hide();
    $("#remove-phone").hide();
    $("#new-phone").show();
}