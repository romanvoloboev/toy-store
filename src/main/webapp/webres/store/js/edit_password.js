$(function(){
    function validatePassword() {
        var password = $("#password").val();
        var confirmPassword = $("#confirmPassword").val();
        return password != '' && password == confirmPassword;
    }

    $("#confirmPassword").on('keyup', function() {
        if (!validatePassword()) {
            $('#passMismatchMsg').fadeIn(500).html('<b>Внимание! </b>Пароль не совпадает.');
            $('#changePassBtn').prop("disabled", true);
        } else {
            $('#passMismatchMsg').fadeOut(500);
            $('#changePassBtn').prop("disabled", false);
        }
    });

    $("#confirmPassword, #password").on('mousedown', function(){
        $('#passMismatchMsg').fadeOut(500);
    });

    $('#changePassBtn').click(function(){
        var old_password = $("#oldPassword").val().trim();
        var new_password = $("#password").val().trim();
        var repeat_new_pass = $("#confirmPassword").val().trim();

        $.post('/customer_change_password', {old_password:old_password, new_password:new_password, repeat_new_pass:repeat_new_pass}, function(response) {
            if(response.status == 'ok') {
                $.notify("<b>Пароль успешно изменен</b>",
                    {
                        delay: 1000,
                        onClose: function(){
                            window.location.href = "/profile";
                        }
                    });
            } else if(response.status == "wrongRepeatPassword") {
                $.notify("<b>Вы ввели не верный проверочный пароль</b>",
                    {
                        type: "danger",
                        delay: 1500
                    });
            } else if(response.status == "wrongOldPassword") {
                $.notify("<b>Вы ввели неверный старый пароль</b>",
                    {
                        type: "danger",
                        delay: 1500
                    });
            } else {
                $.notify("<b>Не удалось изменить пароль, повторите попытку позже</b>",
                    {
                        type: "danger",
                        delay: 1500
                    });
            }
        });
    });

});