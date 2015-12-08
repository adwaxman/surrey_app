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





  end

  def new
  end

  def edit
  end



end
