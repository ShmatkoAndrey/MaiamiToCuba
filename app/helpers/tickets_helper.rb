module TicketsHelper

  def place(name, timetable)
    busy_place = busy(name, timetable)
    pl = '<div class="place '
    pl+='place-busy' if busy_place
    pl+= '" '
    pl+= 'onClick="place('+name+')"' unless busy_place
    pl+=' id="'+ name +'"></div>'
    pl
  end

  def busy_places(timetable)
    busy_places = Array.new
    Ticket.where(timetable_id: timetable.id).each do |ticket|
      busy_places << ticket.place
    end
    busy_places
  end

  def busy(name, busy_places)
    busy_places.any? {|place| place.name == name}
  end

  def place_html(n, id_str, buy_tickets)
    html = ''
    (1..n).each do |i|
      id = "#{id_str}#{i+1}"
      html += place(id, buy_tickets).html_safe
    end
    html
  end

end
