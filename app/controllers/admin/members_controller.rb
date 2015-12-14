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
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(member_params)
      redirect_to members_path
    else
      render 'edit'
    end
  end
end
