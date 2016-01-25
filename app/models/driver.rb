class Driver < ActiveRecord::Base
  # use NameModule
  require 'namemodule'
  include NameModule
  require 'datefixer'
  include DateFixer

  extend DateFixer
  # bcrypt
  has_secure_password
  has_many :rides
  has_many :members, through: :rides
  belongs_to :matcher

  has_many :outreaches
  has_many :notes

  validates :email, uniqueness: true, presence: true, on: :create
  validates :password, presence: true, confirmation: true, on: :update, allow_nil: true
  validates :phone, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: 'is not valid' }, on: :update, allow_nil: true
  validates :cell, format: { with: /[(][0-9]{3}[)][ ][0-9]{3}-[0-9]{4}/, message: 'is not valid' }, on: :update
  validates_presence_of :fname, :lname, :address_line1, :city, :state, :zip, on: :update

  serialize :county_preference

  before_save :add_full_name

  def find_matches_for_new_driver(open_rides)
    @matches = []
    open_rides.each do |ride|
      weekday = ride.pickup_date.strftime('%A').downcase
      next if weekday == 'saturday' || weekday == 'sunday'
      next unless send(weekday.to_sym) == true
      next unless send("#{weekday}_min".to_sym) < ride.pickup_time
      next unless send("#{weekday}_max".to_sym) > ride.pickup_time
      @matches.push(ride)
    end
    @matches
  end
end
