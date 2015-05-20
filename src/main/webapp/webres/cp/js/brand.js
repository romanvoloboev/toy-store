var brandName = "";
var brandCountry = "";
var brandId = "";

$(function() {
    $('#save-brand').click(function (){
        brandName = $("#brand-name").val();
        brandCountry = $("#brand-country").val();
        saveBrand(brandId, brandName, brandCountry);
    });

    $('#update-brand').click(function (){
        brandName = $("#brand-name").val();
        brandCountry = $("#brand-country").val();
        brandId = $("#brand-id").val();
        saveBrand(brandId, brandName, brandCountry);
    });

});

function saveBrand(id, name, country) {
    if(name != "" && country != "") {
        var data;
        if(id == "") {
            data = {name:name, country:country};
        } else {
            data = {id:id, name:name, country:country};
        }
        $.post("/cp/brand/save", data, function(response) {
            if(response.status == 'ok') {
                $.notify("<b>Вы успешно сохранили производителя</b>",
                    {
                        type: "success",
                        delay: 1000,
                        onClose: function(){
                            history.back();
                        }
                    });
            } else if (response.status == 'wrongParams') {
                $.notify("<b>Ошибка! Проверьте правильность введеных данных</b>",
                    {
                        type: "danger",
                        delay: 1500
                    });
            } else {
                $.notify("<b>Не удалось сохранить производителя, повторите попытку позже</b>",
                    {
                        type: "danger",
                        delay: 1500
                    });
            }
        });
    } else {
        $.notify("<b>Ошибка! Вы заполнили не все поля</b>",
            {
                type: "danger",
                delay: 1000
            });
    }
}

function changeBrandStatus(id) {
    $.post("/cp/brand/change_status", {id:id}, function(response) {
        if(response.status == 'ok') {
            $.notify("<b>Вы успешно изменили статус производителя</b>",
                {
                    type: "success",
                    delay: 1000,
                    onClose: function(){
                        location.reload();
                    }
                });
        } else {
            $.notify("<b>Не удалось изменить статус, повторите попытку позже</b>",
                {
                    type: "danger",
                    delay: 1500
                });
        }
    });
}

function deleteBrand(id) {
    $.post("/cp/brand/delete", {id:id}, function(response) {
        if(response.status == 'ok') {
            $.notify("<b>Вы успешно удалили производителя</b>",
                {
                    type: "success",
                    delay: 1000,
                    onClose: function(){
                        location.reload();
                    }
                });
        } else {
            $.notify("<b>Не удалось удалить производителя, повторите попытку позже</b>",
                {
                    type: "danger",
                    delay: 1500
                });
        }
    });
}
