class Admin::HomeController < ApplicationController
  before_action :admin?

  def index
  end


  private
  def admin?
    redirect_to admin_login_path unless current_admin 
  end
end
