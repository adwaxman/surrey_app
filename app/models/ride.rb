class Ride < ActiveRecord::Base

  belongs_to :member
  belongs_to :driver
  belongs_to :destination
  belongs_to :origin

  validates_presence_of :pickup_time, :pickup_date

end
