json.array!(@committees_districts) do |committees_district|
  json.extract! committees_district, :id, :votes
  json.url committees_district_url(committees_district, format: :json)
end
