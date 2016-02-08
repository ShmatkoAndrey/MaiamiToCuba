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

    @url = paypal_url("")
    p 'url'*5
    p @url
    respond_to do |format|
      format.js
    end
  end


  def paypal_url(return_path)

    items_name = 'Ferry tickets'
    id = 4
    price = 125
    number = 5
    quantity = 1

    values = {
        business: 'shmatuan-facilitator@gmail.com',
        cmd: '_xclick',
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: id,
        amount: price,
        item_name: 'Ferry tickets' + items_name,
        item_number: number,
        quantity: quantity
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end


end