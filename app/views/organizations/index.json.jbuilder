json.array!(@organizations) do |organization|
  json.extract! organization, :id, :level, :name
  json.url organization_url(organization, format: :json)
end
