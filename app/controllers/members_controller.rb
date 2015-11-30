class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create

  end

  private
    def member_params
      params.require(:member).permit()
    end

  end
