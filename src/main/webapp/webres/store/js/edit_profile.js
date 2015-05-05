$(function(){
    var globalName = $("#name").val();

    $("#newPhoneInput").inputmask('+38(999)999-99-99');

    $("#name").on('keyup', function() {
        if(this.value != globalName) {
            $('#save').prop("disabled", false);
        } else {
            $('#save').prop("disabled", true);
        }
    });

    $("#newPhoneInput").on('keyup', function() {
        if(this.value.indexOf('_') == -1 ) {
            $('#save').prop("disabled", false);
        } else {
            $('#save').prop("disabled", true);
        }

    });

    $("#new-address-form > #newCityInput, #newStreetInput, #newHouseInput").keyup(function() {
        var $emptyFields = $('#new-address-form > #newCityInput, #newStreetInput, #newHouseInput').filter(function() {
            return $.trim(this.value) === "";
        });

        if (!$emptyFields.length) {
            $('#save').prop("disabled", false);
        } else {
            $('#save').prop("disabled", true);
        }
    });

    $('#add-new-address-btn').click(function(e){
        e.preventDefault();
        $('#new-address-form').fadeIn(500);
        $('#add-new-address-btn').hide();
    });

    $('#cancel').click(function(){
        history.back();

    });

    $('#save').click(function(){
        var name = $("#name").val();
        var phone = '';
        var city = '';
        var street = '';
        var house = '';
        var flat = '';

        if ($("#newPhoneInput").css('display') != 'none') {
            phone = $("#newPhoneInput").val();
            if (phone.indexOf('_') != -1) {
                $.notify("<b>Неверный формат телефона</b>",
                    {
                        type: "danger",
                        delay: 1000
                    });
                return;
            } else if (phone.indexOf('+38(___)___-__-__') != -1) {
                phone = '';
            }
        }

        if ($("#new-address-form").css('display') != 'none') {
            city = $('#newCityInput').val().trim();
            street = $('#newStreetInput').val().trim();
            house = $('#newHouseInput').val().trim();
            flat = $('#newFlatInput').val().trim();

            if (!(city.length == 0 && street.length == 0 && house.length == 0)) {
                if (city.length == 0 || street.length == 0 || house.length == 0){
                    $.notify("<b>Неверный формат адреса</b>",
                        {
                            type: "danger",
                            delay: 1000
                        });
                    return;
                }
            }
        }

        $.post('/customer_update_profile', {name: name, phone: phone, city: city, street: street, house: house, flat: flat}, function(response) {
            if(response.status == 'ok') {
                $.notify("<b>Ваши личные данные успешно изменены</b>",
                    {
                        delay: 1500,
                        onClose: function(){
                            location.reload();
                        }
                    });
            } else if(response.status == "wrongParams") {
                $.notify("<b>Вы ввели недопустимые значения имени или адреса</b>",
                    {
                        type: "danger",
                        delay: 1500
                    });
            } else {
                $.notify("<b>Невозможно сохранить данные, повторите попытку позже</b>",
                    {
                        type: "danger",
                        delay: 1000
                    });
            }
        });

    });
});

function removeAddress(id){
    $.post('/customer_remove_address', {id:id}, function(response) {
        if(response.status == 'ok') {
            $.notify("<b>Адрес успешно удален</b>",
                {
                    delay: 1000,
                    onClose: function(){
                        location.reload();
                    }
                });
        } else {
            $.notify("<b>Невозможно удалить заданый адрес</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
    $("#customer-address"+id).hide();
    $("#address-remove-btn"+id).hide().next("br").remove();
}

function removePhone() {
    $.post('/customer_remove_phone', function(response) {
        if(response.status == 'ok') {
            $.notify("<b>Телефон успешно удален</b>",
                {
                    delay: 1000
                });
        } else {
            $.notify("<b>Ошибка при удалении телефона, повторите попытку позже</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
    $("#customer-phone").hide();
    $("#remove-phone").hide();
    $("#newPhoneInput").show();
}