class Ride < ActiveRecord::Base

  belongs_to :member
  belongs_to :driver
  has_one :destination
  has_one :origin

  validates_presence_of :pickup_time, :pickup_date

end
