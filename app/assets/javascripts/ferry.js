function ferry(id){
    $.ajax({
        type: 'GET',
        url: 'ferries/sheep?' + "timetable=" + id,
        dataType: 'script'
    });
}

function place(place_id) {
    var places = $('#places');
    var placehidden = $('#placeshidden');
    var type = "add";
    _place = $(place_id);
    if (_place.hasClass('place-choose')) {
        _place.removeClass('place-choose');
        $('#placeN'+place_id.id).remove();
        str = place_id.id + ', ';
        places.text(places.text().replace(str, ''))
        if($('#placeshidden input').length == 0) $('.hidden_fields')[0].style.display = "none";
        type = 'remove';
    }
    else {
        _place.addClass('place-choose');
        placehidden.append('<input name="' + place_id.id + '" id="placeN' + place_id.id + '" type="hidden">');
        places.append(place_id.id + ', ');
        if($('.hidden_fields')[0].style.display != "block") $('.hidden_fields')[0].style.display = "block"
    }

    $.ajax({
        type: 'GET',
        url: 'ferries/cost?' + 'place=' + place_id.id + '&timetable=' + $('#timetable_id').val() + '&type_cost='+type,
        dataType: 'script'
    });
}