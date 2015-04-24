json.array!(@people) do |person|
  json.extract! person, :id, :first, :last, :bio
  json.url api_person_url(person, format: :json)
end
