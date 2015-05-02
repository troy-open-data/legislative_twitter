json.array!(@people) do |person|
  json.extract! person, :id, :first, :last
  json.url api_v1_person_url(person, format: :json)
end
