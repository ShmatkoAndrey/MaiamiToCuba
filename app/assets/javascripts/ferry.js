function ferry(id){
    $.ajax({
        type: 'GET',
        url: 'ferries/sheep?' + "timetable=" + id,
        dataType: 'script'
    });
}

function place(place_id){
    _place = $(place_id);
    if(!_place.hasClass('place-choose')) {_place.addClass('place-choose');}
    else{ _place.removeClass('place-choose');}
}