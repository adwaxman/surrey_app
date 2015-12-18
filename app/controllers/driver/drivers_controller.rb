class Driver::DriversController < ApplicationController
  def show

    @driver = Driver.find(params[:id])
    # Show time in readable format
    @monday_min = Time.parse(@driver.monday_min.to_s).strftime("%l:%M %p")
    @monday_max = Time.parse(@driver.monday_max.to_s).strftime("%l:%M %p")

    @tuesday_min = Time.parse(@driver.monday_min.to_s).strftime("%l:%M %p")
    @tuesday_max = Time.parse(@driver.monday_max.to_s).strftime("%l:%M %p")

    @wednesday_min = Time.parse(@driver.monday_min.to_s).strftime("%l:%M %p")
    @wednesday_max = Time.parse(@driver.monday_max.to_s).strftime("%l:%M %p")

    @thursday_min = Time.parse(@driver.monday_min.to_s).strftime("%l:%M %p")
    @thursday_max = Time.parse(@driver.monday_max.to_s).strftime("%l:%M %p")

    @friday_min = Time.parse(@driver.monday_min.to_s).strftime("%l:%M %p")
    @friday_max = Time.parse(@driver.monday_max.to_s).strftime("%l:%M %p")

  end
end
