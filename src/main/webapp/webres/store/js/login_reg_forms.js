$(function(){
    function validatePassword() {
        var password = $("#password").val();
        var confirmPassword = $("#confirmPassword").val();
        return password != '' && password == confirmPassword;
    }

    $('#register-form').submit(function(e){
        if (validatePassword()) {
            $.post('/customer_sign_up', $('#register-form').serialize(), function(response){
                if(response.status == 'ok') {
                    $.ajax({
                        url: '/check_customer',
                        data: {username: $("#email").val(), password: $("#password").val()},
                        dataType: 'json',
                        type: 'POST',
                        complete: function(){
                            document.location.href = '/profile';
                        }
                    });
                } else if(response.status == 'exist') {
                    document.location.href = '/customer_login?exist=true';
                } else {
                    document.location.href = '/customer_login?error=true';
                }
            });
        } else {
            $('#passMismatchMsg').fadeIn(500).html('<strong>Внимание! </strong>Пароль не совпадает.');
        }
        e.preventDefault();
    });

    //$('#change-pass-form').submit(function(e){
    //    if (validatePassword()) {
    //        $.post('/service/sign_up', $('#register-form').serialize(), function(response){
    //            if(response.status == 'ok'){
    //                document.location.href = '/create_account_info?email=' + $('#email').val()
    //            } else if(response.status == 'already exist'){
    //                document.location.href = '/login?exist=true'
    //            } else{
    //                //$.bootstrapGrowl("Невозможно создать аккаунт. Повторите попытку позже.",
    //                //    {
    //                //        type: 'danger',
    //                //        align: 'center',
    //                //        allow_dismiss: false,
    //                //        width: 'auto',
    //                //        stackup_spacing: 100
    //                //    });
    //                $('#notification').fadeIn(500).html('Невозможно создать аккаунт. Повторите попытку позже.');
    //            }
    //        });
    //    } else {
    //        $('#passMismatchMsg').fadeIn(500).html('<strong>Внимание! </strong>Пароль не совпадает.');
    //    }
    //    e.preventDefault();
    //});

    //$('#edit-profile-form').submit(function(e){
    //    if (validatePassword()) {
    //        $.post('/service/sign_up', $('#register-form').serialize(), function(response){
    //            if(response.status == 'ok'){
    //                document.location.href = '/create_account_info?email=' + $('#email').val()
    //            } else if(response.status == 'already exist'){
    //                document.location.href = '/login?exist=true'
    //            } else{
    //                //$.bootstrapGrowl("Невозможно создать аккаунт. Повторите попытку позже.",
    //                //    {
    //                //        type: 'danger',
    //                //        align: 'center',
    //                //        allow_dismiss: false,
    //                //        width: 'auto',
    //                //        stackup_spacing: 100
    //                //    });
    //                $('#notification').fadeIn(500).html('Невозможно создать аккаунт. Повторите попытку позже.');
    //            }
    //        });
    //    } else {
    //        $('#passMismatchMsg').fadeIn(500).html('<strong>Внимание! </strong>Пароль не совпадает.');
    //    }
    //    e.preventDefault();
    //});

    $("#confirmPassword").on('keyup', function() {
        if (!validatePassword()) {
            $('#passMismatchMsg').fadeIn(500).html('<strong>Внимание! </strong>Пароль не совпадает.');
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