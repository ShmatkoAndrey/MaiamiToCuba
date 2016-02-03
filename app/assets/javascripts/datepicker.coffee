$(document).ready ->

  $( "#date" ).datepicker
    onSelect: (dateText) ->
      selectedDate = new Date(dateText)
      if selectedDate >= Date.now() - 86400000
        $.ajax
          type: 'GET'
          url: 'ferries/find?' + "date=" + selectedDate.getFullYear()+"-"+(selectedDate.getMonth()+1)+"-"+selectedDate.getDate()
          dataType: 'script'
      else
        $('#ferries').html('<div class = "error">It last day!</div>')