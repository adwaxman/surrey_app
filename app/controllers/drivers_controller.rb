class DriversController < ApplicationController
  before_action :driver?, except: [:show]
  before_action :admin?, only: [:show]

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    @driver.county_preference = params[:driver][:county_preference]
    @driver.county_preference.push('All')
    if @driver.save
      Matcher.create(driver_id: @driver.id)

      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @drivers = Driver.all.sort_by { |driver| driver.lname.downcase }

    @arr_of_drivers = []
    @drivers.each do |driver|
      @arr_of_drivers.push(driver.full_name)
    end
  end

  def edit
    @driver = Driver.find(params[:id])

    # Show time in readable format
    @driver.monday_min = Time.parse(@driver.monday_min.to_s).strftime('%l:%M %p') if @driver.monday_min
    @driver.monday_max = Time.parse(@driver.monday_max.to_s).strftime('%l:%M %p') if @driver.monday_max

    @driver.tuesday_min = Time.parse(@driver.tuesday_min.to_s).strftime('%l:%M %p') if @driver.tuesday_min
    @driver.tuesday_max = Time.parse(@driver.tuesday_max.to_s).strftime('%l:%M %p') if @driver.tuesday_max

    @driver.wednesday_min = Time.parse(@driver.wednesday_min.to_s).strftime('%l:%M %p') if @driver.wednesday_min
    @driver.wednesday_max = Time.parse(@driver.wednesday_max.to_s).strftime('%l:%M %p') if @driver.wednesday_max

    @driver.thursday_min = Time.parse(@driver.thursday_min.to_s).strftime('%l:%M %p') if @driver.thursday_min
    @driver.thursday_max = Time.parse(@driver.thursday_max.to_s).strftime('%l:%M %p') if @driver.thursday_max

    @driver.friday_min = Time.parse(@driver.friday_min.to_s).strftime('%l:%M %p') if @driver.friday_min
    @driver.friday_max = Time.parse(@driver.friday_max.to_s).strftime('%l:%M %p') if @driver.friday_max
  end

  def update
    @driver = Driver.find(params[:id])
    @driver.county_preference = params[:driver][:county_preference]
    if @driver.confirmed.nil?
      if @driver.update_attributes(driver_params)

        @open_rides = Ride.all.where(status: 'open')
        @matches = find_matches_for_new_drivers(@open_rides)

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

  def show
    @driver = Driver.find(params[:id])

    if @driver.confirmed.nil?
      # redirect to landing page and prompt to update or make inactive
      redirect_to driver_prompt_path @driver

    else

      # Show time in readable format
      @monday_min = Time.parse(@driver.monday_min.to_s).strftime('%l:%M %p') if @driver.monday_min
      @monday_max = Time.parse(@driver.monday_max.to_s).strftime('%l:%M %p') if @driver.monday_max

      @tuesday_min = Time.parse(@driver.tuesday_min.to_s).strftime('%l:%M %p') if @driver.tuesday_min
      @tuesday_max = Time.parse(@driver.tuesday_max.to_s).strftime('%l:%M %p') if @driver.tuesday_max

      @wednesday_min = Time.parse(@driver.wednesday_min.to_s).strftime('%l:%M %p') if @driver.wednesday_min
      @wednesday_max = Time.parse(@driver.wednesday_max.to_s).strftime('%l:%M %p') if @driver.wednesday_max

      @thursday_min = Time.parse(@driver.thursday_min.to_s).strftime('%l:%M %p') if @driver.thursday_min
      @thursday_max = Time.parse(@driver.thursday_max.to_s).strftime('%l:%M %p') if @driver.thursday_max

      @friday_min = Time.parse(@driver.friday_min.to_s).strftime('%l:%M %p') if @driver.friday_min
      @friday_max = Time.parse(@driver.friday_max.to_s).strftime('%l:%M %p') if @driver.friday_max

      @counties = @driver.county_preference
      @upper = @counties.length - 1

      @assigned_rides = @driver.rides.sort_by { |ride| DateTime.parse(ride.pickup_date) }
      @matched_rides = Matcher.find(@driver.id).rides.where(status: 'open').sort_by { |ride| DateTime.parse(ride.pickup_date) }

      @outreaches = @driver.outreaches
      @notes = @driver.notes

    end
  end

  def prompt
    @driver = Driver.find(params[:id])
  end

  def inactive
    @driver = Driver.find(params[:driver_id])
    if @driver.confirmed.nil?
      @driver.update(active: false, address_line1: 'placeholder', city: 'placeholder', state: 'PA', zip: 'placeholder')
      redirect_to driver_path @driver
    elsif @driver.update(active: false)
      redirect_to driver_path @driver
    else
      flash[:alert] = 'There was a problem.'
      redirect :back
    end
  end

  def reactivate
    @driver = Driver.find(params[:driver_id])
    if @driver.update(active: true)
      flash[:alert] = 'Driver has been reactivated'
      redirect_to driver_path @driver
    else
      flash[:alert] = 'There was a problem.'
      redirect :back
    end
  end

  def search
    @driver = Driver.find_by(full_name: params[:driver_full_name])
    redirect_to driver_path @driver
  end

  private

  def admin?
    redirect_to admin_login_path unless current_admin
  end

  def driver_params
    params.require(:driver).permit(:fname, :lname, :email, :password, :password_confirmation, :address_line1, :address_line2, :city, :state, :zip, :car_type, :monday, :monday_min, :monday_max, :tuesday, :tuesday_min, :tuesday_max, :wednesday, :wednesday_min, :wednesday_max, :thursday, :thursday_min, :thursday_max, :friday, :friday_min, :friday_max, :unavailable, :accommodate_wheelchair, :accommodate_aide, :preferred_contact, :phone, :cell, :county_preference, :prefered_contact, :accommodate_pet)
  end

  def driver?
    unless current_driver || current_admin
      flash[:notice] = 'You must be logged in as a driver or administrator'
      redirect_to root_path
    end
  end
end
