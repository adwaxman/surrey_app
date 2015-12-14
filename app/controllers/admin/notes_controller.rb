class Admin::NotesController < ApplicationController

  def create
    puts "******************************************"
    puts params
    admin_id = current_admin.id
    ride_id = params[:ride_id]
    body = params[:body]
    ride = Ride.find(ride_id)

    @note = Note.new(admin_id: admin_id, ride_id: ride_id, body: body)
    if @note.save
      redirect_to admin_ride_path ride
    else
      flash[:alert] = "There was a problem creating the note."
      redirect :back
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @ride = @note.ride
    @note.destroy
    redirect_to admin_ride_path @ride
  end

end
