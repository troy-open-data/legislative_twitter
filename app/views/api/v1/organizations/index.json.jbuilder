json.array!(@organizations) do |organization|
  json.extract! organization, :id, :level, :name
  json.url api_v1_organization_url(organization, format: :json)
end
