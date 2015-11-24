class Ride < ActiveRecord::Base
  belongs_to :member
  belongs_to :driver
  has_one :destination
  has_one :origin

end
