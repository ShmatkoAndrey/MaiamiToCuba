function confirm_pay() {
    var timetable = $('#timetable_id').val();
    var places = $('#placeshidden').find('input');
    var email = $('#email');
    var placesSTR = '';

    for(var i = 0; i < places.length; i++) {
        placesSTR += places[i].name;
        if(i != places.length-1)  placesSTR += '-';
    }

    if(email.val() == '') {
        email.attr('border', '2px solid red;');
        alert('Please enter your email!')
    }
    else {
        $.ajax({
            type: 'POST',
            url: 'tickets/pay?' + 'timetable=' + timetable + '&places=' + placesSTR + '&email=' + email.val(),
            dataType: 'script'
        });
    }


}