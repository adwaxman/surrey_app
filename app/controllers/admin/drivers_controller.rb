class Admin::DriversController < ApplicationController
  before_action :admin?
  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    @driver.county_preference = params[:driver][:county_preference]
    @driver.county_preference = ('All') if params[:driver][:county_preference].nil?
    @driver.active = true
    if @driver.save
      Matcher.create(driver_id: @driver.id)
      redirect_to driver_path @driver
    else
      render 'new'
    end
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    @driver.county_preference = params[:driver][:county_preference]
    if @driver.confirmed.nil?
      if @driver.update_attributes(driver_params)

        @open_rides = Ride.all.where(status: 'open')
        @matches = @driver.find_matches_for_new_driver(@open_rides)
        @matches.each do |ride|
          Match.create(matcher_id: @driver.id, ride_id: ride.id)
        end

        @driver.update(confirmed: true)

        if current_driver
          redirect_to driver_driverpanel_path(@driver.id)
        elsif current_admin
          redirect_to driver_path(@driver)
        end
      else
        render 'edit'
      end

    else
      if @driver.update_attributes(driver_params)
        if current_driver
          redirect_to driver_driverpanel_path(@driver.id)
        elsif current_admin
          redirect_to driver_path(@driver)
        end
      else
        render 'edit'
      end
    end
  end


  private

  def admin?
    redirect_to admin_login_path unless current_admin
  end

  def driver_params
    params.require(:driver).permit(:fname, :lname, :email, :password, :password_confirmation, :address_line1, :address_line2, :city, :state, :zip, :car_type, :monday, :monday_min, :monday_max, :tuesday, :tuesday_min, :tuesday_max, :wednesday, :wednesday_min, :wednesday_max, :thursday, :thursday_min, :thursday_max, :friday, :friday_min, :friday_max, :unavailable, :accommodate_wheelchair, :accommodate_aide, :preferred_contact, :phone, :cell, :county_preference)
  end
end
