class DriverNotifier < ApplicationMailer
  default from: 'adwaxman@gmail.com'

  def send_ride_details(driver, ride)
    @driver = driver
    @ride = ride
    @member = ride.member
    mail(to: @driver.email,
         subject: "Details for ride on #{ride.pickup_date}")
  end
end
