class RidesController < ApplicationController

  def new

  end

  def create
    puts "*" * 35
    puts params

    member_id = current_member.id
    destination_name = params[:destination_name]
    destination_address_line1 = params[:destination_address_line1]
    destination_address_line2 = params[:destination_address_line2]
    destination_city = params[:destination_city]
    state = "PA"
    destination_zip = params[:destination_zip]
    destination_type = params[:destination_type]
    destination_other_type = params[:destination_other_type]

    origin_address_line1 = params[:origin_address_line1]
    origin_address_line2 = params[:origin_address_line2]
    origin_city = params[:origin_city]
    state = "PA"
    origin_zip = params[:origin_zip]

    pickup_date = params[:pickup_date]
    pickup_time = params[:pickup_time]
    wheelchair = params[:wheelchair]
    aide = params[:aide]
    hearing_impaired = params[:hearing_impaired]
    vision_impaired = params[:vision_impaired]

    if params[:destination_id] == ""
      @destination = Destination.new(member_id: member_id, name: destination_name, address_line1: destination_address_line1, address_line2: destination_address_line2, city: destination_city, state: state, zip: destination_zip, destination_type: destination_type, destination_other_type: destination_other_type)
      if @destination.save
      else
        render :new
      end
    else
      @destination_id = params[:destination_id]

    end

    if params[:origin_id] == ""
      @origin = Origin.new(member_id: member_id, address_line1: origin_address_line1, address_line2: origin_address_line2, city: origin_city, state: state, zip: origin_zip)
      if @origin.save
      else
        render :new
      end
    else
      @origin_id = params[:origin_id]

    end

    destination_id_to_be_passed = @destination_id ? @destination_id : destination_id_to_be_passed = current_member.destinations.last.id

    origin_id_to_be_passed = @origin_id ? @origin_id : origin_id_to_be_passed = current_member.origins.last.id

    @ride = Ride.new(member_id: member_id, destination_id: destination_id_to_be_passed, origin_id: origin_id_to_be_passed, wheelchair: wheelchair, aide: aide, hearing_impaired: hearing_impaired, vision_impaired: vision_impaired, pickup_date: pickup_date, pickup_time: pickup_time)

    if @ride.save
      flash[:notice] = "Your ride has been requested!"
      redirect_to root_path
    else
      render :new
    end







  end

  def show

  end

  def destroy

  end


end
