json.array!(@users) do |user|
  json.extract! user, :id, :login, :email, :crypted_password, :name, :surname, :role, :persistence_token
  json.url user_url(user, format: :json)
end
