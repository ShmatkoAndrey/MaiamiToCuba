class FerriesController < ApplicationController

  def new

  end

  def find
    date = DateTime.parse(params[:date])
    @ft = Timetable.where(date: date.beginning_of_day..date.end_of_day).order('date')
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

  def cost
    @timetable = Timetable.find(params[:timetable])
    @cost = Place.where(name: params[:place], ferry_id: @timetable.ferry.id).first.price
    if params[:type_cost] == 'remove'
      @cost = -@cost
    end
    respond_to do |format|
      format.js
    end
  end

  def create

  end

end
