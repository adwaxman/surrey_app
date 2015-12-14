class DriversController < ApplicationController
  before_action :driver?


  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    @driver.county_preference = params[:driver][:county_preference]
    if @driver.save
      Matcher.create(driver_id: @driver.id)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @drivers = Driver.all
  end

  def edit

    @driver = Driver.find(params[:id])

    # Show time in readable format
    @driver.monday_min = Time.parse(@driver.monday_min.to_s).strftime("%l:%M %p")
    @driver.monday_max = Time.parse(@driver.monday_max.to_s).strftime("%l:%M %p")

    @driver.tuesday_min = Time.parse(@driver.monday_min.to_s).strftime("%l:%M %p")
    @driver.tuesday_max = Time.parse(@driver.monday_max.to_s).strftime("%l:%M %p")

    @driver.wednesday_min = Time.parse(@driver.monday_min.to_s).strftime("%l:%M %p")
    @driver.wednesday_max = Time.parse(@driver.monday_max.to_s).strftime("%l:%M %p")

    @driver.thursday_min = Time.parse(@driver.monday_min.to_s).strftime("%l:%M %p")
    @driver.thursday_max = Time.parse(@driver.monday_max.to_s).strftime("%l:%M %p")

    @driver.friday_min = Time.parse(@driver.monday_min.to_s).strftime("%l:%M %p")
    @driver.friday_max = Time.parse(@driver.monday_max.to_s).strftime("%l:%M %p")
  end

  def update
    @driver = Driver.find(params[:id])
    if @driver.update_attributes(driver_params)
        @driver.confirmed = true
      redirect_to drivers_path
    else
      render 'edit'
    end

  end

  def show
    @driver = Driver.find(params[:id])

  end

private

  def driver_params
    params.require(:driver).permit(:fname, :lname, :email, :password, :password_confirmation, :address_line1, :address_line2, :city, :state, :zip, :car_type, :monday, :monday_min, :monday_max, :tuesday, :tuesday_min, :tuesday_max, :wednesday, :wednesday_min, :wednesday_max, :thursday, :thursday_min, :thursday_max, :friday, :friday_min, :friday_max, :unavailable, :accommodate_wheelchair, :accommodate_aide, :preferred_contact, :phone, :cell, :county_preference)
  end

  def driver?
    unless current_driver || current_admin
      flash[:notice] = "You must be logged in as a driver or administrator"
      redirect_to root_path
    end
  end

end
