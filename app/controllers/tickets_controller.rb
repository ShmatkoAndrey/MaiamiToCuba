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

    redirect_to paypal_url("")
  end

  def paypal_url(return_path)
    values = {
        business: "shmatuan-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: id,
        amount: price,
        item_name: "Ferry tickets",
        item_number: number,
        quantity: '1'
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end


end