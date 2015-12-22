class StaffNotifier < ApplicationMailer
  default from: 'adwaxman@gmail.com'

  def new_ride_request(member, ride)
    @member = member
    @ride = ride
    mail(to: "adwaxman@gmail.com",
         subject: "New Ride Request for #{member.full_name}")
  end
end
