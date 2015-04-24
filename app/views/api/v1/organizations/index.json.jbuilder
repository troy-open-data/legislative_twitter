json.array!(@organizations) do |organization|
  json.extract! organization, :id, :level, :name
  json.url api_organization_url(organization, format: :json)
end
