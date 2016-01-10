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
      session[:admin_id] = nil
      session[:member_id] = nil
      flash[:notice] = "You have successfully logged in."
      redirect_to driver_driverpanel_path(current_driver.id)
    else
      flash[:alert] = "There was a problem logging in. If you have forgotten your login information, please call Surrey Services at 555-555-5555"
      redirect_to root_path
    end
  end

  def destroy
    session[:driver_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end
end
