google.maps.event.addDomListener(window, 'load', initialize);
var autocomplete;
var componentForm = {
    locality: 'long_name',
    administrative_area_level_1: 'long_name'
};

function initialize() {
    var options = {
        types: ['(cities)'],
        componentRestrictions: {country: "ua"}
    };
    var input = document.getElementById('newCityInput');
    autocomplete = new google.maps.places.Autocomplete(input, options);

    google.maps.event.addListener(autocomplete, 'place_changed', function() {
        fillInAddress();
    });
}

function fillInAddress() {
    var place = autocomplete.getPlace();
    var val = '';
    for (var i = 0; i < place.address_components.length; i++) {
        var addressType = place.address_components[i].types[0];
        if(place.address_components[0].types[0] == 'administrative_area_level_3') {
            val = '';
            $.notify("<b>Вы не можете выбрать горсовет!</b>",
                {
                    type: "danger",
                    delay: 2000
                });
        }
        if (componentForm[addressType]) {
            if(val.length > 0) {
                val = val + ', ';
            }
            val = val + place.address_components[i][componentForm[addressType]];
        }

    }
    val = val.replace(/область/g, 'обл.');
    document.getElementById("newCityInput").value = val;
}