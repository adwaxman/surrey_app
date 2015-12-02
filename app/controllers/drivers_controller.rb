class DriversController < ApplicationController

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(Driver_params)
    if @driver.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @drivers = Driver.all
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    if @driver.update_attributes(Driver_params)
      redirect_to drivers_path
    else
      debugger
      render 'edit'
    end

  end

  def show

  end

end
