class DriverNotifier < ApplicationMailer
  default from: 'adwaxman@gmail.com'

  def send_ride_details(driver, ride)
    @driver = driver
    @ride = ride
    @member = ride.member
    @pickup_date = Date.parse(@ride.pickup_date.to_s).strftime('%a %b %d, %Y')
    @pickup_time = Time.parse(@ride.pickup_time.to_s).strftime('%l:%M %p')
    @origin = ride.origin
    @destination = ride.destination

    @considerations = []
    if @ride.wheelchair
      @considerations.push("Member will have a wheelchair.")
    end
    if @ride.aide
      @considerations.push("Member will have an aide accompanying them.")
    end
    if @ride.pet
      @considerations.push("Member will have a pet/service animal.")
    end
    if @ride.vision_impaired
      @considerations.push("Member has imparied vision.")
    end
    if @ride.hearing_impaired
      @considerations.push("Member has imparied hearing.")
    end

    if @considerations.length == 0
      @special_considerations = "None"
    else
      @special_considerations = ""
      @considerations.each do |consideration|
        @special_considerations += consideration + "  "
      end
    end

    mail(to: @driver.email,
         subject: "Thanks for the ride! Details for the ride on #{@pickup_date}")
  end
end
