class Ferry < ActiveRecord::Base

  has_many :tickets
  has_many :timetables

end
