class Driver < ActiveRecord::Base
  has_many :rides
  has_many :members, through: :rides

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, confimation: true
  validates :area_code, format: { with: /\A\d{3}\z/, message: "is not valid" }
  validates :local_exchange, format: { with: /\A\d{3}\z/, message: "is not valid" }
  validates :phone_ending, format: { with: /\A\d{4}\z/, message: "is not valid" }
  validates_presence_of :fname, :lname, :address_line1, :city, :state, :zip


end
