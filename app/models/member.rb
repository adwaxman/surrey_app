class Member < ActiveRecord::Base
  has_many :rides
  has_many :origins
  has_many :destinations
  has_many :drivers, through: :rides
end
