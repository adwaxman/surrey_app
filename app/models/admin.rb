class Admin < ActiveRecord::Base

  validates_uniqueness_of :username, :email
  validates_presence_of :fname, :lname, :email
  validates :password, confirmation: true, presence: true

end
