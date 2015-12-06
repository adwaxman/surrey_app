class Match < ActiveRecord::Base
  belongs_to :matcher
  belongs_to :ride
end
