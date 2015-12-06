class Matcher < ActiveRecord::Base
  belongs_to :driver

  has_many :matches
  has_many :rides, through: :matches

end
