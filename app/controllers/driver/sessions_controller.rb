class Driver::SessionsController < ApplicationController
  def new
    if session[:driver_id]
      redirect_to root_path
    end
  end

  def create
    @driver = Driver.find_by(email: params[:email])
    if @driver && @driver.authenticate(params[:password])
      session[:driver_id] = @driver.id
      flash[:notice] = "You have successfully logged in."
      redirect_to edit_driver_path(current_driver.id)
    else
      flash[:alert] = "There was a problem logging in."
      redirect_to root_path
    end
  end

  def destroy
    session[:driver_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to login_path
  end
end
