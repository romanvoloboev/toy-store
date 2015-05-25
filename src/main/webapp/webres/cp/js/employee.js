function changeEmployeeStatus(id) {
    $.post("/cp/employee/change_status", {id:id}, function(response){
        if(response.status == 'ok') {
            $.notify("<b>Вы успешно изменили статус сотрудника</b>",
                {
                    type: "success",
                    delay: 1000,
                    onClose: function(){
                        location.reload();
                    }
                });
        } else if (response.status == "no_access") {
            $.notify("<b>У вас недостаточно прав для этого дествия</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        } else {
            $.notify("<b>Ошибка. Повторите позже.</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
}

function deleteEmployee(id) {
    $.post("/cp/employee/delete", {id:id}, function(response){
        if(response.status == 'ok') {
            $.notify("<b>Вы успешно изменили статус сотрудника</b>",
                {
                    type: "success",
                    delay: 1000,
                    onClose: function(){
                        location.reload();
                    }
                });
        } else if (response.status == "no_access") {
            $.notify("<b>У вас недостаточно прав для этого дествия</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        } else {
            $.notify("<b>Ошибка. Повторите позже.</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
}

function editEmployee(id) {
    $.post("/cp/employee/check_access", function(response){
        if(response.status == "ok") {
            location.href = "/cp/employee/edit?id="+id;
        } else if (response.status == "no_access") {
            $.notify("<b>У вас недостаточно прав для этого дествия</b>",
                {
                    type: "danger",
                    delay: 1000
                });
        }
    });
}

$(function() {
    $("#addEmployee").on("click", function() {
        $.post("/cp/employee/check_access", function(response){
            if(response.status == "ok") {
                location.href = "/cp/employee/add";
            } else if (response.status == "no_access") {
                $.notify("<b>У вас недостаточно прав для этого дествия</b>",
                    {
                        type: "danger",
                        delay: 1000
                    });
            }
        });
    });
});