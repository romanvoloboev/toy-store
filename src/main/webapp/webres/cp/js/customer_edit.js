$(function(){
   $('#add-new-address-btn').click(function(e){
       e.preventDefault();
       $('#new-address-form').fadeIn(500);
       $('#add-new-address-btn').hide();
   });

    $('#save').click(function(){
        $('#new-address-form').hide();
        $('#add-new-address-btn').show();

        var city = $('#input-customer-city').val();
        var street = $('#street').val();
        var house = $('#house').val();
        var flat = $('#flat').val();

        addAddress(city, street, house, flat);

        //todo save to db and update address in #customer-address
    });

    $('#remove-address').click(function(e){
        e.preventDefault();

        //todo remove address
    });

});

function addAddress(city, street, house, flat){

}

function removeAddress(id){

}