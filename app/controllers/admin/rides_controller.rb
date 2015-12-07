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
    @origin = Origin.find(@ride.origin_id)
    @destination = Destination.find(@ride.destination_id)
    @origin_address = @origin.address_line1 + " " + @origin.address_line2 + " " + @origin.city + " PA," + " " + @origin.zip
    @destination_address = @destination.address_line1 + " " + @destination.address_line2 + " " + @destination.city + " PA," + " " + @destination.zip

    @drivers = Driver.all
    @arr_of_drivers = []
    @drivers.each do |driver|
      @arr_of_drivers.push(driver.fname + " " + driver.lname)
    end
    



  end

  def new
  end

  def edit
  end



end
