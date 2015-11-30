class RidesController < ApplicationController

  def new
    @destination = Destination.new
    @origin = Origin.new
    @ride = Ride.new
  end

  def create

  end

  def show

  end

  def destroy

  end

end
