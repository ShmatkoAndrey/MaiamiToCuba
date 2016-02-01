function ferry(id){
    $.ajax({
        type: 'GET',
        url: 'ferries/sheep?' + "timetable=" + id,
        dataType: 'script'
    });
}

function place(place_id) {
    var places = $('#places');
    _place = $(place_id);
    if (_place.hasClass('place-choose')) {
        _place.removeClass('place-choose');
        $('#placeN'+place_id.id).remove();
        str = place_id.id + ', ';
        places.text(places.text().replace(str, ''))

    }
    else {
        _place.addClass('place-choose');
        places.append('<input name="place' + place_id.id + '" id="placeN' + place_id.id + '" type="hidden">');
        places.append(place_id.id + ', ');
    }
}