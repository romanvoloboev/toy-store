$(function(){
    function validatePassword() {
        var password = $("#password").val();
        var confirmPassword = $("#confirmPassword").val();
        return password != '' && password == confirmPassword;
    }

    $('#createBtn').on("click", (function(e){
        if (validatePassword()) {
            var data = {name: $("#name").val(), email: $("#email").val(), password: $("#confirmPassword").val()};
            $.ajax({
                url: "/customer_sign_up",
                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data : JSON.stringify(data),

                success: function(response) {
                    if (response.status == "ok") {
                        location.href = '/';
                    } else if (response.status == 'exist') {
                        location.href = '/customer_login?exist=true';
                    } else if (response.status == 'wrongParams') {
                        location.href = '/customer_login?params_error=true';
                    }
                    else {
                        location.href = '/customer_login?error=true';
                    }
                },
                error: function(xhr, status, error) {
                    $.notify("<b>Не удалось создать аккаунт. Что-то пошло не так...</b>",
                        {
                            type: "danger",
                            delay: 1500
                        });
                }
            })
        } else {
            $('#passMismatchMsg').fadeIn(500).html('<b>Внимание! </b>Пароль не совпадает.');
        }
        e.preventDefault();
    }));

    $("#confirmPassword").on('keyup', function() {
        if (!validatePassword()) {
            $('#passMismatchMsg').fadeIn(500).html('<b>Внимание! </b>Пароль не совпадает.');
            $('#createBtn').prop("disabled", true);
        } else {
            $('#passMismatchMsg').fadeOut(500);
            $('#createBtn').prop("disabled", false);
        }
    });

    $("#confirmPassword, #password").on('mousedown', function(){
        $('#passMismatchMsg').fadeOut(500);
    });

});