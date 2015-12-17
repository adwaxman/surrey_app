class Admin::AdminsController < ApplicationController
  before_action :super_admin?
  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(admin_params)
      redirect_to admin_admin_path
    else
      render 'edit'
    end
  end

  def inactive
    @admin = Admin.find(params[:admin_id])
    if @admin.update(active: false)
      redirect_to admin_admin_path @admin
    else
      flash[:alert] = "There was a problem."
      redirect :back
    end
  end

  private

  def super_admin?
    unless current_admin && current_admin.super_admin
      flash[:notice] = "You must be logged in as an administrator"
      redirect_to root_path
    end
  end

  def admin_params
    params.require(:admin).permit(:fname, :lname, :username, :email, :password, :password_confirmation, :super_admin)
  end
end
