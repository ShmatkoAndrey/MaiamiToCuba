module FerriesHelper

  def unoccupied_places(timetable)
    places = timetable.ferry.places
    busy_places = Ticket.where(timetable_id: timetable.id)
    places.length - busy_places.length
  end

  def min_max_price(ferry)
    places = ferry.places.order('price')
    if places.first.price == places.last.price
      "$#{places.first.price}"
    else
      "$#{places.first.price}-$#{places.last.price}"
    end
  end

end
