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

def get_dest_options
    counter = 1
    paramArray = []
    current_member.destinations.each do |x|
        paramArray.push([x.name, counter])
        counter += 1
    end
    return paramArray
end


end
