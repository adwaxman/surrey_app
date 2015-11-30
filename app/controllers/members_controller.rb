class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to root_path
    else
      debugger
      render 'new'
    end
  end

  private
    def member_params
      params.require(:member).permit(:fname, :lname, :email, :password, :password_confirmation, :area_code, :local_exchange, :phone_ending, :address_line1, :address_line2, :city, :state, :zip, :primaryEC_fname, :primaryEC_lname, :primaryEC_area_code, :primaryEC_local_exchange, :primaryEC_phone_ending, :primaryEC_relationship, :secondaryEC_fname, :secondaryEC_lname, :secondaryEC_area_code, :secondaryEC_local_exchange, :secondaryEC_phone_ending, :secondaryEC_relationship, :tertiaryEC_fname, :tertiaryEC_lname, :tertiaryEC_area_code, :tertiaryEC_local_exchange, :tertiaryEC_phone_ending, :tertiaryEC_relationship)
    end
end
