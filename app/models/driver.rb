class Driver < ActiveRecord::Base
  # bcrypt
  has_secure_password
  has_many :rides
  has_many :members, through: :rides
  belongs_to :matcher

  has_many :outreaches
  has_many :notes

  validates :email, uniqueness: true, presence: true, on: :create
  validates :password, presence: true, confirmation: true, on: :update, allow_nil: true
  validates :phone, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: "is not valid" }, on: :update
  validates :cell, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: "is not valid" }, on: :update
  validates_presence_of :fname, :lname, :address_line1, :city, :state, :zip, on: :update

  serialize :county_preference

  before_save :add_full_name_driver

  def add_full_name_driver
    @full_name = self.fname + " " + self.lname
    self.full_name = @full_name
  end


end
