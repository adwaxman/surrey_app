json.array!(@destinations) do |destination|
  json.extract! destination, :id, :client_id, :name, :address_line1, :address_line2, :city, :state, :zip, :destination_type
  json.url destination_url(destination, format: :json)
end
