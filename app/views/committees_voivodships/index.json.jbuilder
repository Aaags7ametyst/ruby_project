json.array!(@committees_voivodships) do |committees_voivodship|
  json.extract! committees_voivodship, :id, :number_of_votes
  json.url committees_voivodship_url(committees_voivodship, format: :json)
end
