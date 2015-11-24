class Destination < ActiveRecord::Base
  belongs_to :ride
  belongs_to :member

  validates_presence_of :name, :address_line1, :city, :zip, :destination_type
end
