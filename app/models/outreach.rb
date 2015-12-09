class Outreach < ActiveRecord::Base

  belongs_to :ride
  belongs_to :driver
  belongs_to :admin

  validates_presence_of :admin_id, :driver_id, :ride_id, :result, :contact_method



end
