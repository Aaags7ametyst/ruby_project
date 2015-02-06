json.array!(@voivodships) do |voivodship|
  json.extract! voivodship, :id, :name, :places
  json.url voivodship_url(voivodship, format: :json)
end
