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
    date = @timetable.date
    @ft = Timetable.where(date: date.beginning_of_day..date.end_of_day).order('date')
  end

end