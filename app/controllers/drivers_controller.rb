class DriversController < ApplicationController

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
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
  end

  def update
    @driver = Driver.find(params[:id])
    if @driver.update_attributes(driver_params)
      redirect_to drivers_path
    else
      render 'edit'
    end

  end

  def show

  end

private

  def driver_params
    params.require(:driver).permit(:fname, :lname, :email, :password, :address_line1, :address_line2, :city, :state, :zip, :car_type, :monday, :monday_min, :monday_max, :tuesday, :tuesday_min, :tuesday_max, :wednesday, :wednesday_min, :wednesday_max, :thursday, :thursday_min, :thursday_max, :friday, :friday_min, :friday_max, :unavailable, :accommodate_wheelchair, :accommodate_aide, :preferred_contact, :phone, :cell)
  end

end
