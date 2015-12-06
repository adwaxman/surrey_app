class Origin < ActiveRecord::Base

  belongs_to :member
  has_many :rides

  validates_presence_of :address_line1, :city, :zip

end
