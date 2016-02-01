class Ticket < ActiveRecord::Base

  belongs_to :timetable
  belongs_to :place

end
