module FerriesHelper

  def unoccupied_places(timetable)
    places = timetable.ferry.places
    busy_places = Ticket.where(timetable_id: timetable.id)
    places.length - busy_places.length
  end

end
