json.array!(@drivers) do |driver|
  json.extract! driver, :id, :fname, :lname, :email, :password, :area_code, :local_exchange, :phone_ending, :address_line1, :address_line2, :city, :state, :zip, :car_type, :monday, :monday_min, :monday_max, :tuesday, :tuesday_min, :tuesday_max, :wednesday, :wednesday_min, :wednesday_max, :thursday, :thursday_min, :thursday_max, :friday, :friday_min, :friday_max, :unavailable, :accommodate_wheelchair, :accommodate_aide, :preferred_contact
  json.url driver_url(driver, format: :json)
end
