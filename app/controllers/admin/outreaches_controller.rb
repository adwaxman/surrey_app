class Admin::OutreachesController < ApplicationController

  def new
    @ride_id = params[:ride_id]
    @driver_id = params[:driver_id]
  end

  def create
    ride_id = params[:ride_id]
    @ride = Ride.find(ride_id)
    driver_id = params[:driver_id]
    admin_id = params[:admin_id]
    contact_method = params[:contact_method]
    result = params[:result]

    @outreach = Outreach.new(ride_id: ride_id, driver_id: driver_id, admin_id: admin_id, contact_method: contact_method, result: result)
    if @outreach.save
      redirect_to admin_ride_path @ride
    else
      flash[:alert] = "There was a problem"
      redirect :back
    end

  end

end
