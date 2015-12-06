class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def current_member
  if session[:member_id]
    Member.find(session[:member_id])
  else
    nil
  end
end

def rides_today
  @rides = Ride.all.where.not(driver_id: nil)
  @rides_today = []
  @rides.each do |ride|
    if Date.parse(ride.pickup_date) == Date.today
      @rides_today.push(ride)
    end
  end
  return @rides_today
end

end
