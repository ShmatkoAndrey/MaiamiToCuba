function direction(from, to) {
    $("#direction_to").val(to);
    $("#direction_from").val(from);
}

function search_tickets() {
    var form = $('#form');
    var date = new Date(form.find('#date_field').val());
    var direction = form.find('#direction_to').val();
    $.ajax({
        type: 'GET',
        url: 'ferries/find?' +
        'date=' + date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate() +
        '&direction=' + direction,
        dataType: 'script'
    });
}