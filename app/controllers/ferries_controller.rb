class FerriesController < ApplicationController

  def new

  end

  def find
    date = DateTime.parse(params[:date])
    @today_all = false
    if params[:direction] == ''
      @today_all = true
      @ft = Timetable.where(date: date.beginning_of_day..date.end_of_day).order('date')
    else
      @ft = Timetable.where(direction: params[:direction],
                            date: date.beginning_of_day..date.end_of_day).order('date')
    end

    respond_to do |format|
      format.js
    end
  end

  def sheep
    @timetable = Timetable.find(params[:timetable])
    @sheep = @timetable.ferry
    respond_to do |format|
      format.js
    end
  end

  def add_ticket
    @timetable = Timetable.find(params[:timetable])
    @place =  Place.where(name: params[:place], ferry_id: @timetable.ferry.id).first
    @cost = @place.price
    if params[:type_cost] == 'remove'
      @cost = -@cost
    end
    respond_to do |format|
      format.js
    end
  end

end
