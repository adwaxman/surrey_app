class Driver::DriversController < ApplicationController
  before_action :driver?
  def show
    if current_driver.confirmed.nil?
      redirect_to edit_driver_path(current_driver.id)
    else
      @driver = Driver.find(params[:id])
      # Show time in readable format
      @monday_min = Time.parse(@driver.monday_min.to_s).strftime('%l:%M %p') if @driver.monday_min
      @monday_max = Time.parse(@driver.monday_max.to_s).strftime('%l:%M %p') if @driver.monday_max

      @tuesday_min = Time.parse(@driver.tuesday_min.to_s).strftime('%l:%M %p') if @driver.tuesday_min
      @tuesday_max = Time.parse(@driver.tuesday_max.to_s).strftime('%l:%M %p') if @driver.tuesday_max

      @wednesday_min = Time.parse(@driver.wednesday_min.to_s).strftime('%l:%M %p') if @driver.wednesday_min
      @wednesday_max = Time.parse(@driver.wednesday_max.to_s).strftime('%l:%M %p') if @driver.wednesday_max

      @thursday_min = Time.parse(@driver.thursday_min.to_s).strftime('%l:%M %p') if @driver.thursday_min
      @thursday_max = Time.parse(@driver.thursday_max.to_s).strftime('%l:%M %p') if @driver.thursday_max

      @friday_min = Time.parse(@driver.friday_min.to_s).strftime('%l:%M %p') if @driver.friday_min
      @friday_max = Time.parse(@driver.friday_max.to_s).strftime('%l:%M %p') if @driver.friday_max

      @rides = @driver.rides.where(status: "scheduled").sort_by { |ride| DateTime.parse(ride.pickup_date + " " + ride.pickup_time.strftime('%l:%M %p')) }

  end
  end

private
def driver?
  unless current_driver || current_admin
    flash[:notice] = "You must be logged in as a driver or administrator"
    redirect_to driver_login_path
  end
end
end
