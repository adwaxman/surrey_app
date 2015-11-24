json.array!(@rides) do |ride|
  json.extract! ride, :id, :client_id, :driver_id, :origin_id, :destination_id, :wheelchair, :aide, :vision_impaired, :hearing_impaired, :recurring, :status, :completion_notes, :requested_driver, :request_checked
  json.url ride_url(ride, format: :json)
end
