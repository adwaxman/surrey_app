class Admin::MembersController < ApplicationController
  def index
  end

  def show

  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      @member.update(active: true)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(member_params)
      Origin.create(member_id: @member.id, address_line1: @member.address_line1, address_line2: @member.address_line2, city: @member.city, state: @member.state, zip: @member.zip, primary: true)
      redirect_to members_path
    else
      render 'edit'
    end
  end
  private

  def member_params
    params.require(:member).permit(:fname, :mi, :lname, :email, :password, :password_confirmation, :phone, :cell, :address_line1, :address_line2, :city, :state, :zip, :primaryEC_fname, :primaryEC_lname, :primaryEC_phone, :primaryEC_cell, :primaryEC_relationship, :secondaryEC_fname, :secondaryEC_lname, :secondaryEC_phone, :secondaryEC_cell, :secondaryEC_relationship, :tertiaryEC_fname, :tertiaryEC_lname, :tertiaryEC_phone, :tertiaryEC_cell, :tertiaryEC_relationship)
  end



end
