$(function(){
    function validatePassword() {
        var password = $("#password").val();
        var confirmPassword = $("#confirmPassword").val();
        return password != '' && password == confirmPassword;
    }

    $("#confirmPassword").on('keyup', function() {
        if (!validatePassword()) {
            $('#passMismatchMsg').fadeIn(500).html('<strong>Внимание! </strong>Пароль не совпадает.');
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
                // todo: notify OK and reload page
            } else {
                // todo: notify ERROR
            }
        });
    });

});