class Ride < ActiveRecord::Base
  belongs_to :client
  belongs_to :driver
  belongs_to :origin
  belongs_to :destination
end
