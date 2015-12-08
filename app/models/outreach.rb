class Outreach < ActiveRecord::Base

  belongs_to :ride
  belongs_to :driver
  belongs_to :admin
  
end
