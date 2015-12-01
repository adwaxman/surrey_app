class Member < ActiveRecord::Base
  has_many :rides
  has_many :origins
  has_many :destinations
  has_many :drivers, through: :rides

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true
  validates :phone, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: "is not valid" }
  validates :cell, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: "is not valid" }
  validates :primaryEC_phone, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: "is not valid" }, allow_blank: true
  validates :primaryEC_cell, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: "is not valid" }, allow_blank: true
  validates :secondaryEC_phone, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: "is not valid" }, allow_blank: true
  validates :secondaryEC_cell, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: "is not valid" }, allow_blank: true
  validates :tertiaryEC_phone, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: "is not valid" }, allow_blank: true
  validates :tertiaryEC_cell, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: "is not valid" }, allow_blank: true
  validates_presence_of :fname, :lname, :address_line1, :city, :state, :zip


end
