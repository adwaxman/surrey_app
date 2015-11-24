class Driver < ActiveRecord::Base
  has_many :rides
  has_many :members, through: :rides
end
