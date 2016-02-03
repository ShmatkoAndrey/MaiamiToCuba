class TicketsController < ApplicationController

  def new
  end
  
  def pay
    @timetable = Timetable.find(params[:timetable])
    @sheep = @timetable.ferry
    places = params[:places].split('-')
    places.each do |place_name|
      place = Place.find_by(name: place_name, ferry_id: @sheep)
      Ticket.create(place_id: place.id,  timetable_id: @timetable.id)
    end
  end

end