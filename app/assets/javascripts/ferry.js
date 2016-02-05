function ferry(id){
    $.ajax({
        type: 'GET',
        url: 'ferries/sheep?' + "timetable=" + id,
        dataType: 'script'
    });
}

function place(place_id) {
    pl = $(place_id);
    var placehidden = $('#placeshidden');
    var hidden_fields = $('.hidden_fields');
    var type = "add";
    if (pl.hasClass('place-choose')) {
        pl.removeClass('place-choose');
        $('#placeN'+place_id.id).remove();
        if(placehidden.find('input').length == 0) hidden_fields[0].style.display = "none";
        type = 'remove';
        $('#ticket' + place_id.id).remove()
    }
    else {
        pl.addClass('place-choose');
        placehidden.append('<input name="' + place_id.id + '" id="placeN' + place_id.id + '" type="hidden">');
        if(hidden_fields[0].style.display != "inline-block") hidden_fields[0].style.display = "inline-block"
    }

    $.ajax({
        type: 'GET',
        url: 'ferries/add_ticket?' + 'place=' + place_id.id + '&timetable=' + $('#timetable_id').val() + '&type_cost='+type,
        dataType: 'script'
    });
}