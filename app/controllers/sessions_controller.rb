class SessionsController < ApplicationController

  def new
    if session[:member_id]
      redirect_to new_ride_path
    end
  end

  def create
    @member = Member.find_by(email: params[:email])
    if @member && @member.authenticate(params[:password])
      session[:admin_id] = nil
      session[:driver_id] = nil
      session[:member_id] = @member.id
      flash[:notice] = "You have successfully logged in."
      redirect_to new_ride_path
      else
      flash[:alert] = "There was a problem logging in. If you have forgotten your login information, please call Surrey Services at 555-555-5555"
      redirect_to login_path
    end
  end

  def destroy
    session[:member_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end



end
