var customerAddresses = [];
var officesAddresses = [];
var products = [];
var customerId = 0;
var productId = 0;
var productQuantity = 0;
var deliverType = 0;
var servicePickup = 0;
var serviceCourier = 0;
var paymentType = 0;
var addressPickup = '';
var addressCourier = '';

function saveOrder() {
    if (productId != 0 && productQuantity != 0 && products.length > 0 && customerId != 0 && deliverType != 0 &&
        (servicePickup != 0 || serviceCourier != 0) && (addressPickup != '' || addressCourier != '') && paymentType != 0) {

        var order = {};
        order.amount = 0;
        $.each(products, function(i, item){
            order.amount += item.totalItemPrice;
        });
        order.deliveryType = deliverType;
        order.paymentType = paymentType;
        order.customer = customerId;
        if (servicePickup != 0) {
            order.deliveryService = servicePickup;
        } else if (serviceCourier != 0) {
            order.deliveryService = serviceCourier;
        }
        if (addressPickup != '') {
            order.customerAddress = addressPickup;
        } else if (addressCourier != '') {
            order.customerAddress = addressCourier;
        }
        order.items = products;

        $.ajax({
            type: "post",
            url: "/cp/order/save",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(order),
            success: function(response){
                if (response.status == "ok") {
                    $.notify("<b>Заказ успешно сохранен</b>",
                        {
                            type: "success",
                            delay: 1000,
                            onClose: function(){
                                history.back();
                            }
                        });
                } else if (response.status == "validationError") {
                    $.notify("<b>Ошибка! Проверьте правильность введенных параметров.</b>",
                        {
                            type: "danger",
                            delay: 1000
                        });
                } else {
                    $.notify("<b>Ошибка при сохранении. Повторите позже.</b>",
                        {
                            type: "danger",
                            delay: 1000
                        });
                }
            },
            error: function() {
                $.notify("<b>Ошибка запроса сохранения</b>",
                    {
                        type: "danger",
                        delay: 1000
                    });
            }
        });
    } else {
        $.notify("<b>Ошибка! Не все данные заполнены</b>",
            {
                type: "danger",
                delay: 1000
            });
    }
}

function appendProductTable(product) {
    var $table =  $("#products");
    var str =   '<tr>' +
        '<td class="text-left">'+product.productName+'</td>' +
        '<td class="text-center">'+product.quantity+'</td>' +
        '<td class="text-center">'+product.price+'</td>' +
        '<td class="text-center">'+product.totalItemPrice+'</td>' +
        '</tr>';

    if($table.css("display") == "none") {
        $table.show();
    }
    $table.append(str);
}

function getCustomerAddresses() {
    customerAddresses = [];
    $.ajax({
        type: "post",
        url: "/cp/customer/get_addresses",
        data: {id:customerId},
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

function getOfficeAddresses(city) {
    officesAddresses = [];
    $.ajax({
        type: "post",
        url: "/cp/address/nova_poshta_offices",
        data: {city:city},
        dataType: "json",
        success: function(response){
            if (response.length > 0) {
                $.each(response, function(i, val) {
                    $("#shipping-address-pickup").append($("<option />").text(val));
                });
                $("#shipping-address-pickup").prop("disabled", false);
            }
        },
        error: function() {
            $.notify("<b>Ошибка! Не удалось получить адресса офиса</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
}

function getCustomerCities() {
    $.ajax({
        type: "post",
        url: "/cp/customer/get_cities",
        data: {id:customerId},
        dataType: "json",
        success: function(response){
            if (response.length > 0) {
                $("#courier-city").empty();
                $("#shipping-address-pickup").empty();
                $("#courier-city").html('<option value="0" selected disabled>--- Выберите город отделения ---</option>');
                $("#shipping-address-pickup").html('<option value="0" selected disabled>--- Выберите адрес отделения ---</option>');
                $("#shipping-address-pickup").prop("disabled", true);

                $.each(response, function(i, val) {
                    $("#courier-city").append($("<option />").text(val));
                });
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

$(function(){
    var $productNameSelect = $("#product-name");
    var $customerNameSelect = $("#customer-name");

    $("#courier-city").change(function(){
        var city = $('#courier-city :selected').text();
        city = city.split(', ');
        getOfficeAddresses(city[0]);
    });


    $("#btn-add-order").on("click", function(){
        saveOrder();
    });

    $("#shipping-service-pickup").change(function(){
        servicePickup = $(this).val();
    });

    $("#shipping-service-courier").change(function(){
        serviceCourier = $(this).val();
    });

    $("#shipping-address-pickup").change(function(){
        addressPickup = $(this).val();
    });

    $("#shipping-address-courier").change(function(){
        addressCourier = $(this).val();
    });

    $("#payment-type").change(function(){
        paymentType = $(this).val();
    });

    $('#delivery-type').change(function(){
        deliverType = $(this).val();
        $("#shipping-service-pickup").prop("disabled", false);
        if (deliverType == '1') {
            $('#shipping-service-pickup').show();
            $('#courier-city-block').show();
            $('#shipping-address-pickup').show();

            $('#shipping-service-courier').hide();
            $('#shipping-address-courier').hide();
            $("#courier-city").prop("disabled", false);
            getCustomerCities();
        } else {
            $('#shipping-service-courier').show();
            $('#shipping-address-courier').show();
            $('#shipping-service-pickup').hide();
            $('#shipping-address-pickup').hide();
            $('#courier-city-block').hide();

            $("#shipping-address-courier").html('<option value="0" selected disabled>--- Выберите адрес пользователя ---</option>');
            $.each(customerAddresses, function() {
                $("#shipping-address-courier").append($("<option />").text(this.text));
            });

        }
    });

    $("#btn-add-product").on("click", function(){
        productQuantity = $("#product-quantity").val();
        if (productId != 0 && productQuantity != 0) {
            $.ajax({
                type: "post",
                url: "/cp/product/load_by_id",
                data: {id:productId},
                dataType: "json",
                success: function(response){
                    var product = {};
                    product.quantity = productQuantity;
                    product.price = response.price;
                    product.totalItemPrice = response.price * productQuantity;
                    product.product = response.id;
                    product.productName = response.name;
                    products.push(product);
                    appendProductTable(product);
                },
                error: function() {
                    $.notify("<b>Ошибка! Не удалось добавить товар</b>",
                        {
                            type: "danger",
                            delay: 1000
                        });
                }
            });
        }
    });

    $("#btn-add-address").on("click", function() {
        var city = $('#newCityInput').val().trim();
        var street = $('#newStreetInput').val().trim();
        var house = $('#newHouseInput').val().trim();
        var flat = $('#newFlatInput').val().trim();

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

        if (flat.length == 0) {
            flat = null;
        }

        var data = {customer:customerId, city:city, street:street, house:house, flat:flat};
        $.ajax({
            type: "post",
            url: "/cp/customer/save_address",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            success: function(response){
                if (response.status == "ok") {
                    $.notify("<b>Адрес успешно добавлен</b>",
                        {
                            type: "success",
                            delay: 1000
                        });
                    getCustomerAddresses();
                    $("#new-customer-address-form").css("display", "none");

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

    $productNameSelect.on("select2:select", function (e) {
        productId = $(this).val();
    });

    $productNameSelect.select2({
        id: function(e) { return e.id; },
        language: "ru",
        minimumInputLength: 1,
        ajax: {
            url: "/cp/product/load_by_name",
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    name: params.term,
                    page: params.page
                };
            },
            processResults: function (data, page) {
                var select2Data = $.map(data.suggestions, function (obj) {
                    obj.text = obj.name;
                    return obj;
                });
                return {
                    results: select2Data,
                    pagination: {
                        more: data.more
                    }
                };
            },
            cache: true
        },
        transport: function (params, success, failure) {
            var $request = $.ajax(params);
            $request.then(success);
            $request.fail(failure);
            return $request;
        }
    });


    $customerNameSelect.on("select2:select", function (e) {
        customerId = $(this).val();
        $("#delivery-type").prop("disabled", false);
        getCustomerAddresses();
    });

    $customerNameSelect.select2({
        id: function(e) { return e.id; },
        language: "ru",
        minimumInputLength: 1,
        ajax: {
            url: "/cp/customer/load_by_name",
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    name: params.term,
                    page: params.page
                };
            },
            processResults: function (data, page) {
                var select2Data = $.map(data.suggestions, function (obj) {
                    obj.text = obj.name;
                    return obj;
                });
                return {
                    results: select2Data,
                    pagination: {
                        more: data.more
                    }
                };
            },
            cache: true
        },
        transport: function (params, success, failure) {
            var $request = $.ajax(params);
            $request.then(success);
            $request.fail(failure);
            return $request;
        }
    });
});