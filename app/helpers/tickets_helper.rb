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

  def busy(name, timetable)
    place_id = Place.where(ferry_id: timetable.ferry.id, name: name).first.id
    !Ticket.where(timetable_id: timetable.id, place_id: place_id).empty?
  end

end
