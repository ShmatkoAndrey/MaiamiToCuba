function confirm_pay() {
    var timetable = $('#timetable_id').val();
    var places = $('#placeshidden input');
    var placesSTR = '';

    for(var i = 0; i < places.length; i++) {
        placesSTR += places[i].name;
        if(i != places.length-1)  placesSTR += '-';
    }

    $.ajax({
        type: 'POST',
        url: 'tickets/pay?' + 'timetable=' + timetable + '&places=' + placesSTR,
        dataType: 'script'
    });
}