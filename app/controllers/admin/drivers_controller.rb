class Admin::DriversController < ApplicationController
  def new
    @driver = Driver.new
  end
  def create
    @driver = Driver.new(driver_params)
    @driver.county_preference = params[:driver][:county_preference]
    @driver.county_preference = ("All") if params[:driver][:county_preference].nil?
    @driver.active = true
    if @driver.save
      Matcher.create(driver_id: @driver.id)
      @open_rides = Ride.all.where(status:"open")
      @matches = []
      @open_rides.each do |ride|
          @weekday = Date.parse(ride.pickup_date).strftime('%A').downcase
          if @weekday = "monday" && @driver.monday
            if @driver.monday_min < ride.pickup_time && @driver.monday_max > ride.pickup_time
              @matches.push(ride)
            end
          elsif @weekday = "tuesday" && @driver.tuesday
            if @driver.tuesday_min < ride.pickup_time && @driver.tuesday_max > ride.pickup_time
              @matches.push(ride)
            end
          elsif @weekday = "wednesday" && @driver.wednesday
            if @driver.wednesday_min < ride.pickup_time && @driver.wednesday_max > ride.pickup_time
              @matches.push(ride)
            end
          elsif @weekday = "thursday" && @driver.thursday
            if @driver.thursday_min < ride.pickup_time && @driver.thursday_max > ride.pickup_time
              @matches.push(ride)
            end
          elsif @weekday = "friday" && @driver.friday
            if @driver.friday_min < ride.pickup_time && @driver.friday_max > ride.pickup_time
              @matches.push(ride)
            end
          end
      end

      @matches.each do |ride|
        Match.create(matcher_id: @driver.id, ride_id: ride.id)
      end
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
