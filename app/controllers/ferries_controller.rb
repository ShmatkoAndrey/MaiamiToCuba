class FerriesController < ApplicationController

  def new

  end

  def find
    @ft = Timetable.where(date: DateTime.parse(params[:date]))
    respond_to do |format|
      format.js
    end
  end

  def create

  end

end
