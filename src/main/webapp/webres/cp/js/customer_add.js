function validatePassword() {
    var password = $("#password").val();
    var confirmPassword = $("#password-confirm").val();
    return password != '' && password == confirmPassword;
}

var id = 0;
var type = 1;

$(function(){
    $("#phone").inputmask('+38(999)999-99-99');

    $("#password-confirm").on('keyup', function() {
        if (!validatePassword()) {
            $('#passMismatchMsg').fadeIn(500).html('<b>Внимание! </b>Пароль не совпадает.');
            $('#save').prop("disabled", true);
        } else if (validatePassword()) {
            $('#passMismatchMsg').fadeOut(500);
            $('#save').prop("disabled", false);
        }
    });

    $("#password-confirm, #password").on('mousedown', function() {
        $('#passMismatchMsg').fadeOut(500);
    });

    $('#save').click(function(){
        var name = $("#name").val();
        var email = $("#email").val();
        var phone = $("#phone").val();
        var password = $("#password").val();


        if (phone.indexOf('_') != -1) {
            $.notify("<b>Неверный формат телефона</b>",
                {
                    type: "danger",
                    delay: 1000
                });
            return;
        } else if (phone.indexOf('+38(___)___-__-__') != -1) {
            phone = '';
        }

        if ($('#customer-id').length) {
            id = $('#customer-id').val();
        }

        if ($('#employee-type').length) {
            type = $('select#employee-type').val();
        }
        console.log(type);

        var data = {id:id, name:name, email:email, phone:phone, password:password, role:type};

        $.ajax({
            url: "/cp/user/save",
            type: "POST",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            data : JSON.stringify(data),

            success: function(response) {
                if(response.status == 'ok') {
                    $.notify("<b>Вы успешно сохранили пользователя</b>",
                        {
                            type: "success",
                            delay: 1000,
                            onClose: function(){
                                history.back();
                            }
                        });
                } else if (response.status == 'error') {
                    $.notify("<b>Ошибка! Введенные данные не соответствуют требуемому формату</b>",
                        {
                            type: "danger",
                            delay: 1500
                        });
                }
            },
            error: function(xhr, status, error) {
                $.notify("<b>Не удалось сохранить пользователя. Что-то пошло не так...</b>",
                    {
                        type: "danger",
                        delay: 1500
                    });
            }
        })
    });
});