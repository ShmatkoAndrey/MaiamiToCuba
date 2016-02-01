class Ferry < ActiveRecord::Base

  has_many :timetables
  has_many :places

end
