function direction() {
    from = $("#direction_to").val();
    $("#direction_to").val($("#direction_from").val());
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

window.onload = function() {

    var date = new Date(Date.now());

    var d = new Date(),
        output = [
            ('0' + (d.getMonth() + 1)).substr(-2),
            ('0' + d.getDate()).substr(-2),
            d.getFullYear()
        ].join('/');

    $('#date_field').val(output);

    var direction = '';
    $.ajax({
        type: 'GET',
        url: 'ferries/find?' +
        'date=' + date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate() +
        '&direction=' + direction,
        dataType: 'script'
    });
};