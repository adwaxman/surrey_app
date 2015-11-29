class Member < ActiveRecord::Base
  has_many :rides
  has_many :origins
  has_many :destinations
  has_many :drivers, through: :rides

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true
  validates :area_code, format: { with: /\A\d{3}\z/, message: "is not valid" }
  validates :local_exchange, format: { with: /\A\d{3}\z/, message: "is not valid" }
  validates :phone_ending, format: { with: /\A\d{4}\z/, message: "is not valid" }
  validates :primaryEC_area_code, format: { with: /\A\d{3}\z/, message: "is not valid" }, allow_blank: true
  validates :primaryEC_local_exchange, format: { with: /\A\d{3}\z/, message: "is not valid" }, allow_blank: true
  validates :primaryEC_phone_ending, format: { with: /\A\d{4}\z/, message: "is not valid" }, allow_blank: true
  validates :secondaryEC_area_code, format: { with: /\A\d{3}\z/, message: "is not valid" }, allow_blank: true
  validates :secondaryEC_local_exchange, format: { with: /\A\d{3}\z/, message: "is not valid" }, allow_blank: true
  validates :secondaryEC_phone_ending, format: { with: /\A\d{4}\z/, message: "is not valid" }, allow_blank: true
  validates :tertiaryEC_area_code, format: { with: /\A\d{3}\z/, message: "is not valid" }, allow_blank: true
  validates :tertiaryEC_local_exchange, format: { with: /\A\d{3}\z/, message: "is not valid" }, allow_blank: true
  validates :tertiaryEC_phone_ending, format: { with: /\A\d{4}\z/, message: "is not valid" }, allow_blank: true
  validates_presence_of :fname, :lname, :address_line1, :city, :state, :zip


end
