class RidesController < ApplicationController
before_action :logged_in?, except: [:show]

  def new
    redirect_to edit_member_path(current_member.id) unless current_member.confirmed
  end

  def create
    member_id = current_member.id
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
    hearing_impaired = params[:hearing_impaired] ? params[:hearing_impaired] : hearing_impaired = false
    vision_impaired = params[:vision_impaired] ? params[:vision_impaired] : vision_impaired = false
    status = 'open'

    if params[:destination_id] == '' || current_member.destinations.length == 0
      @destination = Destination.new(member_id: member_id, name: destination_name, address_line1: destination_address_line1, address_line2: destination_address_line2, city: destination_city, state: state, zip: destination_zip, destination_type: destination_type, destination_other_type: destination_other_type)
      @destination_address = Nominatim.search(@destination.address_line1 + ' ' + @destination.address_line2 + ' ' + @destination.city + ' ' + @destination.zip).limit(1).address_details(true)

      for @destination_address in @destination_address
        p @destination_address.display_name
      end
      debugger
      if @destination_address.nil? || !@destination_address.respond_to?(:address)
        @destination.county = "All"
      else
        @destination.county = @destination_address.address.county
    end
    debugger
      if @destination.save
      else
        flash[:alert] = 'problem 1'
        render :new
        return
      end
    else
      @destination_id = params[:destination_id]

    end

    if params[:origin_id] == '' || current_member.origins.length == 0
      @origin = Origin.new(member_id: member_id, address_line1: origin_address_line1, address_line2: origin_address_line2, city: origin_city, state: state, zip: origin_zip)

      if @origin.save
      else
        flash[:alert] = 'problem 2'
        render :new
        return
      end
    else
      @origin_id = params[:origin_id]

    end

    destination_id_to_be_passed = @destination_id ? @destination_id : destination_id_to_be_passed = current_member.destinations.last.id

    origin_id_to_be_passed = @origin_id ? @origin_id : origin_id_to_be_passed = current_member.origins.last.id

    @ride = Ride.new(member_id: member_id, destination_id: destination_id_to_be_passed, origin_id: origin_id_to_be_passed, wheelchair: wheelchair, aide: aide, hearing_impaired: hearing_impaired, vision_impaired: vision_impaired, pickup_date: pickup_date, pickup_time: pickup_time, status: 'open', duration: duration)
    if @ride.save
      @weekday = Date.parse(@ride.pickup_date).strftime('%A').downcase
      @matches = Driver.where("#{@weekday}": true).where("#{@weekday}_min <= ?", @ride.pickup_time).where("#{@weekday}_max >= ?", @ride.pickup_time).where("county_preference ilike '%\n- #{@ride.destination.county}\n%'").where(active: true)
      if @ride.wheelchair
        @matches = @matches.where(accommodate_wheelchair: true)
      end
      @matches = @matches.where(accommodate_aide: true) if @ride.aide
      @matches.each do |driver|
        Match.create(ride_id: @ride.id, matcher_id: driver.id)
      end

      flash[:notice] = 'Your ride has been requested!'
      redirect_to root_path

    else
      render :new
    end
  end

  def show
    @ride = Ride.find(params[:id])
    @member = @ride.member

    # variables for gmaps
    @origin = Origin.find(@ride.origin_id)
    @destination = Destination.find(@ride.destination_id)
    @origin_address = @origin.address_line1 + ' ' + @origin.address_line2 + ' ' + @origin.city + ' PA,' + ' ' + @origin.zip
    @destination_address = @destination.address_line1 + ' ' + @destination.address_line2 + ' ' + @destination.city + ' PA,' + ' ' + @destination.zip

    @matched_drivers = []
    @matches = Match.where(ride_id: @ride.id)
    @matches.each do |match|
      @matched_drivers.push(Driver.find(match.matcher_id))
    end
  end

  def destroy
  end

  private
  def logged_in?
    redirect_to login_path unless current_member || current_member
  end
end
