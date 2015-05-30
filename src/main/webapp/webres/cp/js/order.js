var customerId = 0;

function changeStatus(id, status) {
    $.post("/cp/order/change_status", {id:id, status:status}, function(response){
        if(response.status == "ok") {
            location.reload();
        } else {
            $.notify("<b>Не удалось изменить статус заказа</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });

    return false;
}

function deleteOrder(id) {
    $.post("/cp/order/delete", {id:id}, function(response){
        if(response.status == "ok") {
            $.notify("<b>Заказ успешно удален</b>",
                {
                    type: "success",
                    delay: 1000,
                    onClose: function(){
                        location.reload();
                    }
                });
        } else {
            $.notify("<b>Ошибка при удалении заказа!</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
}

$(function() {
    var $customerNameSelect = $("#customer");
    var URL = '/cp/order/search_by?';
    var orderStatus = 0;

    $customerNameSelect.on("select2:select", function (e) {
        customerId = $(this).val();
    });

    $('#search-btn').on('click', function() {
        var orderNumber = $("#order-number").val();
        orderStatus = $("#order-status :selected").val();

        if (orderNumber || orderStatus != 0 || customerId) {
            if (orderNumber) {
                URL += 'order=' + encodeURIComponent(orderNumber);
            }

            if (orderStatus != 0) {
                URL += '&status=' + encodeURIComponent(orderStatus);
            }

            if (customerId != 0) {
                URL += '&customer=' + encodeURIComponent(customerId);
            }
            location = URL;
        }
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