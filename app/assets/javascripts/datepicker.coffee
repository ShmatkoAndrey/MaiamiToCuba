$(document).ready ->


  $( ".date" ).datepicker
    onSelect: (dateText) ->
      selectedDate = new Date(dateText)
      alert selectedDate