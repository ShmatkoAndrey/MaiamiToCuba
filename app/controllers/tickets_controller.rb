class TicketsController < ApplicationController

  def new
  end
  
  def pay
    paypal_values = {items_name: '', id: '', price: 0, number: ''}
    @timetable = Timetable.find(params[:timetable])
    paypal_values[:id] = "#{@timetable.id}-#{params[:places]}"
    paypal_values[:number] = params[:places]
    @sheep = @timetable.ferry
    places = params[:places].split('-')
    tickets_ids = ''
    places.each do |place_name|
      place = Place.find_by(name: place_name, ferry_id: @sheep)
      ticket = Ticket.create(place_id: place.id,  timetable_id: @timetable.id)
      tickets_ids += "#{ticket.id}#{'-' if place_name != places.last }"
      paypal_values[:price] += place.price
      paypal_values[:items_name] += "#{place.name}#{', ' if place_name != places.last}"
    end
    @url = paypal_url("#{tickets_path}?tickets=#{tickets_ids}", paypal_values)
    respond_to do |format|
      format.js
    end
  end

  def paypal_url(return_path, paypal_values)
    values = {
        business: 'shmatuan-facilitator@gmail.com',
        cmd: '_xclick',
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: paypal_values[:id],
        amount: paypal_values[:price],
        item_name: 'Ferry tickets ' + paypal_values[:items_name],
        item_number: paypal_values[:number],
        quantity: 1
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

  def show
    # kit = PDFKit.new('http://google.com')
    # kit.to_file('public/assets/pdfs/test.pdf')
    @tickets = Array.new
    tickets_ids = params[:tickets].split('-')
    tickets_ids.each do |ticket|
      @tickets << Ticket.find(ticket)
    end
  end

end