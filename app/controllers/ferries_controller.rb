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

  def create

  end

end
