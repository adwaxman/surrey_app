class Admin::RidesController < ApplicationController
  before_action :admin?

  def index
    @rides = Ride.all
    @open_rides = @rides.where(status: 'open')
    @upcoming_rides = rides_after_today.sort_by { |ride| DateTime.parse(ride.pickup_date) }
    @rides_today_or_earlier = rides_today_or_earlier.sort_by { |ride| DateTime.parse(ride.pickup_date)}

    @sorted_open_rides = @open_rides.sort_by { |ride| DateTime.parse(ride.pickup_date) }
  end

  def show
    @ride = Ride.find(params[:id])
    @pickup_date = Date.parse(@ride.pickup_date).strftime('%a %b %d, %Y')
    @pickup_time = Time.parse(@ride.pickup_time.to_s).strftime('%l:%M %p')

    @drivers = Driver.all.where(active: true).where(confirmed: true)
    @arr_of_drivers = []
    @drivers.each do |driver|
      @arr_of_drivers.push(driver.fname + ' ' + driver.lname)
    end

    @matched_drivers = []
    @matches = Match.where(ride_id: @ride.id)
    @matches.each do |match|
      @matched_drivers.push(Driver.find(match.matcher_id))
    end

    @matched_drivers = @matched_drivers.sort_by { |driver| driver.lname }

    @outreaches = @ride.outreaches
    @notes = @ride.notes
    @sorted_outreaches = @outreaches.sort_by {|outreach| outreach.driver.lname}
  end

  def new
    @member = Member.where(full_name: params[:member_full_name]).first
  end

  def edit
  end

  def update
    @ride = Ride.find(params[:id])
    @driver = Driver.where(full_name: params[:driver_full_name]).first
    if current_admin
      @ride.update(driver_id: @driver.id, assigned_by: current_admin.fname + ' ' + current_admin.lname, status: 'scheduled')
      # DriverNotifier.send_ride_details(@driver, @ride).deliver
      redirect_to admin_ride_path @ride
    else
      flash[:alert] = 'There was a problem'
      redirect :back
    end
  end

  def assign
    @ride = Ride.find(params[:ride_id])
    @driver = Driver.find(params[:driver_id])
    @ride.update(driver_id: @driver.id, assigned_by: current_admin.full_name, status: 'scheduled')
    # DriverNotifier.send_ride_details(@driver, @ride).deliver
    redirect_to driver_path @driver
  end

  def unassign
    @ride = Ride.find(params[:ride_id])
    @driver = Driver.find(params[:driver_id])
    @ride.update(driver_id: nil, assigned_by: current_admin.full_name, status: 'open')
    redirect_to driver_path @driver
  end

  def select
    @members = Member.all.where(active: true).where(confirmed: true)
    @arr_of_members = []
    @members.each do |member|
      @arr_of_members.push(member.full_name)
    end
  end

  def cancel
    @ride = Ride.find(params[:id])
    @ride.update(status: "canceled")
    redirect_to :back
  end

  def create
    @member = Member.find(params[:member_id])
    member_id = @member.id
    destination_name = params[:destination_name]
    destination_address_line1 = params[:destination_address_line1]
    destination_address_line2 = params[:destination_address_line2]
    destination_city = params[:destination_city]
    state = 'PA'
    destination_zip = params[:destination_zip]
    destination_type = params[:destination_type]
    destination_other_type = params[:destination_other_type]

    origin_address_line1 = params[:origin_address_line1]
    origin_address_line2 = params[:origin_address_line2]
    origin_city = params[:origin_city]
    state = 'PA'
    origin_zip = params[:origin_zip]

    pickup_date = date_workaround(params[:pickup_date])
    pickup_time = params[:pickup_time]
    duration = params[:duration]
    wheelchair = params[:wheelchair] ? params[:wheelchair] : wheelchair = false
    aide = params[:aide] ? params[:aide] : aide = false
    pet = params[:pet] ? params[:pet] : pet = false
    hearing_impaired = params[:hearing_impaired] ? params[:hearing_impaired] : hearing_impaired = false
    vision_impaired = params[:vision_impaired] ? params[:vision_impaired] : vision_impaired = false
    status = 'open'

    if params[:destination_id] == '' || @member.destinations.length == 0
      @destination = Destination.new(member_id: member_id, name: destination_name, address_line1: destination_address_line1, address_line2: destination_address_line2, city: destination_city, state: state, zip: destination_zip, destination_type: destination_type, destination_other_type: destination_other_type)
      @destination_address = Nominatim.search(@destination.address_line1 + ' ' + @destination.address_line2 + ' ' + @destination.city + ' ' + @destination.zip).limit(1).address_details(true)

      for @destination_address in @destination_address
        p @destination_address.display_name
      end

      if @destination_address.nil? || !@destination_address.respond_to?(:address)
        @destination.county = 'All'
      else
        @destination.county = @destination_address.address.county
    end

      if @destination.save
      else
        flash[:alert] = 'There was a problem saving the destination.  Please try again.'
        render :new
        return
      end
    else
      @destination_id = params[:destination_id]

    end

    if params[:origin_id] == '' || @member.origins.length == 0
      @origin = Origin.new(member_id: member_id, address_line1: origin_address_line1, address_line2: origin_address_line2, city: origin_city, state: state, zip: origin_zip)

      if @origin.save
      else
        flash[:alert] = 'There was a problem saving your pickup location.  Please try again.'
        render :new
        return
      end
    else
      @origin_id = params[:origin_id]

    end

    destination_id_to_be_passed = @destination_id ? @destination_id : destination_id_to_be_passed = @member.destinations.last.id

    origin_id_to_be_passed = @origin_id ? @origin_id : origin_id_to_be_passed = @member.origins.last.id

    @ride = Ride.new(member_id: member_id, destination_id: destination_id_to_be_passed, origin_id: origin_id_to_be_passed, wheelchair: wheelchair, aide: aide, hearing_impaired: hearing_impaired, vision_impaired: vision_impaired, pickup_date: pickup_date, pickup_time: pickup_time, status: 'open', duration: duration, pet: pet)
    if @ride.save
      @weekday = Date.parse(@ride.pickup_date).strftime('%A').downcase
      @matches = Driver.where("#{@weekday}": true).where("#{@weekday}_min <= ?", @ride.pickup_time).where("#{@weekday}_max >= ?", @ride.pickup_time).where("county_preference ilike '%\n- #{@ride.destination.county}\n%'").where(active: true)
      if @ride.wheelchair
        @matches = @matches.where(accommodate_wheelchair: true)
      end
      @matches = @matches.where(accommodate_aide: true) if @ride.aide
      @matches = @matches.where(accommodate_pet: true) if @ride.pet
      @matches.each do |driver|
        Match.create(ride_id: @ride.id, matcher_id: driver.id)
      end

      # StaffNotifier.new_ride_request(@ride.member, @ride).deliver

      flash[:notice] = 'Ride request has been requested successfully. Check below for matched drivers.'
      redirect_to admin_ride_path @ride

    else
      render :new
    end
  end

  def complete
    @ride = Ride.find(params[:ride_id])
    if params[:completion_notes] != ''
      @ride.update(completion_notes: params[:completion_notes], status: 'complete')
    else
      @ride.update(status: 'complete')
    end
    redirect_to admin_rides_path
  end

  def archived
    @archived_rides = Ride.where(status: 'complete').sort_by { |ride| DateTime.parse(ride.pickup_date) }
  end

  def canceled
    @canceled_rides = Ride.where(status: 'canceled').sort_by { |ride| DateTime.parse(ride.pickup_date) }
  end

  def past
    @ride = Ride.find(params[:id])
    @pickup_date = Date.parse(@ride.pickup_date).strftime('%a %b %d, %Y')
    @pickup_time = Time.parse(@ride.pickup_time.to_s).strftime('%l:%M %p')
    @notes = @ride.notes
  end



  private

  def admin?
    redirect_to admin_login_path unless current_admin
  end
end
