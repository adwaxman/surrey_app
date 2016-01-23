class Admin < ActiveRecord::Base
  # use NameModule
  require 'namemodule'
  include NameModule

  #bycrypt
  has_secure_password

  has_many :outreaches

  validates_uniqueness_of :username, :email
  validates_presence_of :fname, :lname, :email
  validates :password, confirmation: true, presence: true, allow_nil: true

  has_many :notes


  before_save :add_full_name


end
