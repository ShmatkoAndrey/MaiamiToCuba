class Place < ActiveRecord::Base

  belongs_to :ferry

  has_many :tickets

end
