json.array!(@admins) do |admin|
  json.extract! admin, :id, :fname, :lname, :username, :email, :password, :super_admin
  json.url admin_url(admin, format: :json)
end
