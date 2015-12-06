class DriversController < ApplicationController


  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    # @driver.monday_min = Time.parse(@driver.monday_min).strftime("%l:%M %p")
    # @driver.monday_max = Time.parse(@driver.monday_max).strftime("%l:%M %p")
    # @driver.tuesday_min = convert_time_to_float(@driver.monday_min)
    # @driver.tuesday_max = convert_time_to_float(@driver.monday_max)
    # @driver.wednesday_min = convert_time_to_float(@driver.monday_min)
    # @driver.wednesday_max = convert_time_to_float(@driver.monday_max)
    # @driver.thursday_min = convert_time_to_float(@driver.monday_min)
    # @driver.thursday_max = convert_time_to_float(@driver.monday_max)
    # @driver.friday_min = convert_time_to_float(@driver.monday_min)
    # @driver.friday_max = convert_time_to_float(@driver.monday_max)
    if @driver.save
      redirect_to root_path
    else
      debugger
      render 'new'
    end
  end

  def index
    @drivers = Driver.all
  end

  def edit
    @driver = Driver.find(params[:id])
    @driver.monday_min = Time.parse(@driver.monday_min).strftime("%l:%M %p")
    @driver.monday_min = Time.parse(@driver.monday_min).strftime("%l:%M %p")
    @driver.tuesday_min = Time.parse(@driver.monday_min).strftime("%l:%M %p")
    @driver.tuesday_min = Time.parse(@driver.monday_min).strftime("%l:%M %p")
    @driver.wednesday_min = Time.parse(@driver.monday_min).strftime("%l:%M %p")
    @driver.wednesday_min = Time.parse(@driver.monday_min).strftime("%l:%M %p")
    @driver.thursday_min = Time.parse(@driver.monday_min).strftime("%l:%M %p")
    @driver.thursday_min = Time.parse(@driver.monday_min).strftime("%l:%M %p")
    @driver.friday_min = Time.parse(@driver.monday_min).strftime("%l:%M %p")
    @driver.friday_min = Time.parse(@driver.monday_min).strftime("%l:%M %p")

  end

  def update
    @driver = Driver.find(params[:id])
    @driver.monday_min = convert_time_to_float(@driver.monday_min)
    @driver.monday_max = convert_time_to_float(@driver.monday_max)
    @driver.tuesday_min = convert_time_to_float(@driver.monday_min)
    @driver.tuesday_max = convert_time_to_float(@driver.monday_max)
    @driver.wednesday_min = convert_time_to_float(@driver.monday_min)
    @driver.wednesday_max = convert_time_to_float(@driver.monday_max)
    @driver.thursday_min = convert_time_to_float(@driver.monday_min)
    @driver.thursday_max = convert_time_to_float(@driver.monday_max)
    @driver.friday_min = convert_time_to_float(@driver.monday_min)
    @driver.friday_max = convert_time_to_float(@driver.monday_max)
    if @driver.update_attributes(driver_params)

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
    params.require(:driver).permit(:fname, :lname, :email, :password, :password_confirmation, :address_line1, :address_line2, :city, :state, :zip, :car_type, :monday, :monday_min, :monday_max, :tuesday, :tuesday_min, :tuesday_max, :wednesday, :wednesday_min, :wednesday_max, :thursday, :thursday_min, :thursday_max, :friday, :friday_min, :friday_max, :unavailable, :accommodate_wheelchair, :accommodate_aide, :preferred_contact, :phone, :cell)
  end

  def convert_time_to_float str

  if str[-2..-1] == "PM"
      pm = true
  end

   string_to_convert = str[0...-3]
   string_to_convert = string_to_convert.sub(":", ".")
   # puts string_to_convert

   float = string_to_convert.to_f

   if pm
       float = float + 12.0
   end

   return float



  end



end
