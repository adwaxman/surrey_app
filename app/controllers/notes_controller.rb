class NotesController < ApplicationController

  def create
    admin_id = current_admin.id
    driver_id = params[:driver_id]
    body = params[:body]
    driver = Driver.find(driver_id)

    @note = Note.new(admin_id: admin_id, driver_id: driver_id, body: body)
    if @note.save
      redirect_to driver_path driver
    else
      flash[:alert] = "There was a problem creating the note."
      redirect :back
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @driver = @note.driver
    @note.destroy
    redirect_to driver_path @driver
  end

end
