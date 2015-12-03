class AdminsController < ApplicationController

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if params[:admin][:super_admin] == "1" && params[:super_admin_password] != "password"
      flash[:alert] = "Invalid superadmin password"
      render :new
    elsif
      @admin.save
      session[:admin_id] = @admin.id
      flash[:notice] = "Admin created successfully as " + Admin.find(session[:admin_id]).username
      redirect_to drivers_path
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

end
