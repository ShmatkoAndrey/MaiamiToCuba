$(document).ready ->


  $( "#date" ).datepicker
    onSelect: (dateText) ->
      selectedDate = new Date(dateText)
      $.ajax
        type: 'GET'
        url: 'ferries/find?' + "date=" + selectedDate.getFullYear()+"-"+(selectedDate.getMonth()+1)+"-"+selectedDate.getDate()
        dataType: 'script'