var customerCities = [];
var customerAddresses = [];
var items = [];
var deliveryService = 1;
var paymentType = 1;
var pickupCity;
var pickupAddress;
var custAddr;

$(function(){
    getCustomerCities();

    $('.courierType').on('click', function(){
        $('.pickup').hide();
        $('.courier').fadeIn(500);
        $('.courierType').addClass('activeDeliveryType');
        $('.pickupType').removeClass('activeDeliveryType');
        getCustomerFullAddresses();
        deliveryService = 2;

    });

    $('.pickupType').on('click', function(){
        $('.courier').hide();
        $('.pickup').fadeIn(500);
        $('.pickupType').addClass('activeDeliveryType');
        $('.courierType').removeClass('activeDeliveryType');
        $("#department-address").hide();
        getCustomerCities();
        deliveryService = 1;
    });


    $('.cashType').on('click', function(){
        $('.cashType').addClass('activePaymentType');
        $('.noncashType').removeClass('activePaymentType');
    });

    $('.noncashType').on('click', function(){
        $('.noncashType').addClass('activePaymentType');
        $('.cashType').removeClass('activePaymentType');
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
        createOrder();
    });


    $("#newPhoneInput").on('keyup', function() {
        if(this.value.indexOf('_') == -1 ) {
            $('#save').prop("disabled", false);
        } else {
            $('#save').prop("disabled", true);
        }

    });

    $("#newPhoneInput").inputmask('+38(999)999-99-99');



    $("#btn-add-address").on("click", function() {
        var city = $('#newCityInput').val().trim();
        var street = $('#newStreetInput').val().trim();
        var house = $('#newHouseInput').val().trim();
        var flat = $('#newFlatInput').val().trim();

        var address = {};
        var addr = [];
        if (!(city.length == 0 && street.length == 0 && house.length == 0)) {
            if (city.length == 0 || street.length == 0 || house.length == 0){
                $.notify("<b>Неверный формат адреса</b>",
                    {
                        type: "danger",
                        delay: 1000
                    });
                return;
            }
            address.city = city;
            address.street = street;
            address.house = house;

        }

        address.flat = flat;
        addr.push(address);

        var data = {};
        data.addressesList = addr;

        $.ajax({
            type: "post",
            url: "/customer_update_profile",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            success: function(response){
                if (response.status == "ok") {
                    $.notify("<b>Адрес успешно добавлен</b>",
                        {
                            type: "success",
                            delay: 700
                        });
                    $("#new-customer-address-form").hide();
                    $("#new_address_field").hide();

                    $("#delivery-content").show();

                    getCustomerCities();
                    $("#courier-city-block").show();

                    getCustomerFullAddresses();

                } else {
                    $.notify("<b>Ошибка! Проверьте правильность введенных данных</b>",
                        {
                            type: "danger",
                            delay: 1000
                        });
                }
            },
            error: function() {
                $.notify("<b>Ошибка! Не удалось сохранить адрес</b>",
                    {
                        type: "danger",
                        delay: 1000
                    });
            }
        });
    });


    $("#courier-city").change(function(){
        pickupCity = $('#courier-city :selected').text();
        pickupCity = pickupCity.split(', ');
        $("#shipping-address-pickup").prop("disabled", true);
        getOfficeAddresses(pickupCity[0]);
        $("#department-address").show();
    });

    $("#shipping-address-pickup").change(function(){
        pickupAddress = $('#shipping-address-pickup :selected').text();
    });

    $("#address").change(function(){
        custAddr = $('#address :selected').text();
    });

    $("#pickupService").on('click', function(){
        deliveryService = 1;
    });

    $("#mistexpr").on('click', function(){
        deliveryService = 2;
    });

    $("#postman").on('click', function(){
        deliveryService = 3;
    });

    $("#cash").on('click', function(){
        paymentType = 1;
    });

    $("#nocash").on('click', function(){
        paymentType = 2;
    });

});

function createOrder() {
    var customerPhone = '';
    if ($("#newPhoneInput").css("display") != "none") {
        customerPhone = $("#newPhoneInput").val();
    } else {
        customerPhone = $("#customer-phone").text();
    }

    if (customerPhone.indexOf('_') != -1 || customerPhone.indexOf('+38(___)___-__-__') != -1 || customerPhone == '') {
        $.notify("<b>Неверный формат телефона</b>",
            {
                type: "danger",
                delay: 1000
            });
        return;
    }
    var customerName = $("#name").val();

    var customerAddress;
    if(deliveryService == 1) {
        if (pickupCity !== undefined) {
            customerAddress = pickupCity[0] + ", " + pickupAddress;
        } else {
            $.notify("<b>Ошибка! Укажите адрес доставки.</b>",
                {
                    type: "danger",
                    delay: 1000
                });
            return;
        }

    } else {
        if (custAddr !== undefined) {
            customerAddress = custAddr;
        } else {
            $.notify("<b>Ошибка! Укажите адрес доставки.</b>",
                {
                    type: "danger",
                    delay: 1000
                });
            return;
        }

    }

    if (customerName != '' && customerAddress != '') {
        var data = {};
        $.ajax({
            url: "/cart/load",
            type: "post",
            dataType: "json",
            async: false,

            success: function(response) {
                if (response.itemsCount > 0) {
                    data.amount = response.totalAmount;
                    $.each(response.cartItems, function() {
                        items.push(this);
                    });
                    data.items = items;
                    data.deliveryService = deliveryService;

                    var deliveryType = 2;
                    if (deliveryService == 1) {
                        deliveryType = 1;
                    }
                    data.deliveryType = deliveryType;
                    data.paymentType = paymentType;
                    data.customerName = customerName;
                    data.customerPhone = customerPhone;
                    data.customerAddress = customerAddress;

                    saveOrder(data);

                } else {
                    $.notify("<b>Корзина пустая, вы не можете совершить заказ!</b>",
                        {
                            type: "danger",
                            delay: 1000
                        });
                }
            }
        });

    } else {
        $.notify("<b>Ошибка! Не все поля заполнены</b>",
            {
                type: "danger",
                delay: 1000
            });
    }
}

function saveOrder(data) {
    $.ajax({
        type: "post",
        url: "/order/save",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(data),

        success: function(response){
            if (response.status == "ok") {
                $('#contacts-data').hide();
                $('#payment-address').hide();
                $('#order-success').fadeIn(500);

                $.post('/cart/clear_all');
            } else {
                $.notify("<b>Ошибка! Проверьте правильность введенных данных</b>",
                    {
                        type: "danger",
                        delay: 1000
                    });
            }
        },
        error: function() {
            $.notify("<b>Ошибка! Не удалось сохранить заказ</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
}

function getCustomerFullAddresses() {
    customerAddresses = [];
    $.ajax({
        type: "post",
        url: "/customer/get_addresses",
        dataType: "json",
        success: function(response){
            if (response.length > 0) {
                $.each(response, function() {
                    var address = {};
                    address.id = this.id;
                    if (this.flat != null) {
                        address.text = "г. "+this.city +", ул. "+this.street+", д. "+this.house+", кв. "+this.flat;
                    } else {
                        address.text = "г. "+this.city +", ул. "+this.street+", д. "+this.house;
                    }
                    customerAddresses.push(address);
                    fillCustomerFullAddresses();
                });
            } else {
                $("#new-customer-address-form").css("display", "block");
            }
        },
        error: function() {
            $.notify("<b>Ошибка! Не удалось получить адресса пользователя</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
}

function fillCustomerFullAddresses() {
    $("#address").empty();
    $("#address").html('<option value="0" selected disabled>--- Выберите адрес доставки ---</option>');

    $.each(customerAddresses, function(i, val) {
        $("#address").append($("<option />").text(val.text));
    });

    $("#address").append('<option value="new">Добавить другой...</option>');

}

function getOfficeAddresses(city) {
    $.ajax({
        type: "post",
        url: "/cp/address/nova_poshta_offices",
        data: {city:city},
        dataType: "json",
        success: function(response){
            if (response.length > 0) {
                $("#shipping-address-pickup").empty();
                $.each(response, function(i, val) {
                    $("#shipping-address-pickup").append($("<option />").text(val));
                });
                $("#shipping-address-pickup").prop("disabled", false);
            }
        },
        error: function() {
            $.notify("<b>Ошибка! Не удалось получить адрес офиса</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
}

function getCustomerCities() {
    customerCities = [];
    $.ajax({
        type: "post",
        url: "/customer/get_cities",
        dataType: "json",
        success: function(response){
            if (response.length > 0) {
                $.each(response, function(i, val) {
                    customerCities.push(val);
                });
                fillCities();
            }
        },
        error: function() {
            $.notify("<b>Ошибка! Не удалось получить адресса пользователя</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
}

function fillCities() {
    $("#courier-city").empty();
    $("#shipping-address-pickup").empty();
    $("#courier-city").html('<option value="0" selected disabled>--- Выберите город отделения ---</option>');
    $("#shipping-address-pickup").html('<option value="0" selected disabled>--- Выберите адрес отделения ---</option>');
    $("#shipping-address-pickup").prop("disabled", true);

    $.each(customerCities, function(i, val) {
        $("#courier-city").append($("<option />").text(val));
    });
}


function removePhone() {
    $("#customer-phone").hide();
    $("#remove-phone").hide();
    $("#newPhoneInput").show();
}


