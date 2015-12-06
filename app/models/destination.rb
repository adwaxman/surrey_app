class Destination < ActiveRecord::Base
  has_many :rides
  belongs_to :member

  validates_presence_of :name, :address_line1, :city, :zip
end
