json.array!(@districts) do |district|
  json.extract! district, :id, :name, :eligible_voters, :valid_votes, :invalid_votes, :vote_cards
  json.url district_url(district, format: :json)
end
