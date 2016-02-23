class Member < ActiveRecord::Base
  # use NameModule
  require 'namemodule'
  include NameModule
  #bycrpt
  has_secure_password
  # associations
  has_many :rides
  has_many :origins
  has_many :destinations
  has_many :drivers, through: :rides
  # validations
  validates :email, uniqueness: true, presence: true, on: :create
  validates_presence_of :fname, :lname, on: :create
  validates :password, presence: true, confirmation: true, on: :update, allow_nil: true
  validates :phone, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: 'is not valid' }, on: :update
  validates :cell, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: 'is not valid' }, on: :update
  validates :primaryEC_phone, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: 'is not valid' }, allow_blank: true, on: :update
  validates :primaryEC_cell, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: 'is not valid' }, allow_blank: true, on: :update
  validates :secondaryEC_phone, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: 'is not valid' }, allow_blank: true, on: :update
  validates :secondaryEC_cell, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: 'is not valid' }, allow_blank: true, on: :update
  validates :tertiaryEC_phone, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: 'is not valid' }, allow_blank: true, on: :update
  validates :tertiaryEC_cell, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: 'is not valid' }, allow_blank: true, on: :update
  validates_presence_of :fname, :lname, :address_line1, :city, :state, :zip, on: :update

  before_save :add_full_name




end
