json.array!(@origins) do |origin|
  json.extract! origin, :id, :client_id, :address_line1, :address_line2, :city, :state, :zip, :primary
  json.url origin_url(origin, format: :json)
end
