function changeCustomerStatus(id) {
    $.post("/cp/customer/change_status", {id:id}, function(response){
        if(response.status == 'ok') {
            $.notify("<b>Вы успешно изменили статус пользователя</b>",
                {
                    type: "success",
                    delay: 1000,
                    onClose: function(){
                        location.reload();
                    }
                });
        } else {
            $.notify("<b>Не удалось изменить статус пользователя</b>",
                {
                    type: "danger",
                    delay: 1000,
                    onClose: function(){
                        location.reload();
                    }
                });
        }
    });
}

function deleteCustomer(id) {
    $.post("/cp/customer/delete", {id:id}, function(response){
        if(response.status == 'ok') {
            $.notify("<b>Вы успешно удалили пользователя</b>",
                {
                    type: "success",
                    delay: 1000,
                    onClose: function(){
                        location.reload();
                    }
                });
        } else {
            $.notify("<b>Не удалось удалить пользователя</b>",
                {
                    type: "danger",
                    delay: 1000,
                    onClose: function(){
                        location.reload();
                    }
                });
        }
    });
}

$(function() {
    var $customerNameSelect = $("#customer-name");
    var $customerEmailSelect = $("#customer-email");

    $customerNameSelect.on("select2:select", function (e) {
        location.href = "/cp/customer/search_by?id="+$(this).val();
    });

    $customerEmailSelect.on("select2:select", function (e) {
        location.href = "/cp/customer/search_by?id="+$(this).val();
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

    $customerEmailSelect.select2({
        id: function(e) { return e.id; },
        language: "ru",
        minimumInputLength: 1,
        ajax: {
            url: "/cp/customer/load_by_email",
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    email: params.term,
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
