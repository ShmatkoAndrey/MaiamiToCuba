$(document).ready(function() {
    $("#date_field").datepicker({
        onSelect: function(dateText) {
            var selectedDate;
            selectedDate = new Date(dateText);
            if (selectedDate >= Date.now() - 86400000) {
                return $('#error_date').html('');
            } else {
                return $('#error_date').html('Past date');
            }
        }
    });
});