class MembersController < ApplicationController
  before_action :member?, only: [:edit]
  before_action :admin?, only: [:index]
  before_action :correct_user, only: [:show]

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
      if @member.save
      Origin.create(member_id: @member.id, address_line1: @member.address_line1, address_line2: @member.address_line2, city: @member.city, state: @member.state, zip: @member.zip, primary: true)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @members = Member.all
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(member_params)
      @member.update(confirmed: true)
      Origin.create(member_id: @member.id, address_line1: @member.address_line1, address_line2: @member.address_line2, city: @member.city, state: @member.state, zip: @member.zip, primary: true)
      redirect_to new_ride_path
    else
      render 'edit'
    end
  end

  def show
    @member = Member.find(params[:id])
  end

  private

  def member_params
    params.require(:member).permit(:fname, :mi, :lname, :email, :password, :password_confirmation, :phone, :cell, :address_line1, :address_line2, :city, :state, :zip, :primaryEC_fname, :primaryEC_lname, :primaryEC_phone, :primaryEC_cell, :primaryEC_relationship, :secondaryEC_fname, :secondaryEC_lname, :secondaryEC_phone, :secondaryEC_cell, :secondaryEC_relationship, :tertiaryEC_fname, :tertiaryEC_lname, :tertiaryEC_phone, :tertiaryEC_cell, :tertiaryEC_relationship)
  end

  def member?
    unless current_member || current_admin
      flash[:notice] = 'You must be logged in as a driver or administrator'
      redirect_to root_path
    end
  end

  def admin?
    unless current_admin
      flash[:notice] = 'You must be logged in'
      redirect_to root_path
    end
  end

  def correct_user
    @member = Member.find(params[:id])
    redirect_to(root_url) unless @member == current_member || current_admin
  end

end
