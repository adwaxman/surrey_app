class Admin < ActiveRecord::Base

  has_many :outreaches

  validates_uniqueness_of :username, :email
  validates_presence_of :fname, :lname, :email
  validates :password, confirmation: true, presence: true

end
