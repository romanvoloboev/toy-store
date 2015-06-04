$(function(){
    $('#save-category').click(function(){
        var id = 0;
        if( $("#category-id").length ) {
            id = $("#category-id").val();
        }
        var name = $('#category-name').val();
        $.post('/cp/category/save', {id:id, name:name}, function(response) {
            if(response.status == 'ok') {
                $.notify("<b>Вы успешно сохранили категорию</b>",
                    {
                        type: "success",
                        delay: 1000,
                        onClose: function(){
                            history.back();
                        }
                    });
            } else {
                $.notify("<b>Невозможно сохранить категорию, повторите попытку позже</b>",
                    {
                        type: "danger",
                        delay: 1000
                    });
            }
        });
    });
});

function deleteCategory(id) {
    $.post('/cp/category/delete', {id:id}, function(response) {
        if(response.status == 'ok') {
            $.notify("<b>Вы успешно удалили категорию</b>",
                {
                    type: "success",
                    delay: 1000,
                    onClose: function(){
                        location.reload();
                    }
                });
        } else {
            $.notify("<b>Невозможно удалить категорию, повторите попытку позже</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
}

function deleteSubCategory(id) {
    $.post('/cp/subcategory/delete', {id:id}, function(response) {
        if(response.status == 'ok') {
            $.notify("<b>Вы успешно удалили подкатегорию</b>",
                {
                    type: "success",
                    delay: 1000,
                    onClose: function(){
                        location.reload();
                    }
                });
        } else {
            $.notify("<b>Невозможно удалить подкатегорию, повторите попытку позже</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
}

function changeCategoryStatus(id) {
    $.post('/cp/category/change_status', {id:id}, function(response) {
        if(response.status == 'ok') {
            $.notify("<b>Вы успешно изменили статус категории</b>",
                {
                    type: "success",
                    delay: 1000,
                    onClose: function(){
                        location.reload();
                    }
                });
        } else {
            $.notify("<b>Невозможно изменить статус, повторите попытку позже</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
}

function changeSubCategoryStatus(id) {
    $.post('/cp/subcategory/change_status', {id:id}, function(response) {
        if(response.status == 'ok') {
            $.notify("<b>Вы успешно изменили статус подкатегории</b>",
                {
                    type: "success",
                    delay: 1000,
                    onClose: function(){
                        location.reload();
                    }
                });
        } else {
            $.notify("<b>Невозможно изменить статус, повторите попытку позже</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
}

