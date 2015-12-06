class Admin::RidesController < ApplicationController
  def index
    @rides = Ride.all
    @open_rides = @rides.where(status: 'open')
    @scheduled_rides = @rides.where(status: 'scheduled')
    @rides_today = rides_today

    @sorted_open_rides = @open_rides.sort_by {|ride| DateTime.parse(ride.pickup_date)}

  end

  def show
  end

  def new
  end

  def edit
  end
end
