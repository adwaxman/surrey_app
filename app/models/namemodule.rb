# module allows for use of polymorphic full name method

module NameModule
  extend ActiveSupport::Concern

  included do
    before_save :add_full_name
  end

  def add_full_name
    if self.respond_to? :mi
      @full_name = fname + ' ' + mi + ' ' + lname
    else
      @full_name = fname + ' ' + lname
    end
    self.full_name = @full_name
  end
end
