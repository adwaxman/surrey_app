class Admin < ActiveRecord::Base

  has_many :outreaches

  validates_uniqueness_of :username, :email
  validates_presence_of :fname, :lname, :email
  validates :password, confirmation: true, presence: true

  has_many :notes


  before_save :add_full_name_admin

  def add_full_name_admin
    @full_name = self.fname + " " + self.lname
    self.full_name = @full_name
  end

end
