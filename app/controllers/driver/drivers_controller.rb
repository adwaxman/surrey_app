class Driver::DriversController < ApplicationController
  before_action :driver?
  def show
    if current_driver.confirmed.nil?
      redirect_to edit_driver_path(current_driver.id)
    else
      @driver = Driver.find(params[:id])
      # Show time in readable format
      @monday_min = Time.parse(@driver.monday_min.to_s).strftime('%l:%M %p')
      @monday_max = Time.parse(@driver.monday_max.to_s).strftime('%l:%M %p')

      @tuesday_min = Time.parse(@driver.monday_min.to_s).strftime('%l:%M %p')
      @tuesday_max = Time.parse(@driver.monday_max.to_s).strftime('%l:%M %p')

      @wednesday_min = Time.parse(@driver.monday_min.to_s).strftime('%l:%M %p')
      @wednesday_max = Time.parse(@driver.monday_max.to_s).strftime('%l:%M %p')

      @thursday_min = Time.parse(@driver.monday_min.to_s).strftime('%l:%M %p')
      @thursday_max = Time.parse(@driver.monday_max.to_s).strftime('%l:%M %p')

      @friday_min = Time.parse(@driver.monday_min.to_s).strftime('%l:%M %p')
      @friday_max = Time.parse(@driver.monday_max.to_s).strftime('%l:%M %p')
  end
  end

private
def driver?
  unless current_driver || current_admin
    flash[:notice] = "You must be logged in as a driver or administrator"
    redirect_to root_path
  end
end
end
