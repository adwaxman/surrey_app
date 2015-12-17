class Admin::DriversController < ApplicationController
  def new
    @driver = Driver.new
  end
  def create
    @driver = Driver.new(driver_params)
    @driver.county_preference = params[:driver][:county_preference]
    @driver.active = true
    if @driver.save
      Matcher.create(driver_id: @driver.id)
      redirect_to root_path
    else
      render 'new'
    end
  end
  def edit
    @driver = Driver.find(params[:id])
  end
  def update

  end
private
  def driver_params
    params.require(:driver).permit(:fname, :lname, :email, :password, :password_confirmation, :address_line1, :address_line2, :city, :state, :zip, :car_type, :monday, :monday_min, :monday_max, :tuesday, :tuesday_min, :tuesday_max, :wednesday, :wednesday_min, :wednesday_max, :thursday, :thursday_min, :thursday_max, :friday, :friday_min, :friday_max, :unavailable, :accommodate_wheelchair, :accommodate_aide, :preferred_contact, :phone, :cell, :county_preference)
  end
end
