function changeReviewStatus(id) {
    $.post("/cp/review/change_status", {id:id}, function(response){
        if(response.status == 'ok') {
            $.notify("<b>Вы успешно изменили статус отзыва</b>",
                {
                    type: "success",
                    delay: 1000,
                    onClose: function(){
                        location.reload();
                    }
                });
        } else {
            $.notify("<b>Не удалось изменить статус отзыва</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
}

function deleteReview(id) {
    $.post("/cp/review/delete", {id:id}, function(response){
        if(response.status == 'ok') {
            $.notify("<b>Вы успешно удалили отзыв</b>",
                {
                    type: "success",
                    delay: 1000,
                    onClose: function(){
                        location.reload();
                    }
                });
        } else {
            $.notify("<b>Не удалось удалить отзыв</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
}


$(function() {
    var $customerNameSelect = $("#customer-name");
    var $productNameSelect = $("#product-name");

    $customerNameSelect.on("select2:select", function (e) {
        location.href = "/cp/review/search_by_customer?id="+$(this).val();
    });

    $productNameSelect.on("select2:select", function (e) {
        location.href = "/cp/review/search_by_product?id="+$(this).val();
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

});
