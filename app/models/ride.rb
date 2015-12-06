class Ride < ActiveRecord::Base

  belongs_to :member
  belongs_to :driver
  belongs_to :destination
  belongs_to :origin

  has_many :matches
  has_many :matchers, through: :matches

  validates_presence_of :pickup_time, :pickup_date

end
