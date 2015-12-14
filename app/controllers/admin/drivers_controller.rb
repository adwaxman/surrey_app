class Admin::DriversController < ApplicationController
  def new
    @driver = Driver.new
  end
  def create
    @driver = Driver.new(driver_params)
    @driver.county_preference = params[:driver][:county_preference]
    if @driver.save
      Matcher.create(driver_id: @driver.id)
      redirect_to root_path
    else
      render 'new'
    end
  end
  def edit
    @driver = Driver.find(params[:id])
  end
  def update

  end
end
