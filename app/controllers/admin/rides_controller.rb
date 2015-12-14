class Admin::RidesController < ApplicationController
  def index
    @rides = Ride.all
    @open_rides = @rides.where(status: 'open')
    @scheduled_rides = @rides.where(status: 'scheduled')
    @rides_today = rides_today

    @sorted_open_rides = @open_rides.sort_by {|ride| DateTime.parse(ride.pickup_date)}



  end

  def show
    @ride = Ride.find(params[:id])
    @pickup_time = Time.parse(@ride.pickup_time.to_s).strftime("%l:%M %p")

    @drivers = Driver.all
    @arr_of_drivers = []
    @drivers.each do |driver|
      @arr_of_drivers.push(driver.fname + " " + driver.lname)
    end

    @matched_drivers = []
    @matches = Match.where(ride_id: @ride.id)
    @matches.each do |match|
      @matched_drivers.push(Driver.find(match.matcher_id))
    end

    @outreaches = @ride.outreaches
    @notes = @ride.notes

  end

  def new
  end

  def edit
  end

  def update
    puts '*' * 35
    puts params
    @ride = Ride.find(params[:id])
    @driver = Driver.where(full_name: params[:driver_full_name]).first
    if current_admin
      debugger
      @ride.update(driver_id: @driver.id, assigned_by: current_admin.fname + " " + current_admin.lname, status: "scheduled")
      redirect_to admin_ride_path @ride
    elsif current_driver
      @ride.update(driver_id: @driver.id, assigned_by: "self", status: "scheduled")
      redirect_to driver_ride_path @ride
    else
      flash[:alert] = "There was a problem"
      redirect :back
    end

  end



end
