class AdminsController < ApplicationController
before_action :super_admin?
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    @admin.active = true
    if params[:admin][:super_admin] == "1" && params[:super_admin_password] != "password"
      flash[:alert] = "Invalid superadmin password"
      render :new
    elsif
      @admin.save
      flash[:notice] = "Admin created successfully as " + Admin.find(session[:admin_id]).username
      redirect_to root_path
    else
      flash[:alert] = "There was a problem."
      render :new
    end
  end

  def destroy

  end

  private

    def admin_params
      params.require(:admin).permit(:fname, :lname, :username, :email, :password, :password_confirmation, :super_admin)
    end

    def super_admin?
      unless current_admin && current_admin.super_admin
        flash[:notice] = "You must be logged in as an administrator"
        redirect_to root_path
      end
    end

end
