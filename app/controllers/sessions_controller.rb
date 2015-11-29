class SessionsController < ApplicationController

  def new
    if session[:member_id]
      redirect_to new_ride_path
    end
  end

  def create
    @member = Member.find_by(email: params[:email])
    if @member && @member.password == params[:password]
      session[:member_id] = @member.id
      flash[:notice] = "You have successfully logged in."
      redirect_to new_ride_path
      else
      flash[:alert] = "There was a problem logging in. If you have forgotten your login information, please call Surrey Services at 610-647-6404"
      redirect_to login_path
    end
  end

  def destroy
    session[:member_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to login_path
  end



end
