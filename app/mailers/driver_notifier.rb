class DriverNotifier < ApplicationMailer
  default from: 'adwaxman@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_ride_details(driver)
    @driver = user
    mail(to: @driver.email,
         subject: "Details for ride on #{Ride.last.pickup_date}")
  end
end
