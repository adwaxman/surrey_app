class Origin < ActiveRecord::Base

  belongs_to :member
  belongs_to :ride

  validates_presence_of :address_line1, :city, :zip

end
